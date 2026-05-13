Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA61386556
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 16:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778689492; cv=pass; b=hKy36aSO8xLeqGPuPKoiGR1tHlKg07TdW/PZrjhosxfH45OLEyp7mw/lBsFem8N88NokY+prZ7OcuoJZuQrmZ8/5hagk6TV5N0evUhGCrmfU6gAGCNytopnb4EbS7y7hreFjmsomGptnN2I2OvtTfJeP6zZTjOKI5PjH4K+Tf9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778689492; c=relaxed/simple;
	bh=dFqjGcDESPJs1sYvvaTVqiEjpmMW73N7IioLhMndVnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FN6N5X/uGw8PwhzQN1rIydSKmv4Y4NXr2hBOKrMuPlIRRPmpcK6wQxhvVUQGWxhfKLm3ObFH/VzL/Dk0SamGOpGpme6IemLtxV2j9uzLBqkf4WyJB/Zt8qmFqarOVtCPhGHCJvOV4mJ5HRzuAmeVVB+RQJsYf7aGY9kiZDuWnF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fo1Ql9qu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mek9Z9pm; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fo1Ql9qu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mek9Z9pm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778689489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LFP7K7Lzf/qFmjwBHFqhDwhsq/kaKAVcEgRqthL+0Is=;
	b=fo1Ql9qu2pWnPsuid8jQ/6rXLj8Da3Ix+cKCw/bu/yxE0aFZgU9xmSU6DtJrZr+myhOLWZ
	J6PAot98b6q1ZHBOcXd12VLrDEHjIwGtDZCpZaFvrz0ebP8+1yIBg38crnHdKllAw0ygso
	yi69Vbwj33m3j2u9FYKxpfWArbf7MDk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-E67yeK0QNWSW97LS08uM9Q-1; Wed, 13 May 2026 12:24:48 -0400
X-MC-Unique: E67yeK0QNWSW97LS08uM9Q-1
X-Mimecast-MFC-AGG-ID: E67yeK0QNWSW97LS08uM9Q_1778689487
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-458e7004f63so3450132f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 09:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778689487; cv=none;
        d=google.com; s=arc-20240605;
        b=Zsmx5fyHOCMGCmvt+Fic02pdfnH/O6VgPQ4cIl1s3mQtE6ZW9dT8NMHgNr686Sa/Bs
         lTcQAj4w4ZRw5QlxyN2CLv9ogjQaaJAJJunyQH/ynVRWUXWgiqzxlWWlLQ4f4obi3dq2
         Gs3R+KYh4suo+z0dqiMM8DbG7R+yN46jLWvLPlyXF/tremfOkI5w4T8ZzxZj6wiFe6z9
         K4+WVnRo43MnorvRBy68p4ydGAnhNtyfrmX30YYX5rgr8pxXLn3o3fhDY+je0FZAkC2b
         SWsVNVmXwXYXQybV8FsxPwFiHI/VTRcPdJerOg3ZCwtiPeAMJhJl4w4fMoT/7Ols7Z0O
         Y/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LFP7K7Lzf/qFmjwBHFqhDwhsq/kaKAVcEgRqthL+0Is=;
        fh=loYQoFZiHCvYPtMo4d+990IWbJq8DOIWFCyDqrVFCNU=;
        b=PJ77CcxZfFaYZdQJqjk46h1/SobQled9FzqvFdjw3bsSmXsBV0MzY4RPxwHkjhGYZ3
         YMOPkX3VS6hQUeJTw3IlUROGNNNaNeSgqk09N6k+/bpZPK1FDXlWosbdm+/r9Ogg5Mte
         CxDP5fnihmOdvP/RP0uQkhRZEhl7yxo/8NzbPvJ4Fx/izHsBwc8omufi2Lv2q88/YVp6
         O5r7D9NNBRBlc0Vui/I55LGBZrMBZIs9zvdVt1s/slwt88kCnUqZEwm+yCxT9YwU8ttN
         rw2VsjsHXDtjZ5lcly7Fa4xiwaVbp8jo15SkZvCrRWJ3sgVdpWyyvgNWKImgKVqDSeNw
         oZ0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778689487; x=1779294287; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LFP7K7Lzf/qFmjwBHFqhDwhsq/kaKAVcEgRqthL+0Is=;
        b=mek9Z9pmWWemhhRiws8b56KjPTzk/e5aY5vRWjHJ7gHJBU7hbcAtvNyMr+YWbsK7xl
         nMBoIriFopCFF9rV3KiRL7RCSMqGM1d0nxju3lTq9hvDGyfRaOtHhFRnLrhhHnJVt6xu
         XVBdXPHVtc2xhz/CJKb8+wJ7cS/Aw1CtDi5uuuQMbZhl/Ul4zRxf7wmGkFVkzLr8n9Uh
         DRTqwyLYdJ9QM2T3Bcz66QfNHiT6e4Q8hJWRKpAJzUM2UPKPXttkIVOHIoV89tK4cJLW
         YOoVtCiPLBq+RGmZ3Xxcjxo/ZWR4yN7/0MZe83frKyOb3S8eLdAXQrten/otu0KEF7fA
         AMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778689487; x=1779294287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFP7K7Lzf/qFmjwBHFqhDwhsq/kaKAVcEgRqthL+0Is=;
        b=VRrvc4YfFHqv+X4NtRezcBmZXgS0VHcqGpcA3T4NAnK3e74Usz3CUM3K84XdJubgBU
         AICE2xqcsD9HDZmC5qZ2fcMNU/nKK9UmGvFn3sBQQQqe4YADgmh+fph0Hx+uYGrPiYJC
         vnjOS/UCgnzSuqCGdm6Ugs/70UPA/hyOgD7ym4PP1LGYV22AfZuxxKq2dLub7ufWPNQ1
         73mYeTZ4B/o5aeIHYr0+1zWQ2ag0dA1dYy3YohFq1vrr/VAWSb9Vvo+JViIJorFro5mc
         N2wFnRqOLPfsImcTTkE4bfBhf6V8UgSjAa7a0fg6x112c/zF2VFJtSkSsdE4Cvt211wf
         gsxg==
