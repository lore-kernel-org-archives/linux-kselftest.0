Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8345511197
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 22:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788561275; cv=pass; b=XBsrNRH2qMeg7kFaJc3RBBvddbClj1krKocDm4ZsTL0n/vKdqUIqrvmyi2i8PsYWXzw3j7epnC5WSFcdG+m/3Oaqmc7D9xOpzLVMh1O5oA4SpoDGgrlgQ/0cMmnRd3AXK2i5MGm9aPbXDNRkl7qhtp+Snl401whPlicDrEGkUiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788561275; c=relaxed/simple;
	bh=zQzEewI4ZvoZshQfZVFvWPcbJeYMDctnRHy7ajATikE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmvdYuMEUR8TJiUCAScuRl06BhnKxxtnnNyMQ4P10Ce7KAfqn1Cq0pApXOhGgL0Zscppkq23vQT+nCaiVirsJNS2CgLXioZWV8vQ5MvYuqG3ccCWY2rFIqv4QXY0ZVA59+Sb+Ah+QUoPwkDaYrKjT0F5FJwjcs5fbq8jZeFBy8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i5L5bfoR; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i5L5bfoR"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d88so1965a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 15:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788561272; cv=none;
        d=google.com; s=arc-20260327;
        b=MXpL4CXQK8FMNdlowInGv2ksvZw3VYXLsa0IozmtGnmm7/UavNjoPWvh4MRvR2ruVi
         bExybMIZ8McKWvwm0kDarsfKDURNOTpmUVlENNwnwtxLliAL3HlcKpHtbYUdbXm/tHE+
         7taOfuPgPL9QbGsFcDYaohHylaXabMtVhzE9KbqeZyVvJZCh35vfuIOry3L574gLZ8kt
         ouJk+P+NeTDUpJ7/Dp48VOXLvwvMTsg4UuGdzD8Ckomef3cZoNV0nwsWtBk4le28ZkVS
         taycgK+rPK+VisibtVIKBzSD0FaPV4cQAWlrvBC5109doIh/CyGg8jDxKcMEMmpiKQE3
         1tYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vWyLFB322c+K8udyWMay6dKIPqFbfWlPPY8Vkro08BM=;
        fh=W6XDgtu3OvhRcoF6pi6cFo9+WbgyvfJ1O68QtbYGSjE=;
        b=G5pkD13aCDVBQ6ggkcEqyMjtFq+V9mHj+letuNHwiejlVxDj9NrkBQ4wcYvoGNAIJQ
         23SwMd2/3GKAMZuATQLqXp9UcE9LBVB+Wc89A+1dcsdPK3X/5FyChmCErMXE1lrrRDoq
         qjkR9N9QrbXj9RUg2ZG5QR82ZbcT8cVLHtKB9V3+RNKKaToAlevAXMmb+smVFR03Dfnp
         zEACz7O/KLkFVrE6x61EhrK57NKDz37CPmjRSJb51iCpZpZY2tpFWMPZRHCWZ3yBCyXy
         k/WL/Uyz88dLEXHrOMJLmtAmVaZIXHGrA2rAMfPflANM54oskO3gOSu9L8BQ4r+BAPBm
         Ysxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788561272; x=1789166072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vWyLFB322c+K8udyWMay6dKIPqFbfWlPPY8Vkro08BM=;
        b=i5L5bfoRS1hv4oOobsDflFsRUVPWpYm7PnaTb7K/SiND3QTD2asCSX6JMLk89t7gia
         Et0q2++NrSbsAmKON8ON/J7DlxIFzHbIOSVzqm4bE5C+ntGaN0GNPMrSxm/2MJaE9wci
         dhwnIFJm/hgGnFTmjB4AcV39R7IidOlxs81lxDxiS+OOxUizpmU0v/QWlE1IkvpBBNl6
         rK8q9i0BKxUVGn2BkMYB7tyY4dQb44Y1ZGZyl90LEEmv8g36gL58GKeirCd919NuMg/w
         9BzAVtdrjXjKhi+eXZ2UhWt+Z6VUu6P6eqZsUsls5GrXcGIMavLSeZMC6BrPb7tRMqo5
         6UKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788561272; x=1789166072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWyLFB322c+K8udyWMay6dKIPqFbfWlPPY8Vkro08BM=;
        b=eAlbykHq17xI4l5vmmKJaHyBohxdxjgEFjBwBh78Et/vDGu6iaEkQAjgTr32NQsIMz
         kuJHlCO/t6B73SILMblsoOvlmL3MwIYWfMs7bmtgBTzG0hBu+9d6LeX3bnsrZ35enOS8
         4g1c4sNEgz810k6S2FMlt4LRdWNP7nHAxvJGSZIH1UXllf4YIUmT7JWl3eOtPb88/YZC
         9/Hiof6FNqcIs/YC1KCNhObKNj7Q/VwEJbhX50Rqo9VGaCXsoCJiVLam2dQYEUNIhVBh
         YMYMT3qNDnwSJqgodWzHUEyZui5qdK5zEG36waS9yQIbKdKzYfEn27HR3Car8Y2as++N
         OphA==
