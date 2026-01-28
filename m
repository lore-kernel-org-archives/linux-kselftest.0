Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A7C1531C1
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 23:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769643813; cv=pass; b=dFvWMxPa2BlkXfKvQg095Uv0moa+PC88h86RkiLM/j4hfaDYOD9HmdaF1rr0/L7Z1cKza2uIn/1WT9cO3HB6KtfdxCg95oc/Qgrvhn4fdH43Od0N4SV55PvFNYiiyjbFj+lwTNAAHNv0HOkb+73lw/zhYSW6h6womc28oet2D2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769643813; c=relaxed/simple;
	bh=3eKMB8/N0MTev+99HlBTlmZD4BLsN9uhauxq9iekQUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XYZQt46QlLqKNTBNXv34HEaPQSv3MpLg6Bd3plkOkrCDQ0/O1QzEOwDNeJRcrz2jV/s4VHmq+g7K0J9ltCCpRyLK01hcUnSratYVgrPvutD+5QZcC1KIoHHvTIFCBOSgvQ4Q0a4qCK6lQi/NYNwZZhHnZgHKKjTYUdPbAg1hho8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fN6DU6gp; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fN6DU6gp"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5033b0b6eabso96601cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 15:43:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769643811; cv=none;
        d=google.com; s=arc-20240605;
        b=lJEw3uJ6OY2TqQTZl+/tutMoYhKOCfGnx5BGn7eqLpBVkgBwlZpl4dRiRAcAJp1PT6
         cUaoL2B8SGKLqj7y86linL6wDKFwx34AB5E7V9SHDTmyLWOnvbN4Omea3Qtsx0/fdZRT
         4t5U9fwp2OayioBYdQRrDvHKfL4YC4tnhiW2TYayJn02GjAQMVxcKmqJgMZa71P86MmM
         5tkm8CTgBbIT0AbBKYRIq9WF7QlpPAWEpEQWanHciaKXBVpR1RpyzLeSyDZa1Naf9dW8
         opr4qXYheBLxA8RaUbor8wbb6KgMW7DKP6k+ST66NjGclqOfmlJEgW62IaL8l8k1L0hb
         7How==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cbg9Q5eQVZakHpCjsYsySo/U1zRKnpzshKoOs5i9/fo=;
        fh=sjO8y8iQe70qZUNfi6P9SJWpMzeCavbwUTQE7rJH8wo=;
        b=ioEhOECVBUr6qPWPLEZfbYipkT+9yapoXSIiay8s/VtcHlUUF3q2hxd1sK10s7j9+s
         Xc5+bwwwMjtTUuFrqSAYC0GssTfIzuTU7WaawB4IfF1SBqFnYB+XUnSxA+VfXPZUYx2l
         /D4ghwLDvyQgzMadzRKzpqmCf8VovMgxAn+yu+HUZyS9w468LzXq2corcXVdUQbdcVQD
         h33sAstjD0fgbu81hOk/p5tI6obX3skzlWHEd7HZrXABp0PaR3B8uouRb43tHkcXxKqc
         6tUxkpxtXx/nWwWVubdHQrAC2F/JlP2R2WlVQeTLNbItPSAFP1YKdmFi/oa1HsQibG+/
         7KsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769643811; x=1770248611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cbg9Q5eQVZakHpCjsYsySo/U1zRKnpzshKoOs5i9/fo=;
        b=fN6DU6gp2U3nktsx+h/gFgsRp0VKOYG0EKaGA3MvxbUh/RrPsHS51zNjT+52tbMv4m
         yxYwt/EPYPb2LnyVO4YDk/LRcly1tKbhCZC5qCLkaq7/cgwi64r5sM5U3gLip02DnukD
         RmVDQvIoaMHYc1u0frAdxEkAz3tNZGEnTb6nTSjTCX5QIqXcfoSFakLzPjbZ4MXdHYM2
         RRExj+lC9aQvts2u5Oyy4Ern+DWdmd//VeB2PlhPB9ZH10R3GFfbJROwmiIynAoYGo7V
         2Lt2Xr786ZXFcl8FfVExazmSDWE+h26vt7HthmtNpfLhrfy+rRERsvR4gxzJ1Y37vko1
         6oJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769643811; x=1770248611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cbg9Q5eQVZakHpCjsYsySo/U1zRKnpzshKoOs5i9/fo=;
        b=mqSoyRwnTGQGdWYIYpxauB+3Lb84Hj/HNyER4pxRdBGZXc6Dyi9twnWHNuLOEtgsWL
         9/B1gf9PxqNYF4LSe9pCImZtnBut2P1QDCWvH+WvUCmWzPTihakq61DNebZLqi2nZmnp
         hZ82rpW/EFGAT4b4HjX7mGjXHaIcvpruSTRx2oTlOtK99g5gYq8NlA6efWEQ/P+eb1eX
         aXGskhgeu29eFEHsoggipT/mkOQ/pMTpKdgbuuengODZwg19F5SgS2UW/GJcSgAZ/al5
         W8dPJHnnlpuXtB+Srwo2StX5acTDLXhxvduqLuiMmHvmPaZelXMA2dRYqJ0R2c1dsZOR
         iOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHXZGqC05+RSArx74GoVp9XE8cQWO+U80IQ0UAOW8Dit52/kIaVmqyd1fa4m4rv3Knjq4avpnrMY0Z4ex+sm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxgfB2wZTZbt6YCXq/8Espm0/wqP92PPl8LwYWZwwikpBkvwpS
	jjkQRN1mNIrekHMvVXQP/AdyZldrIKde37z3vsJemuNYscQwncPr2WszRoOv7mIkG1J1xMbUwes
	8q6Dx3qDdsznY481J58RUvE3IMV5bG4xWSpXB20Rc
