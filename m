Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1744423173
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 17:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547420; cv=none; b=gz1EM9K9LB4PvLtaXTSiMO43sU0y9Ev6Z/wr0rJwj27hnVNnXR3iNQe287+qLAOgtcqNk6g71gBESKRqkREu1JPFK97mGFrksApzw5jfjtEOVInkIkk/4QNE7pQxvvuXpRNtRrwjAloQQmIPefBJWSMdKzucohwo5A2CF9UHMUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547420; c=relaxed/simple;
	bh=Wul8FNwFXn6rmN8/WRF7/1kccFLl4cwAfy5g/Zw3EKk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EYGLOey/+kyVd6BbuISFqH5Hk6MCdCBwA2MtT2TcMiAMjRSKT7PBictX6FjlsmtOK6La23QvCjIzOQ++dW0svzTFD6CLkSQkXHz1m/hzhYFiHqjd3O44Uyy0hUKiCWNneb3egNLPdLw02t0K1rMTHehBDWfxxAXoR2AYIti6Z2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VsrMugdM; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VsrMugdM"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3568090851aso3750716a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 10:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774547415; x=1775152215; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CGeUy1ZbKHDK6Xn7+ThAu8RVGMbIzIVYHaJ8LNemyL4=;
        b=VsrMugdM4Rzxz7hd1u+zCMFl9FYAI3wAFLXV+XfovsD8skZ2L+tVdPUFCVRvSY8keE
         HJO1aNv+1CvPeNwWdF92cp1IoN+g+04j5IS8iIioiOiplk5nwWJ++GaY4UtXa0UNbwjp
         9B91C+M2+1qA8duOa5nthMIrkSFSIb9iSyBJozN66hVPbuKUclp+R2Y2SSXKEfc7EKhZ
         kqZB4//YQs3B7I3PeukAa8EbXB5rikRNN9P7zhjZD8RRCy3TMy8xMAAurK0AGszMG2oV
         W9aQDbBpuabG2nz/9rYgVSNCdh2Zp9ewVSwAKRzFogLycDPkbjV+EObiPJ8wg761VhEk
         CTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547415; x=1775152215;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGeUy1ZbKHDK6Xn7+ThAu8RVGMbIzIVYHaJ8LNemyL4=;
        b=RuJocjEjjkhmjhh5GXFOukrR5rqMuxiO/Y0SzYE2XvdrlGL3U9OvaZ3rT+9cDnzPh3
         9CWFeCVVwxxUSIeOq8B0qsljoP8AqFufLkHvWymQjnXQqKASDeI22Zj+4CvJ4sCRdRT+
         +WBO3DgY76lei/5oU5Dbz4IKTMNh8M2BNc5nq+xrB1XCOCNywX4HEtvCUle9i9+sAYIG
         Aiql03lntsnIh5s4NDRWcZwuPAaZmqQl6WkbSEm+qE/kOZdMjTPD6VjkdID1v49YyNn8
         bVWd95s1PD+NjAPJLnoQgiANMniRxfqDmmLnO82FTZabIwASsR1Tbjyi/PG6+a0VdP/n
         PvUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFZfBWPrS1JzdZv8KGXZc1UTb+rxBErhDn2Of+cll/GxUhIFtzICIid2ODwNPm+fGRs8LnymzzUal/XHHXRbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq1Lhv78sJFXO3W9wdtciM4vjz1VgaQIKpgRkUQlR3YAgZBRMY
	OHnjmqjA0O5UQNW78HZ2RrTMiqt86OoUmcXbTC7HqNp/JZlLaelWNv1G6S0HN+C/JFWf8/WCIey
	zb+ajzUpSmK/rvg==
X-Received: from pjub5.prod.google.com ([2002:a17:90a:cc05:b0:359:f1f1:7bcb])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2249:b0:35b:a53a:7d0b with SMTP id 98e67ed59e1d1-35c0dd3ae00mr7357466a91.20.1774547414431;
 Thu, 26 Mar 2026 10:50:14 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:49:27 -0700
