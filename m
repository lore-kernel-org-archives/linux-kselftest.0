From: keescook@chromium.org (Kees Cook)
Date: Thu, 11 Apr 2019 16:56:31 -0700
Subject: [PATCH] selftests/seccomp: Handle namespace failures gracefully
Message-ID: <20190411235631.GA31624@beast>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190411235631._Wyh6iLepsWJ8mHtJXN0js4bEOQOhv636g3024uRs00@z>

When running without USERNS or PIDNS the seccomp test would hang since
it was waiting forever for the child to trigger the user notification
since it seems the glibc() abort handler makes a call to getpid(),
which would trap again. This changes the getpid filter to getppid, and
makes sure ASSERTs execute to stop from spawning the listener.

Reported-by: Shuah Khan <shuah at kernel.org>
Fixes: 6a21cc50f0c7 ("seccomp: add a return code to trap to userspace")
Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 43 ++++++++++---------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index f69d2ee29742..3a280b7efc87 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -3079,9 +3079,9 @@ TEST(user_notification_basic)
 
 	/* Check that we get -ENOSYS with no listener attached */
 	if (pid == 0) {
-		if (user_trap_syscall(__NR_getpid, 0) < 0)
+		if (user_trap_syscall(__NR_getppid, 0) < 0)
 			exit(1);
-		ret = syscall(__NR_getpid);
+		ret = syscall(__NR_getppid);
 		exit(ret >= 0 || errno != ENOSYS);
 	}
 
@@ -3096,12 +3096,12 @@ TEST(user_notification_basic)
 	EXPECT_EQ(seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog), 0);
 
 	/* Check that the basic notification machinery works */
-	listener = user_trap_syscall(__NR_getpid,
+	listener = user_trap_syscall(__NR_getppid,
 				     SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);
 
 	/* Installing a second listener in the chain should EBUSY */
-	EXPECT_EQ(user_trap_syscall(__NR_getpid,
+	EXPECT_EQ(user_trap_syscall(__NR_getppid,
 				    SECCOMP_FILTER_FLAG_NEW_LISTENER),
 		  -1);
 	EXPECT_EQ(errno, EBUSY);
@@ -3110,7 +3110,7 @@ TEST(user_notification_basic)
 	ASSERT_GE(pid, 0);
 
 	if (pid == 0) {
-		ret = syscall(__NR_getpid);
+		ret = syscall(__NR_getppid);
 		exit(ret != USER_NOTIF_MAGIC);
 	}
 
@@ -3128,7 +3128,7 @@ TEST(user_notification_basic)
 	EXPECT_GT(poll(&pollfd, 1, -1), 0);
 	EXPECT_EQ(pollfd.revents, POLLOUT);
 
-	EXPECT_EQ(req.data.nr,  __NR_getpid);
+	EXPECT_EQ(req.data.nr,  __NR_getppid);
 
 	resp.id = req.id;
 	resp.error = 0;
@@ -3160,7 +3160,7 @@ TEST(user_notification_kill_in_middle)
 		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
 	}
 
-	listener = user_trap_syscall(__NR_getpid,
+	listener = user_trap_syscall(__NR_getppid,
 				     SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);
 
@@ -3172,7 +3172,7 @@ TEST(user_notification_kill_in_middle)
 	ASSERT_GE(pid, 0);
 
 	if (pid == 0) {
-		ret = syscall(__NR_getpid);
+		ret = syscall(__NR_getppid);
 		exit(ret != USER_NOTIF_MAGIC);
 	}
 
@@ -3282,7 +3282,7 @@ TEST(user_notification_closed_listener)
 		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
 	}
 
-	listener = user_trap_syscall(__NR_getpid,
+	listener = user_trap_syscall(__NR_getppid,
 				     SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);
 
@@ -3293,7 +3293,7 @@ TEST(user_notification_closed_listener)
 	ASSERT_GE(pid, 0);
 	if (pid == 0) {
 		close(listener);
-		ret = syscall(__NR_getpid);
+		ret = syscall(__NR_getppid);
 		exit(ret != -1 && errno != ENOSYS);
 	}
 
@@ -3316,14 +3316,15 @@ TEST(user_notification_child_pid_ns)
 
 	ASSERT_EQ(unshare(CLONE_NEWUSER | CLONE_NEWPID), 0);
 
-	listener = user_trap_syscall(__NR_getpid, SECCOMP_FILTER_FLAG_NEW_LISTENER);
+	listener = user_trap_syscall(__NR_getppid,
+				     SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);
 
 	pid = fork();
 	ASSERT_GE(pid, 0);
 
 	if (pid == 0)
-		exit(syscall(__NR_getpid) != USER_NOTIF_MAGIC);
+		exit(syscall(__NR_getppid) != USER_NOTIF_MAGIC);
 
 	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_RECV, &req), 0);
 	EXPECT_EQ(req.pid, pid);
@@ -3355,7 +3356,8 @@ TEST(user_notification_sibling_pid_ns)
 		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
 	}
 
-	listener = user_trap_syscall(__NR_getpid, SECCOMP_FILTER_FLAG_NEW_LISTENER);
+	listener = user_trap_syscall(__NR_getppid,
+				     SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);
 
 	pid = fork();
@@ -3368,7 +3370,7 @@ TEST(user_notification_sibling_pid_ns)
 		ASSERT_GE(pid2, 0);
 
 		if (pid2 == 0)
-			exit(syscall(__NR_getpid) != USER_NOTIF_MAGIC);
+			exit(syscall(__NR_getppid) != USER_NOTIF_MAGIC);
 
 		EXPECT_EQ(waitpid(pid2, &status, 0), pid2);
 		EXPECT_EQ(true, WIFEXITED(status));
@@ -3377,11 +3379,11 @@ TEST(user_notification_sibling_pid_ns)
 	}
 
 	/* Create the sibling ns, and sibling in it. */
-	EXPECT_EQ(unshare(CLONE_NEWPID), 0);
-	EXPECT_EQ(errno, 0);
+	ASSERT_EQ(unshare(CLONE_NEWPID), 0);
+	ASSERT_EQ(errno, 0);
 
 	pid2 = fork();
-	EXPECT_GE(pid2, 0);
+	ASSERT_GE(pid2, 0);
 
 	if (pid2 == 0) {
 		ASSERT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_RECV, &req), 0);
@@ -3389,7 +3391,7 @@ TEST(user_notification_sibling_pid_ns)
 		 * The pid should be 0, i.e. the task is in some namespace that
 		 * we can't "see".
 		 */
-		ASSERT_EQ(req.pid, 0);
+		EXPECT_EQ(req.pid, 0);
 
 		resp.id = req.id;
 		resp.error = 0;
@@ -3419,14 +3421,15 @@ TEST(user_notification_fault_recv)
 
 	ASSERT_EQ(unshare(CLONE_NEWUSER), 0);
 
-	listener = user_trap_syscall(__NR_getpid, SECCOMP_FILTER_FLAG_NEW_LISTENER);
+	listener = user_trap_syscall(__NR_getppid,
+				     SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);
 
 	pid = fork();
 	ASSERT_GE(pid, 0);
 
 	if (pid == 0)
-		exit(syscall(__NR_getpid) != USER_NOTIF_MAGIC);
+		exit(syscall(__NR_getppid) != USER_NOTIF_MAGIC);
 
 	/* Do a bad recv() */
 	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_RECV, NULL), -1);
-- 
2.17.1


-- 
Kees Cook
