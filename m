Received: from mx0b-00206402.pphosted.com (mx0b-00206402.pphosted.com [148.163.152.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6509339FCCD
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 18:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=148.163.152.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785349240; cv=pass; b=PKq4rbFrb/sjYckUdY75e7OGKH4vc90C6HjRw+kOkhZmCocNuJ6w/T7ft88pXWvv5xYn/FmiWUI8QemyI4asP6wkjQRvM3cfGFw8JltykziNc1t4QRL99ZnWpLtZPAyZpoMHri6beQ1uYqrhCPPupOyLeewmS6XAUFLpgevEI5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785349240; c=relaxed/simple;
	bh=n4u6Lkyyb3K0KXlI8hsKysRf1EtEUR4qmTh5L+rzGD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0QZGo6WzxUxPAnBzWcBPfjn+b0kGK/3UHIAfSQK3ysx9FEwH9bvWeIi4Tt0ko4lnaOBxHtMNFINEYHRFAlfRaxG5dgM8/K6/ErXjzGcRiFON3Q53ypRFG0X6ynzPq4i2Y7MfybhexyGPEmDYA/3TN0nF2+6PNOj3BVxplojx9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com; spf=pass smtp.mailfrom=crowdstrike.com; dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b=iHY8BRF0; dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b=Seqce8dK; arc=pass smtp.client-ip=148.163.152.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b="iHY8BRF0";
	dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b="Seqce8dK"
Received: from pps.filterd (m0354654.ppops.net [127.0.0.1])
	by mx0b-00206402.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66THLfld2214569
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 18:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	default; bh=PzM3c/AUdHEP/V1SQKl0uANVAZmgdR90jTajOWlVlhY=; b=iHY8
	BRF02H3ThfZf4HVBVFgcPMlLqm5MGMZ/VZQjSZBartJjCLg5o3zKCU5pw7m7TrEw
	9VsI3Vy/NUmtyVwR3vZpdSUIehqLxpvOyZwYBeBD/h4BcSPl4p8/dQ6iwoy+vdae
	7yXAkfVZvzLvZXDQTgjV8oGyZl+5A6wspnTXis57RqgBPs6AVOWXuqsBj5xAiIMl
	bsaVMPcPMCIhjJSmO3Ba/WZ8pKzJ4fTq9J1HawGG4ILIgjY8VeylAEv80pPLsDRX
	rNWKBmbO/wyvivi/YzVQPIwjHE3kLPmXylMyhJKMYNOdrXaTnxU68x8B06cT7QVK
	WMH3m8LPZ+VMJvJiiA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0b-00206402.pphosted.com (PPS) with ESMTPS id 4fqk0rs7r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 18:20:31 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81ec0eb032aso39587917b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 11:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785349231; cv=none;
        d=google.com; s=arc-20260327;
        b=fmmaey2v+vLQ8g7GOZwRwxnaU7Vn+gu1sRrew4Bsc0nLXB5N8g8vsdyqc9fUui6Tt/
         2OsMjhwRuwg/bAVOAfOEt/F94lBHv034A1FNSk7HcYzFxsHWclmhy8Pb6Z71rgwOAczn
         NXa9l2BVfS2/GIhL3qXl6cuRMbC5Yx/Xn/5KJ9oy9sxOHM4gb4oGHnPjp6trvxrY7C+5
         T2/x+4vECm18B5gEFyIXEq1cC3oDUMRG2XoylJgmBkT6hHsDSmNo/VWAD86lejHXQptP
         yBDZPrro78zv7EReQmd5PWv5f8H3pakndeACgkc/J8NxK4oWRl7uUyDtLSwVnX6bC/6I
         /kfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PzM3c/AUdHEP/V1SQKl0uANVAZmgdR90jTajOWlVlhY=;
        fh=m1MdsXNr3WXVIb4jQXUnBDwaOuazBBGClkK27CixV5s=;
        b=MvGHEgYZ2EQISnYXICTDCMyAdfAf+KoZx0ssBQTWBaiUr17GCn/FqGMhBJDpJh7R5c
         dw++5Rbjar+Du0N7O5UKLJ/CQTwcM5/ULtPhhZ1ngVbYcreIb9k9aX21DfxSR2epftqh
         pLNBlfr08ab/lrhzAcW79Nr1eJ7ma4aVT19G01a3cas6He0V2M0nibwnnr9h+4B0u7TM
         8B5wD8erVlAkWxhsv+p2DpBt2DuXhz87VWBMocmjaB2T+QlIjZxSd7aRlOR0/1zv/tHe
         7HLaQd/LGIw8XuSk7yNsztABVtHKbXNXqPe+dXYKRIU2jYztJ+XYUqgHIC4KRewkl2FB
         09eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdstrike.com; s=google; t=1785349231; x=1785954031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzM3c/AUdHEP/V1SQKl0uANVAZmgdR90jTajOWlVlhY=;
        b=Seqce8dK1T1KrK1jY26btQ3NXgi3a/+1e44dJBu0R9V8vxn7LBGN6DRCzawL/mVzsH
         W+KD4ZBS7AJBN1J+c9Z+zRbOssWFG+EGb0hjcZOIE/hXpPeWwvzGq8uYKQGdlSPS02OH
         XojDu0BjyfM7G7kGexnIFXXNusHsecPJatK5oEaLO+wm1PcgbBZ0pPATsrdt9TBASNZL
         NDFUgFt59QWrPVN8ATChrnd8hARdx8oI6+Fi5u0fLNjmMbTajSOkASH8R7Csykinnzfa
         IlbQ5bIACf5vQNR1zGu8IP0WpcxrQenoYyqvGLakcyYrppzPJ6jIFGuiPvJmve2Jb0E/
         gwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785349231; x=1785954031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzM3c/AUdHEP/V1SQKl0uANVAZmgdR90jTajOWlVlhY=;
        b=jlS4O+4N7MYkhemfPqrZ9DTSKonQ1RA/uibE2+XrMd9o8BbRZ4Ufp48I8k5jt2WZ/b
         0+91AeFWphENSUz8990Me6DTWPgyg9aBbgjipulSmplR71FkX0TazrLtBvDYTjzt7svb
         aWRFm6DOXruAkEjuMoyz7Hpz/v82xgoV0LJN9BLGI3shDzE42F6FCN5Vp/szX37+6uk5
         +sN0/iTlGpvW4alJDl+nUJhj7KoQPPug1CkpR+yKkoUXiGgkiaSc56UHOS6ioqkLSz7+
         fg6pO1ThiR9a5RvXYyie0p0dkr1INX6v73Ci4Ot3qftldu/B/qnUw02jEbTgZnlMSSOw
         6zsA==
X-Forwarded-Encrypted: i=1; AHgh+RpfpDYDHK51gGJ36HmdDLw0/NZYZj1zMqjrplonAZKnyDgov+AkfKplvck7K1krEXM/W6sJlzNJnBxm8sqUKsE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw76FSFK/9NKiNOnXPEZ1ZK1GV0NA661mRIx4qqcAl0MYE72NhS
	geegs8eTsgL96i78oj5QAUXUBFVK0eddBN7Xyr2CNbnShXo2KLuP/BW1UYuqV3v4+yww+IzKnOg
	xfSK90ObLFAPzzWqnZzFZTbuMbzLot2W8SsQQLiv804B5F8lYvWH1V2k+4H2rCoQhMI9/johha5
	6T9a46OcXpV6fAIh0yX55SMhjth2BoBDCZK/uS0Ww9K8Wj
X-Gm-Gg: AR+sD13qsIdDmBiSuzMmYk79RD8w3Qd1Mhh2iEiL0NX0iENyj1AsWKJQhFc6g5NppV1
	lj+LqJhdfKPSE3gfbSvmOI9VFOqxv5V+/PxSwRG9twyk9t/QbcGEHhx7s8bjLdNQa0oZ+B++0Xj
	+8Z9zBTlszhnwFFv/4p/1E9hdmQlsEjlww40nQ6Sajwzivz2sPUJy5VjWO
X-Received: by 2002:a05:690c:9b08:b0:806:5a1c:d892 with SMTP id 00721157ae682-81f99362200mr38160747b3.47.1785349230894;
        Wed, 29 Jul 2026 11:20:30 -0700 (PDT)
X-Received: by 2002:a05:690c:9b08:b0:806:5a1c:d892 with SMTP id
 00721157ae682-81f99362200mr38160237b3.47.1785349230082; Wed, 29 Jul 2026
 11:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729005959.3853865-1-andrey.grodzovsky@crowdstrike.com>
 <20260729104114.04298a48@gandalf.local.home> <CAOu3gNgc0XHScgEf+yWF5Kr8sAm8Fsa4RBuwL0YE2EscSiBPrA@mail.gmail.com>
 <20260729113136.32af2a4d@gandalf.local.home> <CAHk-=wjzHTuomhTegkD69veDVRxprX8NB=i7A+BEB2-v6v5n+g@mail.gmail.com>
 <20260729133232.1e6c79eb@gandalf.local.home>
In-Reply-To: <20260729133232.1e6c79eb@gandalf.local.home>
From: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
Date: Wed, 29 Jul 2026 14:20:17 -0400
X-Gm-Features: AUfX_mylfstO_nr2YAMR0KtoaEUkuyIT32SLYOev--K7OVQlRoslcyNqTeL-jhE
Message-ID: <CAOu3gNg6kNYp-Sc9Eme6yW7Nu7wV6hZ9=CG0eptROfhQ-H8nFA@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 0/3] ftrace, kprobes, bpf: mark
 trampoline/kprobe ftrace_ops permanent
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        song@kernel.org, jolsa@kernel.org, naveen@kernel.org,
        davem@davemloft.net, mhiramat@kernel.org, stable@vger.kernel.org,
        linux-open-source@crowdstrike.com, mbenes@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: MQAn5DGlUWI6oFhk2J-TGt9BR2a-PfJv
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a6a446f cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=KZhmPCYDdY0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=T2KQ53IYiC3MXPrxx8bB:22
 a=R_n4Uisa8axJ7jemP0ek:22 a=meVymXHHAAAA:8 a=Z4Rwk6OoAAAA:8
 a=LEQXHG-ZodL2_mGlm5IA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
 a=2JgSa4NbpEOStq-L5dxp:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-ORIG-GUID: MQAn5DGlUWI6oFhk2J-TGt9BR2a-PfJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE0MSBTYWx0ZWRfX0olrSf0s9eu6
 z8793vdPJ5+6aCwHwepUcUPGlS7u71a3TAoKOQApsZUz321Z2tZiLsMEe7MMUQ0jgsAH3vx8KoI
 DpQOVCtndRi2kLuXhsDoeYLEHlRWIV5+2SylDGcjrCkTC9/KoIrUj/opNLOi1bVX6B09r8eudSz
 hxBxQgl2DhQCTG2kL7lsYoW4C2Iz4B6dQQa8ILK261fQFwXnP4bbgM00P6+Aclw6iS9x9XXTQjK
 /gRhuM/4ylLyFqBOzqDERJqTL/rx1NqeiIk8+h+zLQUTpcJiZqs/2j1frATUKVQxB+LJa7hOsrr
 rRpcO3lde+Mfjsgl/hkmTROAeCSIlgjMbsC2uflCc7C4AXSlR0YjieT+LZiyo9j4jThl6yj7UU4
 ywzVbpfh+6Aa2ewGG0FU000UDlLQN7Sn+kP9JMuUgSRbSNgCgQi9co3gi7Kcx2WeGuUSgHvzZ8u
 VBiuw/cN2keM/WS6bBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE0MSBTYWx0ZWRfXy5yeuVNQyWFG
 GvM9918KndQR09TY43n3/AjXZYjU+G5OvO+hjwbI4dKaKzqlShCUbkBSYSaYKUuMhLsoUlutED2
 V+6mny2FJioHSL8pqzDU4ueg7VOGM8Z/4ibOUVZQuS+MZh8SrLPq
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11859
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290141

On Wed, Jul 29, 2026 at 1:32=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Wed, 29 Jul 2026 08:47:33 -0700
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> > On Wed, 29 Jul 2026 at 08:31, Steven Rostedt <rostedt@goodmis.org> wrot=
e:
> > >
> > > > > Honestly, I would love to get rid of it as today ftrace has prove=
n to be
> > > > > rather stable. But as it is a user space ABI, I'm not sure what w=
ill break
> > > > > if we do. I wonder if we just make it a nop, and print a message =
to dmesg
> > > > > saying:
> > > > >
> > > > >   "ftrace_enabled no longer does anything. Please report if you n=
eed it to."
> > > > >
> > > > > ?
> > > >
> > > > Thanks Steven, if you and/or other community members would approve =
such
> > > > approach I would happily do this instead for a few reasons -
> > >
> > > It's actually if Linus is OK with this approach.
> >
> > The rule is always the same, and I don't understand why there's any
> > discussion about it because it's been stated a million times: we can
> > try to make any ABI changes at all, and what matters is whether it
> > breaks somebodys setup.
> >
> > If people rely on old behavior, it can't change. And if people don't,
> > nobody cares. It really is that simple. That is literally the
> > DEFINITION of "don't break user space".
>
> That's basically what I said. I was just restating it and not asking if I
> was correct. I added you more for the below information you added.
>
> >
> > Whether something is user-*VISIBLE* in theory is entirely immaterial
> > except in the sense of "be careful, this needs testing and may have to
> > be reverted". So user-visibility isn't a "don't do it", it's a "do it
> > carefully, and knowing that you may have to revert immediately if
> > somebody complains".
>
> Totally agree.
>
> >
> > So changing user-visible things is potentially a lot of wasted effort,
> > and needs loving care and follow-up.
> >
> > So everybody should typically avoid changing user-visible things
> > because it's potentially painful and developer-intensive, but not
> > because it can't be done.
> >
> > All that matters is whether real user workloads regress.
> >
> > And please make sure that any changed behaviour is really obvious, so
> > that people don't spend lots of time chasing down *why* something
> > broke. A kernel printk is generally way too subtle - and no, the
> > tracing "make the printk extra ugly with crazy ASCII barfics" model is
> > not an improvement.
> >
> > It might be better to actually return an error to user space so that
> > users can see that setting ftrace_enabled to zero failed and it would
> > show up in user logs. kernel developers may think that kernel logs are
> > important, but users seldom even think about them. Of course, that can
> > then cause even worse regressions, so there's a balance here.
> >
> > End result: don't do user visible changes unless you really really
> > care. And then you spend the extra effort.
>
> Honestly, I don't know of any tooling that would use this kill-switch or
> any reason to do so. For live kernel patching and for BPF, it doesn't eve=
n
> work. Hasn't for some time. It's now a "kill some ftrace but not all".
>
> Hence, again, the switch itself is rather useless.
>
> It now is starting to cause a burden, as there's internal code depending =
on
> ftrace functionality to always be working and can cause some nasty
> undefined behavior if someone were to set that kill switch to zero. The
> solution is to either play whack-a-mole and make sure all those use cases
> have the PERMANENT flag set so the kill-switch does not affect them. Or w=
e
> simply disable the kill-switch.
>
> But I like your idea about it returning -ENOSUP if someone tries to set i=
t
> to zero. Doing that and the printk should let people know why it didn't
> work if they do care.
>
> And yes, we need to be ready to revert it if someone does come back and s=
ay
> their tooling broke because of it.
>
> Andrey, care to make a patch to do that?
>
> Have setting it to zero return -ENOSUP and print a message saying:
>
>  "The ftrace_enabled file is deprecated and no longer disables ftrace"
>
> -- Steve

Gladly! As BPF users we can attest that this switch causes pain and
handling complications.

Should I also clean up the entire PERMANENT flag logic we now have and
drop the flag itself?

Thanks,
Andrey
