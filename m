Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55D0233723
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 00:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771894521; cv=none; b=TstF7fezgNHv27L5v9+n79xhDc2aEV4WV8gIQ5lw5VbsEjaCM2HX/bTXHcW0SZVLV1AuvRK6bbPrLjM9I5fFYqR2hN/MEMB0yigjBleH2iem0VXQDdKfLUafYbktYHjCww3sY/Tl9b44mQmuaFKbsHwAE2ty2czpjnNPNkYsWVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771894521; c=relaxed/simple;
	bh=Y+zA93oqxDxdZ8NjJuhQSp95z4EwJSX5Gm74U7u7Org=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fwFogMdHxMjsbWMiSRZz6wZrmwZNl2fywfIG4rjDnxwqXFXTtelyFLP0gMvOvs6YVkoFP/9tRjnNE0onvE26EJPlazGA6pDsG6/3TtC8nNnyKcSr3FODuYBjUyvoUkGHQYIW3e6MXTznp4cs/O4Kbv92CEw64R8BxtEKCoQ75Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iuRcs4DM; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iuRcs4DM"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c6e194ab2f7so26711347a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 16:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771894516; x=1772499316; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PvIQS9DN9h9Wi6g5cxY9qpzMKIwL0mrn7RNJ8Wmb67M=;
        b=iuRcs4DMR1HY3OEuRWblzM55tb42FIPzNK4WwaavcixRXTgH/msyftmZzGXYxAoF+m
         9q3Q4NHaFLs7E1JY4WAhBID9hj3rudRXxWANEdtmjOLJkOG8x03H84dS8tb3MOdbpF1g
         72gNGLpf8WhjGRQTyP96UFjk/IhHQJG1ygzXqwswr8rxmHdTy1iM0J3FJ74tNazZfih/
         aUAaUYx9vRyM13EKZ+0/PMQHjaPQXsMpNkjZ4Qla4l81yDNNwfXNusZ/tUPnmVxevdyJ
         3hTA4+iR+TxNQMuqtvvtzzI3HlcNkWQnMKwaao/LHx4YCBkMp4lsjjh/wV9RIcmAK9we
         wyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771894516; x=1772499316;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PvIQS9DN9h9Wi6g5cxY9qpzMKIwL0mrn7RNJ8Wmb67M=;
        b=TNAuBpwj7L1BAHRqht1o6MGxk2DbKlMXAThjgn6iZ52NcK/z2aSZJbt3O7pKeV+RuA
         +QKNqEE0Q6SPA8hDv4VZNtZ8sd1z9s3/V8ofN3VCbn7/exU52WrpxjepFDQS9yuPe9sd
         Vq69I8NLzfoY8ShHqhq7vYrKjCnbIsDROPwoyOPAYePKYULYACCr9QYzrvXMsj2jZr5O
         dcGA54dum2JgWOVSMZijyFwzjw7gYHlBV40HuhheZZxZRQgIh6jA4Xnzt9IaGEcvEnWt
         jv24bLfx015MavgzEjb2UqgsM/KgimrSWKFhT4CvG9JK9PGHeuRvHWN7Y0g4YkrEpC4n
         a9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJAItXwxss+J8R79D2UIjea8c6N8fI0iGVnq8d4BgSxLqLgw6xT/fZZb2KwAWZGJDCt8MICIWu9sj+co8ovDE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqw4YXOuAVowldFyapBFA9VuGrHtYlNOUKNN7bjjMauX0sVahc
	BTMknXNuFpwgaO1NJ/nZHWfiBLh5WwqoYxAZQQph4y7RgpeGeJdsAwiIXtSyrYZMFEvAKm+jxbs
	GHw+U/plqngtTMg==
X-Received: from pgjz9.prod.google.com ([2002:a63:e549:0:b0:c6e:1ce5:b898])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:2d42:b0:394:75f8:a01 with SMTP id adf61e73a8af0-39545e7b5cbmr9004630637.16.1771894515875;
 Mon, 23 Feb 2026 16:55:15 -0800 (PST)
Date: Mon, 23 Feb 2026 16:54:43 -0800
In-Reply-To: <20260224005500.1471972-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224005500.1471972-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260224005500.1471972-6-jmattson@google.com>
Subject: [PATCH v5 05/10] KVM: x86: nSVM: Redirect IA32_PAT accesses to either
 hPAT or gPAT
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

When the vCPU is in guest mode with nested NPT enabled, guest accesses to
IA32_PAT are redirected to the gPAT register, which is stored in VMCB02's
g_pat field.

Non-guest accesses (e.g. from userspace) to IA32_PAT are always redirected
to hPAT, which is stored in vcpu->arch.pat.

This is architected behavior. It also makes it possible to restore a new
checkpoint on an old kernel with reasonable semantics. After the restore,
gPAT will be lost, and L2 will run on L1's PAT. Note that the old kernel
would have always run L2 on L1's PAT.

