Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AF52571BE
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 00:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771894526; cv=none; b=M7TguJhlNTUFTryQD/TVwVx7I7HS3qyImmfnHeUdT8NFZNieL8dVhojS3rUqkzcbVkoa3qJSL6ElowN3JRM/0/Bix7MAPzwEJw3xODyCTsyOAKahCs2uJ99eOe3qaaOvuu3u7gpbuJXZEjgsldvfwkQUYfGH/xa6nbtS36bAEWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771894526; c=relaxed/simple;
	bh=D0wfVSvJ1UsJp3MyQ6wAzujmp3VR7K5htA+colO4tiU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Js5Z9y9j8QxgdjbdKpvTfoj5h2vKuZHNz70rR7KSaWgGdqU05jy8ecOcuRC41Emha2t2C4wlH2gCVRizdm+ijq3OxZo0VtGyjqhL7s75j65LPXyeLL0MjvRnGFQ/t/bpHOIHxQ1NdkDwldNxqvTAYeksOflWu6Bk3F7E3aNxOZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pRtpSPsq; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pRtpSPsq"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso252347a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 16:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771894523; x=1772499323; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M8RJNlKzUYHH3Z91vbtEnFmofJjfz47joowNwa+7Nt8=;
        b=pRtpSPsqxIy5r/2Z+T/r2olIPtMJ7f3IGw6jVp878fEgCFA0JD+l9SxYu24VyL2ZqC
         rzOwO5T/xhkCN2pi3HSlyLeXB8SCUAkYW/TeHpRKP1OcEY+gZN2qV12q+0+rulOWuFpr
         o/3Uu3rGjR3j6ZVHXU9yfv21+pMOBug1jwj+zPF7XV4Tslc8PYDNKhN20sHz6NkoWI6S
         6wD5QZIJsrMzGIrRR8DNhdV1fwZTPw6jdnN6ixcT7BB2cxGrywMkh0IkjEAgob50zXtL
         9tftFx3LhXd4KqjM4gvHHSNSmOSyBB8xXsYF+4Fh1vFpeu4pHtZEc4gqJJLbIY7LRubW
         e2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771894523; x=1772499323;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8RJNlKzUYHH3Z91vbtEnFmofJjfz47joowNwa+7Nt8=;
        b=A2BRkG6PYfI+W3GkQR1ReJ/snRW0SVZticHYV4ErOyVydafAJ6Zd97RdGxi7W6L6E3
         pi2x1NwwwIXVGUoRoaEFRwtIWLqbsVm/M3uT7KMRMg2DoQkLMNb2uCzP043RgyH2EdYg
         uPtnmQovIQ+QeMm0zRrQ79/COh3xMWhfO1aG3Yaer1J6PYzV9jPV2G6h2x+wlTcZ/sQr
         309/JlLyAXdrbx6gos2vqC+6/QqtpmHoywmKx/goIXahlAW5CFVw2AdIF41YVNZN6B7P
         tLM245eROm6NGqnAbX7VhrZcUUU9AWh87A1vRPqijFm/JD+ENh0UrvuHDhYFmen3WAVQ
         AAFg==
X-Forwarded-Encrypted: i=1; AJvYcCUVl66lG/7Unka+CMSGD0QKyl1Ho2327hW8lcaTid8mtV5oms1KATOLzyuTXslh4Xm+N1pe6d72gkEidabAxD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ6oHJcRwsTGFF4L8acIAfh+XjxzEDjUk0eGVyNOLOYvDrhmbE
	SqytcKyXQDofA3TpS2MI8dmNI5o7WOxCdx/BMmbAVQr4lMOFJ3r15FdgyZ5Gm7GS14kPDJTQ/T0
	GRsvXPnFq8JEBSA==
X-Received: from pjug8.prod.google.com ([2002:a17:90a:ce88:b0:354:7c11:76e1])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:56ce:b0:336:9dcf:ed14 with SMTP id 98e67ed59e1d1-358ae8d0c60mr8820057a91.23.1771894522639;
 Mon, 23 Feb 2026 16:55:22 -0800 (PST)
Date: Mon, 23 Feb 2026 16:54:47 -0800
In-Reply-To: <20260224005500.1471972-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224005500.1471972-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260224005500.1471972-10-jmattson@google.com>
Subject: [PATCH v5 09/10] KVM: x86: nSVM: Handle restore of legacy nested state
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

When nested NPT is enabled and KVM_SET_NESTED_STATE is used to restore an
old checkpoint (without a valid gPAT), the current IA32_PAT value must be
used as L2's gPAT.

