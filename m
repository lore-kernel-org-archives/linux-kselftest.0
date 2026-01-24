Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED9D1AA1D2
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Jan 2026 01:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769217001; cv=pass; b=TZCcqafHnc05NmsID1poOTq3yvYOeGHbQ7qVqg3NOfFOhIhgWKOjaNiTFaHb8s5K+lbkxp50baqaO8ADXugHhcq6478snn/dcThoP8QQjefn6z8hM87q6AkzJKy9DTl15eAAF0abaryCa6idUYhYznhm5MwwVm6UdQjJGimjA2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769217001; c=relaxed/simple;
	bh=ik36GtNfwR73DWLryLS0LVZwCrhyeVu3jU+pknIlVJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0depqyNPcPZSC9+kAUuYIhbpg7Vak8jJe6mgd0YcaQvMOJhgWZ+5Y4um0tgnbdqxk9bd2zjwMrrRD22lwRbOnkiNg9qD0Vd3DCEny7du390OcnNnBjgRLfSVx5lZM9nlF6/KbWuN3MJlwzEjAykM/p2tF5fG8HA3WZCh0TI0qM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h76QzGy3; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h76QzGy3"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-652fe3bf65aso1545a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 17:09:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769216998; cv=none;
        d=google.com; s=arc-20240605;
        b=O1+7jw4wrHtOlkrbTPBX9P7ulUz2vU6vPLWFIHgS9QAk9kXt1SqcebH+H7oPDOH1Wv
         A7/5C+c5JPoENWWK7GS/cbPYb60cweBX+3heKSv0pmnug3TQ5OKssbfQE7Q4goV9xRUq
         0eH0PksHf7LYpSqMyZb9LOG+4UFxbF8iRWbIG7gFbheOYLMe09+ZSa32bTHP6FmkK+53
         2abjnqEFvSNXRBoSw/QKKoJumigvA0gG3g23vTrBlfciUxNN0EClnLw8H9lAfuKcYiwt
         db14GkhnoHCQC+eehZqrGRdo0hM+aFyaDlMkkfBcId6z71nFlxxyyUeSVwx048IVh/Mv
         tcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4EFvfBCWbL1lQgpc/+fXouK4fB7VqTYve4/x//+dWzE=;
        fh=JZ1cM/9Q/JtYallZ4vPl0+vgMly+JxN8xlo9QMRT+JE=;
        b=je+WnJSajLlPiD2o3YRGODehdRK82b5s4N7RJCzu738nPYGXSgJti3LWwSmQBymwEh
         iliXHPPwULJuC9zLRnTduvbKb0hCYX2HlgglCVtChg02rJ2JXH5OZiCruYW5HnujS/zu
         IaO7Ej9+dRdjLVzCizoknZ/5eBUo50jU1WiZb6338EeCf4JkBOIgEvBHGaX8j/kfPteT
         DPv1mzUR+Apu3kwFnno5tOczopDlkpCUqI+BZyDLiBOrwa8t1FcglTC9etRUjnI8X0lF
         LHWsXTituqJCAnjlPsUF6/Ml+WYGJa/9bhoqHGc4SNx4Hsb5MgMwqGt7Yza6CY0x7exE
         GAEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769216998; x=1769821798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EFvfBCWbL1lQgpc/+fXouK4fB7VqTYve4/x//+dWzE=;
        b=h76QzGy3t1OJZLasGyM/4jMNq8Dck99KVeDz7NEIR1e9EG147UflQLGyuktTb18NJM
         KQuM4Rg9FyuQJ8afFQ6yrSaa3262hPh6ZEp8VI9gyJC05O4Lkn8AV6GT7XDp9+d9IMNi
         nn70OEeI0Vb5DpfcHIrT6SF/n+2ebK/WEkjVv4Dz0J4FYsGrdABvrHg1ysNN+g9h7EcL
         4dKD8ZFFymPCznT0ycoi+kpknwQGF3SUwXPx4f7T8n18zwtzYcAOevMBGXZv5ZP7QsrI
         213voPJ8CThXb5auKZ4vdszW7AjCLx3622Vhfs+rJsfPpN5pdcaTQSNYaI5Z1KXJC/M1
         NVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769216998; x=1769821798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4EFvfBCWbL1lQgpc/+fXouK4fB7VqTYve4/x//+dWzE=;
        b=k0Z8BE5I+/h0fIF/4awhxF5d5wfr7UqUkb22eVI7Hsc+A01oSL9reJMsbylHyy959C
         utxetbT6zBNBvqiiOI3ujD5h/ifG3ONKZO+v3rqTSccCVSbgf0seUkcrBWiAOTzzylC4
         K4cYO8O8c5VIelu7gnArOa72nl+zgCiRYCjkBg5wPtJjfaBbb0jSE5+R0rNq8PI1NcfO
         IChZiOOHGWAukC4LcdZcy33hQrbNpq8rarGjgxref4qT+mN9yyyE/ejJnRc1yeiFbv1n
         6t1J5ODa9RqmsKFZGazNMfh5LxaLuHKGazci9IoqDj4RRi9W9UAvuxxn1iHxJfczX1Xl
         NqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNzzQ7BFqcAZJtFQibC0ur1CsTnXBmSPNoi3kAdB8n5z14WkF+H4KvDvyY+2+eYPvRGMSYQhCVJusgIEz3Sk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFDRGAiHaAQJta81tNy/XPR5sf1X11mgWO1F/slD35ZF8QxBcZ
	aTKfuXLeJzlEXrhbpQe57GVt2tp+SlB0eMfQAqaNwq6a+5bKLCY6zwyHRYfxxLltT6jWsvRcS4p
	OwbAXn86a+WN3sqmmfb3SSb7em0XraRqtv+QuRpqj
