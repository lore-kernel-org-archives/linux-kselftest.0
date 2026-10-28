Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220140;
	b=UEuXA7MFgWbBREXcYZB/X/sBF+9Yaxi2/ZHVU83NkN/Mu1/6DDO9iQMXyFJ0rI93DjJR
	 HHBuKpQ0HCGVBAo8v7F5d6BsldlTTaxqH92dKLmIqbrnNfvB991XOZO5cIn+daB4b8kK2
	 NBDarlB7d6Pmj1D/lc1J1QS6HhdjObgd0g92vQVBQZzoa2hcFqXmEdnOiRfAMKzoAljbo
	 w0qSa4C/Z1ZC+VjmWS95SF2tjAPaUsYu2uSRXaoAxggZwRTEqD8bXWY0hSxkJxAtbAtbV
	 TbHSA9lfC5A6kclDfnRc1HH9JA5GzYxpROgQTHYfDv8Af1KbJpggBqXnRSRjnnBtVFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220140;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GxD9hz7DbSlAKPetlsNqIgbSI8QMjZ9+rx7P6O636mQ=;
	b=II/8EjYusdb20p+He69tMeboPx7r+RP7RaTnYLTUh09mM97YE8bFjNZPhvkwwN+0cp12
	 a7MOlLwvgLFkOMJR9wa+31BYI73ZzZxMQvoA1JauY05J7vldnARIukaU72Q3TiM3tHwB0
	 M6urhknQNeS10QrF3y+AxMhbeNcWC1cTJ0fL99zstX7gQnDhboBk1PwGN929H07jupXVR
	 k3SUjJ3iJy7VgvDnChZtjmRJs/YonBupQkJxJv7OaeBTEBrQZRNrQgrrzV/w1JDSvIwA3
	 CtkGSaVz+vjNmYkT7T6yHm3DsntkaBwN9YOTw46FZb3tgbEGJdBhK08nBjDOPewA7bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qQItYzFy;
	arc=none smtp.remote-ip=91.218.175.208
