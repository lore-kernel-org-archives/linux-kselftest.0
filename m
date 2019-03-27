From: sashal@kernel.org (Sasha Levin)
Date: Wed, 27 Mar 2019 14:00:56 -0400
Subject: [PATCH AUTOSEL 5.0 201/262] selftests/bpf: skip verifier tests for
 unsupported program types
In-Reply-To: <20190327180158.10245-1-sashal@kernel.org>
References: <20190327180158.10245-1-sashal@kernel.org>
Message-ID: <20190327180158.10245-201-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190327180056.rEzwBITs9fTmbFFTOJ8GoIf3gAY5YxBqVJocF-zrrnM@z>

From: Stanislav Fomichev <sdf@google.com>

[ Upstream commit 8184d44c9a577a2f1842ed6cc844bfd4a9981d8e ]

Use recently introduced bpf_probe_prog_type() to skip tests in the
test_verifier() if bpf_verify_program() fails. The skipped test is
indicated in the output.

Example:

...
679/p bpf_get_stack return R0 within range SKIP (unsupported program
type 5)
680/p ld_abs: invalid op 1 OK
...
Summary: 863 PASSED, 165 SKIPPED, 3 FAILED

Signed-off-by: Stanislav Fomichev <sdf at google.com>
Signed-off-by: Daniel Borkmann <daniel at iogearbox.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/bpf/test_verifier.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/selftests/bpf/test_verifier.c
index 2fd90d456892..9a967983abed 100644
--- a/tools/testing/selftests/bpf/test_verifier.c
+++ b/tools/testing/selftests/bpf/test_verifier.c
@@ -34,6 +34,7 @@
 #include <linux/if_ether.h>
 
 #include <bpf/bpf.h>
+#include <bpf/libbpf.h>
 
 #ifdef HAVE_GENHDR
 # include "autoconf.h"
@@ -59,6 +60,7 @@
 
 #define UNPRIV_SYSCTL "kernel/unprivileged_bpf_disabled"
 static bool unpriv_disabled = false;
+static int skips;
 
 struct bpf_test {
 	const char *descr;
@@ -15946,6 +15948,11 @@ static void do_test_single(struct bpf_test *test, bool unpriv,
 		pflags |= BPF_F_ANY_ALIGNMENT;
 	fd_prog = bpf_verify_program(prog_type, prog, prog_len, pflags,
 				     "GPL", 0, bpf_vlog, sizeof(bpf_vlog), 1);
+	if (fd_prog < 0 && !bpf_probe_prog_type(prog_type, 0)) {
+		printf("SKIP (unsupported program type %d)\n", prog_type);
+		skips++;
+		goto close_fds;
+	}
 
 	expected_ret = unpriv && test->result_unpriv != UNDEF ?
 		       test->result_unpriv : test->result;
@@ -16099,7 +16106,7 @@ static bool test_as_unpriv(struct bpf_test *test)
 
 static int do_test(bool unpriv, unsigned int from, unsigned int to)
 {
-	int i, passes = 0, errors = 0, skips = 0;
+	int i, passes = 0, errors = 0;
 
 	for (i = from; i < to; i++) {
 		struct bpf_test *test = &tests[i];
-- 
2.19.1
