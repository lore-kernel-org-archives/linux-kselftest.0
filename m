Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA702C3768
	for <linux-kselftest@vger.kernel.org>; Sun, 28 Jun 2026 08:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782634665; cv=none; b=gHEH+Qk40hp6w3HZYo6UoP4mLv/NZEPCZ/5oQgHLjB0kqiES/nof0VJgPGKtKU836zmza8IO1dUaYbYPbw6DV8e7Ci6NNtpGh5eE3hCsbGW1mzZAh+94BjqYTXhU4Vu/OV9vx+R4NlXMvsf5qCj6Dl2YPQEmA19RO44GdYMKrSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782634665; c=relaxed/simple;
	bh=/snlUGgpk3VltJBL8fWi2yt6MpcoHl4Tixw1nlncnT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDcwQhd98eEzFekD4N/73YzFC2g5XNZ6WP5+4QuU6PrxLpGY+gsznjilijv3Y3tQAUxkkPQitk5HQFeMBIJJThzkl//XKNRiuWCd/35+qAnCX2mhYkGlNo7If/+fplhOocqup8pwup/O8v3J5Ss+zu8tYfcTFFQMRdRDSzUX+h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHrUOjvv; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHrUOjvv"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c88d1d4543fso1481539a12.0
        for <linux-kselftest@vger.kernel.org>; Sun, 28 Jun 2026 01:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634663; x=1783239463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVO4nP+vLtDld68tZIROaNQpEMIbIme+fqWpJDy3A7A=;
        b=aHrUOjvvetUJZmJXuIi5GnZ7C+z3AZSg37kshOOvwLU1uZ1Esg12VVeQk1AxrY1/q5
         7HQfbiYw8BTeCxJkBKoQTw1XOLNQwQVVSGtVjggplP77t/CPHP9VUHGnhpu9J3ariuH1
         WYvVF356mizRX1HUGeDRbnoOyd8L8SbSp/b8DZa1xtJ/INTtd5ZvjKj4av1UdTVI+dj4
         sjZ+qvXBuLqkyCFG1rtlGP6/rgdvAMPM1PS36DZJupfkDeWOoI8dGBIhtWdKceMytpOX
         wzHms2NFsW0XqvW2IWnTinO7+Zf++m67zqWELhTqEXOlL0dIW6pcopOtqgHakccyPLCz
         QCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634663; x=1783239463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DVO4nP+vLtDld68tZIROaNQpEMIbIme+fqWpJDy3A7A=;
        b=N1pTI3GRTf+pNFqnLKpNVog/FwmWNgyPG3KlaRoH4WAs5A8TWuXdIG88ML0j/bYSJ/
         RZAEJ8SBWFyj95qrJKDsOMhY3tneDjW5oCS4/3eiV0BAADXCAr0LnmfaOSJczSFSErgE
         5HqOpZrhpR+HaLQRMgusk89dD6wiz066+AyYHlxd8yvKcHwf4z7vYdMddVCUGaHiLTts
         +qqKOqYxnrDpl01+r73oUEcXyKuVT3CXbOqNqJmF8HCSXb6Fwz6c5yGMUV2G9lPo3DaW
         jD/8FUbKcl8nB/CneHUOkPWW8KhMGVuffi6rMkik7MSfRdk9TqdJZ/rhDlkeFDvjqCMl
         VHwg==
X-Forwarded-Encrypted: i=1; AFNElJ/AUMCzB/wn2rSx7gUp8IFuh+5NCMjb9F45mFXjW22pqjGDjVI3me4/dcto9xxseimpkxeGbIYDY0Dp31IzpQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhUVNuKJMG7YunNXccEzAEZ2YxeeaRvJKVhe4sWXmxNK9ZG75M
	1bB39ZBg1ZcZT5JeLvFn4vHiSRvR1tNy8vO09Yh4bV7BLcCZFHhOtlPL
