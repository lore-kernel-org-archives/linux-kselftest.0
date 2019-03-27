From: sashal at kernel.org (Sasha Levin)
Date: Wed, 27 Mar 2019 14:08:55 -0400
Subject: [PATCH AUTOSEL 4.19 103/192] selftests: skip seccomp get_metadata
 test if not real root
In-Reply-To: <20190327181025.13507-1-sashal@kernel.org>
References: <20190327181025.13507-1-sashal@kernel.org>
Message-ID: <20190327181025.13507-103-sashal@kernel.org>

From: Tycho Andersen <tycho at tycho.ws>

[ Upstream commit 3aa415dd2128e478ea3225b59308766de0e94d6b ]

The get_metadata() test requires real root, so let's skip it if we're not
real root.

Note that I used XFAIL here because that's what the test does later if
CONFIG_CHEKCKPOINT_RESTORE happens to not be enabled. After looking at the
code, there doesn't seem to be a nice way to skip tests defined as TEST(),
since there's no return code (I tried exit(KSFT_SKIP), but that didn't work
either...). So let's do it this way to be consistent, and easier to fix
when someone comes along and fixes it.

Signed-off-by: Tycho Andersen <tycho at tycho.ws>
Acked-by: Kees Cook <keescook at chromium.org>
Signed-off-by: Shuah Khan <shuah at kernel.org>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 83057fa9d391..14cad657bc6a 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -2920,6 +2920,12 @@ TEST(get_metadata)
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
