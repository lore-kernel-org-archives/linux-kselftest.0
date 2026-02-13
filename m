Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E0535EDD3
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770997369; cv=pass; b=KqSZeHNDR2eKrsdzzP3Uu3haveYpmVSbVRqIsfhr/4ryHpv40aeaZIpS0oxX4X1tw9DyedUM10b/x7Y3ZrWAf+QZmxTDhdyGu+qc2SJb3WsCe4lfqYRdlPztnGTdhUj67jX+WxdRpCrz8GIY+VMxnteBvlvQqdZWjDAHofxOiSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770997369; c=relaxed/simple;
	bh=yTciUytAK+hm8aYrDirHamJvdZ4HmQPGUu+cgm745nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHusBt3cQ/c257W1zQsCzXFFONZ7oJtjXv9rCXGS9pXb9NjyaZ7tUTb5+BpOt1fTL1++Tx4LUMWBASja2KVZKIaZ2zMhTKausLe39zViC2bgUcXQhQ+MjFfwV2Z1mvJgolxxH5AxyguHQtVGX6S17s3hDnfdB/3t2zKRVn2HbYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xKdTKfuP; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xKdTKfuP"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-652fe3bf65aso9086a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 07:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770997366; cv=none;
        d=google.com; s=arc-20240605;
        b=WbZ7zP7rvHylg8YU4sdYuYEBLRS89j1+XnLtFVuiIIBYuNfz7E7yjy6qmbWjNr2uOn
         fFjkBkR1+kVKIzdqoMRkfj9VlAZLY4ak8xGNqw45Raf83R3e2We1Mjv9pgjtH/KwTKGt
         dVK7IIyrrAJ3wh0TxQGxE3XBA8Kry2UNcyQVIxe/fdENxoOOONt839qoXENM9DrTapGy
         b1Gb0vZfuVBSPb4ZxMn62vUSk2yV0WFBRfFSDAwbbYteMElfWHTfR0BpDFsK2h5GqXP1
         5xhbLnsfPxkiWyTpe1IQWmKyaR/csA1aQ53wxShuo7tfa86ThxjBuuAmBf3/ohNP+Mz+
         RXwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F6ij2Khc2FsAsz+xr+2WTDdi0WC0Pp/qGOQOsuaJCEw=;
        fh=0hJ70hq0uYaTgNRuT6Imkptnqb0BoFvLPsyV1TLNiCc=;
        b=RrdVl8edcV1hRoJrZN5qJYMhuBMbgJkCmx5pp9LGZzNE57pwf6RpjbesnVFPBxpiLI
         G36LmqW5iTuuDEK0DGYjdNpe3xGoqAjZIFpzBSWedS1nE3mPt6cTFommkczeoI6L1Au3
         hI+XPpJwLR33rx8H2fIXaQYr4UUEcZLpy5YMhIQ0Vx27PHQxf1xBEPbqJ2Iupq2ZNnc5
         o4w8tJwmUyftCdpBVilfDMXks++dFWWC8yrfTjUjkWyALy+OHm6GSD5WTdij2mB7xsmF
         dlPkQItJ8YuCOTzRbEjdadOn7Hf13iC9e1b/4MFYBaAVuz09/rFtYs/8vFhlTP4wBh/d
         HGbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770997366; x=1771602166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6ij2Khc2FsAsz+xr+2WTDdi0WC0Pp/qGOQOsuaJCEw=;
        b=xKdTKfuPWSdO0a6dr+GgarlKSaC/BjjZUVPFfnx02xQZOtTMYDpdSA1mI+LxZyW0AO
         grkybGdSYQMprLiK7QlbZTxuyLifyOxdAkzpZ3F0izh5K2FV4YmmsA18nevzZVLO2at7
         B077NqI7Za1f5bizp5wAPoa8xi1ayJ1Bo0+SPbwN9JOS2JVlX+BJ/hWUiXSXWUqd+8xN
         TyxCYuYuVIfhEmRN/1AIWdkuaPMRvBk8dFzphp4ESNhGPT/LMDSK+kKJ7u9+/SyggGgV
         tkT01BGGHWutAaO6cnNlqTgF9gGY/FeQ2yMd/CS5hoK6yKa2yAliaE5zPFWaERpmWxlL
         MvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770997366; x=1771602166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F6ij2Khc2FsAsz+xr+2WTDdi0WC0Pp/qGOQOsuaJCEw=;
        b=iYvzS42u3A98O3hDGcG9Mbvqm0+L5lhE7rtbRtgNbwaSWqsz6Mo5jglYgKdI7KcDsG
         GpJPqKMYNqfZX5Yhrtuqw4mPuolJuMwVwbddltAP5zrD2you7vaEtS9r94Q165es31BV
         7krFvWEC6WRWY0QDiNQ1XEiLwRAF9lBNhdQsJyZjvtstEhWM0qVjkfFS3df9+0MgfoDL
         xBD5ut3vOqmIipvlcg1ITNKbsy0PK3T7Tj0LKaGcZA8H1ur7m3SoP2NjdFOHk5je3J3n
         fnN3oG0sfk9dbFMEWvO9MO6spEcOMvi0Zar+vyVlTBM3oZ3S/Qpm5RNMER96qfirW5A3
         NQDg==
