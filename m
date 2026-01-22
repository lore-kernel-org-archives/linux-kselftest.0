Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850E735D5EE
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101009; cv=none; b=Ds0IhEbuZPkv4QjoZTvTW7SjJbfI+V8/TFGVJuYudRFwxTFLKMWLyxzJrf5zQx7jT/rC5fbdE7Gp53FtHto+6CbBEZbZ+a++EWABsLl0epWvFmXazHeYPzchNFj9fZnN/HBEa/mlW5iFTWx9W2crRJLWgJFdoL009OebjE4aIwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101009; c=relaxed/simple;
	bh=Yf+igg/0T/SpQYPavLQMecLpXEeSCNSZYUcGUDrvzCY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CV1paalT+Ei2D5mrzx2qobVMSeywx/nM7h+8Hm7M6Ybuj47MBEVvwv26f5jocp/8C3O78XO8uZ3AITrozNWJhNvpAw+ab8xOM98638Fyqq7SFwmQGSita6+Q4b7SAmA5lontvRncqOrscjHEPWvGduHYgJLELjVz6OLXIhmnHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oiwTiO4P; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oiwTiO4P"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34c5d203988so2090640a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 08:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769100997; x=1769705797; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+IiM9zxRKuZ+6sYf4z2FhEzx3BA+tRZU19IyCToaTCc=;
        b=oiwTiO4PbzdYKQxlU3BoDVMEUp2RymOy2wrZ8tKcNIjZxXC+tiAPsQ972SYK8Qjoht
         t26+kP7RBI5i+MmJVShlWeBFdipbsWwdz8To48ib/fE2iWls5PfPN0OvFz8QmV0mnYKL
         E9sFcvC8SOh4dwtUgQ4aBln3PcbRhtcNO8HERI29Winj+t9vAT6ioCS2FsL6xJIbC/vK
         Olc8jwry6UfMnmqMXozjccI5bL3sDt7xPwMdMMEum4YSyinVT+mARADqFlNa0yqLCmuS
         PzK1/Iqs++r2BmackYerl8BQlaVhGWE43ZWENd0bRDFxu/Tmvw/e40ywGkdLBu6hYerU
         n0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100997; x=1769705797;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IiM9zxRKuZ+6sYf4z2FhEzx3BA+tRZU19IyCToaTCc=;
        b=YxA3UNKccrpxwdp09/wOng5uxz24rbOpyBVwDOiIXVjXFDav4WTsT6EWte95763vln
         N9lIK4D0tGbqbD2i3XSUQRs4Evw6+ak5z5eU/cmnNcChPOnP1nywop4gQseAtxyyfbo9
         Lv6RPa5VEc/sp6fQBTgmBEJWTXfARg3cmyraMAPkmVhSdcUyTUiZq2ryEzAOFR86lHrn
         r+v5/3n/RAV/cuqwsw5sGSGXb7AZj9tD7PmhaEIv56074yaVbYvbRl84cYJguiAlrlMn
         EVL19stCHnr+vzz2E2DSLruvwnwGMsKkF3yMVZA4e1k1gqw5PD/OG30xePEWg7Cr6LHm
         D/Jg==
X-Forwarded-Encrypted: i=1; AJvYcCW3iC03ZkSbIJtenHF/gv4OsvXqDDdsvtbW7mHXuoYYkgj0XhSHMWvDaRCeTqx7F8hUyqT6k0CKpIj5RBO9wCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQFhGOIS9z9KoyrhcMTpvfEIhiFA88XzN7ScLHQni20BiBWqir
	HQ0xOMs8nItPqPM1zqLXD1vMfDS8SkGVXr9Z/XuDnQW+PdvZQbY5mIBKUsXreSPviWxh1Ig5D6W
	xkXR74A==
X-Received: from pjbmj3.prod.google.com ([2002:a17:90b:3683:b0:352:b687:3b20])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b07:b0:32e:38b0:15f4
 with SMTP id 98e67ed59e1d1-35367015637mr155901a91.7.1769100997358; Thu, 22
 Jan 2026 08:56:37 -0800 (PST)
Date: Thu, 22 Jan 2026 08:56:36 -0800
In-Reply-To: <20260121225438.3908422-6-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260121225438.3908422-1-jmattson@google.com> <20260121225438.3908422-6-jmattson@google.com>
Message-ID: <aXJWxIzxf8nLTPSB@google.com>
Subject: Re: [PATCH 5/6] KVM: x86/pmu: Allow HG_ONLY bits with nSVM and
 mediated PMU
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jan 21, 2026, Jim Mattson wrote:
> If the vCPU advertises SVM and uses the mediated PMU, allow the guest to
> set the Host-Only and Guest-Only bits in the event selector MSRs.
> 
> Signed-off-by: Jim Mattson <jmattson@google.com>
> ---
>  arch/x86/kvm/svm/pmu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
> index 85155d65fa38..a1eeb7b38219 100644
> --- a/arch/x86/kvm/svm/pmu.c
> +++ b/arch/x86/kvm/svm/pmu.c
> @@ -262,8 +262,13 @@ static void amd_pmu_refresh(struct kvm_vcpu *vcpu)
>  		pmu->global_status_rsvd = pmu->global_ctrl_rsvd;
>  	}
>  
> -	pmu->counter_bitmask[KVM_PMC_GP] = BIT_ULL(48) - 1;
>  	pmu->reserved_bits = 0xfffffff000280000ull;
> +	if (guest_cpu_cap_has(vcpu, X86_FEATURE_SVM) &&
> +	    kvm_vcpu_has_mediated_pmu(vcpu))
> +		/* Allow Host-Only and Guest-Only bits */

Meh, no comment needed if the macro is more descriptive.

> +		pmu->reserved_bits &= ~AMD64_EVENTSEL_HG_ONLY;
> +
> +	pmu->counter_bitmask[KVM_PMC_GP] = BIT_ULL(48) - 1;

Spurious code movement?

>  	pmu->raw_event_mask = AMD64_RAW_EVENT_MASK;
>  	/* not applicable to AMD; but clean them to prevent any fall out */
>  	pmu->counter_bitmask[KVM_PMC_FIXED] = 0;
> -- 
> 2.52.0.457.g6b5491de43-goog
> 
