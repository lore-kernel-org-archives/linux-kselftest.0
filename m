Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983B5261B8D
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 05:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783662760; cv=pass; b=A5+7YWyS49ojS85mtKu6kCTIGS32Owp708bixEMlzYYWl8VAvscm5He81CE2gGqZyAwVk9nG0h18CouKF7UW0lBnzEKtHxt6XvlCqdZZVNZTpNAKgXX6vFuHr7JzYL+TA3BdKc5FRTty3IZXrEmIXOxXtLn1XSgcZuSe8R9fk30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783662760; c=relaxed/simple;
	bh=+MG1Qi9M0mT7yxk5F9FJgfR/GOircb4mwRcPoT9auXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0n+fdt0N37mPCQ/BL9fY7ReChsRzqICuRHnEHNJ93ijoZnpkzCAmzTt2HkqLpBfcStYpkyEUAF+eVt/Q/ZM/MoTy4473U5Y+v4SBSs/hH9r2EI0t0BniTZGBTd8kYEBmECD0xNrrMOUM6xxKy8nXl7c0LWt0e98KKmUc+fhlJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gE2ytdvG; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gE2ytdvG"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-804e46366d7so8029877b3.2
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 22:52:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783662757; cv=none;
        d=google.com; s=arc-20260327;
        b=K1HL1fKuyYJy6t0WwLxabkHw4ppdn/NAtwmTrbUZRzZEIdH1CtYz8akPOXbqZ51fsR
         +5wDSRiRQKJFhtHh52pSmhVvE5lzsKYSaZ+Irr0cScmXZyS0Lj5n7hB50zX35TttmVOu
         biNFr3ZC+NrDdWxRCf2D2UXATFdm/0USHyba2HQcF3ARN6rrDeh1r9NAt6x9FTwrTW31
         LN8NXLLpLZE/pQnTfSdxhXrjLo2yycQ4ier35XTKvqVQY8j77jaT29fVbG550xfwykQS
         6FQ8RxTUFzvjcVocGoL8bK0JhKHgUk6+eXHXZG2Di5Phr8+q0H2qHWhunweeS2rV2hYY
         BMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7O3AJIZeQn9Qrfct+vB6f8IsCssIFPCOzh5f3SgUMkU=;
        fh=DCdNZrLjY6F9LCHMaeUlSQFnnypQML1OatfzW8BaSCQ=;
        b=njNXdElY8alw9IYCHBg/DaXGGI5zAmSxs3lN3oCz/nw91mIi6aQEmdjFLZlZhCVlq7
         //qW0Ck/tbHuUarHd5znwJyhwGhX/0ySWepHhb+Bd3fzhfzwO/oRRgJeyfpaom/IdwgR
         X/iHuWU42hzw7Fy2L9DyOJVwhSf9RNxRrZGYJdLcjLobqfg100htmk/PDUW+a61eMwC3
         TJ2laJ3pfSdRWIWuYycq8XtFHE+HzTgXJ6P9Q6RqcY8fl+HsOd7jSHmCFPjV5adv0lfm
         JtPUJoCrrIn12HYxath9sLM5RWIE4GMwQNLXDvg4Vbw5EYC4/yJp8PCVPRS5iUzLww6L
         ZhUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783662757; x=1784267557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7O3AJIZeQn9Qrfct+vB6f8IsCssIFPCOzh5f3SgUMkU=;
        b=gE2ytdvGyMucMh/MmsRIzvz2d8LtFOn2U7sgmj40Ku7XdU+0atuowDHhZaEsyXZ0zp
         sx+sZdbIwN803Gf2c2vdDL+MXwP1SaE75pN0YNkAcIJFLBw0wtjDLCCNQZaSrCIh2yiL
         9dyo+mrNc4thuNvpZkr0/YTjo934YLSUhoH985TdE4WWixULpCh/cgSsMzDedygnD7uh
         vZjojuCOLzDP9gumLnliuCo6jlZ48go0ZkLq8Mu4ja96SuRe2vx7kvycF/gDIeL70RAK
         Ik1b2HZA+F3Feghg/mFpbAk8LytNfBgimIqds7aN0f6Rb+BRbOG0HTDyArScL4ChfFm2
         Lo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783662757; x=1784267557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7O3AJIZeQn9Qrfct+vB6f8IsCssIFPCOzh5f3SgUMkU=;
        b=E5vCqqh7xzoK63awQHD6dFdhI2KBV2EhV4myXuXAXG0iGbz96PFwpqrw9KHJqVWXNf
         oSl9aesKbY0BNKP6tBeWpqtTMrRwOxmyWrEH5nj2XKzkirAt/KtqYFOHzNqt2AYbRZGQ
         Myhe1hy0ZHAcg6jQq3UzI+tIkAMzgQW9Cbsq9g1riBkXyUfN0ZSuUCMez6Sq7ftRwavy
         /hNcn/9qDt/x8UXks1JBtRuIhRcr7ABOfHCm6bnspekc/qa1Gh7jTZyIn67Ah4a0yRfx
         N7wZCmQFSQu6/tfRORArAlxLKI86QtlNmztu5VSh+nYU85DqfWFL3yYbQzVcJxVGq3EY
         nliQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLT7WIXkQs1GdcI9q0z99qe19ObyLsv6CDrZIeevvnzDvHB+76z19Wz0j/N0vnb7XaXPYv8NfwXWFJNerf2QU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzWw8ajg6i4ASzHSohmrkn25KFSlwyY/XBo1XeeuxYpm4gZeYf
	3zzi4fBXJW+XfZyZXX+ITV8f2NjD/o4QxXT5BLeDv+FC1iYtJQ1P/eTBkw02UFMDW6CsmOqEeJr
	8XAJtDQ/xUG/AtKSITidqdC+6jxYCiuA=
