Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E873B3033FB
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 20:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770062538; cv=pass; b=K6B3i8G+33eM0CRGImG2cR328fDYMtAG1miW4jCBiav5OIQNWHqgdNYwjuFnBD9A1xAx6I8dA2qDcO4gsAyHbUQfVRMz87ZU2TlXZlv4ajirm1H0tJG68jOZEnJ5lxDY2Xt7HW9Jcgxk+VIUu5HtQIXupzIcY5KhFyH1o/HLcNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770062538; c=relaxed/simple;
	bh=7lX9Ih7l4XfaMkeJ1oadylNWhfI+0UdT+W46nB4oAnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mL/eTxjmmGWIvuu+bzSWOOX02+1pLv9XDGzCe0eEfCTbb46IyJ/ygZ66NIJxYphCtdszfyWShnbrySsy9BTsAoopZe50+MqzAR4boK/K/7OB5qu6nOYtQ3nMOAxAYy/jfe6AgfCIXOq3+AcrNd6Z9cZnAgNWHgvzK8o6xGbWrk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4ot8g1iR; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4ot8g1iR"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-652fe3bf65aso2301a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 12:02:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770062535; cv=none;
        d=google.com; s=arc-20240605;
        b=I5nzowpyufnxGRGZHox3VgJ7BVjaxoEpb4aLhKgz+KmjtJXJ+P4YDREFiEg55w5/mt
         nc7NumFIbKzWwCMgZBtNxWFipY0+OYDP4A5prqZQfjw+TvR8YuJLeFw+9H8vvDUTlFE2
         RUdiICEt5Ud2yG7yTx1qqkMYpNVL1YrddzxcXiOt9R5lj4u/ZdJdM8QjiEr1jXxdsYS3
         djVEDmbCukvRZtioa7Oe0rQXGdaAOkulWp+q1glQZ6e4IreE9b5ooq6Iu+vKOk7lUG9W
         YDOWSmU15wzqq84qqtsdXhsJzk29lK4lX/C3qo6t0oSV+G52/KpddcWkZk2yqvQgw0K/
         K5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aWOK8SirIwQa+Rz7v++tb+WC55K8rKSbXo1UX280qkg=;
        fh=9bcMzWPd3ev5qwxDHHxawVNwQjJWSsUQvEyYly/B+n0=;
        b=Pqx/82qtBqmudEDM6QbvvFhfmFDGuNj2qlLEWKbZgv5OEk9gfKmfMIvbUMaR4pW/i5
         YjFNgbPd6D28PoqRdNyEk8wVtGQvtacVR/nnBi0SQHllZXYA6N9FDKXUfyIAk/4igeBW
         qo+jA1FxX9PIMEfrdS+q8Af4K00lJ0mqoB63KyV43IyNnBRdinArjwFpi3pgKs+z5UQE
         1mTCUFYtZOIMllD/mHNkf1zBMHtESxuHwuUmbQR8YipPW7PANLmP8HlIrdmvWnQs6lmP
         bMID7lY+QKg/ok3iv4Jus+wYon91TsTBDqnpbFPkoOMe0/KMGUoB3e3fuTXkRp4O9YSX
         6SbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770062535; x=1770667335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWOK8SirIwQa+Rz7v++tb+WC55K8rKSbXo1UX280qkg=;
        b=4ot8g1iRGH5cKSOAiazJvQf73YPn0PLuLWtqf1bhSsl2hM8XrllCrZf2VkP4BEUhpF
         slvczL29aXeY0VSlIjv6ORPgpk0g0lN2ORgLiOT5dECEwWv+Cn92wKdmzuUXv4zRoDkj
         LrH46eQyMgdAGZgbdxckC/d6OtyV8siTHglKCL4/l9sLDV5tgyCE5/oJeBmgAd/e7zLz
         j5LWglyTkOBK0nSXVFU8FbwiUm9kKWIyutQP2WnIED0kCD+k5chR0eJ+iK9Q9zpY3LT4
         XoS2ks0NopimVCA23EA++CaJUgQmHh2zYPeC9M+lgOjBVmPtoLCA5H1PnWBUAxj2VCqy
         yqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770062535; x=1770667335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aWOK8SirIwQa+Rz7v++tb+WC55K8rKSbXo1UX280qkg=;
        b=jd+O5+tP+8jrWmv6OLfXB+PgDn1GLllu3L3GFR3lWm7DltGUQQ9zUqwDo7sYcsyNbo
         tk3y5x/59N+LO7DKF9skkKET0IUPs27ifFTdpe6u22aBC5cUxxlj720ZOvOZMj3eamd/
         k2nIQhsffXgU1sw8hwwaiRppBpTu31WS79Nau535off8NrE9htWMaB3XhMyEydsCRsbT
         4PddD37DdWKrfRiUUqk/Mj8rqNArb+F5rWnPdJLsvU4K37j74iB5mXlooRsOZlB3O3sL
         fg4Zu13Ze0Zlp9+KEImFO/DQYjMD07YrF2G3QqQ5enXOmWFp+tafOEuuLs5Rw98n+Wq5
         Tt0g==
