Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA2B40FDB8
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 17:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260048; cv=none; b=pXrsQZeoTsEIv0fFO6lycJZOhobR2greRwWYp/GOU6AVSqwOYDVTV06cIVf+W1yhB4Q+H6DhYq1WJZQ0Wg4/STAXeA3jxxu1TmVMpv05DohYPWYcGfz02HNWF1KXB5V6L2ZlvPtMFL7WMJgz6ibSubvZyGSKdhiel+R8CGIpPy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260048; c=relaxed/simple;
	bh=MrGjQ4HWAdYvkD0eUuvTAyi7epRc7ljtg5YdO1PiTn8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rBMSAQEBGkv41n1d+3KWFnFA5hDPFbb794gadSd9LTzB6zSu1aoq6pvltXYQY41Vq0LgnX6RcjXc4W/yPa9iEwxK3KPIH+YgITRMu/++fYZzLdRthIKaaXavN8FCxLW1WRi4P7JwDCzfean8ydLhlJIgoAqek2QPLja2sYH6O8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qz/wq38U; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qz/wq38U"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso1596477b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 10:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778260045; x=1778864845; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYkAOVRIhnDcm5m8BRbL+GbCpCTtOZQWAsAfzCP5X/g=;
        b=qz/wq38UaOquRTIEuXvlCKTodEwAaH5jxRSNKy18GsRNAE3/W02DSZIsLPSl6LNHJ0
         2TZl7dmJIGzFg/7KLOZJ2RdMOqQRIV1GKe1gABvNldJwLRXisMbygnhulTSRyg9MCGS8
         fgvY078UOe1EEm/f1KVo2bm8OtIjGegkNfTnNKlzdoZ6ByiVkdMo9z0gciIdibaCtBim
         /MKsuxE9Djcar0kTykNQrOA45XZO+ugHHw1uChCrbQoo/gmoxkuHkPe6W9AQhNHVXaoh
         bk/Y73pCbwdGIjKyP1gwtGd2MNNQDVl6uSz2U8SeXiA/CWaWopkeqFXlYSpYSbEFyE87
         96DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778260045; x=1778864845;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYkAOVRIhnDcm5m8BRbL+GbCpCTtOZQWAsAfzCP5X/g=;
        b=pq0hN0AhxAH+NEqFdj3D60fTJobWUEaCnV2fI+ALDhpidZxipw0TrFEgDcAfcszTFv
         Kt/PGxIajQfuDd7DupWJbxzW53G4DKl4zbxvSqL0lgkYAu9XRxzflVfl/1iprnQCiBFs
         3k5Vz/ySkOoNaOR2bLLdhUq9YSjfb/PA47BFm9+iX097t/qpCPKfYyv0gcrFpCE8H72O
         SjXSuawtg+KhDh/RIyicmrqOL7nmYpIHL5QdzSqXG3P6peXrUKbF1XxAV1ns+bYQK5jX
         N64Do8p7JI3ZL/ASZzqb+m6ECr+uDiFOwLlRGb/ls8C5kgW1dMIRS4BT990BoGI5JyYw
         LGxw==
X-Forwarded-Encrypted: i=1; AFNElJ9RC4jpfS+n17tSiEmQb9gHuVvLm+/9MxBKMoHyj1VWjkzbAUzaBbqjIF13AJ1txr7LR/rUgEBLF3Dp4YqLzT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+iPegqtt02vzxBAhrD99aRFeusBzMrrPczUhtNYPmKBnhG35m
	NJRnFqsy8PGWNYA28m6ITk4G603fbF5PGLEoylXbg1+pzkfQ/i0LS94fFZ4nVRmYBXKwIoYEzmt
	x2DSbD3qeJos9nw==
X-Received: from pfva8.prod.google.com ([2002:a05:6a00:c88:b0:837:8d8a:cd3e])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4655:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-83a5dd58261mr13131084b3a.41.1778260044765;
 Fri, 08 May 2026 10:07:24 -0700 (PDT)
Date: Fri,  8 May 2026 10:07:03 -0700
In-Reply-To: <20260508170714.489136-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260508170714.489136-1-jmattson@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260508170714.489136-3-jmattson@google.com>
Subject: [PATCH v2 2/3] KVM: x86: Virtualize AMD CPUID faulting
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
index 8b64d863e19c..7312cb0591f4 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -183,8 +183,10 @@ static inline int guest_cpuid_stepping(struct kvm_vcpu *vcpu)
 
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
index c8c6cc0406d6..127d031d3310 100644
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
index 7d5b66287593..5f64f67ba083 100644
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
2.54.0.563.g4f69b47b94-goog

