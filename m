Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A66727B34C
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 23:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771025490; cv=pass; b=imIlt3+Pccp174vhSwC2GwsLynxsZUoKl+ngmDfob4RyIQKCj0xGV7NPBc3q3MspM4eO7JH95hOucE8BlR+D/6OwB8giAioaa1ndNmgA58+OCF7KzKilP1fnUALQbTJtpu7w0UsElIV8A04VFxn9Vz9EooufMtxTQL2sNE2cZAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771025490; c=relaxed/simple;
	bh=j7413bRwBOf97LMXeMJ+51aV4XcmAmSqRqIQ7niCkkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SllbsFB+BTJmAxj+UkboPL6Gqp+nyiT6EvEkTvYhDAoFnnlCspOjyv8HXb/4NHuZ0PBJ+VBoECf6vjYTxT0jE3dsRGAofzn305QsEQrPx3Cl6aCtTCABdzopH/IZ5082yj9ybp1ZbRHaaELJB0mBi8IKsIo59PUweeFb/jTcJt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lMnucXBH; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lMnucXBH"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65821afe680so1428a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 15:31:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771025488; cv=none;
        d=google.com; s=arc-20240605;
        b=k0s3L431ItdxUNr5mgGxyooxIJVEAI15e+zdDYiRNCSn9EcRckWadzchXJsxSZhKzh
         PTby3VlpoRHHiqKh0fWvvjagxWWNLDg8oBlgZdxVeWtY5K6ewtEHNyiriFMAojAvXywG
         QrNF45AHbyF3YeoycD0Ufr06SMF+7gsrMQi9EBzl+N0rwP+6f7z5v1zZkIzN14DCVSd/
         Rjm38CVfcr0IwdoAvCXxr7Dvwu/+9FUqdouh9Cikdg115hCAu7/mC+IznaUkEGDkGVtj
         JXoYbBAG5OeSbRm9ZrJLlS9sHYZlXzAdYzyHjkhgxr6rxRWWOFYTYXrZqiiN0+QGN1x4
         h6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7st+ny0+WsScz+aFPKKNW8ny3dY5RaMJM5tFlYQQMR8=;
        fh=BbPmL8fcuZmJ2+UzMcmfmss8pUfC1dIOP317TySBrxE=;
        b=TEucc3PfvZaTdStD2KxaN6OaWWNSJ9Fa0/ZGup2HahBemrTgFzpFEVIIeS/p6Q6c1X
         x57ARyQ2ePNcdlwYTLLEvRm1CyxzYChbYTBL0TE/vP53GwAfqHez0Qottzi1UfcPFRwV
         ZsWeN3OU6VssU1TJibxLhRZE/fp+FcWsS1/fSjjB6U0JGnF9fi/NU4jCBgQEPC5KiKcr
         3cur2Ik6tg4xXzC2HHo6wf26IDvS5HRWOwxuFE0FH2UgGTCiYtC7frMChPpLAl116+lC
         Xn5t/AYEu0I073Yva8Tto44phdwqvS7pTLLix9bmohAg60Mpr9X35EvehrjqI2a4oLyz
         mXuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771025488; x=1771630288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7st+ny0+WsScz+aFPKKNW8ny3dY5RaMJM5tFlYQQMR8=;
        b=lMnucXBHR6KHDUrlZ4KXcm8p45k6mWpK4hmG1CyCFEKIYpn0js5M9gYLWAnuDrC/K4
         dUuVgM0HOBJ1RQK+gk5WSunauz3d3xyms/y1xPKnpA7MPM2o6iIS/QvZdeO5dSeHO+YZ
         CcsP08ilIQ5dv5UqC82tmrZC+Y4SsZJjewA9kIZAWJ19LqQLmPYQXxolWUgfGrt1dFEg
         kkrVUJlvJdnAbuOYT/5hv7TA8rv2kake4sHfPiBjKW/Dkso3LaY2tCmDpZjeJCk/PLuA
         rVnNbpCg8ZA2pq9ZnstVD3GcwnA+I2tYEkB2b2AZMTX7VG5zFP6044/mD/AhBqW99JjA
         62Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771025488; x=1771630288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7st+ny0+WsScz+aFPKKNW8ny3dY5RaMJM5tFlYQQMR8=;
        b=bt1olq4XX2i9ERv13Fa808mcvGYaR+GJ/Ip9BY+bWzszTUo1yhasM/IkawOKOws06V
         yR3tEe9g4aTw83fxjaKOayRFtAAuQXmwhSgUleFbssC3QkKR7PKoPygVRmW53UTmT60r
         Ff9hT4QjRNdNS83NYPmoFYFpePqjplNgvH5KeKFEWVDdXStBQ++TmcGptAebuhL478JS
         JDdRLLTFL6oZBX9p7aJI3ptRwX7cX+6eS4R4k6a5/abbzu1Me6eQLhaD7S+GFkQhhMvB
         uU99L8fcy6CY57zwOY2wTBzmEEh7AEO+lEaG+1h9fHeYe4q+kxRx49moCT5Z+KfO3V3X
         vz/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVMwxcbO6WOgdmoUqFaANaXVLySpnFqQx2++IihZiBwc0jIGUXAP6yvxn3g8qeGbYbxrj2ks6TiGVvUe1bQLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/2vkByU/uwy9ctzQ6Q0xzZPs5So4E2pysFh6WvEiYzVS0hjo3
	cgnjHJEyy3Jt3mFQ7xKhsCAbDASOq2PP3RnKoszUAf9hzVlGqSAGcO+ckloadxcXxUa7MkBCv8C
	ibT3Qb1qp17HsYoNoej88BiKtW+S6TB3ruKz4sTwfpI2P0HcY9hkskvlf
