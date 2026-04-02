Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4776F3D564D
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 22:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775169086; cv=none; b=SeK2HpIVVRm80nLU1YVMtxPvMwPku1gpsXquw+kEix53tGuSRtIbSeLXHSi0bFxVI+gAwKqfVoWccAanHElBzxYdAFIhwE7384gwQyioxpYsvu8t4PPM0BE2OVL08TgpTxS5fwN1BNkzsCeUBHNu/SvUOcVpNIfnjGgOhRy1Dg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775169086; c=relaxed/simple;
	bh=2axWC7rSpfo1Ux1mFi8UKcDwY0vxJjAlHlUYTr8WnMs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K2f5rDW+frBJF98eexmr+qj+mC7n82Ut5nj/IlPZJ4xHMwQuKwAUliiC564llEKh27KgNahjZjlBNVx6mb7QuWVhz2/xyTeD91Z3VxgWNI3N71Z7tOfkny/0j4mtJTkauPOucHMnFbMski14pWKIAFD8jRE999H/Vhf0h089Tl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dsByEcdO; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dsByEcdO"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b6097ca315bso2069129a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 15:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775169084; x=1775773884; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G9VxIt/QC+wvaJMeAiAEA/72WqjqT+VIQVSryV8GEWo=;
        b=dsByEcdOaKkzRdImSWYk/IBJv8qHEv3zf9YdLCDWa33GqdV1cpXY85J+y6Hj7ngreF
         CvEwe78r8MZLG82iC5qsLRkW2ON47hmBKHuMPnIGauvPMb/DI1fho1GtMw3UnNypJ/Tn
         HZt3V4ORq0+5legQGDBM5k7k3z2OLIShxGWEMXQTQl8jYyCxZR1GOxSnfj73OUj9zG6n
         LKpYmSIGeXMmHoaTHGdx2qHlFVE8uphQ+c2KuV096Mwxi0Z2p0uqMLjs7BKduSmhSXn7
         pBHqYTswORR/6O9NVwssn3k+CrwFQEbiix5+6DYK0Q98tkFFE0Nzqaq0xPtE+D1z6tdZ
         bq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775169084; x=1775773884;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9VxIt/QC+wvaJMeAiAEA/72WqjqT+VIQVSryV8GEWo=;
        b=FWCrQsaWD6xjYY4RJtqIiE0/ueYak+KzJKPAK5EDIn31fLv4wxLRM6sCxI3v63pYm/
         qmtZlC5UYIzx9z06s/pEoNqol4kysQCj6/OPV0Of3Bajx1Rl2QCPhWTAhGIqKEoJfW/W
         K7TIaLyA8wD57iyi966nwzdgagTvPuThr8P+aWMxJxy6GDy+FmUKeWOK+b7ka6Bb2p8Z
         Cg4VWuUm/8pJMguL7cN1DAYzjGgDu9xRx41U1zeunSsPSD59FwE/UlSUCNjFm8AffpQ0
         2mvMkQhTamCsqHRIH9RAju2W/D+FsD6prq1fCo3IFHpv7rd9PoxG7/qGcfHZKGEIbqz8
         gtlg==
X-Forwarded-Encrypted: i=1; AJvYcCXf5xdgLrJ29jxaeXD2EI7hzGppWJMSx35oVIvLmQAV7x67YS8kszWDxKv8cdOIeSMI0tCLXddCuaxGMtyAzy4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5S/4Pxb0n8DP8VzjDDYspLtxXO+vCvrN/+928cLeDAZRJEmsw
	NEyb5aJhaupVA426XsJOLp8I5fiwhcNt7tTMfq6aGhd9AFGi8FL0QGugdWsnDcy1aF6cl8zkgj3
	ZoEsOmOxfgV3+kg==
X-Received: from pfog24.prod.google.com ([2002:aa7:8758:0:b0:82c:6ae6:e5b])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2e85:b0:82c:6aee:b21a with SMTP id d2e1a72fcca58-82d0dba215cmr714519b3a.45.1775169083320;
 Thu, 02 Apr 2026 15:31:23 -0700 (PDT)
