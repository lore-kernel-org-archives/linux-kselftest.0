From: luto at kernel.org (Andy Lutomirski)
Date: Sat, 17 Mar 2018 08:25:07 -0700
Subject: [PATCH] selftests/x86/ptrace_syscall: Fix for yet more glibc
 interference
Message-ID: <bc80338b453afa187bc5f895bd8e2c8d6e264da2.1521300271.git.luto@kernel.org>

glibc keeps getting cleverer, and my version now turns raise() into
more than one syscall.  Since the test relies on ptrace seeing an
exact set of syscalls, this breaks the test.  Replace raise(SIGSTOP)
with syscall(SYS_tgkill, ...) to force glibc to get out of our way.

Cc: stable at vger.kernel.org
Signed-off-by: Andy Lutomirski <luto at kernel.org>
---
 tools/testing/selftests/x86/ptrace_syscall.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/x86/ptrace_syscall.c b/tools/testing/selftests/x86/ptrace_syscall.c
index 1ae1c5a7392e..6f22238f3217 100644
--- a/tools/testing/selftests/x86/ptrace_syscall.c
+++ b/tools/testing/selftests/x86/ptrace_syscall.c
@@ -183,8 +183,10 @@ static void test_ptrace_syscall_restart(void)
 		if (ptrace(PTRACE_TRACEME, 0, 0, 0) != 0)
 			err(1, "PTRACE_TRACEME");
 
+		pid_t pid = getpid(), tid = syscall(SYS_gettid);
+
 		printf("\tChild will make one syscall\n");
-		raise(SIGSTOP);
+		syscall(SYS_tgkill, pid, tid, SIGSTOP);
 
 		syscall(SYS_gettid, 10, 11, 12, 13, 14, 15);
 		_exit(0);
@@ -301,9 +303,11 @@ static void test_restart_under_ptrace(void)
 		if (ptrace(PTRACE_TRACEME, 0, 0, 0) != 0)
 			err(1, "PTRACE_TRACEME");
 
+		pid_t pid = getpid(), tid = syscall(SYS_gettid);
+
 		printf("\tChild will take a nap until signaled\n");
 		setsigign(SIGUSR1, SA_RESTART);
-		raise(SIGSTOP);
+		syscall(SYS_tgkill, pid, tid, SIGSTOP);
 
 		syscall(SYS_pause, 0, 0, 0, 0, 0, 0);
 		_exit(0);
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
