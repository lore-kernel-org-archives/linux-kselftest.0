Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364A63612F1
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 22:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775169083; cv=none; b=a/tkGG5IeJDgS9I9jpB+aNNZsBIPRskebJBybSdSMs+b2qlgz7haDkw7ahme6U2dOhT3nS/BHgH/FZj2YEz9BTN29KCb/+YQbglWykx+VPqJTlJ5/RS/lOrbq3g9uqe3gBYr0v0z4mUmLjiSc8gbC8Ax6mvh0GA53AJfqbQtIfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775169083; c=relaxed/simple;
	bh=nWSMKD++4fY32Qb7VNxn4QlRvNQNcikpO272RvpfzXY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Vmu6JP5KDRfgoskp4nyfw2SRK4KlSpadpDg4tbTYdAEnf6VkZTeFPRHGaXLtcfqtkslWIu1mrVww75MkzlCKyCLjC3WoMJWBawhjXFmBFWiqMqEVMnQi4TN82Wn+Dm08U9m8rYXo2Xxh4unaPCvigRgt3JubiqshFi7FP4TB4fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tf1do4CB; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tf1do4CB"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b0b0aae381so13967345ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 15:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775169080; x=1775773880; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i6PCZBq+n3lN/5mnm+cSqzCfjBiG6m6+Jqo3i/q1UGA=;
        b=tf1do4CB4SM/B5iJLDTb3fKz89Ri1sgoKIAombdtZ6QuABNlW7ExBFiI+uQnXoVO0f
         sIARqymC91lygLahArXWNQBuWoMsrONGVcRAfoQH/pKIv+QFn1ZEiiyHJj0UO2iZAE4c
         AvsNwHYZzQs/bB6wtAOhrAbkN0ityadSKqohD/m8dOiu4Y4i9eWCWjjacSeqimO/Wp5Q
         7+Me/hyclgQySuTNcN0YLPvcy+rtxqReyXY5qOHLR9zLNMYDMq0Pa1sTeN8tbrJat+xW
         Sf3p355CGXqDhpesOvN7WazOqhp3bQm5VsIukfpIKwMpeg57A87sQuqJ8sJ3qrO4IWFZ
         vNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775169080; x=1775773880;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6PCZBq+n3lN/5mnm+cSqzCfjBiG6m6+Jqo3i/q1UGA=;
        b=L9Horp4pkR5erXMSPma2qDpm9+1ZS077wTTrFDmM4yMtMumfw1yUpI2R1KeiUTiZIH
         kGM1UAgo62sshR/0m5uW3j5zQ+e3ee8mlf9YAQayAWZrma4McDzwBAjdJnRBpNAG5du0
         ew2oOWnrAxl/zoZAf2K1yclm99gDTmU75VT5St0Hv6MnUgb0LtUxP28SCAXKO3SQ3O9d
         gNJ3YdMFJ46l5Q3YP7MJDRM04k67OJ1Jsiny5VD1VyG+DaxCzr7upCtqoh6m6IYM6kFg
         RLspvuyoePKX2GzzxZDomXtJS+c/9hoop5Cao3nQdIGW3Qk1wrbWb3sVLzlnR0Iju0k2
         X3cw==
X-Forwarded-Encrypted: i=1; AJvYcCUXlQSPB4uagvyGdXadLStnoZ9qa0nMX060zNhZqvwbRD5RV/y74Dzj0tIrybxie3MpOmGCCbTgHiP50MXEGQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVDGiJAUs5VRF93AlTAHVWe5egBPwPG7O2miCWeULQpBQny9Uu
	hFbQ1lLq/GNz2JxUpJjVBN2vsvAX9zzhWsECX8U9aUhxhAmRU/+yi9Wnd4DbHPB9hkbE+RIKdue
	l/58jWurcW4c4Tw==
X-Received: from pfwy21.prod.google.com ([2002:a05:6a00:1c95:b0:82c:de4c:2172])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:2703:10b0:398:9bb1:ad08 with SMTP id adf61e73a8af0-39f2ee0182cmr430531637.26.1775169080323;
 Thu, 02 Apr 2026 15:31:20 -0700 (PDT)
Date: Thu,  2 Apr 2026 15:30:59 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260402223108.650572-1-jmattson@google.com>
Subject: [PATCH 0/3] KVM: x86: Virtualize AMD CPUID faulting
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Clayton Pence <ctpence@google.com>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

AMD's "disable CPUID in usermode" feature is analogous to Intel's "CPUID
faulting" feature, but it is advertised and activated differently.  The AMD
feature is advertised via CPUID.80000021H:EAX.CpuidUserDis[bit 17] and
activated by setting HWCR.CpuidUserDis[bit 35].

Add virtualization support for the AMD feature.

Jim Mattson (3):
  KVM: x86: Rename supports_cpuid_fault to supports_intel_cpuid_fault
  KVM: x86: Virtualize AMD CPUID faulting
  KVM: selftests: Update hwcr_msr_test for CPUID faulting bit

 arch/x86/kvm/cpuid.c                          |  2 +-
 arch/x86/kvm/cpuid.h                          |  8 ++++---
 arch/x86/kvm/emulate.c                        | 14 +++++++------
 arch/x86/kvm/x86.c                            | 21 ++++++++++++-------
 .../testing/selftests/kvm/x86/hwcr_msr_test.c |  2 +-
 5 files changed, 29 insertions(+), 18 deletions(-)


base-commit: 3d6cdcc8883b5726513d245eef0e91cabfc397f7
-- 
2.53.0.1213.gd9a14994de-goog

