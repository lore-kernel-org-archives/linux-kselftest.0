Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F92233952
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 01:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783904633; cv=none; b=pODXNH5cWIzxhuyTqbDLC1Ir/NSUG21hv5pwtgMNSwz9K/ydgOcC5nCPXjtULQnzfPrl1bCm2hTKFcAytjFeE/bQJyiXkSfTJFs09b7Fhy+IY7+cUTvh8bRM03Vx+9Kb7STmSZs3lcJcMoL3Uzr58+EBJIoCFLCUOmhSpTyfkxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783904633; c=relaxed/simple;
	bh=FH8Uhgh1pcvytIsiV9o2sHL0nTuhzb9K7bh5qTOi+jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QyFIMbLuLk9L6MfQ1+peEiZ2B3K0gln1FPyhmqD+VLGoFXrezzXtAJ4MiVC8ve1Q5l90HvdMscwq2xStZ6bzuE0rANFJCda4odMSgqozXnr5kc4LkWcejPAvXgIiB2HY0b0iCqKUnvA2e7HD4aMA85jLCUu53gzfMgvLVT7Nyxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7nObPai; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7nObPai"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dcbade417so966244a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 18:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904631; x=1784509431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wtNmoMKQodXeWiOSWDyChURk6Jt6lHeZLiT5bWjNnQ=;
        b=I7nObPaio6bAQg/MOnpS+vXRwvcEzZK6eTCeJ7BQqIuZGbDevBtUOlixJJbHoFhPDV
         bTTNdu/3cW2DB6bScE/gUcAAZQVGfrur5rkPDrrvauvXhRb0z0z28dj0ADji0laKQlu3
         SxPqLXMuorGXDyhnmEptqrX0upJAOKtxcUQe3EzAORyH6FtyR620ntv8BH0CO7117Zsh
         ybyfR0Uc/j2sIT16ZigB2Yz0unfzBKPEwaBZjFbxA98nrI/nz099aOwzEJMQr3ik2gbX
         50kWp+i8cZf3QTLE8uzS+6PVj9rdq7ZM3Dp0CRZZqfAoJsJ+WngLarxQ/d5B6IZOQUnU
         QQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904631; x=1784509431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4wtNmoMKQodXeWiOSWDyChURk6Jt6lHeZLiT5bWjNnQ=;
        b=hxEfqCRk7o8VcSbJeAOfyeNQhpOOTrMD/90U9ozh6SL6dl/6pxXPc5HnZbuhLikfu0
         XzX3AtLXRgRTd5RADFnQ5gEiKWT33LXs5K6FAL1UMm1UFOo06mGbPlHjc8JfvD5dpiX5
         nLig+AkxyaN4NBblcrEK+Job2nyrV6kUJ1Pp02oWu9mYXMboR39BBL2h4avKey2iCa0/
         A4Uya4VDNmPKYXG/QVYQqDyCqtusNKsNO5ReBq7uHyXePAArlWgN7gBT5nJJtGPLwCBd
         QW1+ScNXvjyOzSa6ymklU15oMLIvJmznc2oujCyw0Ydx2OLxF/Dx3SSzSQOM81xBMpRu
         A6zg==
X-Forwarded-Encrypted: i=1; AHgh+RpVbVXceO3eLDv8+tl9b7vVur3U9r8E4nyph0Kqbdw6CBqBdnsCkKoYog1nImkTRljt9WtX1go/0RIv1OtsSFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvbbCGMWS61f3XWvcMJnBtUNpwqTaUh//CWDlDxGvMWSqGTUuL
	h7mQwI8ALi22PUHV6oQleLCuWMdQWKpiKfRLXp50KH2miUuP4CRUawst
