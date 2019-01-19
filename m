From: tycho@tycho.ws (Tycho Andersen)
Date: Fri, 18 Jan 2019 17:12:12 -0700
Subject: [PATCH 1/6] selftests: don't kill child immediately in get_metadata()
 test
In-Reply-To: <20190119001217.12660-1-tycho@tycho.ws>
References: <20190119001217.12660-1-tycho@tycho.ws>
Message-ID: <20190119001217.12660-2-tycho@tycho.ws>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190119001212.UFEJ9jFIbadgSf0cKaal343BnkpaHYWqo0pMhsL_uPA@z>

This this test forks a child, and then the parent waits for a write() to a
pipe signalling the child is ready to be attached to. If something in the
child ASSERTs before it does this write, the test will hang waiting for it.
Instead, let's EXPECT, so that execution continues until we do the write.
Any failure after that is fine and can ASSERT.

Signed-off-by: Tycho Andersen <tycho at tycho.ws>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 496a9a8c773a..9aba1b904089 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -2943,11 +2943,11 @@ TEST(get_metadata)
 		};
 
 		/* one with log, one without */
-		ASSERT_EQ(0, seccomp(SECCOMP_SET_MODE_FILTER,
+		EXPECT_EQ(0, seccomp(SECCOMP_SET_MODE_FILTER,
 				     SECCOMP_FILTER_FLAG_LOG, &prog));
-		ASSERT_EQ(0, seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog));
+		EXPECT_EQ(0, seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog));
 
-		ASSERT_EQ(0, close(pipefd[0]));
+		EXPECT_EQ(0, close(pipefd[0]));
 		ASSERT_EQ(1, write(pipefd[1], "1", 1));
 		ASSERT_EQ(0, close(pipefd[1]));
 
-- 
2.19.1
