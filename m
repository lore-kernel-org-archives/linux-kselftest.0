Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EC7382F03
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 18:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410219; cv=pass; b=ERnYOV8iMfQ/YsqmIUAIRlT5I+0jvhhmgfyQo2jx/lQhTf9kiTAsA4J+cPlg70sJoUBnQvNi1FC7rfZ+f75cEoLlSf4lP5PvJFVmLutMPWXbx3NcXWcPf1rhbiRtpWYaEdZGFRu3nE2xw/gC4MHNgLeyXrVw4AHm0DG7t6k08J8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410219; c=relaxed/simple;
	bh=8lWU4cpgiMq9YnX7HwrBm5P/hF6ii9HNA+L6UIhaR9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XlyoCjRm9/19ZwSMCL9GUHQ/lPYBKsxVRvmjSiqA8bEeZFENKO0gxFVXAFJmRxVYEhduoLA13C+Hp4E8+X0Xdl8Q+8EmLOi1ZvWTYfkhVScGIzT8azvh4Wl3pqB//l8rkXu2dHOllqprhN/RBC+CwptkewXrRk3rBaOlKuUEXRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AJZrI4lw; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AJZrI4lw"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so463101cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 11:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789410216; cv=none;
        d=google.com; s=arc-20260327;
        b=ssUTCcnnYTV8BT55dbreHxLGCoKvFdK2wVnML8JPZQOCe/lwwv0W9CUKlS7ZAt0J/q
         2b4ThIFozOIdh1GrMU1k+W3QBiZDBswd6/8is+fL+voLm7f3LmAwk7Kmv0b+FAxjl4vf
         WLvxEhioTCXpSHPc2QoinYpfUkY4Qyu9T3F77NT0c+fyHEf2BYlGkTqM4qCqM/EoqQp1
         Pe8bLYPteQ4zMpkVNPahU30KAHdL2BsOEDoI52ebEhgglJFPAFW3GPxEGert/55KRzSL
         J32S2PORokK16tByQP6Zqdvs6A+Xnk3Ndz9q5G9mSluyhdDMR9BomojIclUmqTjN6/NP
         +NwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PjIDVmk73Nhw9gfQkfS5b5SQrCZ0nuN3PgiMSVCIJiM=;
        fh=aLbsSUja0UewMyt2/fgIVsyhHc6GnlkOLHzBFms624g=;
        b=N+7U3k2SAhgyjwPtjyqjtRVydvmhXexp9yRufzXStBMWyfjadLpoOLVKLK8UBgST2F
         1qFISPiOAKUHAvez/FWzQT0zNhKfaDmgDWrrmnG6O8SMtUoEjabaDCfW1elzo77edwQN
         8ONXwKHOd9nkUtrxPORBjz//E15Ile/d777cs46teoShuN8JduJtC5pqSOiL9/dAmh+3
         xauThGhLVEf8uXexNU1T/Dc1gXU76GV+dl98iziCObmRVMSOk7EWpaNcBOkxJhD6PewM
         e9b/ANhzinsknnvxVjXfVy+XgW1zFjnVRno1SHWCtb1Ev+qbGxW5sy7PD9JcSMnOuqny
         apqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789410216; x=1790015016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PjIDVmk73Nhw9gfQkfS5b5SQrCZ0nuN3PgiMSVCIJiM=;
        b=AJZrI4lwzUJWtbnyW6s2pMShMXQD5O8bEGa9qe58OxRD5MOTKu72DUjdPNzSi57NOT
         j6gI2uMHhoGZ0umG0NPl7R77Zxf9xRTJoZaSPhFOJnzxIaZ2dflUGlBkOeAWdvFRfH2t
         jFtfq1v18/C12ssBZjlSgmu5B6fHW8NGonKV6cACRx60vF1cmU/UO+Y58N0Bn4V7qISF
         wFTOfSjBs6bAujfIpRWnNPv1PqvMX6/OcBDc8P2Ms6eDBGzhnqHgBH2HT2nMwkMPTIsO
         +FiWFeRsWW1EnK7HVaoqcIXWBNer9aKxiZhdcO8j4jVuV/B9skN83advFcMcaZlcMHM6
         Vgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789410216; x=1790015016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PjIDVmk73Nhw9gfQkfS5b5SQrCZ0nuN3PgiMSVCIJiM=;
        b=hruaMZ/15LNTadNIUloIYuOZYSYh1PlaiUYIyTmKuAWnjUqq8r7UWWOTYVmm9ceYeN
         RXeWi+9wlrV7aPUrqQmuFG1+6QsD1Ao62itH7uZvuwz8lAVj4hcl8Jy5uMLtpHPZsnB6
         sb8rzajF94Q+TMhBNR+UzK1zDjbyzjJwnxChw35QLopBKINMRCospVtsQuMvjSFpylvb
         mUpTPMcEiym2OMpiHJRiPrP9uKnA4Wwkdr7uYtF6tg0+TyLyd/ZYUV7p8Jkzd4HcO0vV
         71DnM79sn9jMmktiuVUxVgTmGgY9ec69L6TUS+yQ6aWo+GGWtXI+M50++0Lq51JG+PT/
         p/PA==
X-Forwarded-Encrypted: i=1; AKwUvBxFfgycIIji5ApPXw7WDroz2vxxRt8qQbM0T1ElPZAVubcKtiToVr1vZUTmdnsKA3sOXIZ2lR/G5L350Ele48Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mXJvptwPTfTfcA3RjzUPnOIm5RBcYytSff73wbXcVtPi4ca8Q9
	Gvt53Pmb7J16pZk9oxOYIyL+mfGf4IfvygrIO69SF0AL0rE4YJB4Y02JceC2ls1xpdHLzw1Ybdq
	iRCRDCWokQQBd3lvL9ILonzj0xTPMppU3a7qRUpZ+
