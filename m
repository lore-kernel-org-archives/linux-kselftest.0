From: brendanhiggins@google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:06 -0700
Subject: [RFC v1 17/31] kunit: mock: added struct param matcher
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-18-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181016235106.gZc2quJTbQLKHGVtXhzs6UAzYeXd9_5ToSBn2T2lOJs@z>

Added parameter matcher builder for matching struct values.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 include/kunit/mock.h     |  56 +++++++++++++++
 kunit/Makefile           |   5 +-
 kunit/common-mocks.c     | 116 ++++++++++++++++++++++++++++++
 kunit/mock-test.c        |  43 +++++++++++
 kunit/test-stream-test.c | 150 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 368 insertions(+), 2 deletions(-)
 create mode 100644 kunit/test-stream-test.c

diff --git a/include/kunit/mock.h b/include/kunit/mock.h
index 1b7485e2cedb8..daf965cf954e6 100644
--- a/include/kunit/mock.h
+++ b/include/kunit/mock.h
@@ -760,6 +760,14 @@ struct mock_param_matcher *test_memeq(struct test *test,
 				      size_t size);
 struct mock_param_matcher *test_streq(struct test *test, const char *str);
 
+struct mock_param_matcher *test_str_contains(struct test *test,
+					     const char *needle);
+
+/* Matches var-arg arguments. */
+struct mock_param_matcher *test_va_format_cmp(struct test *test,
+					 struct mock_param_matcher *fmt_matcher,
+					 struct mock_param_matcher *va_matcher);
+
 struct mock_action *test_u8_return(struct test *test, u8 ret);
 struct mock_action *test_u16_return(struct test *test, u16 ret);
 struct mock_action *test_u32_return(struct test *test, u32 ret);
@@ -778,4 +786,52 @@ struct mock_action *test_ulonglong_return(struct test *test,
 					  unsigned long long ret);
 struct mock_action *test_ptr_return(struct test *test, void *ret);
 
+/**
+ * struct mock_struct_matcher_entry - composed with other &struct
+ *                                    mock_struct_matcher_entry to make a
+ *                                    &struct struct_matcher
+ * @member_offset: offset of this member
+ * @matcher: matcher for this particular member
+ *
+ * This is used for struct_cmp() matchers.
+ */
+struct mock_struct_matcher_entry {
+	size_t member_offset;
+	struct mock_param_matcher *matcher;
+};
+
+static inline void init_mock_struct_matcher_entry_internal(
+		struct mock_struct_matcher_entry *entry,
+		size_t offset,
+		struct mock_param_matcher *matcher)
+{
+	entry->member_offset = offset;
+	entry->matcher = matcher;
+}
+
+/**
+ * INIT_MOCK_STRUCT_MATCHER_ENTRY()
+ * @entry: the &struct mock_struct_matcher_entry to initialize
+ * @type: the struct being matched
+ * @member: the member of the struct being matched, used to calculate the offset
+ * @matcher: matcher to match that member
+ *
+ * Initializes ``entry`` to match ``type->member`` with ``matcher``.
+ */
+#define INIT_MOCK_STRUCT_MATCHER_ENTRY(entry, type, member, matcher)	       \
+		init_mock_struct_matcher_entry_internal(entry,		       \
+							offsetof(type, member),\
+							matcher)
+
+static inline void INIT_MOCK_STRUCT_MATCHER_ENTRY_LAST(
+		struct mock_struct_matcher_entry *entry)
+{
+	entry->matcher = NULL;
+}
+
+struct mock_param_matcher *test_struct_cmp(
+		struct test *test,
+		const char *struct_name,
+		struct mock_struct_matcher_entry *entries);
+
 #endif /* _KUNIT_MOCK_H */
diff --git a/kunit/Makefile b/kunit/Makefile
index 6fccfcdbc6f84..e05fbcae8bfb0 100644
--- a/kunit/Makefile
+++ b/kunit/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_KUNIT)		+= test.o mock.o common-mocks.o string-stream.o \
   test-stream.o
