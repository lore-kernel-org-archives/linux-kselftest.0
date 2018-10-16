From: brendanhiggins@google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:03 -0700
Subject: [RFC v1 14/31] kunit: mock: added internal mock infrastructure
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-15-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181016235103.poduEywnF-JnruEuqbMKmcDQo8uPCPWy3_7P7gpfx2g@z>

Adds the core internal mechanisms that mocks are implemented with; in
particular, this adds the mechanisms by which expectation on mocks are
validated and by which actions may be supplied and then executed when
mocks are called.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 include/kunit/mock.h | 125 +++++++++++++++
 kunit/Makefile       |   5 +-
 kunit/mock.c         | 359 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 487 insertions(+), 2 deletions(-)
 create mode 100644 include/kunit/mock.h
 create mode 100644 kunit/mock.c

diff --git a/include/kunit/mock.h b/include/kunit/mock.h
new file mode 100644
index 0000000000000..1a35c5702cb15
--- /dev/null
+++ b/include/kunit/mock.h
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Mocking API for KUnit.
+ *
+ * Copyright (C) 2018, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins at google.com>
+ */
+
+#ifndef _KUNIT_MOCK_H
+#define _KUNIT_MOCK_H
+
+#include <linux/types.h>
+#include <linux/tracepoint.h> /* For PARAMS(...) */
+#include <kunit/test.h>
+#include <kunit/test-stream.h>
+#include <kunit/params.h>
+
+/**
+ * struct mock_param_matcher - represents a matcher used in a *call expectation*
+ * @match: the function that performs the matching
+ *
+ * The matching function takes a couple of parameters:
+ *
+ * - ``this``: refers to the parent struct
+ * - ``stream``: a &test_stream to which a detailed message should be added as
+ *   to why the parameter matches or not
+ * - ``param``: a pointer to the parameter to check for a match
+ *
+ * The matching function should return whether or not the passed parameter
+ * matches.
+ */
+struct mock_param_matcher {
+	bool (*match)(struct mock_param_matcher *this,
+		      struct test_stream *stream,
+		      const void *param);
+};
+
+#define MOCK_MAX_PARAMS 255
+
+struct mock_matcher {
+	struct mock_param_matcher *matchers[MOCK_MAX_PARAMS];
+	int num;
+};
+
+/**
+ * struct mock_action - Represents an action that a mock performs when
+ *                      expectation is matched
+ * @do_action: the action to perform
+ *
+ * The action function is given some parameters:
+ *
+ * - ``this``: refers to the parent struct
+ * - ``params``: an array of pointers to the params passed into the mocked
+ *   method or function. **The class argument is excluded for a mocked class
+ *   method.**
+ * - ``len``: size of ``params``
+ *
+ * The action function returns a pointer to the value that the mocked method
+ * or function should be returning.
+ */
+struct mock_action {
+	void *(*do_action)(struct mock_action *this,
+			   const void **params,
+			   int len);
+};
+
+/**
+ * struct mock_expectation - represents a *call expectation* on a function.
+ * @action: A &struct mock_action to perform when the function is called.
+ * @max_calls_expected: maximum number of times an expectation may be called.
+ * @min_calls_expected: minimum number of times an expectation may be called.
+ * @retire_on_saturation: no longer match once ``max_calls_expected`` is
+ *			  reached.
+ *
+ * Represents a *call expectation* on a function created with EXPECT_CALL().
+ */
+struct mock_expectation {
+	struct mock_action *action;
+	int max_calls_expected;
+	int min_calls_expected;
+	bool retire_on_saturation;
+	/* private: internal use only. */
+	const char *expectation_name;
+	struct list_head node;
+	struct mock_matcher *matcher;
+	int times_called;
+};
+
+struct mock_method {
+	struct list_head node;
+	const char *method_name;
+	const void *method_ptr;
+	struct mock_action *default_action;
+	struct list_head expectations;
+};
+
+struct mock {
+	struct test_post_condition parent;
+	struct test *test;
+	struct list_head methods;
+	/* TODO(brendanhiggins at google.com): add locking to do_expect. */
+	const void *(*do_expect)(struct mock *mock,
+				 const char *method_name,
+				 const void *method_ptr,
+				 const char * const *param_types,
+				 const void **params,
+				 int len);
+};
+
+void mock_init_ctrl(struct test *test, struct mock *mock);
+
+void mock_validate_expectations(struct mock *mock);
+
+int mock_set_default_action(struct mock *mock,
+			    const char *method_name,
+			    const void *method_ptr,
+			    struct mock_action *action);
+
+struct mock_expectation *mock_add_matcher(struct mock *mock,
+					  const char *method_name,
+					  const void *method_ptr,
+					  struct mock_param_matcher *matchers[],
+					  int len);
+
+#endif /* _KUNIT_MOCK_H */
diff --git a/kunit/Makefile b/kunit/Makefile
index f72a02cb9f23d..ad58110de695c 100644
--- a/kunit/Makefile
+++ b/kunit/Makefile
@@ -1,3 +1,4 @@
-obj-$(CONFIG_KUNIT)		+= test.o string-stream.o test-stream.o
-obj-$(CONFIG_KUNIT_TEST)		+= test-test.o mock-macro-test.o string-stream-test.o
+obj-$(CONFIG_KUNIT)		+= test.o mock.o string-stream.o test-stream.o
+obj-$(CONFIG_KUNIT_TEST)		+= \
+  test-test.o mock-macro-test.o string-stream-test.o
 obj-$(CONFIG_EXAMPLE_TEST)	+= example-test.o
