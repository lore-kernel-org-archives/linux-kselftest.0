Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63873546F5
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728902; cv=none; b=azrflOxYto0KqsYvfnrI6b7QAqcFO/I8ZNrlzWlLdllvTF57oDmAo6XCGszGiTXuhQucrxZ10javvHgJGCSlmwkaPS4iYdb8jn4OFAAesFwtYzFffy9VdnM260sxjlb59lhsiS5AgyCXSqYJsKEemQq4wOuKhyQhFNYUQPmS3b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728902; c=relaxed/simple;
	bh=UpvQpevrWIIS/T5wDeBixMvu/ILTPMDbvy8wHUGgX1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MrjZ4RSYqYNRptbifkptd1sgZk3oQHaSkHExoszO42ws9LIVnxF20zh19lqJQHeVIYD+CYJCTVSOl2MQRq7A04rEb2i9a8rtSknJgqFsM8oVvlNVrdm83n5BuUnyGGKr22DAfz0xXH7grhK4F5UFpRXQzq5I/lK+/fPuQKnTnH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WT6B3ctR; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WT6B3ctR"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84a2c90e383so4276654b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 07:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784728900; x=1785333700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJghvyp9lx2AAiAnzR9hFK8qyEideu4pePevOLlB6CQ=;
        b=WT6B3ctROp8sQdHrkFkW5+YDN7Zl0Ya+hBmSvpKqspxHIdesiAtwEdP9D+cehNibF8
         wKmH3eyiR47RoGD3Ztkat6IUN+v2yriOYH4/72snkFjCrY90l2sJP2VswvbKyo4GtWpt
         fRgeq15gcAs8ElIhCHL03SzPTB9qrB49DlaIRGwi9cPqJoTWGD42duy8KxiqGEA132eb
         29l6YzegiDNAnXyD8Zo2XwwKqfad4CGKQcJGwGw2/ewXSG9HNo7fZ9bRtqP/zAuRwVqZ
         n7cFOGxGsvVS0N8mzKkROT6DGPCk2Ey3fXUQPcVEhexpo8vlngCM8+XjYf8I9t7Zuu8D
         KvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728900; x=1785333700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJghvyp9lx2AAiAnzR9hFK8qyEideu4pePevOLlB6CQ=;
        b=fVc7bt/cdV/uR+/POfWtI+MF3swo7fChTkqQaQB952PTHzQk5D/9kSfUkoIOqG55bU
         gKhQkm7QukD/QPu112YQaDsYSncY+uhizsYhR457awX1OIjrMesyR6L//qPbuNjc1e/b
         UFVcXgKx4xQS6fOP+QGoNN+aAoTRSs9JHeelAQQPclKdK7kepB1xtG5brUC2lNMi37ad
         L98/XGcFQfk7s91kmktORgI6sHwxFKRRitVgPKZbUFQiHw1SY5BnwcJHBdE5aZqLjhl/
         HgFIl4CpfDgvs2RN7ZamR5X2w1Rmd5KmmS7YsTpRhAV5GsqAkIopv9kij/aOuifFCba9
         torw==
X-Forwarded-Encrypted: i=1; AHgh+RpjCM/X8brcFv1C/opXbjM3qH032IqyKLrnMqTg8xgMwwNGGGckBT9BFF7CtbDVgZtvSCxGddSYF/kc17ijU3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW6HFhaGMid14O7PdIAothyeQQDAmh/XbH8FIWspKmzN6SdXl4
	3Yf2RF4CdiJ+FS6fvf41Q+2QNejd9UpZmSr4BoSeGstWfnHDIa+Zb11X
X-Gm-Gg: AR+sD13RUKD/qzJbTlUNOGhqwZJycRxTmUofeS50KO2x7HIpsmfcT4eFikyWQnEh3AG
	8FYgCHo9Zaur2oMBwLg5n67CVSjBs8c6CVBjcLfgz+xe0Cj7s0oJ44rikSHdNxjskoRhkGMEg2u
	9/GDTUKh8/xwM0f/3nkqVk/90BOnB2MOm33kZGuLohMNV2fPEVL7QyX4VEiH/rSYDf9LSTuW8EE
	waw0xudkcITwQePGn9b/V49GtZ7ljZB0J25sW+/lxxdu17akS2Iowiwyf+T/zJC+M0BbJYz0VBc
	CYolcEgUC8XexOA1Rh0VGtC5mpWDHEQGdE9O3X81T60WZtI714QTjtOq3kPV8oucJa/xxL7JyRv
	0rOlmtwD6qFZ6yAwidD/NQ3BxjfRCb8vtuO6v53D9bcHk5p0PuvYcsOIHEAGSovc7voVswbLaE2
	SjsxUfKOvNhyfIQ9lC3rtH5+Tt2DTs/+wc0Ku8yRQtrYQEE1I=
X-Received: by 2002:a05:6a21:6004:b0:3bf:9bd9:cf60 with SMTP id adf61e73a8af0-3c42921e111mr4368025637.6.1784728898850;
        Wed, 22 Jul 2026 07:01:38 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:40b2:277d::3ef:c9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm1242281a12.26.2026.07.22.07.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:01:37 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 5/6] riscv, bpf: Add support for BPF exceptions
Date: Wed, 22 Jul 2026 19:30:12 +0530
Message-ID: <20260722140015.1982158-6-varunrmallya@gmail.com>
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

Add the JIT support required for BPF exceptions on riscv64.