Received: from mta0.migadu.com (out-208.mta0.migadu.com [91.218.175.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E47606A332
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E47606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qQItYzFy
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P7ClftA2O5W4y/SvUnBo2NZX+f8e/aWjO570hZQUAEo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793220133; v=1; x=1793824933;
 b=qQItYzFy8XVkRejaRkyBC2v3RqU1KlFL6Q4LuSBlOqu8HfGEYhNKIPDk/sOy7DfF4SxiobNe
 et52TrHM4Vte6PKkfHnaQUd9GJcpsYVrPfQA8++qA6F9+i1K+AAT1cbLGMXqMEqhDpgYHoA/qTo
 TefTupgxupB97GZwPTWzjzv0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5f9b19efa45d1cf4;
	Wed, 28 Oct 2026 20:42:13 +0000
X-Mizu-Trace-ID: 5f9b19efa45d1cf4
X-Migadu-Flow: FLOW_OUT
From: Vineet Gupta <vineet.gupta@linux.dev>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	jose.marchesi@oracle.com,
	david.faust@oss.qualcomm.com,
	Vineet Gupta <vineet.gupta@linux.dev>
Subject: [PATCH bpf-next v2 1/8] selftests/bpf: Build callx tests with GCC that defines __BPF_FEATURE_CALLX
Date: Wed, 28 Oct 2026 13:41:51 -0700
Message-ID: <20261028204158.1021284-2-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028204158.1021284-1-vineet.gupta@linux.dev>
References: <20261028204158.1021284-1-vineet.gupta@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7cd1f73b37ea ("selftests/bpf: Fix build of callx tests with GCC")
gated the callx progs on __clang__. GCC had indirect call support which was
recently refurbished along with a __BPF_FEATURE_CALLX macro [1], so gate
on that as well so once this GCC is released, the tests start passing.

Put the arch and compiler conditions in a CAN_USE_CALLX macro in
bpf_misc.h, and use it all the test programs.

While at it, mark the placeholder programs left for unsupported
toolchains and arches with __skip(), so they report SKIP rather than OK.

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=ffe3ead4a8ad704b557b0cfa4f823df647c65a0d

Measured on bpf-next with a stock bpf-gcc that defines
__BPF_FEATURE_CALLX, test_progs before and after: 76 subtests run that
previously did not exist in the report, 75 OK and one @unpriv SKIP,
with no failures.  The two dummy placeholders retire and
callx_rodata_lskel goes SKIP -> OK.

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
 .../testing/selftests/bpf/prog_tests/callx_rodata_lskel.c  | 2 +-
 tools/testing/selftests/bpf/progs/bpf_misc.h               | 7 +++++++
 tools/testing/selftests/bpf/progs/callx_rodata.c           | 4 ++--
 tools/testing/selftests/bpf/progs/verifier_callx.c         | 5 ++---
 tools/testing/selftests/bpf/progs/verifier_callx_rodata.c  | 5 ++---
 5 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c b/tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c
index f6ef67c3141e..acd821fb568f 100644
--- a/tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c
+++ b/tools/testing/selftests/bpf/prog_tests/callx_rodata_lskel.c
@@ -36,7 +36,7 @@ static void __test_callx_rodata_lskel(void)
 	if (!ASSERT_OK_PTR(skel, "open"))
 		return;
 
-	/* gcc doesn't support indirect calls */
+	/* toolchain or JIT can't do callx */
 	if (skel->rodata->skip) {
 		test__skip();
 		goto out;
diff --git a/tools/testing/selftests/bpf/progs/bpf_misc.h b/tools/testing/selftests/bpf/progs/bpf_misc.h
index d7f706c3bc4a..1b264480e128 100644
--- a/tools/testing/selftests/bpf/progs/bpf_misc.h
+++ b/tools/testing/selftests/bpf/progs/bpf_misc.h
@@ -295,6 +295,13 @@
 #define CAN_USE_LOAD_ACQ_STORE_REL
 #endif
 
+/* clang always emits callx, gcc only when it defines __BPF_FEATURE_CALLX */
+#if (defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) ||	\
+     (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) &&		\
+	(defined(__clang__) || defined(__BPF_FEATURE_CALLX))
+#define CAN_USE_CALLX
+#endif
+
 #if defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86)
 #define SPEC_V1
 #endif
diff --git a/tools/testing/selftests/bpf/progs/callx_rodata.c b/tools/testing/selftests/bpf/progs/callx_rodata.c
index e3f8335f80f8..8c28f01b7113 100644
--- a/tools/testing/selftests/bpf/progs/callx_rodata.c
+++ b/tools/testing/selftests/bpf/progs/callx_rodata.c
@@ -4,13 +4,14 @@
 #include <stdbool.h>
 #include <linux/bpf.h>
 #include <bpf/bpf_helpers.h>
+#include "bpf_misc.h"
 
 /* set by user space before the programs are loaded, it's in .rodata too */
 const volatile int bias = 1;
 
 int op_idx;
 
-#ifdef __clang__
+#ifdef CAN_USE_CALLX
 
 const volatile bool skip = false;
 
@@ -48,7 +49,6 @@ int both_ops(void *ctx)
 
 #else
 
-/* gcc doesn't support indirect calls */
 const volatile bool skip = true;
 
 SEC("socket")
diff --git a/tools/testing/selftests/bpf/progs/verifier_callx.c b/tools/testing/selftests/bpf/progs/verifier_callx.c
index 7e59188d9fca..ca1aef34ab72 100644
--- a/tools/testing/selftests/bpf/progs/verifier_callx.c
+++ b/tools/testing/selftests/bpf/progs/verifier_callx.c
@@ -6,9 +6,7 @@
 #include "bpf_misc.h"
 #include "../../../include/linux/filter.h"
 
-/* gcc doesn't support indirect calls */
-#if defined(__clang__) && (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
-    (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
+#ifdef CAN_USE_CALLX
 
 #define CALLX_INSN(DST, SRC, OFF, IMM) \
 	BPF_RAW_INSN(BPF_JMP | BPF_CALL | BPF_X, DST, SRC, OFF, IMM)
@@ -1075,6 +1073,7 @@ int callx_c_ops_on_stack(void *ctx)
 #else
 
 SEC("socket")
+__skip("callx needs arch JIT and compiler support")
 __success
 int dummy(void *ctx)
 {
diff --git a/tools/testing/selftests/bpf/progs/verifier_callx_rodata.c b/tools/testing/selftests/bpf/progs/verifier_callx_rodata.c
index 6cf58ca9ac5b..ab3e3b64616b 100644
--- a/tools/testing/selftests/bpf/progs/verifier_callx_rodata.c
+++ b/tools/testing/selftests/bpf/progs/verifier_callx_rodata.c
@@ -6,9 +6,7 @@
 #include "bpf_misc.h"
 #include "../../../include/linux/filter.h"
 
-/* gcc doesn't support indirect calls */
-#if defined(__clang__) && (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
-    (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
+#ifdef CAN_USE_CALLX
 
 /*
  * Read-only data with pointers to functions, where the compiler puts tables
@@ -892,6 +890,7 @@ int callx_c_packed_struct(void *ctx)
 #else
 
 SEC("socket")
+__skip("callx needs arch JIT and compiler support")
 __success
 int dummy(void *ctx)
 {
-- 
2.53.0-Meta