diff --git a/kunit/mock.c b/kunit/mock.c
new file mode 100644
index 0000000000000..424c612de553b
--- /dev/null
+++ b/kunit/mock.c
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mocking API for KUnit.
+ *
+ * Copyright (C) 2018, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins at google.com>
+ */
+
+#include <kunit/mock.h>
+
+static bool mock_match_params(struct mock_matcher *matcher,
+		       struct test_stream *stream,
+		       const void **params,
+		       int len)
+{
+	struct mock_param_matcher *param_matcher;
+	bool ret = true, tmp;
+	int i;
+
+	BUG_ON(matcher->num != len);
+
+	for (i = 0; i < matcher->num; i++) {
+		param_matcher = matcher->matchers[i];
+		stream->add(stream, "\t");
+		tmp = param_matcher->match(param_matcher, stream, params[i]);
+		ret = ret && tmp;
+		stream->add(stream, "\n");
+	}
+
+	return ret;
+}
+
+static const void *mock_do_expect(struct mock *mock,
+				  const char *method_name,
+				  const void *method_ptr,
+				  const char * const *type_names,
+				  const void **params,
+				  int len);
+
+void mock_validate_expectations(struct mock *mock)
+{
+	struct mock_expectation *expectation, *expectation_safe;
+	struct mock_method *method;
+	struct test_stream *stream;
+	int times_called;
+
+	stream = test_new_stream(mock->test);
+	list_for_each_entry(method, &mock->methods, node) {
+		list_for_each_entry_safe(expectation, expectation_safe,
+					 &method->expectations, node) {
+			times_called = expectation->times_called;
+			if (!(expectation->min_calls_expected <= times_called &&
+			      times_called <= expectation->max_calls_expected)
+			    ) {
+				stream->add(stream,
+					    "Expectation was not called the specified number of times:\n\t");
+				stream->add(stream,
+					    "Function: %s, min calls: %d, max calls: %d, actual calls: %d",
+					    method->method_name,
+					    expectation->min_calls_expected,
+					    expectation->max_calls_expected,
+					    times_called);
+				mock->test->fail(mock->test, stream);
+			}
+			list_del(&expectation->node);
+		}
+	}
+}
+
+static void mock_validate_wrapper(struct test_post_condition *condition)
+{
+	struct mock *mock = container_of(condition, struct mock, parent);
+
+	mock_validate_expectations(mock);
+}
+
+void mock_init_ctrl(struct test *test, struct mock *mock)
+{
+	mock->test = test;
+	INIT_LIST_HEAD(&mock->methods);
+	mock->do_expect = mock_do_expect;
+	mock->parent.validate = mock_validate_wrapper;
+	list_add_tail(&mock->parent.node, &test->post_conditions);
+}
+
+static struct mock_method *mock_lookup_method(struct mock *mock,
+					      const void *method_ptr)
+{
+	struct mock_method *ret;
+
+	list_for_each_entry(ret, &mock->methods, node) {
+		if (ret->method_ptr == method_ptr)
+			return ret;
+	}
+
+	return NULL;
+}
+
+static struct mock_method *mock_add_method(struct mock *mock,
+					   const char *method_name,
+					   const void *method_ptr)
+{
+	struct mock_method *method;
+
+	method = test_kzalloc(mock->test, sizeof(*method), GFP_KERNEL);
+	if (!method)
+		return NULL;
+
+	INIT_LIST_HEAD(&method->expectations);
+	method->method_name = method_name;
+	method->method_ptr = method_ptr;
+	list_add_tail(&method->node, &mock->methods);
+
+	return method;
+}
+
+static int mock_add_expectation(struct mock *mock,
+				const char *method_name,
+				const void *method_ptr,
+				struct mock_expectation *expectation)
+{
+	struct mock_method *method;
+
+	method = mock_lookup_method(mock, method_ptr);
+	if (!method) {
+		method = mock_add_method(mock, method_name, method_ptr);
+		if (!method)
+			return -ENOMEM;
+	}
+
+	list_add_tail(&expectation->node, &method->expectations);
+
+	return 0;
+}
+
+struct mock_expectation *mock_add_matcher(struct mock *mock,
+					  const char *method_name,
+					  const void *method_ptr,
+					  struct mock_param_matcher *matchers[],
+					  int len)
+{
+	struct mock_expectation *expectation;
+	struct mock_matcher *matcher;
+	int ret;
+
+	expectation = test_kzalloc(mock->test,
+				   sizeof(*expectation),
+				   GFP_KERNEL);
+	if (!expectation)
+		return NULL;
+
+	matcher = test_kmalloc(mock->test, sizeof(*matcher), GFP_KERNEL);
+	if (!matcher)
+		return NULL;
+
+	memcpy(&matcher->matchers, matchers, sizeof(*matchers) * len);
+	matcher->num = len;
+
+	expectation->matcher = matcher;
+	expectation->max_calls_expected = 1;
+	expectation->min_calls_expected = 1;
+
+	ret = mock_add_expectation(mock, method_name, method_ptr, expectation);
+	if (ret < 0)
+		return NULL;
+
+	return expectation;
+}
+
+int mock_set_default_action(struct mock *mock,
+			    const char *method_name,
+			    const void *method_ptr,
+			    struct mock_action *action)
+{
+	struct mock_method *method;
+
+	method = mock_lookup_method(mock, method_ptr);
+	if (!method) {
+		method = mock_add_method(mock, method_name, method_ptr);
+		if (!method)
+			return -ENOMEM;
+	}
+
+	method->default_action = action;
+
+	return 0;
+}
+
+static void mock_format_param(struct test_stream *stream,
+			      const char *type_name,
+			      const void *param)
+{
+	/*
+	 * Cannot find formatter, so just print the pointer of the
+	 * symbol.
+	 */
+	stream->add(stream, "<%pS>", param);
+}
+
+static void mock_add_method_declaration_to_stream(
+		struct test_stream *stream,
+		const char *function_name,
+		const char * const *type_names,
+		const void **params,
+		int len)
+{
+	int i;
+
+	stream->add(stream, "%s(", function_name);
+	for (i = 0; i < len; i++) {
+		mock_format_param(stream, type_names[i], params[i]);
+		if (i < len - 1)
+			stream->add(stream, ", ");
+	}
+	stream->add(stream, ")\n");
+}
+
+static struct test_stream *mock_initialize_failure_message(
+		struct test *test,
+		const char *function_name,
+		const char * const *type_names,
+		const void **params,
+		int len)
+{
+	struct test_stream *stream;
+
+	stream = test_new_stream(test);
+	if (!stream)
+		return NULL;
+
+	stream->add(stream, "EXPECTATION FAILED: no expectation for call: ");
+	mock_add_method_declaration_to_stream(stream,
+					      function_name,
+					      type_names,
+					      params,
+					      len);
+	return stream;
+}
+
+static bool mock_is_expectation_retired(struct mock_expectation *expectation)
+{
+	return expectation->retire_on_saturation &&
+			expectation->times_called ==
+			expectation->max_calls_expected;
+}
+
+static void mock_add_method_expectation_error(struct test *test,
+					      struct test_stream *stream,
+					      char *message,
+					      struct mock *mock,
+					      struct mock_method *method,
+					      const char * const *type_names,
+					      const void **params,
+					      int len)
+{
+	stream->clear(stream);
+	stream->set_level(stream, KERN_WARNING);
+	stream->add(stream, message);
+	mock_add_method_declaration_to_stream(stream,
+		method->method_name, type_names, params, len);
+}
+
+static struct mock_expectation *mock_apply_expectations(
+		struct mock *mock,
+		struct mock_method *method,
+		const char * const *type_names,
+		const void **params,
+		int len)
+{
+	struct test *test = mock->test;
+	struct mock_expectation *ret;
+	struct test_stream *attempted_matching_stream;
+	bool expectations_all_saturated = true;
+
+	struct test_stream *stream = test_new_stream(test);
+
+	if (list_empty(&method->expectations)) {
+		mock_add_method_expectation_error(test, stream,
+			"Method was called with no expectations declared: ",
+			mock, method, type_names, params, len);
+		stream->commit(stream);
+		return NULL;
+	}
+
+	attempted_matching_stream = mock_initialize_failure_message(
+			test,
+			method->method_name,
+			type_names,
+			params,
+			len);
+
+	list_for_each_entry(ret, &method->expectations, node) {
+		if (mock_is_expectation_retired(ret))
+			continue;
+		expectations_all_saturated = false;
+
+		attempted_matching_stream->add(attempted_matching_stream,
+			"Tried expectation: %s, but\n", ret->expectation_name);
+		if (mock_match_params(ret->matcher,
+			attempted_matching_stream, params, len)) {
+			/*
+			 * Matcher was found; we won't print, so clean up the
+			 * log.
+			 */
+			attempted_matching_stream->clear(
+					attempted_matching_stream);
+			return ret;
+		}
+	}
+
+	if (expectations_all_saturated) {
+		mock_add_method_expectation_error(test, stream,
+			"Method was called with fully saturated expectations: ",
+			mock, method, type_names, params, len);
+	} else {
+		mock_add_method_expectation_error(test, stream,
+			"Method called that did not match any expectations: ",
+			mock, method, type_names, params, len);
+		stream->append(stream, attempted_matching_stream);
+	}
+	test->fail(test, stream);
+	attempted_matching_stream->clear(attempted_matching_stream);
+	return NULL;
+}
+
+static const void *mock_do_expect(struct mock *mock,
+				  const char *method_name,
+				  const void *method_ptr,
+				  const char * const *param_types,
+				  const void **params,
+				  int len)
+{
+	struct mock_expectation *expectation;
+	struct mock_method *method;
+	struct mock_action *action;
+
+	method = mock_lookup_method(mock, method_ptr);
+	if (!method)
+		return NULL;
+
+	expectation = mock_apply_expectations(mock,
+					      method,
+					      param_types,
+					      params,
+					      len);
+	if (!expectation) {
+		action = method->default_action;
+	} else {
+		expectation->times_called++;
+		if (expectation->action)
+			action = expectation->action;
+		else
+			action = method->default_action;
+	}
+	if (!action)
+		return NULL;
+
+	return action->do_action(action, params, len);
+}
-- 
2.19.1.331.ge82ca0e54c-goog