X-Gm-Gg: AZuq6aLVxNwYLxjJtRhQ5TFl6Pngm/gFkIvtr/7h7ct1JL+hCGNOv+TCEiY/4dnbdXT
	PJI12ZBjYMC7bt8J0ujQrtpFwKC4CcsqNiOUAzxWZ9Ppo1HBMFZ4E0FMFhmWLmEVh562unlneLO
	SaebIpnGY8yBr1AFd9KMoTe7TC595co/KaaVRJxA7i83mbNduZX4969g4qxFdhvZ6gkpOAjwmZl
	Z/rJKel9lxkUVJp4t1r2fFRG/+U54YhmcJBRDfd8h/Oy5c8iVzZiT7LsEfSjsSLa4MV6DYF3Z71
	hf/IPg==
X-Received: by 2002:a05:6402:5356:10b0:658:ec8:ea96 with SMTP id
 4fb4d7f45d1cf-6585d65e4b8mr16080a12.12.1769216998384; Fri, 23 Jan 2026
 17:09:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121225438.3908422-1-jmattson@google.com> <20260121225438.3908422-4-jmattson@google.com>
 <aXJVKFs54eVI1Mjo@google.com>
In-Reply-To: <aXJVKFs54eVI1Mjo@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 23 Jan 2026 17:09:46 -0800
X-Gm-Features: AZwV_QihxGhmlb0R1pQUUg5REU3nZJkQnS8K32xs5XyEnk2F66ZdZyLEPHxipk4
Message-ID: <CALMp9eSTzEZSUAF2hXQ17RqviAA2gWbnxEEzscxA3OuvqLDjVg@mail.gmail.com>
Subject: Re: [PATCH 3/6] KVM: x86/pmu: Track enabled AMD PMCs with Host-Only
 xor Guest-Only bits set
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