X-Forwarded-Encrypted: i=1; AJvYcCXmPpmkWB/bxCERJuK1bqAp4btFnX7Ikb5iOf6zGyW0G6eryzFqB8cDV5NwwIrVUd2TDRJBqo2wN6Wkdfoxx0k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy78j/5GcYAF/L5wFB6zLhaOn84QiD55fGPtxBBZkqYzXG6Xeq
	w92Ru9lK+hirQR6FXLEaMvi0aS9YoErDLnHwnoqFF5uzoKwZy/f+QR3mTMVD1su6VtbLqbDLL0D
	s1+UvdA1n/EyHNm9yQ1b3DQH+dZQyi1jIZMJH8YgN
X-Gm-Gg: AZuq6aKGbUy9ulVbi1/PbsyGJwOPYq0cT+cEP0FZ5zcmun52p/NmE5W4GGaHozMlTjA
	Tvpu6Al8Az4qdW6mTqZEz1jlRfTOEWIIu4Uw1PX4iT/+ppNedzqFKSZH4ss3onatXbhxmzaW6+y
	ydD1JHXHDpXhoccI5kozUeicwlX563kbK4R1/ckygoXh6+/NQF+0EH+l9us+iVEEbkEjTt2IZ4v
	W57mdwuVdfY5FYDiYY8USOwlZMXtT1isvHI7i22Xzlhl4snKYQzE2CPfAhP0RF7un09VoAQNFjj
	BQAUBA==
X-Received: by 2002:a50:ec95:0:b0:650:5d5c:711c with SMTP id
 4fb4d7f45d1cf-65934e28d85mr5208a12.17.1770062535039; Mon, 02 Feb 2026
 12:02:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115232154.3021475-1-jmattson@google.com> <20260115232154.3021475-2-jmattson@google.com>
 <5jwnuhsfer2eovcran7zfyjh7jjrc4zdjgimuipympjnznq7gr@fxdpszsihgup>
In-Reply-To: <5jwnuhsfer2eovcran7zfyjh7jjrc4zdjgimuipympjnznq7gr@fxdpszsihgup>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 2 Feb 2026 12:02:02 -0800
X-Gm-Features: AZwV_QiP4rEF0n2fXbRIdhissEKmJ5oaEqU37lHYtMEYfcEtHxcde_QEK8T-G4A
Message-ID: <CALMp9eTfph1ijT_cjjLM0RRbBJomc4_34rbG7K_BbJ-3X25b=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] KVM: x86: nSVM: Redirect IA32_PAT accesses to
 either hPAT or gPAT
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 5:21=E2=80=AFPM Yosry Ahmed <yosry.ahmed@linux.dev>=
 wrote:
>
> On Thu, Jan 15, 2026 at 03:21:40PM -0800, Jim Mattson wrote:
> > When the vCPU is in guest mode with nested NPT enabled, guest accesses =
to
> > IA32_PAT are redirected to the gPAT register, which is stored in
> > vmcb02->save.g_pat.
> >
> > Non-guest accesses (e.g. from userspace) to IA32_PAT are always redirec=
ted
> > to hPAT, which is stored in vcpu->arch.pat.
> >
> > This is architected behavior. It also makes it possible to restore a ne=
w
> > checkpoint on an old kernel with reasonable semantics. After the restor=
e,
> > gPAT will be lost, and L2 will run on L1's PAT. Note that the old kerne=
l
> > would have always run L2 on L1's PAT.
>
> This creates a difference in MSR_IA32_CR_PAT handling with nested SVM
> and nested VMX, right?

Correct.

> AFAICT, reading MSR_IA32_CR_PAT while an L2 VMX guest is running will
> read L2's PAT. With this change, the same scenario on SVM will read L1's
> PAT. We can claim that it was always L1's PAT though, because we've
> always been running L2 with L1's PAT.
>
> I am just raising this in case it's a problem to have different behavior
> for SVM and VMX. I understand that we need to do this to be able to
> save/restore L1's PAT with SVM in guest mode and maintain backward
> compatibility.
>
> IIUC VMX does not have the same issue because host and guest PAT are
> both in vmcs12 and are both saved/restored appropriately.