Date: Thu,  2 Apr 2026 15:31:01 -0700
In-Reply-To: <20260402223108.650572-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260402223108.650572-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260402223108.650572-3-jmattson@google.com>
Subject: [PATCH 2/3] KVM: x86: Virtualize AMD CPUID faulting
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Clayton Pence <ctpence@google.com>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

On AMD CPUs, CPUID faulting support is advertised via
CPUID.80000021H:EAX.CpuidUserDis[bit 17] and enabled by setting
HWCR.CpuidUserDis[bit 35].

Advertise the feature to userspace regardless of host CPU support. Allow
writes to HWCR to set bit 35 when the guest CPUID advertises
CpuidUserDis. Update cpuid_fault_enabled() and em_cpuid() to check
HWCR.CpuidUserDis[bit 35] as well as
MSR_FEATURE_ENABLES.CPUID_GP_ON_CPL_GT_0[bit 0].

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/cpuid.c   |  2 +-
 arch/x86/kvm/cpuid.h   |  6 ++++--
 arch/x86/kvm/emulate.c | 14 ++++++++------
 arch/x86/kvm/x86.c     | 19 +++++++++++++------
 4 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index e69156b54cff..db54fac61da9 100644
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
index 51cbe67c992a..cb285962a956 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -188,8 +188,10 @@ static inline bool supports_intel_cpuid_fault(struct kvm_vcpu *vcpu)
 
 static inline bool cpuid_fault_enabled(struct kvm_vcpu *vcpu)
 {
-	return vcpu->arch.msr_misc_features_enables &
-		  MSR_MISC_FEATURES_ENABLES_CPUID_FAULT;
+	return (vcpu->arch.msr_misc_features_enables &
+		MSR_MISC_FEATURES_ENABLES_CPUID_FAULT) ||
+		(vcpu->arch.msr_hwcr &
+		 BIT_ULL(MSR_K7_HWCR_CPUID_USER_DIS_BIT));
 }
 
 static __always_inline void kvm_cpu_cap_clear(unsigned int x86_feature)
diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index 6145dac4a605..41d6c3ffa6e7 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -3593,13 +3593,15 @@ static int em_sti(struct x86_emulate_ctxt *ctxt)
 static int em_cpuid(struct x86_emulate_ctxt *ctxt)
 {
 	u32 eax, ebx, ecx, edx;
-	u64 msr = 0;
+	u64 msr[2] = {};
 
-	ctxt->ops->get_msr(ctxt, MSR_MISC_FEATURES_ENABLES, &msr);
-	if (!ctxt->ops->is_smm(ctxt) &&
-	    (msr & MSR_MISC_FEATURES_ENABLES_CPUID_FAULT) &&
-	    ctxt->ops->cpl(ctxt))
-		return emulate_gp(ctxt, 0);
+	if (!ctxt->ops->is_smm(ctxt) && ctxt->ops->cpl(ctxt)) {
+		ctxt->ops->get_msr(ctxt, MSR_MISC_FEATURES_ENABLES, &msr[0]);
+		ctxt->ops->get_msr(ctxt, MSR_K7_HWCR, &msr[1]);
+		if ((msr[0] & MSR_MISC_FEATURES_ENABLES_CPUID_FAULT) ||
+		    (msr[1] & BIT_ULL(MSR_K7_HWCR_CPUID_USER_DIS_BIT)))
+			return emulate_gp(ctxt, 0);
+	}
 
 	eax = reg_read(ctxt, VCPU_REGS_RAX);
 	ecx = reg_read(ctxt, VCPU_REGS_RCX);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 9768f001011d..430e583c5e62 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4002,22 +4002,29 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
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
+			valid |= BIT_ULL(MSR_K7_HWCR_CPUID_USER_DIS_BIT);
+
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
2.53.0.1213.gd9a14994de-goog

