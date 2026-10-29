Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793308757;
	b=gn6gLJ4MX90UAwCsiDtguSX0f4eQtwDytKSePEbv+5WIfjwwSuJ9GMABLcm/9911FmL1
	 TFfJ3m5gcrmYwNYvDXnn5qkC5FllQXEqAAEaf+U8JX76lAQZsAhP6zOPFu5KUUMxwhV1X
	 3O477AN1GBm5sYPt3stlDRl6MtjpCuPIadtad9CXFw7q7glcKqTr8a5tkAumPEaMozgkZ
	 mtoqUm+l5V457n9lMOgLBaOoJaUqKFfNR5l0SVJ3h9eFTd9ZFDAbgLBedu3v90UhcVppD
	 ZhF7syzCyDHnNVBKdNK/TpNfgKZyp+IjqH3BcUv7ZMKDSMEAHCmHy6FD9uiIIWkn9sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=XrOdXK5MJaZc6vQPZfGn1tZxemfMdTWyC26Qnw17Sz4=;
	b=vhcDe8beWB/QElDFwf8t6xX9amHNG6EddlmZgVs/7SMoRbAXSa84ILS0G2C5R83uTxtu
	 esV4hWVZ0qERYvxBhfmVoq/tJnTz3k0N6cLh8X7EXCYU47g9ZB4a7Sd2PfjlgXJb65GYC
	 HHRXz5L4DpHRT9L2y7nPJENu8ZWOaa2VGxprC5rxUcpH7lpi5eDT6x6ggm9S7e4EVxmDU
	 eoK/Vb7ApTtiXVfYBQ7R2Ja6MbywBs1zesCqdl//m+ak4NpDGdizzzpDWyNQ8totbVZ6w
	 3ExGYpw37nxd8TSux0bWBQfb8QHiwjeS/zRvUy1MsdPb0f9ECIGbOIphfVMdXGwxdmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T3a8whui;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81829606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 21:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81829606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T3a8whui
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so34343a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 14:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793308756; x=1793913556; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrOdXK5MJaZc6vQPZfGn1tZxemfMdTWyC26Qnw17Sz4=;
        b=T3a8whuihdDx7Y3dZu/J4WSUiyuHu9KemApWFzyeBszF2peBcDP0C4EVAQxN66wsxM
         f57YGcJyXwcqZYHYEcJyAuGT5gPucJgoGtBuFR4A5gDnw135fTcGfr5LQFFF5maUGKMY
         BYNp9IACZYfJfyMBXwCwAGv0voFPGfKsdLgYwn9J60/sYbfzsBQcXdD5+yhpq72eAtj8
         Bp+mdAMNzG18sJa2M60ABls83VarqTu9yyXxQReLWvZOWIZsHhQPLgus1oEi6RdQrgTL
         xGHdFiyJ4gR40o86k1jf3G5nS0x9aR8LftC+LdEG9O7dUx0UXCrpcIaR+Xpr7wvEZYSf
         BlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308756; x=1793913556;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrOdXK5MJaZc6vQPZfGn1tZxemfMdTWyC26Qnw17Sz4=;
        b=Z0tQibzh/AyC3qEf441FW/ResuJIjuWJEleh3OigB6FsAW8XoqZ85zRsacpXqa3Cws
         VNm7rKQpY6xEhkNwhn1gbXmujGo03lyn7ld02/x60XqzZobtODOHhG9tUPauGrK/Kcsl
         inXjVKtiut43XQLdgzc66M1Y+SitiaRjwezn1+bqJda6Bw6IU6UFlU3zcPeaPz5J4ZNH
         u84GwRQQPsE1ORrXFGJcxze4CGnAc6/ac5ybtYXHIqfqzY/JP8zBzm2nEdDSDVMhITpv
         GM+KLfYAtPsU8I084QlxeHYlr57b4i2vW1sWdBOySyBr7RsLpFlgU7ptyyvPWmp82TJp
         wxUQ==
