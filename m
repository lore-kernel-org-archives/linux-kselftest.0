From: brendanhiggins at google.com (Brendan Higgins)
Date: Wed, 28 Nov 2018 11:36:27 -0800
Subject: [RFC v3 10/19] kunit: test: add test managed resource tests
In-Reply-To: <20181128193636.254378-1-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
Message-ID: <20181128193636.254378-11-brendanhiggins@google.com>

Tests how tests interact with test managed resources in their lifetime.

Signed-off-by: Avinash Kondareddy <avikr at google.com>
Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 kunit/test-test.c | 121 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 110 insertions(+), 11 deletions(-)

diff --git a/kunit/test-test.c b/kunit/test-test.c
index 88b3bcf9c4e00..36fd95c90a26a 100644
--- a/kunit/test-test.c
+++ b/kunit/test-test.c
@@ -7,31 +7,130 @@
  */
 #include <kunit/test.h>
 
-static void test_test_catches_segfault(struct kunit *test)
+static void kunit_test_catches_segfault(struct kunit *test)
 {
 	void (*invalid_func)(void) = (void (*)(void)) SIZE_MAX;
 
 	KUNIT_ASSERT_SIGSEGV(test, invalid_func());
 }
 
-static int test_test_init(struct kunit *test)
+/*
+ * Context for testing test managed resources
+ * is_resource_initialized is used to test arbitrary resources
+ */
+struct kunit_test_context {
+	struct kunit test;
+	bool is_resource_initialized;
+};
+
+static int fake_resource_init(struct kunit_resource *res, void *context)
 {
+	struct kunit_test_context *ctx = context;
+
+	res->allocation = &ctx->is_resource_initialized;
+	ctx->is_resource_initialized = true;
 	return 0;
 }
 
-static void test_test_exit(struct kunit *test)
+static void fake_resource_free(struct kunit_resource *res)
+{
+	bool *is_resource_initialized = res->allocation;
+
+	*is_resource_initialized = false;
+}
+
+static void kunit_test_init_resources(struct kunit *test)
+{
+	struct kunit_test_context *ctx = test->priv;
+
+	kunit_init_test(&ctx->test, "testing_test_init_test");
+
+	KUNIT_EXPECT_TRUE(test, list_empty(&ctx->test.resources));
+}
+
+static void kunit_test_alloc_resource(struct kunit *test)
+{
+	struct kunit_test_context *ctx = test->priv;
+	struct kunit_resource *res;
+	kunit_resource_free_t free = fake_resource_free;
+
+	res = kunit_alloc_resource(&ctx->test,
+				   fake_resource_init,
+				   fake_resource_free,
+				   ctx);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, res);
+	KUNIT_EXPECT_EQ(test, &ctx->is_resource_initialized, res->allocation);
+	KUNIT_EXPECT_TRUE(test, list_is_last(&res->node, &ctx->test.resources));
+	KUNIT_EXPECT_EQ(test, free, res->free);
+}
+
+static void kunit_test_free_resource(struct kunit *test)
 {
+	struct kunit_test_context *ctx = test->priv;
+	struct kunit_resource *res = kunit_alloc_resource(&ctx->test,
+							  fake_resource_init,
+							  fake_resource_free,
+							  ctx);
+
+	kunit_free_resource(&ctx->test, res);
+
+	KUNIT_EXPECT_EQ(test, false, ctx->is_resource_initialized);
+	KUNIT_EXPECT_TRUE(test, list_empty(&ctx->test.resources));
+}
+
+static void kunit_test_cleanup_resources(struct kunit *test)
+{
+	int i;
+	const int num_res = 5;
+	struct kunit_test_context *ctx = test->priv;
+	struct kunit_resource *resources[num_res];
+
+	for (i = 0; i < num_res; i++) {
+		resources[i] = kunit_alloc_resource(&ctx->test,
+						    fake_resource_init,
+						    fake_resource_free,
+						    ctx);
+	}
+
+	kunit_cleanup(&ctx->test);
+
+	KUNIT_EXPECT_TRUE(test, list_empty(&ctx->test.resources));
+}
+
+static int kunit_test_init(struct kunit *test)
+{
+	struct kunit_test_context *ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	kunit_init_test(&ctx->test, "test_test_context");
+	return 0;
+}
+
+static void kunit_test_exit(struct kunit *test)
+{
+	struct kunit_test_context *ctx = test->priv;
+
+	kunit_cleanup(&ctx->test);
+	kfree(ctx);
 }
 
-static struct kunit_case test_test_cases[] = {
-	KUNIT_CASE(test_test_catches_segfault),
+static struct kunit_case kunit_test_cases[] = {
+	KUNIT_CASE(kunit_test_catches_segfault),
+	KUNIT_CASE(kunit_test_init_resources),
+	KUNIT_CASE(kunit_test_alloc_resource),
+	KUNIT_CASE(kunit_test_free_resource),
+	KUNIT_CASE(kunit_test_cleanup_resources),
 	{},
 };
 
-static struct kunit_module test_test_module = {
-	.name = "test-test",
-	.init = test_test_init,
-	.exit = test_test_exit,
-	.test_cases = test_test_cases,
+static struct kunit_module kunit_test_module = {
+	.name = "kunit-test",
+	.init = kunit_test_init,
+	.exit = kunit_test_exit,
+	.test_cases = kunit_test_cases,
 };
-module_test(test_test_module);
+module_test(kunit_test_module);
-- 
2.20.0.rc0.387.gc7a69e6b6c-goog
