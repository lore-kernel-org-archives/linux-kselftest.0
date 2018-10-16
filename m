From: brendanhiggins@google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:11 -0700
Subject: [RFC v1 22/31] kunit: mock: add the concept of spyable functions
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-23-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181016235111.35nI8Xp6cjA1t_sFcSHRB6e3Rjqij53lX2tDlvEpnXc@z>

Adds the concept of spying like in Mockito
(http://static.javadoc.io/org.mockito/mockito-core/2.20.0/org/mockito/Mockito.html#spy-T-).
This allows a function declaration to be labled as spyable which allows
the function to be mocked *and* to allow the mock to invoke the original
function definition.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 include/kunit/mock.h | 123 ++++++++++++++++++++++++++++++++++++++++++-
 kunit/common-mocks.c |  36 +++++++++++++
 2 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/include/kunit/mock.h b/include/kunit/mock.h
index b58e30ba02ce2..c3615e80d96ee 100644
--- a/include/kunit/mock.h
+++ b/include/kunit/mock.h
@@ -284,6 +284,13 @@ static inline bool is_naggy_mock(struct mock *mock)
 		DECLARE_MOCK_CLIENT(name, return_type, param_types);	       \
 		DECLARE_MOCK_MASTER(name, handle_index, param_types)
 
+#define DECLARE_SPYABLE(name, return_type, param_types...)		       \
+		return_type REAL_ID(name)(param_types);			       \
+		return_type name(param_types);				       \
+		void *INVOKE_ID(name)(struct test *test,		       \
+				      const void *params[],		       \
+				      int len)
+
 #define DECLARE_MOCK_FUNC_CLIENT(name, return_type, param_types...) \
 		DECLARE_MOCK_CLIENT(name, return_type, param_types)
 
@@ -465,6 +472,100 @@ static inline bool is_naggy_mock(struct mock *mock)
 			RETURN(return_type, retval);			       \
 		}
 
+#if IS_ENABLED(CONFIG_KUNIT)
+#define DEFINE_INVOKABLE(name, return_type, RETURN_ASSIGN, param_types...)     \
+		void *INVOKE_ID(name)(struct test *test,		       \
+				      const void *params[],		       \
+				      int len) {			       \
+			return_type *retval;				       \
+									       \
+			TEST_ASSERT_EQ(test, NUM_VA_ARGS(param_types), len);   \
+			retval = test_kzalloc(test,			       \
+					      sizeof(*retval),		       \
+					      GFP_KERNEL);		       \
+			TEST_ASSERT_NOT_ERR_OR_NULL(test, retval);	       \
+			RETURN_ASSIGN() REAL_ID(name)(			       \
+					ARRAY_ACCESSORS_FROM_TYPES(	       \
+							param_types));	       \
+			return retval;					       \
+		}
+#else
+#define DEFINE_INVOKABLE(name, return_type, RETURN_ASSIGN, param_types...)
+#endif
+
+#define DEFINE_SPYABLE_COMMON(name,					       \
+			      return_type,				       \
+			      RETURN_ASSIGN,				       \
+			      param_types...)				       \
+		return_type REAL_ID(name)(param_types);			       \
+		return_type name(param_types) __mockable_alias(REAL_ID(name)); \
+		DEFINE_INVOKABLE(name, return_type, RETURN_ASSIGN, param_types);
+
+#define ASSIGN() *retval =
+
+/**
+ * DEFINE_SPYABLE()
+ * @name: name of the function
+ * @return_type: return type of the function
+ * @param_types: parameter types of the function
+ *
+ * Used to define a function which is *redirect-mockable*, which allows the
+ * function to be mocked and refer to the original definition via
+ * INVOKE_REAL().
+ *
+ * Example:
+ *
+ * .. code-block:: c
+ *
+ *	DEFINE_SPYABLE(i2c_add_adapter,
+ *	               RETURNS(int), PARAMS(struct i2c_adapter *));
+ *	int REAL_ID(i2c_add_adapter)(struct i2c_adapter *adapter)
+ *	{
+ *		...
+ *	}
+ *
+ *	static int aspeed_i2c_test_init(struct test *test)
+ *	{
+ *		struct mock_param_capturer *adap_capturer;
+ *		struct mock_expectation *handle;
+ *		struct aspeed_i2c_test *ctx;
+ *		int ret;
+ *
+ *		ctx = test_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+ *		if (!ctx)
+ *			return -ENOMEM;
+ *		test->priv = ctx;
+ *
+ *		handle = TEST_EXPECT_CALL(
+ *				i2c_add_adapter(capturer_to_matcher(
+ *						adap_capturer)));
+ *		handle->action = INVOKE_REAL(test, i2c_add_adapter);
+ *		ret = of_fake_probe_platform_by_name(test,
+ *						     "aspeed-i2c-bus",
+ *						     "test-i2c-bus");
+ *		if (ret < 0)
+ *			return ret;
+ *
+ *		TEST_ASSERT_PARAM_CAPTURED(test, adap_capturer);
+ *		ctx->adap = mock_capturer_get(adap_capturer,
+ *					      struct i2c_adapter *);
+ *
+ *		return 0;
+ *	}
+ */
+#define DEFINE_SPYABLE(name, return_type, param_types...)		       \
+		DEFINE_SPYABLE_COMMON(name,				       \
+						return_type,		       \
+						ASSIGN,			       \
+						param_types)
+
+#define NO_ASSIGN()
+#define DEFINE_SPYABLE_VOID_RETURN(name, param_types)			       \
+		DEFINE_SPYABLE_COMMON(name,				       \
+				      void,				       \
+				      NO_ASSIGN,			       \
+				      param_types)
+
 #define CLASS_MOCK_CLIENT_SOURCE(ctx, handle_index) ctx(arg##handle_index)
 #define DEFINE_MOCK_METHOD_CLIENT_COMMON(name,				       \
 					 handle_index,			       \
