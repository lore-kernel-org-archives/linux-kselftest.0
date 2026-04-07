Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C7C373C16
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 03:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775531322; cv=pass; b=cxEnWubGmq87FdwTa1R1wGkgc75q2YDPuuARBO/PEIn3mVl2kICejn8XFm2pcRU5LoYNhCUGDW2AhCb9t5k9ujc5a+9IlRyLkBRKa5OsUuJGZ2va7wKb1JgmIyVhluFpDZSdPDwtncu7U6zB66PlTOhV9IY4kfpgmcdTER8jFXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775531322; c=relaxed/simple;
	bh=k52uxGJG3jRTUKdJZJj0k217ALr5NF1LnUBSdh34lh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AfiSWyP/NqBAqFieX02hYUAaP5g/tyz3sJQKnZlyQHIH56wxQndCfGbxc6lNOHyQdoUQGEVItgwVI28j1AiBbSJlPdP+rCLhK/zDg21J97LOTxNXstixhDSR/ZYyAqDVYHMxR/iz0xSnJ2CsJ3wZ4WZsecPGzsna222DcSs2NwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MkYoQjnU; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MkYoQjnU"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66ba6d3dab3so32125a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 20:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775531318; cv=none;
        d=google.com; s=arc-20240605;
        b=X2RE4VAM6ag/9toNr3cW/CR93rDrMAtYye+kGGJ8ngAF2n/Qy8oddrdb8TtGic4Fyq
         6ZaAvVM8BB3BU7cw8RB63zMGGneWfkniSJ6sjYqHmY7gjB6+5COblkQEaWz3bbo640QY
         8wEodL82J2JCzKf33kPe9Tx1+BxaiE2BWKtkzI68bSw9WWarvAdxBKDLcVVM0XuGpCwo
         Cy0oxoWNMrI655Rzj1oRuX8v1qH83uci/0OTAVcgHhBHOg20t7qCNJ+G4QmnBZ40Fb6z
         Q0OiNCxX/9+kRJkOLpw4wt5icUy0IonUDK0hZcvhVMYFNOayB6F2LXuPToV+HM+Y6aWt
         1b4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Os2DnFhuf2hlJiSlOQD5vo78MAgCiDjrBPYSDLDhp6o=;
        fh=/q/R4oNgBBNs4zOtQc0UOXaRZCP/hy7c3CG9X82nLgU=;
        b=ATO2LN6cmcFdVXBgd0y4tZESxev0t5cCO302R1iFd+YRRicY7IlpUwMQNlkPB8WgBd
         u8tlOITHFW5my+eLaKNFZN/uWhwHXa7knW8Vk1Zxsgcz1uxm81KAgbEp6Ad5ph3fmhaZ
         PFpmSu9+mqRgZA5hIimjlUTZuJPUNWdVaoPS1uIYKUqfLza0aiv3HcyO6p0mzBxNXkUn
         M1c2K8mqQfNSr+46wuydGs658WBVH/IHvzIrWdyfq2qyM7+eituHf2aKJ7sTf6NBhDyo
         I/aU5pswQUqP5z83L3mMspz29DDi3GY4nqu7gBcH7CwfgvdFIYfa/Pp828K6RnWQL0ve
         MhHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775531318; x=1776136118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Os2DnFhuf2hlJiSlOQD5vo78MAgCiDjrBPYSDLDhp6o=;
        b=MkYoQjnUmhgKuKQ6lvjIpUktuPCReOABqRskVehuWDVipJWvg3KPLZFm+aRxtxQLcF
         POFpe2zNDRLtho/H/mYfEaarrXwI6HptEem6VUIQYEJXxTs5CCploFA40J1Wj5v+fUhq
         gL4iM0f6Vct2r81oL7CCxzgcZV05mBfv6LFO5dcsWgjLIBZr0/LaUVYVsWbtjVsf9BL7
         zPO+/3cuHTxs0OgBB8GNRE4Z3J3tR117GWp4at/u691lqlF13wuKjzTH+h8kO1icsoXs
         4BmgbCacqGFPunmK/hIbD5u3fI3GAABaj6l+20bgSlAtb6N+8vD17ldQkT5kAZZ7lwkz
         Qe6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775531318; x=1776136118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Os2DnFhuf2hlJiSlOQD5vo78MAgCiDjrBPYSDLDhp6o=;
        b=DU8G/w9YMpB86eHmPv6YM7rWvWiJ75ch27pd3mSt0nQwfOA0c353JOFQmcE1dh1DQQ
         YwwBrZfXDLpWGOtWCKbhKOarE+48PFbmhhadqGw4oI7G78z1Ln1tfLS802Pp1tc+AG/G
         EXk2HGHUMLTRHqFRfVSyzQGqmkY9PA4kScYw2dyAcm9x5ML5uVQSvYeCS0gcpNv3oCYl
         leFLfDNalydG9yNMXzn65nxzxKBKk90tIxmFRARnWCWxQTpvGBTO7ULuQ+S4uxT14WXv
         b5f7VKzty7kYLANl/LyRMlD0ymo175FfcF0729oX3KudlYbPA150aXB9hl9uG8O4/ihz
         MQ1w==
