From: tycho@tycho.ws (Tycho Andersen)
Date: Fri, 18 Jan 2019 17:12:16 -0700
Subject: [PATCH 5/6] selftests: set NO_NEW_PRIVS bit in seccomp user tests
In-Reply-To: <20190119001217.12660-1-tycho@tycho.ws>
References: <20190119001217.12660-1-tycho@tycho.ws>
Message-ID: <20190119001217.12660-6-tycho@tycho.ws>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190119001216.At3j8ntAuhGjvwVMQnDyiTNwV-AGtBfnyNfcepwM3zw@z>

seccomp() doesn't allow users who aren't root in their userns to attach
filters unless they have the nnp bit set, so let's set it so that these
tests can pass when run as an unprivileged user.

This idea stolen from the other seccomp tests, which use this trick :)

Signed-off-by: Tycho Andersen <tycho at tycho.ws>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index ab6b6620f522..a4a7dce1a91b 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -3026,6 +3026,11 @@ TEST(user_notification_basic)
 		.filter = filter,
 	};
 
+	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
+	ASSERT_EQ(0, ret) {
+		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
+	}
+
 	pid = fork();
 	ASSERT_GE(pid, 0);
 
@@ -3107,6 +3112,11 @@ TEST(user_notification_kill_in_middle)
 	struct seccomp_notif req = {};
 	struct seccomp_notif_resp resp = {};
 
+	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
+	ASSERT_EQ(0, ret) {
+		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
+	}
+
 	listener = user_trap_syscall(__NR_getpid,
 				     SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);
@@ -3154,6 +3164,11 @@ TEST(user_notification_signal)
 	struct seccomp_notif_resp resp = {};
 	char c;
 
+	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
+	ASSERT_EQ(0, ret) {
+		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
+	}
+
 	ASSERT_EQ(socketpair(PF_LOCAL, SOCK_SEQPACKET, 0, sk_pair), 0);
 
 	listener = user_trap_syscall(__NR_gettid,
@@ -3219,6 +3234,11 @@ TEST(user_notification_closed_listener)
 	long ret;
 	int status, listener;
 
+	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
+	ASSERT_EQ(0, ret) {
+		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
+	}
+
 	listener = user_trap_syscall(__NR_getpid,
 				     SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);
@@ -3350,6 +3370,10 @@ TEST(user_notification_fault_recv)
 	struct seccomp_notif req = {};
 	struct seccomp_notif_resp resp = {};
 
+	ASSERT_EQ(prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0), 0) {
+		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
+	}
+
 	listener = user_trap_syscall(__NR_getpid, SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);
 
-- 
2.19.1
