From: brendanhiggins at google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:08 -0700
Subject: [RFC v1 19/31] kunit: mock: implemented nice,
 strict and naggy mock distinctions
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-20-brendanhiggins@google.com>

Nice mocks only fail when there is an expectation on a method, but none
match a given call. Strict mocks only pass when there is a matching
expectation for every call. Naggy mocks have the same pass/fail behavior
as nice, but report a warning in any case a strict mock would fail.

Signed-off-by: Felix Guo <felixguoxiuping at gmail.com>
Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 include/kunit/mock.h     |  63 +++++++++++++
 kunit/mock-test.c        | 192 ++++++++++++++++++++++++++++++++++++++-
 kunit/mock.c             |  10 +-
 kunit/test-stream-test.c |   6 +-
 4 files changed, 265 insertions(+), 6 deletions(-)

diff --git a/include/kunit/mock.h b/include/kunit/mock.h
index 4f85b39d628d0..8d155b27a257a 100644
--- a/include/kunit/mock.h
+++ b/include/kunit/mock.h
@@ -95,10 +95,17 @@ struct mock_method {
 	struct list_head expectations;
 };
 
+enum mock_type {
+	MOCK_TYPE_NICE,
+	MOCK_TYPE_NAGGY,
+	MOCK_TYPE_STRICT
+};
+
 struct mock {
 	struct test_post_condition parent;
 	struct test *test;
 	struct list_head methods;
+	enum mock_type type;
 	/* TODO(brendanhiggins at google.com): add locking to do_expect. */
 	const void *(*do_expect)(struct mock *mock,
 				 const char *method_name,
@@ -108,6 +115,8 @@ struct mock {
 				 int len);
 };
 
+#define DEFAULT_MOCK_TYPE MOCK_TYPE_NAGGY
+
 void mock_init_ctrl(struct test *test, struct mock *mock);
 
 void mock_validate_expectations(struct mock *mock);
@@ -137,6 +146,60 @@ void mock_unregister_formatter(struct mock_param_formatter *formatter);
 
 #define MOCK(name) name##_mock
 
+/**
+ * STRICT_MOCK() - sets the mock to be strict and returns the mock
+ * @mock: the mock
+ *
+ * For an example, see ``The Nice, the Strict, and the Naggy`` under
+ * ``Using KUnit``.
+ */
+#define STRICT_MOCK(mock) \
+({ \
+	mock_get_ctrl(mock)->type = MOCK_TYPE_STRICT; \
+	mock; \
+})
+
+static inline bool is_strict_mock(struct mock *mock)
+{
+	return mock->type == MOCK_TYPE_STRICT;
+}
+
+/**
+ * NICE_MOCK() - sets the mock to be nice and returns the mock
+ * @mock: the mock
+ *
+ * For an example, see ``The Nice, the Strict, and the Naggy`` under
+ * ``Using KUnit``.
+ */
+#define NICE_MOCK(mock) \
+({ \
+	mock_get_ctrl(mock)->type = MOCK_TYPE_NICE; \
+	mock; \
+})
+
+static inline bool is_nice_mock(struct mock *mock)
+{
+	return mock->type == MOCK_TYPE_NICE;
+}
+
+/**
+ * NAGGY_MOCK() - sets the mock to be naggy and returns the mock
+ * @mock: the mock
+ *
+ * For an example, see ``The Nice, the Strict, and the Naggy`` under
+ * ``Using KUnit``.
+ */
+#define NAGGY_MOCK(mock) \
+({ \
+	mock_get_ctrl(mock)->type = MOCK_TYPE_NAGGY; \
+	mock; \
+})
+
+static inline bool is_naggy_mock(struct mock *mock)
+{
+	return mock->type == MOCK_TYPE_NAGGY;
+}
+
 /**
  * TEST_EXPECT_CALL() - Declares a *call expectation* on a mock function.
  * @expectation_call: a mocked method or function with parameters replaced with
diff --git a/kunit/mock-test.c b/kunit/mock-test.c
index 77b16ad754424..675387743ada4 100644
--- a/kunit/mock-test.c
+++ b/kunit/mock-test.c
@@ -150,7 +150,7 @@ static void mock_test_failed_expect_call_fails_test(struct test *test)
 static void mock_test_do_expect_default_return(struct test *test)
 {
 	struct mock_test_context *ctx = test->priv;
-	struct MOCK(test) *mock_test = ctx->mock_test;
+	struct MOCK(test) *mock_test = NICE_MOCK(ctx->mock_test);
 	struct test *trgt = mock_get_trgt(mock_test);
 	struct mock *mock = ctx->mock;
 	int param0 = 5, param1 = -5;
@@ -187,6 +187,49 @@ static void mock_test_do_expect_default_return(struct test *test)
 	TEST_EXPECT_EQ(test, 0, expectation->times_called);
 }
 
+/**
+ * DOC: Testing the failure condition of different mock types.
+ *
+ * The following tests will test the behaviour of expectations under different
+ * conditions. For example, what happens when an expectation:
+ * - is not satisfied at the end of the test
+ * - is fulfilled but the expected function is called again
+ * - a function is called without expectations set on it
+ *
+ * For each of these conditions, there may be variations between the different
+ * types of mocks: nice mocks, naggy mocks (the default) and strict mocks.
+ *
+ * More information about these mocks can be found in the kernel documentation
+ * under Documentation/test/api/class-and-function-mocking
+ */
+
+/* Method called on strict mock with no expectations will fail */
+static void mock_test_strict_no_expectations_will_fail(struct test *test)
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
+	mock->type = MOCK_TYPE_STRICT;
+
+	mock_set_default_action(mock,
+				"test_printk",
+				test_printk,
+				test_int_return(trgt, -4));
+
+	expectation = TEST_EXPECT_CALL(fail(mock_get_ctrl(mock_test),
+					    test_any(test)));
+
+	mock->do_expect(mock, "test_printk", test_printk, two_param_types,
+		two_params, ARRAY_SIZE(two_params));
+	mock_validate_expectations(mock);
+}
+
 /*
  * Method called on naggy mock with no expectations will not fail, but will show
  * a warning message
@@ -202,6 +245,8 @@ static void mock_test_naggy_no_expectations_no_fail(struct test *test)
 	const void *two_params[] = {&param0, &param1};
 	struct mock_expectation *expectation;
 
+	mock->type = MOCK_TYPE_NAGGY;
+
 	mock_set_default_action(mock,
 				"test_printk",
 				test_printk,
@@ -229,6 +274,93 @@ static void mock_test_naggy_no_expectations_no_fail(struct test *test)
 	mock_validate_expectations(mock);
 }
 
+/* Method called on nice mock with no expectations will do nothing. */
+static void mock_test_nice_no_expectations_do_nothing(struct test *test)
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
+	mock->type = MOCK_TYPE_NICE;
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
+	expectation = TEST_EXPECT_CALL(mock_vprintk(mock_get_ctrl(mock_test),
+						    test_any(test),
+						    test_any(test)));
+	expectation->min_calls_expected = 0;
+	expectation->max_calls_expected = 0;
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
+/* Test that method called on a mock (of any type) with no matching expectations
+ * will fail test and print all the tried expectations.
+ */
+static void
+run_method_called_but_no_matching_expectation_test(struct test *test,
+						   enum mock_type mock_type)
+{
+	struct mock_test_context *ctx = test->priv;
+	struct MOCK(test) *mock_test = ctx->mock_test;
+	struct test *trgt = mock_get_trgt(mock_test);
+	struct mock *mock = ctx->mock;
+	int param0 = 5, param1 = -5;
+	static const char * const two_param_types[] = {"int", "int"};
+	const void *two_params[] = {&param0, &param1};
+	struct mock_expectation *handle;
+	struct mock_param_matcher *two_matchers[] = {
+		test_int_eq(trgt, 100),
+		test_int_eq(trgt, 100)
+	};
+	mock_add_matcher(mock, "test_printk", test_printk, two_matchers,
+		ARRAY_SIZE(two_matchers));
+	handle = TEST_EXPECT_CALL(fail(mock_get_ctrl(mock_test),
+				       test_any(test)));
+
+	mock->type = mock_type;
+
+	mock->do_expect(mock, "test_printk", test_printk, two_param_types,
+		two_params, ARRAY_SIZE(two_params));
+}
+
+static void mock_test_naggy_no_matching_expectations_fail(struct test *test)
+{
+	run_method_called_but_no_matching_expectation_test(test,
+							   MOCK_TYPE_NAGGY);
+}
+
+static void mock_test_strict_no_matching_expectations_fail(struct test *test)
+{
+	run_method_called_but_no_matching_expectation_test(test,
+							   MOCK_TYPE_STRICT);
+}
+
+static void mock_test_nice_no_matching_expectations_fail(struct test *test)
+{
+	run_method_called_but_no_matching_expectation_test(test,
+							   MOCK_TYPE_NICE);
+}
+
 static void mock_test_mock_validate_expectations(struct test *test)
 {
 	struct mock_test_context *ctx = test->priv;
@@ -257,6 +389,58 @@ static void mock_test_mock_validate_expectations(struct test *test)
 	mock_validate_expectations(mock);
 }
 
