Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF14C3A7F5D
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 22:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769122072; cv=pass; b=J0Abo9OJ7KAO2a3qLlf354xzAgGl7rUZE/a8Mg0/lEw10nQqYrFSld0qUt+oo66GE1WLL39DG3NI+tuGH/yckWNU0BmkEtE6PDBtTZe4++7Wdfnj6MWt9K/hmKPOZPz1gkUiFJmihVJiPSyC3xkB8ukgVLQpgND9PFZ0p90YU9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769122072; c=relaxed/simple;
	bh=TND/Si/DRcSfUhMVT1qeEyIBuM6pXmd6mhIdRalzdww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OThObFJXeLR4C/k/lOiPpq7abPGT1ZlO5Y7KYKSCaAi8EpYzbttYWIdO7bbCsRUcA9YfoutYAkAjna/if6/W1VQ6DIzzQiZJEA/I4V3gvOwRS6Y0cCkwNuNm6kjQ3/5QMbsrv/6c+fQzuNGlkvJfYJajJN2jDZujFEeOt2V9qP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oTc4FjNs; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oTc4FjNs"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6581551aa88so5135a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 14:47:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769122057; cv=none;
        d=google.com; s=arc-20240605;
        b=DkrUMKqQqqtAIehFAexWyATthOZGOTGvdDRbYZDmR7OY/oHrlTaZGArHzEVNCOM+AA
         YgXrKiHY885YFJ65Kf66oyV/T6cwYbitVx7ittrU9PSL/ppmEEF440SmjEtBWOf4JYJZ
         wCXXXpFBSLdH/NpFjNL0jcF5mQCn02H/7pPdovnq3tWfcE5ObeN4mgT4O8jSdunnfzsn
         IqB5nLU5VbUp6AT82TwKAD8R3umd//CukSxhZrPHihTARrtwkxAD5kF5j7Hs145VVRgh
         QYagir9OmsartI0lSzfUV5wq3UGQHLI6XIvEzyfQgawAMXE1hVUIul2J5RTfKlqwbMhx
         hiVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=73p/P7bLELYiLT0M410lIGTK80iJQLNo9oAfsXMKpaQ=;
        fh=TdrqZl5BpvM5el1nI8lLLLqm4cgYLnoOjBHkJ1BYc6U=;
        b=CyoR/6b4VraTNrJX7R3yiRT4bH5BDv0g0Q70dAzJeyqdSpFLt7qtFz0FAEv2WKyPwW
         mODTdBuIRu0Zn3oMgLUaxDNXyCuB9ot4Tx8d2Upaa/judnSSyKkMyRQixQzr4am3x6TG
         caSCVm3UZFL3aiNwahYakIg6ik5dzwBxeMOA+rF21JSxzBwceSTSpDUjhsAv1U/u604M
         WBjXtEnZ757v8c26t+5vWeZw3kAE24hRyXZ+dbLKxyWRhqWrwC6LtONtQOizmKJJTMug
         XX6k8MpuUNBAlNa5RJM+NdtTXDNH87PklmrlzY5yMks73H+vzCOF3RiKQKcr8oUz2hWv
         4lmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769122057; x=1769726857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73p/P7bLELYiLT0M410lIGTK80iJQLNo9oAfsXMKpaQ=;
        b=oTc4FjNsVXElVl6/m5w70zuzsF/zfCyadF3V/eeM2FNDZHKfjCq8gScaWvQDvnCq3y
         XfnA+qNAljNJrdyDS8EQDu5VO8ZrP9FwhhwYb94lxU+hEyhbnlvRqrPK1n8fydaqIaWx
         fmDAigGuNYm26BgIMB4cT5k6Cj2V2SMjKwghDE8NA7hDkPXahHklom8zthGgtAoF3plZ
         Ac7tcIWpayyQqJ8aZpecrdmD2vxBAt5n4/ep7CrXYMs2iSB2Dj8gGsBMgFPnbavc67+d
         IvEVD2udYxbeDP8D3P9Z1Z2PymoC2zgyZxIIlxBMWAUfvN2kSH0opbH/GKNPAgVz677Q
         lu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769122057; x=1769726857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=73p/P7bLELYiLT0M410lIGTK80iJQLNo9oAfsXMKpaQ=;
        b=MD35byIJTtpAx9b7RHoCs5ts5oTBMlKI+Qgco2WntUzi0MCdbU0mofMpfwe+ddIGUs
         2q++haxwDaLOGjmgP27i06g1E9TE7MMNXTfYJ7HSkcrCMJBsUgrWBxgPPbLO1BU6hoyd
         lQ2dXcMF8F7x38qcY5HFbqU6h9r8n0/vyGCYo9U9RQgtT40LjSgqWsFM/iuYM21OhpmZ
         4vUNSo3/aWHhavNUYV/O2STJcsaHLlYqVuOigjfkQrTOedYG3x8CKjLraouujyV7GXkb
         2jC3mzZw24+ycktYUh4URlxTf0yewjVZUBQO5YO68P+Dh7klSLT8YqIRo0iYzFDFDBZV
         ek7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQMyr/H17OoVaRfp0LLc9jchAY4+exIorGOmN0K4+I+mq3n82+7umfykE4ig6Ljyg6UJD9h6JvcsDl8DLMySc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAJqT3qm6TdNyWN3tHR3/akTuHo39iuP5wmpQQjyDgtke0q5b9
	EzBbIo8HL3ZxwYjy/3rV/ZAfU15JrqEX7tsfgcQch1UpMHME8F9OpmvoAU4wgw18Gr/Lb/1Vy9y
	it6JPVvkUP8RyVLkwI89do/Og0XTOBO5NE1V9JYbt
