From: brendanhiggins@google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:12 -0700
Subject: [RFC v1 23/31] kunit: mock: add parameter capturers
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-24-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181016235112.2rlqyUzW4bQBh-kHgwsj2yJSj8j1nZ0f0tiD9LZe8b8@z>

Adds the concept of an argument capturer which, when used with a matcher
in an EXPECT_CALL(...), will capture the value of the matching argument.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 include/kunit/mock.h | 83 ++++++++++++++++++++++++++++++++++++++++++++
 kunit/common-mocks.c | 78 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 161 insertions(+)

diff --git a/include/kunit/mock.h b/include/kunit/mock.h
index c3615e80d96ee..0e1aa568709a1 100644
--- a/include/kunit/mock.h
+++ b/include/kunit/mock.h
@@ -1172,6 +1172,89 @@ struct mock_param_matcher *test_struct_cmp(
 		const char *struct_name,
 		struct mock_struct_matcher_entry *entries);
 
+/**
+ * struct mock_param_capturer - used to capture parameter when matching
+ *
+ * Use the associated helper macros to access relevant fields.
+ * Example:
+ *
+ * .. code-block::c
+ *
+ *	static int some_test(struct test *test)
+ *	{
+ *		// imagine a mocked function: int add(int a, int b)
+ *		struct mock_param_capturer *capturer =
+ *			mock_int_capturer_create(test, any(test));
+ *		TEST_EXPECT_CALL(add(any(test), capturer_to_matcher(capturer)));
+ *		TEST_ASSERT_PARAM_CAPTURED(test, capturer);
+ *
+ *		int captured_value = mock_capturer_get(capturer, int);
+ *	}
+ */
+struct mock_param_capturer {
+	/* private: internal use only. */
+	struct mock_param_matcher matcher;
+	struct mock_param_matcher *child_matcher;
+	void *(*capture_param)(struct test *test, const void *param);
+	void *captured_param;
+};
+
+struct mock_param_capturer *mock_param_capturer_create(
+		struct test *test,
+		struct mock_param_matcher *child_matcher,
+		void *(*capture_param)(struct test *, const void *));
+
+/**
+ * mock_int_capturer_create() - creates a int parameter capturer
+ * @test: associated test
+ * @child_matcher: matcher used to match the integer
+ *
+ * The capturer will capture the value if the matcher is satisfied.
+ */
+struct mock_param_capturer *mock_int_capturer_create(
+		struct test *test, struct mock_param_matcher *child_matcher);
+
+/**
+ * mock_int_capturer_create() - creates a generic pointer parameter capturer
+ * @test: associated test
+ * @child_matcher: matcher used to match the pointer
+ *
+ * The capturer will capture the value if the matcher is satisfied
+ */
+struct mock_param_capturer *mock_ptr_capturer_create(
+		struct test *test, struct mock_param_matcher *child_matcher);
+
+/**
+ * capturer_to_matcher()
+ * @capturer: the param capturer
+ *
+ * Use this function when passing a capturer into an EXPECT_CALL() where a
+ * matcher would be expected. See the example for &struct mock_param_capturer.
+ */
+#define capturer_to_matcher(capturer) (&(capturer)->matcher)
+
+/**
+ * TEST_ASSERT_PARAM_CAPTURED(): Asserts that a parameter has been captured.
+ * @test: the associated test
+ * @capturer: the param capturer
+ *
+ * See &struct mock_param_capturer for an example.
+ */
+#define TEST_ASSERT_PARAM_CAPTURED(test, capturer)			       \
+		TEST_ASSERT(test,					       \
+		       !IS_ERR_OR_NULL((capturer)->captured_param),	       \
+		       "Asserted " #capturer " captured param, but did not.")
+
+/**
+ * mock_capturer_get(): Returns the value captured by ``capturer``
+ * @capturer: the param capturer
+ * @type: the type of the value
+ *
+ * See &struct mock_param_capturer for an example.
+ */
+#define mock_capturer_get(capturer, type) \
+		CONVERT_TO_ACTUAL_TYPE(type, (capturer)->captured_param)
+
 struct mock_action *invoke(struct test *test,
 			   void *(*invokable)(struct test *,
 					      const void *params[],
diff --git a/kunit/common-mocks.c b/kunit/common-mocks.c
index ce0159923814d..62528b7df83c6 100644
--- a/kunit/common-mocks.c
+++ b/kunit/common-mocks.c
@@ -323,6 +323,84 @@ struct mock_param_matcher *test_struct_cmp(
 	return &matcher->matcher;
 }
 
+static bool match_and_capture_param(struct mock_param_matcher *pmatcher,
+				    struct test_stream *stream,
+				    const void *param)
+{
+	struct mock_param_capturer *capturer =
+			container_of(pmatcher,
+				     struct mock_param_capturer,
+				     matcher);
+	struct mock_param_matcher *child_matcher = capturer->child_matcher;
+	bool matches;
+
+	matches = child_matcher->match(child_matcher, stream, param);
+	if (matches)
+		capturer->captured_param = capturer->capture_param(stream->test,
+								   param);
+
+	return matches;
+}
+
+struct mock_param_capturer *mock_param_capturer_create(
+		struct test *test,
+		struct mock_param_matcher *child_matcher,
+		void *(*capture_param)(struct test *, const void *))
+{
+	struct mock_param_capturer *capturer;
+
+	capturer = test_kzalloc(test, sizeof(*capturer), GFP_KERNEL);
+	if (!capturer)
+		return NULL;
+
+	capturer->matcher.match = match_and_capture_param;
+	capturer->child_matcher = child_matcher;
+	capturer->capture_param = capture_param;
+	capturer->captured_param = NULL;
+
+	return capturer;
+}
+
+static void *mock_capture_int(struct test *test, const void *param)
+{
+	int value = CONVERT_TO_ACTUAL_TYPE(int, param);
+	int *pvalue;
+
+	pvalue = test_kzalloc(test, sizeof(*pvalue), GFP_KERNEL);
+	if (!pvalue)
+		return NULL;
+	*pvalue = value;
+
+	return pvalue;
+}
+
+struct mock_param_capturer *mock_int_capturer_create(
+		struct test *test, struct mock_param_matcher *child_matcher)
+{
+	return mock_param_capturer_create(test,
+					  child_matcher,
+					  mock_capture_int);
+}
+
+static void *mock_capture_ptr(struct test *test, const void *param)
+{
+	void *ptr = CONVERT_TO_ACTUAL_TYPE(void *, param);
+	void **pptr;
+
+	pptr = test_kzalloc(test, sizeof(*pptr), GFP_KERNEL);
+	*pptr = ptr;
+
+	return pptr;
+}
+
+struct mock_param_capturer *mock_ptr_capturer_create(
+		struct test *test, struct mock_param_matcher *child_matcher)
+{
+	return mock_param_capturer_create(test,
+					  child_matcher,
+					  mock_capture_ptr);
+}
+
 #define DEFINE_RETURN_ACTION_STRUCT(type_name, type)			       \
 		struct mock_##type_name##_action {			       \
 			struct mock_action action;			       \
-- 
2.19.1.331.ge82ca0e54c-goog
