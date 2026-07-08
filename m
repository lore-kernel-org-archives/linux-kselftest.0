Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC7F3A3E73
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 03:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783481810; cv=none; b=qNfhy5ptyQGwc0Pyiilos7f3uaS88/89a5APpoB3y2WgHnVMcCNl0SH3aQ91kJOY0naUbRhIEDLn166lgJqa2w/E8QC8+knZ5bFuNroxP1RH44kIxdQrJPXjo4RxNJJLKP7AV2DZ66ZTKV+lJDQFNT132koVzAYnuH7lq/GajAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783481810; c=relaxed/simple;
	bh=hnVz9t5TgQFrn5i8H9B8U1HHkKZ7eeoy5Aq5WPkBZMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bndcIlYHQiEzhEOUXN7w724EZz1tGMG+EAHobSgRNpyXq8gAD/xd52+YvgJjAk5Wrny8PEK9hqwVUrmiLKBKwgaqcmjriOucjmdaw9RHumhOppdAgXI+0cdJT2MCgNKt1c1+dNABGqs/aAwovIVBFaQnEntmVUFlv3NHGnP+EPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYjDu0ft; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYjDu0ft"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso297080a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 20:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481804; x=1784086604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwKZNNWDlhtCi/I1t4B53H1ja1azSKNpa2D1FOM09UA=;
        b=OYjDu0ftbloQZ+PJdN7z0WzyfqPYbakxY5hPk5UGftxyTA6W6W+BzvbL9xQ6P38AoM
         70+WEfzX+/up/g5cNCMNrWyLm6FIZRGQ0wZbJAXeA3VFmbWk290BoYnNV3aLAcHk/rra
         su33DpReWp8+zdq3oIrAgaxTvquRt8l2HM2KGqtrMbYFGsWdDOTj9Zll9GlenXsruLhB
         SPkfIidKYbHfA4nCy+/T+p2UWwdtJOkLYGH8XV6ykCxMFTBzfEMCNLXsYyltgsi0jMfm
         bdC5Wb4lmqpe1osrUbHNq4Kyd1ilZcpBHHFfweRigjKeZdh8n9KF435ojuR9I1djMTo2
         nHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481804; x=1784086604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fwKZNNWDlhtCi/I1t4B53H1ja1azSKNpa2D1FOM09UA=;
        b=mYsFGxtYVPeeorku3ozzj3HFR7zj0x8+5jxSb4OVk5RdmEVbc8si9KcjAfMb61JG1/
         xTaH9Gl9cbeP3bRzww70HjINMOQZJyd/iMepQoHNoPx4FrRvf0n48jScdzQ34plsvo9d
         GTvYjqXG4L7Luc9WoPtSWAcugUHyGHoDeqxjk3Sb0HtEKIhmRpvywHsjcyn1+GS+HV4h
         eNdV2dOg+SGuZTnyr4gZqhkF5Ff27oPATOIONPb7hT7Suf7t7m95yE1uYWAlhvKMebju
         nUrJxp7qxxizO/0xy13s29tTxSiUK68r2jE04a6njBGDyX6GvF6+H0WrJD9BXThRh/EX
         5xOA==
X-Forwarded-Encrypted: i=1; AHgh+RoJP825MgJ4PN+OqXR7hamwB43/Wh2GysCkQDPrCE3QYneLWpxeFMQ3/tUblc9gguXWaUXWb0KdyjyZuXNjPYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx9aIgp2dIyFV7jf8OQCxVWYO6NF/IzPmVTNy4s4t7PqAkbs2C
	lHI5ny1AKYIEyr/X54G46BtjLK8iqSzrHC73OUBDagQ0af+z0KQClJT01/y5q1gn
X-Gm-Gg: AfdE7clbcUl4R/dVvBZ+IyImycDv2J8V8d+BKl0Vv3t3N1omAITZlhxsJizAjiRyUkW
	G81we5zSqlaJIRzTyWh37JQ+bkMDYYrR+IWCdmREdOTwMtp/arxm76Cu0dw4mMG9GzGTCjq45Pq
	ZcA1tII7Ceh4oUiqe8XeZLjV6PDcKyfFqw1E3fUXmYjf/AwMvb/yOA+qL7vzsxX351q307iUAs+
	Y5KmWtQEwRFRi0uzXTVyzRQA7qpbgqCelh7JRAMERmDC0eXatdpnlaImktSUqq5i2DgjPMa5Sua
	VdREcM04IuG6J11J50sa9sYlmkbFpHX/EFSZnT5m9dCPUDSSztLZteb/c92IADGYhlHvgM925KX
	cnH/o4D2DnPbzPhCJC8Yqxiv02k7i1LHoqbQmauVUK6gKePKU7Zit7N6kSNPHwqqSQLe6EYqe6F
	ouGdM6irfHF3QWBOFpXOexPWJia7IDsyLJrKEscq3NMi0MJy6PMA==
