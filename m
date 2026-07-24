Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41CB446C17
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 21:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784927414; cv=none; b=YLfi+UTMIYW4d35WfHOK1JL5grioHITPbMVkA1kFFbGZklCyNhlEzVt8POPdN9CoBGED3yjNb4w07pZyAr+B2vPv6wD7zwSf7yjtnRrueTvu8n9lLe7vzyUcIXFifodaaIRSXBDix1Kq1twIlUCCGbZWLaTr6c/1uAlwEEx3D1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784927414; c=relaxed/simple;
	bh=TYtG7OzLw9fOqIZQN9VW86vPlkmDMaC9bn1DBPL/sf8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=phVuD54c+fqX1Mn+IsGGwYR7xBPy6gTtCpl/mj+eVzBLw45LLYHyhNHouWNq/k8Q0F57T4OZIS3fWEc2RuF4kaQte2UM2+PzeIy4ro37AaUwSswvximhwRcqr6Sj9yDMN1mAdaFABFomGGlzGxd1zsetI+akGEd+ujoCCTq1iqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IXk9pkhh; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IXk9pkhh"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84842381150so1291708b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 14:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784927411; x=1785532211; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTReVzCNP0fxj6IgppN49ZsfvNVcyjFJjPGB1HCtc6w=;
        b=IXk9pkhhAqQ9tt/ZLCTCihwzv0v5ZMiHAtQEQRhmJmxuHdUdQdufLhiVecA+0zRqtB
         KxG4ZG9i9pIWKWt8CJHx3V0ARvB5LLqBs179po9XogDTjwUJvlWqSgw52Mjoz7ct3kqj
         dTKU21KNVVdg+Qtq1wHNNdwnBx4qu1CUbGcj4P0wEQpN9g2V2wqMfEa6zZ3bUCt03t9x
         PIQctKjMWVl32kV3toCBovo0R+wvBQ82aFv8hbJ67WnSholFHTxNHYbwDSZ9QrBQ56XW
         JLwzRAG9ChS+IVYob4DDimvN2I23F9kjT71lc37Uotmt3U9vZO1e+YeZ1Ouka/R62uQX
         49eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784927411; x=1785532211;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTReVzCNP0fxj6IgppN49ZsfvNVcyjFJjPGB1HCtc6w=;
        b=gcIJF6nQ3GBp5WwcBhzkXiVclKcrkZZlo5gx/KVlzSzNavhteE7b0j9UH92w5qEVhX
         mb6Nw1g9+S+TIFCtTWsUOYdW+jrf82pZivgMTeEOQUV9nNJkJ9h26txSeQGoYtkYbcTO
         EBWnd2C2hOmYOc5gfueBbMX339tTF/59RVPmH1ycP+qNR4Wi4LKY+B+BVrY1IOqGHjkT
         JLUWcaPF/9eqlU0+LMXhuNaWokx5xCYEPohCD3EvYZGmgMLbhfnrUEIOs2sQ+Qu7EBCZ
         lMJ0xHyt33eIHHqvV3y2F0g0YPCZJLT9EFymCfoo9aPTMthtOYnPfbLwuF0zTIzQpHub
         /sjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkqQnCbPGMFyNio2sxePtSX276SuL7E9wzIlAEq5m9xiKDSBW/wXL1RRHC/cN/n5nWc0+6I4FWuBVX0hY4QoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlCJXKkqErOT2wB93SmUx6hgx/WwMeMEQrt4MEoPV2ornDwbmL
	K8/CjNhfw8ybdA1icyG5B0e1b9QFN4YCKLWUf36gO0OqVrB3qodEf7qiIOkqRr1HuRFpN3c3xRX
	0TjOSsQ==
X-Received: from pfoc20.prod.google.com ([2002:aa7:8814:0:b0:84e:1951:8efd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a20f:b0:84e:17ef:5460
 with SMTP id d2e1a72fcca58-84e2bb396bbmr9852497b3a.40.1784927410740; Fri, 24
 Jul 2026 14:10:10 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:10:10 -0700
In-Reply-To: <20260703212145.343527-3-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-3-dwmw2@infradead.org>
Message-ID: <amPUsqRiVUsC4tuS@google.com>
Subject: Re: [PATCH v6 02/36] KVM: x86: Improve accuracy of KVM clock when TSC
 scaling is in force
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
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index f14009f25a3b..b2446c04a076 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -950,7 +950,7 @@ struct kvm_vcpu_arch {
>  	gpa_t time;
>  	s8  pvclock_tsc_shift;
>  	u32 pvclock_tsc_mul;
> -	unsigned int hw_tsc_khz;
> +	u64 hw_tsc_hz;
>  	struct gfn_to_pfn_cache pv_time;
>  	/* set guest stopped flag in pvclock flags field */
>  	bool pvclock_set_guest_stopped_request;
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index e69156b54cff..621d950ec692 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -2131,7 +2131,7 @@ bool kvm_cpuid(struct kvm_vcpu *vcpu, u32 *eax, u32 *ebx,
>  				*ecx = vcpu->arch.pvclock_tsc_mul;
>  				*edx = vcpu->arch.pvclock_tsc_shift;
>  			} else if (index == 2) {
> -				*eax = vcpu->arch.hw_tsc_khz;
> +				*eax = div_u64(vcpu->arch.hw_tsc_hz, 1000);

Kinda silly, but s/1000/HZ_PER_KHZ.

>  			}
>  		}
>  	} else {
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 0550359ed798..dbcff49cd561 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -3314,7 +3314,8 @@ static void kvm_setup_guest_pvclock(struct pvclock_vcpu_time_info *ref_hv_clock,
>  int kvm_guest_time_update(struct kvm_vcpu *v)
>  {
>  	struct pvclock_vcpu_time_info hv_clock = {};
> -	unsigned long flags, tgt_tsc_khz;
> +	unsigned long flags;
> +	u64 tgt_tsc_hz;
>  	unsigned seq;
>  	struct kvm_vcpu_arch *vcpu = &v->arch;
>  	struct kvm_arch *ka = &v->kvm->arch;
> @@ -3340,8 +3341,8 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
>  
>  	/* Keep irq disabled to prevent changes to the clock */
>  	local_irq_save(flags);
> -	tgt_tsc_khz = get_cpu_tsc_khz();
> -	if (unlikely(tgt_tsc_khz == 0)) {
> +	tgt_tsc_hz = (u64)get_cpu_tsc_khz() * 1000;

Here too.