X-Gm-Gg: AfdE7cnEBuOvHtsd3IYIEMmcCHxQoJZawq0sgnzToB+eqQ8zyA6iAkNqPLF+oRKvb20
	MrNO4MReX6PyOt1BBRnBgP77GB3dMNQF+k+bjT12lfjduM5O4A5RcZaz1AQmF7gUQs26SHgcsbd
	G12B651iqnS1rRvy/1tGyhHBbBi57dX/awPtyYCVB6Q/TZLgpg2vAnOEzb8sD8qkCvO8jSQr0Kk
	39Bp6N8c6hgBHQ1UE2UtT414IVaQ9iy+9cFxxhMtTbxFD8Z8uFek6CJoPqCFrrmgBi2ZDeojHBw
	f2cYjXxM1jbFX7tCzk6i0JgLWW/E4/LgZQrUFADU00KhxV1lUBdRdb666c1Gniz8mBQB3Asxpm7
	ZjC5AlkCYxsBdlum+hOYcwv2FwDqA7VnTcHYQfNr650cqhqIa8WVj2Mp3RvYulUeyAMmI8frXw9
	t6yQlejZ4/L9g=
X-Received: by 2002:a17:90b:47:b0:37e:b6a:6cdf with SMTP id 98e67ed59e1d1-38dc77ee830mr7343814a91.20.1783904631435;
        Sun, 12 Jul 2026 18:03:51 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a55a47286sm5549380a91.10.2026.07.12.18.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:03:51 -0700 (PDT)
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
Subject: [PATCH v6 1/8] RISC-V: KVM: Add support for Svadu FWFT features
Date: Mon, 13 Jul 2026 09:02:54 +0800
Message-ID: <20260713010302.303278-2-inochiama@gmail.com>
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

Hardware updating of PTE A/D bits is controlled through ADUE bit in
henvcfg Expose the feature only if both Svadu and Svade are supported
for VS-mode.

Allow the VMM to enable/disable this feature by change the ISA
extension state in the guest.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/vcpu_sbi_fwft.c    | 76 +++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 504e73305343..7bbea8812d92 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -240,6 +240,7 @@ struct kvm_riscv_sbi_fwft_feature {
 struct kvm_riscv_sbi_fwft {
 	struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
 	struct kvm_riscv_sbi_fwft_feature pointer_masking;
+	struct kvm_riscv_sbi_fwft_feature pte_ad_hw_updating;
 };
 
 /* If you need to interpret the index values, here is the key: */
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index ab39ac464ffd..4d474a439b29 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -94,6 +94,45 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
 	return false;
 }
 
+static void kvm_sbi_fwft_env_flag_reset_helper(struct kvm_vcpu *vcpu,
+					       u64 flag)
+{
+	vcpu->arch.cfg.henvcfg &= ~flag;
+}
+
+static long kvm_sbi_fwft_env_flag_set_helper(struct kvm_vcpu *vcpu,
+					     struct kvm_sbi_fwft_config *conf,
+					     bool one_reg_access,
+					     unsigned long value, u64 flag)
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
+	if (!one_reg_access) {
+		csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
+		if (IS_ENABLED(CONFIG_32BIT))
+			csr_write(CSR_HENVCFGH, vcpu->arch.cfg.henvcfg >> 32);
+	}
+
+	return SBI_SUCCESS;
+}
+
+static long kvm_sbi_fwft_env_flag_get_helper(struct kvm_vcpu *vcpu,
+					     struct kvm_sbi_fwft_config *conf,
+					     bool one_reg_access,
+					     unsigned long *value, u64 flag)
+{
+	*value = (vcpu->arch.cfg.henvcfg & flag) == flag;
+
+	return SBI_SUCCESS;
+}
+
 static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
 {
 	return misaligned_traps_can_delegate();
@@ -137,6 +176,34 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 	return SBI_SUCCESS;
 }
 
+static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
+		riscv_isa_extension_available(vcpu->arch.isa, SVADE);
+}
+
+static void kvm_sbi_fwft_reset_pte_ad_hw_updating(struct kvm_vcpu *vcpu)
+{
+	if (kvm_sbi_fwft_pte_ad_hw_updating_supported(vcpu))
+		kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_ADUE);
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
@@ -246,6 +313,15 @@ static const struct kvm_sbi_fwft_feature features[] = {
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
2.55.0

