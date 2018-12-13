From: sashal@kernel.org (Sasha Levin)
Date: Wed, 12 Dec 2018 23:27:48 -0500
Subject: [PATCH AUTOSEL 4.19 23/73] bpf: Fix verifier log string check for bad
 alignment.
In-Reply-To: <20181213042838.75160-1-sashal@kernel.org>
References: <20181213042838.75160-1-sashal@kernel.org>
Message-ID: <20181213042838.75160-23-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181213042748.b89b0ZwVtBC1P5ujKvPgiL_1OUt8db8sVjIAaYqq2m0@z>

From: David Miller <davem@davemloft.net>

[ Upstream commit c01ac66b38660f2b507ccd0b75d28e3002d56fbb ]

The message got changed a lot time ago.

This was responsible for 36 test case failures on sparc64.

Fixes: f1174f77b50c ("bpf/verifier: rework value tracking")
Signed-off-by: David S. Miller <davem at davemloft.net>
Signed-off-by: Alexei Starovoitov <ast at kernel.org>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/bpf/test_verifier.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/selftests/bpf/test_verifier.c
index 67c412d19c09..d80c36465c1c 100644
--- a/tools/testing/selftests/bpf/test_verifier.c
+++ b/tools/testing/selftests/bpf/test_verifier.c
@@ -12746,7 +12746,7 @@ static void do_test_single(struct bpf_test *test, bool unpriv,
 
 	reject_from_alignment = fd_prog < 0 &&
 				(test->flags & F_NEEDS_EFFICIENT_UNALIGNED_ACCESS) &&
-				strstr(bpf_vlog, "Unknown alignment.");
+				strstr(bpf_vlog, "misaligned");
 #ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 	if (reject_from_alignment) {
 		printf("FAIL\nFailed due to alignment despite having efficient unaligned access: '%s'!\n",
-- 
2.19.1
