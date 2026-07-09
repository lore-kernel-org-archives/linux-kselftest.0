Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B9022156C
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601271; cv=pass; b=dqy9Y2O//UbrHzCsZrcl7TZ0XnSAVreEzlRJH0SbnY03McvOCrc3q7WcF7qDKVKdv3wx0sSRdEeYzZMgk5UD96ePZSGWj+UQ2WdxUvrS11RvrAaABY0g0VKMES43Itx3HGygSSU6FijHfCl/b5dbApmqfNwc7v9TA773/CzrxqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601271; c=relaxed/simple;
	bh=ZqAVtC0zui/GEoBvIAUtspL9FoCa5rolrJYDNg/cF4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kc8il3iJvyrQY6X4+8yoymIVqTX+Zx0/5c9B/8riVRKykjVl/A8WTb96vubid1PU0W7Nj30bU8wLoP5VlQLL4XG3PjmU/tHeBrHNoMWpHBD3b0/PrkHBeMiayAbwZAoN/lSe0gD9aTBZJQTZxszIIph5GA756vbXjExwMiW9hDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNjnwfdS; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNjnwfdS"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-80bd5b5b3afso18724097b3.3
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 05:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783601269; cv=none;
        d=google.com; s=arc-20260327;
        b=O1ALg0qQcWzMEVk7usvglv7fod6bqhqUYn0S6RvemczkxI26VjSX99+o5TvfdeW/Ia
         mDgiK9yhmi3ysPDxeMhMIpwnJR+ZUIuRVbodRgbPS4oGeJwKIzXB1KHbFmsieHOXCE90
         BXAlYaTxtB82I9OYhpdXBtFT9JCDKi1Eip7eTuewhdHoseyQRCfea7SZwhZXZGzrdmIb
         jTKBtS2PKgPZVFsuC848fXD9w3ab8urYpHS5JshWteSaZBUql7V5t5aNa51cionS4gan
         Psqs/VWQT1ZViGDxx+7QufQpNxj1w4pjahkndnDyofG9PHpJRCE0ODJTzzMD4fIigN1u
         gRvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KbtfCdAsNe15E0EjVxF9jMshY329gv5ThshJ+2KYxgY=;
        fh=HF5VbqtK5CJ1CvzdeMd2TV5thdMxELHoij05WxrHe10=;
        b=BLC1xWr6P7wEcHMCf1jC80RC5gxrxaSG4VMHmagm9j6mm+UfUkLvLfaVSdo8zM815w
         T0iSg2XhD1DI10OphQn0sXikh3f4zzyU6JB/W97Ok+LE+i3ypjTijAGlNlGPLyh/PdGa
         Oq2Obt3LIPNBWhi+aBvv2sRSm+d8+294dhyo/0EPGA5v7ORxHbRX/SrUZCs7tcLClJ+p
         A1VZiiIAMBds3YIienAD/VN6nLbpGkGPr9muWCVTWmJpXO0o+M5Fh8A1/1xFiguPy3Di
         Jehvk8xbnWeeEJTQXrWagxX9Z4G/cJ1toBQzzjrehVhNMecY8Nskf4AwofWvPYBcd9nT
         wU/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783601269; x=1784206069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KbtfCdAsNe15E0EjVxF9jMshY329gv5ThshJ+2KYxgY=;
        b=CNjnwfdSJBbBiraOmNerll9XX8TFKK9MhjYiRBt7VMKWTLbW81P6CPTitYAGlv3nXZ
         7EX6nWvMj0v+6PlVLWDNKo+UqOhB5JfQEgE2IDc8oa6o4juj92rSUN1r2qhQtaV6agEJ
         0hXNtQ7qG0eoM0lsa1cpBB3l6+I8lK+s4znDxDrbiC5CEzPUA9KgAe1xRoRhoesrLrL+
         TrFihOMafu002P/5lu8Q8/9nUlALHTEPq1v4iRJRrLVrU0upL1yWTEXX84W086GksKFU
         gW7Sf8QxdNpQr8hxE6VCgkqIMmbx6flYzA77Z09aSzE53ivGkCeWbNGBzqucweS9JqeG
         fXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601269; x=1784206069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbtfCdAsNe15E0EjVxF9jMshY329gv5ThshJ+2KYxgY=;
        b=dmmqdSmn1aklAC45rne4osLj/COGxOk+2U2kOcn+EavrYRJ/tJ6ubrkF8ah4ph2Qed
         M1ao74UNmdhsK9E8OizCoayRKggR/3nH3XNA1++yoquJYDRuoH4VX84tCN42dAbiUXvk
         NeY2/gPHdoZmWRHj7YiFvWGox7SOxrXYi/cR0LyGFxEUDnsebJ2DuIre4bRT6T9x1gaV
         CxM+e0m2MGJoONGVqndhMw1VIng4X5SX02CajW5C5D5n7jfcjfgvRqf3Tzas8wU1Uo5H
         hg305V/bTLuWLEMF/sVzlYl9rjbJZ2/Pyhd/wAKrpOZAipE3XKA7OLzl297eveQL2qLf
         GXJQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSme0zsUxwtDNdFGkiSrGOVG/DwJZYeC0wuXbxKnVPeaXjHrNzu6Wpzf2bBAK9Fvjb/MApDcY1O6jM/RdXjRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqcAv/ZV/b9dv6o0ovu7gAVEIZATR3nBe/L0K7x0Z8+jr0TA7z
	D4dGv0c/NQ2kJemwcTKTbpr/9tRgYB4UM+7Hb+aJmkRsCzCSKbdmgjyogcsJBpxA433b0V7FTU/
	dTvlf58TxncdanJh3kQRVMX3B9yP91GI=
