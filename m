From: keescook at chromium.org (Kees Cook)
Date: Sun, 27 Jan 2019 01:43:57 -0800
Subject: [PATCH] selftests/seccomp: Actually sleep for 1/10th second
Message-ID: <20190127094357.GA9436@beast>

Clang noticed that some none-zero sleep()s were actually using zero
anyway. This switches to nanosleep() to gain sub-second granularity.

seccomp_bpf.c:2625:9: warning: implicit conversion from 'double' to
      'unsigned int' changes value from 0.1 to 0 [-Wliteral-conversion]
                sleep(0.1);
                ~~~~~ ^~~

Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 067cb4607d6c..a9f278c13f13 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -2569,6 +2569,7 @@ TEST_F(TSYNC, two_siblings_not_under_filter)
 {
 	long ret, sib;
 	void *status;
+	struct timespec delay = { .tv_nsec = 100000000 };
 
 	ASSERT_EQ(0, prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0)) {
 		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
@@ -2622,7 +2623,7 @@ TEST_F(TSYNC, two_siblings_not_under_filter)
 	EXPECT_EQ(SIBLING_EXIT_UNKILLED, (long)status);
 	/* Poll for actual task death. pthread_join doesn't guarantee it. */
 	while (!kill(self->sibling[sib].system_tid, 0))
-		sleep(0.1);
+		nanosleep(&delay, NULL);
 	/* Switch to the remaining sibling */
 	sib = !sib;
 
@@ -2647,7 +2648,7 @@ TEST_F(TSYNC, two_siblings_not_under_filter)
 	EXPECT_EQ(0, (long)status);
 	/* Poll for actual task death. pthread_join doesn't guarantee it. */
 	while (!kill(self->sibling[sib].system_tid, 0))
-		sleep(0.1);
+		nanosleep(&delay, NULL);
 
 	ret = seccomp(SECCOMP_SET_MODE_FILTER, SECCOMP_FILTER_FLAG_TSYNC,
 		      &self->apply_prog);
-- 
2.17.1


-- 
Kees Cook