X-Gm-Gg: AfdE7clx7qHEDZEHy4cniESVmvZsUL//5xN/wmyfhFdY8Q4VIwVQ1nF07r1LUOkU8VD
	dNF0GLGK6Psw26eGyTiLmVi1DSJn8EP230NzP7b4Zj8c8vU0uR/sm/I+CBl9T44Is1Aq/zzq3wD
	9fDAtocCaRPRqgv48V3Ac0CrdBFefwBn4t7OODO5LBo5p5Oz9hO7q36+fpbS+W5Pdv+aYr7p7ey
	yIR14Gkgrak4xpp02DdgghBn3vJu0XoCV94YHbE2JUt4j6LO6ctBaTFDrXkXzzdS80NcoNgzNoB
	k+aHbppNHLhMwbrwOwvioDa29Hz3e9SApH29gzVT
X-Received: by 2002:a05:690c:7347:b0:80b:9f4e:a70 with SMTP id
 00721157ae682-81dbed5a177mr76937627b3.26.1783662757537; Thu, 09 Jul 2026
 22:52:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708090151.151729-1-sun.jian.kdev@gmail.com>
 <20260708090151.151729-2-sun.jian.kdev@gmail.com> <ak5HLLrYK3R_g2y_@u94a>
 <CABFUUZHpPwuTk69hb54WugJwssFuvoqFFPv34dZRbKLLc1PwwQ@mail.gmail.com>
 <ak8XSRiLKx5WcIQw@u94a> <1f8aad47f61fbf85eb55276e4bb01bfcff61393e.camel@gmail.com>
