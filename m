Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531C0235C01
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 01:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783904651; cv=none; b=Vp1gxP7OYIwVOIn51m6paftJxG5fEjChl5E0fM5Wq9rWV1kYvnaBza8UMv+lIdHtt5Pam4XZvrrbQyUF4YbTq/nyQLlVj2s/vXswj7HCvZdWnHJc7o/MELnhE/ffTmuGDQqh5TNTasXwjqUiNRC3OJHZNuK8a3hehkNzqGLDtaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783904651; c=relaxed/simple;
	bh=HUZff82wa3uDwO/dHSc3LFIupZ3nXKdEiVS1++mcxVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/cvhG8h5QKIbrfnNXlpxKHfyMecg1E1l4NyA3SaxZmgQnD3g7LVIazL3EKmLzMLKGrLwsGWY2jc10bQY5bIAhhILmBibQF3ctIy3fbhiyvwSetnlVjwi4xwwgOKgTCXtIMR0Zk4/n6hujypkU8zJlojcOSPEJTm9KszEfrwTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuV7cubd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuV7cubd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso29552445ad.3
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 18:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904648; x=1784509448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S43bmofhuYovIEb0xvmNF2puC54J8GURvqWgfbvABiE=;
        b=ZuV7cubdFnJhXCNHmjSKcaTWr878JMI5AFQFNCF7DPv+vCfjMwGWKJX9+AJtlZfRsu
         MNfNni5iasLOmkQhgTeL4wwbQtPyrqOhh6tukJkKBrHSKU/TKe8xIV/UkPbikky70OHY
         Tr4+niG1a468y/N5Q/H2ULw/EehZZqdTj9uWM199nVxLlWE5ZrYYiBi15AybT7accsmI
         7ln0OiQNttLJV+KQZdScRe3Xx4wJUuPEUtGmyefQ3uwnSEFNCJeOWVQBcPSaaRQVrF+a
         xYGu11zJWGtk19+YLA63WEtLfXT6XTEW6cBzwixWZrzlKsejkwIyQ/CBcdDI4F5ya854
         YdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904648; x=1784509448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S43bmofhuYovIEb0xvmNF2puC54J8GURvqWgfbvABiE=;
        b=CsIg+oyKd7kJtH/akcn9thnROuLA2bs8vgTZRji/mOkqmerQ3aUKtXAGpplsmGkf6R
         u35Y2ZlmCHdxW79Mfhl7aoF07U0D5usI2mVjfWY4gzKkRKs2H7XEG2QRLMVG3ZApHKj4
         1dazpg71sSw3XT6+xc75HyqSHyIPrIiXBE4jzDmyk9/O8qpJIFwlDI0t52sMfLKxpwB7
         5ridCp/LIE5vF68cDobINNM2uSupcPngcKTshXFCFsWD/1lEriMXSGi6FM/oWrBXG9hl
         Ky4J90bVgk+0LWnMlQw0wBlyZnhHDXfi2oFvgaIkEa0jeHtJ41gzemOEgaOTF2EFs1J1
         ReaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEf20TjOHPh79BCg7YzcHFSLifHzbZkU7xjMwVzMPqFKr+UY0P5ZkVwnGAzFmKBzM1CM3XVuXivIghEdwNV3A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqg5God4CvviCS/9ZlnulfuGGYA1YUWBnc/r6PMS9O6iWQnDWi
	FCjN++zccMpuKQtXGX+JYQoxJvYXlq62K7DK8D21YzhlSRwfe9oBH1xf
X-Gm-Gg: AfdE7cmr8/VeDeSpl3vh89HkfzxZFnW+lfTdywKgUxGZk7iZOyWTWs3d7+d7LOhfqO1
	ot4LIk0G3X702hKpG2qdi/2MZIt5rLXszOC4wvKHQtDGTkMSX4/wIXmMEA8KiQmKgseNTG5lVcr
	idE/YJpCmXmRcnLhFfAU25lYs+t7xqUXRSBTKT6mKbhnNVew9YYXoLgI0QkbLfp4v7XEAXhftDB
	B+YJCgCxkLR1ZC1yph0CKtWhgVESWfuAPqEbnuwoPnPOuqM45of6k9FwBxIPUtzs2XsRbqdBH/M
	+5cCbRganiZoD2CsfD8z9R0K7ht5LK4i7q2X/C96MCqlS7LT03rRnLA4QtSYoASAcemxfsOSDC2
	nu68dYseo3CnyhakD0XJRKJgdundnx5mJEhVEEGZ2WR4un9UwmQayY4vN3iCzEwJhiUMXayPq9I
	pSvgYdcWrlYYE=
X-Received: by 2002:a17:903:1b23:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2ce9e7ac551mr73290545ad.2.1783904647837;
        Sun, 12 Jul 2026 18:04:07 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d57bsm89843745ad.59.2026.07.12.18.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:04:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v6 7/8] RISC-V: KVM: Add support for control-flow integrity FWFT features
