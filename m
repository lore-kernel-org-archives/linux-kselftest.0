From: brendanhiggins at google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:09 -0700
Subject: [RFC v1 20/31] kunit: mock: add ability to mock functions with void
 context
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-21-brendanhiggins@google.com>

Adds ability to mock functions with a void* context object.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 include/kunit/mock.h    | 53 +++++++++++++++++++++++++++++++++++++++++
 kunit/mock-macro-test.c | 30 +++++++++++++++++++++++
 kunit/mock.c            |  9 +++++++
 3 files changed, 92 insertions(+)

diff --git a/include/kunit/mock.h b/include/kunit/mock.h
index 8d155b27a257a..89e95b3fcf09e 100644
--- a/include/kunit/mock.h
+++ b/include/kunit/mock.h
@@ -381,6 +381,24 @@ static inline bool is_naggy_mock(struct mock *mock)
 		struct MOCK(struct_name) *MOCK_INIT_ID(struct_name)(	       \
 				struct test *test)
 
+#define DECLARE_VOID_CLASS_MOCK_HANDLE_INDEX_INTERNAL(name,		       \
+						      handle_index,	       \
+						      return_type,	       \
+						      param_types...)	       \
+		DECLARE_MOCK_COMMON(name,				       \
+				    handle_index,			       \
+				    return_type,			       \
+				    param_types)
+
+#define DECLARE_VOID_CLASS_MOCK_HANDLE_INDEX(name,			       \
+					     handle_index,		       \
+					     return_type,		       \
+					     param_types...)		       \
+		DECLARE_VOID_CLASS_MOCK_HANDLE_INDEX_INTERNAL(name,	       \
+							      handle_index,    \
+							      return_type,     \
+							      param_types)
+
 /**
  * CONSTRUCT_MOCK()
  * @struct_name: name of the class
@@ -631,6 +649,41 @@ static inline bool is_naggy_mock(struct mock *mock)
 			return mock_obj;				       \
 		}
 
+struct MOCK(void) {
+	struct mock	ctrl;
+	void		*trgt;
+};
+
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wdiscarded-qualifiers"
+static inline struct mock *from_void_ptr_to_mock(const void *ptr)
+{
+	struct MOCK(void) *mock_void_ptr = ptr;
+
+	return mock_get_ctrl(mock_void_ptr);
+}
+#pragma GCC diagnostic pop
+
+#define DEFINE_VOID_CLASS_MOCK_HANDLE_INDEX_INTERNAL(name,		       \
+						     handle_index,	       \
+						     return_type,	       \
+						     param_types...)	       \
+		DEFINE_MOCK_COMMON(name,				       \
+				   handle_index,			       \
+				   from_void_ptr_to_mock,		       \
+				   return_type,				       \
+				   param_types)
+#define DEFINE_VOID_CLASS_MOCK_HANDLE_INDEX(name,			       \
+					    handle_index,		       \
+					    return_type,		       \
+					    param_types...)		       \
+		DEFINE_VOID_CLASS_MOCK_HANDLE_INDEX_INTERNAL(name,	       \
+							     handle_index,     \
+							     return_type,      \
+							     param_types)
+
+DECLARE_STRUCT_CLASS_MOCK_INIT(void);
+
 #define CONVERT_TO_ACTUAL_TYPE(type, ptr) (*((type *) ptr))
 
 /**
diff --git a/kunit/mock-macro-test.c b/kunit/mock-macro-test.c
index 84d9d3f484366..0f95105ec032a 100644
--- a/kunit/mock-macro-test.c
+++ b/kunit/mock-macro-test.c
@@ -48,8 +48,19 @@ static int test_struct_init(struct MOCK(test_struct) *mock_test_struct)
 
 DEFINE_STRUCT_CLASS_MOCK_INIT(test_struct, test_struct_init);
 
+DECLARE_VOID_CLASS_MOCK_HANDLE_INDEX(METHOD(test_void_ptr_func),
+				     HANDLE_INDEX(0),
+				     RETURNS(int),
+				     PARAMS(void*, int));
+
+DEFINE_VOID_CLASS_MOCK_HANDLE_INDEX(METHOD(test_void_ptr_func),
+				    HANDLE_INDEX(0),
+				    RETURNS(int),
+				    PARAMS(void*, int));
+
 struct mock_macro_context {
 	struct MOCK(test_struct) *mock_test_struct;
+	struct MOCK(void) *mock_void_ptr;
 };
 
 #define TO_STR_INTERNAL(...) #__VA_ARGS__
@@ -195,6 +206,20 @@ static void mock_macro_test_generated_method_code_works(struct test *test)
 	test_struct->non_first_slot_param(5, test_struct);
 }
 
+static void mock_macro_test_generated_method_void_code_works(struct test *test)
+{
+	struct mock_macro_context *ctx = test->priv;
+	struct MOCK(void) *mock_void_ptr = ctx->mock_void_ptr;
+	struct mock_expectation *handle;
+
+	handle = TEST_EXPECT_CALL(test_void_ptr_func(
+			mock_get_ctrl(mock_void_ptr),
+			test_int_eq(test, 3)));
+	handle->action = test_int_return(test, 0);
+
+	test_void_ptr_func(mock_void_ptr, 3);
+}
+
 static int mock_macro_test_init(struct test *test)
 {
 	struct mock_macro_context *ctx;
@@ -208,6 +233,10 @@ static int mock_macro_test_init(struct test *test)
 	if (!ctx->mock_test_struct)
 		return -EINVAL;
 
+	ctx->mock_void_ptr = CONSTRUCT_MOCK(void, test);
+	if (!ctx->mock_void_ptr)
+		return -EINVAL;
+
 	return 0;
 }
 
@@ -220,6 +249,7 @@ static struct test_case mock_macro_test_cases[] = {
 	TEST_CASE(mock_macro_param_list_from_types_basic),
 	TEST_CASE(mock_macro_arg_names_from_types),
 	TEST_CASE(mock_macro_test_generated_method_code_works),
+	TEST_CASE(mock_macro_test_generated_method_void_code_works),
 	{},
 };
 
diff --git a/kunit/mock.c b/kunit/mock.c
index 314cebb54e236..7a9fcf6ae4a55 100644
--- a/kunit/mock.c
+++ b/kunit/mock.c
@@ -8,6 +8,15 @@
 
 #include <kunit/mock.h>
 
+static int mock_void_ptr_init(struct MOCK(void) *mock_void_ptr)
+{
+	mock_void_ptr->trgt = mock_void_ptr;
+
+	return 0;
+}
+
+DEFINE_STRUCT_CLASS_MOCK_INIT(void, mock_void_ptr_init);
+
 static bool mock_match_params(struct mock_matcher *matcher,
 		       struct test_stream *stream,
 		       const void **params,
-- 
2.19.1.331.ge82ca0e54c-goog
