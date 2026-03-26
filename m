Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51E43BF69A
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 17:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547408; cv=none; b=cFh8Idl1qWPvuVX1+2d+InXyvCGnQwsns/1k/ZZ5NWGRjNp0injWFIMmS1zCYHzGCFF6P3DfSiEC6+t9BWGSaUNiTHxIpOtXbvzJQiI8PGtlktkAkWkVnjU6bOjk+s3KSnsIfyaVPza3XxU9pe5/vpRs12Zdb0ye9uP60vul5no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547408; c=relaxed/simple;
	bh=yXQYjGUPut6PXkdfSl0YRjFdLTlF4PK0M5tnPbSrd0s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o7m0Upc196rm3uDPQSeNtRv8rZ/pJLluHEgsGT4YJjJoh/ZjHOOyPJjv/fsXO0RRGiJntuAwZhbj4rXhdGOcatC2/S0OZklhrpnpkcq9E/VM7ypnKwiepMwbPdd0lAdqhX/3oPZiJni3XxkFpzGWqXD5/zT0GetaKJMCTLN1F1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZY2Ci+rt; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZY2Ci+rt"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b069bfa817so15128955ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 10:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774547406; x=1775152206; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A0q74nR0onjV0BK2f2Df6n+ntIHSSjqGFZqE9Y1ouTk=;
        b=ZY2Ci+rtjocYXKdoxe2xkSmkz5kEfJqCeT1H6LOHL1yxOjs1T8n8TV5VwH/c83JnzQ
         dkJ5ooEHVrsGIJkI+1n9cMDeVp+H6yglucu+lr4akKukEdYJpiEXx+/2jfR7GMJritu4
         bU7+7v74FIYJ8dDMOE0aG/d8gXOVOOgMncafVWlgQSldedJAdTyKLGfgUWe/kVbJxlpK
         buOMAlX7hRZm6TZ0rxDFZUXWyzxXVQBpg00iDl2KOTTzHSf9N81jWwzA6r2F3/MmWpGG
         wYZ+W+olvRHL7m112O1cjtKK5vTBAajZDog14jcry0C22LiGvHR2nRc/Yfd5Pa6cCq3J
         /I3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547406; x=1775152206;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A0q74nR0onjV0BK2f2Df6n+ntIHSSjqGFZqE9Y1ouTk=;
        b=n3iED1Rox4lc+6lGYQ7s1Ujvw6CABs77c7Lwwo4yP7BEDbxInD112Vu7AOxFN90JuX
         y7ZeFwZnynjbNgCMvUHqmavwxNdL4cx33VZJ1PB/N+5WNIzuf8eeR/0Z+fDRfyAFqqyy
         wtLIbElTwAuDD/8iw3Wy232bWToDMOgOJaqd8gilSkkpoVWzUf30OP9wTW5G3gCoCq2H
         kRNmxBOgRtQAoPXKddQWR4dNzsrejOF4WleAIErmkYQrdBYFeCu5RiMSYRR+RfBMLkSo
         uBWF2JFo4VI8tIaBsyntSZCbAO39M5NryyCzBSKy2Cb1YACGvjqrxi59YLjoQ1GIdfed
         kMsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzcATXzsqn/YcEhoZj04Z3Yq/aTCWFCiUlkhYJtI0xg0geLRxKykDqUijjOCx0qk659+sEAhj5Qa87+/Irlz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMbeztKVdG6t3dLjTikopPeJMf1ICqI58jXAJiS5smrFoGIcfW
	5DGMx4MAfZ5Xhn3WixtbMun8aOYr4OtD/p8demOTGiQHIZrLu5jT8aU6SoIgzJFw5s/3VHtcW+X
	pClTq8P51UF9lbQ==
X-Received: from plbku14.prod.google.com ([2002:a17:903:288e:b0:2b0:ae36:890])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1b45:b0:2b0:5fa5:a68c with SMTP id d9443c01a7336-2b0b09a0aafmr93375115ad.9.1774547406079;
 Thu, 26 Mar 2026 10:50:06 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:49:22 -0700
In-Reply-To: <20260326174944.3820245-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326174944.3820245-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260326174944.3820245-5-jmattson@google.com>
Subject: [PATCH v6 04/10] KVM: x86: nSVM: Set vmcb02.g_pat correctly for
 nested NPT
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

When KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled and nested NPT is
enabled in vmcb12, copy the (cached and validated) vmcb12 g_pat field to
vmcb02's g_pat, giving L2 its own independent guest PAT register.

When the quirk is enabled (default), or when NPT is enabled but nested NPT
is disabled, copy L1's IA32_PAT MSR to the vmcb02 g_pat field, since L2
shares the IA32_PAT MSR with L1.

When NPT is disabled, the g_pat field is ignored by hardware.

Fixes: 15038e147247 ("KVM: SVM: obey guest PAT")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 0ad1e0348492..405209f8c4cd 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -721,9 +721,6 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
 	struct vmcb *vmcb02 = svm->nested.vmcb02.ptr;
 	struct kvm_vcpu *vcpu = &svm->vcpu;
 
-	nested_vmcb02_compute_g_pat(svm);
-	vmcb_mark_dirty(vmcb02, VMCB_NPT);
-
 	/* Load the nested guest state */
 	if (svm->nested.vmcb12_gpa != svm->nested.last_vmcb12_gpa) {
 		new_vmcb12 = true;
@@ -754,6 +751,13 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
 		vmcb_mark_dirty(vmcb02, VMCB_CET);
 	}
 
+	if (l2_has_separate_pat(svm)) {
+		if (unlikely(new_vmcb12 || vmcb12_is_dirty(control, VMCB_NPT)))
+			vmcb_set_gpat(vmcb02, svm->nested.save.g_pat);
+	} else if (npt_enabled) {
+		vmcb_set_gpat(vmcb02, vcpu->arch.pat);
+	}
+
 	kvm_set_rflags(vcpu, save->rflags | X86_EFLAGS_FIXED);
 
 	svm_set_efer(vcpu, svm->nested.save.efer);
-- 
2.53.0.1018.g2bb0e51243-goog

