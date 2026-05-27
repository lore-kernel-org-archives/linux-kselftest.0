Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5751451071
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 17:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779903849; cv=none; b=j59BAklMn3QTaqYScX55WxJraGUR7ZESGGPfX23HHqNDLYbGJbVwhBHdqabD5yl+gozCsdCIrmoRsKjPvfLwy37AISg56NMBDEiqTdm9j9NZAsiiShloi25navkrBACX2MbBfeftrdPxzZxWiB2ufeiEq1M/v9kVTOLdutOq4bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779903849; c=relaxed/simple;
	bh=g92puMUS5q4qjw4cCB0B3jIHADA2n8iUKrYZu5tW+Vs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hvIrVbujxr6dej/TDdh/kP+RkVk99NrHb6WjOErZV9jBVflFK1ayRN1fmk8dI55mFe6sHwdxRR8MXl/S0e1EOs/wW4QUo8C/X0HxT0MnFSilhyoCetbk+qiNjueqBbwwUlxEG7V6RkPfrx+SeCAK8v2sET51wtVfA0wXIeNzd5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=czn7fz4L; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="czn7fz4L"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-83536dc3be5so13881551b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 10:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779903846; x=1780508646; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k3wATNCkoFXn3WUzHEjzhnXj8xnV0EDTL1EvmQz7WMw=;
        b=czn7fz4L9v1GLjG5p1O7OX+5XbP14kY/kHZ48DoZ//vtbR/7lN6KRp1crQ42GiyBX4
         ipLIAkNEon6Bv41gRCMhJtwDFRpOIS/809c0nwRkkQmqd5lVXoueRkY0O246NE5LrNdh
         3/otNJMmeNUBlNqEnvVDFz4F+pDJAXi2W0Z4BVXkD0isnXw0H+6KtRxKVM98wZLFGbgW
         PW1WyodesY96RHJV51hBUvJNXJh3W7d7VkIqm8cVlR9mEYl16qIdLkrmFZX3P00vXcqC
         GEC/ZOzkw1Ghtzo8suJjYpwQ5jg/tUp/TWq9FwK81Qii7zadyBAK+2fT0e/vmzi1QgEL
         5wSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779903846; x=1780508646;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k3wATNCkoFXn3WUzHEjzhnXj8xnV0EDTL1EvmQz7WMw=;
        b=rhH8akETN6FcOLr6SjTDL5kOXsd6InogI4jfIc33gechr5Tck65Sqx7uG77CoyX1A1
         oRkan2FMpPWLq74FvU67T9bZkT0MQ5/hQ6Wt79QCVivMVFaAQX7ZKQi+NBHSZ5+VQgaw
         8li/XyxQiXbn/3EkR41LVHGVIlmznccO/w+FzKkf2FAyCfsDSe/1hwoshFuIeh6Zd+aL
         XiVpY+qOhYk/K7t8Q8bByn4krUDLNoH703g2X1LiE6dpaFf2U+MrchMTI9tlPyHM/4hD
         VKjPUEbTvNhg+1mpKf1NWYMnqtlgF7/8OWGHUa7LsmuoK+E7izCKVVqvDPSHLHnKBseS
         TNFg==
X-Forwarded-Encrypted: i=1; AFNElJ/k7a7528QzqhDN8bs8uOVIzNgvBUJAknDrISSHl9xOkafCt+RN7p9/KXD3nJxN1rEX/POo+fTZNJHLFosMnxc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0UQ2omvs3r+GPiRU3m6n/5RAm517USRSctowjpfogwc8Jmis
	Mhg7wxt8sy6XTXEBLmDG8o5tyWtAZpKMvh6xYNJVrxHA7SIUG8Gz3ibd9QR5WCmoCDCF6hHB2bD
	2g75NJzW4vH/sTw==
X-Received: from pfuj10.prod.google.com ([2002:a05:6a00:130a:b0:836:6e32:7280])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:715:b0:841:69e4:f21b with SMTP id d2e1a72fcca58-84169e4f7f5mr15277392b3a.39.1779903845550;
 Wed, 27 May 2026 10:44:05 -0700 (PDT)
Date: Wed, 27 May 2026 10:43:46 -0700
In-Reply-To: <20260527174347.2356165-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527174347.2356165-1-jmattson@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527174347.2356165-5-jmattson@google.com>
Subject: [PATCH v4 4/5] KVM: x86: Virtualize AMD CPUID faulting
From: Jim Mattson <jmattson@google.com>
To: seanjc@google.com, pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	shuah@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, ctpence@google.com, David.Kaplan@amd.com, 
	binbin.wu@linux.intel.com
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

On AMD CPUs, CPUID faulting support is advertised via
CPUID.80000021H:EAX.CpuidUserDis[bit 17] and enabled by setting
HWCR.CpuidUserDis[bit 35].

