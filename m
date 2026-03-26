Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695BB39E17D
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 17:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547405; cv=none; b=NMyCrFobZpX+nSLia60c1k5SKZ5WK4JzeMDS++kVFCoV7tFoChMSswZ/esnwrSquG2YuynchH09s7LP0By56R5pNg2j8AJhUqTVRETWm6xzYchJ1yB1UrtB1DOKcDaCR4K0pV3VGMZjVAYW0u+A4e0TG8WEWMshTmHqXb8klWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547405; c=relaxed/simple;
	bh=tZ12QRR3FmdWK+NRPEzhTArwt9NG+814P1E0pPf9rCg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FeZmXycPt+bTWwSfzgKxYbgrHhvv4TkWIfJF/jnG7CR9FkWWOwcrHMLmgCQpgM77AOMk44ZC8cIeJgJjtRoSkW8hR6VMfeLJoWAvmjVbz14i5Vl0D/oY69rTT+pgwW0Ik4qugihPl0QUwO53/LScXeUHScxoSWODCjOUtCK7NlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YEj/gFP5; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YEj/gFP5"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35c0bd3a968so1275121a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 10:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774547403; x=1775152203; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/9d4uR3KG2j2870MKAm/vuBsQJvgm3m57WemQ0F9xCY=;
        b=YEj/gFP5cZnjK3nOOLceGPQlyqsnCT/PM3r+hdPDrWNio75hh3HugLZNJFDl66NPZA
         u/pe29ytxd95U6cL2oXxBxGXOjuOFV/v94zE8e/cr8AsaeElNG12HGTPCSqzZX+Rk1qB
         3rjCQlJ3G5vaamxPFFur5EuIMuArvQDOW/Qf9+o5/nyW1fPcXAfKvlHwGzzM2x7Mwljv
         Mmut2jiiObt4f20A5C7pkS9v3KjZjVScieUT5jbp2zbdkpoBsIxagNvfNTYIwZWlLnd7
         T1y0MvQhcmiPI1GdqkOFfe0zIPWWl5saEH3tlKkD3IzeC7qyGbYTL+bW4JWhpBVlAwFD
         VOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547403; x=1775152203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9d4uR3KG2j2870MKAm/vuBsQJvgm3m57WemQ0F9xCY=;
        b=oB9YIYIp4/WFaFjflr/Gr9J2GB+ba60Evl3lVRkNFwQd8HlCOMUvaIU443hKm3C4NJ
         Oj+A3Usjm+EaXMeyItowvEFf5zz8CRA1LsQZL/UXKaNODV92xhbGWbiLScghbfXAdE9W
         FaCQx1o+N/ByhYtKCFKRIINNilmXgn+vvwelR0DTRdHI9czzZBvtzWL21JwaCKrFZTn+
         SCT56VnA6/Aha0zYBvFaQ7z2GptGariW1cply6KhWXbdPtuxHnVcAH6MRFX5MNisMjua
         sATdaXH8tpTraJG2IgIwVYxdkickEw8NaPpFxohdR2kpZmy00KsfzpXCI5l+B4a8WMq6
         6hhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWypi7yEkos4m1+QE+ZYq34awd8KnKbQgtoOND+CKHDNALF7h8gz9lDv3dTNHeXz42bitVHn1fkNR+jDDX8onY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKGm6TphdvBYHkDzj8fKaBGer0d/rbzKEV8R/Txlh1bWsERio8
	uYsPEk2bEL5qY6zSjX0JpKuiCjV4OQBC0Zzw1/wo02nkze2JFUCkqB+7pP9xFB7Znfof8HqwFJR
	LVKAIBtuCUCgwLw==
X-Received: from pjbbb10.prod.google.com ([2002:a17:90b:8a:b0:35c:2d1e:7123])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:fc45:b0:340:25f0:a9b with SMTP id 98e67ed59e1d1-35c0ddaa96emr7892201a91.33.1774547402493;
 Thu, 26 Mar 2026 10:50:02 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:49:20 -0700
In-Reply-To: <20260326174944.3820245-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326174944.3820245-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260326174944.3820245-3-jmattson@google.com>
Subject: [PATCH v6 02/10] KVM: x86: nSVM: Clear VMCB_NPT clean bit when
 updating hPAT from guest mode
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

When running an L2 guest and writing to MSR_IA32_CR_PAT, the host PAT value
is stored in both vmcb01's g_pat field and vmcb02's g_pat field, but the
clean bit was only being cleared for vmcb02.

Introduce the helper vmcb_set_gpat() which sets vmcb->save.g_pat and marks
the VMCB dirty for VMCB_NPT. Use this helper in both svm_set_msr() for
updating vmcb01 and in nested_vmcb02_compute_g_pat() for updating vmcb02,
ensuring both VMCBs' NPT fields are properly marked dirty.

Fixes: 4995a3685f1b ("KVM: SVM: Use a separate vmcb for the nested L2 guest")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 2 +-
 arch/x86/kvm/svm/svm.c    | 3 +--
 arch/x86/kvm/svm/svm.h    | 6 ++++++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 5ff01d2ac85e..32fa8e688c00 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -697,7 +697,7 @@ void nested_vmcb02_compute_g_pat(struct vcpu_svm *svm)
 		return;
 
 	/* FIXME: merge g_pat from vmcb01 and vmcb12.  */
-	svm->nested.vmcb02.ptr->save.g_pat = svm->vmcb01.ptr->save.g_pat;
+	vmcb_set_gpat(svm->nested.vmcb02.ptr, svm->vmcb01.ptr->save.g_pat);
 }
 
 static bool nested_vmcb12_has_lbrv(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index d2ca226871c2..af808e83173e 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2979,10 +2979,9 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 		if (ret)
 			break;
 
-		svm->vmcb01.ptr->save.g_pat = data;
+		vmcb_set_gpat(svm->vmcb01.ptr, data);
 		if (is_guest_mode(vcpu))
 			nested_vmcb02_compute_g_pat(svm);
-		vmcb_mark_dirty(svm->vmcb, VMCB_NPT);
 		break;
 	case MSR_IA32_SPEC_CTRL:
 		if (!msr->host_initiated &&
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 67aa5d34332e..0f0c08c5ce0c 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -439,6 +439,12 @@ static inline bool vmcb12_is_dirty(struct vmcb_ctrl_area_cached *control, int bi
 	return !test_bit(bit, (unsigned long *)&control->clean);
 }
 
+static inline void vmcb_set_gpat(struct vmcb *vmcb, u64 data)
+{
+	vmcb->save.g_pat = data;
+	vmcb_mark_dirty(vmcb, VMCB_NPT);
+}
+
 static __always_inline struct vcpu_svm *to_svm(struct kvm_vcpu *vcpu)
 {
 	return container_of(vcpu, struct vcpu_svm, vcpu);
-- 
2.53.0.1018.g2bb0e51243-goog

