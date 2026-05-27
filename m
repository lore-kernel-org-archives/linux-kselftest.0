Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0B7451062
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 17:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779903847; cv=none; b=twOzFD8oeZx9HV7kWPMH9CwMcxK/KmIp3mWcCkSIjREoRhGRyf0P94cwj6PCVpNlYSssqFEksC6CUhByyFpmnHpXrAL0vFp36jNRSZGOvYQ/cplj+YG67uzFp0DiukwKhK+l5ORhxx2cgro+A5Mv6AsZppcVMADWQMZtIQUrFQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779903847; c=relaxed/simple;
	bh=4dM+MyiSqvp+Jq7wcMz9CiXdA6assxQeJuKyAT0TKZc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XeBNFXhDh4r8VmhTpO0V+HS+p+Lhq9CVSygxjlonLzlQlLx6FEZ8MXZodFB435iVSFYTQHZVN4HGwmIHcN0MYFXnh54lTxMs0lYKJG4XZRvAAR3OEzIRpnElKhdm1n32kJ9Gql0SjNd2vt4gvUIHQoQ3TpEy+U8V8cAjeKdruqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TjnqpcY1; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TjnqpcY1"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b4530a90fdso67149495ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 10:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779903843; x=1780508643; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3sU0RPFbAlDPXpf7+JC6NZ9VwzjnBo5QhV+gWzHYteo=;
        b=TjnqpcY150n2ARgba1RKS2JOFYkT7xCbmvruo4cbCGtzZBqLgqLVuApvKoTK8RX7bL
         pWH/QLRcokrEPoRd4g4g9veWLp/y6t4H83QjrpCCP1Cm8GbDxsKepSC0Had0PJSdyA6C
         z/BuUxxu9TFvy0qkJorJpyMwTSakP7r1Y+07wSbfe2jytRfUUNB6JpOvOHzq2osbG+gr
         ED9NsRFS4bagd15h3m72MB7y0gAeA8NJu9oLE6vNhiA4ElmrbY3ltHw1NMeNYofF6rfj
         Zjg+jcsqm11AUV0McAOO8hB0p9eyzYjcZ2RsP+sbaPghGHtpxCLUJLKENh4v7PnPb4Sy
         SHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779903843; x=1780508643;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3sU0RPFbAlDPXpf7+JC6NZ9VwzjnBo5QhV+gWzHYteo=;
        b=Zjq5RwjFPgPq9JvGnnXB+EVxIaB6hnoMqfUdDaJ6/4uMRLbtcwbS1J61uSLbew9RbL
         9wHPzuLKg7mThjvgTcvNBjo8fb8cIsKrNRwFtMTONXISUYnSk5NsW4PP58tv4ntjU5nu
         gMbdoiXUFil1ZijMSTK4HZe/EwyGhtP85G27FeRSgYdai/HAFFiecHIPcXIAYrJ+b0hv
         /vONMl7O02CuS0l6bNe90UCSi3aCZQXURL1VRmY9/Kh2Sj6AYtLy8BT5mV9Nkb3O9sPM
         TheirrzP/NwFd8qPkXAKw+1vXcqrma3HvmPc1LRkccZDNgrpW9pnaT6IBVY2g+6Ijokf
         IY3A==
X-Forwarded-Encrypted: i=1; AFNElJ8/cy+ARdVEfxMqCIPSO/XHuy2v00S+hKFSxczR/ycC7aZ64XgIBpUA2rfueCRBDm2s38lPlFyZAn2UXGgzOWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDEoEHW6WoI10jTYSHBMqjMoN3f++lggWs8eCgP1Qj05Nr+z5Q
	xyujPMOndAEE8hBI+rvx8Rhe1i8iYI74hGwEch1Og+IGyM9L5glV0r1O7YqB6nVz39rnHhDWZGZ
	pjR7sEwqXxi8NoA==
X-Received: from plbbf3.prod.google.com ([2002:a17:902:b903:b0:2be:b234:7438])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:32ce:b0:2bd:eeb6:ff1b with SMTP id d9443c01a7336-2beb0390f7dmr272457635ad.4.1779903842482;
 Wed, 27 May 2026 10:44:02 -0700 (PDT)
