Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264EF1096F
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 00:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778630514; cv=pass; b=EuyaFWWs+Dt/RN/8TGOrnguwagMD4jhjrXrc/daT7o5dEJ0iV1hoDI1l0pB3YNKX6QVuKm1SzIdXCFhqxQ3rkQ4zOHwpC3bK64x5Dnr6krcOpXi3vLtFPmSsRxvfEfyRVTpQcjjAOGOx22Kos6xTgZQerbvS3sopym1fa4UERrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778630514; c=relaxed/simple;
	bh=qMKdGqilmcz5qihTkNBxTqADyLgVYl3rc6ho+d2v3Fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVU0mdkdKDEuSBvsBYsfKYCsm0uwTLieTM8OvoW/yl0OQGPs4dhAvohNlHrysnnuQBaxzrLYbDQXoLTOQWD8Ty4ktYygTOZF9sukEzCNQiz8VH/gVlaIeM1Bm+O5pH4GYeR8MYki7tR2ORhVPSrmuGhSdI+jwmVqyFpFqnPht0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z78HjtQn; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z78HjtQn"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67c1eea6b4dso116a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 17:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778630512; cv=none;
        d=google.com; s=arc-20240605;
        b=B6Oj7m4N2ZK8bLlC3eLX+nyG1ITQJVyONZEuUb9snOgnVH+yZEAd9iNxWE6BYhKum+
         GGV2sjJVBIdSm8Q8WyvCfkCHGGgTAPj8usEbdiNc5+FIfMwaX+Md704moFGlPkj8p798
         CZviZ++/oGkL1S9YOWfuTSdCzKPkeXsT2feFzRpaeMrH3zrvTYRNp/VmJud0XACFCDPg
         JHzCm2eGaWM/t4jMFS+Iqedk9GlHcK+COv+6C7tCTyh4TPRWSJceiZMHfqtZXA8oLPxV
         PVe8QYulBsEKTnTaCru5F7FMGmYTVfxpob+IQgcbd9duCckVycQSJ7QGu+iZzWjI0C2H
         eCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qj83ar8FROyd4UpksW8Uf6mDTQ1HhWBShADjwu1KUNI=;
        fh=TLuIKYGEXhf03ShK9BqLdmj6rOwGUtlVCNJW13qlq9k=;
        b=OkhdAZ6cMnu2ovIjhgRTHjXvp9eg+xcIYYpFwLRfntkeb7hz/HiTt+vIkNnL7kKu8B
         Oeg4aosTcV5QxUhNxHR4yoLchYrQ8hawpgJUdVjbZns/mMzR6kSHJ5BMtk7sZUC8yHiY
         dixCC0L1/gxngwr8nHM189t85DkEPTMpLD0Ci9iYAB010UbqhqEIbVhT5rq+zZA0cjkn
         qlDIqPDIl88CAp3WqhqKXpFb16Dstlc+9p0SeFvRQpkKFor9waJ9WnQUOa+Da4/p0GKk
         +wGQKvYzFN6SLoQvDTgwHXLgZdPl4pDRgbH1s8tK7kWMUHAci5khgSVXQtJS1R/2zTo9
         Di6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778630512; x=1779235312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qj83ar8FROyd4UpksW8Uf6mDTQ1HhWBShADjwu1KUNI=;
        b=Z78HjtQnFA9i47d9lsLk/I0kmx0lWGtnFY9Hy+y5zDZbvzz4HfC1g65Q5vekqIezn9
         AJDOE5O//liC6y3MYJGCJ1bsXt+wi0220VJQIdiusl1M9iqzz6ql/96pvAQxtAxymDgs
         43VSQV5miEz95k9WwUUYNBbyBmkmHJYc7BYhkCsXF2UjPh3HXhAIRoQbh6aeIact4pzb
         c8vfk1V+Apo/YwVOyrRiZ1Uug9eslurLjBeAy0NYvcdV74WME8gxCpD76FSBJDN7YAoM
         wZbkz//8vsK2YfI8Q9lxLy8D2YSXm1CQ9TwbWsgQsiIpTOCDKQt4xaPHMALoOPNDM+Zh
         11dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778630512; x=1779235312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qj83ar8FROyd4UpksW8Uf6mDTQ1HhWBShADjwu1KUNI=;
        b=p72QINeJwsNNYwEPqLVbcvObebdph5vDNiazt8A1VI2o6fVlonkD4m0T4l5PCfnOmP
         M/7kshVWxFDve9v4HF3w+uwXQg4DyHjDavk6cwLzEWVqg26coOMJ5orWur/QmDxGI8UC
         0ndsEYmthg+F7a6ecmRDTjwudZmJnyJKbiBALZkYeHd4tHr+mcEBKdR5+XmQ1YmVJRRN
         aCSkODFGgy5ytmL9leTTgMMFZuWmoKi4RwXxZCcCHZksYbzvSyXOKIwESXS0GfuMiWt3
         PGWvvfge4AfcHMIZ2grRAZCcdy0ekXUv8QFsc9th1a9hdIhb0YrGGCMrA2DFPyjw/nfV
         ESxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9O9fbUruo4oJ4L/tqEfvuCdPfxm2QfP4IPihu8JATB8LoOpAy7WiyoeMaUXOodPgVCOAoVFT7ZKrrGacB73b8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7rkShg0iytCldvXm6MskIUXBWu0XewV+oMz7gfYK4ni0RVKA6
	zWcuV4hMROD/fREwUP9HT3Wd2sO4ACdXqOxAlTTVtmioRT7B5XjB8Pjw1/L+wKWEovgfrRpAihi
	rM+3g8tyfwy++MOicUIPcPHC6fjYQ2yuQNjLh+nZm
