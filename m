From: joel@joelfernandes.org (Joel Fernandes (Google))
Date: Tue, 30 Apr 2019 12:21:54 -0400
Subject: [PATCH v2 2/2] Add selftests for pidfd polling
In-Reply-To: <20190430162154.61314-1-joel@joelfernandes.org>
References: <20190430162154.61314-1-joel@joelfernandes.org>
Message-ID: <20190430162154.61314-2-joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190430162154._D0zRyYuaMoYAoWASOINzkA1MLv3b_yFwGcdqItbbsI@z>

Other than verifying pidfd based polling, the tests make sure that
wait semantics are preserved with the pidfd poll. Notably the 2 cases:
1. If a thread group leader exits while threads still there, then no
   pidfd poll notifcation should happen.
2. If a non-thread group leader does an execve, then the thread group
   leader is signaled to exit and is replaced with the execing thread
   as the new leader, however the parent is not notified in this case.

Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 tools/testing/selftests/pidfd/Makefile     |   2 +-
 tools/testing/selftests/pidfd/pidfd_test.c | 210 +++++++++++++++++++++
 2 files changed, 211 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/pidfd/Makefile b/tools/testing/selftests/pidfd/Makefile
index deaf8073bc06..4b31c14f273c 100644
--- a/tools/testing/selftests/pidfd/Makefile
+++ b/tools/testing/selftests/pidfd/Makefile
@@ -1,4 +1,4 @@
-CFLAGS += -g -I../../../../usr/include/
+CFLAGS += -g -I../../../../usr/include/ -lpthread
 
 TEST_GEN_PROGS := pidfd_test
 
diff --git a/tools/testing/selftests/pidfd/pidfd_test.c b/tools/testing/selftests/pidfd/pidfd_test.c
index d59378a93782..8b404ccbc4ff 100644
--- a/tools/testing/selftests/pidfd/pidfd_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_test.c
@@ -4,18 +4,47 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <linux/types.h>
+#include <pthread.h>
 #include <sched.h>
 #include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <syscall.h>
+#include <sys/epoll.h>
+#include <sys/mman.h>
 #include <sys/mount.h>
 #include <sys/wait.h>
+#include <time.h>
 #include <unistd.h>
 
 #include "../kselftest.h"
 
+#define str(s) _str(s)
+#define _str(s) #s
+#define CHILD_THREAD_MIN_WAIT 3 /* seconds */
+
+#define MAX_EVENTS 5
+#ifndef __NR_pidfd_send_signal
+#define __NR_pidfd_send_signal 424
+#endif
+
+#ifndef CLONE_PIDFD
+#define CLONE_PIDFD 0x00001000
+#endif
+
+static pid_t pidfd_clone(int flags, int *pidfd, int (*fn)(void *))
+{
+	size_t stack_size = 1024;
+	char *stack[1024] = { 0 };
+
+#ifdef __ia64__
+	return __clone2(fn, stack, stack_size, flags | SIGCHLD, NULL, pidfd);
+#else
+	return clone(fn, stack + stack_size, flags | SIGCHLD, NULL, pidfd);
+#endif
+}
+
 static inline int sys_pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
 					unsigned int flags)
 {
@@ -368,10 +397,191 @@ static int test_pidfd_send_signal_syscall_support(void)
 	return 0;
 }
 
