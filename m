Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6D9DF59
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 00:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771894509; cv=none; b=KBvNCjDOfW1PrIwqF0fe98DNQD5csYXQRz+R99qqf6k7g5dMfkPnfzKEHijuPdXS2fwZbyCy6Co48Ils7ruxKwbf/kuXhqym64tMbTQ9lut/FHDv7zu2oyZzxMuUkw2l/A0a/yarbI29rkUqLpIprawxV9SBy3bDFlCIFcNbcaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771894509; c=relaxed/simple;
	bh=yzHGZZ2ewLti5LjEpsu8YoWspgLFHukV4Dkns5nW6fo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QbPMFDdif8m7F8lLA0KXH3pVFY29LYUdKQVGOZyeEeGoO142qPWo0cnkIuIlkiDf2t+V5baYD1NmVsL0Z8JDZvXgFYzLgbnjNIkAQGRMhHiCK1vkOYdnStOmPUVljRSRGjS4wzfrtohPuZ7u6T6qLAkeY9MULXM3sYhNOJwPiKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E+DgHxW0; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E+DgHxW0"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-354490889b6so23243396a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 16:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771894507; x=1772499307; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qk5qzRrV4XbbKnkQ2PaR5i8agEGx80lRKWSK1C2rXwg=;
        b=E+DgHxW0xZK41VGQCxO7ThCjjwz1GcT8Zi1sO1UWgIb5p+svhhFir4NB/jeqb+RmVE
         YcfBEcHITD/fZ0Gaotk6k/XPN7yyji6tC8zQ7QjI7PYwRx6avBbjnWHTxy34xTkG7VFi
         eQQFUQ7XyCGMMDK/Xta32BoPZRYoYw6ePpgLVEHrVGTPSXQcN9Vd/+/IyJhW6GmPSqAV
         sQXJoi36EUoH83CSQRIB44gvT8kSXtCERvWdMegUTg9bjKQhq7LZAnPsqKee7X/MD2nQ
         h8T0yP0qxUcgRiVknBg+CB4odT3HljEOrf6bCGFW+uaoGlq7lzOCX7gNkwnEZPro8qvQ
         55VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771894507; x=1772499307;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qk5qzRrV4XbbKnkQ2PaR5i8agEGx80lRKWSK1C2rXwg=;
        b=nDGcAGlKJR11y8ZnBcL/dvxdnNU5t/28O9A1yLJQfQCAQqVeOtpvfQugV/t2G0ztuP
         A8KGQSGxIKD46QTZLaTXPg5H5MnoFumqxR9zlhngBZTur6mLb0sjUDQmVMvaUlgzFI5n
         w3SrfCOflnOE4NxfM6sk0Zcuv8yYUgKS5K7YE6aVe56PybU0kI6CkV7d/Qug5vXrWaQ5
         /YrrTtnDL6FaRp/edGlxKAFGFOS/NYa5B8y/Kb+95SRwscIeF4XSqqnO2HKVph23K6KS
         uUWftL2DFrbLPKTGRzRGbg8xoG98PzH0qTtvySqVQXD3R6M0VqN1dJmG3SJZ+KK+5hRC
         OTJA==
X-Forwarded-Encrypted: i=1; AJvYcCXj0jdgzqLpkXPXoJD/u9TtKhtp9sHgK1sEzRXGx84Hz7CAuWaCjKl8AixLmhOhBta4XJvr8UlmIcexU5qb8Y8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWzCRW8bKJrBb5WAwzyNlhyqstkH5PRFqcsRTCqxbO65MB9/QD
	4yJ8X5/m8gBvtO8h8kJ6/ISLeMJuXJMgDuxg2WR26NbKZD+5B3bOAb4BB8QB2ToXk0hzXHaDefO
	JHS/tB3K6rnBJmA==
