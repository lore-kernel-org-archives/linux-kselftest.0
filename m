Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EB13A0E93
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 23:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775518058; cv=none; b=YUF6UxlBDp1vspnRTzHnjYEHgyHb5QZVa9bwbNJysquf1gVoDjfaGHQSFdobVghb0e8JW5WdNuWjPCgXaXr8rC2EqdQ0WMXIxvNM+SWGKjs8T79pD4tecfHeJ8JG2HrF6M1nuqI9hxmQAHi0lfTXqBQXda2hBQfVfrYXtru9QIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775518058; c=relaxed/simple;
	bh=FRR5sT0zQ8QWo/7kVJ3OR2zaSQRcCfEM05VHXvhpgd0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JPuV/os7VugWW4XViat0MLMM32F3se4cg/aNRZzukyVQlrny1N0NWv0EA8Fk3ZH3nY3et3HK4EHLd5K0z3q/LMNLGMzrn9inY8psBsSc25RfAtjoqqH2Larihv9FNBJRbFetd0vsTL+9p7IUCAVuD4QhhxfyXuZeDOmVg8HOhzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=own6LkFV; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="own6LkFV"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35d90c7ec5aso11284388a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 16:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775518055; x=1776122855; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SJTcZf1UujVpWDgwH0mVsCXrQUf/rG8HnnvzMBPDQG0=;
        b=own6LkFVesvJFlK7vi+GPOw5Ze5KKZm2S4UUv1RcZs7rS5qHute45kfpFDgMHWDGHK
         KpnkcHt8hnhQqFu1zXnPCIn2WBkFoqOD3m3AH/houTs+RxFnNh5+pO0g+OuqjNaSPhzT
         lsdHfuaEpvlpJU05Cq6AWJBeO0VeplTR63j2vG7OJUvsicwm3VR+jbI8E58DJadW4La6
         gYcgiTIHX1XdW9IIBFyEHbKiEZhV3M1eOhlGUd7XczaGo5ZMyXzjqUeL7dow8Qz34VE4
         cbKrr5l40tcfRtPPmecaTDVDbjHKAC34Ww4VaESMj/bKvLTUPmLHp1/6MrrMeaF42d3g
         da1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775518055; x=1776122855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJTcZf1UujVpWDgwH0mVsCXrQUf/rG8HnnvzMBPDQG0=;
        b=sxRjqxOzw4dyE7O50GdZRAEJrrButnI6Rlt+KKkmwoOvgC8C1g6L8gPT1UDLRc59+h
         mZKJfvAI3j/jhDYebHwFbgUA5P0JH7nzuIocwzTAvG4ESb1IfjAind1Ig5rqGeIk4XjS
         xlRP2eE6Vz9VbCRVhE6+j0DS32tBVQq6/5DeOleRij4y6spymCiz6hlOYgFEmS1kRZh6
         B/WndJNgmRtk/Kkm9VcglefPlhrCiRbCy2EKg8Ho66ABS/qi9m/UD0z2hniCZgegSpDS
         apPq8HNtAtUWqrR9Oy5Q4y2Sc9+kT5NXuuwJ+uxJ4YP64/ZF2QrCvpXqtl0HX3TusEVF
         sbsw==
X-Forwarded-Encrypted: i=1; AJvYcCWnmxIr33SRvzevFmVklKIcFSzB5GO/imVCnOu+l9Gt7RhLWqY8hjBmor/BLwjCMwd/zaE+huzKUewhB3A/DCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3S71MJxIc1TTbNZ1PNHdNyFcNrk3zSBmOxWzolpOY3F53taoF
	9Y5xBekzAMgp0Ug9I97LS6yg+QmkzgA0Pck2Mfv+YIG4FpPz82smyUEhmIzck1Hdh5RHtM47vbR
	diOK6mQ==
X-Received: from pjre2.prod.google.com ([2002:a17:90a:b382:b0:35d:a63e:32e9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d49:b0:35d:9927:e023
 with SMTP id 98e67ed59e1d1-35de67df8c1mr13530992a91.8.1775518055475; Mon, 06
 Apr 2026 16:27:35 -0700 (PDT)
Date: Mon, 6 Apr 2026 16:27:34 -0700
In-Reply-To: <20260327234023.2659476-2-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260327234023.2659476-1-jmattson@google.com> <20260327234023.2659476-2-jmattson@google.com>
Message-ID: <adRBZuqNlBozaDrK@google.com>
Subject: Re: [PATCH v7 1/9] KVM: x86: Define KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Mar 27, 2026, Jim Mattson wrote:
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index ff1e4b4dc998..74014110b550 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -616,6 +616,17 @@ static inline bool nested_npt_enabled(struct vcpu_svm *svm)
>  	return svm->nested.ctl.misc_ctl & SVM_MISC_ENABLE_NP;
>  }
>  
> +static inline bool l2_has_separate_pat(struct vcpu_svm *svm)

Take @vcpu instead of @svm.  All of the callers have a "vcpu", but not all have
a local "svm".  That will shorten the quirk check far enough to let it poke out.

> +{
> +	/*
> +	 * If KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled while a vCPU
> +	 * is running, the L2 IA32_PAT semantics for that vCPU are undefined.
> +	 */
> +	return nested_npt_enabled(svm) &&
> +		!kvm_check_has_quirk(svm->vcpu.kvm,
> +				     KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT);

Align indentation.  With the @svm => @vcpu change, this becomes:

	return nested_npt_enabled(to_svm(vcpu)) &&
	       !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT);

> +}
> +
>  static inline bool nested_vnmi_enabled(struct vcpu_svm *svm)
>  {
>  	return guest_cpu_cap_has(&svm->vcpu, X86_FEATURE_VNMI) &&
> -- 
> 2.53.0.1018.g2bb0e51243-goog
> 