X-Gm-Gg: AZuq6aL8dHGR8udtzo1SSgTsNXZBm1HzyP6yTE1BtcqWClMAZz7OYTDhCZgX47Vh/9g
	ZCZXv3sMMyqV6vJT+O/dtYGy6ZK8uS1Q5y8zq3UPjqSeWbkH/X6WX4qvpPxBdkz4fDM1abUUtEy
	q5y7ZoveKw+dKB2UZyLy9cEhs6WfaCcjtdqK610R5LdcOn4TOYa/skDhyKTSubQOtPLyG0XVNZC
	bn3jhW/Omy9OggSzumoWYG8+Zl6SM8rD/xI3tfbUWgMmd2hwxHE4fvzWawrW+ukzO6nQz4=
X-Received: by 2002:ac8:5845:0:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-503b670708bmr4368881cf.8.1769643810455; Wed, 28 Jan 2026
 15:43:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121225438.3908422-1-jmattson@google.com> <20260121225438.3908422-5-jmattson@google.com>
 <aXJWkIw0oSzOmxLS@google.com>
In-Reply-To: <aXJWkIw0oSzOmxLS@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Jan 2026 15:43:17 -0800
X-Gm-Features: AZwV_Qg3cPvdxu5JjE3L9etXDIim1laTDylrUrWKJZNk6kMLsMV9S1LQ51Qci3M
Message-ID: <CALMp9eSryGLaHfH0fWeQco1rTY57q=pskB5H50u2z4nxBuPqYA@mail.gmail.com>
Subject: Re: [PATCH 4/6] KVM: x86/pmu: [De]activate HG_ONLY PMCs at SVME
 changes and nested transitions