+static void mock_test_validate_clears_expectations(struct test *test)
+{
+	struct mock_test_context *ctx = test->priv;
+	struct MOCK(test) *mock_test = ctx->mock_test;
+	struct test *trgt = mock_get_trgt(mock_test);
+	struct mock *mock = ctx->mock;
+	struct mock_param_matcher *matchers[] = {
+		test_int_eq(trgt, 5),
+		test_int_eq(trgt, -4)
+	};
+	int param0 = 5, param1 = -4;
+	static const char * const two_param_types[] = {"int", "int"};
+	const void *two_params[] = {&param0, &param1};
+
+	struct mock_expectation *expectation;
+
+	mock->type = MOCK_TYPE_STRICT;
+
+	/* If all goes well, the mock_test should not fail. */
+	expectation = TEST_EXPECT_CALL(fail(mock_get_ctrl(mock_test),
+					    test_any(test)));
+	expectation->min_calls_expected = 0;
+	expectation->max_calls_expected = 0;
+
+	/* Add an arbitrary matcher for 0 calls */
+	expectation = mock_add_matcher(mock, "test_printk", test_printk,
+		matchers, ARRAY_SIZE(matchers));
+	expectation->times_called = 0;
+	expectation->min_calls_expected = 0;
+	expectation->max_calls_expected = 0;
+
+	/* Should have 0 calls and should clear the previous expectation */
+	mock_validate_expectations(mock);
+
+	/* Add a new matcher for 1 call */
+	expectation = mock_add_matcher(mock, "test_printk", test_printk,
+		matchers, ARRAY_SIZE(matchers));
+	expectation->times_called = 0;
+	expectation->min_calls_expected = 1;
+	expectation->max_calls_expected = 1;
+
+	/* Satisfy previous matcher */
+	mock->do_expect(mock, "test_printk", test_printk, two_param_types,
+		two_params, ARRAY_SIZE(two_params));
+
+	/*
+	 * Validate previous satisfy; if we didn't clear the previous
+	 * expectation, it would fail the mock_test.
+	 */
+	mock_validate_expectations(mock);
+}
+
 void *do_mocked_fail(struct mock_action *this, const void **params, int len)
 {
 	static const int ret;
@@ -306,7 +490,13 @@ static struct test_case mock_test_cases[] = {
 	TEST_CASE(mock_test_failed_expect_call_fails_test),
 	TEST_CASE(mock_test_do_expect_default_return),
 	TEST_CASE(mock_test_mock_validate_expectations),
+	TEST_CASE(mock_test_strict_no_expectations_will_fail),
 	TEST_CASE(mock_test_naggy_no_expectations_no_fail),
+	TEST_CASE(mock_test_nice_no_expectations_do_nothing),
+	TEST_CASE(mock_test_strict_no_matching_expectations_fail),
+	TEST_CASE(mock_test_naggy_no_matching_expectations_fail),
+	TEST_CASE(mock_test_nice_no_matching_expectations_fail),
+	TEST_CASE(mock_test_validate_clears_expectations),
 	{},
 };
 
diff --git a/kunit/mock.c b/kunit/mock.c
index 9be6b2d3621c4..314cebb54e236 100644
--- a/kunit/mock.c
+++ b/kunit/mock.c
@@ -79,6 +79,7 @@ void mock_init_ctrl(struct test *test, struct mock *mock)
 	mock->test = test;
 	INIT_LIST_HEAD(&mock->methods);
 	mock->do_expect = mock_do_expect;
+	mock->type = DEFAULT_MOCK_TYPE;
 	mock->parent.validate = mock_validate_wrapper;
 	list_add_tail(&mock->parent.node, &test->post_conditions);
 }