X-Gm-Gg: AZuq6aLP7qbfHJc8oflWHIMagydBGHUbC1cxd2jk3K16/ulpt5DzTuvauYxizNbSCTo
	foGzfuvbERcyBMgScSpeM5XugQskYMVpwlrGx9kYlvGgbQmP8LX8YihIw+XD8dmIW4kMWEtrEW1
	CTf4zcVZzeCFz+sBTPYznhjFbJ7OQ7A0ONJ9NoPg+bavMAG/156mLEY7ujmoy5MjhjM2bdiZtlR
	wwSXn6YorIz0ugF7/Q1l4YmWd2cfxnTn4G2q7l00WZNTp3ecWPL651VuXDatZ3YqCfNSJR5RYxo
	P7cgThwXX9hP8dIMhg==
X-Received: by 2002:aa7:ce09:0:b0:659:477f:1b2e with SMTP id
 4fb4d7f45d1cf-65bcd818f8fmr2838a12.1.1771025487143; Fri, 13 Feb 2026 15:31:27
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212155905.3448571-1-jmattson@google.com> <20260212155905.3448571-5-jmattson@google.com>
 <gqj4y6awen5dfxy32lbskcxw6xdv4xiiouycyftjacndjinhvp@7p4dtgdh6tjw>
 <aY9BPKhzgxo4UuHB@google.com> <CALMp9eR4ayj_gwsDQVH8pQvzqgEYVB6ExWp3aFgJXRWikLEikw@mail.gmail.com>
 <aY-jViitsLQm9B83@google.com>
In-Reply-To: <aY-jViitsLQm9B83@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 13 Feb 2026 15:31:15 -0800
X-Gm-Features: AZwV_QiHyVOxh9r0ypnXYUO82O-EfzXPfCouEz0SjFgSJMf4FMafJkFC8Oc2I48
Message-ID: <CALMp9eTnXW9=0=+RxQjeXfA++UP3MX0LzXo5qwUP-dCCQjOLVQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] KVM: x86: nSVM: Redirect IA32_PAT accesses to
 either hPAT or gPAT
