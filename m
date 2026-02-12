Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC646331A46
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770911962; cv=none; b=F923aX+7eCw91ZLL6aUrLoAjqwnAFhj5bJejJoFdbDW4Vx7cbNWXGF9m8dawUjJrM7xUQu+pZukfTLnefxHGsjtw0O6tun5tOvN+6D+p54urkOaY8c36GZfWtYm3aH+OWNY2OXvSt7c/l+1B8yYK4Cd0InG1GuBxrJaebPQwSOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770911962; c=relaxed/simple;
	bh=++djy9qE0Jp6xQfXeogvywVaePhWe023CD1zQ9+shs0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eImhJm1tvHCHpomlzHPVhjHcj4jSzAOLsDGstD6X3KiCHt3/E2diZlBvJeAQchQxwqxE78SPuq8l2DbEcmPk2o+Dy5jwEtdv7A6SZ5+DbSIxyzvivPvYlUk/6Locb5yDlHZP3bHbGiJlPnjeYPpd1ddgPFLvIGE7LG0pOl+UhQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AVdHkij9; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AVdHkij9"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a76f2d7744so34990415ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 07:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770911960; x=1771516760; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2K3QbxzwUqR/5mBjTZowvxoPbPjbPH0qQe3lheBbwSQ=;
        b=AVdHkij9pCKnFB9bD7XnQI0kNTUFT0ksN5cPC3jqige7G8d9DOKdY8eIu7g5NoWjKI
         RoOPqXE7B+cRKp02J2cmlROmYCn7/zK/P4sd61PclhPxOm4ED6Zcy3pOi5p8b6LlY7V2
         gYiwUIqd4//gHihuovbu8lT8PGV3xotfIv5Cql9BndZ7aBS8RzeuGVLsR2m467ZaiC6n
         9qLdHuDmzQL72Pg+/y0ef6bMS7QvDIDteIxhk5d/sojvJuHqy31EqG8Ha58YggK+ek4b
         +mB+ZV3R8zHb05QZeHfummTdDkCXsbhwKEokW23z1tKdEXy5pmqWZ8Veaf5BV6JYbIVb
         Rdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770911960; x=1771516760;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2K3QbxzwUqR/5mBjTZowvxoPbPjbPH0qQe3lheBbwSQ=;
        b=Mu3IiiB8wPp7SRI1ngFqNg9wzmrYnQvrUzWy0lFxRxH2cQ9q8xOPA4CNkeebhv2zmu
         cKYvVPMPRZhpiKwMHwwR/q0BFE1sZLrM7l93xQZ2JDLEWrOZDLsW+/45pb/KBTG5o00f
         7feudGG/GKap2QsCxlfAdABx7QZtPDl7u5XuFF2xgQS+f05uL2fR9ztSYfxibSFYYcCJ
         +52/02VRobrwNdFILWxm5oQ9UZf84clpwionX1WhTnnpaRKi7zFNdBGQlrdNFqstk/ff
         jjeyH2uNUd0mSYsp+jg6J6TUeiDHqeTV8/zg+QQcY42Y0EKNm1HKMvXyrX0UFMI5ttDa
         zinQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrQkG+vgLcdAXzuW5SysZ3mZ+gJBv5cs7k9oApIxUWwH4SRLS42FLYv7qiH21KFNcyeIgmZZI7SsCPWKqN1YI=@vger.kernel.org
X-Gm-Message-State: AOJu0YykwfMAnTWkYe6FR9TBjWjd4BU5S/F/s93WD+UZfoQFrV0EsJRp
	JmJPXJW9j2T7+xO9E7fTTk1f0rk9TOmjNSAlSFhfDNUiyrNNt6X5ue/jN3PPLGxw1XTIps0C44L
	bwbN8MwnaMilRWw==
X-Received: from plbla13.prod.google.com ([2002:a17:902:fa0d:b0:2a9:622c:47d6])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:9cf:b0:2a7:d5c0:c659 with SMTP id d9443c01a7336-2ab3b1581a3mr26923795ad.5.1770911960328;
 Thu, 12 Feb 2026 07:59:20 -0800 (PST)
Date: Thu, 12 Feb 2026 07:58:53 -0800
In-Reply-To: <20260212155905.3448571-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212155905.3448571-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.239.g8d8fc8a987-goog
Message-ID: <20260212155905.3448571-6-jmattson@google.com>
Subject: [PATCH v4 5/8] KVM: x86: nSVM: Save gPAT to vmcb12.g_pat on VMEXIT
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

When nested NPT is enabled, save the vmcb02 g_pat field to the vmcb12 g_pat
field on emulated VMEXIT.

Fixes: 15038e147247 ("KVM: SVM: obey guest PAT")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 69b577a4915c..26f758e294ab 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1312,6 +1312,9 @@ void nested_svm_vmexit(struct vcpu_svm *svm)
 	vmcb12->save.dr6    = svm->vcpu.arch.dr6;
 	vmcb12->save.cpl    = vmcb02->save.cpl;
 
+	if (nested_npt_enabled(svm))
+		vmcb12->save.g_pat = vmcb02->save.g_pat;
+
 	if (guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK)) {
 		vmcb12->save.s_cet	= vmcb02->save.s_cet;
 		vmcb12->save.isst_addr	= vmcb02->save.isst_addr;
-- 
2.53.0.239.g8d8fc8a987-goog