@@ -316,7 +317,12 @@ static struct mock_expectation *mock_apply_expectations(
 		mock_add_method_expectation_error(test, stream,
 			"Method was called with no expectations declared: ",
 			mock, method, type_names, params, len);
-		stream->commit(stream);
+		if (is_strict_mock(mock))
+			test->fail(test, stream);
+		else if (is_naggy_mock(mock))
+			stream->commit(stream);
+		else
+			stream->clear(stream);
 		return NULL;
 	}
 
@@ -346,7 +352,7 @@ static struct mock_expectation *mock_apply_expectations(
 		}
 	}
 
-	if (expectations_all_saturated) {
+	if (expectations_all_saturated && !is_nice_mock(mock)) {
 		mock_add_method_expectation_error(test, stream,
 			"Method was called with fully saturated expectations: ",
 			mock, method, type_names, params, len);
diff --git a/kunit/test-stream-test.c b/kunit/test-stream-test.c
index b335e09805a0f..738a2692f7ba4 100644
--- a/kunit/test-stream-test.c
+++ b/kunit/test-stream-test.c
@@ -20,7 +20,7 @@ struct test_stream_test_context {
 static void test_stream_test_add(struct test *test)
 {
 	struct test_stream_test_context *ctx = test->priv;
-	struct MOCK(test) *mock_test = ctx->mock_test;
+	struct MOCK(test) *mock_test = NICE_MOCK(ctx->mock_test);
 	struct test_stream *stream = ctx->stream;
 
 	stream->add(stream, "Foo");
@@ -40,7 +40,7 @@ static void test_stream_test_add(struct test *test)
 static void test_stream_test_append(struct test *test)
 {
 	struct test_stream_test_context *ctx = test->priv;
-	struct MOCK(test) *mock_test = ctx->mock_test;
+	struct MOCK(test) *mock_test = NICE_MOCK(ctx->mock_test);
 	struct test_stream *stream = ctx->stream;
 	struct test_stream *other_stream;
 
@@ -63,7 +63,7 @@ static void test_stream_test_append(struct test *test)
 static void test_stream_error_message_when_no_level_set(struct test *test)
 {
 	struct test_stream_test_context *ctx = test->priv;
-	struct MOCK(test) *mock_test = ctx->mock_test;
+	struct MOCK(test) *mock_test = NICE_MOCK(ctx->mock_test);
 	struct test_stream *stream = ctx->stream;
 	struct test_stream *other_stream;
 
-- 
2.19.1.331.ge82ca0e54c-goog
