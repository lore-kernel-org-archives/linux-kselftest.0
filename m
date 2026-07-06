Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8124737D11F
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 02:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304514; cv=none; b=IaoAhyjcX+9KV0ZF//2qrDr5HBhZC1Zl1ClZJVeD0dmkAdtV/F4nHPc/xQJUfX1pP5nVYB2P8UMoJxUc+Lphgx8rULop+HKQZeZLe7zraw4npLnpAQqxEcLnEn6YwVZsNb8W2kmqySNSlREN13q2sm+kkY7qhVQbFJvQP/AMD54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304514; c=relaxed/simple;
	bh=xUWjot3o/UW2AYm0cut74y3CUCJ2aaBQExLNIGV27bQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PhacFCsnn3NimhMbXb7ZCD4mBY345zJsDbXpDQVLFMwzCErujLYYuqRp2b+sIe9A2ylDCoPuPTpsA99voHzwoqDJmmxfkMQOsx/hflvZs2rYekAuUd0uQzta4qtETqmwBIcyVJMTRp5gdzCipElNP+CCxXiQMPWXcpSkdkSo1uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sO16Cd8P; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sO16Cd8P"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-847d1e9db22so2711434b3a.2
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Jul 2026 19:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304509; x=1783909309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFcPWOXG75NR/iWK/MZoyd4Y1PWwUnS/8myjKfeqZQg=;
        b=sO16Cd8P1AtZF9xrjizBbaMk4ul28cBO1qrWDWlZGyhK3DwFSfAliNG3TS2Qnp25g0
         nbaZbS8zxIOdLMIY8rWrsf+y5TGjhxvEiV56y+SwEmnoWOLE1f4ZElYAA6W6KNoWrJq7
         nyPD2pki2V+ngcrXsZz/Mg4+l+Jpfdj1cDUA0L4Fhwof7fTqH2qDALcs7xQlT+dYkkA2
         A3mEug7JDBUKyXHdTNaE3Qt+qbtK/6PeOHT1dAfazgULz94frfIzjXmxY/Mt9T+zBYTr
         hQFGGwTSCTu+/elTHgZa4f8//wLH8y63xZCsOdFQiYqjWCLMJg4w105i326dT+fZ+TcV
         OkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304509; x=1783909309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PFcPWOXG75NR/iWK/MZoyd4Y1PWwUnS/8myjKfeqZQg=;
        b=qnMTjNdXMRqcWyJ7yP7UlJI09MdbF96DdDy6uz58QuksUH4OCcQqQ7ttMboSfOCCfG
         zM6a5G8CM3H0I7xarXwRMPKBI5zH5q+r5U849n1j4W78D06n1RSxhfbJzahXRMhp/cB1
         8mNsWn3dKcVyqG7BUJDlZwIts7KexM5aIKw8sz1GcQ4URnmQ3F5s3Z+H7xh5k98M5d77
         9iZBITt0urPIZmtzGecJQtELG092yTn3TLi42rJQ5Nq8polzZ4xNg6jujrGfONAz0AwK
         XQvdyfW/nQWTZomLxLg0mF09g6kc5Zs6DrPbI6GiQPWMTqTWI7Lei91WxwrcpATAzpWQ
         h3ng==
X-Forwarded-Encrypted: i=1; AHgh+RoKFtujxtV04KpY5mRKewOUbn14SooU10MyyFeL5j0QO0DnUoargGyaEwzFyQ4fhUpXRx1kqRktrGOqOs6LALY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDt+fBuHeCOZYQ638PfjAyFY5JiOtNjveA2McLTKXwNbmfUmJc
	I5REzgPIBIk/OJ2JraMAMbNMI8SMpAUKLMEbWtp0azKDpNPK8xxEZ+/b
X-Gm-Gg: AfdE7clF1Gz5nLT6yyPtuuVtRZhWACJ9GUSUyxCclq8Yao9UQVoS/1+yXwd36oBS4TH
	xj5av3u5B7Cemzc0RIQKCvUiZslXP9FG1uCkn2aYuSpkr/HKJYOoYum/p+FpM7Pxk3LNw1Nq9hG
	kWXx3hf4cydg3kGIFksAHURbM2HzVr+cTD3ka53kCcco7MDFpdNYlNuuFfHfnTiN78SfWMMTjeY
	JpqgjOPPg4s+OFz3qrYxg3pUv9/ygXIwXFPP4rjurV5lMbcx6m4Yjh+11Q49Z3yd7PJlFNc21sg
	wmtFiVIhmWsK0FHmI6xeEWGJdPzADKaqCxTa1i+Lt3QlYFuyo4PLaDaY5JaH6KZFFzuwfVIraCv
	CJdupHnnyJxwawcWB6EZcEgBGLiP0cmxl+v7Dac9JpX6FKr4wV183HvEb6t0rrqvd
X-Received: by 2002:a05:6a00:808a:b0:847:8107:1bd7 with SMTP id d2e1a72fcca58-847f6f58543mr7697544b3a.53.1783304509008;
        Sun, 05 Jul 2026 19:21:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm2857238b3a.24.2026.07.05.19.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v5 7/8] RISC-V: KVM: Add support for control-flow integrity FWFT features
Date: Mon,  6 Jul 2026 10:20:43 +0800
Message-ID: <20260706022046.214956-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706022046.214956-1-inochiama@gmail.com>
References: <20260706022046.214956-1-inochiama@gmail.com>
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
index 01db40b53295..bc514ae6521d 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -177,6 +177,95 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
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
+		ncsr_write(CSR_HEDELEG, cfg->hedeleg);
+		/*
+		 * Both Bit LPE and SSE are in the lower part, so it is safe
+		 * to only write the henvcfg
+		 */
+		ncsr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
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
@@ -314,6 +403,24 @@ static const struct kvm_sbi_fwft_feature features[] = {
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

