Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0EE3803F1
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 21:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941938; cv=none; b=KskHvX7b5QeO8HJcgHkLHkK8nB2GE3tes8PQcB776ULYVgEMW5WBLOe7NxyPDdfmsloNObc/EMp4IoZH6hcxFKCBFfhRRcn1i63LzZjnNcBYizERv/Z4sMQEPQKwAjcZwoycywywTPVYOZQuzudW3vUM4hCY+FQWUKdTPI0pcrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941938; c=relaxed/simple;
	bh=s3SRCVocvxtBq/BBjpyMKtPRDxFAsPXDOITHXqUnO4o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jupPeUjviMjOgjJ1aGwLBJUHekiFDIugqMGbwGtP1lClDJMZLXOCkBPYccoO6Lm/O5oaUE/UADHVBZ28EcX797nsOSG0nhS3AzsHyJxCZ9I+o7yq2rOjOlrgoZh2jETXZgPSV9V1M6+KmzHIi7tcukMFDlvG2IuEg/RSuc0QEj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jYZHQ0FZ; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jYZHQ0FZ"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so794462a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782941937; x=1783546737; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GRkq9jmjNuS5m4BJgbbAEXZCpunnA1N0v1XvrStDBgY=;
        b=jYZHQ0FZXAGO1JEGSty/T2GCc1OXGTQApUcOJesNOIlH8l85iNchenlCCV/1DZdGoT
         ksIP9vNV78wNEvoOdkfuVCk6HMJpet5vE+JYsUm2vMRnZSVKK+VjR8H5InwAYOPHBbc1
         aaJNkmEDURJ64lc302othmdm5JZAy42dA9ZCFHGr9qu9CrPaRnRwtS3P9Atu6psHqXVV
         JrnvTWDS98Y8L0Ll9o+oukfL5b0Id9i/dljxhUWkxi5cia+UxSpSDi9ntkDAhZMITm4O
         WOAVy5C64JRZJT5tOn8mcx2DNNJSYvpif1Q3nkBbkuEKGWAOgnzxXw/pAWQrh3tafiBr
         L2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782941937; x=1783546737;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRkq9jmjNuS5m4BJgbbAEXZCpunnA1N0v1XvrStDBgY=;
        b=hMmGJioR9JntAZTnzyVTbYXFNsYmSHf97++H24EridmiemPM4z62qd4nVNH5ukOksv
         5Leo5AwUeqdQMCQ016dMjOFOha/EbB1qzDQb/gTD8Z3zshh9ZBpK9rL1nGsHx0qTqcHs
         QUAcxwFiFaM7Uzf2+iE5GsEopNCX7K986Nc926qbg+VTlO1JoZQyiQbSEv5BUyJ8n7Ae
         XketypFbX8TJeTbO6gconexzJHiuXJihF+BXQL1ErVpwhHaed0RT1gmvECaGBtunrbnW
         lFpSGlqDfZbY1D87z8OnzdnnkdPQw6qgWo27Aco+xfltXKWOI48mF9Xl8n3IDdKgINOt
         PJmQ==
X-Forwarded-Encrypted: i=1; AHgh+RosxH8iF7p5o3ETyziT1i3fglynMYXOiHpGWmvCLiWxzGfsoMyDrus/3Cw+hj3VnCinnaBAqW4zidnYpWTbwSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YydE/cM41k9OgQOQKIVR34gwf3+TLLj0RiFG7XTwIc/f0k/XF3n
	QRWzxP8/QRKu7uDDdlCs2s2gw0kJWVUosiq+dUjwAFry3glDpiLzsrtMtmWf9lAgznru/U/B5M4
	QmhQ9BA==
X-Received: from plbka15.prod.google.com ([2002:a17:903:334f:b0:2bd:9574:2958])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d2c2:b0:2c9:fa36:ab73
 with SMTP id d9443c01a7336-2ca7e6f0b6emr36500665ad.8.1782941936636; Wed, 01
 Jul 2026 14:38:56 -0700 (PDT)
Date: Wed, 1 Jul 2026 14:38:55 -0700
In-Reply-To: <20260608145455.89187-7-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260608145455.89187-1-dwmw2@infradead.org> <20260608145455.89187-7-dwmw2@infradead.org>
Message-ID: <akWI72WrPKy-PBqo@google.com>
Subject: Re: [PATCH v5 06/34] KVM: x86: Explicitly disable TSC scaling without CONSTANT_TSC
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

On Mon, Jun 08, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> KVM does make an attempt to cope with non-constant TSC, and has
> notifiers to handle host TSC frequency changes. However, it *only*
> adjusts the KVM clock, and doesn't adjust TSC frequency scaling when
> the host changes.
> 
> This is presumably because non-constant TSCs were fixed in hardware
> long before TSC scaling was implemented, so there should never be real
> CPUs which have TSC scaling but *not* CONSTANT_TSC.
> 
> Such a combination could potentially happen in some odd L1 nesting
> environment, but it isn't worth trying to support it. Just make the
> dependency explicit.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>  arch/x86/kvm/svm/svm.c | 3 ++-
>  arch/x86/kvm/vmx/vmx.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index e7fdd7a9c280..7817752533fe 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -5546,7 +5546,8 @@ static __init int svm_hardware_setup(void)
>  				     XFEATURE_MASK_BNDCSR);
>  
>  	if (tsc_scaling) {
> -		if (!boot_cpu_has(X86_FEATURE_TSCRATEMSR)) {
> +		if (!boot_cpu_has(X86_FEATURE_TSCRATEMSR) ||
> +		    !boot_cpu_has(X86_FEATURE_CONSTANT_TSC)) {
>  			tsc_scaling = false;
>  		} else {
>  			pr_info("TSC scaling supported\n");
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index a29896a9ef14..ed207cc7692d 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -8672,7 +8672,7 @@ __init int vmx_hardware_setup(void)
>  	if (!enable_apicv || !cpu_has_vmx_ipiv())
>  		enable_ipiv = false;
>  
> -	if (cpu_has_vmx_tsc_scaling())
> +	if (cpu_has_vmx_tsc_scaling() && boot_cpu_has(X86_FEATURE_CONSTANT_TSC))

We should clear SECONDARY_EXEC_TSC_SCALING in setup_vmcs_config().  Failure to
clear the vmcs_config bit will advertise the feature to L2 and allow it to be
enabled in vmcs12, but KVM will ultimately not honor the scaling in vmcs02:

	if (kvm_caps.has_tsc_control)
		vmcs_write64(TSC_MULTIPLIER, vcpu->arch.tsc_scaling_ratio);

This series kinda sorta gets there with "KVM: x86: Remove pvclock_gtod_data and
private timekeeping code", but that change looks misplaced?  And I think clearing
the bit this late will lead to false failures in vmx_check_processor_compat() due
to the golden config clearing the bit, but the local config having it set.


>  		kvm_caps.has_tsc_control = true;
>  
>  	kvm_caps.max_tsc_scaling_ratio = KVM_VMX_TSC_MULTIPLIER_MAX;
> -- 
> 2.54.0
> 