Add WARN_ON_ONCE to flag any host-initiated accesses originating from KVM
itself rather than userspace.

Fixes: 15038e147247 ("KVM: SVM: obey guest PAT")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c |  9 -------
 arch/x86/kvm/svm/svm.c    | 52 ++++++++++++++++++++++++++++++++++-----
 arch/x86/kvm/svm/svm.h    |  1 -
 3 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index dc8275837120..69b577a4915c 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -706,15 +706,6 @@ static int nested_svm_load_cr3(struct kvm_vcpu *vcpu, unsigned long cr3,
 	return 0;
 }
 
-void nested_vmcb02_compute_g_pat(struct vcpu_svm *svm)
-{
-	if (!svm->nested.vmcb02.ptr)
-		return;
-
-	/* FIXME: merge g_pat from vmcb01 and vmcb12.  */
-	vmcb_set_gpat(svm->nested.vmcb02.ptr, svm->vmcb01.ptr->save.g_pat);
-}
-
 static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
 {
 	struct vmcb_ctrl_area_cached *control = &svm->nested.ctl;
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 6c41f2317777..00dba10991a5 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2715,6 +2715,46 @@ static bool sev_es_prevent_msr_access(struct kvm_vcpu *vcpu,
 	       !msr_write_intercepted(vcpu, msr_info->index);
 }
 
+static bool svm_pat_accesses_gpat(struct kvm_vcpu *vcpu, bool from_host)
+{
+	struct vcpu_svm *svm = to_svm(vcpu);
+
+	/*
+	 * When nested NPT is enabled, L2 has a separate PAT from
+	 * L1.  Guest accesses to IA32_PAT while running L2 target
+	 * L2's gPAT; host-initiated accesses always target L1's
+	 * hPAT for backward and forward KVM_SET_MSRS compatibility
+	 * with older kernels.
+	 */
+	WARN_ON_ONCE(from_host && vcpu->wants_to_run);
+	return !from_host && is_guest_mode(vcpu) && nested_npt_enabled(svm);
+}
+
+static u64 svm_get_pat(struct kvm_vcpu *vcpu, bool from_host)
+{
+	if (svm_pat_accesses_gpat(vcpu, from_host))
+		return to_svm(vcpu)->vmcb->save.g_pat;
+	else
+		return vcpu->arch.pat;
+}
+
+static void svm_set_pat(struct kvm_vcpu *vcpu, bool from_host, u64 data)
+{
+	struct vcpu_svm *svm = to_svm(vcpu);
+
+	if (svm_pat_accesses_gpat(vcpu, from_host)) {
+		vmcb_set_gpat(svm->vmcb, data);
+	} else {
+		svm->vcpu.arch.pat = data;
+		if (npt_enabled) {
+			vmcb_set_gpat(svm->vmcb01.ptr, data);
+			if (is_guest_mode(&svm->vcpu) &&
+			    !nested_npt_enabled(svm))
+				vmcb_set_gpat(svm->vmcb, data);
+		}
+	}
+}
+
 static int svm_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
@@ -2837,6 +2877,9 @@ static int svm_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	case MSR_AMD64_DE_CFG:
 		msr_info->data = svm->msr_decfg;
 		break;
+	case MSR_IA32_CR_PAT:
+		msr_info->data = svm_get_pat(vcpu, msr_info->host_initiated);
+		break;
 	default:
 		return kvm_get_msr_common(vcpu, msr_info);
 	}
@@ -2920,13 +2963,10 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 
 		break;
 	case MSR_IA32_CR_PAT:
-		ret = kvm_set_msr_common(vcpu, msr);
-		if (ret)
-			break;
+		if (!kvm_pat_valid(data))
+			return 1;
 
-		vmcb_set_gpat(svm->vmcb01.ptr, data);
-		if (is_guest_mode(vcpu))
-			nested_vmcb02_compute_g_pat(svm);
+		svm_set_pat(vcpu, msr->host_initiated, data);
 		break;
 	case MSR_IA32_SPEC_CTRL:
 		if (!msr->host_initiated &&
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index a49c48459e0b..58b0b935d049 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -840,7 +840,6 @@ void nested_copy_vmcb_control_to_cache(struct vcpu_svm *svm,
 void nested_copy_vmcb_save_to_cache(struct vcpu_svm *svm,
 				    struct vmcb_save_area *save);
 void nested_sync_control_from_vmcb02(struct vcpu_svm *svm);
-void nested_vmcb02_compute_g_pat(struct vcpu_svm *svm);
 void svm_switch_vmcb(struct vcpu_svm *svm, struct kvm_vmcb_info *target_vmcb);
 
 extern struct kvm_x86_nested_ops svm_nested_ops;
-- 
2.53.0.371.g1d285c8824-goog

