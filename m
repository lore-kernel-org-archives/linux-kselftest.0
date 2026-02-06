Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EC72D7DF2
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 18:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770402185; cv=none; b=nf/nqjiNxjUB9vAevJneWacZqo1aUW/f8cdvvFYxeOUqJ5uUMoMf1fCZ6eDDv4VWXjEztFgbO9y+tJvG7RBfeMkGnSrsfiQYAQ8entabde+/NUOnLgG3gA1XGflCcOvOjHg2ubVsgM9uiIbDXb37yoBaku6a2nCltw5U+gIDAMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770402185; c=relaxed/simple;
	bh=bWfisosvauXpNiB2JxliSmu7idKCf+SAbGX4CyflJNE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nk7ksO2vVLdcyzsZkLQMxlsTBW8uRhapzPGCxjVQeg7EKCUKKnZx/oLTezCE8msN0GQxQNzF03OC/sgBNF/3OQywySFyxspkDxoJIWC+BkZ66dBxNZW18mvinKAJ0kmOmBNjXxTKVp1Gnn9Dmr10zaWDiytuvEsfDzThZRoVdDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k+wEmk27; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k+wEmk27"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34e70e2e363so2310834a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 10:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770402185; x=1771006985; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N7ZkTvztciSiP7jae9vXXt3djU2YHid1DHOyalrGato=;
        b=k+wEmk27/WAfBtCGLv0x35upSviJbTMCe9DCSkoTd5gbK09acHTck/XHROFvLD7ilM
         946+VDIpTTRUURcL4sw95FLN5aKVfDba63xdwX8v40JudNURvesG4DzxM4PQkQ+C7m3F
         1ysTcCIPNnTtuOWwRgabUDG0a9yDDCscrCFqq2kj5VFwKG37WMrPbBt0HepHZueaWSe5
         XvPzOwKypGuYHMKw05anNbzHAZqzXT5zf/our/UstsYifHdlNuMOZfvIm/LIS9bd63ig
         jc3GyXe6WTP8wU3vS3DCb5Bc0jQBo1GZFZ5FUFk16cjFLG89st+ztOsVTSs/n2IiUryV
         SLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770402185; x=1771006985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7ZkTvztciSiP7jae9vXXt3djU2YHid1DHOyalrGato=;
        b=jKxXFX7Gtb8PtIye5mWl5ppVky3FCcxbhcjANt4gP4keNAgqr0hd/gNuVKuNgX9jlu
         jKwpQBROlMSe2vYikyjzLZmegaIbrq/k8WxCkXncIdkub39gJGorArSMCzYrWkleR1Si
         ngIuBXvgTWvwTDaYUywku1RgRLRh/v5afJ29vxM46c9d7OkxNlk8ZPqZFBKciaB10jgD
         KnF9j59of4IIqIFk82WI5/rfA6lyfH7kh0kAxjPBSuxvCftlN9f6rL9Qp1Q7mr1RCx/F
         cI2jnn86Vtl/W5ph0ipNJxrxsT71SxHX1nWwUk4ydS8e8WhcOCQ+e1zltTqJXR/jdFo9
         EQOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4oKhpOsnrr4AveO1/FSRDVw04qa/8RvmN1QofJSnpgzsdpwwXsgU51CVlbIg3zaPTYD61Z9fyJBLAPO1fYlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSiNPZFEPXbcg6fcWr/tS03c8VB4jZliUL6lF/Z/8Nvl5FNTqG
	/jHRfo2ajA1tkmrejmwYmt9iqmnzuJb8rxbiJ8vo3rAj1YlyDF6I7UV1+3XU2W47qU2Iuv+BiUC
	jFJrenQ==
X-Received: from pjbjs24.prod.google.com ([2002:a17:90b:1498:b0:34c:2797:7072])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d883:b0:340:e4fb:130b
 with SMTP id 98e67ed59e1d1-354b3be26camr2751196a91.14.1770402184623; Fri, 06
 Feb 2026 10:23:04 -0800 (PST)
Date: Fri, 6 Feb 2026 10:23:03 -0800
In-Reply-To: <20260205214326.1029278-4-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205214326.1029278-1-jmattson@google.com> <20260205214326.1029278-4-jmattson@google.com>
Message-ID: <aYYxh8EiLrBTiq0L@google.com>
Subject: Re: [PATCH v3 3/8] KVM: x86: nSVM: Set vmcb02.g_pat correctly for
 nested NPT
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 05, 2026, Jim Mattson wrote:
> When nested NPT is enabled in vmcb12, copy the (cached and validated)
> vmcb12 g_pat field to the guest PAT register. Under KVM, the guest PAT
> register lives in the vmcb02 g_pat field.
> 
> When NPT is enabled, but nested NPT is disabled, copy L1's IA32_PAT MSR to
> the vmcb02 g_pat field, since L2 shares the IA32_PAT MSR with L1.
> 
> When NPT is disabled, the vmcb02 g_pat field is ignored by hardware.

Uber nit, the "vmcb02" qualifier can be dropped, i.e.

  When NPT is disabled, the g_pat field is ignored by hardware.

Scoping it to vmcb02 makes it sound like there's a special rule about vmcb02.

> Fixes: 15038e147247 ("KVM: SVM: obey guest PAT")
> Signed-off-by: Jim Mattson <jmattson@google.com>
> ---
>  arch/x86/kvm/svm/nested.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 1d4ff6408b34..1ff2ede96094 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -646,9 +646,6 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm, struct vmcb *vmcb12
>  	struct vmcb *vmcb02 = svm->nested.vmcb02.ptr;
>  	struct kvm_vcpu *vcpu = &svm->vcpu;
>  
> -	nested_vmcb02_compute_g_pat(svm);
> -	vmcb_mark_dirty(vmcb02, VMCB_NPT);
> -
>  	/* Load the nested guest state */
>  	if (svm->nested.vmcb12_gpa != svm->nested.last_vmcb12_gpa) {
>  		new_vmcb12 = true;
> @@ -656,6 +653,19 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm, struct vmcb *vmcb12
>  		svm->nested.force_msr_bitmap_recalc = true;
>  	}
>  
> +	if (npt_enabled) {
> +		if (nested_npt_enabled(svm)) {
> +			if (unlikely(new_vmcb12 ||
> +				     vmcb_is_dirty(vmcb12, VMCB_NPT))) {
> +				vmcb02->save.g_pat = svm->nested.gpat;
> +				vmcb_mark_dirty(vmcb02, VMCB_NPT);
> +			}
> +		} else {
> +			vmcb02->save.g_pat = vcpu->arch.pat;
> +			vmcb_mark_dirty(vmcb02, VMCB_NPT);
> +		}
> +	}

To reduce indentation, how about this?  There's a consistency check for
nested_npt_enabled() vs. npt_enabled, so it's guaranteed to do the right thing.

	if (nested_npt_enabled(svm)) {
		if (unlikely(new_vmcb12 || vmcb_is_dirty(vmcb12, VMCB_NPT))) {
			vmcb02->save.g_pat = svm->nested.gpat;
			vmcb_mark_dirty(vmcb02, VMCB_NPT);
		}
	} else if (npt_enabled) {
		vmcb02->save.g_pat = vcpu->arch.pat;
		vmcb_mark_dirty(vmcb02, VMCB_NPT);
	}

> +
>  	if (unlikely(new_vmcb12 || vmcb_is_dirty(vmcb12, VMCB_SEG))) {
>  		vmcb02->save.es = vmcb12->save.es;
>  		vmcb02->save.cs = vmcb12->save.cs;
> -- 
> 2.53.0.rc2.204.g2597b5adb4-goog
> 
