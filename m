Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0173A3E78
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 06:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036129; cv=none; b=rrIJOiUr3jXPAg4n2YbwHUhzw7x3h7esSI83PF4tU5OAgjabCvOFRvd9RyQ7Hye8dUhWnORMxHULzrvGPKJXWGooGKOf8wHFkGi76+MkhfKpQWsaq2TDLSGMJhIy4UcQo2cRAky30KND4XUpgkwV2Ty8ZevoibA3uUIFhlJj08Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036129; c=relaxed/simple;
	bh=gufrfTZMS1eYNpCVXosGyGtRLMto/FMoEgCvhEzoK+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVlBstWPjsbKvxqQOh/TAJUWULFVrXZYVq1h9+Ukx0GJaowiNEBn5A0j8hC/4l9uQEMsIlBKFY9jhBLrLBQ1WhaibQlGgncx9SRYwETtRwQ5n0J147jkLmdbFxpok4rN3uucezTp5aqsdzrWlPj+KU1xXFmsilMry+SE8lW129I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=eIuW1e1E; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="eIuW1e1E"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304d555293aso124793eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 23:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780036124; x=1780640924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NB+TMW9/jFeVQq09mC6JlH7aNglQQ/HmhdkvMfkdL10=;
        b=eIuW1e1EwFv3xQxnEYpEwVcmQP95EU/pP2Bq30khrAvnXiycNtUXZMGC/H7+tmPW5f
         kICyxEiXJAWCHxSW/Yf2sGaXASHK+mmwE4ZPPu4QjgSKSLYXT1F61QcbIDFRMEG7C6cy
         z8YMEjeG1F7usNeuoshMjHlpIEboEGo4UJtWJHEROl0ibr4bDnxysT5XgLk0Dx5mCTtZ
         KTGM3r2NpDk8gLgug/aqtYhsR/02LQNs48M6E+DEqC553teQ3XUIEcnam/Hzt7ANua33
         6ZahTehafIwTBRsH6QJ6Gp8yrt3grHdAwpcMT+4sGQE8YQjkshPVcoam8mA8azbNuMkZ
         M6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780036124; x=1780640924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NB+TMW9/jFeVQq09mC6JlH7aNglQQ/HmhdkvMfkdL10=;
        b=OKhVHjG1roJw7kEV472GtuY5fe4Gc2V1M8FjMIbo+/1Ty1D8WFttSjOKRnhB/Al2Ow
         r1Rjkohm3tPSiIy6UVgNtVrfdyznvgjDmdl/nH0f0lNVjimlkN1hYwrOq26HVRYgHy83
         Hx3xu9iCXurWxTmrcupbYVHvMmBjvY4LQTk2nMN+pK+jTV83+Y0m9M1Iykybu86mrXQh
         S0FRKn6d4qV7zHWlVDvAagvWVMvn4Dh/GcOT9bneW7rWtS/8A/PW1RnJ6kM03Vktf2ns
         4Z4xxZDowwOPut4Z6hPh5VU963F9SPIVqs5HbEZV6QmsCEUuyIwDFE0JDIXndCrFA//x
         gPfw==
X-Forwarded-Encrypted: i=1; AFNElJ8WJvTxHSsMp+ou4V6rkrzjytJz7WwlukMkzwjESnX4ePuujHxZxTmrew0CPPyKaIXTOwBw5TzjX5nqG0m10e0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxJ2JmHxY8JoRPCUYdCPe1Vv3Bq5xkrE23ELRifQjVs151K+fn
	iawCj6xaL3pFZmeiqlu5vxSXHnnl9AkUP27zEasZ3JW+He5WlOxKtNMIfgDqAx7bOuo=
X-Gm-Gg: Acq92OHXa8QaYxh/TTlUsyTjIFBuxmSs0CXqgG34ozPpjh82PQbpL2YhsMIKFA4w/tp
	PwjPf0Fw5wroDeBN5/SSc6sABnanW8iM7c+7xiocgKIjHO79MjJ2NYNkYUl6Tyjb2XvNejPciq1
	7Cq3Oad6XYR14pUA/DlWL1PFv3VcJ2iHaU72hCZ0M9atLlvM1ft16BKKEztln9LBh6yjeLUsLf6
	wyyca132kwLC6XPhOUdeer1DvyqqxIajA6/bq6ie1EIx6pIVDFtfaY9oCD6RC6c87Cl8/piMEZS
	bAqDd5EiS8cx0vf3dXcRS5D6JHBVxHYXZcLfAJDUyuy0Tw2X7V0TXMHKxBbL9w3cZJ/by9nUBM6
	MpkTlQh+z8nQId1yLQsE2S2UruXjRMvPTUTe1nr3VD0fb76Wm19HV+mfGyWAbjhFUh38nvMOg3I
	Oe/czP2x9paChU4z2HmhwTvTIDAPLHZxlo4GlF+FpjQtiTo+WDCl2APA==
X-Received: by 2002:a05:7301:3e18:b0:2e7:c701:aa85 with SMTP id 5a478bee46e88-304eb1fbfeemr788995eec.17.1780036124198;
        Thu, 28 May 2026 23:28:44 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed3358b1sm694607eec.13.2026.05.28.23.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:28:43 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu, 28 May 2026 23:28:27 -0700
