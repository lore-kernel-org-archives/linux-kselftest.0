Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6323DFC78
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778769945; cv=pass; b=l4Lqw2f17YSU618mUpWjUMSDeiGhOepzyOESoMaGmIt3kIJYEDtQIp6CBvUyfR6GgYy4IlsYSNtMFtuY+xXadAFeTqoQBRgaqwr9k14R7Bi+TpDi4Ky/64UzfWXHfBj9qofITk6IATAEO/s37K82frZo/vcEuppuCyL/LXIMRD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778769945; c=relaxed/simple;
	bh=AOuL4P8rcB/w4m3MQYbAMxJmPtiyHVkS+oqVWDnYxGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MTG9+Y0vuPdp73aSmHIqKr5mQe+/MmbBZa23bpl1XYWTb8t1Irjn8xqGTLKrLSjN8oea2Tt7q6M6ACuKeuud18FnhEFZfX+z3XIsVph9yCpvxFqmCBqSzoTJLyZ+NRp6dydXmrBy6c3drMlQUHaiD06p7sEaIZUjxBraZ/QAhUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lSvGb2l7; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lSvGb2l7"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so9273a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 07:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778769942; cv=none;
        d=google.com; s=arc-20240605;
        b=FIyEulo/cksWGf8U/PmL+gzjp4VAr4vqdf8TH28dXI6EgYI5mX5bljoWw1SEffhbPc
         k581BOO4RrEdr0qTKdjkouqzZdgoaqnjBaTa9TbT1BbSF0Fe8cgSLLYeBVvrbLlNEU30
         KMqDm/Bj/utLtQZEP4HXCJ1OupoUNnHGI+s6bs+wek5IzpDZwnbwTSaOrMbv7xLGUfu7
         nJmg9UtCxS4f/hrpsRvyGoqW1AKxMViuXRCKE+zdw+7RDmOGZb//gIw1oE9/+w1Jeu4E
         BSqdemqt1G15Oo1MH+robJ9y18Oq/TtghgANt2wKiD94po4vhrtT3Cj7YKOAXH1Y+IzW
         nd4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mHlWFCWo35g49/Oc5J271s5rFVq6NRF9U1sIaUKt4Qo=;
        fh=b1Ppbg9pAd4BH0EiCHm6r0nQu8UN06xP0VI2fqvHTaQ=;
        b=RKThJ5ulAW7dH8vn2eCiepxewWuOBgNyn/98BBqXbP/tlwJsDRmb6JlSiZszNS0YCd
         wZZZW6mmFrhSWJ6EU8Zzv/WVujWk+ChH/UlU+IdKDBsAvj52edfDXvZTjv5VGmeH7jwo
         NzqdQ0TW2a0iTV/i8t1T9YcDJtf71SOaPuwCnu4u3c+Vs2H6Vx7NfTsZv3olMHu4vxQy
         +VZfc98bQSrS9BX/vfH+ne2R0lA9vUqq1G130UBQieTAmom4rBRyH1e3JjuLKU3xC92z
         3myMNacRvpG6uH03QBvisXowcvk2igfM7Pxy89vILI34KsgATNUBvvkhc5z1TtnNDLSg
         R0Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778769942; x=1779374742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHlWFCWo35g49/Oc5J271s5rFVq6NRF9U1sIaUKt4Qo=;
        b=lSvGb2l7TF43sTuMVzAqrV4mup+TcU+k7NEykRZPR3mJ0Dr9KNoGTMbHrYNvZJ9a+S
         hyiD+m+dxpgD/5Hnh/Nucwd7qdstiGt1bkKCSDi4xTdpAHvXSFdiTKR/1oD6ADTWvPJ7
         CpymscLz3eIwJSxp2AX+AitLyK5hZn/+0u72ow4Ze4r31Uq2RDoSdzI8p6aY76QWNxuC
         Fb3/QyCuHiO0xCOfTZD/FAAP5kUNfhkcwMA289MlK88gifV7AhO+hjKZKqqMxhK7gNuF
         SutjaEQMMX+UBPwee29+GogPVlKSTl0sJv9f4K8SNovn9208Sx+/7wAzzt/5pIz5F/wg
         bh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778769942; x=1779374742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mHlWFCWo35g49/Oc5J271s5rFVq6NRF9U1sIaUKt4Qo=;
        b=HiyTdM0FHwrBYMpHQkiegbFFsiNmc5CAO3R8to4Cs7I5TBYKTviYhy0H029Uh8Rf/y
         IKr7+ce2dApMEywY2M6X6Me9YDmgFljhI99MNpEjdkLLS5YJwcyKQojFdhFVwshcSvJt
         ZuTMEFhcXtfYsQ5iARfmTjFz+AK129j1omLVxYG+L/+FKUKzxnWVWnLcudywxkoet9js
         GokXB/b1fK28qPw+tcV0qD9kwSov0N8Sdnxvx/tHXp+9ieXQMC4+YKbbzWayNv+lRdGe
         Pm7yNR17ZtjTSrVWmuwKuhn7sIL5EQ5Wgl99sKSmcGSalOAWO7oW9IFB7e485WO7SgIL
         +xuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Iwhehk1D5teUPQa3Pbw6P6ryufi2U80Sy5wMygLs6WbXKdRA7pyZodvfnoWHih7JieIFmz4dzC/Pt9OiOHww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnEaaBJvhtfvkk17phmf8CbYz3DYHODODIaodyMOCPYp6DSgaw
	RbsxhblWY3TYY9mYYfdzpgqy/EVqq3m8pC/RgJvAgsZDn+uS/bO2BzztJHY3bW2JlFs5fkge/Bl
	uKQQU9MpMTzsTfEHxu2TxcPzCnv/4SNryBBC3MlU5