X-Forwarded-Encrypted: i=1; AJvYcCWyCPRb+6IZCWIDDN+n/mIg0VppsJFviTfBZOzySshqfGtM54IYkIqZMWDpKZA5HCHM4DkP2oikNt7VaBX7M5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHW5TljMWADCPD0264K8IJCuhF9E6+HSp3HilLVhJ+VLuaNV+u
	jjxJ0Q9zkSa9Yb3rHue906kZkMQ4A68oynW7GD2b+jEtQDZUHWZucaX6BvA7mM4dxNYLEWSsKWP
	1+pC9trk7mogrI/MNhq1N+1vpG5o4Aa3x3A15WFWI
X-Gm-Gg: AeBDiet3B9ALWaiJq3tOmNS/XwPCDxI9c5Jw89PpoKuFqTFKPIk70uHkMTwPdZJ+UVT
	XU7yTCkKxDnlNAeOubJ/3vg35D1Zw1DP1BlK0nggeTanWxfD3eB3ta7ebAHIDpIZr5yIQLxKOTv
	/Z0SgqIPbb2xGihTu/f0t3JqGmna7SXHfoyOUjtYv8/K6fZKEPeT+B40WD0mwKsIWAgIAj/+YQI
	9lOmlf7GnxocWjHfsPgqnpQqGahM5VAd8dPIDuXdkXyjofPabH6k9QCcZC4qSh63lKTeqIeFQUp
	MudIUwSZNQhKjt1lcQ==
X-Received: by 2002:aa7:d44a:0:b0:66b:860f:3799 with SMTP id
 4fb4d7f45d1cf-66e43f30587mr117520a12.9.1775531317160; Mon, 06 Apr 2026
 20:08:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234023.2659476-1-jmattson@google.com> <20260327234023.2659476-9-jmattson@google.com>
 <adRGLPrmBpX-3DdX@google.com>
In-Reply-To: <adRGLPrmBpX-3DdX@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 6 Apr 2026 20:08:24 -0700
X-Gm-Features: AQROBzC8X9Gxsb_fQZyGU7iYS90MtfxxpD0EqXLCCJdCUeZKGIMxWSh5vBrbGnc
Message-ID: <CALMp9eQsd0fRuDE_R57Mn6-N6jCtbmoPAh7Y7CBdMEZJaNSUGQ@mail.gmail.com>
Subject: Re: [PATCH v7 8/9] KVM: x86: nSVM: Save/restore gPAT with KVM_{GET,SET}_NESTED_STATE
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 4:47=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Mar 27, 2026, Jim Mattson wrote:
> > @@ -1918,6 +1921,7 @@ static int svm_set_nested_state(struct kvm_vcpu *=
vcpu,
> >       struct vmcb_save_area_cached save_cached;
> >       struct vmcb_ctrl_area_cached ctl_cached;
> >       unsigned long cr0;
> > +     bool use_separate_l2_pat;
>
> Land this above "cr0" to preserve the inverted fir tree.
>
> >       int ret;
> >
> >       BUILD_BUG_ON(sizeof(struct vmcb_control_area) + sizeof(struct vmc=
b_save_area) >
> > @@ -1993,6 +1997,18 @@ static int svm_set_nested_state(struct kvm_vcpu =
*vcpu,
> >           !nested_vmcb_check_save(vcpu, &save_cached, false))
> >               goto out_free;
> >
> > +     /*
> > +      * Validate gPAT when the shared PAT quirk is disabled (i.e. L2
> > +      * has its own gPAT). This is done separately from the
> > +      * vmcb_save_area_cached validation above, because gPAT is L2
> > +      * state, but the vmcb_save_area_cached is populated with L1 stat=
e.
> > +      */
> > +     use_separate_l2_pat =3D
> > +             (ctl_cached.misc_ctl & SVM_MISC_ENABLE_NP) &&
> > +             !kvm_check_has_quirk(vcpu->kvm,
> > +                                  KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT)=
;
>
> I vote for either:
>
>         use_separate_l2_pat =3D (ctl_cached.misc_ctl & SVM_MISC_ENABLE_NP=
) &&
>                               !kvm_check_has_quirk(vcpu->kvm,
>                                                    KVM_X86_QUIRK_NESTED_S=
VM_SHARED_PAT);
>
LOL! Aren't you the one who keeps complaining that my indentation
doesn't line up? Are you schizophrenic?

> or
>
>         use_separate_l2_pat =3D (ctl_cached.misc_ctl & SVM_MISC_ENABLE_NP=
);
>         if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM_SHARE=
D_PAT))
>                 use_separate_l2_pat =3D false;

Wow. I really have no idea how to predict what you're going to want
the code to look like. How is this better than the original?!?

>
> > +     if (use_separate_l2_pat && !kvm_pat_valid(kvm_state->hdr.svm.gpat=
))
> > +             goto out_free;
> >
> >       /*
> >        * All checks done, we can enter guest mode. Userspace provides
> > @@ -2017,6 +2033,10 @@ static int svm_set_nested_state(struct kvm_vcpu =
*vcpu,
> >       nested_copy_vmcb_control_to_cache(svm, ctl);
> >
> >       svm_switch_vmcb(svm, &svm->nested.vmcb02);
> > +
> > +     if (use_separate_l2_pat)
> > +             vmcb_set_gpat(svm->vmcb, kvm_state->hdr.svm.gpat);
> > +
> >       nested_vmcb02_prepare_control(svm);
> >
> >       /*
> > --
> > 2.53.0.1018.g2bb0e51243-goog
> >
