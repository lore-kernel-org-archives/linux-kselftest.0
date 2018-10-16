From: brendanhiggins@google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:13 -0700
Subject: [RFC v1 24/31] kunit: improved sigsegv stack trace printing
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-25-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181016235113.peF-lfx-FF5z4ORh6WLbNBRJqDsB6KchP9sQwdnEDAo@z>

Sacrificed the control of printing stack trace within the crash handler
in the test runner for getting a better stack trace; this is still not
ideal, but much better than before.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 arch/um/kernel/trap.c | 11 ++++++++++-
 kunit/test.c          | 13 +++++++++----
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
index 9b97712daf14f..c3ff8346800c4 100644
--- a/arch/um/kernel/trap.c
+++ b/arch/um/kernel/trap.c
@@ -226,8 +226,17 @@ unsigned long segv(struct faultinfo fi, unsigned long ip, int is_user,
 		current->thread.segv_regs = container_of(regs, struct pt_regs, regs);
 
 	catcher = current->thread.fault_catcher;
-	if (catcher && current->thread.is_running_test)
+	if (catcher && current->thread.is_running_test) {
+		/*
+		 * TODO(b/77223210): Right now we don't have a way to store a
+		 * copy of the stack, or a copy of information from the stack,
+		 * so we need to print it now; otherwise, the stack will be
+		 * destroyed by segv_run_catcher which works by popping off
+		 * stack frames.
+		 */
+		show_stack(NULL, NULL);
 		segv_run_catcher(catcher, (void *) address);
+	}
 	else if (!is_user && (address >= start_vm) && (address < end_vm)) {
 		flush_tlb_kernel_vm();
 		goto out;
diff --git a/kunit/test.c b/kunit/test.c
index 6ea60059b4918..5d78f76b421af 100644
--- a/kunit/test.c
+++ b/kunit/test.c
@@ -210,12 +210,17 @@ static void test_handle_test_crash(struct test *test,
 				   struct test_module *module,
 				   struct test_case *test_case)
 {
-	test_err(test, "%s crashed", test_case->name);
 	/*
-	 * TODO(brendanhiggins at google.com): This prints the stack trace up
-	 * through this frame, not up to the frame that caused the crash.
+	 * TODO(brendanhiggins at google.com): Right now we don't have a way to
+	 * store a copy of the stack, or a copy of information from the stack,
+	 * so we need to print it in the "trap" handler; otherwise, the stack
+	 * will be destroyed when it returns to us by popping off the
+	 * appropriate stack frames (see longjmp).
+	 *
+	 * Ideally we would print the stack trace here, but we do not have the
+	 * ability to do so with meaningful information at this time.
 	 */
-	show_stack(NULL, NULL);
+	test_err(test, "%s crashed", test_case->name);
 
 	test_case_internal_cleanup(test);
 }
-- 
2.19.1.331.ge82ca0e54c-goog