X-Gm-Gg: AYBFou3BY5JCdKMnUrDkIs1+Hqpdzw7EaaLnUCnuBlqB3PUxLKBzKz/BtX5ZLHXvMcz
	s4Ipkpisw/c6Hy7IQb/03Npsavov6kipYAXZABMLpqxazertO8S4oaQnSQmUcvRkN91zACRl6Wq
	vn7of4Lq/ulTOyCxiK6p9ws/x8J8N0p7rOcfOki4/dffy0agq2VXzlV8V6LOpvxwgsyXt9oTSPh
	KCCWRRl7FbktdXCpb8PIfgZ1aCJOr592tVIc2sObbj48PWj+92P6Yf5yqo7gdq4OthqGgb3cfKN
	GvPwDlXCBrQN1XsWXj0MauDiWVKK0SHx5LqOnAtagLKtCRaDLl8slp0=
X-Received: by 2002:ac8:5753:0:b0:530:e335:4ef with SMTP id
 d75a77b69052e-5311a5c4df0mr1673231cf.2.1789410215624; Mon, 14 Sep 2026
 11:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net> <fc88f299f41c99ddb5851c24d97970dc29584876.1789281096.git.zhang_wei@open-hieco.net>
In-Reply-To: <fc88f299f41c99ddb5851c24d97970dc29584876.1789281096.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 14 Sep 2026 11:23:21 -0700
X-Gm-Features: AcwNN1UnHluX96bH9TjpBlsi84Tfb92oWbyT3d0BFAVR9QTkBp-QT6Wu1rTqanY
Message-ID: <CALMp9eSv77sBcfYpPJm4Uk+9CePV7YMdYXhvBHKHSvacnnRBUA@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] KVM: x86: Provide INVLPG linear address to
 intercept handlers
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 11:44=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.n=
et> wrote:
>
> INVLPG's memory operand is decoded with NoAccess, and thus src_val does
> not contain the operand address.  Intercept handlers therefore cannot
> construct exit state that reports the linear address from the existing
> x86_instruction_info fields.
>
> Add get_invlpg_linear_addr() to compute the address through __linearize()=
,
> using the same flags as em_invlpg(), and pass the result through
> x86_instruction_info.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/emulate.c     | 18 ++++++++++++++++++
>  arch/x86/kvm/kvm_emulate.h |  1 +
>  2 files changed, 19 insertions(+)
>
> diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
> index 8071b372d233..1dfece6af81e 100644
> --- a/arch/x86/kvm/emulate.c
> +++ b/arch/x86/kvm/emulate.c
> @@ -410,6 +410,9 @@ static int em_salc(struct x86_emulate_ctxt *ctxt)
>         _fault ? X86EMUL_UNHANDLEABLE : X86EMUL_CONTINUE; \
>  })
>
> +static u64 get_invlpg_linear_addr(struct x86_emulate_ctxt *ctxt,
> +                                 enum x86_intercept intercept);
> +
Nit: I would move __linearize() rather than add a forward declaration,
but maybe it all unravels if you pull on that thread.

>  static int emulator_check_intercept(struct x86_emulate_ctxt *ctxt,
>                                     enum x86_intercept intercept,
>                                     enum x86_intercept_stage stage)
> @@ -427,6 +430,7 @@ static int emulator_check_intercept(struct x86_emulat=
e_ctxt *ctxt,
>                 .src_type   =3D ctxt->src.type,
>                 .dst_type   =3D ctxt->dst.type,
>                 .ad_bytes   =3D ctxt->ad_bytes,
> +               .invlpg_linear_addr =3D get_invlpg_linear_addr(ctxt, inte=
rcept),
>                 .rip        =3D ctxt->eip,
>                 .next_rip   =3D ctxt->_eip,
>         };
> @@ -702,6 +706,20 @@ static __always_inline int __linearize(struct x86_em=
ulate_ctxt *ctxt,
>                 return emulate_gp(ctxt, 0);
>  }
>
> +static u64 get_invlpg_linear_addr(struct x86_emulate_ctxt *ctxt,
> +                                 enum x86_intercept intercept)
> +{
> +       unsigned int max_size;
> +       unsigned long linear =3D 0;
> +
> +       if (intercept !=3D x86_intercept_invlpg)
> +               return 0;
> +
> +       __linearize(ctxt, ctxt->src.addr.mem, &max_size, 1, ctxt->mode,
> +                   &linear, X86EMUL_F_INVLPG);

What if __linearize() fails?

> +       return linear;
> +}
> +
>  static int linearize(struct x86_emulate_ctxt *ctxt,
>                      struct segmented_address addr,
>                      unsigned size, bool write,
> diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
> index 3e375af15c03..d05558ef28ae 100644
> --- a/arch/x86/kvm/kvm_emulate.h
> +++ b/arch/x86/kvm/kvm_emulate.h
> @@ -51,6 +51,7 @@ struct x86_instruction_info {
>         u8  src_type;           /* type of source operand               *=
/
>         u8  dst_type;           /* type of destination operand          *=
/
>         u8  ad_bytes;           /* size of src/dst address              *=
/
> +       u64 invlpg_linear_addr; /* linear address, if INVLPG */
>         u64 rip;                /* rip of the instruction               *=
/
>         u64 next_rip;           /* rip following the instruction        *=
/
>  };
> --
> 2.43.7
>