-obj-$(CONFIG_KUNIT_TEST)		+= \
-  test-test.o test-mock.o mock-macro-test.o mock-test.o string-stream-test.o
+obj-$(CONFIG_KUNIT_TEST)	+= \
+  test-test.o test-mock.o mock-macro-test.o mock-test.o string-stream-test.o \
+  test-stream-test.o
 obj-$(CONFIG_EXAMPLE_TEST)	+= example-test.o
diff --git a/kunit/common-mocks.c b/kunit/common-mocks.c
index ecac9c1c29c0e..ef88f8b8acda3 100644
--- a/kunit/common-mocks.c
+++ b/kunit/common-mocks.c
@@ -207,6 +207,122 @@ struct mock_param_matcher *test_streq(struct test *test, const char *str)
 	return &matcher->matcher;
 }
 
+struct mock_str_contains_matcher {
+	struct mock_param_matcher matcher;
+	const char *needle;
+};
+
+static bool match_str_contains(struct mock_param_matcher *pmatcher,
+			       struct test_stream *stream,
+			       const void *phaystack)
+{
+	struct mock_str_contains_matcher *matcher =
+		container_of(pmatcher,
+			     struct mock_str_contains_matcher,
+			     matcher);
+	const char *haystack = CONVERT_TO_ACTUAL_TYPE(const char *, phaystack);
+	bool matches = strstr(haystack, matcher->needle);
+
+	if (matches)
+		stream->add(stream,
+			    "'%s' found in '%s'",
+			    matcher->needle,
+			    haystack);
+	else
+		stream->add(stream,
+			    "'%s' not found in '%s'",
+			    matcher->needle,
+			    haystack);
+	return matches;
+}
+
+struct mock_param_matcher *test_str_contains(struct test *test, const char *str)
+{
+	struct mock_str_contains_matcher *matcher;
+
+	matcher = test_kzalloc(test, sizeof(*matcher), GFP_KERNEL);
+	if (!matcher)
+		return NULL;
+
+	matcher->matcher.match = match_str_contains;
+	matcher->needle = str;
+
+	return &matcher->matcher;
+}
+
+struct mock_param_matcher *test_va_format_cmp(
+		struct test *test,
+		struct mock_param_matcher *fmt_matcher,
+		struct mock_param_matcher *va_matcher)
+{
+	struct mock_struct_matcher_entry *entries;
+
+	entries = test_kzalloc(test, sizeof(*entries) * 3, GFP_KERNEL);
+	if (!entries)
+		return NULL;
+
+	INIT_MOCK_STRUCT_MATCHER_ENTRY(&entries[0],
+				       struct va_format,
+				       fmt,
+				       fmt_matcher);
+	INIT_MOCK_STRUCT_MATCHER_ENTRY(&entries[1],
+				       struct va_format,
+				       va,
+				       va_matcher);
+	INIT_MOCK_STRUCT_MATCHER_ENTRY_LAST(&entries[2]);
+
+	return test_struct_cmp(test, "va_format", entries);
+}
+
+struct mock_struct_matcher {
+	struct mock_param_matcher matcher;
+	const char *struct_name;
+	struct mock_struct_matcher_entry *entries;
+};
+
+static bool match_struct(struct mock_param_matcher *pmatcher,
+			 struct test_stream *stream,
+			 const void *pactual)
+{
+	struct mock_struct_matcher *matcher =
+			container_of(pmatcher,
+				     struct mock_struct_matcher,
+				     matcher);
+	struct mock_struct_matcher_entry *entry;
+	const char *actual = CONVERT_TO_ACTUAL_TYPE(const char *, pactual);
+	const char *member_ptr;
+	bool matches = true, tmp;
+
+	stream->add(stream, "struct %s {", matcher->struct_name);
+	for (entry = matcher->entries; entry->matcher; entry++) {
+		member_ptr = actual + entry->member_offset;
+		tmp = entry->matcher->match(entry->matcher, stream, member_ptr);
+		matches = matches && tmp;
+		stream->add(stream, ", ");
+	}
+	stream->add(stream, "}");
+
+	return matches;
+}
+
+struct mock_param_matcher *test_struct_cmp(
+		struct test *test,
+		const char *struct_name,
+		struct mock_struct_matcher_entry *entries)
+{
+	struct mock_struct_matcher *matcher;
+
+	matcher = test_kzalloc(test, sizeof(*matcher), GFP_KERNEL);
+	if (!matcher)
+		return NULL;
+
+	matcher->matcher.match = match_struct;
+	matcher->struct_name = struct_name;
+	matcher->entries = entries;
+
+	return &matcher->matcher;
+}
+
 #define DEFINE_RETURN_ACTION_STRUCT(type_name, type)			       \
 		struct mock_##type_name##_action {			       \
 			struct mock_action action;			       \