X-Gm-Gg: AfdE7ckvJg9gJYw+oEfNOHNFZ+nWt05DfVcce0NBYRu2QLtf9Z4jzSdFWA0H5E8STr0
	x7zHpSCCc/5jYchsJQGPFZ/4/GOIWIymjYIHfvdWSYsl/ue8lytAbZ4LoCkCNGpfn2ljqbCdBGU
	X9ExHViU/JK4DG+QmLyUcfwXwM6QbhM5OfUkhnWLu6K+0r/pveOv/MeAQmUN6RBvC8aTDFWEO5h
	04p23iNXpUcB6KopiXoO9xtJ+iSnOodnMOGuygh5AtTTKbKht7LvSWBTIOtAp4sCluwXZYssPOO
	h5ignJIrJF3JMXQHssA2SUTlVGmSmA/9kqH9QzKKIA2vVapi85EFNVkVRqvCWOn/n1ekfCVrMrs
	0MKikkRzLP6HruPItQmUq198t8OacrrhqK6vFAXeS9X3utpk89n0AaBTBCMklugsMKJnIPJbrPR
	baqoE6QisES1GTHmA0P+i5NHkseQn3yaOAobHQSYGtSRfQGPdXlgluaRA=
X-Received: by 2002:a05:6a21:78d:b0:3b4:b259:74e3 with SMTP id adf61e73a8af0-3bd10b3f84cmr21941039637.31.1782634663201;
        Sun, 28 Jun 2026 01:17:43 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:3b4a:8aa::dd:15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bd55985asm6020434a12.31.2026.06.28.01.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:17:42 -0700 (PDT)
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
	shuah@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v2 2/3] riscv, bpf: Add support for BPF exceptions
Date: Sun, 28 Jun 2026 13:47:09 +0530
Message-ID: <20260628081710.113333-3-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081710.113333-1-varunrmallya@gmail.com>
References: <20260628081710.113333-1-varunrmallya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the JIT support required for BPF exceptions (bpf_throw()) on riscv64.

Two kinds of program need special prologue/epilogue handling:

  - A program acting as an exception boundary must save the full set of
    riscv callee-saved GP registers (ra, s0-s11), not just the ones it
    happens to clobber, so that the exception callback can restore the
    state that was live at the boundary. ra and fp are stored first so
    the saved ra/fp pair forms a valid stackframe record for the
    unwinder.

  - The exception callback (exception_cb) does not allocate its own
    frame. It reuses the boundary program's frame, whose frame pointer
    is passed in a2, by setting SP = FP - stack_adjust. This lines the
    epilogue's loads up with the registers the boundary saved, so both
    paths restore the same order.

Wire up bpf_jit_support to be true only when CONFIG_FRAME_POINTER is
enabled.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
Reviewed-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 115 ++++++++++++++++++++++++++++----
 1 file changed, 102 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index c03c1de16b79..c6e2f852e854 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -56,6 +56,30 @@ static const int pt_regmap[] = {
 	[RV_REG_T0] = offsetof(struct pt_regs, t0),
 };
 