Advertise the feature to userspace regardless of host CPU support. Allow
writes to HWCR to set bit 35 when the guest CPUID advertises
CpuidUserDis. Update cpuid_fault_enabled() to check HWCR.CpuidUserDis as
well as MSR_FEATURE_ENABLES.CPUID_GP_ON_CPL_GT_0.

Unlike VMX, SVM prioritizes the CPUID intercept over the #GP induced by
CPUID faulting.[1] This behavior has been confirmed on a Turin CPU (F/M/S
1AH/2/1).

Link: https://lore.kernel.org/r/DS7PR12MB82011943131DF5415365E19E940B2@DS7PR12MB8201.namprd12.prod.outlook.com [1]
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/include/asm/msr-index.h |  1 +
 arch/x86/kvm/cpuid.c             |  2 +-
 arch/x86/kvm/cpuid.h             |  5 +++--
 arch/x86/kvm/x86.c               | 18 ++++++++++++------
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index a14a0f43e04a..f534f150d1c5 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -898,6 +898,7 @@
 #define MSR_K7_HWCR_IRPERF_EN_BIT	30
 #define MSR_K7_HWCR_IRPERF_EN		BIT_ULL(MSR_K7_HWCR_IRPERF_EN_BIT)
 #define MSR_K7_HWCR_CPUID_USER_DIS_BIT	35
+#define MSR_K7_HWCR_CPUID_USER_DIS	BIT_ULL(MSR_K7_HWCR_CPUID_USER_DIS_BIT)
 #define MSR_K7_FID_VID_CTL		0xc0010041
 #define MSR_K7_FID_VID_STATUS		0xc0010042
 #define MSR_K7_HWCR_CPB_DIS_BIT		25
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 1c95d1fa3ead..8e5340dd2621 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -1248,7 +1248,7 @@ void kvm_initialize_cpu_caps(void)
 		F(AUTOIBRS),
 		EMULATED_F(NO_SMM_CTL_MSR),
 		/* PrefetchCtlMsr */
-		/* GpOnUserCpuid */
+		EMULATED_F(GP_ON_USER_CPUID),
 		/* EPSF */
 		F(PREFETCHI),
 		F(AVX512_BMM),
diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index 95d09ccbf951..fc96ba86c644 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -185,8 +185,9 @@ static inline int guest_cpuid_stepping(struct kvm_vcpu *vcpu)
 
 static inline bool cpuid_fault_enabled(struct kvm_vcpu *vcpu)
 {
-	return vcpu->arch.msr_misc_features_enables &
-		  MSR_MISC_FEATURES_ENABLES_CPUID_FAULT;
+	return (vcpu->arch.msr_misc_features_enables &
+		MSR_MISC_FEATURES_ENABLES_CPUID_FAULT) ||
+		(vcpu->arch.msr_hwcr & MSR_K7_HWCR_CPUID_USER_DIS);
 }
 
 static inline bool kvm_is_cpuid_allowed(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index d5a2d794c3c9..54c552efb59e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4002,22 +4002,28 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		break;
 	case MSR_EFER:
 		return set_efer(vcpu, msr_info);
-	case MSR_K7_HWCR:
-		data &= ~(u64)0x40;	/* ignore flush filter disable */
-		data &= ~(u64)0x100;	/* ignore ignne emulation enable */
-		data &= ~(u64)0x8;	/* ignore TLB cache disable */
-
+	case MSR_K7_HWCR: {
 		/*
 		 * Allow McStatusWrEn and TscFreqSel. (Linux guests from v3.2
 		 * through at least v6.6 whine if TscFreqSel is clear,
 		 * depending on F/M/S.
 		 */
-		if (data & ~(BIT_ULL(18) | BIT_ULL(24))) {
+		u64 valid = BIT_ULL(18) | BIT_ULL(24);
+
+		data &= ~(u64)0x40;	/* ignore flush filter disable */
+		data &= ~(u64)0x100;	/* ignore ignne emulation enable */
+		data &= ~(u64)0x8;	/* ignore TLB cache disable */
+
+		if (guest_cpu_cap_has(vcpu, X86_FEATURE_GP_ON_USER_CPUID))
+			valid |= MSR_K7_HWCR_CPUID_USER_DIS;
+
+		if (data & ~valid) {
 			kvm_pr_unimpl_wrmsr(vcpu, msr, data);
 			return 1;
 		}
 		vcpu->arch.msr_hwcr = data;
 		break;
+	}
 	case MSR_FAM10H_MMIO_CONF_BASE:
 		if (data != 0) {
 			kvm_pr_unimpl_wrmsr(vcpu, msr, data);
-- 
2.54.0.794.g4f17f83d09-goog