diff --git a/kunit/mock-test.c b/kunit/mock-test.c
index 523ddee8f24e2..77b16ad754424 100644
--- a/kunit/mock-test.c
+++ b/kunit/mock-test.c
@@ -187,6 +187,48 @@ static void mock_test_do_expect_default_return(struct test *test)
 	TEST_EXPECT_EQ(test, 0, expectation->times_called);
 }
 
+/*
+ * Method called on naggy mock with no expectations will not fail, but will show
+ * a warning message
+ */
+static void mock_test_naggy_no_expectations_no_fail(struct test *test)
+{
+	struct mock_test_context *ctx = test->priv;
+	struct MOCK(test) *mock_test = ctx->mock_test;
+	struct test *trgt = mock_get_trgt(mock_test);
+	struct mock *mock = ctx->mock;
+	int param0 = 5, param1 = -5;
+	static const char * const two_param_types[] = {"int", "int"};
+	const void *two_params[] = {&param0, &param1};
+	struct mock_expectation *expectation;
+
+	mock_set_default_action(mock,
+				"test_printk",
+				test_printk,
+				test_int_return(trgt, -4));
+
+	expectation = TEST_EXPECT_CALL(fail(mock_get_ctrl(mock_test),
+					    test_any(test)));
+	expectation->min_calls_expected = 0;
+	expectation->max_calls_expected = 0;
+
+	TEST_EXPECT_CALL(mock_vprintk(
+			mock_get_ctrl(mock_test),
+			test_any(test),
+			test_va_format_cmp(test,
+					   test_str_contains(test,
+							     "Method was called with no expectations declared"),
+					   test_any(test))));
+
+	mock->do_expect(mock,
+			"test_printk",
+			test_printk,
+			two_param_types,
+			two_params,
+			ARRAY_SIZE(two_params));
+	mock_validate_expectations(mock);
+}
+
 static void mock_test_mock_validate_expectations(struct test *test)
 {
 	struct mock_test_context *ctx = test->priv;
@@ -264,6 +306,7 @@ static struct test_case mock_test_cases[] = {
 	TEST_CASE(mock_test_failed_expect_call_fails_test),
 	TEST_CASE(mock_test_do_expect_default_return),
 	TEST_CASE(mock_test_mock_validate_expectations),
+	TEST_CASE(mock_test_naggy_no_expectations_no_fail),
 	{},
 };
 
diff --git a/kunit/test-stream-test.c b/kunit/test-stream-test.c
new file mode 100644
index 0000000000000..875b0db15878d
--- /dev/null
+++ b/kunit/test-stream-test.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test for struct test_stream.
+ *
+ * Copyright (C) 2018, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins at google.com>
+ */
+
+#include <kunit/test.h>
+#include <kunit/mock.h>
+#include <kunit/test-stream.h>
+
+#include "test-mock.h"
+
+struct test_stream_test_context {
+	struct MOCK(test)	*mock_test;
+	struct test_stream	*stream;
+};
+
+static void test_stream_test_add(struct test *test)
+{
+	struct test_stream_test_context *ctx = test->priv;
+	struct MOCK(test) *mock_test = ctx->mock_test;
+	struct test_stream *stream = ctx->stream;
+
+	stream->add(stream, "Foo");
+	stream->add(stream, " %s", "bar");
+	stream->set_level(stream, KERN_INFO);
+
+	TEST_EXPECT_CALL(mock_vprintk(
+			mock_get_ctrl(mock_test),
+			test_any(test),
+			test_va_format_cmp(test,
+					   test_streq(test, "Foo bar"),
+					   test_any(test))));
+
+	stream->commit(stream);
+}
+
+static void test_stream_test_append(struct test *test)
+{
+	struct test_stream_test_context *ctx = test->priv;
+	struct MOCK(test) *mock_test = ctx->mock_test;
+	struct test_stream *stream = ctx->stream;
+	struct test_stream *other_stream;
+
+	stream->add(stream, "Foo");
+	stream->set_level(stream, KERN_INFO);
+	other_stream = test_new_stream(mock_get_trgt(mock_test));
+	other_stream->add(other_stream, " %s", "bar");
+
+	stream->append(stream, other_stream);
+	TEST_EXPECT_CALL(mock_vprintk(
+			mock_get_ctrl(mock_test),
+			test_any(test),
+			test_va_format_cmp(test,
+					   test_streq(test, "Foo bar"),
+					   test_any(test))));
+
+	stream->commit(stream);
+}
+
+static void test_stream_error_message_when_no_level_set(struct test *test)
+{
+	struct test_stream_test_context *ctx = test->priv;
+	struct MOCK(test) *mock_test = ctx->mock_test;
+	struct test_stream *stream = ctx->stream;
+	struct test_stream *other_stream;
+
+	stream->add(stream, "Foo bar");
+	other_stream = test_new_stream(mock_get_trgt(mock_test));
+
+	stream->append(stream, other_stream);
+	TEST_EXPECT_CALL(mock_vprintk(
+			mock_get_ctrl(mock_test),
+			test_any(test),
+			test_va_format_cmp(test,
+					   test_streq(test,
+						      "Stream was committed without a specified log level."),
+					   test_any(test))));
+	TEST_EXPECT_CALL(mock_vprintk(
+			mock_get_ctrl(mock_test),
+			test_any(test),
+			test_va_format_cmp(test,
+					   test_streq(test, "Foo bar"),
+					   test_any(test))));
+	stream->commit(stream);
+}
+
+static void test_stream_test_commits_any_uncommitted_when_cleanup(
+		struct test *test)
+{
+	struct test_stream_test_context *ctx = test->priv;
+	struct MOCK(test) *mock_test = ctx->mock_test;
+	struct test_stream *stream = ctx->stream;
+
+	stream->add(stream, "Hello World");
+	stream->set_level(stream, KERN_WARNING);
+
+	TEST_EXPECT_CALL(mock_vprintk(
+			mock_get_ctrl(mock_test),
+			test_any(test),
+			test_va_format_cmp(test,
+					   test_streq(test,
+						      "End of test case reached with uncommitted stream entries."),
+					   test_any(test))));
+	TEST_EXPECT_CALL(mock_vprintk(
+			mock_get_ctrl(mock_test),
+			test_any(test),
+			test_va_format_cmp(test,
+					   test_streq(test,
+						      "Hello World"),
+					   test_any(test))));
+	test_cleanup(mock_get_trgt(mock_test));
+}
+
+static int test_stream_test_init(struct test *test)
+{
+	struct test_stream_test_context *ctx;
+
+	ctx = test_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	ctx->mock_test = CONSTRUCT_MOCK(test, test);
+	if (!ctx->mock_test)
+		return -EINVAL;
+
+	ctx->stream = test_new_stream(mock_get_trgt(ctx->mock_test));
+	if (!ctx->stream)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static struct test_case test_stream_test_cases[] = {
+	TEST_CASE(test_stream_test_add),
+	TEST_CASE(test_stream_test_append),
+	TEST_CASE(test_stream_test_commits_any_uncommitted_when_cleanup),
+	TEST_CASE(test_stream_error_message_when_no_level_set),
+	{},
+};
+
+static struct test_module test_stream_test_module = {
+	.name = "test-stream-test",
+	.init = test_stream_test_init,
+	.test_cases = test_stream_test_cases,
+};
+module_test(test_stream_test_module);
-- 
2.19.1.331.ge82ca0e54c-goog
