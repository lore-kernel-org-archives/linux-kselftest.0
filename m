Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0DF3C5833
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 21:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784928430; cv=none; b=FuF2myHczK4K6A+0MvyEtPOYdoSkQ13NB9p+jlGYK0pirnduUg0RtOTnxhdAoTYTVfxoKa5CvaT0GfIJ5lZyJ5Sto37xEcAs4oWj/Lcsz67DegvcAAOPNzZBYkDcs1nUkx3AuiHHGp8zT4e98G2Be+7cEWKdakWR0a56kcmHwTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784928430; c=relaxed/simple;
	bh=D3PNkQtPmb6l5zMVsFVcauzUKkiREG0O5tnOgegpxzU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RMvL/7e1ACD906SioM0zDcqHyxcesWeD5r1Sy3sv7LVJwbkvQoi9MhTKG5trkB5meMsw9js/IJb9g36suTQRT83okWBFg1NZYcS5a2H15N8SOfa/8pvtm6yGolo3oWJ01BNwXE1oGsRGsbSnW7aIMdIR/91ofWEGIUhXjEcnpYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PtnHQKHS; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PtnHQKHS"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf1c86963bso19220835ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 14:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784928429; x=1785533229; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2YqZmtuvGxd8cFmldbiTst55L0tz2Lc3p3TSw+Vcco=;
        b=PtnHQKHSud43fg4QuKADzecq1BguqyZSxZ4cMYKc8ZW98NjX1VEx6jnUpkIU1FYvTf
         jH3BDhZWtEmIuBforQxK5QJRDsAwq3w5dScIaE5OfD6BmPj5WajVqEy72p8FcslaJOlb
         EJiEtfupYdXhfnnhtTC5sR8M81tO53PQUhRugK6cvxIqd9P7owBXdGx8EltvtBpmLRLL
         vhaNrHRr7NFtPN2D3rvt1uqavnt0Nbap/qvnMMO6koeRS/XJhh+0I/0hMhVT6MZC2/XM
         jUHH+v2wdI6jb9LizsuPGyj8gxl05iWU7Yly1OiHqpzK5hVbrc1AM6QxUpGRTcAKDK2/
         B3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784928429; x=1785533229;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d2YqZmtuvGxd8cFmldbiTst55L0tz2Lc3p3TSw+Vcco=;
        b=Ek7JopoTXkVFaUl+yulKLVl0/QBYj+Xq17p/mdzyYEyxekRK4X5PFBD1MB6LVmmLs7
         TM65K2QzGF6ZpC5AaEpSGW1zYotLcP0kdyqMwcrR/49s4eJbQ3LwTal+u17xlySSAw64
         8EMYAB6vOcukeJRmr1QJf5/YupWec8LNX4Tu1NcW1XghxrsdHiGKCAgHjwTfvJBwAzR6
         JsYwsGAyyHiOni0AYaOGOagTiamR9A0FkXUqviI+WpmtIIa2DmGZyyt654zAZQ662oPn
         lVkP5qQUNRNRYG9jS9MgdMDGC/CzQOiykkOE1fvNfF3mtzCkDedDWl/UusilvZ6Mk8cA
         4trA==
X-Forwarded-Encrypted: i=1; AHgh+RoZDwxaWfPtOrgmEuYNCf3zZcnuUDXqNgJ7z3i7PrClkKSfs4Ipbourn3rNYxSWWXnsdFZrP0qErxi5yCyeVY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyU0HHe5eWY2zfZAJtGgprVE5kEm9YcVj7V7minecyAZd09oZg
	zEvTfelDHsLDgncTeEyoZ/QY83Ctso/fKksN6h7GNXQnfxzKbEiUHNKDW7/P+H42Y+yCicTuFdK
	GQiRBMg==
X-Received: from plbv14.prod.google.com ([2002:a17:903:44ce:b0:2ca:d6eb:2a36])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:440c:b0:2cf:41ba:96c2
 with SMTP id d9443c01a7336-2cfd795e2acmr17770105ad.12.1784928428452; Fri, 24
 Jul 2026 14:27:08 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:27:07 -0700
In-Reply-To: <20260703212145.343527-16-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-16-dwmw2@infradead.org>
Message-ID: <amPYq48J9TPbmFNl@google.com>
Subject: Re: [PATCH v6 15/36] KVM: x86: Fix compute_guest_tsc() to handle
 negative time deltas
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 03, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The compute_guest_tsc() function computes the guest TSC at a given
> kernel_ns timestamp. When the master clock reference point
> (master_kernel_ns) is earlier than vcpu->arch.this_tsc_nsec, the delta
> is negative. Since pvclock_scale_delta() takes a u64, the negative
> value wraps to a huge positive number, producing a wildly wrong result.
> 
> Handle negative deltas explicitly by negating the delta, scaling it,
> and subtracting from this_tsc_write.

Does this need 

  Cc: stable@vger.kernel.org

or is this a "technically a bug fix, but can't happen in practice" sort of thing?

> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/kvm/x86.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 376b8dc2ade9..55fb19fb7a88 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -2588,11 +2588,21 @@ static int kvm_set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz)
>  
>  static u64 compute_guest_tsc(struct kvm_vcpu *vcpu, s64 kernel_ns)
>  {
> -	u64 tsc = pvclock_scale_delta(kernel_ns-vcpu->arch.this_tsc_nsec,
> -				      vcpu->arch.virtual_tsc_mult,
> -				      vcpu->arch.virtual_tsc_shift);
> -	tsc += vcpu->arch.this_tsc_write;
> -	return tsc;
> +	s64 delta_ns = kernel_ns - vcpu->arch.this_tsc_nsec;
> +	u64 tsc;
> +
> +	/* Handle negative deltas gracefully (master clock ref may be earlier) */
> +	if (delta_ns < 0) {
> +		tsc = pvclock_scale_delta(-delta_ns,
> +					  vcpu->arch.virtual_tsc_mult,
> +					  vcpu->arch.virtual_tsc_shift);
> +		return vcpu->arch.this_tsc_write - tsc;
> +	}
> +
> +	tsc = pvclock_scale_delta(delta_ns,
> +				  vcpu->arch.virtual_tsc_mult,
> +				  vcpu->arch.virtual_tsc_shift);
> +	return vcpu->arch.this_tsc_write + tsc;

To cut down on the duplicate code, and IMO to make it easier to identify the
differences, how about this?

	s64 delta_ns = kernel_ns - vcpu->arch.this_tsc_nsec;
	u64 tsc;
	
	/* Handle negative deltas gracefully (master clock ref may be earlier) */
	tsc = pvclock_scale_delta(abs(-delta_ns),
				  vcpu->arch.virtual_tsc_mult,
				  vcpu->arch.virtual_tsc_shift);

	return vcpu->arch.this_tsc_write + (delta_ns >= 0 ? tsc : -tsc);