Date: Mon, 13 Jul 2026 09:03:00 +0800
Message-ID: <20260713010302.303278-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
References: <20260713010302.303278-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Control-flow integrity is controlled through a WARL field in henvcfg.
Expose the feature only if the Zicfilp/Zicfiss is supported for VS-mode.
Allow the VMM to block access to the feature by disabling the ISA
extension in the guest.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h |   2 +
 arch/riscv/kvm/vcpu_sbi_fwft.c    | 107 ++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index fd4c81697617..20d9959ca44f 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -248,6 +248,8 @@ struct kvm_riscv_sbi_fwft {
 	struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
 	struct kvm_riscv_sbi_fwft_feature pointer_masking;
 	struct kvm_riscv_sbi_fwft_feature pte_ad_hw_updating;
+	struct kvm_riscv_sbi_fwft_feature landing_pad;
+	struct kvm_riscv_sbi_fwft_feature shadow_stack;
 };
 
 /* If you need to interpret the index values, here is the key: */
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 4d474a439b29..03153fd8d15f 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -176,6 +176,95 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 	return SBI_SUCCESS;
 }
 
+static long kvm_sbi_fwft_set_cfi(struct kvm_vcpu *vcpu,
+				 struct kvm_sbi_fwft_config *conf,
+				 bool one_reg_access, unsigned long value,
+				 u64 flag)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	if (value == 0)
+		cfg->henvcfg &= ~flag;
+	else if (value == 1)
+		cfg->henvcfg |= flag;
+	else
+		return SBI_ERR_INVALID_PARAM;
+
+	if (cfg->henvcfg & (ENVCFG_LPE | ENVCFG_SSE))
+		cfg->hedeleg |= BIT(EXC_SOFTWARE_CHECK);
+	else
+		cfg->hedeleg &= ~BIT(EXC_SOFTWARE_CHECK);
+
+	if (!one_reg_access) {
+		csr_write(CSR_HEDELEG, cfg->hedeleg);
+		/*
+		 * Both Bit LPE and SSE are in the lower part, so it is safe
+		 * to only write the henvcfg
+		 */
+		csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
+	}
+
+	return SBI_SUCCESS;
+}
+
+static bool kvm_sbi_fwft_landing_pad_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, ZICFILP);
+}
+
+static void kvm_sbi_fwft_reset_landing_pad(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_LPE);
+	if ((cfg->henvcfg & (ENVCFG_LPE | ENVCFG_SSE)) == 0)
+		cfg->hedeleg &= ~BIT(EXC_SOFTWARE_CHECK);
+}
+
+static long kvm_sbi_fwft_set_landing_pad(struct kvm_vcpu *vcpu,
+					 struct kvm_sbi_fwft_config *conf,
+					 bool one_reg_access, unsigned long value)
+{
+	return kvm_sbi_fwft_set_cfi(vcpu, conf, one_reg_access, value, ENVCFG_LPE);
+}
+
+static long kvm_sbi_fwft_get_landing_pad(struct kvm_vcpu *vcpu,
+					 struct kvm_sbi_fwft_config *conf,
+					 bool one_reg_access, unsigned long *value)
+{
+	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_LPE);
+}
+
+static bool kvm_sbi_fwft_shadow_stack_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, ZICFISS);
+}
+
+static void kvm_sbi_fwft_reset_shadow_stack(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_SSE);
+	if ((cfg->henvcfg & (ENVCFG_LPE | ENVCFG_SSE)) == 0)
+		cfg->hedeleg &= ~BIT(EXC_SOFTWARE_CHECK);
+}
+
+static long kvm_sbi_fwft_set_shadow_stack(struct kvm_vcpu *vcpu,
+					  struct kvm_sbi_fwft_config *conf,
+					  bool one_reg_access, unsigned long value)
+{
+	return kvm_sbi_fwft_set_cfi(vcpu, conf, one_reg_access, value, ENVCFG_SSE);
+}
+
+static long kvm_sbi_fwft_get_shadow_stack(struct kvm_vcpu *vcpu,
+					  struct kvm_sbi_fwft_config *conf,
+					  bool one_reg_access, unsigned long *value)
+{
+	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_SSE);
+}
+
 static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *vcpu)
 {
 	return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
@@ -313,6 +402,24 @@ static const struct kvm_sbi_fwft_feature features[] = {
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
 		.get = kvm_sbi_fwft_get_misaligned_delegation,
 	},
+	{
+		.id = SBI_FWFT_LANDING_PAD,
+		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, landing_pad.enable) /
+				 sizeof(unsigned long),
+		.supported = kvm_sbi_fwft_landing_pad_supported,
+		.reset = kvm_sbi_fwft_reset_landing_pad,
+		.set = kvm_sbi_fwft_set_landing_pad,
+		.get = kvm_sbi_fwft_get_landing_pad,
+	},
+	{
+		.id = SBI_FWFT_SHADOW_STACK,
+		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, shadow_stack.enable) /
+				 sizeof(unsigned long),
+		.supported = kvm_sbi_fwft_shadow_stack_supported,
+		.reset = kvm_sbi_fwft_reset_shadow_stack,
+		.set = kvm_sbi_fwft_set_shadow_stack,
+		.get = kvm_sbi_fwft_get_shadow_stack,
+	},
 	{
 		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
 		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pte_ad_hw_updating.enable) /
-- 
2.55.0

