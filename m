Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB82F359A81
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728890; cv=none; b=KVSGRNH8RHPYj2Eoc4osBubBWyllQMFd0eDevnk8IvN0B+NvKk+l2yRPzS5KL36pDDubMk8sbVT31EpdBh5f7uUA5tZXc8DNweqt31XuByEese+dyMfEAkAzr2fw6yUl/H/j1IHd/wB/+CjU8ADdHI6Q2DNMDxu/iWybeoiuRT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728890; c=relaxed/simple;
	bh=fOHTCBcrgzq+oHWGg2uUXZmqlixrBOKYf9/zyymmA0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PI2pSHzoruJltM9cEczCP0oZ1z7mBvz+FQsfc2f1AIPm5MmHelp5NX/6yOMLLesOE+bS2dTmSfygo/GRQ9MCEMDkY2ssNIK1qUPGxNQtGniYhjapE4C9BJnuSBQj7McIgMC0qA1/C7Oe/KPRTj1jw2Rwdlq7Uvm1qMg19hXuAKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfNDmBJO; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfNDmBJO"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c96c92c0980so6079176a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784728888; x=1785333688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FH52Aw5C7E2f+s1RWscjl9uFLtr6OIWxpcyJYXQFaUM=;
        b=BfNDmBJOcX99rQTu/IE7X2eQTgw5EG//8IrQFhBxNEIItf3BX6/c3eKtal9anYIzQl
         7m/65+4koQ8147ZNdHWeXPkxMRasueDVPqVZ1UfjmnUCgPfRIk0yIAHH7pnO9t4EL1GV
         qxOGHSleMlwZuSxW+KM2+eAZGQI0f0AWWuq5HVmp0M8GUaodlOkgX48n+MGAsvgvAO2z
         XzYXGVX2XZJMKQ0pvZ2yjhdX1L2GVbFn1LBz8ALPMkcCiKZEX8nX4qpRhRM+rQAhghyO
         yPuv635LuCODDxp8Z1UuasvIEvHj52aN2yI0TeZAghhdiUzQ8iDNWxAEsN/9UAidotEJ
         uG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728888; x=1785333688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FH52Aw5C7E2f+s1RWscjl9uFLtr6OIWxpcyJYXQFaUM=;
        b=aNdjZESUqIIGgQclKwh5gI7/wGq/+d8WiD3ceubVQ0wdMThwSrZylKI2VyVDj4s8MN
         kAzXHPrVzzXwIHNG9sEEThdX7TAjK7MZFacGSgSFaB5CJji6YgqsBZxr09GpKhowSVO+
         dNAhEgVtD5GrRRq6rLlD+m2bY7m8OG60E0c4vTvUaQrT0PGAbwJR6pjdMgMLFnMnby5Z
         r8JQ6t7Kj0hIjMxTyI3Gs/pY1QVLnbc1S1NXqYhb1Hn4+Hd4LaPvWQ1y7iNYk0kOv3o7
         Jar1gBvKbScIkB3mgtluKhsl5MrBl1L7ITTnOP7XLr/BqlhvwrExyZ58E++OnGnyPlx1
         C1BA==
X-Forwarded-Encrypted: i=1; AHgh+RrW4ypZAr7vWNpTShKvFaCBuk86hWzRoRz0A7Pn8fhWhhz/Hi1A5NrAI9DobSyqoQhasCK0Xswt+lNzoRCLPE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiU5oJbBPLAX8nbbR/vVPuqIUrO4/iAkd8gqpx7adG2N2cbw1A
	96LF+WYH5UsgeoUNcuiS/llgBckGqCT1n7TzvkNKwkh18nxR0/d3GCdD
X-Gm-Gg: AR+sD133EbOduWXpt1JnJqM+aUt9TIvJS4i2Kgc28kZ122AUDK9lUtNwtukxgThoaTU
	ahAYsNvwo8kvgjzPrKU+a/RccqGRFTElI0Tix51qv/mTGe9I9ISjZNKben9ceftvfrmHTTEbzzb
	pcz047dcL5ULj67rBHlCVhN+kkpqIo1zCuCOprlAkVSVUZJ3pYGyaRQe9/l9sSmYowl4Qg0fN/6
	IVe+pumkPkXYc1SBJ73EeRG7LH913o0ivPN3ELN1HM/jCPqo+ZnsroQRZHKDKivL37j7+PB74+r
	lVpbi01N+KN2srTlWyJvFzY2WX4NNcno/FvnF4H9SVEav/4SMeIesba08d081zt6q+vCiYLjwcg
	88iHW5clk4RD2Mut2N1FDH22wB1yilhms1Iu8e0r7iTsnE4GxwlEr6szv4ggJ9mAXBOKLBtnBtA
	2SSXPwufsfxSP2gX6x+6bSOf0c1YY9cEKws4dtbKDsgf36jdU=