X-Received: from pjbsz4.prod.google.com ([2002:a17:90b:2d44:b0:354:aa76:8270])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:548d:b0:353:e91:9b38 with SMTP id 98e67ed59e1d1-358aea06d44mr7524548a91.34.1771894507380;
 Mon, 23 Feb 2026 16:55:07 -0800 (PST)
Date: Mon, 23 Feb 2026 16:54:38 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260224005500.1471972-1-jmattson@google.com>
Subject: [PATCH v5 00/10] KVM: x86: nSVM: Improve PAT virtualization
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, KVM's implementation of nested SVM treats the PAT MSR the same
way whether or not nested NPT is enabled: L1 and L2 share a single
PAT. However, the APM specifies that when nested NPT is enabled, the host
(L1) and the guest (L2) should have independent PATs: hPAT for L1 and gPAT
for L2. This patch series implements the architectural specification in
KVM.

Use the existing PAT MSR (vcpu->arch.pat) for hPAT. Add a new field,
svm->nested.gpat, for gPAT. With nested NPT enabled, redirect guest
accesses to the IA32_PAT MSR to gPAT. All other accesses, including
userspace accesses via KVM_{GET,SET}_MSRS, continue to reference hPAT.  The
special handling of userspace accesses ensures save/restore forward
compatibility (i.e. resuming a new checkpoint on an older kernel). When an
old kernel restores a checkpoint from a new kernel, the gPAT will be lost,
and L2 will simply use L1's PAT, which is the existing behavior of the old
kernel anyway.

v1: https://lore.kernel.org/kvm/20260113003016.3511895-1-jmattson@google.com/
v2: https://lore.kernel.org/kvm/20260115232154.3021475-1-jmattson@google.com/
v3: https://lore.kernel.org/kvm/20260205214326.1029278-1-jmattson@google.com/
v4: https://lore.kernel.org/kvm/20260212155905.3448571-1-jmattson@google.com/

  v4 -> v5:
  * Separate commit to remove vmcb_is_dirty() from first v4 commit [Yosry, Sean]
  * Introduce svm_get_pat and svm_set_pat to keep all hPAT vs gPAT logic
    together in one place.
  * Remove the no longer common logic for get/set IA32_PAT. [Sean]
  * Make vmcb02's g_pat authoritative for gPAT.
  * Clear legacy_gpat_semantics when forcing the vCPU out of guest mode and
    when processing a second KVM_SET_NESTED_STATE that doesn't have legacy
    semantics. [Sean]

Note that this series should be applied after Yosry's v5 "Nested SVM fixes,
cleanups, and hardening."

Jim Mattson (10):
  KVM: SVM: Remove vmcb_is_dirty()
  KVM: x86: nSVM: Clear VMCB_NPT clean bit when updating hPAT from guest
    mode
  KVM: x86: nSVM: Cache and validate vmcb12 g_pat
  KVM: x86: nSVM: Set vmcb02.g_pat correctly for nested NPT
  KVM: x86: nSVM: Redirect IA32_PAT accesses to either hPAT or gPAT
  KVM: x86: Remove common handling of MSR_IA32_CR_PAT
  KVM: x86: nSVM: Save gPAT to vmcb12.g_pat on VMEXIT
  KVM: x86: nSVM: Save/restore gPAT with KVM_{GET,SET}_NESTED_STATE
  KVM: x86: nSVM: Handle restore of legacy nested state
  KVM: selftests: nSVM: Add svm_nested_pat test

 arch/x86/include/uapi/asm/kvm.h               |   5 +
 arch/x86/kvm/svm/nested.c                     |  63 +++-
 arch/x86/kvm/svm/svm.c                        |  57 +++-
 arch/x86/kvm/svm/svm.h                        |  20 +-
 arch/x86/kvm/vmx/vmx.c                        |   9 +-
 arch/x86/kvm/x86.c                            |   9 -
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/x86/svm_nested_pat_test.c   | 298 ++++++++++++++++++
 8 files changed, 422 insertions(+), 40 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/svm_nested_pat_test.c

-- 
2.53.0.371.g1d285c8824-goog