Unfortunately, checkpoint restore is non-atomic, and the order in which
state components are restored is not specified. Hence, the current IA32_PAT
value may be restored by KVM_SET_MSRS after KVM_SET_NESTED_STATE.  To
further complicate matters, there may be a KVM_GET_NESTED_STATE before the
next KVM_RUN.

Introduce a new boolean, svm->nested.legacy_gpat_semantics. When set, hPAT
updates are also applied to gPAT, preserving the old behavior (i.e. L2
shares L1's PAT). Set this boolean when restoring legacy state (i.e. nested
NPT is enabled, but no GPAT is provided) in KVM_SET_NESTED_STATE. Clear
this boolean in svm_vcpu_pre_run(), to ensure that hPAT and gPAT are
decoupled before the vCPU resumes execution. Also clear this boolean when
the vCPU is forced out of guest mode by svm_leave_nested().

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 13 ++++++++++---
 arch/x86/kvm/svm/svm.c    |  8 ++++++--
 arch/x86/kvm/svm/svm.h    |  9 +++++++++
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 5a35277f2364..b68eddcbc217 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1537,6 +1537,7 @@ void svm_leave_nested(struct kvm_vcpu *vcpu)
 	if (is_guest_mode(vcpu)) {
 		svm->nested.nested_run_pending = 0;
 		svm->nested.vmcb12_gpa = INVALID_GPA;
+		svm->nested.legacy_gpat_semantics = false;
 
 		leave_guest_mode(vcpu);
 
@@ -2075,9 +2076,15 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 
 	svm_switch_vmcb(svm, &svm->nested.vmcb02);
 
-	if (nested_npt_enabled(svm) &&
-	    (kvm_state->hdr.svm.flags & KVM_STATE_SVM_VALID_GPAT))
-		vmcb_set_gpat(svm->vmcb, kvm_state->hdr.svm.gpat);
+	svm->nested.legacy_gpat_semantics =
+		nested_npt_enabled(svm) &&
+		!(kvm_state->hdr.svm.flags & KVM_STATE_SVM_VALID_GPAT);
+	if (nested_npt_enabled(svm)) {
+		u64 g_pat = svm->nested.legacy_gpat_semantics ?
+			    vcpu->arch.pat : kvm_state->hdr.svm.gpat;
+
+		vmcb_set_gpat(svm->nested.vmcb02.ptr, g_pat);
+	}
 
 	nested_vmcb02_prepare_control(svm, svm->vmcb->save.rip, svm->vmcb->save.cs.base);
 
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 00dba10991a5..ac45702f566e 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2727,7 +2727,8 @@ static bool svm_pat_accesses_gpat(struct kvm_vcpu *vcpu, bool from_host)
 	 * with older kernels.
 	 */
 	WARN_ON_ONCE(from_host && vcpu->wants_to_run);
-	return !from_host && is_guest_mode(vcpu) && nested_npt_enabled(svm);
+	return !svm->nested.legacy_gpat_semantics && !from_host &&
+		is_guest_mode(vcpu) && nested_npt_enabled(svm);
 }
 
 static u64 svm_get_pat(struct kvm_vcpu *vcpu, bool from_host)
@@ -2749,7 +2750,8 @@ static void svm_set_pat(struct kvm_vcpu *vcpu, bool from_host, u64 data)
 		if (npt_enabled) {
 			vmcb_set_gpat(svm->vmcb01.ptr, data);
 			if (is_guest_mode(&svm->vcpu) &&
-			    !nested_npt_enabled(svm))
+			    (svm->nested.legacy_gpat_semantics ||
+			     !nested_npt_enabled(svm)))
 				vmcb_set_gpat(svm->vmcb, data);
 		}
 	}
@@ -4262,6 +4264,8 @@ static int svm_vcpu_pre_run(struct kvm_vcpu *vcpu)
 	if (to_kvm_sev_info(vcpu->kvm)->need_init)
 		return -EINVAL;
 
+	to_svm(vcpu)->nested.legacy_gpat_semantics = false;
+
 	return 1;
 }
 
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 58b0b935d049..626efef878a5 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -238,6 +238,15 @@ struct svm_nested_state {
 	 * on its side.
 	 */
 	bool force_msr_bitmap_recalc;
+
+	/*
+	 * Indicates that a legacy nested state (without a valid gPAT) was
+	 * recently restored. Until the next KVM_RUN, updates to hPAT are
+	 * also applied to gPAT, preserving legacy behavior (i.e. L2 shares
+	 * L1's PAT). Because checkpoint restore is non-atomic, this
+	 * complication is necessary for backward compatibility.
+	 */
+	bool legacy_gpat_semantics;
 };
 
 struct vcpu_sev_es_state {
-- 
2.53.0.371.g1d285c8824-goog