+/*
+ * Full set of RISC-V callee-saved GP registers (ra, s0-s11) saved by a program
+ * acting as an exception boundary, in the order they are stored on the stack.
+ * RA and FP come first so the saved ra/fp pair forms a valid stackframe record
+ * at [FP-8]/[FP-16] for the unwinder. The exception callback reuses the
+ * boundary program's frame and restores this same set in its epilogue, so both
+ * paths must agree on the contents and ordering of this list.
+ */
+static const int rv_exception_csave_regs[] = {
+	RV_REG_RA,
+	RV_REG_FP,
+	RV_REG_S1,
+	RV_REG_S2,
+	RV_REG_S3,
+	RV_REG_S4,
+	RV_REG_S5,
+	RV_REG_S6,
+	RV_REG_S7,
+	RV_REG_S8,
+	RV_REG_S9,
+	RV_REG_S10,
+	RV_REG_S11,
+};
+
 enum {
 	RV_CTX_F_SEEN_TAIL_CALL =	0,
 	RV_CTX_F_SEEN_CALL =		RV_REG_RA,
@@ -231,6 +255,22 @@ static void emit_imm(u8 rd, s64 val, struct rv_jit_context *ctx)
 static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 {
 	int stack_adjust = ctx->stack_size, store_offset = stack_adjust - 8;
+	struct bpf_prog_aux *aux = ctx->prog->aux;
+	int i;
+
+	if (aux->exception_boundary || aux->exception_cb) {
+		/*
+		 * An exception boundary saved the full callee-saved register
+		 * set and the exception callback restores it from the boundary's
+		 * frame. Both restore the same fixed set, in the same order it
+		 * was stored by bpf_jit_build_prologue().
+		 */
+		for (i = 0; i < ARRAY_SIZE(rv_exception_csave_regs); i++) {
+			emit_ld(rv_exception_csave_regs[i], store_offset, RV_REG_SP, ctx);
+			store_offset -= 8;
+		}
+		goto epilogue_tail;
+	}
 
 	if (seen_reg(RV_REG_RA, ctx)) {
 		emit_ld(RV_REG_RA, store_offset, RV_REG_SP, ctx);
@@ -267,6 +307,7 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 		store_offset -= 8;
 	}
 
+epilogue_tail:
 	emit_addi(RV_REG_SP, RV_REG_SP, stack_adjust, ctx);
 	/* Set return value. */
 	if (!is_tail_call)
@@ -2002,11 +2043,61 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 {
 	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
+	struct bpf_prog_aux *aux = ctx->prog->aux;
 
 	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
 	if (bpf_stack_adjust)
 		mark_fp(ctx);
 
+	/* emit kcfi type preamble immediately before the first insn */
+	emit_kcfi(is_subprog ? cfi_bpf_subprog_hash : cfi_bpf_hash, ctx);
+
+	/* nops reserved for auipc+jalr pair */
+	for (i = 0; i < RV_FENTRY_NINSNS; i++)
+		emit(rv_nop(), ctx);
+
+	/* First instruction is always setting the tail-call-counter
+	 * (TCC) register. This instruction is skipped for tail calls.
+	 * Force using a 4-byte (non-compressed) instruction.
+	 */
+	emit(rv_addi(RV_REG_TCC, RV_REG_ZERO, MAX_TAIL_CALL_CNT), ctx);
+
+	if (aux->exception_boundary || aux->exception_cb) {
+		/*
+		 * A program acting as an exception boundary saves the full set
+		 * of riscv callee saved registers (ra, s0-s11).
+		 */
+		stack_adjust = round_up(ARRAY_SIZE(rv_exception_csave_regs) * 8,
+					STACK_ALIGN);
+		stack_adjust += bpf_stack_adjust;
+		store_offset = stack_adjust - 8;
+
+		if (!aux->exception_cb && aux->exception_boundary) {
+			/*
+			 * Boundary program: allocate the frame and save the
+			 * full callee-saved set, capturing the caller's values.
+			 */
+			emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
+			for (i = 0; i < ARRAY_SIZE(rv_exception_csave_regs); i++) {
+				emit_sd(RV_REG_SP, store_offset,
+					rv_exception_csave_regs[i], ctx);
+				store_offset -= 8;
+			}
+			emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
+		} else {
+			/*
+			 * Exception callback, reuse the boundary program's
+			 * frame, whose frame pointer is passed in a2. Setting
+			 * SP = FP - stack_adjust lines the epilogue's loads up
+			 * with the registers the boundary saved.
+			 */
+			emit_mv(RV_REG_FP, RV_REG_A2, ctx);
+			emit_addi(RV_REG_SP, RV_REG_FP, -stack_adjust, ctx);
+		}
+
+		goto tail_setup;
+	}
+
 	if (seen_reg(RV_REG_RA, ctx))
 		stack_adjust += 8;
 	stack_adjust += 8; /* RV_REG_FP */
@@ -2030,19 +2121,6 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 
 	store_offset = stack_adjust - 8;
 
-	/* emit kcfi type preamble immediately before the  first insn */
-	emit_kcfi(is_subprog ? cfi_bpf_subprog_hash : cfi_bpf_hash, ctx);
-
-	/* nops reserved for auipc+jalr pair */
-	for (i = 0; i < RV_FENTRY_NINSNS; i++)
-		emit(rv_nop(), ctx);
-
-	/* First instruction is always setting the tail-call-counter
-	 * (TCC) register. This instruction is skipped for tail calls.
-	 * Force using a 4-byte (non-compressed) instruction.
-	 */
-	emit(rv_addi(RV_REG_TCC, RV_REG_ZERO, MAX_TAIL_CALL_CNT), ctx);
-
 	emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
 
 	if (seen_reg(RV_REG_RA, ctx)) {
@@ -2082,6 +2160,7 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 
 	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
 
+tail_setup:
 	if (bpf_stack_adjust)
 		emit_addi(RV_REG_S5, RV_REG_SP, bpf_stack_adjust, ctx);
 
@@ -2157,3 +2236,13 @@ bool bpf_jit_supports_fsession(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_exceptions(void)
+{
+	/*
+	 * bpf_throw() unwinds by walking the frame-pointer chain from inside
+	 * the kernel back into the BPF frames (see arch_bpf_stack_walk()), so
+	 * exceptions require the frame-pointer unwinder to be enabled.
+	 */
+	return IS_ENABLED(CONFIG_FRAME_POINTER);
+}
-- 
2.54.0