X-Received: by 2002:a05:6a20:9397:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c3ada17f25mr23594749637.42.1784728884846;
        Wed, 22 Jul 2026 07:01:24 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:40b2:277d::3ef:c9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm1242281a12.26.2026.07.22.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:01:23 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pulehui@huawei.com
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v3 4/6] riscv, bpf: Split prologue and epilogue into helper functions
Date: Wed, 22 Jul 2026 19:30:11 +0530
Message-ID: <20260722140015.1982158-5-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722140015.1982158-1-varunrmallya@gmail.com>
References: <20260722140015.1982158-1-varunrmallya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split bpf_jit_build_prologue() and __build_epilogue() into helpers.
normal_stack_adjust() computes the frame size for the callee-saved
registers a program actually clobbers, emit_normal_prologue() allocates
the frame and spills those registers, and emit_normal_restore() reloads
them.

The kcfi preamble, fentry nops and tail-call-counter setup are hoisted
before the frame-size computation and they do not depend on it and the
emitted instruction sequence is unchanged.

No functional change.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 152 ++++++++++++++++++--------------
 1 file changed, 87 insertions(+), 65 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index ad089a9a4ea9..b804382075c4 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -198,9 +198,84 @@ static void emit_imm(u8 rd, s64 val, struct rv_jit_context *ctx)
 		emit_addi(rd, rd, lower, ctx);
 }
 
