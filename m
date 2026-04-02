Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71D63D34BF
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 22:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775169083; cv=none; b=DVU/KPmcI0JuLMBU1qQrvzXLzFeFsPjxCQtY72cZ0ccuL3qMrtkgh/j8pYQ+fuYgkiYI1ZcjpPvzlzSOCykrPahWmm756cLvmTXG5XH7o8q/bP5W17d5+aE9E3j0Hwo4D4Tz3jqC3eI0trG9BnzsHQVbKrpOb5rRh1h/34gk7Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775169083; c=relaxed/simple;
	bh=X0ttpMy/Iam3MK8Sh3ziRSgNNEQUC9tuY+SPxPR299I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JhRgvWbyZILTUTMP5wDQZBwHEIwhhKA0zWuTk2uSq90rm51v2WYUCeTu9u77xRZKY4Wj+U9jDAi0P8NxGdH6LZeXXCGUajffIaAWn46QjAqqcSLaOCo2W62t63fzIl64Ki1klAZEMauREE3PFYYKn6VTUXBIai42kHwtT/L5Jqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XkHBqhpg; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XkHBqhpg"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c76b6ccf298so857412a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 15:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775169082; x=1775773882; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tN1qvvvgvtf7yajVcKYh8yLZ+h708jFgLVbhV2PVstI=;
        b=XkHBqhpg6IJL3lLhgqi9CcfIACJ8ENAcA84EdBX2ddXfqSpgcBHBVxynAIKYUUutBX
         35h4yoHo8dpYsTzlq+QwUvys3YiXgV3lWFh9w/Z8QIj1Pd3WrPzOEOgeW75g53apvQYj
         D1RwuTjpPBoSAmz5ikEqWOwfLsY+ETmOlKYtEHdpwiTVViO3TpejwNuNKpxV3rA/Hzg5
         xaWtw5SJaFYlvvF9iZUwlckePvr2zMtcJSacSqn3hYuKx4Z4h1wl6vrpVDtLU3Fg+hH6
         P7/QDmb5ui4jBF4JKqsnIX3oEzF/FZI3rpZg7F9qyynVSTRKlF1RJ9ZhzQ785WIHYUCM
         0dDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775169082; x=1775773882;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tN1qvvvgvtf7yajVcKYh8yLZ+h708jFgLVbhV2PVstI=;
        b=k2Cjq/IR/CvM+Jsm5SXAIVfS+bNk9d94H/M/z+cQ3koO/19CsBHFthsEkaoTxObtfK
         +EfNmcuC/ONDzX5VwEq4YmmYNCM/8+/RUHVqgTP5hR50F4ZQaJlFBdEvhwzUqqo69jou
         Bp9I7Tclu0a5JiTaDD6maP9bL5Y4xx6M1zp5161dvJAWKguVbiK5YPM8uXp19v5h97xE
         DKyZ3LUp+e80x6UN1wv00aHXE6n7VQ5mThjf3Rh8Za8Mk8BTaVI8ODJ+LK7mcHnw9pSN
         IjVW1xg5SG9WTC/2W+R4Lk/au1/v9LipZk7RHSAfWuYTm33VvBtI8bITpnuHHLd10WH+
         NQ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZQJIrLeJCOKtEavl3+Ffmz1s6k87YJJPg8cgwsPTVlO6oKD3qxK+AjmEASew+P+Yf5jE/Z2s34mwGv0kBx2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3L23pvsjSeXwq5qmaJYgtFLPdnRLVQBym58uCW2fkfEHh/QtT
	oGRzn3V6BVDX5mpoVteujTCIn0//vEcA67JSuNk5bP5BagC4HdAMMvJclPQYYok2q9Wwj8RGmFx
	ZcA8UucuJhe1zAg==
X-Received: from pfbhw14.prod.google.com ([2002:a05:6a00:890e:b0:82a:ff5:27d5])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:72a9:b0:39c:787:f196 with SMTP id adf61e73a8af0-39f2ee01ccamr522039637.16.1775169081896;
 Thu, 02 Apr 2026 15:31:21 -0700 (PDT)
Date: Thu,  2 Apr 2026 15:31:00 -0700
In-Reply-To: <20260402223108.650572-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260402223108.650572-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260402223108.650572-2-jmattson@google.com>
Subject: [PATCH 1/3] KVM: x86: Rename supports_cpuid_fault to supports_intel_cpuid_fault
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Clayton Pence <ctpence@google.com>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

The function, supports_cpuid_fault(), tests for guest support of Intel's
CPUID faulting feature. Rename the function to supports_intel_cpuid_fault()
for clarity.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/cpuid.h | 2 +-
 arch/x86/kvm/x86.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index 039b8e6f40ba..51cbe67c992a 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -181,7 +181,7 @@ static inline int guest_cpuid_stepping(struct kvm_vcpu *vcpu)
 	return x86_stepping(best->eax);
 }
 
-static inline bool supports_cpuid_fault(struct kvm_vcpu *vcpu)
+static inline bool supports_intel_cpuid_fault(struct kvm_vcpu *vcpu)
 {
 	return vcpu->arch.msr_platform_info & MSR_PLATFORM_INFO_CPUID_FAULT;
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0b5d48e75b65..9768f001011d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4264,7 +4264,7 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	case MSR_MISC_FEATURES_ENABLES:
 		if (data & ~MSR_MISC_FEATURES_ENABLES_CPUID_FAULT ||
 		    (data & MSR_MISC_FEATURES_ENABLES_CPUID_FAULT &&
-		     !supports_cpuid_fault(vcpu)))
+		     !supports_intel_cpuid_fault(vcpu)))
 			return 1;
 		vcpu->arch.msr_misc_features_enables = data;
 		break;
-- 
2.53.0.1213.gd9a14994de-goog

