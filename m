Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900722D248D
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 23:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769815857; cv=pass; b=aRtNY5brE1mxHNTHCfBf9I6IOwNVZDxqlsoD3hLqmscUHXsaOcYACY5NFVzUv2jaCw84KBioIC4A5KGs44rPG3V2brvHIp96+VdaftoOtEsAdMYD/NPgoWEePVshRwt9MqtFPCIuK55YtFMKGxlXPi01s647yBpZFACtfq/otMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769815857; c=relaxed/simple;
	bh=uP3AnfWxksp7Fq17hXZgZwEtBM8hOyGlJYnoXXxtPoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rr6iEEjjsIW5ZLb7Ydwriy1MbW6+1L5zB335yQqDEbI/TbyAA7HS+JkEWgd1lV0z992xia4wRkx/rTs5tXlFE+ljvF4sMGO03NHcUNXo5yyl8fnaf/YCJl0q6+dGsl2gv7Bu2jFeEVsbvDDLiCvIkdEARmkvAymwY0GkS5r/dtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LGUoB9dD; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LGUoB9dD"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6581551aa88so1828a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 15:30:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769815853; cv=none;
        d=google.com; s=arc-20240605;
        b=d3malR/DHx1FQIXouupqOlF9xIdtsdZFRKlrgJ+0ShuMrw1kz1SnRnf0D5RJtVjxwS
         xGe9xpl3bD1EayRf3AuLtw2hHx0qE9/n5ODz2FMEMqsp+041HH+a/JYzXPtpjntJdfs4
         CqR4w/sz+saKViXA5BMctqt96CeA32rNdtcUWsL21C4HpGgdngbaFZ/V2DPmE5OEDRVS
         EzXQFAhUFAqsZWtT59+xrQqG2Kl7YoSS77BPcpYV0Foa1kSK15yo3YKI9omKtPN+KQqI
         TFpbrV1Q18JBE8im2AnnZQ1NBgK8SnDuY3k2c/r/1kmmjd+/sE+y+9u5Wkgy82Ai9lK7
         8Nzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWGbD3Q1oYxtbYVSNos0BG2kmeyuKAEZoyrEWcfmjO8=;
        fh=o0av7wwvxYN90gJB7CWNRxQVh0UYtWDYki+1j213ze8=;
        b=IeKtUh3njdzFGr6yEM56JN70jl9etmsIxFG+0Dv0ZVYG0YioBP1xxYiowOBsipbMtZ
         fFoPCOlZC6rSE7PP/sqCOXA0ygG2G+iu49xr4vTYrewPdGrUtRCB+0cJh8FPqWOIs348
         iWMFlOqtjKG3mmdYXAO+a6TfNiVRz/O5MHWbqEakUfAuA1qcVtmM7LkhulR/ySg7ZoI7
         sIK2VrSF4Swdk4d3TeBMFohrb38QvkVzQhIzo1oH8HWhCFyTz1I2g3rHphPxRH4Ae+qD
         F3HH1rPbz4xgAWkFpR5QGVW7PGHdcY45BOcBwh8BjUt13ZRoKkuX+AXrzAUBXuX0ihpl
         7BKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769815853; x=1770420653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWGbD3Q1oYxtbYVSNos0BG2kmeyuKAEZoyrEWcfmjO8=;
        b=LGUoB9dD9y23kkeGF6qyeo0n3Ir84ufMDaVQNwJAQRRYgFfC5UGI3UZI7zQ4yY2++u
         /LZSVMRsJkE3rdNvN50O3eWJArx05s+8Nufw/8pRtuMraTyLHfilPVIILi0JRk5jkqyh
         zYI88PnJiIrzEwW0Ljw5JyCLyDs9M6iPW5LYbQkUZunQLbAY7jrdxFRGXD6iunRKK6Cp
         m9JgnbAm009iodgRdrONT3RfwhnocFL8tDucmoN6WoUUVwAaTebxcIq3GdSG49aUXFGg
         RQRhTTO+6ybI3jMnmEGT3F5q5EA/kCm6IEOIIdpkXSrWMdxLO9ZcLyCsJnkRCXR7S+Aa
         Vbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769815853; x=1770420653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OWGbD3Q1oYxtbYVSNos0BG2kmeyuKAEZoyrEWcfmjO8=;
        b=olYM/+R84fB6bIAt/upOSkM8WDCx8OrQDuB334uWMrNPjw8Wl32fnqhIbbpZCfq7hj
         5rw4vpE2UqqCFhtW92TnP/1XbLEO1QS/XzU4mxkuy8tfLVvIHXqWRmiI3wj94dK/GjET
         5sCvqNTR/mN4oD6CKIkWYyBQfVxycV+VsOonDLphp3HP6/ljIaKHc4V/9B/tho6CXnxP
         kIDbB3KKNJOVwOXMoUc9y2XUm1oe6ukg0iDoYKmiXUDeyJ3u4pza8rOphTLxOPqPbuac
         rGRiAcpfnM2LpbkeV7N8Ryz+TCkmtRNAs5w3u+eZbbgvj0gpbvul917VEYWVhe3JRe6J
         rDgw==