-static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
+/* Stack space for the callee-saved registers a normal program spills,
+ * excluding the BPF stack itself.
+ */
+static int normal_stack_adjust(struct rv_jit_context *ctx)
 {
-	int stack_adjust = ctx->stack_size, store_offset = stack_adjust - 8;
+	int stack_adjust = 0;
+
+	if (seen_reg(RV_REG_RA, ctx))
+		stack_adjust += 8;
+	stack_adjust += 8; /* RV_REG_FP */
+	if (seen_reg(RV_REG_S1, ctx))
+		stack_adjust += 8;
+	if (seen_reg(RV_REG_S2, ctx))
+		stack_adjust += 8;
+	if (seen_reg(RV_REG_S3, ctx))
+		stack_adjust += 8;
+	if (seen_reg(RV_REG_S4, ctx))
+		stack_adjust += 8;
+	if (seen_reg(RV_REG_S5, ctx))
+		stack_adjust += 8;
+	if (ctx->arena_vm_start)
+		stack_adjust += 8;
+	stack_adjust += 8; /* RV_REG_TCC */
+
+	return round_up(stack_adjust, STACK_ALIGN);
+}
+
+/* Allocate the frame and save the callee-saved registers the program
+ * actually clobbers, then point FP at the frame top.
+ */
+static void emit_normal_prologue(struct rv_jit_context *ctx, int stack_adjust)
+{
+	int store_offset = stack_adjust - 8;
+	/* tailcall starts here, emit insn before it must be fixed */
+
+	emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
+
+	if (seen_reg(RV_REG_RA, ctx)) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_RA, ctx);
+		store_offset -= 8;
+	}
+	emit_sd(RV_REG_SP, store_offset, RV_REG_FP, ctx);
+	store_offset -= 8;
+	if (seen_reg(RV_REG_S1, ctx)) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_S1, ctx);
+		store_offset -= 8;
+	}
+	if (seen_reg(RV_REG_S2, ctx)) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_S2, ctx);
+		store_offset -= 8;
+	}
+	if (seen_reg(RV_REG_S3, ctx)) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_S3, ctx);
+		store_offset -= 8;
+	}
+	if (seen_reg(RV_REG_S4, ctx)) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_S4, ctx);
+		store_offset -= 8;
+	}
+	if (seen_reg(RV_REG_S5, ctx)) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_S5, ctx);
+		store_offset -= 8;
+	}
+	if (ctx->arena_vm_start) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_ARENA, ctx);
+		store_offset -= 8;
+	}
+
+	/* store TCC from RV_REG_TCC to stack */
+	emit_sd(RV_REG_SP, store_offset, RV_REG_TCC, ctx);
+	ctx->tcc_offset = store_offset;
+
+	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
+}
+
+static void emit_normal_restore(struct rv_jit_context *ctx, int stack_adjust)
+{
+	int store_offset = stack_adjust - 8;
 
 	if (seen_reg(RV_REG_RA, ctx)) {
 		emit_ld(RV_REG_RA, store_offset, RV_REG_SP, ctx);
@@ -235,6 +310,13 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 
 	/* restore TCC from stack to RV_REG_TCC */
 	emit_ld(RV_REG_TCC, ctx->tcc_offset, RV_REG_SP, ctx);
+}
+
+static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
+{
+	int stack_adjust = ctx->stack_size;
+
+	emit_normal_restore(ctx, stack_adjust);
 
 	emit_addi(RV_REG_SP, RV_REG_SP, stack_adjust, ctx);
 	/* Set return value. */
@@ -2006,34 +2088,12 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
 void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 {
-	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
+	int i, stack_adjust, bpf_stack_adjust;
 
 	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
 	if (bpf_stack_adjust)
 		mark_fp(ctx);
 
-	if (seen_reg(RV_REG_RA, ctx))
-		stack_adjust += 8;
-	stack_adjust += 8; /* RV_REG_FP */
-	if (seen_reg(RV_REG_S1, ctx))
-		stack_adjust += 8;
-	if (seen_reg(RV_REG_S2, ctx))
-		stack_adjust += 8;
-	if (seen_reg(RV_REG_S3, ctx))
-		stack_adjust += 8;
-	if (seen_reg(RV_REG_S4, ctx))
-		stack_adjust += 8;
-	if (seen_reg(RV_REG_S5, ctx))
-		stack_adjust += 8;
-	if (ctx->arena_vm_start)
-		stack_adjust += 8;
-	stack_adjust += 8; /* RV_REG_TCC */
-
-	stack_adjust = round_up(stack_adjust, STACK_ALIGN);
-	stack_adjust += bpf_stack_adjust;
-
-	store_offset = stack_adjust - 8;
-
 	/* emit kcfi type preamble immediately before the  first insn */
 	emit_kcfi(is_subprog ? cfi_bpf_subprog_hash : cfi_bpf_hash, ctx);
 
@@ -2046,46 +2106,8 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 	if (!is_subprog)
 		emit(rv_addi(RV_REG_TCC, RV_REG_ZERO, MAX_TAIL_CALL_CNT), ctx);
 
-	/* tailcall starts here, emit insn before it must be fixed */
-
-	emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
-
-	if (seen_reg(RV_REG_RA, ctx)) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_RA, ctx);
-		store_offset -= 8;
-	}
-	emit_sd(RV_REG_SP, store_offset, RV_REG_FP, ctx);
-	store_offset -= 8;
-	if (seen_reg(RV_REG_S1, ctx)) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_S1, ctx);
-		store_offset -= 8;
-	}
-	if (seen_reg(RV_REG_S2, ctx)) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_S2, ctx);
-		store_offset -= 8;
-	}
-	if (seen_reg(RV_REG_S3, ctx)) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_S3, ctx);
-		store_offset -= 8;
-	}
-	if (seen_reg(RV_REG_S4, ctx)) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_S4, ctx);
-		store_offset -= 8;
-	}
-	if (seen_reg(RV_REG_S5, ctx)) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_S5, ctx);
-		store_offset -= 8;
-	}
-	if (ctx->arena_vm_start) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_ARENA, ctx);
-		store_offset -= 8;
-	}
-
-	/* store TCC from RV_REG_TCC to stack */
-	emit_sd(RV_REG_SP, store_offset, RV_REG_TCC, ctx);
-	ctx->tcc_offset = store_offset;
-
-	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
+	stack_adjust = normal_stack_adjust(ctx) + bpf_stack_adjust;
+	emit_normal_prologue(ctx, stack_adjust);
 
 	if (bpf_stack_adjust)
 		emit_addi(RV_REG_S5, RV_REG_SP, bpf_stack_adjust, ctx);
-- 
2.55.0