Date: Wed, 27 May 2026 10:43:43 -0700
In-Reply-To: <20260527174347.2356165-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527174347.2356165-1-jmattson@google.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527174347.2356165-2-jmattson@google.com>
Subject: [PATCH v4 1/5] KVM: x86: Consolidate CPUID fault handling for
 emulator and interception logic
From: Jim Mattson <jmattson@google.com>
To: seanjc@google.com, pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	shuah@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, ctpence@google.com, David.Kaplan@amd.com, 
	binbin.wu@linux.intel.com
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Sean Christopherson <seanjc@google.com>

Extract the logic for emulating CPUID faulting (where CPUID #GPs at CPL>0
outside of SMM) into a dedicated helper and use the helper for both the
full emulator and the intercepted-CPUID paths.

Opportunistically drop kvm_require_cpl(), as kvm_emulate_cpuid() was the
one and only user.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
[jim: Add EXPORT_STATIC_CALL_GPL(kvm_x86_get_cpl) so that KVM vendor
modules can call kvm_is_cpuid_allowed(). Fix typo in commit message.]
Signed-off-by: Jim Mattson <jmattson@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 arch/x86/include/asm/kvm_host.h |  1 -
 arch/x86/kvm/cpuid.c            |  5 +++--
 arch/x86/kvm/cpuid.h            |  8 ++++++++
 arch/x86/kvm/emulate.c          |  6 +-----
 arch/x86/kvm/kvm_emulate.h      |  1 +
 arch/x86/kvm/x86.c              | 19 +++++++------------
 6 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index d72051150bac..4c22b338ac7b 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2321,7 +2321,6 @@ static inline void kvm_inject_emulated_page_fault(struct kvm_vcpu *vcpu,
 	__kvm_inject_emulated_page_fault(vcpu, fault, false);
 }
 
