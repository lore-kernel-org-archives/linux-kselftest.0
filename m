Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F75390CB2
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 22:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778712393; cv=none; b=nMDpPUs92KTP8/gGmtDEAIbRY4/kefRrt1hMtFnKCgpYen/AsqADRevUsVlJEEUJqWWHUNADo5Zlde8VCoGPFmP/dpXld/xBhc1Idw9g19d2KdKCGgmjP27uiwvz15l+4NqSroHzfGqIhXwsiiPKXHyB4PtlcU2g1xAE+dRjhGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778712393; c=relaxed/simple;
	bh=b11XUpE+Qvjysy7GSHucRlBpTS+ZIM9JfuQegrLCHv0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EcnSPsuyIkkrCnVdSIwbuNFzzuu91+ArM6nz3DcYFOeMnMZSjFSHKZHGciXm3iSFIBW9zo8WgTy0//K2E7LCZq+lndiYtMQ7CmOWSJQShHLKAUjQct91wgJ1vAdNF94O2QnFtX4rs9MO1ATWasMgF11j1RCZ9giGqSx4WGiC63o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qV8uV4fk; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qV8uV4fk"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-365faf6006dso8464613a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778712392; x=1779317192; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5zaz0wcvAs+YfGhyqaH4VQMkR+DLupJ9Y1ZVed6FTS0=;
        b=qV8uV4fkASCx4JPFI5+chbe2hnrG1zsU6TvNHsjv7HxszfoVMAbpbDzPfqtcS7AS45
         oVS/9TokDmRFEnndRTPk7bW7I+/x/oqoVNb816mVHz1n1VirPgmYtGMTwJxrbpTcmjqH
         9o7L91Pkzqm5fhK2k2+AsYWEz06IrTrdePXB/MUtfP7IP+HZEHsGug+xG3jUU/vnUJpC
         E0ZmBoFs8kVS4jwRhA2oiTgmfJ2sPu6S0qsJjmtoyQmiTmZW9WXz5O8RupuacNez2RLZ
         PYcE6yPDwi76sKBYXAK1XG9hT9FKukRoJ49aEVGfRqDmVOTwEBPzatk0lD3N93H+AGb3
         lAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778712392; x=1779317192;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zaz0wcvAs+YfGhyqaH4VQMkR+DLupJ9Y1ZVed6FTS0=;
        b=FrKUGWQ0p4TIeWH9u7d7UT/jbMDjTfDJmWEz/GSqSLWd4bocyKPF+Ics63DcqYAlyd
         NWvhPin+EkECU4guEeeTyKTG8qmBfSLTpztJ+JyotN3k+05qTMLlRxQHO7UNQnWa/xow
         KiWARWU6p6nOYbuZ0CyDwMhau2d4TaIPaGKYR3eG8cRf1/YXowW+Jt5syqLe5KZxLKDg
         rWhrPvFyehxwpaQvMaTB8bl96h5WCjDM+mBkJEiiWEImI+0kmSftfjK4MtBD6EBZe5qk
         2O/ETDCZ+KbeCci1xvXuUC92UtO7elD0T7XnGz5F/SsbFVtX+3kyAhaNc6d3DVm4znxh
         7okA==
X-Forwarded-Encrypted: i=1; AFNElJ+wJg+SY+rP3zxD6N67emsa/7AoIAtLcbum8YjTBptwDSBpNOZpB0zXD60xHpk9yOcNhHD3uhmfQE8M3IJ+vz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCP18algUwAFxKSce20nwWwFhZyarRgWx/S/WTiDT8xrIDKDeJ
	sGOP7+jpkGqMj1f2ZB0kJC7INkLHCH271H6fZFk5/E6JnOF4RLVMeWdWo9zoL3moBkpJVSumfqZ
	xZEzL8S/Wt8P5eg==
X-Received: from plck21.prod.google.com ([2002:a17:902:f295:b0:2bd:16cc:1966])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:f946:b0:364:edd2:812 with SMTP id 98e67ed59e1d1-368f40a23dcmr5432822a91.25.1778712391617;
 Wed, 13 May 2026 15:46:31 -0700 (PDT)
Date: Wed, 13 May 2026 15:46:05 -0700
In-Reply-To: <20260513224608.1859737-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260513224608.1859737-1-jmattson@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260513224608.1859737-3-jmattson@google.com>
Subject: [PATCH v3 2/4] KVM: x86: Remove supports_cpuid_fault() helper
From: Jim Mattson <jmattson@google.com>
To: seanjc@google.com, pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	shuah@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, ctpence@google.com
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

The function, supports_cpuid_fault(), tests specifically for guest support
of Intel's CPUID faulting feature. It does not test for guest support of
AMD's CPUID faulting feature.

To avoid confusion, remove the helper.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/cpuid.h | 5 -----
 arch/x86/kvm/x86.c   | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index bc4a8428b836..95d09ccbf951 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -183,11 +183,6 @@ static inline int guest_cpuid_stepping(struct kvm_vcpu *vcpu)
 	return x86_stepping(best->eax);
 }
 
-static inline bool supports_cpuid_fault(struct kvm_vcpu *vcpu)
-{
-	return vcpu->arch.msr_platform_info & MSR_PLATFORM_INFO_CPUID_FAULT;
-}
-
 static inline bool cpuid_fault_enabled(struct kvm_vcpu *vcpu)
 {
 	return vcpu->arch.msr_misc_features_enables &
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 01c6b18d1fe5..c60773349f35 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4252,7 +4252,7 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	case MSR_MISC_FEATURES_ENABLES:
 		if (data & ~MSR_MISC_FEATURES_ENABLES_CPUID_FAULT ||
 		    (data & MSR_MISC_FEATURES_ENABLES_CPUID_FAULT &&
-		     !supports_cpuid_fault(vcpu)))
+		     !(vcpu->arch.msr_platform_info & MSR_PLATFORM_INFO_CPUID_FAULT)))
 			return 1;
 		vcpu->arch.msr_misc_features_enables = data;
 		break;
-- 
2.54.0.631.ge1b05301d1-goog