X-Gm-Gg: AZuq6aJFtnfx+yzwz3Ov7R2UPryVU99ezb9sMTjuGBk/MUfDZsn4OSwD0xEKONnILFl
	s7UNiw9AHRGHyco9cDGcTKrcBrawqTC+2lFq8ncqXZiTqX4+tYAbtw6XMbARpiPUcyfTc5rUUbb
	DVmXj/CxoPLLSphBH4k7g+4ooMdri3shEvupJdmQKcQzQoBMKXlJGvffLGHkQjooN9PNU6LFnbJ
	HqVaky4oQS/DLxiJ6SVJVheyzKpA9Z+lT6NUXTZQa41IYMwSd5gI1q/G9auAiwVxqWs8H7Ihd1m
	mk5w/QU0WiWSoA1sbcmZoKg=
X-Received: by 2002:aa7:c74f:0:b0:658:909:511 with SMTP id 4fb4d7f45d1cf-6584eaa7e3dmr3822a12.3.1769122057232;
 Thu, 22 Jan 2026 14:47:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121225438.3908422-1-jmattson@google.com> <20260121225438.3908422-3-jmattson@google.com>
 <aXJRWtdzjcb8_APA@google.com>
In-Reply-To: <aXJRWtdzjcb8_APA@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 22 Jan 2026 14:47:25 -0800
X-Gm-Features: AZwV_QgLJNlpwnESIOnJyOjuyzAXTUsC4-1Gsi8ldMfpGFY9pFyZtqFYo2yuOLw
Message-ID: <CALMp9eRGj3rNeNN82H12f=XO5iXi5s2ri2K71CnjoVp9eKzz1w@mail.gmail.com>
Subject: Re: [PATCH 2/6] KVM: x86/pmu: Disable HG_ONLY events as appropriate
 for current vCPU state
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

On Thu, Jan 22, 2026 at 8:33=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Jan 21, 2026, Jim Mattson wrote:
> > Introduce amd_pmu_dormant_hg_event(), which determines whether an AMD P=
MC
> > should be dormant (i.e. not count) based on the guest's Host-Only and
> > Guest-Only event selector bits and the current vCPU state.
> >
> > Update amd_pmu_set_eventsel_hw() to clear the event selector's enable b=
it
> > when the event is dormant.
> >
> > Signed-off-by: Jim Mattson <jmattson@google.com>
> > ---
> >  arch/x86/include/asm/perf_event.h |  2 ++
> >  arch/x86/kvm/svm/pmu.c            | 23 +++++++++++++++++++++++
> >  2 files changed, 25 insertions(+)
> >
> > diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/p=
erf_event.h
> > index 0d9af4135e0a..7649d79d91a6 100644
> > --- a/arch/x86/include/asm/perf_event.h
> > +++ b/arch/x86/include/asm/perf_event.h
> > @@ -58,6 +58,8 @@
> >  #define AMD64_EVENTSEL_INT_CORE_ENABLE                       (1ULL << =
36)
> >  #define AMD64_EVENTSEL_GUESTONLY                     (1ULL << 40)
> >  #define AMD64_EVENTSEL_HOSTONLY                              (1ULL << =
41)
> > +#define AMD64_EVENTSEL_HG_ONLY                               \
>
> I would strongly prefer to avoid the HG acronym, as it's not immediately =
obvious
> that it's HOST_GUEST, and avoiding long lines even with the full HOST_GUE=
ST is
> pretty easy.

In this instance, I'm happy to make the suggested change, but I think
your overall distaste for HG_ONLY is unwarranted.
These bits are documented in the APM as:

> HG_ONLY (Host/Guest Only)=E2=80=94Bits 41:40, read/write

> The name should also have "MASK" at the end to make it more obvious this =
is a
> multi-flag macro, i.e. not a single-flag value.  Otherwise the intent and=
 thus
> correctness of code like this isn't obvious:
>
>         if (eventsel & AMD64_EVENTSEL_HG_ONLY)
>
> How about AMD64_EVENTSEL_HOST_GUEST_MASK?

Sure.

