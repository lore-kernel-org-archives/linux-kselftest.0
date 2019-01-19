From: tycho at tycho.ws (Tycho Andersen)
Date: Fri, 18 Jan 2019 17:12:13 -0700
Subject: [PATCH 2/6] selftests: fix typo in seccomp_bpf.c
In-Reply-To: <20190119001217.12660-1-tycho@tycho.ws>
References: <20190119001217.12660-1-tycho@tycho.ws>
Message-ID: <20190119001217.12660-3-tycho@tycho.ws>

There used to be an explanation here because it could trigger lockdep
previously, but now we're not doing recursive locking, so it really is just
for grins.

Signed-off-by: Tycho Andersen <tycho at tycho.ws>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 9aba1b904089..912a2a5430dc 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -3035,7 +3035,7 @@ TEST(user_notification_basic)
 	EXPECT_EQ(true, WIFEXITED(status));
 	EXPECT_EQ(0, WEXITSTATUS(status));
 
-	/* Add some no-op filters so for grins. */
+	/* Add some no-op filters for grins. */
 	EXPECT_EQ(seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog), 0);
 	EXPECT_EQ(seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog), 0);
 	EXPECT_EQ(seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog), 0);
-- 
2.19.1