In-Reply-To: <1f8aad47f61fbf85eb55276e4bb01bfcff61393e.camel@gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Fri, 10 Jul 2026 13:52:26 +0800
X-Gm-Features: AUfX_mxoloAOLwnU9E3LfsurTGSW9XTQcbVzKw9ceMG67r-JRVwdu0zaL1nYQso
Message-ID: <CABFUUZEXYduca34g22YZ1ESyYe3Yc3kYQrTEWLMxB5X0ZmYn8w@mail.gmail.com>
Subject: Re: [PATCH bpf v4 1/2] bpf: Reject negative const offsets for buffer pointers
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Shung-Hsi Yu <shung-hsi.yu@suse.com>, bpf@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	shuah@kernel.org, mmullins@fb.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 2:21=E2=80=AFAM Eduard Zingerman <eddyz87@gmail.com=
> wrote:
>
> On Thu, 2026-07-09 at 14:47 +0800, Shung-Hsi Yu wrote:
> > On Wed, Jul 08, 2026 at 10:11:01PM +0800, sun jian wrote:
> > [...]
> > > > > @@ -5326,14 +5326,18 @@ static int check_max_stack_depth(struct b=
pf_verifier_env *env)
> > > > >  static int __check_buffer_access(struct bpf_verifier_env *env,
> > > > >                                const char *buf_info,
> > > > >                                const struct bpf_reg_state *reg,
> > > > > -                              argno_t argno, int off, int size)
> > > > > +                              argno_t argno, int off, int size,
> > > > > +                              u32 *access_end)
> > > > >  {
> > > > > +     s64 start, var_off;
> > > > > +
> > > > >       if (off < 0) {
> > > > >               verbose(env,
> > > > >                       "%s invalid %s buffer access: off=3D%d, siz=
e=3D%d\n",
> > > > >                       reg_arg_name(env, argno), buf_info, off, si=
ze);
> > > > >               return -EACCES;
> > > > >       }
> > > > > +
> > > > >       if (!tnum_is_const(reg->var_off)) {
> > > > >               char tn_buf[48];
> > > > >
> > > > > @@ -5344,6 +5348,29 @@ static int __check_buffer_access(struct bp=
f_verifier_env *env,
> > > > >               return -EACCES;
> > > > >       }
> > > > >
> > > > > +     var_off =3D (s64)reg->var_off.value;
> > > > > +     if (var_off >=3D BPF_MAX_VAR_OFF || var_off <=3D -BPF_MAX_V=
AR_OFF) {
> > > > > +             verbose(env, "%s %s buffer offset %lld is not allow=
ed\n",
> > > > > +                     reg_arg_name(env, argno), buf_info, var_off=
);
> > > > > +             return -EACCES;
> > > > > +     }
> > > > > +
> > > > > +     start =3D var_off + off;
> > > > > +     if (start < 0) {
> > > > > +             verbose(env,
> > > > > +                     "%s invalid negative %s buffer offset: off=
=3D%d, var_off=3D%lld\n",
> > > > > +                     reg_arg_name(env, argno), buf_info, off, va=
r_off);
> > > > > +             return -EACCES;
> > > > > +     }
> > > >
> > > > I was thinking of suggest to just do a single unsigned check
> > > >
> > > >   var_off =3D reg->var_off.value;
> > > >   if (var_off >=3D BPF_MAX_VAR_OFF) {
> > > >     ...
> > > >
> > > > But looking at the code before 022ac0750883, what you have is close=
r
> > > > aligned to the previous behavior, let's stick to this.
> >
> > Actually looking again at 022ac0750883, moving the `off < 0` after
> > tnum_is_const() and bringing back the `off +=3D reg->off` removed from
> > check_mem_access() is perhaps the more faithful restoration of the
> > original behavior.
> >
> > Though reg->off no longer exists, we have to use reg->var_off.value
> > instead. IIUC any register of pointer type should already have its
> > var_off bounded to +-BPF_MAX_VAR_OFF by adjust_ptr_min_max_vals() in
> > theory, and thus shouldn't overflow `int off`.
> >
> > See the diff below.
> >
> > [...]
> >
> > > I agree that the size check is redundant given the current call path.=
 I=E2=80=99ll leave
> > > v4 as-is for now to avoid another respin unless maintainers prefer dr=
opping it
> > > or adding a short comment around the access_end calculation.
> >
> > Agree and make sense. Let's see what @Eduard thinks.
>
> I don't understand what this patch is attempting to fix.
> If you run the selftests from patch #2 against current bpf-next both
> would be rejected. If you extend these test cases to exercise a truly
> negative offset, that would be rejected as well.
>

Thanks for pushing on this. I rechecked the issue more carefully.

This series targets the bpf tree, with base 12091470c6b4. On that base,
with only the selftest change applied, the negative-offset verifier case
is not rejected at load time. The test fails with an unexpected load
success:

#664/2 verifier_raw_tp_writable/raw_tracepoint_writable: reject
negative const offset:FAIL
run_subtest:FAIL:unexpected_load_success unexpected success: 0

It is possible that current bpf-next rejects this earlier through another
path, but on the target bpf base it does not.

> And this does not rely on UB.
> Consider the current code:
>
>         env->prog->aux->max_tp_access =3D max(reg->var_off.value + off + =
size,
>                                             env->prog->aux->max_tp_access=
);
>
>
> The types of the expressions involved:
>
>   reg->var_off.value + off + size
>   u64                  int   int
>
> The promotion/conversion rules:
>
>   u64 + (u64)(s64)int -> u64
>
> In other words, 'off' and 'size' would be sign extended to s64 and
> then treated as u64. Hence any negative offset would be represented
> as a large unsigned value in max_tp_access.
>

Agreed, this is not a u64-to-u32 truncation issue. For the problematic
case the access range is [-8, 0), so the end offset is 0. Since
max_tp_access only tracks the upper bound, the attach-time writable_size
check cannot catch the negative start offset. The missing piece is the
lower-bound check.

> Now, the real head scratcher is whether u64 -> u32 truncation on the
> assignment can bite here (mask higher bits of a big positive or
> negative value). Given the bounds on the values involved:
> - reg->var_off.value is -2**29..2**29
> - off is -2**16+1..2**16-1
> - size is 1, 2, 4 or 8
>
> It cannot.
>
> If one wants to be truly paranoid, one can add a truncation check
> before the assignment, just to avoid the mental gymnastics.
> But that won't be a fix for any observable behaviour.
>

There is an observable effect on the target bpf base. I tested it with a
temporary raw_tp writable test_run reproducer, not part of the series. It
attaches a raw_tp writable program to bpf_test_finish and triggers it
through BPF_PROG_TEST_RUN. The program does:

r6 =3D *(u64 *)(r1 + 0)
r6 +=3D -8
*(u64 *)(r6 + 0) =3D 0

With KASAN enabled and the BPF JIT disabled, on the bpf base without the
verifier fix, the program loads, attaches, executes, and KASAN reports:

BUG: KASAN: stack-out-of-bounds in ___bpf_prog_run
Write of size 8

with the relevant call trace:

___bpf_prog_run
__bpf_prog_run32
bpf_trace_run1
bpf_test_finish
bpf_prog_test_run_skb
bpf_prog_test_run
__sys_bpf

The report points to the bpf_test_finish stack frame, which matches the
raw_tp writable program being attached to bpf_test_finish.

With this series applied, the same negative-offset access is rejected at
load time:

R6 invalid negative tracepoint buffer offset: off=3D0, var_off=3D-8

Rerunning the same reproducer against the fixed kernel, the negative
program is rejected by bpf_prog_load() and the KASAN log stays clean:

NEGATIVE_RUNTIME_REPRO: negative_bpf_load rejected at load time: fd=3D-13 e=
rrno=3D13

So the observable behavior is the missing lower-bound check: on the
target bpf base, the verifier can accept and execute an access before the
writable tracepoint buffer base. The patch prevents that by rejecting
negative effective buffer offsets at verification time.

Thanks,
Sun Jian

> [...]