-bool kvm_require_cpl(struct kvm_vcpu *vcpu, int required_cpl);
 bool kvm_require_dr(struct kvm_vcpu *vcpu, int dr);
 
 static inline int __kvm_irq_line_state(unsigned long *irq_state,
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index e69156b54cff..1c95d1fa3ead 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -2161,9 +2161,10 @@ int kvm_emulate_cpuid(struct kvm_vcpu *vcpu)
 {
 	u32 eax, ebx, ecx, edx;
 
-	if (!is_smm(vcpu) && cpuid_fault_enabled(vcpu) &&
-	    !kvm_require_cpl(vcpu, 0))
+	if (!kvm_is_cpuid_allowed(vcpu)) {
+		kvm_queue_exception_e(vcpu, GP_VECTOR, 0);
 		return 1;
+	}
 
 	eax = kvm_rax_read(vcpu);
 	ecx = kvm_rcx_read(vcpu);
diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index 039b8e6f40ba..bc4a8428b836 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -7,6 +7,8 @@
 #include <asm/processor.h>
 #include <uapi/asm/kvm_para.h>
 
+#include "smm.h"
+
 extern u32 kvm_cpu_caps[NR_KVM_CPU_CAPS] __read_mostly;
 extern bool kvm_is_configuring_cpu_caps __read_mostly;
 
@@ -192,6 +194,12 @@ static inline bool cpuid_fault_enabled(struct kvm_vcpu *vcpu)
 		  MSR_MISC_FEATURES_ENABLES_CPUID_FAULT;
 }
 
+static inline bool kvm_is_cpuid_allowed(struct kvm_vcpu *vcpu)
+{
+	return !cpuid_fault_enabled(vcpu) || is_smm(vcpu) ||
+	       !kvm_x86_call(get_cpl)(vcpu);
+}
+
 static __always_inline void kvm_cpu_cap_clear(unsigned int x86_feature)
 {
 	unsigned int x86_leaf = __feature_leaf(x86_feature);
diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index 0a17a9ee6f32..585a8ceab220 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -3594,12 +3594,8 @@ static int em_sti(struct x86_emulate_ctxt *ctxt)
 static int em_cpuid(struct x86_emulate_ctxt *ctxt)
 {
 	u32 eax, ebx, ecx, edx;
-	u64 msr = 0;
 
-	ctxt->ops->get_msr(ctxt, MSR_MISC_FEATURES_ENABLES, &msr);
-	if (!ctxt->ops->is_smm(ctxt) &&
-	    (msr & MSR_MISC_FEATURES_ENABLES_CPUID_FAULT) &&
-	    ctxt->ops->cpl(ctxt))
+	if (!ctxt->ops->is_cpuid_allowed(ctxt))
 		return emulate_gp(ctxt, 0);
 
 	eax = reg_read(ctxt, VCPU_REGS_RAX);
diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
index f5df31a52996..3e375af15c03 100644
--- a/arch/x86/kvm/kvm_emulate.h
+++ b/arch/x86/kvm/kvm_emulate.h
@@ -230,6 +230,7 @@ struct x86_emulate_ops {
 			 struct x86_instruction_info *info,
 			 enum x86_intercept_stage stage);
 
+	bool (*is_cpuid_allowed)(struct x86_emulate_ctxt *ctxt);
 	bool (*get_cpuid)(struct x86_emulate_ctxt *ctxt, u32 *eax, u32 *ebx,
 			  u32 *ecx, u32 *edx, bool exact_only);
 	bool (*guest_has_movbe)(struct x86_emulate_ctxt *ctxt);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1578c0ecbbd1..72bd3cddb026 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -151,6 +151,7 @@ struct kvm_x86_ops kvm_x86_ops __read_mostly;
 #include <asm/kvm-x86-ops.h>
 EXPORT_STATIC_CALL_GPL(kvm_x86_get_cs_db_l_bits);
 EXPORT_STATIC_CALL_GPL(kvm_x86_cache_reg);
+EXPORT_STATIC_CALL_GPL(kvm_x86_get_cpl);
 
 static bool __read_mostly ignore_msrs = 0;
 module_param(ignore_msrs, bool, 0644);
@@ -1022,18 +1023,6 @@ void kvm_queue_exception_e(struct kvm_vcpu *vcpu, unsigned nr, u32 error_code)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_queue_exception_e);
 
-/*
- * Checks if cpl <= required_cpl; if true, return true.  Otherwise queue
- * a #GP and return false.
- */
-bool kvm_require_cpl(struct kvm_vcpu *vcpu, int required_cpl)
-{
-	if (kvm_x86_call(get_cpl)(vcpu) <= required_cpl)
-		return true;
-	kvm_queue_exception_e(vcpu, GP_VECTOR, 0);
-	return false;
-}
-
 bool kvm_require_dr(struct kvm_vcpu *vcpu, int dr)
 {
 	if ((dr != 4 && dr != 5) || !kvm_is_cr4_bit_set(vcpu, X86_CR4_DE))
@@ -8829,6 +8818,11 @@ static int emulator_intercept(struct x86_emulate_ctxt *ctxt,
 					     &ctxt->exception);
 }
 
+static bool emulator_is_cpuid_allowed(struct x86_emulate_ctxt *ctxt)
+{
+	return kvm_is_cpuid_allowed(emul_to_vcpu(ctxt));
+}
+
 static bool emulator_get_cpuid(struct x86_emulate_ctxt *ctxt,
 			      u32 *eax, u32 *ebx, u32 *ecx, u32 *edx,
 			      bool exact_only)
@@ -8966,6 +8960,7 @@ static const struct x86_emulate_ops emulate_ops = {
 	.wbinvd              = emulator_wbinvd,
 	.fix_hypercall       = emulator_fix_hypercall,
 	.intercept           = emulator_intercept,
+	.is_cpuid_allowed    = emulator_is_cpuid_allowed,
 	.get_cpuid           = emulator_get_cpuid,
 	.guest_has_movbe     = emulator_guest_has_movbe,
 	.guest_has_fxsr      = emulator_guest_has_fxsr,
-- 
2.54.0.794.g4f17f83d09-goog

