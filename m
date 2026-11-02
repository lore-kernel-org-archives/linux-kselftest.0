Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657292;
	b=LTdBKJv7I1YAUCMJcjo9KZxBL58cneT5VBhJ9uchnpq155nENZqHCVtb1b0snP0z0Cd6
	 8Yd1WV6F1iTCoE70W28DMqjVSpIR60s/PCOaccKsYH9MbSv8zNyqst2jZcnF0QCtr6EXs
	 Du6x/iGEk4b9ifmCIinYQhb7Gql9pXy6WGP3EPGrQbdWGfJahWeWTPpfCmjn/hvnHLGTw
	 GhVz6X2PXX/vnsr5BpcpRO8arcxBS9DoTAo22IhZM4Nkds6CQqwdbZr0zC1dEnHf1hOgo
	 VKmbO6H8Ka223asqeyDRV/uAhBQI7Dy75YNOE880syQfb+naU/kA07+so1VQIbTUSOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657292;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xP9ZtnGfnihIzUoHoVST0rbKVm0jhfIU7BjbzM8EpLM=;
	b=V9Vx7YJ7m06OrUOwjg0MqeFBZFTKulY2t6cRCD8THnE09txx58Xq+EoXqoKjea6WBW+P
	 YINWwlDtpGc/J98HS8HVxLSsb6m0XpY3vd5WTT/Gs2srWXXLOKMYB98aAde3J/6HlYkuU
	 0XgKtQMmpApALRDA0HVKHAlxut4icZ03GGdv5sETy+urTdF8yRkJTQAS/BV1MUotrM9iJ
	 dDbLHkwbqAi3OA8OHre7As6W1YUa5rkCFW/14rYz7TP8NeJT1RL9IW5jc8sAyuIXglYDR
	 dPHhwMFR9GQeTJibPpzardTZBC4qlniab0khEL8muM/4xx9nXeLUua8T91Jmu7TImYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LNiAlHNL;
	arc=none smtp.remote-ip=91.218.175.200
Received: from mta0.migadu.com (out-200.mta0.migadu.com [91.218.175.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BDC606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 22:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05BDC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LNiAlHNL
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2rs/I4T2mktC38G1vUteyVbBU3IObk5wVZ3DJi8CKgw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793657290; v=1; x=1794262090;
 b=LNiAlHNLddW3YuiGB91JyOfhrQGDnCCBoJG2EkfJLnYCeyV6aPIJc95vB/wOOnyTYuR4pdoi
 zczqMI8DPE0alyn4WKHTuRCMOQxfwfTUdiNBIA012vg9MtjLw6f6cg9JBz7P4Ndm4IhGDrGRvSI
 DL68nex/OsawYh7klj15fxYs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 50bb818c2823da61;
	Mon, 02 Nov 2026 22:08:09 +0000
X-Mizu-Trace-ID: 50bb818c2823da61
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
Subject: [PATCH bpf-next v3 7/8] selftests/bpf: write the mixed arena/scalar ALU tests in asm
Date: Mon,  2 Nov 2026 14:07:16 -0800
Message-ID: <20261102220717.4079739-8-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220717.4079739-1-vineet.gupta@linux.dev>
References: <20261102220717.4079739-1-vineet.gupta@linux.dev>
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

and GCC means it.  With the warning silenced it drops both scalar
accesses, leaving nothing that uses r3 as a scalar:

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
 .../selftests/bpf/progs/verifier_arena.c      | 91 +++++++++++--------
 1 file changed, 51 insertions(+), 40 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_arena.c b/tools/testing/selftests/bpf/progs/verifier_arena.c
index 27ffd74567ec..3b13f6aa6b62 100644
--- a/tools/testing/selftests/bpf/progs/verifier_arena.c
+++ b/tools/testing/selftests/bpf/progs/verifier_arena.c
@@ -539,53 +539,64 @@ int arena_ptr_add_arena_ptr(void *ctx)
 	return 0;
 }
 
+/*
+ * Tests that one insn cannot be reached with a register holding a scalar
+ * on one path and an arena pointer on the other.
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
+	/*
+	 * The r9 load is never read.  libbpf binds the object's arena to
+	 * every program through fd_array, so the verifier knows about it
+	 * without this; the load is the fallback for a kernel without
+	 * fd_array_cnt and for the light skeleton loader.
+	 */
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
+ * As mixed_arena_scalar_alu64_scalar_first(), including the r9 load, with
+ * the arena pointer established first.
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

