From: colin.king at canonical.com (Colin King)
Date: Fri, 25 Jan 2019 14:55:26 +0000
Subject: [PATCH][V2] selftests/seccomp: fix test failure on s390x because of
Message-ID: <20190125145526.7106-1-colin.king@canonical.com>

From: Colin Ian King <colin.king at canonical.com>

The error return being placed in regs.SYSCALL_RET is currently positive and
this is causing test failures on s390x. The return value should be -EPERM
rather than EPERM otherwise a failure is not detected and errno is not set
accordingly on s390x.

Fixes: a33b2d0359a0 ("selftests/seccomp: Add tests for basic ptrace actions")
Signed-off-by: Colin Ian King <colin.king at canonical.com>
---

V2: remove misplaced Content-Type and Content-Transfer-Encoding fields

---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 496a9a8c773a..957344884360 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1706,7 +1706,7 @@ void change_syscall(struct __test_metadata *_metadata,
 #ifdef SYSCALL_NUM_RET_SHARE_REG
 		TH_LOG("Can't modify syscall return on this architecture");
 #else
-		regs.SYSCALL_RET = EPERM;
+		regs.SYSCALL_RET = -EPERM;
 #endif
 
 #ifdef HAVE_GETREGS
@@ -1850,7 +1850,7 @@ TEST_F(TRACE_syscall, ptrace_syscall_dropped)
 					   true);
 
 	/* Tracer should skip the open syscall, resulting in EPERM. */
-	EXPECT_SYSCALL_RETURN(EPERM, syscall(__NR_openat));
+	EXPECT_SYSCALL_RETURN(-EPERM, syscall(__NR_openat));
 }
 
 TEST_F(TRACE_syscall, syscall_allowed)
@@ -1894,7 +1894,7 @@ TEST_F(TRACE_syscall, syscall_dropped)
 	ASSERT_EQ(0, ret);
 
 	/* gettid has been skipped and an altered return value stored. */
-	EXPECT_SYSCALL_RETURN(EPERM, syscall(__NR_gettid));
+	EXPECT_SYSCALL_RETURN(-EPERM, syscall(__NR_gettid));
 	EXPECT_NE(self->mytid, syscall(__NR_gettid));
 }
 
-- 
2.19.1
