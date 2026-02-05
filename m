Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C163E332EC9
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 21:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327819; cv=none; b=rTGRG07mATR9tJJUiIz1v5gZ1/baTBHFpi0GyaupgREF0QTN6fawOh0NreozwulUuVZskFp+4/Nn87130whHG7vnU9wYBsR6ZOZg+3pu+CujpUarp4mH/+dSOKqFv1OBtHQxfMoh9HhHULyK6lIAIlrYzAu8g4Dak2LkIxlfrDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327819; c=relaxed/simple;
	bh=t1FZ6K9ff28bBOACRhPauD3zpbu3dX1mvB0UDejh2tQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aa986Jw6rG1nM7BxsLUOoM1RpfO6IPjylKFLN2uf1kMI7wtXW/+co1A350imZoEupx3lUevoYBQKt18ha6SglOPRV02QFRHzJAikQub7PCHZuGEGVNxcEbqQbQ6bKdmwpGU7VmuY86dr7USa956dugVF9xQNljBNVvRIqgjm8b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Z287AkG; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Z287AkG"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-353049e6047so985456a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 13:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770327819; x=1770932619; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e7mnOr8u/WACBhY+jlevmvNnx0GAYmKuXG5gmX/ekFE=;
        b=1Z287AkGgGNbX+gUUETm5ThLj4gN9fZrIVmciDtcRGJ7qr1zKYRnggvEad3U6eKpQg
         269Kx/rW4UYRIXzIg1URpUfWn3zYRm2vPPcEyP/b38dJ2lNq0VDY2AJmb12rBubu82hQ
         C5HiV3VGwrnpcvfK/9qgcTpMzqJ5Z4NB98cx+FjyIUTmX0yPbAnhND5IQT7JY3vN7YBI
         wl74uh2ns0SSEPkn/nNBqKkOxiadgHLTK4oBors/75mv7nEOY0YT7C5ItipwWiV3VqmC
         LBTzyYfB1o7mQ5mm2A8d2JItbHI4yXDnZ/9I5g95qEyB1FmaE1IWvfjVDHn5j3CAmtsM
         BAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327819; x=1770932619;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7mnOr8u/WACBhY+jlevmvNnx0GAYmKuXG5gmX/ekFE=;
        b=dsNI5PMeieShauAiS2KZCF8NCoP/S/khWkvDx+LH/YjwbrSE92g9iO9542nXAVbCKp
         am0S+KXYVl1A5JM8aZ8NNQLe5JG1AZCZxT0EsMmwjiO9tCEh0QSL5xTfD9uAOHKF+yeN
         odJsvEaDuWdVyiBQlN3PtTHN5Hv5XHXKlqmoiH7G3DJM0XxbC6KZMdR095E+EfEOSbfq
         sffwrQpKCBRSJMqOJeiltKbv6IuGxTXKiVjzwI3FgO2xXZtWEDPP7TqvxhVrLbve245K
         Tw6P+6EA20sEP2lUxlCJEC3zt612X9RIcisLSlK+Cv4EOeFw4cN8IATa+TwOpKEfDjbE
         wILA==
X-Forwarded-Encrypted: i=1; AJvYcCWYoRRz8efOPBpIEojHwKBCNmrD500c4ClvK+K3ee3gSDNYD3sEkVw0bYaGyuVxdOStRoTbkgqMg45z+j70RYs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo6oo5GHP4VtgHwalHJzFpT5gv2FNGpa8zsLiV0wFxLtk2T6R4
	tsWetUU7B1rH2UC6FsGXR6urZEUBwaxdVEwon3lvNfKuj6AGPl6MdvyWs1tgkloXnIrrjW5Oq2P
	bB9O5ZMQGYgNjmQ==
X-Received: from pjkk4.prod.google.com ([2002:a17:90b:57e4:b0:352:de4e:4039])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3901:b0:354:a57c:65dd with SMTP id 98e67ed59e1d1-354b3cae0d0mr362193a91.24.1770327819173;
 Thu, 05 Feb 2026 13:43:39 -0800 (PST)
Date: Thu,  5 Feb 2026 13:43:01 -0800
In-Reply-To: <20260205214326.1029278-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205214326.1029278-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260205214326.1029278-2-jmattson@google.com>
Subject: [PATCH v3 1/8] KVM: x86: nSVM: Clear VMCB_NPT clean bit when updating
 g_pat in L2
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

When running an L2 guest and writing to MSR_IA32_CR_PAT, the host PAT value
is stored in vmcb01.ptr->save.g_pat, but the clean bit was only being
cleared for svm->vmcb, which points to vmcb02 in guest mode.

Introduce the helper svm_set_vmcb_gpat() which sets vmcb->save.g_pat and
marks the VMCB dirty for VMCB_NPT. Use this helper in both svm_set_msr()
for updating vmcb01 and in nested_vmcb02_compute_g_pat() for updating
vmcb02, ensuring both VMCBs are properly marked dirty.

Fixes: 4995a3685f1b ("KVM: SVM: Use a separate vmcb for the nested L2 guest")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 2 +-
 arch/x86/kvm/svm/svm.c    | 3 +--
 arch/x86/kvm/svm/svm.h    | 6 ++++++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index de90b104a0dd..f72dbd10dcad 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -636,7 +636,7 @@ void nested_vmcb02_compute_g_pat(struct vcpu_svm *svm)
 		return;
 
 	/* FIXME: merge g_pat from vmcb01 and vmcb12.  */
-	svm->nested.vmcb02.ptr->save.g_pat = svm->vmcb01.ptr->save.g_pat;
+	svm_set_vmcb_gpat(svm->nested.vmcb02.ptr, svm->vmcb01.ptr->save.g_pat);
 }
 
 static void nested_vmcb02_prepare_save(struct vcpu_svm *svm, struct vmcb *vmcb12)
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 5f0136dbdde6..08f145eb9215 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2939,10 +2939,9 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 		if (ret)
 			break;
 
-		svm->vmcb01.ptr->save.g_pat = data;
+		svm_set_vmcb_gpat(svm->vmcb01.ptr, data);
 		if (is_guest_mode(vcpu))
 			nested_vmcb02_compute_g_pat(svm);
-		vmcb_mark_dirty(svm->vmcb, VMCB_NPT);
 		break;
 	case MSR_IA32_SPEC_CTRL:
 		if (!msr->host_initiated &&
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index ebd7b36b1ceb..986d90f2d4ca 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -420,6 +420,12 @@ static inline bool vmcb_is_dirty(struct vmcb *vmcb, int bit)
         return !test_bit(bit, (unsigned long *)&vmcb->control.clean);
 }
 
+static inline void svm_set_vmcb_gpat(struct vmcb *vmcb, u64 data)
+{
+	vmcb->save.g_pat = data;
+	vmcb_mark_dirty(vmcb, VMCB_NPT);
+}
+
 static __always_inline struct vcpu_svm *to_svm(struct kvm_vcpu *vcpu)
 {
 	return container_of(vcpu, struct vcpu_svm, vcpu);
-- 
2.53.0.rc2.204.g2597b5adb4-goog