X-Gm-Gg: AfdE7clawF/0aieWQekQAY0BRU8x8iTtKqxu/Hn3nwWYhtqfy8fY+hxOqwyq6grjp2w
	QOsjs8oR06Gq6UB+FQfxVZVCquOi6VYQHmv1mrS9PoCPz2iYMGIIuByTxb2lqJr4XNvdhHcnqdz
	qcDtc9hp0xLr6OpKWlzP4elmlmCwybxbbEcBSRhXElj57rkKbAigKvOLULcXlexW0JuS+xwaj5S
	PT8/GOCdIiM10F5lRb44U7kBiir22z4HiOPtY5I1pGb34aej5w0bJmHMpue3zDtGWF0tpPWMb3/
	/FSmqr30wxLo6/ecTjSQuDjlHxjndaeJOpyM/d0M
X-Received: by 2002:a05:690c:e20c:20b0:81e:685a:2f78 with SMTP id
 00721157ae682-81e685a5adcmr26626937b3.43.1783601268652; Thu, 09 Jul 2026
 05:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708090151.151729-1-sun.jian.kdev@gmail.com>
 <20260708090151.151729-2-sun.jian.kdev@gmail.com> <ak5HLLrYK3R_g2y_@u94a>
 <CABFUUZHpPwuTk69hb54WugJwssFuvoqFFPv34dZRbKLLc1PwwQ@mail.gmail.com> <ak8XSRiLKx5WcIQw@u94a>
In-Reply-To: <ak8XSRiLKx5WcIQw@u94a>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Thu, 9 Jul 2026 20:47:37 +0800
X-Gm-Features: AVVi8CeXZdNci7kpIcIeMEoZGh__nXpYan_lq-qhUswwNCZeuYTPyhviupka2-8
Message-ID: <CABFUUZHTCLh1nHa3VGjvgvS=iPk_rOrFyBEMs0fiPZNGz3nMxw@mail.gmail.com>
Subject: Re: [PATCH bpf v4 1/2] bpf: Reject negative const offsets for buffer pointers
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	shuah@kernel.org, mmullins@fb.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 2:47=E2=80=AFPM Shung-Hsi Yu <shung-hsi.yu@suse.com>=
 wrote:
>
> On Wed, Jul 08, 2026 at 10:11:01PM +0800, sun jian wrote:
> [...]
> > > > @@ -5326,14 +5326,18 @@ static int check_max_stack_depth(struct bpf=
_verifier_env *env)
> > > >  static int __check_buffer_access(struct bpf_verifier_env *env,
> > > >                                const char *buf_info,
> > > >                                const struct bpf_reg_state *reg,
> > > > -                              argno_t argno, int off, int size)
> > > > +                              argno_t argno, int off, int size,
> > > > +                              u32 *access_end)
> > > >  {
> > > > +     s64 start, var_off;
> > > > +
> > > >       if (off < 0) {
> > > >               verbose(env,
> > > >                       "%s invalid %s buffer access: off=3D%d, size=
=3D%d\n",
> > > >                       reg_arg_name(env, argno), buf_info, off, size=
);
> > > >               return -EACCES;
> > > >       }
> > > > +
> > > >       if (!tnum_is_const(reg->var_off)) {
> > > >               char tn_buf[48];
> > > >
> > > > @@ -5344,6 +5348,29 @@ static int __check_buffer_access(struct bpf_=
verifier_env *env,
> > > >               return -EACCES;
> > > >       }
> > > >
> > > > +     var_off =3D (s64)reg->var_off.value;
> > > > +     if (var_off >=3D BPF_MAX_VAR_OFF || var_off <=3D -BPF_MAX_VAR=
_OFF) {
> > > > +             verbose(env, "%s %s buffer offset %lld is not allowed=
\n",
> > > > +                     reg_arg_name(env, argno), buf_info, var_off);
> > > > +             return -EACCES;
> > > > +     }
> > > > +
> > > > +     start =3D var_off + off;
> > > > +     if (start < 0) {
> > > > +             verbose(env,
> > > > +                     "%s invalid negative %s buffer offset: off=3D=
%d, var_off=3D%lld\n",
> > > > +                     reg_arg_name(env, argno), buf_info, off, var_=
off);
> > > > +             return -EACCES;
> > > > +     }
> > >
> > > I was thinking of suggest to just do a single unsigned check
> > >
> > >   var_off =3D reg->var_off.value;
> > >   if (var_off >=3D BPF_MAX_VAR_OFF) {
> > >     ...
> > >
> > > But looking at the code before 022ac0750883, what you have is closer
> > > aligned to the previous behavior, let's stick to this.
>
> Actually looking again at 022ac0750883, moving the `off < 0` after
> tnum_is_const() and bringing back the `off +=3D reg->off` removed from
> check_mem_access() is perhaps the more faithful restoration of the
> original behavior.
>
> Though reg->off no longer exists, we have to use reg->var_off.value
> instead. IIUC any register of pointer type should already have its
> var_off bounded to +-BPF_MAX_VAR_OFF by adjust_ptr_min_max_vals() in
> theory, and thus shouldn't overflow `int off`.
>
Thanks for the additional analysis.

I checked the related verifier code paths and the following provenance item=
s:

1. The source and initial state of PTR_TO_TP_BUFFER on the raw_tp writable
path.
2. The shared PTR_TO_TP_BUFFER/PTR_TO_BUF buffer access checker path.
3. The pointer arithmetic path through adjust_ptr_min_max_vals() and the
BPF_MAX_VAR_OFF bounds.
4. The source and range guarantees of the access size.
5. The source and range of the instruction offset passed to buffer access
checks.
6.The accounting path from effective offset calculation to access_end and
max_tp_access/max_access.

Based on these checks, folding the constant var_off back into the access
offset is consistent with the current pointer offset tracking model and is
also closer to the pre-022ac0750883 behavior.

> See the diff below.
>
> [...]
>
> > I agree that the size check is redundant given the current call path. I=
=E2=80=99ll leave
> > v4 as-is for now to avoid another respin unless maintainers prefer drop=
ping it
> > or adding a short comment around the access_end calculation.
>
> Agree and make sense. Let's see what @Eduard thinks.
>
> ---
>
One remaining question is the intended semantics after restoring the
offset-folding behavior.

For example:

    r6 +=3D 16;
    r0 =3D *(u64 *)(r6 - 8);

> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index d46f7db20d8f..e116b33ad83e 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -5359,12 +5359,6 @@ static int __check_buffer_access(struct bpf_verifi=
er_env *env,
>                                  const struct bpf_reg_state *reg,
>                                  argno_t argno, int off, int size)
>  {
> -       if (off < 0) {
> -               verbose(env,
> -                       "%s invalid %s buffer access: off=3D%d, size=3D%d=
\n",
> -                       reg_arg_name(env, argno), buf_info, off, size);
> -               return -EACCES;
> -       }

The current v4 approach rejects this because the instruction offset is nega=
tive.

>         if (!tnum_is_const(reg->var_off)) {
>                 char tn_buf[48];
>
> @@ -5375,6 +5369,14 @@ static int __check_buffer_access(struct bpf_verifi=
er_env *env,
>                 return -EACCES;
>         }
>
> +       off +=3D reg->var_off.value;
> +       if (off < 0) {
> +               verbose(env,
> +                       "%s invalid %s buffer access: off=3D%d, size=3D%d=
\n",
> +                       reg_arg_name(env, argno), buf_info, off, size);
> +               return -EACCES;
> +       }
> +
>         return 0;
>  }
>
The folded-offset approach would accept it because the final effective
offset is non-negative.

So this would change the accepted program set if we choose to restore the
previous offset-folding behavior. It would be good to clarify whether the
effective-offset behavior or the current instruction-offset restriction is
the desired convention.

I'll wait for the maintainers' preference.

Thanks,
Sun Jian