In-Reply-To: <20260326174944.3820245-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326174944.3820245-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260326174944.3820245-10-jmattson@google.com>
Subject: [PATCH v6 09/10] KVM: x86: nSVM: Save/restore gPAT with KVM_{GET,SET}_NESTED_STATE
From: Jim Mattson <jmattson@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a 'gpat' field to kvm_svm_nested_state_hdr to carry L2's guest PAT
value across save and restore.

When KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled and the vCPU is in
guest mode with nested NPT enabled, save vmcb02's g_pat into the header on
KVM_GET_NESTED_STATE, and restore it on KVM_SET_NESTED_STATE.

Host-initiated accesses to IA32_PAT (via KVM_GET/SET_MSRS) always target
L1's hPAT, so they cannot be used to save or restore gPAT. The separate
header field ensures that KVM_GET/SET_MSRS and KVM_GET/SET_NESTED_STATE are
independent and can be ordered arbitrarily during save and restore.

Note that struct kvm_svm_nested_state_hdr is included in a union padded to
120 bytes, so there is room to add the gpat field without changing any
offsets.

Fixes: cc440cdad5b7 ("KVM: nSVM: implement KVM_GET_NESTED_STATE and KVM_SET_NESTED_STATE")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 Documentation/virt/kvm/api.rst  |  1 +
 arch/x86/include/uapi/asm/kvm.h |  1 +
 arch/x86/kvm/svm/nested.c       | 16 ++++++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 0a2d873ca5a3..d6bbb7bad173 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -4965,6 +4965,7 @@ Errors:
 
   struct kvm_svm_nested_state_hdr {
 	__u64 vmcb_pa;
+	__u64 gpat;
   };
 
   struct kvm_vmx_nested_state_data {
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 3ada2fa9ca86..1585ec804066 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -533,6 +533,7 @@ struct kvm_svm_nested_state_data {
 
 struct kvm_svm_nested_state_hdr {
 	__u64 vmcb_pa;
+	__u64 gpat;
 };
 
 /* for KVM_CAP_NESTED_STATE */
diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 26bc33322a87..601ad3f34db1 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1859,6 +1859,9 @@ static int svm_get_nested_state(struct kvm_vcpu *vcpu,
 	/* First fill in the header and copy it out.  */
 	if (is_guest_mode(vcpu)) {
 		kvm_state.hdr.svm.vmcb_pa = svm->nested.vmcb12_gpa;
+		kvm_state.hdr.svm.gpat = 0;
+		if (l2_has_separate_pat(svm))
+			kvm_state.hdr.svm.gpat = svm->vmcb->save.g_pat;
 		kvm_state.size += KVM_STATE_NESTED_SVM_VMCB_SIZE;
 		kvm_state.flags |= KVM_STATE_NESTED_GUEST_MODE;
 
@@ -1987,6 +1990,15 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	    !nested_vmcb_check_save(vcpu, &save_cached, false))
 		goto out_free;
 
+	/*
+	 * Validate gPAT when the shared PAT quirk is disabled (i.e. L2
+	 * has its own gPAT). This is done separately from the
+	 * vmcb_save_area_cached validation above, because gPAT is L2
+	 * state, but the vmcb_save_area_cached is populated with L1 state.
+	 */
+	if (!kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT) &&
+	    !kvm_pat_valid(kvm_state->hdr.svm.gpat))
+		goto out_free;
 
 	/*
 	 * All checks done, we can enter guest mode. Userspace provides
@@ -2011,6 +2023,10 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	nested_copy_vmcb_control_to_cache(svm, ctl);
 
 	svm_switch_vmcb(svm, &svm->nested.vmcb02);
+
+	if (l2_has_separate_pat(svm))
+		vmcb_set_gpat(svm->vmcb, kvm_state->hdr.svm.gpat);
+
 	nested_vmcb02_prepare_control(svm);
 
 	/*
-- 
2.53.0.1018.g2bb0e51243-goog