To: Sean Christopherson <seanjc@google.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 8:55=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Jan 21, 2026, Jim Mattson wrote:
> > diff --git a/arch/x86/include/asm/kvm-x86-pmu-ops.h b/arch/x86/include/=
asm/kvm-x86-pmu-ops.h
> > index f0aa6996811f..7b32796213a0 100644
> > --- a/arch/x86/include/asm/kvm-x86-pmu-ops.h
> > +++ b/arch/x86/include/asm/kvm-x86-pmu-ops.h
> > @@ -26,6 +26,7 @@ KVM_X86_PMU_OP_OPTIONAL(cleanup)
> >  KVM_X86_PMU_OP_OPTIONAL(write_global_ctrl)
> >  KVM_X86_PMU_OP(mediated_load)
> >  KVM_X86_PMU_OP(mediated_put)
> > +KVM_X86_PMU_OP_OPTIONAL(set_pmc_eventsel_hw_enable)
> >
> >  #undef KVM_X86_PMU_OP
> >  #undef KVM_X86_PMU_OP_OPTIONAL
> > diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> > index 833ee2ecd43f..1541c201285b 100644
> > --- a/arch/x86/kvm/pmu.c
> > +++ b/arch/x86/kvm/pmu.c
> > @@ -1142,6 +1142,13 @@ void kvm_pmu_branch_retired(struct kvm_vcpu *vcp=
u)
> >  }
> >  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_pmu_branch_retired);
> >
> > +void kvm_pmu_set_pmc_eventsel_hw_enable(struct kvm_vcpu *vcpu,
> > +                                    unsigned long *bitmap, bool enable=
)
> > +{
> > +     kvm_pmu_call(set_pmc_eventsel_hw_enable)(vcpu, bitmap, enable);
> > +}
> > +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_pmu_set_pmc_eventsel_hw_enable);
>
> Why bounce through a PMU op just to go from nested.c to pmu.c?  AFAICT, c=
ommon
> x86 code never calls kvm_pmu_set_pmc_eventsel_hw_enable(), just wire up c=
alls
> directly to amd_pmu_refresh_host_guest_eventsels().

It seemed that pmu.c deliberately didn't export anything. All accesses
were via virtual function table. But maybe that was just happenstance.
Should I create a separate pmu.h, or just throw the prototype into
svm.h?

> > @@ -1054,6 +1055,11 @@ int nested_svm_vmrun(struct kvm_vcpu *vcpu)
> >       if (enter_svm_guest_mode(vcpu, vmcb12_gpa, vmcb12, true))
> >               goto out_exit_err;
> >
> > +     kvm_pmu_set_pmc_eventsel_hw_enable(vcpu,
> > +             vcpu_to_pmu(vcpu)->pmc_hostonly, false);
> > +     kvm_pmu_set_pmc_eventsel_hw_enable(vcpu,
> > +             vcpu_to_pmu(vcpu)->pmc_guestonly, true);
> > +
> >       if (nested_svm_merge_msrpm(vcpu))
> >               goto out;
> >
> > @@ -1137,6 +1143,10 @@ int nested_svm_vmexit(struct vcpu_svm *svm)
> >
> >       /* Exit Guest-Mode */
> >       leave_guest_mode(vcpu);
> > +     kvm_pmu_set_pmc_eventsel_hw_enable(vcpu,
> > +             vcpu_to_pmu(vcpu)->pmc_hostonly, true);
> > +     kvm_pmu_set_pmc_eventsel_hw_enable(vcpu,
> > +             vcpu_to_pmu(vcpu)->pmc_guestonly, false);
> >       svm->nested.vmcb12_gpa =3D 0;
> >       WARN_ON_ONCE(svm->nested.nested_run_pending);
>
> I don't think these are the right places to hook.  Shouldn't KVM update t=
he
> event selectors on _all_ transitions, whether they're architectural or no=
t?  E.g.
> by wrapping {enter,leave}_guest_mode()?

You are so right! I will fix this in the next version.

> static void svm_enter_guest_mode(struct kvm_vcpu *vcpu)
> {
>         enter_guest_mode(vcpu);
>         amd_pmu_refresh_host_guest_eventsels(vcpu);
> }
>
> static void svm_leave_guest_mode(struct kvm_vcpu *vcpu)
> {
>         leave_guest_mode(vcpu);
>         amd_pmu_refresh_host_guest_eventsels(vcpu);
> }