X-Received: by 2002:a17:90b:568c:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-3893f69432cmr693499a91.7.1783481804248;
        Tue, 07 Jul 2026 20:36:44 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:43 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:38 -0700
Subject: [PATCH v3 15/17] riscv: kvm: Use generated instruction headers for
 csr emulation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-riscv_insn_table-v3-15-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481778; l=5969;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=hnVz9t5TgQFrn5i8H9B8U1HHkKZ7eeoy5Aq5WPkBZMA=;
 b=+XjFaVjA4ADLYfjCy0QAF21tn1MRxeL2Yc23hMKGiKfmZLsS7F6q4BenoZimYvWAU9jj5uzkF
 je6smMa/JoLAk9CNQMqAS7wP5VuOh5YfCAlJcWv2vnr14dGWzkq/8Q7
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

Migrate the csr emulation code to use the generated instruction headers
instead of the hand-written instruction composition functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---
This can be tested with the introduced csr_test selftest.
---
 arch/riscv/include/asm/kvm_vcpu_insn.h |  3 +-
 arch/riscv/kvm/vcpu_insn.c             | 59 +++++++++++++++++-----------------
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
index 106fb4c45108..01efdaaede21 100644
--- a/arch/riscv/include/asm/kvm_vcpu_insn.h
+++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
@@ -19,7 +19,8 @@ struct kvm_mmio_decode {
 };
 
 struct kvm_csr_decode {
-	unsigned long insn;
+	unsigned long rd;
+	unsigned long insn_len;
 	int return_handled;
 };
 
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index c3e4cf2cd44b..51eb2c717bff 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -13,8 +13,7 @@
 #include <asm/kvm_vcpu_test_csr.h>
 
 struct insn_func {
-	unsigned long mask;
-	unsigned long match;
+	bool (*cmp)(u32 insn);
 	/*
 	 * Possible return values are as follows:
 	 * 1) Returns < 0 for error case
@@ -131,20 +130,17 @@ static const struct csr_func csr_funcs[] = {
  */
 int kvm_riscv_vcpu_csr_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
-	ulong insn;
-
 	if (vcpu->arch.csr_decode.return_handled)
 		return 0;
 	vcpu->arch.csr_decode.return_handled = 1;
 
 	/* Update destination register for CSR reads */
-	insn = vcpu->arch.csr_decode.insn;
-	if ((insn >> SH_RD) & MASK_RX)
-		SET_RD(insn, &vcpu->arch.guest_context,
-		       run->riscv_csr.ret_value);
+	if (vcpu->arch.csr_decode.rd)
+		*((ulong *)&vcpu->arch.guest_context +
+		  vcpu->arch.csr_decode.rd) = run->riscv_csr.ret_value;
 
 	/* Move to next instruction */
-	vcpu->arch.guest_context.sepc += INSN_LEN(insn);
+	vcpu->arch.guest_context.sepc += vcpu->arch.csr_decode.insn_len;
 
 	return 0;
 }