To: Sean Christopherson <seanjc@google.com>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 2:19=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Fri, Feb 13, 2026, Jim Mattson wrote:
> > On Fri, Feb 13, 2026 at 7:20=E2=80=AFAM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > > > > +static inline void svm_set_hpat(struct vcpu_svm *svm, u64 data)
> > > > > +{
> > > > > +   svm->vcpu.arch.pat =3D data;
> > > > > +   if (npt_enabled) {
> > >
> > > Peeking at the future patches, if we make this:
> > >
> > >         if (!npt_enabled)
> > >                 return;
> > >
> > > then we can end up with this:
> > >
> > >         if (npt_enabled)
> > >                 return;
> > >
> > >         vmcb_set_gpat(svm->vmcb01.ptr, data);
> > >         if (is_guest_mode(&svm->vcpu) && !nested_npt_enabled(svm))
> > >                 vmcb_set_gpat(svm->nested.vmcb02.ptr, data);
> > >
> > >         if (svm->nested.legacy_gpat_semantics)
> > >                 svm_set_l2_pat(svm, data);
> > >
> > > Because legacy_gpat_semantics can only be true if npt_enabled is true=
.  Without
> > > that guard, KVM _looks_ buggy because it's setting gpat in the VMCB e=
ven when
> > > it shouldn't exist.
> > >
> > > Actually, calling svm_set_l2_pat() when !is_guest_mode() is wrong too=
, no?  E.g.
> > > shouldn't we end up with this?
> >
> > Sigh. legacy_gpat_semantics is supposed to be set only when
> > is_guest_mode() and nested_npt_enabled(). I forgot about back-to-back
> > invocations of KVM_SET_NESTED_STATE. Are there other ways of leaving
> > guest mode or disabling nested NPT before the next KVM_RUN?
>
> KVM_SET_VCPU_EVENTS will do it if userspace forces a change in SMM state:
>
>                 if (!!(vcpu->arch.hflags & HF_SMM_MASK) !=3D events->smi.=
smm) {
>                         kvm_leave_nested(vcpu);
>                         kvm_smm_changed(vcpu, events->smi.smm);
>                 }
>
> I honestly wasn't even thinking of anything in particular, it just looked=
 weird.

At the very least, then, kvm_leave_nested() has to clear
legacy_gpat_semantics. I will look for other paths.

> > > > > +           vmcb_set_gpat(svm->vmcb01.ptr, data);
> > > > > +           if (is_guest_mode(&svm->vcpu) && !nested_npt_enabled(=
svm))
> > > > > +                   vmcb_set_gpat(svm->nested.vmcb02.ptr, data);
> > > > > +   }
> > > > > +}
> > > >
> > > > Is it me, or is it a bit confusing that svm_set_gpat() sets L2's gP=
AT
> > > > not L1's, and svm_set_hpat() calls vmcb_set_gpat()?
> > >
> > > It's not just you.  I don't find it confusing per se, more that it's =
really
> > > subtle.
> > >
> > > > "gpat" means different things in the context of the VMCB or otherwi=
se,
> > > > which kinda makes sense but is also not super clear. Maybe
> > > > svm_set_l1_gpat() and svm_set_l2_gpat() is more clear?
> > >
> > > I think just svm_set_l1_pat() and svm_set_l2_pat(), because gpat stra=
ight up
> > > doesn't exist when NPT is disabled/unsupported.
> >
> > My intention was that "gpat" and "hpat" were from the perspective of th=
e vCPU.
> >
> > I dislike svm_set_l1_pat() and svm_set_l2_pat(). As you point out
> > above, there is no independent L2 PAT when nested NPT is disabled. I
> > think that's less obvious than the fact that there is no gPAT from the
> > vCPU's perspective. My preference is to follow the APM terminology
> > when possible. Making up our own terms just leads to confusion.
>
> How about svm_set_pat() and svm_get_gpat()?  Because hPAT doesn't exist w=
hen NPT
> is unsupported/disabled, but KVM still needs to set the vCPU's emulated P=
AT value.

What if we don't break it up this way at all? Instead of distributing
the logic between svm_[gs]set_msr() and a few helper functions, we
could just have svm_[gs]et_msr() call svm_[gs]et_pat(), and all of the
logic can go in these two functions.