+static void *test_pidfd_poll_exec_thread(void *priv)
+{
+	ksft_print_msg("Child Thread: starting. pid %d tid %d ; and sleeping\n",
+			getpid(), syscall(SYS_gettid));
+	ksft_print_msg("Child Thread: doing exec of sleep\n");
+
+	execl("/bin/sleep", "sleep", str(CHILD_THREAD_MIN_WAIT), (char *)NULL);
+
+	ksft_print_msg("Child Thread: DONE. pid %d tid %d\n",
+			getpid(), syscall(SYS_gettid));
+	return NULL;
+}
+
+static void poll_pidfd(const char *test_name, int pidfd)
+{
+	int c;
+	int epoll_fd = epoll_create1(EPOLL_CLOEXEC);
+	struct epoll_event event, events[MAX_EVENTS];
+
+	if (epoll_fd == -1)
+		ksft_exit_fail_msg("%s test: Failed to create epoll file descriptor "
+				   "(errno %d)\n",
+				   test_name, errno);
+
+	event.events = EPOLLIN;
+	event.data.fd = pidfd;
+
+	if (epoll_ctl(epoll_fd, EPOLL_CTL_ADD, pidfd, &event)) {
+		ksft_exit_fail_msg("%s test: Failed to add epoll file descriptor "
+				   "(errno %d)\n",
+				   test_name, errno);
+	}
+
+	c = epoll_wait(epoll_fd, events, MAX_EVENTS, 5000);
+	if (c != 1 || !(events[0].events & EPOLLIN))
+		ksft_exit_fail_msg("%s test: Unexpected epoll_wait result (c=%d, events=%x) ",
+				   "(errno %d)\n",
+				   test_name, c, events[0].events, errno);
+
+	close(epoll_fd);
+	return;
+
+}
+
+static int child_poll_exec_test(void *args)
+{
+	pthread_t t1;
+
+	ksft_print_msg("Child (pidfd): starting. pid %d tid %d\n", getpid(),
+			syscall(SYS_gettid));
+	pthread_create(&t1, NULL, test_pidfd_poll_exec_thread, NULL);
+	/*
+	 * Exec in the non-leader thread will destroy the leader immediately.
+	 * If the wait in the parent returns too soon, the test fails.
+	 */
+	while (1)
+		sleep(1);
+}
+
+static int test_pidfd_poll_exec(int use_waitpid)
+{
+	int pid, pidfd = 0;
+	int status, ret;
+	pthread_t t1;
+	time_t prog_start = time(NULL);
+	const char *test_name = "pidfd_poll check for premature notification on child thread exec";
+
+	ksft_print_msg("Parent: pid: %d\n", getpid());
+	pid = pidfd_clone(CLONE_PIDFD, &pidfd, child_poll_exec_test);
+	if (pid < 0)
+		ksft_exit_fail_msg("%s test: pidfd_clone failed (ret %d, errno %d)\n",
+				   test_name, pid, errno);
+
+	ksft_print_msg("Parent: Waiting for Child (%d) to complete.\n", pid);
+
+	if (use_waitpid) {
+		ret = waitpid(pid, &status, 0);
+		if (ret == -1)
+			ksft_print_msg("Parent: error\n");
+
+		if (ret == pid)
+			ksft_print_msg("Parent: Child process waited for.\n");
+	} else {
+		poll_pidfd(test_name, pidfd);
+	}
+
+	time_t prog_time = time(NULL) - prog_start;
+
+	ksft_print_msg("Time waited for child: %lu\n", prog_time);
+
+	close(pidfd);
+
+	if (prog_time < CHILD_THREAD_MIN_WAIT || prog_time > CHILD_THREAD_MIN_WAIT + 2)
+		ksft_exit_fail_msg("%s test: Failed\n", test_name);
+	else
+		ksft_test_result_pass("%s test: Passed\n", test_name);
+}
+
+static void *test_pidfd_poll_leader_exit_thread(void *priv)
+{
+	ksft_print_msg("Child Thread: starting. pid %d tid %d ; and sleeping\n",
+			getpid(), syscall(SYS_gettid));
+	sleep(CHILD_THREAD_MIN_WAIT);
+	ksft_print_msg("Child Thread: DONE. pid %d tid %d\n", getpid(), syscall(SYS_gettid));
+	return NULL;
+}
+
+static time_t *child_exit_secs;
+static int child_poll_leader_exit_test(void *args)
+{
+	pthread_t t1, t2;
+
+	ksft_print_msg("Child: starting. pid %d tid %d\n", getpid(), syscall(SYS_gettid));
+	pthread_create(&t1, NULL, test_pidfd_poll_leader_exit_thread, NULL);
+	pthread_create(&t2, NULL, test_pidfd_poll_leader_exit_thread, NULL);
+
+	/*
+	 * glibc exit calls exit_group syscall, so explicity call exit only
+	 * so that only the group leader exits, leaving the threads alone.
+	 */
+	*child_exit_secs = time(NULL);
+	syscall(SYS_exit, 0);
+}
+
+static int test_pidfd_poll_leader_exit(int use_waitpid)
+{
+	int pid, pidfd = 0;
+	int status, ret;
+	time_t prog_start = time(NULL);
+	const char *test_name = "pidfd_poll check for premature notification on non-empty"
+				"group leader exit";
+
+	child_exit_secs = mmap(NULL, sizeof *child_exit_secs, PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+
+	if (child_exit_secs == MAP_FAILED)
+		ksft_exit_fail_msg("%s test: mmap failed (errno %d)\n",
+				   test_name, errno);
+
+	ksft_print_msg("Parent: pid: %d\n", getpid());
+	pid = pidfd_clone(CLONE_PIDFD, &pidfd, child_poll_leader_exit_test);
+	if (pid < 0)
+		ksft_exit_fail_msg("%s test: pidfd_clone failed (ret %d, errno %d)\n",
+				   test_name, pid, errno);
+
+	ksft_print_msg("Parent: Waiting for Child (%d) to complete.\n", pid);
+
+	if (use_waitpid) {
+		ret = waitpid(pid, &status, 0);
+		if (ret == -1)
+			ksft_print_msg("Parent: error\n");
+	} else {
+		/*
+		 * This sleep tests for the case where if the child exits, and is in
+		 * EXIT_ZOMBIE, but the thread group leader is non-empty, then the poll
+		 * doesn't prematurely return even though there are active threads
+		 */
+		sleep(1);
+		poll_pidfd(test_name, pidfd);
+	}
+
+	if (ret == pid)
+		ksft_print_msg("Parent: Child process waited for.\n");
+
+	time_t since_child_exit = time(NULL) - *child_exit_secs;
+
+	ksft_print_msg("Time since child exit: %lu\n", since_child_exit);
+
+	close(pidfd);
+
+	if (since_child_exit < CHILD_THREAD_MIN_WAIT ||
+			since_child_exit > CHILD_THREAD_MIN_WAIT + 2)
+		ksft_exit_fail_msg("%s test: Failed\n", test_name);
+	else
+		ksft_test_result_pass("%s test: Passed\n", test_name);
+}
+
 int main(int argc, char **argv)
 {
 	ksft_print_header();
 
+	test_pidfd_poll_exec(0);
+	test_pidfd_poll_exec(1);
+	test_pidfd_poll_leader_exit(0);
+	test_pidfd_poll_leader_exit(1);
 	test_pidfd_send_signal_syscall_support();
 	test_pidfd_send_signal_simple_success();
 	test_pidfd_send_signal_exited_fail();
-- 
2.21.0.593.g511ec345e18-goog
