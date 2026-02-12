Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C4235DCF8
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 15:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770911963; cv=none; b=m8iV5NyhiR7GAqfCmfxw+hvnYelhgQpzVj8N1XgdnLyY3ax4LpqQJ/G3hDqqEGHAEGlmKocWknrGdPZnUvYFPD0yMZVWBql+fjdtpdNeWnjaBybmJaQ67yu38kHNy/h0vLsPYqVNNDDTuW0lGFYQ6mLJ88ifJsp+HEBsiRxOOpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770911963; c=relaxed/simple;
	bh=IPS4V3Xedp44qKMO94o2K4sQEaOjEKl0DVkxqcvXKYk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jvPdPrU5WMpk8WdnOa+B0pxjFA2RgDY5hgCqClkGOIhe2upjC3zEadTkF5ri54/qSiWHIQkI3Gv75LG1KSniqKciLMKI278/RTVpOtEl6I1bo67kiiA1QC1drP30/viBhSP/pyYb1dHU1yIWurB5xJM+ijMhZapJEoIXgejN/sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rk7lUsRQ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rk7lUsRQ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35626b11c51so20849a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 07:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770911962; x=1771516762; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VRlL7csLSSKDZLO+EBN/PvZlh3NDnCHP9xjp5VbQz/o=;
        b=Rk7lUsRQlQl//uUdrDEVniH1nIzVU71SbuF+C8bAsWBkXeZFHVAX7JExUi0Go0cngD
         STiD1RqFWvHhB3uW6DMPeLEa3GFWcpRjtGJ2HlG4IiRuC1/GRZBsV4HrloJEyjGQ/L7/
         lE59ROP/3XTiptLaYbHd170cag7CJF1BEcZLJ5Rf35xaH5Fh1zj1D7SjtN2wlqfvucbN
         EWoYX5SCveD2+y8GVjxPpCIhE05BmJ/e5x97b9TlH5kduPequDPaQ7DQdQevqcKNmVW2
         Qgh0qMq8DKDnM6SV3m4R90dh5Muo1E2pAwPxKASbZQ7F3OXnJqsHohFarpYR+B0DYp/9
         Gw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770911962; x=1771516762;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VRlL7csLSSKDZLO+EBN/PvZlh3NDnCHP9xjp5VbQz/o=;
        b=MFRRtVtUrmNRiJa7qFcw0/TWt7kcEP2jlEr2kL5suOQSk7Qb1gMfml/LCs0blHw/Ds
         87jKhYIPBZZk1MyYYaYD+vRFwzpcAENz6Ln2niQz1zGPQi8xJS52reVZWw7hqmcA2EtX
         GRrHNZ26Sg3SjTKZlPfww6mMoPlpq2SwPRen8iGV6cyrNCsYyDk1ipxq7EDC25yRY7ru
         hxJfbPS5bukN/R5Wr7kBgvS/aZFzqNef9wzzqqBPPyjR36Aiev9r36Sr/6BW5OPy5C+5
         b+tFbFmCkF20rxS7BI5ks+XUWi7ePBo5FPTXkVOlEHz1U8N1veipUDf2IkE0yaFROTRA
         zQ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2R2hxIXEsSBTcNzdsQITX7ob+11Li6wsg5Sf5nvfi38CASIDd4v1ufThwfKy5oxB8jiDQvPLt2X31MD2RBxs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4QnNfNVJdUApeaA/j8mpFmiVqwhWiQ8UMvNdD47WFLmpYL7wR
	OQc52n3T8KjEqCvmbEEF3hYpRc+IfYGNWTsh1F77rYxDHXv1z83yczoTQ1LNZ3XdwP6PvoQWJSI
	5AEC54iUSOW10fA==
X-Received: from pjbgv21.prod.google.com ([2002:a17:90b:11d5:b0:354:c1db:b113])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2e0d:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-3568f2be796mr3007216a91.1.1770911961810;
 Thu, 12 Feb 2026 07:59:21 -0800 (PST)
Date: Thu, 12 Feb 2026 07:58:54 -0800
In-Reply-To: <20260212155905.3448571-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212155905.3448571-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.239.g8d8fc8a987-goog
Message-ID: <20260212155905.3448571-7-jmattson@google.com>
Subject: [PATCH v4 6/8] KVM: x86: nSVM: Save/restore gPAT with KVM_{GET,SET}_NESTED_STATE
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
120 bytes, so there is room to add the flags field and the gpat field
without changing any offsets.

Fixes: cc440cdad5b7 ("KVM: nSVM: implement KVM_GET_NESTED_STATE and KVM_SET_NESTED_STATE")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/include/uapi/asm/kvm.h |  5 +++++
 arch/x86/kvm/svm/nested.c       | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

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
index 26f758e294ab..f73f3e586012 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1893,6 +1893,10 @@ static int svm_get_nested_state(struct kvm_vcpu *vcpu,
 	/* First fill in the header and copy it out.  */
 	if (is_guest_mode(vcpu)) {
 		kvm_state.hdr.svm.vmcb_pa = svm->nested.vmcb12_gpa;
+		if (nested_npt_enabled(svm)) {
+			kvm_state.hdr.svm.flags |= KVM_STATE_SVM_VALID_GPAT;
+			kvm_state.hdr.svm.gpat = svm->nested.save.g_pat;
+		}
 		kvm_state.size += KVM_STATE_NESTED_SVM_VMCB_SIZE;
 		kvm_state.flags |= KVM_STATE_NESTED_GUEST_MODE;
 
@@ -2022,6 +2026,14 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	    !nested_vmcb_check_save(vcpu, &save_cached, false))
 		goto out_free;
 
+	/*
+	 * Validate gPAT, if provided. This is done separately from the
+	 * vmcb_save_area_cached validation above, because gPAT is L2
+	 * state, but the vmcb_save_area_cached is populated with L1 state.
+	 */
+	if ((kvm_state->hdr.svm.flags & KVM_STATE_SVM_VALID_GPAT) &&
+	    !kvm_pat_valid(kvm_state->hdr.svm.gpat))
+		goto out_free;
 
 	/*
 	 * All checks done, we can enter guest mode. Userspace provides
@@ -2061,6 +2073,10 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	if (ret)
 		goto out_free;
 
+	if (nested_npt_enabled(svm) &&
+	    (kvm_state->hdr.svm.flags & KVM_STATE_SVM_VALID_GPAT))
+		svm_set_gpat(svm, kvm_state->hdr.svm.gpat);
+
 	svm_switch_vmcb(svm, &svm->nested.vmcb02);
 	nested_vmcb02_prepare_control(svm, svm->vmcb->save.rip, svm->vmcb->save.cs.base);
 
-- 
2.53.0.239.g8d8fc8a987-goog