X-Forwarded-Encrypted: i=1; AJvYcCWwpZlHdUYZKN/Qw8WGNBdbnKUD5ZMIPq9lJzZF2WDzIluOghAoiYLCtkbnY1usBV81mVMlf66JrjiinpXhCr4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+7sR8XAKZKKvXUDdXxZWnPoNPtne9fDTrSZ0aBywaNGn0gij0
	+9qOQRzuB396kCM41HrdVgGn54sLZa1bDTdrmC01JEZMQlyOD2Apm6r76bRMJE3fTEbv9ikpfDM
	F1FbVJGpm6ha08Xxp8YHEgBUJo9g8m6M6MCljRdD5
X-Gm-Gg: AZuq6aKP0cKJftrLgxGTjpaSLTtDV1T1/lv7OFC3JqWYCbMGjtjn85YkRCf6XGaD9zI
	4p7WzTjJTiRRiUp6AfwFJlplRFTNO6VvBxy2kFcX0dLEqHOMrhfprLRDUe8DJ/4npL4k6ZCWrl4
	RiC6jj6yDhaX5WY3oJlXPFQTbbBRqtU8O2Bu7obmekORI0fqYtIltFTxDm2NpRBg0z0oHMSKQTq
	hCBXsUtemw/ILC7VcB+6xNRDCp2Jm2nPoub6JIVayj+TXYRzq7fiL6YrllDXyixE0iDzKIqxMHL
	OeXdD12/9WoT0ruS0A==
X-Received: by 2002:aa7:df8a:0:b0:658:102c:861c with SMTP id
 4fb4d7f45d1cf-65bb078c0f4mr25011a12.15.1770997365892; Fri, 13 Feb 2026
 07:42:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212155905.3448571-1-jmattson@google.com> <20260212155905.3448571-5-jmattson@google.com>
 <gqj4y6awen5dfxy32lbskcxw6xdv4xiiouycyftjacndjinhvp@7p4dtgdh6tjw> <aY9BPKhzgxo4UuHB@google.com>
In-Reply-To: <aY9BPKhzgxo4UuHB@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 13 Feb 2026 07:42:33 -0800
X-Gm-Features: AZwV_Qh8Zc-8b-6vcrm4uFHajKL5tBq0Tt20KrHYUCJPUVjtrEQVTeUjqt4aD1w
Message-ID: <CALMp9eR4ayj_gwsDQVH8pQvzqgEYVB6ExWp3aFgJXRWikLEikw@mail.gmail.com>
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

On Fri, Feb 13, 2026 at 7:20=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Please trim your replies.  Scrolling through 100+ lines of quoted text to=
 find
