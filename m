From: keescook at chromium.org (Kees Cook)
Date: Thu, 6 Dec 2018 15:50:38 -0800
Subject: [PATCH] selftests/seccomp: Remove SIGSTOP si_pid check
Message-ID: <20181206235038.GA18273@beast>

Commit f149b3155744 ("signal: Never allocate siginfo for SIGKILL or SIGSTOP")
means that the seccomp selftest cannot check si_pid under SIGSTOP anymore.
Since it's believed[1] there are no other userspace things depending on the
old behavior, this removes the behavioral check in the selftest, since it's
more a "extra" sanity check (which turns out, maybe, not to have been
useful to test).

[1] https://lkml.kernel.org/r/CAGXu5jJaZAOzP1qFz66tYrtbuywqb+UN2SOA1VLHpCCOiYvYeg at mail.gmail.com

Reported-by: Tycho Andersen <tycho at tycho.ws>
Suggested-by: Eric W. Biederman <ebiederm at xmission.com>
Signed-off-by: Kees Cook <keescook at chromium.org>
---
Shuah, can you make sure that Linus gets this before v4.20 is released? Thanks!
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index e1473234968d..c9a2abf8be1b 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -2731,9 +2731,14 @@ TEST(syscall_restart)
 	ASSERT_EQ(child_pid, waitpid(child_pid, &status, 0));
 	ASSERT_EQ(true, WIFSTOPPED(status));
 	ASSERT_EQ(SIGSTOP, WSTOPSIG(status));
-	/* Verify signal delivery came from parent now. */
 	ASSERT_EQ(0, ptrace(PTRACE_GETSIGINFO, child_pid, NULL, &info));
-	EXPECT_EQ(getpid(), info.si_pid);
+	/*
+	 * There is no siginfo on SIGSTOP any more, so we can't verify
+	 * signal delivery came from parent now (getpid() == info.si_pid).
+	 * https://lkml.kernel.org/r/CAGXu5jJaZAOzP1qFz66tYrtbuywqb+UN2SOA1VLHpCCOiYvYeg at mail.gmail.com
+	 * At least verify the SIGSTOP via PTRACE_GETSIGINFO.
+	 */
+	EXPECT_EQ(SIGSTOP, info.si_signo);
 
 	/* Restart nanosleep with SIGCONT, which triggers restart_syscall. */
 	ASSERT_EQ(0, kill(child_pid, SIGCONT));
-- 
2.17.1


-- 
Kees Cook
