From: brendanhiggins at google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:00 -0700
Subject: [RFC v1 11/31] kunit: test: added concept of post conditions
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-12-brendanhiggins@google.com>

Adds a way to specify that certain conditions must be met at the end of
a test case.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 include/kunit/test.h |  6 ++++++
 kunit/test.c         | 13 ++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 58dbe2aee423f..be2b11117d1de 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -158,6 +158,11 @@ struct test_initcall {
 	void (*exit)(struct test_initcall *this);
 };
 
+struct test_post_condition {
+	struct list_head node;
+	void (*validate)(struct test_post_condition *condition);
+};
+
 /**
  * struct test - represents a running instance of a test.
  * @priv: for user to store arbitrary data. Commonly used to pass data created
@@ -177,6 +182,7 @@ struct test {
 	bool success; /* Protected by lock. */
 	bool death_test; /* Protected by lock. */
 	struct list_head resources; /* Protected by lock. */
+	struct list_head post_conditions;
 	void (*set_death_test)(struct test *test, bool death_test);
 	void (*vprintk)(const struct test *test,
 			const char *level,
diff --git a/kunit/test.c b/kunit/test.c
index 9737465fb0568..6ea60059b4918 100644
--- a/kunit/test.c
+++ b/kunit/test.c
@@ -125,8 +125,9 @@ static void __noreturn test_abort(struct test *test)
 
 int test_init_test(struct test *test, const char *name)
 {
-	spin_lock_init(&test->lock);
 	INIT_LIST_HEAD(&test->resources);
+	INIT_LIST_HEAD(&test->post_conditions);
+	spin_lock_init(&test->lock);
 	test->name = name;
 	test->set_death_test = test_set_death_test;
 	test->vprintk = test_vprintk;
@@ -186,6 +187,16 @@ static void test_run_case_cleanup(struct test *test,
 				  struct test_module *module,
 				  struct test_case *test_case)
 {
+	struct test_post_condition *condition, *condition_safe;
+
+	list_for_each_entry_safe(condition,
+				 condition_safe,
+				 &test->post_conditions,
+				 node) {
+		condition->validate(condition);
+		list_del(&condition->node);
+	}
+
 	if (module->exit)
 		module->exit(test);
 
-- 
2.19.1.331.ge82ca0e54c-goog
