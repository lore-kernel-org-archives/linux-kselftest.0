Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3300307AD5
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064873; cv=pass; b=VMkAr0igjjmPKanjn+xH3P3/Fprg3Xuji1DDlAjYSN/WABx3l6HaXRj6DhH8dbxeip5ire9jbCfv+VDy2uq6X3OUqe4vDnYxuniWouLe7KHn9MEaDErf9XW4XfAy/50YTRklnMkf7xRxgILmPPvMif+qk365OE9AiugsIpbfOsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064873; c=relaxed/simple;
	bh=06KjNwAaG6bm5+TYQv5otpaksSAxLs/PjhIpum3xg4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHpF25+19jJregvWPty7V/PsDHhqiB6l8mmeAkvFWipvT+8HM0/y/Y+wvuUgtz6FPgu8satTBBH4obPya8nuB6H+Q+XZQXDkJwOfQxIScQ3BPwfYxq6Hj7faEkTlIloAn0+5GNYpuCnETeE6dMiU+JlPpdxMkt941Rgsz0K7yxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rgGj6aOS; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rgGj6aOS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65821afe680so128a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 12:41:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770064870; cv=none;
        d=google.com; s=arc-20240605;
        b=ZkuaYtOaQdQjfelTwCBYt4w8NRFZ8JIIqmYtZPUPaB2c1MGj/dWqxjRNvjGOAoB7QH
         Ci6Zrj6FWy6HIzA1w+OGQHVs3cnSrm3ciH5urS4LjeG6IZZ6Dk9KjrEu1iCQ81dgG0Rx
         96DLqJ+6O5p8sW6r88d0boqwRGf5TyE+D+t9uQnu+dTcC5R3+b9EdB8pTb7YrOrR52iF
         4rxATIVwFDgOVymT37J6ybMCS06gigArmGGHDvkQHZnyNIVnlaOwe6J4BnGfV0R/eH2u
         p9BWUtntEfzH1/kM6pEqdbYzl/LjGpiFmD/whJ89TJsmS+bXQzQH1wW+x5KOj/5RmvJ/
         /PEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2IMh41X3lfsz0vhQymTprdXfmdt4B+CuibsxTGA9cUQ=;
        fh=XQfaDbBhbB3BW0DUrVpx8H0nDbzzX6MzcQjlcxm6wfY=;
        b=WDXybhFunmhO/c9Rzj9xbMc4d3KLG0GZLNBYjzJaCUFKjc3Td0MiewZnqHeU/8gi5d
         uHhhqwJJTMG0ufIr+i/772jBCd2/9W8qXqU96p7aQ74qbD0unO8/8pd4QczEf70C7Q87
         VvjM9xQZxY+5MkEk0mytRQ7b3dCjt11GtQkeeOi+DRAfiZMwcn6XbUgw2jwKn67PAU/m
         68kzcFC1/FoK2xn/oxjBiRRbblE16E0SgLC98I4wzFLVkxZl+UCJJxhwNNUIbVO7oaFo
         GDIfE9LWcjE0KhNs17S6wmg1WSSH0n1UeTeu7CUxU4DT0LUUeN/vomP/dwo9n5alvlYd
         JTDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770064870; x=1770669670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IMh41X3lfsz0vhQymTprdXfmdt4B+CuibsxTGA9cUQ=;
        b=rgGj6aOSvZkNqQHpSH0CvpauW+Er0eKOBGeiWsJZaKnFdNTATmIysIsesnxEfSvBaE
         +AqDrEkTUQrKYDHhZhZP4/KeEmaeIEIaZO+GrdoAd5OrDOkopJMCdN2jEI4+o32baLtl
         JTRyOCr9H7AQ/KrZLW41i6M8wtjPReXqJF4XwZ2bw4D2qZmff51GLiYmqky+rrDPTPGo
         ONw8RboNTqySKij5F/JOxIA5Ez5AAWyobm4fC19/JtXvdvNzDBMNjJIzVuOFZNhjfqNl
         LqJyad4ddfAAo3rChZxc48/J+wihO6j0zc5EEsDH8b9ZckqCCJBLYfnXx4oxTwabnHlE
         PW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064870; x=1770669670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2IMh41X3lfsz0vhQymTprdXfmdt4B+CuibsxTGA9cUQ=;
        b=oUIJi65bSF6dZ/19SWqh8/LsmSzsn/iK9s8aSqdJC3pG5+op6GnDAWuWQc8f6qAgJZ
         B4BBmSBFAdygYGEctXvuC10YEfZehUbqCQ+vD8PERQmL9yIy2czjjxssbYfznwh0eYff
         CJiOwb1AxK9cSOrX0WFxhKzA3LMsOhDqDhTlHuJE27nantY5OUSUoF5/bb5HsRInscxZ
         ZC4it9fsl8TSKgf/6ACWzWnAvLVw81qL8X5nedhxVR98tn/MhTvwtsegeTKUz9vO8hmK
         lbwq5TOHub9qpjbHPPvWFXsCD6b7FGnElNpQh/8W0J7a94c1ITv/vu37DA91xu7GK0iq
         uRfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkCzEkmv67b6molpKmz4NSNH6ZE07fpS+dZyrwWw7KDEatS/p+hkWngKML2aeXpiVoauc84scTq06z5/Ld2DY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxIzKj9TDqBOZSax12YQ/rC6WgfvRKuknEB1F0H3I5B/pIfSZq
	YAUuDvDHESCZi5fn+vxmDw9phgq8KhcjNUh3jlbNqmtJ8K1N8qi44X5RobQWc1HWpYj+WkSYrHe
	IrB43Y32aPVw8k8ivBpH0lqSxZaTGlHSwB7a3W4kJ
