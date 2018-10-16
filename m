From: brendanhiggins@google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:10 -0700
Subject: [RFC v1 21/31] kunit: mock: added support for arbitrary function
 mocking
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-22-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181016235110.L9Iai3zHOkY04j8Vln79QzBbYaPJ-vNOKuHA5kLVkdQ@z>

Up to this point KUnit only supported method style function mocking
where there was some type of class or context object and the function
was only accessed via a pointer.

This adds support for mocking any function via the __mockable attribute.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 include/kunit/mock.h    | 107 ++++++++++++++++++++++++++++++++++++++++
 kunit/mock-macro-test.c |  14 ++++++
 kunit/mock.c            |  41 +++++++++++++++
 3 files changed, 162 insertions(+)

diff --git a/include/kunit/mock.h b/include/kunit/mock.h
index 89e95b3fcf09e..b58e30ba02ce2 100644
--- a/include/kunit/mock.h
+++ b/include/kunit/mock.h
@@ -144,6 +144,8 @@ void mock_register_formatter(struct mock_param_formatter *formatter);
 
 void mock_unregister_formatter(struct mock_param_formatter *formatter);
 
+struct mock *mock_get_global_mock(void);
+
 #define MOCK(name) name##_mock
 
 /**
@@ -282,6 +284,12 @@ static inline bool is_naggy_mock(struct mock *mock)
 		DECLARE_MOCK_CLIENT(name, return_type, param_types);	       \
 		DECLARE_MOCK_MASTER(name, handle_index, param_types)
 
+#define DECLARE_MOCK_FUNC_CLIENT(name, return_type, param_types...) \
+		DECLARE_MOCK_CLIENT(name, return_type, param_types)
+
+#define DECLARE_MOCK_FUNC_MASTER(name, param_types...) \
+		DECLARE_MOCK_MASTER(name, MOCK_MAX_PARAMS, param_types)
+
 #define DECLARE_STRUCT_CLASS_MOCK_STRUCT(struct_name)			       \
 		struct MOCK(struct_name) {				       \
 			struct mock		ctrl;			       \
@@ -411,6 +419,16 @@ static inline bool is_naggy_mock(struct mock *mock)
  */
 #define CONSTRUCT_MOCK(struct_name, test) MOCK_INIT_ID(struct_name)(test)
 
+#define DECLARE_FUNCTION_MOCK_INTERNAL(name, return_type, param_types...)      \
+		DECLARE_MOCK_FUNC_CLIENT(name, return_type, param_types);      \
+		DECLARE_MOCK_FUNC_MASTER(name, param_types);
+
+#define DECLARE_FUNCTION_MOCK(name, return_type, param_types...) \
+		DECLARE_FUNCTION_MOCK_INTERNAL(name, return_type, param_types)
+
+#define DECLARE_FUNCTION_MOCK_VOID_RETURN(name, param_types...) \
+		DECLARE_FUNCTION_MOCK(name, void, param_types)
+
 #define DEFINE_MOCK_CLIENT_COMMON(name,					       \
 				  handle_index,				       \
 				  MOCK_SOURCE,				       \
@@ -488,6 +506,31 @@ static inline bool is_naggy_mock(struct mock *mock)
 						 NO_RETURN,		       \
 						 param_types)
 
+#define FUNC_MOCK_SOURCE(ctx, handle_index) mock_get_global_mock()
+#define DEFINE_MOCK_FUNC_CLIENT_COMMON(name,				       \
+				       return_type,			       \
+				       RETURN,				       \
+				       param_types...)			       \
+		DEFINE_MOCK_CLIENT_COMMON(name,				       \
+					  MOCK_MAX_PARAMS,		       \
+					  FUNC_MOCK_SOURCE,		       \
+					  name,				       \
+					  return_type,			       \
+					  RETURN,			       \
+					  param_types)
+
+#define DEFINE_MOCK_FUNC_CLIENT(name, return_type, param_types...)	       \
+		DEFINE_MOCK_FUNC_CLIENT_COMMON(name,			       \
+					       return_type,		       \
+					       CAST_AND_RETURN,		       \
+					       param_types)
+
+#define DEFINE_MOCK_FUNC_CLIENT_VOID_RETURN(name, param_types...)	       \
+		DEFINE_MOCK_FUNC_CLIENT_COMMON(name,			       \
+					       void,			       \
+					       NO_RETURN,		       \
+					       param_types)
+
 #define DEFINE_MOCK_MASTER_COMMON_INTERNAL(name,			       \
 					   ctrl_index,			       \
 					   MOCK_SOURCE,			       \
@@ -522,6 +565,13 @@ static inline bool is_naggy_mock(struct mock *mock)
 					  CLASS_MOCK_MASTER_SOURCE,	       \
 					  param_types)
 
+#define FUNC_MOCK_CLIENT_SOURCE(ctrl_index) mock_get_global_mock()
+#define DEFINE_MOCK_FUNC_MASTER(name, param_types...)			       \
+		DEFINE_MOCK_MASTER_COMMON(name,				       \
+					  MOCK_MAX_PARAMS,		       \
+					  FUNC_MOCK_CLIENT_SOURCE,	       \
+					  param_types)
+
 #define DEFINE_MOCK_COMMON(name,					       \
 			   handle_index,				       \
 			   mock_converter,				       \
@@ -684,6 +734,63 @@ static inline struct mock *from_void_ptr_to_mock(const void *ptr)
 
 DECLARE_STRUCT_CLASS_MOCK_INIT(void);
 
