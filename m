From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Tue, 27 Mar 2018 18:28:04 +0200
Subject: [PATCH 4.15 084/105] selftests/x86/ptrace_syscall: Fix for yet more
 glibc interference
In-Reply-To: <20180327162757.813009222@linuxfoundation.org>
References: <20180327162757.813009222@linuxfoundation.org>
Message-ID: <20180327162803.442514243@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180327162804.dN0i5X4KhQxa41OKLyE4YucBz2WKQQb_ZhPEdjC-FsU@z>

4.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Andy Lutomirski <luto@kernel.org>

commit 4b0b37d4cc54b21a6ecad7271cbc850555869c62 upstream.

glibc keeps getting cleverer, and my version now turns raise() into
more than one syscall.  Since the test relies on ptrace seeing an
exact set of syscalls, this breaks the test.  Replace raise(SIGSTOP)
with syscall(SYS_tgkill, ...) to force glibc to get out of our way.

Signed-off-by: Andy Lutomirski <luto at kernel.org>
Cc: Borislav Petkov <bp at alien8.de>
Cc: Linus Torvalds <torvalds at linux-foundation.org>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: linux-kselftest at vger.kernel.org
Cc: stable at vger.kernel.org
Link: http://lkml.kernel.org/r/bc80338b453afa187bc5f895bd8e2c8d6e264da2.1521300271.git.luto at kernel.org
Signed-off-by: Ingo Molnar <mingo at kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

---
 tools/testing/selftests/x86/ptrace_syscall.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

--- a/tools/testing/selftests/x86/ptrace_syscall.c
+++ b/tools/testing/selftests/x86/ptrace_syscall.c
@@ -183,8 +183,10 @@ static void test_ptrace_syscall_restart(
 		if (ptrace(PTRACE_TRACEME, 0, 0, 0) != 0)
 			err(1, "PTRACE_TRACEME");
 
+		pid_t pid = getpid(), tid = syscall(SYS_gettid);
+
 		printf("\tChild will make one syscall\n");
-		raise(SIGSTOP);
+		syscall(SYS_tgkill, pid, tid, SIGSTOP);
 
 		syscall(SYS_gettid, 10, 11, 12, 13, 14, 15);
 		_exit(0);
@@ -301,9 +303,11 @@ static void test_restart_under_ptrace(vo
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
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