X-Gm-Gg: AZuq6aKiT5V6jZf90ZqRjesEHiELFgpO4PmUrfPAZ/uyoY5iTGkifedf2ZRFECcf2oU
	topDfpQhZyR1dc0hyf3Z6C/wKrEvsrrBV45U2RzM30zHhisAizsE2Io/mN24tXiCiiLqgsgAAop
	Ggj9ESr8PsH/381Vc+/k7zC8mkIObJi0eD0RgulxSCL3pW2nj6rBTpInDOogOjQjr7HWc2QnKyr
	Bkmg/xGB0RtTyoAiiG7vkO96CPS8Swxgz6Ri46Pqu/qF22tTuJkK5ObgWyARmvhlwxtRcqNzr4O
	FzuMcQ==
X-Received: by 2002:aa7:c3c5:0:b0:658:133d:8eb9 with SMTP id
 4fb4d7f45d1cf-65933dfca2cmr9220a12.2.1770064870080; Mon, 02 Feb 2026 12:41:10
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115232154.3021475-1-jmattson@google.com> <20260115232154.3021475-4-jmattson@google.com>
 <mcxo54ct7bsu2d6xmalpsae6wq32ykjh6dd4kfgcgru474dqre@47flraln5zz5>
In-Reply-To: <mcxo54ct7bsu2d6xmalpsae6wq32ykjh6dd4kfgcgru474dqre@47flraln5zz5>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 2 Feb 2026 12:40:58 -0800
X-Gm-Features: AZwV_QjDlpKgTWVJhvtudgSKth7iSkip7p3g3HVeq5o303u-FKzAbkVZnMyhL64
Message-ID: <CALMp9eS+s=GM6Kr1Lfrx0S7bM174N0FQ6DepTTVMRnrDij0Ltg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] KVM: x86: nSVM: Add validity check for vmcb12 g_pat
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 5:41=E2=80=AFPM Yosry Ahmed <yosry.ahmed@linux.dev>=
 wrote:
>
> On Thu, Jan 15, 2026 at 03:21:42PM -0800, Jim Mattson wrote:
> > Add a validity check for g_pat, so that when nested paging is enabled f=
or
> > vmcb12, an invalid g_pat causes an immediate VMEXIT with exit code
> > VMEXIT_INVALID, as specified in the APM, volume 2: "Nested Paging and
> > VMRUN/VMEXIT."
> >
> > Update the signature of __nested_vmcb_check_save() to include a pointer=
 to
> > a struct vmcb_ctrl_area_cached, since the g_pat validity check depend o=
n
> > the nested paging control bit.
> >
> > Fixes: 3d6368ef580a ("KVM: SVM: Add VMRUN handler")
> > Signed-off-by: Jim Mattson <jmattson@google.com>
> > ---
> >  arch/x86/kvm/svm/nested.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > index 07a57a43fc3b..e65291434be9 100644
> > --- a/arch/x86/kvm/svm/nested.c
> > +++ b/arch/x86/kvm/svm/nested.c
> > @@ -369,7 +369,8 @@ static bool __nested_vmcb_check_controls(struct kvm=
_vcpu *vcpu,
> >
> >  /* Common checks that apply to both L1 and L2 state.  */
> >  static bool __nested_vmcb_check_save(struct kvm_vcpu *vcpu,
> > -                                  struct vmcb_save_area_cached *save)
> > +                                  struct vmcb_save_area_cached *save,
> > +                                  struct vmcb_ctrl_area_cached *contro=
l)
> >  {
> >       if (CC(!(save->efer & EFER_SVME)))
> >               return false;
> > @@ -400,6 +401,10 @@ static bool __nested_vmcb_check_save(struct kvm_vc=
pu *vcpu,
> >       if (CC(!kvm_valid_efer(vcpu, save->efer)))
> >               return false;
> >
> > +     if (CC((control->nested_ctl & SVM_NESTED_CTL_NP_ENABLE) &&
> > +            npt_enabled && !kvm_pat_valid(save->g_pat)))
>
> If this lands after "KVM: nSVM: Drop the non-architectural consistency
> check for NP_ENABLE" [1], the npt_enabled check can be dropped, as
> SVM_NESTED_CTL_NP_ENABLE will be cleared if the guest cannot use NPTs.
>
> [1]https://lore.kernel.org/kvm/20260115011312.3675857-16-yosry.ahmed@linu=
x.dev/

I don't see it today, but I will probably forget to keep checking. :)

> > +             return false;
> > +
> >       return true;
> >  }
> >
> > @@ -407,8 +412,9 @@ static bool nested_vmcb_check_save(struct kvm_vcpu =
*vcpu)
> >  {
> >       struct vcpu_svm *svm =3D to_svm(vcpu);
> >       struct vmcb_save_area_cached *save =3D &svm->nested.save;
> > +     struct vmcb_ctrl_area_cached *ctl =3D &svm->nested.ctl;
> >
> > -     return __nested_vmcb_check_save(vcpu, save);
> > +     return __nested_vmcb_check_save(vcpu, save, ctl);
> >  }
> >
> >  static bool nested_vmcb_check_controls(struct kvm_vcpu *vcpu)
> > @@ -1892,7 +1898,7 @@ static int svm_set_nested_state(struct kvm_vcpu *=
vcpu,
> >       if (!(save->cr0 & X86_CR0_PG) ||
> >           !(save->cr0 & X86_CR0_PE) ||
> >           (save->rflags & X86_EFLAGS_VM) ||
> > -         !__nested_vmcb_check_save(vcpu, &save_cached))
> > +         !__nested_vmcb_check_save(vcpu, &save_cached, &ctl_cached))
>
> save_cached here is from vmcb01, but ctl_cached is from vmcb12, right?
> So we're conditioning the PAT validity check on L1's gPAT on NPT being
> enabled for L2 IIUC.
>
> Perhaps we should pass 'bool guest_npt' instead of the cached control
> area?  Then we can just pass npt_enabled here IIUC.

I'm going to cache it on its own to avoid confusion.

> >               goto out_free;
> >
> >
> > --
> > 2.52.0.457.g6b5491de43-goog
> >
