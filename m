Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6989334372
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 21:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327825; cv=none; b=li+mSVKzqJjxP8DDP1JFiUbDTFO3j5mCnoZatBK+4PNKOOAcJtQrDDKxSoqJYf/cOdf+Ryf5JD7YeVAorJKzIfsOeVys1t8eTnSJ2Tm/xcJkG2GRCq7Fyt5SZRRUptpeyk2Eho/ARfb8HiNaAXMHpufodjHDST3d4jhm6Zv2pyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327825; c=relaxed/simple;
	bh=VKK3FI5CznSAk7yWaDS4FKTM94PMhdrLBqenb/UE3CU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r/hSiFri/TqeydODJojvmUb2xebedsJ1Ng9hrCDrjYHhJUwQrKFer+eg/A0vDWdPqh/oNmR/wbREDEqHD38WiPvOntC+h+TA7v0ECAN44iYS0b3B9sh7JlvJr3t9s7hYrIX0hE9VnzQbYKU3DTcIv4VAFo0Ck0ZCuJvPFwkyqJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yN34Ik7Q; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yN34Ik7Q"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c636238ec57so903043a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 13:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770327825; x=1770932625; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/y42SgBvf8dyV9xojnKcBJj98e4MjkxOU4lKNEYjtnI=;
        b=yN34Ik7QD3KL5yHDFPMvYywOYoh5TyfWVj++g6IoN2BDRMLrOItTWJqLJEPHjaetWe
         TkqQEARIDPbH75UO7AWCWF7HRnrXhgPjhywqCzglhIISD1KYp+1qn6WHS8x+jAgUZKPU
         8is009BGMGPbt0KIWkjlYtbhvFpnCfeHV+I01zsmWrNW5Fn1aBaBVYnPIeEDsfOWMTdg
         5dc5X0Y5UBVXVz8x4wuERTKGW43d0KIlgk1SNGN6/g8xTgT2xIhz4Dd9Ms7h2Xb1LteB
         fCmDLNzLhu+mL6KtECSmLArE9QBuuM4s9iIt1fDiIlOKisMLhNIRoJYA16KAFsy9vPen
         RonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327825; x=1770932625;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/y42SgBvf8dyV9xojnKcBJj98e4MjkxOU4lKNEYjtnI=;
        b=mqnGHIwmsPIEqb3qyFRCRoYk3m8rmtfM+kq/y4n9VhTuYx/icLRIibkWrsYDdStrPe
         5lgwFReYWektPq/LCNFgimHyx3wA9okP7oSxDH17ZgXMPZdaqVN4GuBrARN9UC4y2guX
         XGQkjUfieMtN/ctdkrX33+Celbofti/GHneSejovW5yqpxDSg5YFsFNMbObGThpep1fc
         BSMhUxxo+zMn01q7nT65O1iwpYB/JZ4dQREbw1PVHN17NiAldyLveqH3taBcAKW23J1g
         P4AIHrPxFxyaeD0bAOr+JEkdvOJNxjpSk/pq5n3+QAwqaWS5OQtxY0hGEnChWeqnC1wD
         VUUA==
X-Forwarded-Encrypted: i=1; AJvYcCUOKoq9wtAdGxyz38BKRxlaraAm76er8LTU2U+SkdkmHG2swh0a/txhKuKEY5IAFeOVkmAlESWSJ763mACs1Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7/tecA6WzXGoybDi78YbhEjNdTWXiLc03YYSIKRQO+gsZQlJ7
	vu4ob+V4fS4REpOHXHcbnaP1rETwbTzGseUESoUPskxHkx2JoZ2xZHhH121ECpksS3Wf0M5oNM/
	Ad3Zej+DVFqDjqg==
X-Received: from pge15.prod.google.com ([2002:a05:6a02:2d0f:b0:c64:8baa:4f1b])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:ce4d:b0:366:14ac:e200 with SMTP id adf61e73a8af0-393af250deamr354321637.62.1770327825224;
 Thu, 05 Feb 2026 13:43:45 -0800 (PST)
Date: Thu,  5 Feb 2026 13:43:05 -0800
In-Reply-To: <20260205214326.1029278-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205214326.1029278-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260205214326.1029278-6-jmattson@google.com>
Subject: [PATCH v3 5/8] KVM: x86: nSVM: Save gPAT to vmcb12.g_pat on VMEXIT
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

According to the APM volume 3 pseudo-code for "VMRUN," when nested paging
is enabled in the vmcb, the guest PAT register (gPAT) is saved to the vmcb
on emulated VMEXIT.

Under KVM, the guest PAT register lives in the vmcb02 g_pat field. Save
this value to the vmcb12 g_pat field on emulated VMEXIT.

Fixes: 15038e147247 ("KVM: SVM: obey guest PAT")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 08844bc51b3c..0b95ae1e864b 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1169,6 +1169,9 @@ int nested_svm_vmexit(struct vcpu_svm *svm)
 	vmcb12->save.dr6    = svm->vcpu.arch.dr6;
 	vmcb12->save.cpl    = vmcb02->save.cpl;
 
+	if (nested_npt_enabled(svm))
+		vmcb12->save.g_pat = vmcb02->save.g_pat;
+
 	if (guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK)) {
 		vmcb12->save.s_cet	= vmcb02->save.s_cet;
 		vmcb12->save.isst_addr	= vmcb02->save.isst_addr;
-- 
2.53.0.rc2.204.g2597b5adb4-goog