X-Forwarded-Encrypted: i=1; AKwUvBxH5HHb8j8io137vUf6qr1nV+NXbj5WVk/jsd8iA4sfHnaDDhAg6NRzcRky/Kt4NNUY2gDARNACBFDPCvZsJ/k=@vger.kernel.org
X-Gm-Message-State: AFuF++lapQmXJc9GIQa3JH5zPhMbBkDN1Y1LtoymZy65btMSNd7iZKZy
	giLAUkBhpTOItu16j2nQw1wTONyZ56F/4gLfZ1Ae+dghX4cQsz7NQ85esgqzyOmELioX8U9zlmL
	J+k4Mx6p46joGAQzC+sCAWIFGoi/6sQs+HbEcimLO
X-Gm-Gg: AYBFou3+OqRYk0Jdhf07ajAJ+arWwmmPtTpKq5uYPu8VuBz08MPznK0a7/66SKutjQ+
	84uE1oWg7c0hQqMmByKE8rheYAD4GsodFtUMLCMRkf8KjWCQlfXKkunHIOGq5TywqjSZEsFBkOa
	uaIr8nFi9qKWAv9GY15WEtQeIqi7bIHBaNwSWAcEOfqRlEW+EGbdzZaoScaWW+ziLRpOW0jns/m
	WhMPLgMemiLNqR0zVgGKTAj/jSM+/6yiTrjh67J6+rWIx1+cEulSbqYRnUqSm8N3jDwNMLF53Ch
	puUvEVvAFe1YcIvjL19wUCQgqUUTHinA9VJq9nQtASGg
X-Received: by 2002:a05:6402:21c6:b0:6a6:96df:215b with SMTP id
 4fb4d7f45d1cf-6a7f682710amr11857a12.14.1788561271594; Fri, 04 Sep 2026
 15:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net> <20260824123954.315112-2-zhang_wei@open-hieco.net>
In-Reply-To: <20260824123954.315112-2-zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 4 Sep 2026 15:34:19 -0700
X-Gm-Features: AcwNN1W2CL3MX24WexOB2cU1f7wgDBrCrUSExLWQoABuDUy_PRYgrmgU2-Tp_bU
Message-ID: <CALMp9eQoMn5BxXfu9ut5EZVGipfiZzbQz32mpi3TCjA6fA7jCw@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] KVM: x86: Add helper to provide intercept linear addresses
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> Add get_intercept_linear_addr() to compute the linear address for
> intercepts that report one, and pass the result through
> x86_instruction_info.
>
> Handle INVLPG as the initial user.  INVLPG's memory operand is decoded
> with NoAccess, and thus src_val does not contain the operand address.
> Compute the address from the decoded segment base and effective address
> in the emulator, where the operand state is available.
>
> This allows intercept handlers to use the linear address directly
> without duplicating the emulator's address calculation.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/emulate.c     | 29 +++++++++++++++++++++--------
>  arch/x86/kvm/kvm_emulate.h |  1 +
>  2 files changed, 22 insertions(+), 8 deletions(-)
>
> diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
> index 8071b372d233..a0e57b64cadd 100644
> --- a/arch/x86/kvm/emulate.c
> +++ b/arch/x86/kvm/emulate.c
> @@ -410,6 +410,26 @@ static int em_salc(struct x86_emulate_ctxt *ctxt)
>         _fault ? X86EMUL_UNHANDLEABLE : X86EMUL_CONTINUE; \
>  })
>
> +static unsigned long seg_base(struct x86_emulate_ctxt *ctxt, int seg)
> +{
> +       if (ctxt->mode =3D=3D X86EMUL_MODE_PROT64 && seg < VCPU_SREG_FS)
> +               return 0;
> +
> +       return ctxt->ops->get_cached_segment_base(ctxt, seg);
> +}
> +
> +static u64 get_intercept_linear_addr(struct x86_emulate_ctxt *ctxt,
> +                                    enum x86_intercept intercept)
> +{
> +       u64 la;
> +
> +       if (intercept !=3D x86_intercept_invlpg)
> +               return 0;
> +
> +       la =3D seg_base(ctxt, ctxt->src.addr.mem.seg) + ctxt->src.addr.me=
m.ea;
> +       return ctxt->mode =3D=3D X86EMUL_MODE_PROT64 ? la : (u32)la;
> +}