Two kinds of programs need special prologue/epilogue handling:

  - A program acting as an exception boundary must save the full set of
    riscv callee-saved GP registers (ra, s0-s11), not just the ones it
    clobbers, so that the exception callback can restore the
    state that was live at the boundary. ra and fp are stored first so
    the saved ra/fp pair forms a valid stackframe record for the
    unwinder.

  - exception_cb does not allocate its own frame. It reuses the boundary
    program's frame, whose frame pointer is passed in a2, by setting
    SP = FP - stack_adjust. This lines the epilogue's loads up with
    the registers the boundary saved, so both paths restore the same
    order.

Both cases are implemented as prologue/epilogue helpers next to the
normal-path ones, selected with a plain if/else in
bpf_jit_build_prologue() and __build_epilogue().

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 112 +++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index b804382075c4..e0c2f73bc646 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -56,6 +56,29 @@ static const int pt_regmap[] = {
 	[RV_REG_T0] = offsetof(struct pt_regs, t0),
 };
 
+/* Full set of RISC-V callee-saved GP registers (ra, s0-s11) saved by a program
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
 	RV_CTX_F_SEEN_CALL =		RV_REG_RA,
 	RV_CTX_F_SEEN_S1 =		RV_REG_S1,
@@ -312,11 +335,67 @@ static void emit_normal_restore(struct rv_jit_context *ctx, int stack_adjust)
 	emit_ld(RV_REG_TCC, ctx->tcc_offset, RV_REG_SP, ctx);
 }
 
+static bool is_exception_prog(const struct bpf_prog *prog)
+{
+	return prog->aux->exception_boundary || prog->aux->exception_cb;
+}
+
+static void emit_exception_boundary_prologue(struct rv_jit_context *ctx,
+					     int stack_adjust)
+{
+	int store_offset = stack_adjust - 8;
+	int i;
+
+	emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
+	for (i = 0; i < ARRAY_SIZE(rv_exception_csave_regs); i++) {
+		emit_sd(RV_REG_SP, store_offset, rv_exception_csave_regs[i], ctx);
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
+/* reuses the boundary program's frame, whose frame pointer
+ * is passed in a2 (since it's the third argument from bpf_throw()).
+ * Setting SP = FP - stack_adjust lines the epilogue's loads up with
+ * the registers the boundary saved.
+ */
+static void emit_exception_cb_prologue(struct rv_jit_context *ctx,
+				       int stack_adjust)
+{
+	emit_mv(RV_REG_FP, RV_REG_A2, ctx);
+	emit_addi(RV_REG_SP, RV_REG_FP, -stack_adjust, ctx);
+	ctx->tcc_offset = stack_adjust - 8 - ARRAY_SIZE(rv_exception_csave_regs) * 8;
+}
+
+/* Used by both the boundary program and the exception callback alike, since the
+ * callback runs on the boundary's frame.
+ */
+static void emit_exception_restore(struct rv_jit_context *ctx, int stack_adjust)
+{
+	int store_offset = stack_adjust - 8;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(rv_exception_csave_regs); i++) {
+		emit_ld(rv_exception_csave_regs[i], store_offset, RV_REG_SP, ctx);
+		store_offset -= 8;
+	}
+	/* restore TCC from stack to RV_REG_TCC */
+	emit_ld(RV_REG_TCC, ctx->tcc_offset, RV_REG_SP, ctx);
+}
+
 static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 {
 	int stack_adjust = ctx->stack_size;
 
-	emit_normal_restore(ctx, stack_adjust);
+	if (is_exception_prog(ctx->prog))
+		emit_exception_restore(ctx, stack_adjust);
+	else
+		emit_normal_restore(ctx, stack_adjust);
 
 	emit_addi(RV_REG_SP, RV_REG_SP, stack_adjust, ctx);
 	/* Set return value. */
@@ -2086,6 +2165,15 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	return 0;
 }
 
+static int exception_stack_adjust(void)
+{
+	int stack_adjust = 0;
+
+	stack_adjust += 8; /* RV_REG_TCC */
+	stack_adjust += ARRAY_SIZE(rv_exception_csave_regs) * 8;
+	return round_up(stack_adjust, STACK_ALIGN);
+}
+
 void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 {
 	int i, stack_adjust, bpf_stack_adjust;
@@ -2106,8 +2194,17 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 	if (!is_subprog)
 		emit(rv_addi(RV_REG_TCC, RV_REG_ZERO, MAX_TAIL_CALL_CNT), ctx);
 
-	stack_adjust = normal_stack_adjust(ctx) + bpf_stack_adjust;
-	emit_normal_prologue(ctx, stack_adjust);
+	if (is_exception_prog(ctx->prog)) {
+		stack_adjust = exception_stack_adjust() + bpf_stack_adjust;
+
+		if (ctx->prog->aux->exception_cb)
+			emit_exception_cb_prologue(ctx, stack_adjust);
+		else
+			emit_exception_boundary_prologue(ctx, stack_adjust);
+	} else {
+		stack_adjust = normal_stack_adjust(ctx) + bpf_stack_adjust;
+		emit_normal_prologue(ctx, stack_adjust);
+	}
 
 	if (bpf_stack_adjust)
 		emit_addi(RV_REG_S5, RV_REG_SP, bpf_stack_adjust, ctx);
@@ -2183,3 +2280,12 @@ bool bpf_jit_supports_subprog_tailcalls(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_exceptions(void)
+{
+	/* bpf_throw() unwinds by walking the frame-pointer chain from inside
+	 * the kernel back into the BPF frames (see arch_bpf_stack_walk()), so
+	 * exceptions require the frame-pointer unwinder to be enabled.
+	 */
+	return IS_ENABLED(CONFIG_FRAME_POINTER);
+}
-- 
2.55.0

