Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E82136EA9F
	for <linux-kselftest@vger.kernel.org>; Sun,  7 Jun 2026 08:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780819897; cv=none; b=F6wlyWSlbkQ2jrFlSwkNFmDtK6C6Pi8UaRwetz42pUdm4yQMS5Twa1XwKh13ky7YYayV8ulOXzQ5zm39AJ+PNizj23cQTYQdyzdenLd/o9OvWC8QJb+a1T1QYI1RAUvcIuqywyWRGtwLEFiiJ7zAusK4YMrah4k7DRvJd5AtbdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780819897; c=relaxed/simple;
	bh=il3W9yroLsRYBQIuvYkkSheMlrO7RHnb9qf5nYdI0DY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRzJoT3V1DdsMDkJN0P1F7bi6TPn0GMXx4KYdbC5V9O3DAew/GwK+OaywQ1lLjSvVFyzgH5ke3ajhMotF+0vJWsOGXk2NLgE9AIQ3DUc8trpsqg+i0Oax3HA/za8WNTkSbFQ/4Dt8trhNftG18lXnNpmanwdJHx/KsKfFRXUXlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0OHnMbv; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0OHnMbv"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8422f395a4aso1974111b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 07 Jun 2026 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819894; x=1781424694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnAk1DyBQ24p90WHdW3yMyzw8YDZPAAEuxnsHVkQ7lk=;
        b=m0OHnMbvWSK9+hK6VxIXEpbh/fYNRq2L6+3uRcza+nLLNvePn+F5OwvV7YbOAbCZc5
         4u1SmNWR8cFbwCqP6D8Y0mp3fsYBnD1Q/8ARaovFjBLWQGob0SOEo/9/v/7gCf9N0OXG
         fht6/HK4Sp68kfhECWOpsUVLK0H6v/cpPnWfm07xVdHNw7FYD88Ftg+WHd84by4Ld6S+
         p1avFTp2dEKanIviqg6LBHlwHbcmleZySEVA6+l70ti+4cZpc5gkZyHkmredUBLFmN/M
         oZ9EYfXnXK3bUJGcPtBhfbisof5o94DMynR5xWWJ6WRS3SJFgF+iLYv90RO0NP618lHn
         IMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819894; x=1781424694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qnAk1DyBQ24p90WHdW3yMyzw8YDZPAAEuxnsHVkQ7lk=;
        b=mZ/7Iq085O2qf4Vkl785KfCQY0EBJVRurfDVETEMYY6K9gDaRT/zPpIfE8hBM8XYvz
         l284nqAB3EfdSoWNcJi4zK6ytPOPvcQi5ty0V3JSF/cmwu7Z8S1B7ZJdSfG6h5kI2n6i
         RAk7vRew0ZHLIIjYY7/WX7T4BWfUv9Qu6GhByGtLkrbYnUXSGuMdxG28Eoo63HiLNkRl
         JjJkvx9w203RpOVV4SJk8JTOLaYKIls6Z3TTHXytOKj3RTCe6FHwdfDuZA7VXeiPu+Tw
         s0w+qa1FeuLKnELyyB96DKnh/SiLkkNcBGscrHAewIrkU9BxYlN8bB21x4YGYa9EmB0n
         GqwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9potAguMukL+tA3fiva4xQsGvVQwORo5pie2wnMNAFb/mUrRYFs9Ky8La6LRE7cesxnUVWpHNygQMq7b7yJcg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+oGLYa9iOBeW6djZ5wK44TPgZHhaYwodtlkAdGFNtY9dU70IV
	jYwvJJ9h4HxsHYLWv4tKfnX0x+e9Hr3WswZ/1fXz0YcqW/Ss7GHW+VLl
X-Gm-Gg: Acq92OE0uHNTBpj5DQZw/y0aT6U2W1C5lJ6tQarcccB1NdhicKxuOnD/C0LLVe3MjG0
	JzLbLVrjMOlTe9i89vK6IOs2Exqbv3/IUqmbim00msopI4KrDy+iaxegPYYvJQg9ZuhWLllFdRU
	rAUSlaPGJttKqf6NnyEirrrzMMebFA5blx4euA8jawsJIASGufXT+yqHnY8hMgVj9xVfioKDSSF
	v1vvFgvMKoxCvuxcTqp4jtvRaumnDQf3gdEcxVHX6UIUB0CdifYu/ZPQO1ASZLcMcDF/Za2djrL
	0/RLlAN87Nd+kDCn+ymIiWdNfEouRz6wmztk0LynejzUwyOWAt+Rq8QR+u14rRKAOnK0ZbV6E0w
	VkMmBCmojsmQoAjszjDvZ0x37JIt6zLKVarIb0wgykJ1lmVDQo9jALy6HhqEQgGo/1j+gXWD1iN
	FpTaPed14efP17qhDr4psck2eVJM1r/pJY1ScmuV4c6Uea
X-Received: by 2002:a05:6a00:420a:b0:842:5f67:eada with SMTP id d2e1a72fcca58-842b666f9c0mr7966468b3a.5.1780819893831;
        Sun, 07 Jun 2026 01:11:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm15725254b3a.30.2026.06.07.01.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:33 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 7/8] RISC-V: KVM: Add support for control-flow integrity FWFT features
Date: Sun,  7 Jun 2026 16:11:03 +0800
Message-ID: <20260607081105.993908-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607081105.993908-1-inochiama@gmail.com>
References: <20260607081105.993908-1-inochiama@gmail.com>
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
index 7192c229a19e..cb9b9721ec88 100644
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
+		cfg->hedeleg |= EXC_SOFTWARE_CHECK;
+	else
+		cfg->hedeleg &= ~EXC_SOFTWARE_CHECK;
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
+		cfg->hedeleg &= ~EXC_SOFTWARE_CHECK;
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
+		cfg->hedeleg &= ~EXC_SOFTWARE_CHECK;
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
@@ -312,6 +401,24 @@ static const struct kvm_sbi_fwft_feature features[] = {
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
2.54.0