@@ -745,7 +846,7 @@ DECLARE_STRUCT_CLASS_MOCK_INIT(void);
  * @...: parameter types of the function
  *
  * Same as DEFINE_STRUCT_CLASS_MOCK() except can be used to mock any function
- * declared %__mockable or DEFINE_REDIRECT_MOCKABLE()
+ * declared %__mockable or DEFINE_SPYABLE()
  */
 #define DEFINE_FUNCTION_MOCK(name, return_type, param_types...) \
 		DEFINE_FUNCTION_MOCK_INTERNAL(name, return_type, param_types)
@@ -777,6 +878,7 @@ DECLARE_STRUCT_CLASS_MOCK_INIT(void);
  *	int __mockable example(int arg) { ... }
  */
 #define __mockable __weak
+#define __mockable_alias(id) __weak __alias(id)
 
 /**
  * __visible_for_testing - Makes a static function visible when testing.
@@ -788,6 +890,7 @@ DECLARE_STRUCT_CLASS_MOCK_INIT(void);
 #define __visible_for_testing
 #else
 #define __mockable
+#define __mockable_alias(id) __alias(id)
 #define __visible_for_testing static
 #endif
 
@@ -1069,6 +1172,24 @@ struct mock_param_matcher *test_struct_cmp(
 		const char *struct_name,
 		struct mock_struct_matcher_entry *entries);
 
+struct mock_action *invoke(struct test *test,
+			   void *(*invokable)(struct test *,
+					      const void *params[],
+					      int len));
+
+/**
+ * INVOKE_REAL()
+ * @test: associated test
+ * @func_name: name of the function
+ *
+ * See DEFINE_SPYABLE() for an example.
+ *
+ * Return: &struct mock_action that makes the associated mock method or function
+ *         call the original function definition of a redirect-mockable
+ *         function.
+ */
+#define INVOKE_REAL(test, func_name) invoke(test, INVOKE_ID(func_name))
+
 struct mock_struct_formatter_entry {
 	size_t member_offset;
 	struct mock_param_formatter *formatter;
diff --git a/kunit/common-mocks.c b/kunit/common-mocks.c
index 1c52522808cab..ce0159923814d 100644
--- a/kunit/common-mocks.c
+++ b/kunit/common-mocks.c
@@ -386,6 +386,42 @@ DEFINE_RETURN_ACTION_WITH_TYPENAME(longlong, long long);
 DEFINE_RETURN_ACTION_WITH_TYPENAME(ulonglong, unsigned long long);
 DEFINE_RETURN_ACTION_WITH_TYPENAME(ptr, void *);
 
+struct mock_invoke_action {
+	struct mock_action action;
+	struct test *test;
+	void *(*invokable)(struct test *test, const void *params[], int len);
+};
+
+static void *do_invoke(struct mock_action *paction,
+		       const void *params[],
+		       int len)
+{
+	struct mock_invoke_action *action =
+			container_of(paction,
+				     struct mock_invoke_action,
+				     action);
+
+	return action->invokable(action->test, params, len);
+}
+
+struct mock_action *invoke(struct test *test,
+			   void *(*invokable)(struct test *,
+					      const void *params[],
+					      int len))
+{
+	struct mock_invoke_action *action;
+
+	action = test_kmalloc(test, sizeof(*action), GFP_KERNEL);
+	if (!action)
+		return NULL;
+
+	action->action.do_action = do_invoke;
+	action->test = test;
+	action->invokable = invokable;
+
+	return &action->action;
+}
+
 struct mock_param_integer_formatter {
 	struct mock_param_formatter formatter;
 	const char *fmt_str;
-- 
2.19.1.331.ge82ca0e54c-goog
