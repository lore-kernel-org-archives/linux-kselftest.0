Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A6C235BE2
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 00:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771894526; cv=none; b=gQdP7sF2kHMyTHKOMUXkdTcw49UvkiC9hu3Tr5UivuAn0iC1paD1QPwKZ9L5eoG+UlqcV93d4dWRQXMtploJDg1XtrtWnUKgRevXYC0qExjqT0Oaa+sLkpfsF8CP1KNHY4bh7mEhHmrLH6dQ+TROjQNI+IsDDF6WNVzt3+QbxlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771894526; c=relaxed/simple;
	bh=KvLeiV0Vjji8SiyrDnRu5DIWGXhZccf7uaKSyEhILb4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ezTN08et3qQG/n/7HnMZkbJAzc1Lx5Bp1LAgqWYOFc7Vud9VcqmHQDcoos8BvSyXljjRx2ILmO1zW8LQ+gjcf6rybrqYDFjldhvSwEkf9+crVLWZJ+LHkDtrc1j9zWiL5BqCnUV6RoqzlvXOLMGv5NlOypEOvhzKZK66uLwNoNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k+kQ3/lq; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k+kQ3/lq"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso4536666a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 16:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771894519; x=1772499319; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bUKIiVYJTDw1mDZ4aEBlsw/+AO2q4TbZR44wBl/k5uE=;
        b=k+kQ3/lqZA6XjICx5lIKP6ZpehY9zGIj2KM4h9jUPkyDo9ClwPc876tL9OL/3nuogA
         Iy5VebPGyl8Nor/oRlpfi/kkfUBxBFAi7Gb9NomB0oG+dqpJm/C31/dVwrI2e1T1z8C0
         YbSNAjywOsecqiGOxFjeLVPebZZNlwD45Z+tFVuBkVIAa6vF6SvgQemMbHHYTu4DhcCg
         awOnfvKci+W1ldsk/opbRQ6pnjnBZY5HB262LtllkVrzLk8bwPRD3WdSL//F1YN+sCP3
         /nQpHe17wFKHjNerFvHAGgPaegLaytHfJXzTIqp+SU97E06JUivzDIUzON03unHKRquZ
         dRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771894519; x=1772499319;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUKIiVYJTDw1mDZ4aEBlsw/+AO2q4TbZR44wBl/k5uE=;
        b=o9wrsXcZoqqfAy5VErmvQAQRJZKEo3sihWdh4YDrk7YM7ny+buIUfVhGVxhMbJvNlV
         vh6PiS/rjz7zm+ueCuUxHKlHts7HlJD/o8occ3sqNFHHFMSwz06sqNshQJqYTzXoWLkH
         LkOIGRWMv1xoCKNeTUMxVmpoRKT5nbalQSzv6Q6JcvZHO+kt9/chjABMih1McZj0OOaC
         GAGfFGbDLhtFHv5P7G4EDkIOeUGiPjUwrI4X2ExZBerVFal7KR+wEVlEgbW7K70fXEyI
         mA3Y1l1iCXNtfQ1rNjhcgKRl0T37t7EUeGCe/q5e91ViUlMWtdTMhzRKGdpS4rz6t4eZ
         d7Sw==
X-Forwarded-Encrypted: i=1; AJvYcCX1jq4wdZYQk+Yeo2hfatm/HKjOI9lBPENrJ8TpTaEvNqMF5gp8RxiZw6oclVnzMNhVJPUhxyFqo5rjspHuXtM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5G84vuTRvjsMk4k/yYKe63x3I+5NnkceLKIjlFY3WMg8R3pOo
	69sJk3w7hZFEanQctQlrCucS9KEuoSFDnCOF1Xt0FOS/6qIOygCuGWq/cx904P239W7nYmyuzfv
	90+mLnr5H0LWRaQ==
X-Received: from pjbmu3.prod.google.com ([2002:a17:90b:3883:b0:34c:34ab:8fd9])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5864:b0:34c:635f:f855 with SMTP id 98e67ed59e1d1-358ae7ceb11mr9530118a91.7.1771894519240;
 Mon, 23 Feb 2026 16:55:19 -0800 (PST)
Date: Mon, 23 Feb 2026 16:54:45 -0800
In-Reply-To: <20260224005500.1471972-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224005500.1471972-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260224005500.1471972-8-jmattson@google.com>
Subject: [PATCH v5 07/10] KVM: x86: nSVM: Save gPAT to vmcb12.g_pat on VMEXIT
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>, Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"

According to the APM volume 3 pseudo-code for "VMRUN," when nested paging
is enabled in the vmcb, the guest PAT register (gPAT) is saved to the vmcb
on emulated VMEXIT.

When nested NPT is enabled, save the vmcb02 g_pat field to the vmcb12 g_pat
field on emulated VMEXIT.

Fixes: 15038e147247 ("KVM: SVM: obey guest PAT")
Signed-off-by: Jim Mattson <jmattson@google.com>
Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>
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
2.53.0.371.g1d285c8824-goog