Correct.

> >
> > Signed-off-by: Jim Mattson <jmattson@google.com>
> > ---
> >  arch/x86/kvm/svm/svm.c | 31 ++++++++++++++++++++++++-------
> >  1 file changed, 24 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> > index 7041498a8091..3f8581adf0c1 100644
> > --- a/arch/x86/kvm/svm/svm.c
> > +++ b/arch/x86/kvm/svm/svm.c
> > @@ -2846,6 +2846,13 @@ static int svm_get_msr(struct kvm_vcpu *vcpu, st=
ruct msr_data *msr_info)
> >       case MSR_AMD64_DE_CFG:
> >               msr_info->data =3D svm->msr_decfg;
> >               break;
> > +     case MSR_IA32_CR_PAT:
> > +             if (!msr_info->host_initiated && is_guest_mode(vcpu) &&
> > +                 nested_npt_enabled(svm))
> > +                     msr_info->data =3D svm->vmcb->save.g_pat; /* gPAT=
 */
> > +             else
> > +                     msr_info->data =3D vcpu->arch.pat; /* hPAT */
> > +             break;
> >       default:
> >               return kvm_get_msr_common(vcpu, msr_info);
> >       }
> > @@ -2929,14 +2936,24 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, s=
truct msr_data *msr)
> >
> >               break;
> >       case MSR_IA32_CR_PAT:
> > -             ret =3D kvm_set_msr_common(vcpu, msr);
> > -             if (ret)
> > -                     break;
> > +             if (!kvm_pat_valid(data))
> > +                     return 1;
> >
> > -             svm->vmcb01.ptr->save.g_pat =3D data;
>
> This is a bug fix, L2 is now able to alter L1's PAT, right?

Yes, L1 and L2 share a PAT today. The whole series is fixing that mistake.

> > -             if (is_guest_mode(vcpu))
> > -                     nested_vmcb02_compute_g_pat(svm);
> > -             vmcb_mark_dirty(svm->vmcb, VMCB_NPT);
>
> This looks like another bug fix, it seems like we'll update vmcb01 but
> clear the clean bit in vmcb02 if we're in guest mode.

I will split this out into a separate patch, since this is tangential
to the rest of the series.

> Probably worth calling these out (and CC:stable, Fixes:.., etc)?
>
> We probably need a comment here explaining the gPAT vs hPAT case, I
> don't think it's super obvious why we only redirect L2's own accesses to
> its PAT but not userspace's.

Point taken.

> > +             if (!msr->host_initiated && is_guest_mode(vcpu) &&
> > +                 nested_npt_enabled(svm)) {
> > +                     svm->vmcb->save.g_pat =3D data; /* gPAT */
> > +                     vmcb_mark_dirty(svm->vmcb, VMCB_NPT);
> > +             } else {
> > +                     vcpu->arch.pat =3D data; /* hPAT */
>
> Should we call kvm_set_msr_common() here instead of setting
> vcpu->arch.pat? The kvm_pat_valid() call would be redundant but that
> should be fine. My main concern is if kvm_set_msr_common() gains more
> logic for MSR_IA32_CR_PAT that isn't reflected here. Probably unlikely
> tho..

There are already three open-coded assignments to vcpu->arch.pat on
the VMX side. Perhaps this should be avoided, but it's tangential to
this series.

> > +                     if (npt_enabled) {
> > +                             svm->vmcb01.ptr->save.g_pat =3D data;
> > +                             vmcb_mark_dirty(svm->vmcb01.ptr, VMCB_NPT=
);
> > +                             if (is_guest_mode(vcpu)) {
>
> IIUC (with the fix you mentioned) this is because L1 and L2 share the
> PAT if nested NPT is disabled, and if we're already in guest mode then
> we also need to update vmcb02 (as it was already created based on vmcb01
> with the old PAT). Probably worth a comment.

Noted.

> > +                                     svm->vmcb->save.g_pat =3D data;
> > +                                     vmcb_mark_dirty(svm->vmcb, VMCB_N=
PT);
> > +                             }
> > +                     }
> > +             }
> >               break;
> >       case MSR_IA32_SPEC_CTRL:
> >               if (!msr->host_initiated &&
> > --
> > 2.52.0.457.g6b5491de43-goog
> >
