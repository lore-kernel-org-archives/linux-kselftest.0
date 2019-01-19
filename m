From: tycho at tycho.ws (Tycho Andersen)
Date: Fri, 18 Jan 2019 17:12:15 -0700
Subject: [PATCH 4/6] selftests: skip seccomp get_metadata test if not real root
In-Reply-To: <20190119001217.12660-1-tycho@tycho.ws>
References: <20190119001217.12660-1-tycho@tycho.ws>
Message-ID: <20190119001217.12660-5-tycho@tycho.ws>

The get_metadata() test requires real root, so let's skip it if we're not
real root.

Note that I used XFAIL here because that's what the test does later if
CONFIG_CHEKCKPOINT_RESTORE happens to not be enabled. After looking at the
code, there doesn't seem to be a nice way to skip tests defined as TEST(),
since there's no return code (I tried exit(KSFT_SKIP), but that didn't work
either...). So let's do it this way to be consistent, and easier to fix
when someone comes along and fixes it.

Signed-off-by: Tycho Andersen <tycho at tycho.ws>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 912a2a5430dc..ab6b6620f522 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -2929,6 +2929,12 @@ TEST(get_metadata)
 	struct seccomp_metadata md;
 	long ret;
 
+	/* Only real root can get metadata. */
+	if (geteuid()) {
+		XFAIL(return, "get_metadata requires real root");
+		return;
+	}
+
 	ASSERT_EQ(0, pipe(pipefd));
 
 	pid = fork();
-- 
2.19.1