X-Forwarded-Encrypted: i=1; AJvYcCWvNZt3lMUnxSaW04dx03w4Zv56AfZmWVEpEr8B3b+CcBEHtlTht9Ncd/uF+wDMrwWACt3lXnbZwS1/GBLht5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0/qrekrzvzlfbg2qxqeD5pTv+KJcaQWg/St+7TIrUQdtQ6ZN5
	kFpnk9qVjBJuPrt1l2Tv44w79En75xjiBK1W6gj2+BApm9/u92AXeu6sBXuHRrO18VodPn/X9u8
	Fg4rx90wiN9FRJynM5dpvDYyd0ri/qQsW0jn/9v6d
X-Gm-Gg: AZuq6aKy5SBjSo+sM6LJ/QfuIPLkDwCwHN2MQHduPb8UIPghbpzgl5UrIfFK/OXqa+l
	CXNhlys9TufVlC9wN40lksBPzKqsYX+gkfnhrYtf12Ar30Pf4RkjAZ8Sym3NDgW3r6IMuntZcX8
	hwzy2JzLz+/gOqT3qtJsOcaEPhHwFO4FVO1xV3k4QfnX5FMEH5I71rSpBO4y0cYn6ffNzyOd29g
	SnrOS4PxZ5BfVBPxBq7UAa3ROUqlR8sL95jtqwCE2Oq+lxlLDjUwM/Wb5GtBTFG02njpbQ=
X-Received: by 2002:aa7:ccc6:0:b0:658:a54c:d6f3 with SMTP id
 4fb4d7f45d1cf-658f6c75eaemr14062a12.6.1769815852677; Fri, 30 Jan 2026
 15:30:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129232835.3710773-1-jmattson@google.com> <20260129232835.3710773-4-jmattson@google.com>
 <zzgnirkreq5r57favstiuxuc66ep3npassqgcymntrttgttt3c@g4pi4l2bvi6q>
In-Reply-To: <zzgnirkreq5r57favstiuxuc66ep3npassqgcymntrttgttt3c@g4pi4l2bvi6q>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 30 Jan 2026 15:30:40 -0800
X-Gm-Features: AZwV_QjGWdMQTuDf_firyiB8uJrobAc3g0L2GOgNb852oEYE3viONZnLUBrlkRc
Message-ID: <CALMp9eS7Za_vFdh8YBzycV2g87gZ9uj_S1MOYrgJ1+ShwVVWZw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] KVM: x86/pmu: Refresh Host-Only/Guest-Only
 eventsel at nested transitions
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mizhang@google.com, sandipan.das@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 7:26=E2=80=AFAM Yosry Ahmed <yosry.ahmed@linux.dev>=
 wrote:
>
> On Thu, Jan 29, 2026 at 03:28:08PM -0800, Jim Mattson wrote:
> > Add amd_pmu_refresh_host_guest_eventsel_hw() to recalculate eventsel_hw=
 for
> > all PMCs based on the current vCPU state. This is needed because Host-O=
nly
> > and Guest-Only counters must be enabled/disabled at:
> >
> >   - SVME changes: When EFER.SVME is modified, counters with Guest-Only =
bits
> >     need their hardware enable state updated.
> >
> >   - Nested transitions: When entering or leaving guest mode, Host-Only
> >     counters should be disabled/enabled and Guest-Only counters should =
be
> >     enabled/disabled accordingly.
> >
> > Introduce svm_enter_guest_mode() and svm_leave_guest_mode() wrappers th=
at
> > call enter_guest_mode()/leave_guest_mode() followed by the PMU refresh,
> > ensuring the PMU state stays synchronized with guest mode transitions.
> >
> > Signed-off-by: Jim Mattson <jmattson@google.com>
> > ---
> >  arch/x86/kvm/svm/nested.c |  6 +++---
> >  arch/x86/kvm/svm/pmu.c    | 12 ++++++++++++
> >  arch/x86/kvm/svm/svm.c    |  2 ++
> >  arch/x86/kvm/svm/svm.h    | 17 +++++++++++++++++
> >  4 files changed, 34 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > index de90b104a0dd..a7d1901f256b 100644
> > --- a/arch/x86/kvm/svm/nested.c
> > +++ b/arch/x86/kvm/svm/nested.c
> > @@ -757,7 +757,7 @@ static void nested_vmcb02_prepare_control(struct vc=
pu_svm *svm,
> >       nested_svm_transition_tlb_flush(vcpu);
> >
> >       /* Enter Guest-Mode */
> > -     enter_guest_mode(vcpu);
> > +     svm_enter_guest_mode(vcpu);
>
> FWIW, I think this name is a bit confusing because we also have
> enter_svm_guest_mode(). So we end up with:
>
> enter_svm_guest_mode() -> nested_vmcb02_prepare_control() ->
> svm_enter_guest_mode() -> enter_guest_mode()
>
> I actually have another proposed change [1] that moves
> enter_guest_mode() directly into enter_svm_guest_mode(), so the sequence
> would end up being:
>
> enter_svm_guest_mode() -> svm_enter_guest_mode() -> enter_guest_mode()

Yes, that is confusing. What if I renamed the existing function to
something like svm_nested_switch_to_vmcb02()?

Alternatively, I could go back to introducing a new PMU_OP, call it
from {enter,leave}_guest_mode(), and drop the wrappers.

> [1] https://lore.kernel.org/kvm/20260115011312.3675857-9-yosry.ahmed@linu=
x.dev/
