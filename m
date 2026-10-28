Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793145910;
	b=hLUg3ysr3F/XASYTuv9WLV/jVZwjGNx04Alq278LmLaepmh3Z1iWZ/JffAakc1pjsoV/
	 xc3fdLdDtBQl3sy0fqTWG5VlvV3T7Ur9xySOUxp9VxjJFKrtQNECK7ow/jIZllOdJzLmn
	 zPW6lUP5swqMUX5BRbUL727xnyhTPyqmRJrnkNRTYvm1YhQdTS1hjRJ6G6iryKRoweV2s
	 GOs1QuoforMQqKxYptkPMOJNJQ44WyS6LY8DcOCiZ3uBtG5X9u2ASNHoA+n6aiWlDIT1g
	 E9bEqs3bMOoqW8+//vzRTZJ/cVj9v7IzYKHZhvuaoQ3hNDs5qVzGaysiqzy8fZgSlnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793145910;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LpfshKx9r3VUKJpK4IAmx+D8pUxvMc3zcV//VOwsUHM=;
	b=BAw8VYkewj1EAecJmWuXyi2+MUfoogmTsNWARZLe1GRR3GuJ58k7j3bTHGanX0jbfZYe
	 qsg2/sZYtcQdikzqo59MfS5qsw0jtJSXz+Wuawm23DdO1uSwNgteLIvvbGn+5mTffxD+F
	 K0oS914oHWQOWHGnGICRPbcSCgMkIw2vO5Ck0+O148QTWBkBjc0YelQNxmAB47nzfLieL
	 85AyJDLEXwHnDfqJQYH7Dke+M79jCHB9lv2vM6KOdYeAiQCtHiIfA2E2+SC6XFLVRK4Td
	 5UDZueep4eWvr4VtF7z4LaNQGjZmpCiXU4uvmDFAhWd0pfEuazzHZulo5sR8GszVrkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xnxQuqcG;
	arc=none smtp.remote-ip=91.218.175.20