> > +     (AMD64_EVENTSEL_HOSTONLY | AMD64_EVENTSEL_GUESTONLY)
> >
> >  #define AMD64_EVENTSEL_INT_CORE_SEL_SHIFT            37
> >  #define AMD64_EVENTSEL_INT_CORE_SEL_MASK             \
> > diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
> > index 33c139b23a9e..f619417557f9 100644
> > --- a/arch/x86/kvm/svm/pmu.c
> > +++ b/arch/x86/kvm/svm/pmu.c
> > @@ -147,10 +147,33 @@ static int amd_pmu_get_msr(struct kvm_vcpu *vcpu,=
 struct msr_data *msr_info)
> >       return 1;
> >  }
> >
> > +static bool amd_pmu_dormant_hg_event(struct kvm_pmc *pmc)
>
> I think I would prefer to flip the polarity, even though the only caller =
would
> then need to invert the return value.  Partly because I think we can come=
 up with
> a more intuitive name, partly because it'll make the last check in partic=
ular
> more intutive, i.e. IMO, checking "guest =3D=3D guest"
>
>         return !!(hg_only & AMD64_EVENTSEL_GUESTONLY) =3D=3D is_guest_mod=
e(vcpu);
>
> is more obvious than checking "host =3D=3D guest":
>
>         return !!(hg_only & AMD64_EVENTSEL_GUESTONLY) =3D=3D is_guest_mod=
e(vcpu);
>
> Maybe amd_pmc_is_active() or amd_pmc_counts_in_current_mode()?

I think amd_pmc_is_active() is a much stronger statement, implying
that both enable bits are also set.

Similarly, amd_pmc_counts_in_current_mode() sounds like it looks at
OS/USR bits as well.

I'll see if I can think of a better name that isn't misleading. I
actually went with this polarity because of the naming problem. But, I
agree that the reverse polarity is marginally better.

> > +{
> > +     u64 hg_only =3D pmc->eventsel & AMD64_EVENTSEL_HG_ONLY;
> > +     struct kvm_vcpu *vcpu =3D pmc->vcpu;
> > +
> > +     if (hg_only =3D=3D 0)
>
> !hg_only

Now, you're just being petty. But, okay.

> In the spirit of avoiding the "hg" acronym, what if we do something like =
this?
>
>         const u64 HOST_GUEST_MASK =3D AMD64_EVENTSEL_HOST_GUEST_MASK;

Ugh. No. You can't both prefer the longer name and yet avoid it like
the plague. If you need to introduce a shorter alias, the longer name
is a bad choice.

>         struct kvm_vcpu *vcpu =3D pmc->vcpu;
>         u64 eventsel =3D pmc->eventsel;
>
>         /*
>          * PMCs count in both host and guest if neither {HOST,GUEST}_ONLY=
 flags
>          * are set, or if both flags are set.
>          */
>         if (!(eventsel & HOST_GUEST_MASK) ||
>             ((eventsel & HOST_GUEST_MASK) =3D=3D HOST_GUEST_MASK))
>                 return true;
>
>         /* {HOST,GUEST}_ONLY bits are ignored when SVME is clear. */
>         if (!(vcpu->arch.efer & EFER_SVME))
>                 return true;
>
>         return !!(eventsel & AMD64_EVENTSEL_GUESTONLY) =3D=3D is_guest_mo=
de(vcpu);
>
> > +             /* Not an HG_ONLY event */
>
> Please don't put comments inside single-line if-statements.  99% of the t=
ime
> it's easy to put the comment outside of the if-statement, and doing so en=
courages
> a more verbose comment and avoids a "does this if-statement need curly-br=
aces"
> debate.

There is no debate. A comment is not a statement. But, okay.

> > +             return false;
> > +
> > +     if (!(vcpu->arch.efer & EFER_SVME))
> > +             /* HG_ONLY bits are ignored when SVME is clear */
> > +             return false;
> > +
> > +     /* Always active if both HG_ONLY bits are set */
> > +     if (hg_only =3D=3D AMD64_EVENTSEL_HG_ONLY)
>
> I vote to check this condition at the same time !hg_only is checked.  Fro=
m a
> *very* pedantic perspective, one could argue it's "wrong" to check the bi=
ts when
> SVME=3D0, but the purpose of the helper is to detect if the PMC is active=
 or not.
> Precisely following the architectural behavior is unnecessary.

Even I am not that pedantic.

> > +             return false;
> > +
> > +     return !!(hg_only & AMD64_EVENTSEL_HOSTONLY) =3D=3D is_guest_mode=
(vcpu);
> > +}
> > +
> >  static void amd_pmu_set_eventsel_hw(struct kvm_pmc *pmc)
> >  {
> >       pmc->eventsel_hw =3D (pmc->eventsel & ~AMD64_EVENTSEL_HOSTONLY) |
> >               AMD64_EVENTSEL_GUESTONLY;
> > +
> > +     if (amd_pmu_dormant_hg_event(pmc))
> > +             pmc->eventsel_hw &=3D ~ARCH_PERFMON_EVENTSEL_ENABLE;
> >  }
> >
> >  static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr=
_info)
> > --
> > 2.52.0.457.g6b5491de43-goog
> >
