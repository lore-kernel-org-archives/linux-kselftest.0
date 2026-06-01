Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA3B388E4E
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303441; cv=none; b=uC5HPo8llehD70oH/PtqLn8tvcsfKCkDXkYrZBAf1MzyOctExMpbg5Ueyslf+f1tsHDayT17/JNebujiHzjnCDCNgf8U6Xr/uuhi9s0zWjPxD2WAjhxTM2iP1rbu1Wd81ehLts0nApqFkV9892lz1bq+o9DskoVZHIyHrPB6xZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303441; c=relaxed/simple;
	bh=RTxTTusmwHBtYj40ntfpMb5fbqAkYBYXJYk7jt+gJYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AhWDrlcolNuVzj6keDEJYK/mAAhTWkJ2SJ4itfsQUKUXOKMiGu/bIjk5f6PDMDPM/0MHG7c3hVm7PqMbZv65MbkZLtn+cyK+ApmGVAf0EiGDhmbKeKYJUm1XRrinQf2VnykOmCoqIXj/jAKwRaqU7KhGU995BrScqoLYnT6k0os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OV9VF6LI; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OV9VF6LI"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36b900f350fso3365235a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303439; x=1780908239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0aaMax2/oVHcxkIeEgQqy6mX+q/RNO/BVNGIuJ0S4E=;
        b=OV9VF6LImMTXbRCH0gqo6VuSw+4G25dgpYx11XPRfWM+3gRT4rKhrIl++o7IVtfWoT
         638cHnO6Blbj4U4TninUqkBWSQghFVYpHow7EvYLG3Vkv3VasqYlwEdAR8HTUrBHmglw
         HfvYiRU1hNnhm5v5g/jVtorGvsNFPY2X7J0kqw5mYsZVUBAV/YDsvEez5QtwuhhtZ+r+
         BWIuuJL/GrfoaftvUyGCYD0TaUa8OuFPpObudJeo3/Wj0xvn/duyEVTWD6iacHZg04hU
         5Grjp0bcrOKrQtqfphjcH/B7pN9BMJvA3ofZc2tNBudzhNfESLL2T0jw7ySah3mRe3Jg
         ghNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303439; x=1780908239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0aaMax2/oVHcxkIeEgQqy6mX+q/RNO/BVNGIuJ0S4E=;
        b=sPtn/bWiYMRkK4Mlz4bAVvzOGWzUW/ETMEvuyjaLCG8hEqw+6mcYWcmV2K1SKNkXR8
         +bny823Ra7WBKlAtxldEBdso9I+LNmO3ENNBzdTL+RMyF15tHK5aPptoolFr/9Y/JcGy
         4VtgoBL3vivloYrZlYWBYzSejfBRKqCSYsr/ZLVhclSh0cb9jylYWCPOTlp4KApjzxLC
         0WH6xyUO/AN1UW6a/2JTJ3yjXaU+7gdIxmNvAM9qKAEhAvl0RvWb+IW1cvqnQJqFYhNN
         pmnp+iCaslh89eHF8sJ3oam5tPSQ9daGL6M2xKDWAcw/pHJt4EQc6nUgAsa0NExgMlMp
         zo1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9rAHilWlsdfSXrQk6PGR1ghUKnYD+4sVf3Yi9TUcp1GbyUFJUamgdPCWg/66lifKD1CvW10L7WZzQIKFZlH+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVa9hAjME9OF3Upo6Mm2BWV5QwngPiz8RXzNW9eVd+km6Ul3oQ
	Nrgw0VnOhvCDa65JQ8srkcnKsJdaqVYzFz9NXWeZ9w5QS1KFN9mBX1RMvHbzK2q4
X-Gm-Gg: Acq92OEkhHgUY+pw18x3mnCEqEPiYw/cznm2zGXyKveaaZOISNg98aXw7ezGc34y+gN
	HKtCKuyDgGHHeAr7SuVuMaf1ShIapG3gPZx2XzS5Wy8br3V0TjPfsVl4ggzIF45un2zSEL7PXA6
	KGshygvk2DwF5UWwGnSbCAUdf5InDJt4apcI9Bzdhwf0NMzprEdBMbSRrA5L/mRRgF1lT9efMDG
	CyyEdx4/0joZWZW9estTKU+qREBhEL4d5+F9vmZx7rlRm0GvttNutVdo5rnSuj6Nne0MrGK6fQA
	/qgKZ5AfHG4cRleDv0O5688RaXHgrMtHaRwx7ETg7IaVcHfKm6rDGpcE9jfajgq2ddn16q2GuZf
	p6ptNdOT5RtaaityyEyacaJhUTVDq/sQD9heiuUEic5+Oxk9To/9iwBFtpo2ZmDN30wf28U7kRX
	qtZLMmViKIy8+Uz8zIMK2GtTSTQUP6ASzOtw==
