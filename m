Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204524534AE
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519879; cv=pass; b=RU4NZLRidbWCwL6lR39K1YtQT3hWiNgousWEIZsqqcyJbPqsY290PsZsmDUXxqAPsqbmwu4+YEKPncA3oZ9ntv6jAlBrSpNQXNuHGcPITg2fmYyIG/0ccfJDXN5+Im+WX0spK5uCdOTzJulXxfrmycD35AE4j5yy5nYwBMt+q70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519879; c=relaxed/simple;
	bh=JcmAKN11GlEZlCK3Tb7glDhGWHCZKu3R/gZN0IxBi44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsLLs50xjMyzIMSwGqm460r0C+harrkII+L3wtyPiK2o6SulGepxboVvYEPIUGMiRfZ/r+oUnC8hXrDYmydDws3HBfwAL3H6D2+6LNKKthFCvsy7LGckLfkGJGosTpI5q/chUyH8AROhmLJoYyts+ZxVXglWrP6E0n3dPy8rxsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbjqtztN; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbjqtztN"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-80b9993928dso10820307b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 07:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783519877; cv=none;
        d=google.com; s=arc-20260327;
        b=KDVBDw35OKD4eZ+WtTP4pqFhiAhg2eTKcDSWxBLarRStp1GHg5hZOn2Ny1OqlfW9U6
         1kwJw5BGY6Dw0dtnax7s7tzv0LIPvM85IW2VzQUTrDfG9wjPRCHe9Dm9t5flpVl9fxIZ
         OpNaGui33C8aJM4SRIeZfATxEoGiWZ9ypOoPBiiGBsCI5sbQuBb4JVAPEp7w7aYE3QHp
         gMHGmicLWaPTirs4TgsL9nv0cEokS5lpJov6/4tx+cO0fI3DJa69RQVmTJgoZQ1H3uxt
         YIVJOS/jjt77uNz/tkwJEc+iIc8J1zyYOnSThTPkB6YsT4V0HCGhrPoqYcV2UeHMhaVt
         XlGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F6iCbqiFD/hdmKTE2DrZqekV252eUYkKKpzBqjT3c4Y=;
        fh=l7+XdxF2QLR4TZagDNwED2pS9a6FuWhxJSI0pX8CXvg=;
        b=dCN7Bk50MXtPwsUDg30zKo5D3DcJNtUrB4nl6g3DcuxJjjfb/ixLAXJw9kNTubvXqq
         HiNLhwxOlOrVAywe1l9j3kv4GOaMdRam6uhd0YB9ncIyJN7zQAZWVlJ4m1iFrtwyB+tP
         HbXfMEXs1zuMbeqHTD3jLTIMbN44PqLjNyvpjzG6Lfk00K2xs0GtantvGBL6IyzvS53g
         O68gI1F1l7H9JNMTCMoFQvxthQrusFZYXziyA/K9kpNwH5EfkW47nAAV4+iVDsJ47xM3
         chzi0KdcCLUJAb2hvV3yjaoTLjVjmNM8dsM7weDImaIAG+NuC3jHnZ418dYEJRxWhZkM
         swIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783519877; x=1784124677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F6iCbqiFD/hdmKTE2DrZqekV252eUYkKKpzBqjT3c4Y=;
        b=gbjqtztNoCnSOFk58/N4v30ST5t6baL6hHcN50mbJl6CmU5VbccQeXjnL4PncELpl5
         UAbyoWVrI9X6UHzpSuNhqLFFA4lIHydFw/SR0nN7yw9zhXoYv6SHakpmkMxf040xssUa
         CIYTpeOzFxwjLTbtsEIwEwZ338gV/YwEBkMMVRsID1VdgawM0zAz3tShpyF5k1FOJroJ
         TPsexkiD0RHbqx8NrrnkwlNNtIRG3nAxx8Mwn+Sius47U2bY22luyBvYOC0FD18mbJO7
         N8vPYOWkh1PAPUdiu418vQGiMm29jvrF2ImYTcBi0zMR3SpLEbJmOa2nfm+JqgbYxVvr
         7sIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519877; x=1784124677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6iCbqiFD/hdmKTE2DrZqekV252eUYkKKpzBqjT3c4Y=;
        b=l6EjUzNd80YdoxU3p85fxHJJu2kVmmFnDkI0/RnW4MWdq77j/V5Vb5/Bw+t/qjbi/o
         sbegHdSrZI5BgDivb9uPZ2NpGA67Me1h/aiHS2fRKnJV4z8l39hw5MwZ1ajkxn4Rdak8
         qoBMWWgZHwgOgKFVIOI9uyxADK1tihYC/lz2/f5m39S6eJB7fXiQesmBQCKVemON/vvw
         p8/RpQ+3rohFDn3wnXHYOlIbFLpGYMd6eqEYBXSZhzx0Og4URwK1rGvmiuPw2JymQvG0
         6dMp7zrnC+6QaX8cYobM/T+RepwYtWJ+SAEIHNVOLQXh16AsBIH3Gx9NLAuUKUdShJTp
         8N1w==
X-Forwarded-Encrypted: i=1; AHgh+RoBEbbtnad3RFFAl7U9Z9BHX0f9913ajUjy2sbg3PJ7tMpKo5vbBVOXHxkith9txgNxQW7xgYz+5T5gYi1XGow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHo2cTmlBJJDFEl6Iige9PCXma9puITqm8jHdQ/OtQOGdfuCEu
	QTwbV1ZiTsg6o15qUyoCSUtDEyKWXZ50ep6Hh7jzDvOpWK8UhVhXhJhrd1ilDAJsgW2p7i80UDf
	L27PdgdWTFvvDelGz9BxB6BXikuzpaRE=