On Thu, Jan 22, 2026 at 8:49=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Jan 21, 2026, Jim Mattson wrote:
> > Add pmc_hostonly and pmc_guestonly bitmaps to struct kvm_pmu to track w=
hich
> > guest-enabled performance counters have just one of the Host-Only and
> > Guest-Only event selector bits set. PMCs that are disabled, have neithe=
r
> > HG_ONLY bit set, or have both HG_ONLY bits set are not tracked, because
> > they don't require special handling at vCPU state transitions.
>
> Why bother with bitmaps?  The bitmaps are basically just eliding the chec=
ks in
> amd_pmc_is_active() (my name), and those checks are super fast compared t=
o
> emulating transitions between L1 and L2.
>
> Can't we simply do:
>
>   void amd_pmu_refresh_host_guest_eventsels(struct kvm_vcpu *vcpu)
>   {
>         struct kvm_pmu *pmu =3D vcpu_to_pmu(vcpu);
>         struct kvm_pmc *pmc;
>         int i;
>
>         kvm_for_each_pmc(pmu, pmc, i, pmu->all_valid_pmc_idx)
>                 amd_pmu_set_eventsel_hw(pmc);
>
>   }
>
> And then call that helper on all transitions?
>
> > +static void amd_pmu_update_hg_bitmaps(struct kvm_pmc *pmc)
> > +{
> > +     struct kvm_pmu *pmu =3D pmc_to_pmu(pmc);
> > +     u64 eventsel =3D pmc->eventsel;
> > +
> > +     if (!(eventsel & ARCH_PERFMON_EVENTSEL_ENABLE)) {
> > +             bitmap_clear(pmu->pmc_hostonly, pmc->idx, 1);
> > +             bitmap_clear(pmu->pmc_guestonly, pmc->idx, 1);
> > +             return;
> > +     }
> > +
> > +     switch (eventsel & AMD64_EVENTSEL_HG_ONLY) {
> > +     case AMD64_EVENTSEL_HOSTONLY:
> > +             bitmap_set(pmu->pmc_hostonly, pmc->idx, 1);
> > +             bitmap_clear(pmu->pmc_guestonly, pmc->idx, 1);
> > +             break;
> > +     case AMD64_EVENTSEL_GUESTONLY:
> > +             bitmap_clear(pmu->pmc_hostonly, pmc->idx, 1);
> > +             bitmap_set(pmu->pmc_guestonly, pmc->idx, 1);
> > +             break;
> > +     default:
> > +             bitmap_clear(pmu->pmc_hostonly, pmc->idx, 1);
> > +             bitmap_clear(pmu->pmc_guestonly, pmc->idx, 1);
> > +             break;
> > +     }
> > +}
> > +
> >  static bool amd_pmu_dormant_hg_event(struct kvm_pmc *pmc)
> >  {
> >       u64 hg_only =3D pmc->eventsel & AMD64_EVENTSEL_HG_ONLY;
> > @@ -196,6 +223,7 @@ static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, s=
truct msr_data *msr_info)
> >               if (data !=3D pmc->eventsel) {
> >                       pmc->eventsel =3D data;
> >                       amd_pmu_set_eventsel_hw(pmc);
> > +                     amd_pmu_update_hg_bitmaps(pmc);
>
> If we're going to bother adding amd_pmu_set_eventsel_hw(), and not reuse =
it as
> suggested above, then it amd_pmu_set_eventsel_hw() should be renamed to j=
ust
> amd_pmu_set_eventsel() and it should be the one configuring the bitmaps. =
 Because
> KVM should never write to an eventsel without updating the bitmaps.  That=
 would
> also better capture the relationship between the bitmaps and eventsel_hw,=
 e.g.
>
>         pmc->eventsel_hw =3D (pmc->eventsel & ~AMD64_EVENTSEL_HOSTONLY) |
>                            AMD64_EVENTSEL_GUESTONLY;
>
>         if (!amd_pmc_is_active(pmc))
>                 pmc->eventsel_hw &=3D ~ARCH_PERFMON_EVENTSEL_ENABLE;
>
>         /*
>          * Update the host/guest bitmaps used to reconfigure eventsel_hw =
on
>          * transitions to/from an L2 guest, so that KVM can quickly refre=
sh
>          * the event selectors programmed into hardware, e.g. without hav=
ing
>          * to
>          */
>         if (!(eventsel & ARCH_PERFMON_EVENTSEL_ENABLE)) {
>                 bitmap_clear(pmu->pmc_hostonly, pmc->idx, 1);
>                 bitmap_clear(pmu->pmc_guestonly, pmc->idx, 1);
>                 return;
>         }
>
>         switch (eventsel & AMD64_EVENTSEL_HG_ONLY) {
>         case AMD64_EVENTSEL_HOSTONLY:
>                 bitmap_set(pmu->pmc_hostonly, pmc->idx, 1);
>                 bitmap_clear(pmu->pmc_guestonly, pmc->idx, 1);
>                 break;
>         case AMD64_EVENTSEL_GUESTONLY:
>                 bitmap_clear(pmu->pmc_hostonly, pmc->idx, 1);
>                 bitmap_set(pmu->pmc_guestonly, pmc->idx, 1);
>                 break;
>         default:
>                 bitmap_clear(pmu->pmc_hostonly, pmc->idx, 1);
>                 bitmap_clear(pmu->pmc_guestonly, pmc->idx, 1);
>                 break;
>         }
>
> But I still don't see any point in the bitmaps.

No problem. I will drop them in the next version.