X-Gm-Gg: Acq92OHGUjh5x/HwcpcdL0p8fWaS71H5xfgkmB2+iibks7qMyKJarriof8C5dNYc7Jx
	TWE9ful/EqkkiYSklnbP4Wz8Na2+xuY//TLEH6/NRELURNC6g8sQW3temQ+zJH4NHV5BoaEQ7Zl
	xJXodYfEKjdoUgnzUyJTE7d08BuY1Wrzmtd1PHRFyctveJTdyjhVb9noQD14QG0SczPqIi4f37i
	2m8f895nn/wttzES3o8lJCtYhNRc8BsbA4Mc+fb2XRcFgtWDhg/LPWO7cfxeoezuov7I4S0DX0k
	Yxp15Ohs/ZxeGZLlRw==
X-Received: by 2002:a05:6402:10cf:b0:682:a2f:a15c with SMTP id
 4fb4d7f45d1cf-683271a79d3mr59165a12.11.1778769941669; Thu, 14 May 2026
 07:45:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513224608.1859737-1-jmattson@google.com> <20260513224608.1859737-4-jmattson@google.com>
 <CALMp9eS4s9tsOmvDUDeqS7oph0mSHyhxBiULQdwHVaG+7gXLSQ@mail.gmail.com> <agXcKDjnJc9DPcyr@google.com>
In-Reply-To: <agXcKDjnJc9DPcyr@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 14 May 2026 07:45:29 -0700
X-Gm-Features: AVHnY4JYNiOdZV1RRg0bwZU9VVOOCRJGJfNWSac97RU4N7K2DxmR7r5ouTnF8Qk
Message-ID: <CALMp9eS831M153QmAgjzJcR2dFY_wCCCzDisd7_T6GyS3-gAFw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] KVM: x86: Virtualize AMD CPUID faulting
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, shuah@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, ctpence@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 7:28=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, May 14, 2026, Jim Mattson wrote:
> > > diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
> > > index 95d09ccbf951..fc96ba86c644 100644
> > > --- a/arch/x86/kvm/cpuid.h
> > > +++ b/arch/x86/kvm/cpuid.h
> > > @@ -185,8 +185,9 @@ static inline int guest_cpuid_stepping(struct kvm=
_vcpu *vcpu)
> > >
> > >  static inline bool cpuid_fault_enabled(struct kvm_vcpu *vcpu)
> > >  {
> > > -       return vcpu->arch.msr_misc_features_enables &
> > > -                 MSR_MISC_FEATURES_ENABLES_CPUID_FAULT;
> > > +       return (vcpu->arch.msr_misc_features_enables &
> > > +               MSR_MISC_FEATURES_ENABLES_CPUID_FAULT) ||
> > > +               (vcpu->arch.msr_hwcr & MSR_K7_HWCR_CPUID_USER_DIS);
> > >  }
> >
> > Sashiko raises a good point here about a pre-existing issue that
>
> Calling this pre-existing is a bit of a stretch.  I'm guessing VMX doesn'=
t check
> the #GP before the VM-Exit (checking #GP before a VM-Exit is so stupid).

Per the SDM, volume 3, section 27.1.1: Relative Priority of Faults and VM E=
xits

> Certain exceptions have priority over VM exits. These include invalid-opc=
ode exceptions, faults based on
privilege level,1 and general-protection exceptions that are based on
checking I/O permission bits in the task-
state segment (TSS). For example, execution of RDMSR with CPL =3D 3
generates a general-protection exception
and not a VM exit.2

> Yes, KVM technically emulates MSR_MISC_FEATURES_ENABLES_CPUID_FAULT for A=
MD, but
> we're firmly in "making shit up" territory when reasoning about the inter=
actions
> between SVM and a feature that doesn't exist on real AMD CPUs.

True.

> > probably warrants a fix before propagating it further:
> >
> > > Does this emulation of CPUID faulting respect architectural fault
> > > priorities in a nested virtualization scenario?
> > >
> > > According to the AMD APM, if CPUID faulting is enabled, a #GP fault t=
akes
> > > precedence over a CPUID VM-exit intercept.
>
> Where in the APM?  I can't find anything in the description of CPUID or C=
puidUserDis
> that specifies the priority, and "Table 15-7. Instruction Intercepts" is =
flat out
> wrong because it just says:
>
>    CPUID  CPUID  No exceptions to check.

APM volume 2, section 15.7: Intercept Operation

> Generally, instruction intercepts are checked after simple exceptions
(such as #GP=E2=80=94when CPL is incorrect=E2=80=94or #UD) have been checke=
d, but
before exceptions related to
memory accesses (such as page faults) and exceptions based on specific
operand values.