X-Received: by 2002:a17:90b:2247:b0:367:d850:6a5f with SMTP id 98e67ed59e1d1-36c68478155mr9638126a91.25.1780303439454;
        Mon, 01 Jun 2026 01:43:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdb6978fsm5733679a91.1.2026.06.01.01.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:43:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2 1/7] RISC-V: KVM: Add support for Svadu FWFT features
Date: Mon,  1 Jun 2026 16:43:29 +0800
Message-ID: <20260601084336.2601675-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hardware updating of PTE A/D bits is controlled through ADUE bit in
henvcfg Expose the feature only if the Svadu is supported for VS-mode.
Allow the VMM to block access to the feature by disabling the ISA
extension in the guest.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  3 ++
 arch/riscv/kvm/vcpu_sbi_fwft.c    | 72 +++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 504e73305343..501e4fc60dd2 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -240,6 +240,9 @@ struct kvm_riscv_sbi_fwft_feature {
 struct kvm_riscv_sbi_fwft {
 	struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
 	struct kvm_riscv_sbi_fwft_feature pointer_masking;
+	struct kvm_riscv_sbi_fwft_feature pte_ad_hw_updating;
+	struct kvm_riscv_sbi_fwft_feature landing_pad;
+	struct kvm_riscv_sbi_fwft_feature shadow_stack;
 };
 
 /* If you need to interpret the index values, here is the key: */
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 2eab15339694..375269e43c13 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -84,6 +84,42 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
 	return false;
 }
 
+static void kvm_sbi_fwft_env_flag_reset_helper(struct kvm_vcpu *vcpu,
+					       unsigned long flag)
+{
+	vcpu->arch.cfg.henvcfg &= ~flag;
+}
+
+static long kvm_sbi_fwft_env_flag_set_helper(struct kvm_vcpu *vcpu,
+					     struct kvm_sbi_fwft_config *conf,
+					     bool one_reg_access,
+					     unsigned long value, unsigned long flag)
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
+	if (!one_reg_access)
+		csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
+
+	return SBI_SUCCESS;
+}
+
+static long kvm_sbi_fwft_env_flag_get_helper(struct kvm_vcpu *vcpu,
+					     struct kvm_sbi_fwft_config *conf,
+					     bool one_reg_access,
+					     unsigned long *value, unsigned long flag)
+{
+	*value = (vcpu->arch.cfg.henvcfg & flag) == flag;
+
+	return SBI_SUCCESS;
+}
+
 static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
 {
 	return misaligned_traps_can_delegate();
@@ -127,6 +163,33 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 	return SBI_SUCCESS;
 }
 
+static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
+		!riscv_isa_extension_available(vcpu->arch.isa, SVADE);
+}
+
+static void kvm_sbi_fwft_reset_pte_ad_hw_updating(struct kvm_vcpu *vcpu)
+{
+	kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_ADUE);
+}
+
+static long kvm_sbi_fwft_set_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
+						struct kvm_sbi_fwft_config *conf,
+						bool one_reg_access, unsigned long value)
+{
+	return kvm_sbi_fwft_env_flag_set_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_ADUE);
+}
+
+static long kvm_sbi_fwft_get_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
+						struct kvm_sbi_fwft_config *conf,
+						bool one_reg_access, unsigned long *value)
+{
+	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_ADUE);
+}
+
 #ifndef CONFIG_32BIT
 
 static bool try_to_set_pmm(unsigned long value)
@@ -225,6 +288,15 @@ static const struct kvm_sbi_fwft_feature features[] = {
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
 		.get = kvm_sbi_fwft_get_misaligned_delegation,
 	},
+	{
+		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
+		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pte_ad_hw_updating.enable) /
+				 sizeof(unsigned long),
+		.supported = kvm_sbi_fwft_pte_ad_hw_updating_supported,
+		.reset = kvm_sbi_fwft_reset_pte_ad_hw_updating,
+		.set = kvm_sbi_fwft_set_pte_ad_hw_updating,
+		.get = kvm_sbi_fwft_get_pte_ad_hw_updating,
+	},
 #ifndef CONFIG_32BIT
 	{
 		.id = SBI_FWFT_POINTER_MASKING_PMLEN,
-- 
2.54.0