Received: from mta0.migadu.com (out-20.mta0.migadu.com [91.218.175.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE822606A31E
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 00:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE822606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xnxQuqcG
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6brww2x3JHuxuisQJDKfBncVXg9MZoFkRgEqMdU4ia4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793145908; v=1; x=1793750708;
 b=xnxQuqcGadBwoNNE48/S8+/zSI5my4sFZDsbB1gTDc+hTwL1Aajqtu+S8DO1DO4gYvJX1yA+
 KCh3P2v3+/f30j6hExe+5qG553f8Hvbvsgg1tKDs1Lq98XErLqVgoAoPO2U9zCyDklPemIqOF+Y
 mYJaV7+1IrvDnqgzTCK3vjOY=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c17dda34776e8be8;
	Wed, 28 Oct 2026 00:05:06 +0000
X-Mizu-Trace-ID: c17dda34776e8be8
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
Subject: [PATCH bpf-next v1 7/7] selftests/bpf: write the mixed arena/scalar ALU tests in asm
Date: Tue, 27 Oct 2026 17:04:11 -0700
Message-ID: <20261028000411.4010967-8-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
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

They fail to build with BPF_GCC:

  progs/verifier_arena.c:566:5: error: optimization may eliminate reads and/or writes to register variables [-Werror=volatile-register-var]

for

  volatile register __u64 reg asm("r3");

GCC means it: with the warning silenced it drops both scalar accesses,
leaving nothing that uses r3 as a scalar:

  call	7
  if w0 == 0 goto .L136
  r9 = arena ll;r3 = 0;r3 = addr_space_cast(r3, 0, 1);
  .L136:
  r0 = 0
  exit

`reg = 1ULL << 32' and `reg += 1' are both gone.  The tests need one
instruction reached with r3 live as a scalar on one path and as an
arena pointer on the other; what is left gives the verifier no reason
to reject anything, so the __failure expectation would not hold.  A
local register variable is not guaranteed to survive a helper call
either, which GCC is also entitled to act on.

Nothing here needs a compiler to allocate registers, so write the
whole body in asm like mixed_arena_stack_atomic below, which tests the
same shape.  Both compilers then emit the same sequence, with the
branch landing on the shared ALU op:

  call 7
  r6=r0
  r3=1
  r3<<=32
  if w6==0 goto 4          <- lands on r3+=1
  r9=0 ll
  r3=0
  r3 = addr_space_cast(r3, 0, 1)
  r3+=1                    <- scalar on one path, arena pointer on the other
  r0=0
  exit

Take __load_if_JITed() from the sibling while here.  A program binding
an arena map is rejected in check_map_prog_compatibility() with "JIT is
required to use arena" during map resolution, before do_check() can
reach the shared instruction, so without a JIT these would fail on the
wrong message rather than skip.

Not exercised by a stock bpf-gcc, which compiles both tests out with the
rest of the arena block; the build failure above needs a compiler that
has arena support.  Under clang the rewrite is not a no-op either: the
pre-image spilled r3 to the stack and did the shared ALU op on r1
reloaded from it, so the test was not exercising one register live as
both a scalar and an arena pointer.

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
 .../selftests/bpf/progs/verifier_arena.c      | 85 ++++++++++---------
 1 file changed, 45 insertions(+), 40 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_arena.c b/tools/testing/selftests/bpf/progs/verifier_arena.c
index 21b66d51c61e..b84d8f1e0b39 100644
--- a/tools/testing/selftests/bpf/progs/verifier_arena.c
+++ b/tools/testing/selftests/bpf/progs/verifier_arena.c
@@ -539,53 +539,58 @@ int arena_ptr_add_arena_ptr(void *ctx)
 	return 0;
 }
 
+/*
+ * The r9 load is never read; it is there so libbpf records the arena map
+ * as used, which is what lets the verifier accept addr_space_cast at all.
+ */
 SEC("syscall")
 __failure __msg("same insn cannot be used with and without arena pointer")
-int mixed_arena_scalar_alu64_scalar_first(void *ctx)
-{
-	volatile register __u64 reg asm("r3");
-	__u32 pick_arena = bpf_get_prandom_u32();
-
-	reg = 1ULL << 32;
-
-	if (pick_arena) {
-		asm volatile (
-			"r9 = %[arena] ll;"
-			"%[reg] = 0;"
-			"%[reg] = addr_space_cast(%[reg], 0x0, 0x1);"
-			: [reg] "=r"(reg)
-			: __imm_addr(arena)
-			: "r9"
-		);
-	}
-
-	reg += 1;
-
-	return 0;
+__load_if_JITed()
+__naked void mixed_arena_scalar_alu64_scalar_first(void)
+{
+	asm volatile ("					\
+	call %[bpf_get_prandom_u32];			\
+	r6 = r0;					\
+	r3 = 1;						\
+	r3 <<= 32;					\
+	if w6 == 0 goto 1f;				\
+	r9 = %[arena] ll;				\
+	r3 = 0;						\
+	r3 = addr_space_cast(r3, 0, 1);			\
+1:	r3 += 1;					\
+	r0 = 0;						\
+	exit;						\
+"	:
+	: __imm_addr(arena),
+	  __imm(bpf_get_prandom_u32)
+	: __clobber_all);
 }
 
+/*
+ * The r9 load is never read; it is there so libbpf records the arena map
+ * as used, which is what lets the verifier accept addr_space_cast at all.
+ */
 SEC("syscall")
 __failure __msg("same insn cannot be used with and without arena pointer")
-int mixed_arena_scalar_alu64_arena_first(void *ctx)
+__load_if_JITed()
+__naked void mixed_arena_scalar_alu64_arena_first(void)
 {
-	volatile register __u64 reg asm("r3");
-	__u32 pick_scalar = bpf_get_prandom_u32();
-
-	asm volatile (
-		"r9 = %[arena] ll;"
-		"%[reg] = 0;"
-		"%[reg] = addr_space_cast(%[reg], 0x0, 0x1);"
-		: [reg] "=r"(reg)
-		: __imm_addr(arena)
-		: "r9"
-	);
-
-	if (pick_scalar)
-		reg = 1ULL << 32;
-
-	reg += 1;
-
-	return 0;
+	asm volatile ("					\
+	call %[bpf_get_prandom_u32];			\
+	r6 = r0;					\
+	r9 = %[arena] ll;				\
+	r3 = 0;						\
+	r3 = addr_space_cast(r3, 0, 1);			\
+	if w6 == 0 goto 1f;				\
+	r3 = 1;						\
+	r3 <<= 32;					\
+1:	r3 += 1;					\
+	r0 = 0;						\
+	exit;						\
+"	:
+	: __imm_addr(arena),
+	  __imm(bpf_get_prandom_u32)
+	: __clobber_all);
 }
 
 SEC("syscall")
-- 
2.53.0-Meta