> the ~12 lines of context that actually matter is annoying.
>
> On Fri, Feb 13, 2026, Yosry Ahmed wrote:
> > On Thu, Feb 12, 2026 at 07:58:52AM -0800, Jim Mattson wrote:
> > > diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> > > index a49c48459e0b..88549705133f 100644
> > > --- a/arch/x86/kvm/svm/svm.h
> > > +++ b/arch/x86/kvm/svm/svm.h
> > > @@ -607,6 +607,22 @@ static inline bool nested_npt_enabled(struct vcp=
u_svm *svm)
> > >     return svm->nested.ctl.misc_ctl & SVM_MISC_ENABLE_NP;
> > >  }
> > >
> > > +static inline void svm_set_gpat(struct vcpu_svm *svm, u64 data)
> > > +{
> > > +   svm->nested.save.g_pat =3D data;
> > > +   vmcb_set_gpat(svm->nested.vmcb02.ptr, data);
> > > +}
> > > +
> > > +static inline void svm_set_hpat(struct vcpu_svm *svm, u64 data)
> > > +{
> > > +   svm->vcpu.arch.pat =3D data;
> > > +   if (npt_enabled) {
>
> Peeking at the future patches, if we make this:
>
>         if (!npt_enabled)
>                 return;
>
> then we can end up with this:
>
>         if (npt_enabled)
>                 return;
>
>         vmcb_set_gpat(svm->vmcb01.ptr, data);
>         if (is_guest_mode(&svm->vcpu) && !nested_npt_enabled(svm))
>                 vmcb_set_gpat(svm->nested.vmcb02.ptr, data);
>
>         if (svm->nested.legacy_gpat_semantics)
>                 svm_set_l2_pat(svm, data);
>
> Because legacy_gpat_semantics can only be true if npt_enabled is true.  W=
ithout
> that guard, KVM _looks_ buggy because it's setting gpat in the VMCB even =
when
> it shouldn't exist.
>
> Actually, calling svm_set_l2_pat() when !is_guest_mode() is wrong too, no=
?  E.g.
> shouldn't we end up with this?

Sigh. legacy_gpat_semantics is supposed to be set only when
is_guest_mode() and nested_npt_enabled(). I forgot about back-to-back
invocations of KVM_SET_NESTED_STATE. Are there other ways of leaving
guest mode or disabling nested NPT before the next KVM_RUN?

>   static inline void svm_set_l1_pat(struct vcpu_svm *svm, u64 data)
>   {
>         svm->vcpu.arch.pat =3D data;
>
>         if (npt_enabled)
>                 return;
>
>         vmcb_set_gpat(svm->vmcb01.ptr, data);
>
>         if (is_guest_mode(&svm->vcpu)) {
>                 if (svm->nested.legacy_gpat_semantics)
>                         svm_set_l2_pat(svm, data);
>                 else if (!nested_npt_enabled(svm))
>                         vmcb_set_gpat(svm->nested.vmcb02.ptr, data);
>         }
>   }
>
>
> > > +           vmcb_set_gpat(svm->vmcb01.ptr, data);
> > > +           if (is_guest_mode(&svm->vcpu) && !nested_npt_enabled(svm)=
)
> > > +                   vmcb_set_gpat(svm->nested.vmcb02.ptr, data);
> > > +   }
> > > +}
> >
> > Is it me, or is it a bit confusing that svm_set_gpat() sets L2's gPAT
> > not L1's, and svm_set_hpat() calls vmcb_set_gpat()?
>
> It's not just you.  I don't find it confusing per se, more that it's real=
ly
> subtle.
>
> > "gpat" means different things in the context of the VMCB or otherwise,
> > which kinda makes sense but is also not super clear. Maybe
> > svm_set_l1_gpat() and svm_set_l2_gpat() is more clear?
>
> I think just svm_set_l1_pat() and svm_set_l2_pat(), because gpat straight=
 up
> doesn't exist when NPT is disabled/unsupported.

My intention was that "gpat" and "hpat" were from the perspective of the vC=
PU.

I dislike svm_set_l1_pat() and svm_set_l2_pat(). As you point out
above, there is no independent L2 PAT when nested NPT is disabled. I
think that's less obvious than the fact that there is no gPAT from the
vCPU's perspective. My preference is to follow the APM terminology
when possible. Making up our own terms just leads to confusion.