X-Forwarded-Encrypted: i=1; AFNElJ+Mo217Y/GdV+rOrxu33TC0o1gmUmY9sFeybqM7GICpjd0p0t0OLs1xGM9awaT1Fd30Sn0796pHsh0rd8f1ikY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRGGqaNp4mkf7rBimSGiECkFYs/vSGqiql8gxEDCKvedT6oAbf
	BeIl7NVTaPeZrVvSNHcYS92NhJvRS+FH80BU03Rux6K30zgwoVkjQgwL80KxA6oP2glOw7wsRQk
	q2xkXPnt6LVGNzaADkBNP07uCVeEH7BeVA2PIiHvqzbGz8Yo0lDakUEbLp4KCUupMoz3x47zBAx
	uqV4x6F1DH9Ze5RrtVNJ10BRo86rShWXcsZfPHgVbUewNK
X-Gm-Gg: Acq92OEnbK8HzwW/hFg0qvTYRCaRaoGyragFj3+EUn1ijeSlKO2yU9rDwaht5VQ8coa
	cJHlgmSgf2Y5R50Y6O2lCWBrWLWDYdwaYk3rEFqkx+7mSwWdKXkpYiLAH9lfsIdmIaZuWQqAq9B
	9AXmH4GRClOFvtjWzEmkPm/pHeEQDZDHFidadRguCSUIHLKNabsxCFNu892p6/kJSKveF+TNEGw
	frPE9raL9OX+fQ4QyJElj8oSjzA6rhuY0z+7pCWRilP2V6dn7K/ZaI2OQd+LG4+7eZ203AEUmyW
	89ajtNjc
X-Received: by 2002:a5d:5d0b:0:b0:43d:7d24:b4ff with SMTP id ffacd0b85a97d-45c7b85de69mr5836100f8f.40.1778689486810;
        Wed, 13 May 2026 09:24:46 -0700 (PDT)
X-Received: by 2002:a5d:5d0b:0:b0:43d:7d24:b4ff with SMTP id
 ffacd0b85a97d-45c7b85de69mr5836059f8f.40.1778689486387; Wed, 13 May 2026
 09:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6856b269d2af706eae397e0cf9c1231f89d9a932.camel@infradead.org>
 <6afc4b95-3c15-4d71-877d-19b84e91ce05@redhat.com> <57bc082f4824d6114d3156744c25986effc29aca.camel@infradead.org>
 <baff82ca-6321-4b16-aa61-b2d6d60b6535@redhat.com> <86h5obya2r.wl-maz@kernel.org>
 <48b06e5655d56ff6eda30e563b34894fa0eb2f07.camel@infradead.org>
 <ba08dfe9-932b-40c3-9fdf-fc891d52e1d8@redhat.com> <d9d4471a7f5ec1e297b3ca07f42a59090aa91e15.camel@infradead.org>