The linear address calculation here is replicated from __linearize().
Perhaps something like:

static u64 get_invlpg_linear_addr(struct x86_emulate_ctxt *ctxt)
{
        unsigned int max_size;
        ulong linear;

        if (intercept !=3D x86_intercept_invlpg)
                return 0;

        __linearize(ctxt, ctxt->src.addr.mem, &max_size, 1,
ctxt->mode, &linear, X86EMUL_F_INVLPG);
        return linear;
}



>  static int emulator_check_intercept(struct x86_emulate_ctxt *ctxt,
>                                     enum x86_intercept intercept,
>                                     enum x86_intercept_stage stage)
> @@ -427,6 +447,7 @@ static int emulator_check_intercept(struct x86_emulat=
e_ctxt *ctxt,
>                 .src_type   =3D ctxt->src.type,
>                 .dst_type   =3D ctxt->dst.type,
>                 .ad_bytes   =3D ctxt->ad_bytes,
> +               .intercept_linear_addr =3D get_intercept_linear_addr(ctxt=
, intercept),

Maybe:
+               .invlpg_linear_addr =3D get_invlpg_linear_addr(ctxt, interc=
ept),

>                 .rip        =3D ctxt->eip,
>                 .next_rip   =3D ctxt->_eip,
>         };
> @@ -520,14 +541,6 @@ static u32 desc_limit_scaled(struct desc_struct *des=
c)
>         return desc->g ? (limit << 12) | 0xfff : limit;
>  }
>
> -static unsigned long seg_base(struct x86_emulate_ctxt *ctxt, int seg)
> -{
> -       if (ctxt->mode =3D=3D X86EMUL_MODE_PROT64 && seg < VCPU_SREG_FS)
> -               return 0;
> -
> -       return ctxt->ops->get_cached_segment_base(ctxt, seg);
> -}
> -
>  static int emulate_exception(struct x86_emulate_ctxt *ctxt, int vec,
>                              u32 error, bool valid)
>  {
> diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
> index 3e375af15c03..9eda648a1314 100644
> --- a/arch/x86/kvm/kvm_emulate.h
> +++ b/arch/x86/kvm/kvm_emulate.h
> @@ -51,6 +51,7 @@ struct x86_instruction_info {
>         u8  src_type;           /* type of source operand               *=
/
>         u8  dst_type;           /* type of destination operand          *=
/
>         u8  ad_bytes;           /* size of src/dst address              *=
/
> +       u64 intercept_linear_addr;      /* arch-reported linear address, =
if any */

+       u64 invlpg_linear_addr;      /* linear address, if invlpg */

>         u64 rip;                /* rip of the instruction               *=
/
>         u64 next_rip;           /* rip following the instruction        *=
/
>  };
>
> base-commit: 1b731e5ded480bd1e5546aed35584238661ce72e
> --
> 2.43.7
>

I don't really like special-casing INVLPG, but I don't see an easy alternat=
ive.