+#define DEFINE_FUNCTION_MOCK_INTERNAL(name, return_type, param_types...)       \
+		DEFINE_MOCK_FUNC_CLIENT(name, return_type, param_types);       \
+		DEFINE_MOCK_FUNC_MASTER(name, param_types)
+
+/**
+ * DEFINE_FUNCTION_MOCK()
+ * @name: name of the function
+ * @return_type: return type of the function
+ * @...: parameter types of the function
+ *
+ * Same as DEFINE_STRUCT_CLASS_MOCK() except can be used to mock any function
+ * declared %__mockable or DEFINE_REDIRECT_MOCKABLE()
+ */
+#define DEFINE_FUNCTION_MOCK(name, return_type, param_types...) \
+		DEFINE_FUNCTION_MOCK_INTERNAL(name, return_type, param_types)
+
+#define DEFINE_FUNCTION_MOCK_VOID_RETURN_INTERNAL(name, param_types...)	       \
+		DEFINE_MOCK_FUNC_CLIENT_VOID_RETURN(name, param_types);	       \
+		DEFINE_MOCK_FUNC_MASTER(name, param_types)
+
+/**
+ * DEFINE_FUNCTION_MOCK_VOID_RETURN()
+ * @name: name of the function
+ * @...: parameter types of the function
+ *
+ * Same as DEFINE_FUNCTION_MOCK() except the method has a ``void`` return
+ * type.
+ */
+#define DEFINE_FUNCTION_MOCK_VOID_RETURN(name, param_types...) \
+		DEFINE_FUNCTION_MOCK_VOID_RETURN_INTERNAL(name, param_types)
+
+#if IS_ENABLED(CONFIG_KUNIT)
+
+/**
+ * __mockable - A function decorator that allows the function to be mocked.
+ *
+ * Example:
+ *
+ * .. code-block:: c
+ *
+ *	int __mockable example(int arg) { ... }
+ */
+#define __mockable __weak
+
+/**
+ * __visible_for_testing - Makes a static function visible when testing.
+ *
+ * A macro that replaces the `static` specifier on functions and global
+ * variables that is static when compiled normally and visible when compiled for
+ * tests.
+ */
+#define __visible_for_testing
+#else
+#define __mockable
+#define __visible_for_testing static
+#endif
+
 #define CONVERT_TO_ACTUAL_TYPE(type, ptr) (*((type *) ptr))
 
 /**
diff --git a/kunit/mock-macro-test.c b/kunit/mock-macro-test.c
index 0f95105ec032a..a2628a70bc4e4 100644
--- a/kunit/mock-macro-test.c
+++ b/kunit/mock-macro-test.c
@@ -58,6 +58,8 @@ DEFINE_VOID_CLASS_MOCK_HANDLE_INDEX(METHOD(test_void_ptr_func),
 				    RETURNS(int),
 				    PARAMS(void*, int));
 
+DEFINE_FUNCTION_MOCK(add, RETURNS(int), PARAMS(int, int));
+
 struct mock_macro_context {
 	struct MOCK(test_struct) *mock_test_struct;
 	struct MOCK(void) *mock_void_ptr;
@@ -220,6 +222,17 @@ static void mock_macro_test_generated_method_void_code_works(struct test *test)
 	test_void_ptr_func(mock_void_ptr, 3);
 }
 
+static void mock_macro_test_generated_function_code_works(struct test *test)
+{
+	struct mock_expectation *handle;
+
+	handle = TEST_EXPECT_CALL(add(test_int_eq(test, 4),
+				      test_int_eq(test, 3)));
+	handle->action = test_int_return(test, 7);
+
+	TEST_EXPECT_EQ(test, 7, add(4, 3));
+}
+
 static int mock_macro_test_init(struct test *test)
 {
 	struct mock_macro_context *ctx;
@@ -250,6 +263,7 @@ static struct test_case mock_macro_test_cases[] = {
 	TEST_CASE(mock_macro_arg_names_from_types),
 	TEST_CASE(mock_macro_test_generated_method_code_works),
 	TEST_CASE(mock_macro_test_generated_method_void_code_works),
+	TEST_CASE(mock_macro_test_generated_function_code_works),
 	{},
 };
 
diff --git a/kunit/mock.c b/kunit/mock.c
index 7a9fcf6ae4a55..2b91ea08b6064 100644
--- a/kunit/mock.c
+++ b/kunit/mock.c
@@ -93,6 +93,47 @@ void mock_init_ctrl(struct test *test, struct mock *mock)
 	list_add_tail(&mock->parent.node, &test->post_conditions);
 }
 
+struct global_mock {
+	struct mock ctrl;
+	bool is_initialized;
+};
+
+static struct global_mock global_mock = {
+	.is_initialized = false,
+};
+
+static int mock_init_global_mock(struct test_initcall *initcall,
+				 struct test *test)
+{
+	BUG_ON(global_mock.is_initialized);
+
+	mock_init_ctrl(test, &global_mock.ctrl);
+	global_mock.is_initialized = true;
+
+	return 0;
+}
+
+static void mock_exit_global_mock(struct test_initcall *initcall)
+{
+	BUG_ON(!global_mock.is_initialized);
+
+	global_mock.ctrl.test = NULL;
+	global_mock.is_initialized = false;
+}
+
+static struct test_initcall global_mock_initcall = {
+	.init = mock_init_global_mock,
+	.exit = mock_exit_global_mock,
+};
+test_register_initcall(global_mock_initcall);
+
+struct mock *mock_get_global_mock(void)
+{
+	BUG_ON(!global_mock.is_initialized);
+
+	return &global_mock.ctrl;
+}
+
 static struct mock_method *mock_lookup_method(struct mock *mock,
 					      const void *method_ptr)
 {
-- 
2.19.1.331.ge82ca0e54c-goog