In-Reply-To: <d9d4471a7f5ec1e297b3ca07f42a59090aa91e15.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 13 May 2026 18:24:32 +0200
X-Gm-Features: AVHnY4JneGWlgI2TZN3pA0snVaHMgFYvSCN-3eBEab4JAE5jQOEAQHtyebNrVkM
Message-ID: <CABgObfaM-JtNn2MuYXaiadQnLfAhTEaoHAcTG9=J6LkMcQCJ3A@mail.gmail.com>
Subject: Re: [PATCH] Documentation: KVM: Document guest-visible compatibility expectations
To: David Woodhouse <dwmw2@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, kvm <kvm@vger.kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Jim Mattson <jmattson@google.com>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Eric Auger <eric.auger@redhat.com>, Kees Cook <kees@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, kvmarm@lists.linux.dev, 
	linux-kselftest <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Il mer 13 mag 2026, 15:57 David Woodhouse <dwmw2@infradead.org> ha scritto:
> > x86 doesn't do bug-for-bug compatibility, thankfully - we have quirks
> > but only 11 of them, or about one per year since we started adding them.
> >   We only add quirks, generally speaking, when 1) we change the way file
> > descriptors are initialized, 2) guests in the wild were relying on it,
> > or 3) it prevends restoring state saved from an old kernel.  Is there
> > anything else?
> >
> > https://lore.kernel.org/kvm/e03f092dfbb7d391a6bf2797ba01e122ba080bcd.camel@infradead.org/
> > is an example of a bug that "no SW can make any reasonable use of".
>
> I actually believe that the focus on ICEBP was triggered by some weird
> gaming software's anti-DRM mechanism, and that it *did* affect actual
> guests in the wild?
>
> But yeah, *fixing* it should not have any adverse effects. That's the
> key.

Yep, so "bug for bug" is not it.

> > That is *also* obviously nonsense though, isn't it (see example above)?
> > The truth is in the middle, "once it is in the architecture" is likely
> > too narrow but "once it is in a Linux release" is way too broad.
>
> How about "once it is in a Linux release and guest visible, and unless
> we *know* that changing it in either direction underneath running
> guests cannot cause problems".
>
> > And besides, both miss the point of *configurability* which is the basis of
> > it all.
>
> Hm, configurability *is* the point, I thought.

Yes, and configurability goes way beyond bugs/quirks, which are to
some extent a red herring. Configurability for example says that "KVM:
arm64: vgic: Allow userspace to set IIDR revision 1" shouldn't be
controversial at all.

> > So we have the third case, "restoring state saved from an old kernel".
> > If this case arises, I do believe that Arm will have to deal with it and
> > introduce quirks or KVM_GET/SET_REG hacks.  Maybe it hasn't happened
> > yet, lucky you.
>
> We literally have those mechanisms already.

I am not talking about guest-visible changes across save/restore here,
but rather about round-trips through userspace. For example, see the
effect of KVM_X2APIC_API_USE_32BIT_IDS on KVM_GET/SET_LAPIC: it
couldn't be made the default, because userspace expects to take old
data returned by KVM_GET_LAPIC and shove it into KVM_SET_LAPIC. Sucks
but can't be avoided.

> See commit https://git.kernel.org/torvalds/c/49a1a2c70a7f which adds a
> new guest-visible feature in revision 3, but allowed userspace to
> restore the old behaviour by setting it to revision 2. All my patch above does, is make it possible to set it to revision 1 as
> well. Because https://git.kernel.org/torvalds/c/d53c2c29ae0d previously
> changed the behaviour and bumped the default to 2 *without* allowing
> userspace to restore the prior behaviour, and we've been carrying a
> *revert* of that patch.
>
> Why would we *not* accept such a patch?

Agreed. Even ignoring your revert, there's no reason why any upgrade
past 49a1a2c70a7f has to be from after d53c2c29ae0d.

> Marc seems terribly insistent that we SHOULD NOT
> restore the behaviour that older KVM offered to guests, and we MUST
> change it unconditionally underneath running guests, making these
> registers writable on upgrade... and reverting them to read-only for
> running guests on a rollback.
>
> And there we do have a very different viewpoint.

That's the design decision I mentioned, of not starting the guest
configuration from a clean slate. I believe it complicates things
because you have to design from the beginning with the ability to
rollback to old versions and to potentially detect conflicts
introduced by the rollback. This is exactly why
KVM_X86_QUIRK_STUFF_FEATURE_MSRS was introduced: "KVM's initialization
of feature MSRs during vCPU creation results in a failed save/restore
of PERF_CAPABILITIES. If userspace configures the VM to _not_ have a
PMU, because KVM initializes the vCPU's PERF_CAPABILITIES, trying to
save/restore the non-zero value will be rejected by the destination."
(https://lkml.org/lkml/2024/8/2/1032)

For Arm, however, it may be too late to change it; if not, I'll
happily watch you argue with Marc about it. But even without that,
this doc patch (and the idea that "Where a new kernel introduces a
guest-visible change, it provides a mechanism for userspace to select
the previous behaviour") should be uncontroversial.

Paolo