X-Forwarded-Encrypted: i=1; AKwUvBz95y35bewF0OKbG1n6mKwB1yut1+iemNu1vHqm00+FKg2qcE9mEJT0Sk1RslhdHy/t3OebQb/l5OOlZg1i8sc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUl1DtrujqCBoQWTdcrw8Xg3jQB7qvNXX+4D+03xMmErLAa+Qt
	WJc4SGqmmT0/oMVjM5GHSDmqB7yAYxoVtuqNjXj5S7fLPXaRJKgiF2IPRVF6nGCfSvDGFs1Zop9
	ErFGvSA==
X-Received: from pgfd7-n1.prod.google.com ([2002:a05:6a02:6547:10b0:cc7:e6e5:e624])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cc8:b0:3a0:c276:1ec0
 with SMTP id 98e67ed59e1d1-3ae897f673emr156104a91.28.1793308755622; Thu, 29
 Oct 2026 14:19:15 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:19:14 -0700
In-Reply-To: <20261029202817.901145-1-jmattson@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029202817.901145-1-jmattson@google.com>
Message-ID: <auO4UueaV0mTVzzB@google.com>
Subject: Re: [PATCH 1/3] KVM: SVM: Check EFER.SVME before updating MSR_VM_CR
 on guest writes
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 29, 2026, Jim Mattson wrote:
> (Host- initiated writes are allowed to set any valid MSR_VM_CR bits.)

Eww.  Why?  If we allow this, then we'll end up with the mess where the guest
can't write back the current value (if userspace is being weird).  I get that
we want to avoid ordering issues, but there's *already* a required order here,
unless userspace ignores the failure from svm_set_vm_cr() and continues on.

KVM doesn't advertise the MSR as something to be saved/restored, and none of
QEMU, CHV, CrosVM, or our VMM appear to save/restore it.  So why make trouble
for ourselves?

> Fixes: 4a810181c8bc ("KVM: SVM: Implement emulation of vm_cr msr")
> Signed-off-by: Jim Mattson <jmattson@google.com>
> ---
>  arch/x86/kvm/svm/svm.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 136069dfcd44..3a0a507c94b2 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -3015,14 +3015,24 @@ static int svm_complete_emulated_msr(struct kvm_vcpu *vcpu, int err)
>  	return 1;
>  }
>  
> -static int svm_set_vm_cr(struct kvm_vcpu *vcpu, u64 data)
> +static int svm_set_vm_cr(struct kvm_vcpu *vcpu, struct msr_data *msr)
>  {
>  	struct vcpu_svm *svm = to_svm(vcpu);
> -	int svm_dis, chg_mask;
> +	u64 data = msr->data;
> +	int chg_mask;
>  
>  	if (data & ~SVM_VM_CR_VALID_MASK)
>  		return 1;
>  
> +	if (msr->host_initiated) {
> +		svm->nested.vm_cr_msr = data;
> +		return 0;
> +	}
> +
> +	/* check for svm_disable while efer.svme is set */
> +	if ((data & SVM_VM_CR_SVM_DIS_MASK) && (vcpu->arch.efer & EFER_SVME))
> +		return 1;
> +
>  	chg_mask = SVM_VM_CR_VALID_MASK;
>  
>  	if (svm->nested.vm_cr_msr & SVM_VM_CR_SVM_DIS_MASK)
> @@ -3031,12 +3041,6 @@ static int svm_set_vm_cr(struct kvm_vcpu *vcpu, u64 data)
>  	svm->nested.vm_cr_msr &= ~chg_mask;
>  	svm->nested.vm_cr_msr |= (data & chg_mask);
>  
> -	svm_dis = svm->nested.vm_cr_msr & SVM_VM_CR_SVM_DIS_MASK;
> -
> -	/* check for svm_disable while efer.svme is set */
> -	if (svm_dis && (vcpu->arch.efer & EFER_SVME))
> -		return 1;
> -
>  	return 0;
>  }
>  
> @@ -3262,7 +3266,7 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
>  		svm->nested.hsave_msr = data & PAGE_MASK;
>  		break;
>  	case MSR_VM_CR:
> -		return svm_set_vm_cr(vcpu, data);
> +		return svm_set_vm_cr(vcpu, msr);
>  	case MSR_VM_IGNNE:
>  		kvm_pr_unimpl_wrmsr(vcpu, ecx, data);
>  		break;
> -- 
> 2.56.0.317.g454f8302e1-goog
> 
