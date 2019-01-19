From: tycho at tycho.ws (Tycho Andersen)
Date: Fri, 18 Jan 2019 17:12:17 -0700
Subject: [PATCH 6/6] selftests: unshare userns in seccomp pidns testcases
In-Reply-To: <20190119001217.12660-1-tycho@tycho.ws>
References: <20190119001217.12660-1-tycho@tycho.ws>
Message-ID: <20190119001217.12660-7-tycho@tycho.ws>

The pid ns cannot be unshare()d as an unprivileged user without owning the
userns as well. Let's unshare the userns so that we can subsequently
unshare the pidns.

This also means that we don't need to set the no new privs bit as in the
other test cases, since we're unsharing the userns.

Signed-off-by: Tycho Andersen <tycho at tycho.ws>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index a4a7dce1a91b..8f6e95773225 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -3271,7 +3271,7 @@ TEST(user_notification_child_pid_ns)
 	struct seccomp_notif req = {};
 	struct seccomp_notif_resp resp = {};
 
-	ASSERT_EQ(unshare(CLONE_NEWPID), 0);
+	ASSERT_EQ(unshare(CLONE_NEWUSER | CLONE_NEWPID), 0);
 
 	listener = user_trap_syscall(__NR_getpid, SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);
@@ -3308,6 +3308,8 @@ TEST(user_notification_sibling_pid_ns)
 	struct seccomp_notif req = {};
 	struct seccomp_notif_resp resp = {};
 
+	ASSERT_EQ(unshare(CLONE_NEWUSER), 0);
+
 	listener = user_trap_syscall(__NR_getpid, SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);
 
-- 
2.19.1