X-Gm-Gg: AfdE7cmBUH0+udPq8/Idvz0Ev+sl8WgX4S+FFaBkGacZwZVMuLjXpNRunZp/xi1cS/t
	3CRx6PcqvA6XjJlcjKy0o8pLn5eKoLXs9Mj10U2seX8eHulNzbvRBVbPKBPDLBgKWo6Frm4ryFB
	gPEVKCnhNfbGOjhvzKIz/RARGGtl8KRusLyU7t5VFdYcq7MUTMLBnenZQv8mrTWbqHc502/WTkc
	sbu7vkJ6oGeiLLE1TGrV/azqmIgnV1bjrqzHxkrJoirscdWbq/lNHUgso8Vhg4BIzfQlzSNv4CJ
	2heUqEYS+LHO8yo1zdPQg2pmKzA44tzjWhTxBvcA
X-Received: by 2002:a05:690c:9b11:b0:81c:c77b:3546 with SMTP id
 00721157ae682-81dbc7217dbmr21323267b3.21.1783519876972; Wed, 08 Jul 2026
 07:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708090151.151729-1-sun.jian.kdev@gmail.com>
 <20260708090151.151729-2-sun.jian.kdev@gmail.com> <ak5HLLrYK3R_g2y_@u94a>
In-Reply-To: <ak5HLLrYK3R_g2y_@u94a>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Wed, 8 Jul 2026 22:11:01 +0800
X-Gm-Features: AVVi8Ce9tfUoastI5qlwZvx2Zc16Cxa5m1L5o1cpFV_Bz3b7ElwfOC-N99L74kg
Message-ID: <CABFUUZHpPwuTk69hb54WugJwssFuvoqFFPv34dZRbKLLc1PwwQ@mail.gmail.com>
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

On Wed, Jul 8, 2026 at 9:13=E2=80=AFPM Shung-Hsi Yu <shung-hsi.yu@suse.com>=
 wrote:
>
> On Wed, Jul 08, 2026 at 02:01:50AM -0700, Sun Jian wrote:
> [...]
> > Fixes: 022ac0750883 ("bpf: use reg->var_off instead of reg->off for poi=
nters")
>
> Agree that above is the commit that introduced the issue.
>
> More comments below.
>
> [...]
> > @@ -5326,14 +5326,18 @@ static int check_max_stack_depth(struct bpf_ver=
ifier_env *env)
> >  static int __check_buffer_access(struct bpf_verifier_env *env,
> >                                const char *buf_info,
> >                                const struct bpf_reg_state *reg,
> > -                              argno_t argno, int off, int size)
> > +                              argno_t argno, int off, int size,
> > +                              u32 *access_end)
> >  {
> > +     s64 start, var_off;
> > +
> >       if (off < 0) {
> >               verbose(env,
> >                       "%s invalid %s buffer access: off=3D%d, size=3D%d=
\n",
> >                       reg_arg_name(env, argno), buf_info, off, size);
> >               return -EACCES;
> >       }
> > +
> >       if (!tnum_is_const(reg->var_off)) {
> >               char tn_buf[48];
> >
> > @@ -5344,6 +5348,29 @@ static int __check_buffer_access(struct bpf_veri=
fier_env *env,
> >               return -EACCES;
> >       }
> >
> > +     var_off =3D (s64)reg->var_off.value;
> > +     if (var_off >=3D BPF_MAX_VAR_OFF || var_off <=3D -BPF_MAX_VAR_OFF=
) {
> > +             verbose(env, "%s %s buffer offset %lld is not allowed\n",
> > +                     reg_arg_name(env, argno), buf_info, var_off);
> > +             return -EACCES;
> > +     }
> > +
> > +     start =3D var_off + off;
> > +     if (start < 0) {
> > +             verbose(env,
> > +                     "%s invalid negative %s buffer offset: off=3D%d, =
var_off=3D%lld\n",
> > +                     reg_arg_name(env, argno), buf_info, off, var_off)=
;
> > +             return -EACCES;
> > +     }
>
> I was thinking of suggest to just do a single unsigned check
>
>   var_off =3D reg->var_off.value;
>   if (var_off >=3D BPF_MAX_VAR_OFF) {
>     ...
>
> But looking at the code before 022ac0750883, what you have is closer
> aligned to the previous behavior, let's stick to this.
>
> > +
> > +     if (size < 0) {
> > +             verbose(env, "%s invalid %s buffer access: off=3D%lld, si=
ze=3D%d\n",
> > +                     reg_arg_name(env, argno), buf_info, start, size);
> > +             return -EACCES;
> > +     }
>
> `size` comes from bpf_size_to_bytes(bpf_size) in check_mem_access(), and
> is already checked to be not negative; plus other check_* helpers does
> not check for this, so I think it can be dropped.
>
> Otherwise, LGTM:
>
> Acked-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
>
> > +
> > +     *access_end =3D (u32)start + (u32)size;
>
> If you want, this could use a quick one-line comments regarding the fact
> that it won't overflow, or even verifier_bug_if().
>
> > +
> >       return 0;
> >  }
> >
> [...]

Thanks for taking another look, and thanks for the Ack.

I agree that the size check is redundant given the current call path. I=E2=
=80=99ll leave
v4 as-is for now to avoid another respin unless maintainers prefer dropping=
 it
or adding a short comment around the access_end calculation.

Best Regards
Sun Jian