X-Gm-Gg: Acq92OFqsGZOvm6rLgnl06FkccKnan1hISn2KYJv0fciZMnmDGfEInESv5IsyCMCBvZ
	awzbcoRXiFZa/usoE3Pmd73pEHiztF3ZKSWT/yppf5yNvkAyMvlpZy2tE8rV68GuryhhiLwA9C6
	gE4+kf2RcqQKbIOsQWO+kBfqC7kwM8MRDVtp0e8xpBCHoGvRRDCIu6P+vXofUGxvFDblOf/WDkV
	ZhyAorxj6/hCQ4pmP0/4TNeIP6+iuNNVKugHg6nbFQWCDsLZ5e+RduHw0hLK9SDO76Ho9c+TEFn
	TvKYAGoYgv0lWF19cw==
X-Received: by 2002:a05:6402:a554:10b0:682:a2f:a15c with SMTP id
 4fb4d7f45d1cf-6827c43e148mr11375a12.11.1778630511249; Tue, 12 May 2026
 17:01:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508170714.489136-1-jmattson@google.com> <20260508170714.489136-3-jmattson@google.com>
 <agOcw9ZIXALKrs_a@google.com>
In-Reply-To: <agOcw9ZIXALKrs_a@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 12 May 2026 17:01:37 -0700
X-Gm-Features: AVHnY4K1zWwWI-fOvthYzhbwGvy3QYQSftynu7259msj2-psFwWf8hTG26Yrm_U
Message-ID: <CALMp9eRKcNpLxVBEg8RF6tSqndRFpLW_Q-rcXazPR9HYFJcdag@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] KVM: x86: Virtualize AMD CPUID faulting
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Clayton Pence <ctpence@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 2:33=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
> From: Sean Christopherson <seanjc@google.com>
> Date: Tue, 12 May 2026 14:20:47 -0700
> Subject: [PATCH 1/3] KVM: x86: Consolidate CPUID fault handling for emula=
tor
>  and interception logic
>
> Extract the logic for emulating CPUID faulting (where CPUID #GPs at CPL>0
> outside of SMM) into a dedicated helper and use the helper for both the
> full emulator and the intercepted-CPUID paths.
>
> Opportunistically drop kvm_require_cpl(), as kvm_require_cpl() was the on=
e
> and only user.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm_host.h |  1 -
>  arch/x86/kvm/cpuid.c            |  5 +++--
>  arch/x86/kvm/cpuid.h            |  8 ++++++++
>  arch/x86/kvm/emulate.c          |  6 +-----
>  arch/x86/kvm/kvm_emulate.h      |  1 +
>  arch/x86/kvm/x86.c              | 18 ++++++------------
>  6 files changed, 19 insertions(+), 20 deletions(-)
>
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_h=
ost.h
> index c470e40a00aa..a9005c61619b 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -2285,7 +2285,6 @@ void kvm_requeue_exception(struct kvm_vcpu *vcpu, u=
nsigned int nr,
>  void kvm_inject_page_fault(struct kvm_vcpu *vcpu, struct x86_exception *=
fault);
>  void kvm_inject_emulated_page_fault(struct kvm_vcpu *vcpu,
>                                     struct x86_exception *fault);
> -bool kvm_require_cpl(struct kvm_vcpu *vcpu, int required_cpl);
>  bool kvm_require_dr(struct kvm_vcpu *vcpu, int dr);
>
>  static inline int __kvm_irq_line_state(unsigned long *irq_state,
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index e69156b54cff..1c95d1fa3ead 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -2161,9 +2161,10 @@ int kvm_emulate_cpuid(struct kvm_vcpu *vcpu)
>  {
>         u32 eax, ebx, ecx, edx;
>
> -       if (!is_smm(vcpu) && cpuid_fault_enabled(vcpu) &&
> -           !kvm_require_cpl(vcpu, 0))
> +       if (!kvm_is_cpuid_allowed(vcpu)) {
> +               kvm_queue_exception_e(vcpu, GP_VECTOR, 0);
>                 return 1;
> +       }

That's so much better!

Will you drop this in when applying, or should I send a V3?