Subject: [PATCH v3 1/3] KVM: RISC-V: SBI FWFT: Fix stale feature exposure
 after runtime extension changes
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-kvm-get_reg_list-v2-v3-1-170969a8599f@sifive.com>
References: <20260528-kvm-get_reg_list-v2-v3-0-170969a8599f@sifive.com>
In-Reply-To: <20260528-kvm-get_reg_list-v2-v3-0-170969a8599f@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780036122; l=5665;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=gufrfTZMS1eYNpCVXosGyGtRLMto/FMoEgCvhEzoK+g=;
 b=WWBCwq4jwkp6SRoxOcz1Jqdq+qxsnLAk5+EHEMyZpoZoggSowU9LIrRhG1Qp2dAA/kMgX6pIr
 cPdeKvX0qchBNiYTAP5ttS8UXUQdcjMuvfybLhSsR98eOz9wk6ya0ST
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=

Fix a bug where FWFT features could be incorrectly exposed to guests
after userspace disables their dependent ISA extensions at runtime.

The 'supported' field in kvm_sbi_fwft_config was set once during vCPU
initialization based on the initial hardware/extension availability.
However, when userspace subsequently disables ISA extensions via the KVM
ONE_REG interface, the 'supported' field was not updated. This caused
the following issues:
1. FWFT features would remain visible and accessible to guests even
   after their prerequisite ISA extensions were disabled
2. Guests could configure FWFT features that depend on disabled
   extensions, leading to undefined behavior
3. The static 'supported' flag and the dynamic supported() callback
   could disagree about feature availability

The fix introduces a two-layer checking mechanism:
1. Add an optional init() callback to the kvm_sbi_fwft_feature structure
   for features that require hardware probing during initialization. This
   separates the one-time hardware detection logic from the runtime
   availability check.
2. Add runtime checks in all FWFT-related functions that call
   feature->supported(vcpu) if the callback exists. This ensures feature
   availability is re-evaluated based on the current ISA extension state.

This approach maintains the cached 'supported' field for initialization-
time decisions while ensuring runtime availability is always determined
by the current vCPU configuration, not initialization-time snapshots.

Fixes: 6b72fd170592 ("RISC-V: KVM: add support for FWFT SBI extension")

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 2eab15339694..dde6e39aab5e 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -35,6 +35,16 @@ struct kvm_sbi_fwft_feature {
 	 */
 	bool (*supported)(struct kvm_vcpu *vcpu);
 
+	/**
+	 * @init: Probe and initialize the feature on the vcpu
+	 *
+	 * This callback is optional. If provided, it will be called during
+	 * vcpu initialization to probe the feature availability and perform
+	 * any necessary initialization. Returns true if the feature is supported
+	 * and initialized successfully, false otherwise.
+	 */
+	bool (*init)(struct kvm_vcpu *vcpu);
+
 	/**
 	 * @reset: Reset the feature value irrespective whether feature is supported or not
 	 *
@@ -137,10 +147,12 @@ static bool try_to_set_pmm(unsigned long value)
 
 static bool kvm_sbi_fwft_pointer_masking_pmlen_supported(struct kvm_vcpu *vcpu)
 {
-	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+	return riscv_isa_extension_available(vcpu->arch.isa, SMNPM);
+}
 
-	if (!riscv_isa_extension_available(vcpu->arch.isa, SMNPM))
-		return false;
+static bool kvm_sbi_fwft_pointer_masking_pmlen_init(struct kvm_vcpu *vcpu)
+{
+	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
 
 	fwft->have_vs_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
 	fwft->have_vs_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
@@ -231,6 +243,7 @@ static const struct kvm_sbi_fwft_feature features[] = {
 		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pointer_masking.enable) /
 				 sizeof(unsigned long),
 		.supported = kvm_sbi_fwft_pointer_masking_pmlen_supported,
+		.init = kvm_sbi_fwft_pointer_masking_pmlen_init,
 		.reset = kvm_sbi_fwft_reset_pointer_masking_pmlen,
 		.set = kvm_sbi_fwft_set_pointer_masking_pmlen,
 		.get = kvm_sbi_fwft_get_pointer_masking_pmlen,
@@ -281,6 +294,8 @@ static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu, u32 feature,
 
 	if (!tconf->supported || !tconf->enabled)
 		return SBI_ERR_NOT_SUPPORTED;
+	else if (tconf->feature->supported && !tconf->feature->supported(vcpu))
+		return SBI_ERR_NOT_SUPPORTED;
 
 	*conf = tconf;
 
@@ -365,6 +380,9 @@ static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
 		else
 			conf->supported = true;
 
+		if (conf->supported && feature->init)
+			conf->supported = feature->init(vcpu);
+
 		conf->enabled = conf->supported;
 		conf->feature = feature;
 	}
@@ -408,6 +426,8 @@ static unsigned long kvm_sbi_ext_fwft_get_reg_count(struct kvm_vcpu *vcpu)
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 		if (!conf || !conf->supported)
 			continue;
+		else if (conf->feature->supported && !conf->feature->supported(vcpu))
+			continue;
 
 		ret++;
 	}
@@ -430,6 +450,8 @@ static int kvm_sbi_ext_fwft_get_reg_id(struct kvm_vcpu *vcpu, int index, u64 *re
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 		if (!conf || !conf->supported)
 			continue;
+		else if (conf->feature->supported && !conf->feature->supported(vcpu))
+			continue;
 
 		if (index == idx) {
 			*reg_id = KVM_REG_RISCV |
@@ -465,6 +487,8 @@ static int kvm_sbi_ext_fwft_get_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 	if (!conf || !conf->supported)
 		return -ENOENT;
+	else if (conf->feature->supported && !conf->feature->supported(vcpu))
+		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {
 	case 0:
@@ -502,6 +526,8 @@ static int kvm_sbi_ext_fwft_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 	if (!conf || !conf->supported)
 		return -ENOENT;
+	else if (conf->feature->supported && !conf->feature->supported(vcpu))
+		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {
 	case 0:

-- 
2.43.7