@@ -157,7 +153,7 @@ static inline unsigned long get_reg(struct kvm_cpu_context *context, unsigned in
 static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 {
 	int i, rc = KVM_INSN_ILLEGAL_TRAP;
-	unsigned int csr_num;
+	unsigned int csr_num, rd;
 	const struct csr_func *tcfn, *cfn = NULL;
 	ulong val = 0, wr_mask = 0, new_val = 0;
 
@@ -166,26 +162,32 @@ static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 		wr_mask = -1UL;
 		new_val = get_reg(&vcpu->arch.guest_context, riscv_insn_csrrw_extract_xs1(insn));
 		csr_num = riscv_insn_csrrw_extract_csr(insn);
+		rd = riscv_insn_csrrw_extract_xd(insn);
 	} else if (riscv_insn_is_csrrs(insn)) {
 		wr_mask = get_reg(&vcpu->arch.guest_context, riscv_insn_csrrs_extract_xs1(insn));
 		new_val = -1UL;
 		csr_num = riscv_insn_csrrs_extract_csr(insn);
+		rd = riscv_insn_csrrs_extract_xd(insn);
 	} else if (riscv_insn_is_csrrc(insn)) {
 		wr_mask = get_reg(&vcpu->arch.guest_context, riscv_insn_csrrc_extract_xs1(insn));
 		new_val = 0;
 		csr_num = riscv_insn_csrrc_extract_csr(insn);
+		rd = riscv_insn_csrrc_extract_xd(insn);
 	} else if (riscv_insn_is_csrrwi(insn)) {
 		wr_mask = -1UL;
 		new_val = riscv_insn_csrrwi_extract_imm(insn);
 		csr_num = riscv_insn_csrrwi_extract_csr(insn);
+		rd = riscv_insn_csrrwi_extract_xd(insn);
 	} else if (riscv_insn_is_csrrsi(insn)) {
 		wr_mask = riscv_insn_csrrwi_extract_imm(insn);
 		new_val = -1UL;
 		csr_num = riscv_insn_csrrsi_extract_csr(insn);
+		rd = riscv_insn_csrrsi_extract_xd(insn);
 	} else if (riscv_insn_is_csrrci(insn)) {
-		wr_mask = GET_REG(riscv_insn_csrrwi_extract_imm(insn));
+		wr_mask = riscv_insn_csrrci_extract_imm(insn);
 		new_val = 0;
-		csr_num = riscv_insn_csrrwi_extract_csr(insn);
+		csr_num = riscv_insn_csrrci_extract_csr(insn);
+		rd = riscv_insn_csrrci_extract_xd(insn);
 	} else {
 		return rc;
 	}
@@ -193,7 +195,8 @@ static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 	#undef GET_REG
 
 	/* Save instruction decode info */
-	vcpu->arch.csr_decode.insn = insn;
+	vcpu->arch.csr_decode.rd = rd;
+	vcpu->arch.csr_decode.insn_len = INSN_LEN(insn);
 	vcpu->arch.csr_decode.return_handled = 0;
 
 	/* Update CSR details in kvm_run struct */
@@ -237,43 +240,39 @@ static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 
 static const struct insn_func system_opcode_funcs[] = {
 	{
-		.mask  = INSN_MASK_CSRRW,
-		.match = INSN_MATCH_CSRRW,
+		.cmp  = riscv_insn_is_csrrw,
 		.func  = csr_insn,
 	},
 	{
-		.mask  = INSN_MASK_CSRRS,
-		.match = INSN_MATCH_CSRRS,
+		.cmp  = riscv_insn_is_csrrs,
 		.func  = csr_insn,
 	},
 	{
-		.mask  = INSN_MASK_CSRRC,
-		.match = INSN_MATCH_CSRRC,
+		.cmp  = riscv_insn_is_csrrc,
 		.func  = csr_insn,
 	},
 	{
-		.mask  = INSN_MASK_CSRRWI,
-		.match = INSN_MATCH_CSRRWI,
+		.cmp  = riscv_insn_is_csrrwi,
 		.func  = csr_insn,
 	},
 	{
-		.mask  = INSN_MASK_CSRRSI,
-		.match = INSN_MATCH_CSRRSI,
+		.cmp  = riscv_insn_is_csrrsi,
 		.func  = csr_insn,
 	},
 	{
-		.mask  = INSN_MASK_CSRRCI,
-		.match = INSN_MATCH_CSRRCI,
+		.cmp  = riscv_insn_is_csrrci,
 		.func  = csr_insn,
 	},
 	{
-		.mask  = INSN_MASK_WFI,
-		.match = INSN_MATCH_WFI,
+		.cmp  = riscv_insn_is_wfi,
 		.func  = wfi_insn,
 	},
 	{
-		.mask  = INSN_MASK_WRS,
-		.match = INSN_MATCH_WRS,
+		.cmp  = riscv_insn_is_wrs_nto,
+		.func  = wrs_insn,
+	},
+	{
+		.cmp  = riscv_insn_is_wrs_sto,
 		.func  = wrs_insn,
 	},
 };
@@ -286,7 +285,7 @@ static int system_opcode_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 
 	for (i = 0; i < ARRAY_SIZE(system_opcode_funcs); i++) {
 		ifn = &system_opcode_funcs[i];
-		if ((insn & ifn->mask) == ifn->match) {
+		if (ifn->cmp(insn)) {
 			rc = ifn->func(vcpu, run, insn);
 			break;
 		}

-- 
2.54.0

