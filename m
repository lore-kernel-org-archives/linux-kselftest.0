Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082B83376BA
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 21:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327827; cv=none; b=P1Reuoi7FPgRQPVhzvQnTPUcp8y9/zRKTkSz0GXQy9d9G6/4SIUsngBKfvUbtas9L5kNnpMQcbsbSK64pNkf0o5MUbUFSS7p5HBN2C6NesKreZklvHDT6cvqs/IVABc9VX2cmy9yLLGPo1h4DZ/jogRLrN9HrpJEOPyhNrDrUMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327827; c=relaxed/simple;
	bh=REMk7MsNEK46ltVnyaD2qUn2Wq3i1H3LHfd2I6/ePAo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mTRnE97wWilao3kREI4OhqSSpiIHuLJ0ftjHWMiwAn8Qj0sh8tiG+v/PqSG7Srg7MgFp2WKvMIUw51QK7VPnFvK8+LgyTVAgSBDJhCIpOC39uuLUBjF+bOawgXbVJxN09MDCQKr5Rkts55ZZwRler1YwaHJuo77/ZvYxnLYzCxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VrkP8LCG; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VrkP8LCG"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c54e81eeab9so870601a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 13:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770327826; x=1770932626; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S4KbIplwSpOgL8y77jJIQF/6UFPYYOp7aggt19vghWY=;
        b=VrkP8LCG4GKYYzkmPlZ9/1Y+U6sAc/Alv8yMlTxscyNXD8QqKNjjJ0NXbeIRWscEKF
         nF19crYtRaMYwTMJsgQt44O7WuE4m6FVDiHXyeeJ38KfHhYOfm5LesKIOJn9fg9ECYpa
         MioRdoBZ+Qv2kUovJLYnjUYEj/zD+0Ec796gJ4079L0is2x08tPCi8kbjFnWaWDpSIuQ
         XbIrc0Hyvwy+eOVW+0FIJnliupj+5Qs71V4/sKh3fiXNrI4RlRU7EbJBUGdbQ4NM/4SX
         x4TOL/aPYsvGZ8wIFVAB4pkzQYWZ2P3IiFGdg6NTP/u0vpwUgpz0oCCfePAG1dhZZBTU
         W8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327826; x=1770932626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4KbIplwSpOgL8y77jJIQF/6UFPYYOp7aggt19vghWY=;
        b=C8NB8zXJtizQWqMj05zJAnqJgWt7dRx/fHvLeTBNnBa+cqLtP82iQWmhouJzrxIc7+
         bK2wPMUlE/uklEqpGg1QYYoSEDujzLYWGj40DEZY9EZyN62KL8osNrLr7+p7j7QVBBKy
         QFYTLgc5AAtSb/V6r8rMLMP4JGHG1QNGXkx8w6/OGR7pZm/evvDol3BJI0Rr08TRMWqT
         Y0Zb5wFJodh5RdcUdKxST4PqDtacpwjuhBgaCTIQxHQbxDAvHqgK0uouK9ZnkYGirXOV
         pd6oRsLoyTWnnCIDe92440wAQQuhM7ZdFp4i3bAf8wTrWnsOfyRcSjxADXRz4+xHz9ge
         pibw==
X-Forwarded-Encrypted: i=1; AJvYcCWxnsbNwg86AvnHRmFLhE4cbrAHW1pBO27b66fLfRK3y0CdW7KJopChn7gbvYC47aXLRHE/NEWO0X3mO5J++Vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBgKRp6DYvXmY0KgMuFwkYKB4pJESN4oLdh35cA7fAuYf8V1CZ
	lq0QZxMHG6kb3ysQpWiYhsbwD15EwF9RkW/rgHl0rGybnzuzVx5lUcabPiBOtNKqRaUpzln1arm
	gESW3MMaEuXhY8A==
X-Received: from pjup21.prod.google.com ([2002:a17:90a:d315:b0:354:a065:ec58])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:69b:b0:38d:f084:e351 with SMTP id adf61e73a8af0-393af2a9b96mr335204637.80.1770327826507;
 Thu, 05 Feb 2026 13:43:46 -0800 (PST)
Date: Thu,  5 Feb 2026 13:43:06 -0800
In-Reply-To: <20260205214326.1029278-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205214326.1029278-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260205214326.1029278-7-jmattson@google.com>
Subject: [PATCH v3 6/8] KVM: x86: nSVM: Save/restore gPAT with KVM_{GET,SET}_NESTED_STATE
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a 'flags' field to the SVM nested state header, and use bit 0 of the
flags to indicate that gPAT is stored in the nested state.

If in guest mode with NPT enabled, store the current vmcb->save.g_pat value
into the header of the nested state, and set the flag.

Note that struct kvm_svm_nested_state_hdr is included in a union padded to
120 bytes, so there is room to add the flags field and the gpt field
without changing any offsets.

Fixes: cc440cdad5b7 ("KVM: nSVM: implement KVM_GET_NESTED_STATE and KVM_SET_NESTED_STATE")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/include/uapi/asm/kvm.h |  5 +++++
 arch/x86/kvm/svm/nested.c       | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 846a63215ce1..664d04d1db3f 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -495,6 +495,8 @@ struct kvm_sync_regs {
 
 #define KVM_STATE_VMX_PREEMPTION_TIMER_DEADLINE	0x00000001
 
+#define KVM_STATE_SVM_VALID_GPAT	0x00000001
+
 /* vendor-independent attributes for system fd (group 0) */
 #define KVM_X86_GRP_SYSTEM		0
 #  define KVM_X86_XCOMP_GUEST_SUPP	0
@@ -531,6 +533,9 @@ struct kvm_svm_nested_state_data {
 
 struct kvm_svm_nested_state_hdr {
 	__u64 vmcb_pa;
+	__u32 flags;
+	__u32 reserved;
+	__u64 gpat;
 };
 
 /* for KVM_CAP_NESTED_STATE */
diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 0b95ae1e864b..3f512fb630db 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1764,6 +1764,10 @@ static int svm_get_nested_state(struct kvm_vcpu *vcpu,
 	/* First fill in the header and copy it out.  */
 	if (is_guest_mode(vcpu)) {
 		kvm_state.hdr.svm.vmcb_pa = svm->nested.vmcb12_gpa;
+		if (nested_npt_enabled(svm)) {
+			kvm_state.hdr.svm.flags |= KVM_STATE_SVM_VALID_GPAT;
+			kvm_state.hdr.svm.gpat = svm->nested.gpat;
+		}
 		kvm_state.size += KVM_STATE_NESTED_SVM_VMCB_SIZE;
 		kvm_state.flags |= KVM_STATE_NESTED_GUEST_MODE;
 
@@ -1889,6 +1893,12 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	    !__nested_vmcb_check_save(vcpu, &save_cached))
 		goto out_free;
 
+	/*
+	 * Validate gPAT, if provided.
+	 */
+	if ((kvm_state->hdr.svm.flags & KVM_STATE_SVM_VALID_GPAT) &&
+	    !kvm_pat_valid(kvm_state->hdr.svm.gpat))
+		goto out_free;
 
 	/*
 	 * All checks done, we can enter guest mode. Userspace provides
@@ -1926,6 +1936,10 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	if (ret)
 		goto out_free;
 
+	if (nested_npt_enabled(svm) &&
+	    (kvm_state->hdr.svm.flags & KVM_STATE_SVM_VALID_GPAT))
+		svm_set_gpat(svm, kvm_state->hdr.svm.gpat);
+
 	svm->nested.force_msr_bitmap_recalc = true;
 
 	kvm_make_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
-- 
2.53.0.rc2.204.g2597b5adb4-goog

