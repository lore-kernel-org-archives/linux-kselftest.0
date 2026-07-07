Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F713264EA
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 08:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413534; cv=pass; b=hKFOQpyoePjAXOjPs/mykSNxVEC4YOkiaEYrJq5MYuaHSC6iQVc/TRhnJlRLlDsR1EU/Hk74Zn+s+YAnX9i9skEocnFkbj5y24ELLDySMiOKNNj2Rc3ePi5A2QCQhgT4bdSwQmtyk5yfkK9Fi5q79AtZr8VpkYz0p4hXZYkgeB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413534; c=relaxed/simple;
	bh=M40TG7c9r5snh3t+V3TfavDILSqPtNcNAuyFiLGJGqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nCIf9cMjZS7W+/3qnGGm0nAJn7tPeN1MlceQ4eiHndNY6gFZuNwsSdIG+7J3Ba4K/U/N9X9wnEbWsn/x7Cw298Xw9pOOOXTk6d/dgZvoK4LEIGfCMvp5PJTm+ti2fZMpzWGBvQWIZuzitwNvAI2nqE6+1TfQBxk1u+heeAhm3EU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNH26si3; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNH26si3"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66771ded50aso2318106d50.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 01:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783413532; cv=none;
        d=google.com; s=arc-20260327;
        b=XKSVJxs/JqkVXm5YUn6829vTUcQijdso+xTj54c0GNUSy8BcSNGC2eTRgadlugU3vx
         GKR//Qg7s5/YE278zRWOH35zIsl/MmDBlJd3laF2hU8+3ZsrpMUsFgkyXSzRWFp4c6MI
         7cUIwXO9Vh11tBqwFE0cLHivAucOoLEC6/ZHPDy1eIFVADyeYzDXMJyj5zgDuIn40zLf
         mW7l5e+gpDDt3FlF8JaqDM9d0YkuKUxjilCgy0MG+wAM8Yr3ZUPSSBuJ3/Y9p1iFSG3l
         xbnOzfdAWWIVdq07k6LTR6+GKWkMD1drB2zBw0pnnpwjZwM+ln8Z5T+EVZktv65AcwHJ
         hjkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZomEEGTGH2mnRXgq1g8Tg7V1t4BtL5TuXlvu5Cqrtjc=;
        fh=LPkla+UF5WMULDV6fFK5zLrOzCbMKoD+vXD5oN99WWg=;
        b=gzhTY5ax7qDeBBUB0/eIG+zcx2l4Sgh+vcWEbgiwftWeCjZKKphilmp7mOyv3swRN9
         7g1ea7TW2Eio+swijMwBTfMmHKOQSBWayFCN0KQP4OIyea/V4KljO1y8hdNc6B8JwonQ
         7db7F+T+6ARwR95UCYTXm2BLTMQZf1cFXPAiQg0L9FQsKzwerTINOEv0mPc8u2Nx3H08
         ZuouWwcjYUgYJeC/in2GP7PcUy8VZT9BV/lvm6bc8K6S8UHlO1+pblRNiNOrz2zuUkDp
         EPCVMNNa8f0QhmmsOuvLmPz1OquSRbOcNWhuga6WH/yJnfxg76D3uLLZ4Q7pKliCm9Fy
         k0hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783413532; x=1784018332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZomEEGTGH2mnRXgq1g8Tg7V1t4BtL5TuXlvu5Cqrtjc=;
        b=gNH26si3xv8pRCak+aiWVcJCFh8lqS5+ZsSwyxX813srdAjMVpwBdGaywHqoc8ZyXk
         ylmkGKSQn8uOXT7ewh9FpLTWcokaEni3YVFLxUYdP0FV+gGsA1Yn/d5p7MjrVXabZHyx
         OYP0rusFu/zsBnqYOK4v1pnL25gGg1R5crHgR9jMdg8o3wmK1mVchdHxLPruZ6TutUXh
         0tah74ijcNbd/BP7eB2z/nQj2IT2b15izx/kI/nq3MScvtecIllmn/Ki6MwnvGx4TvVQ
         BrX6SngToTbCTdN8YbJgofEhAXe8ayDySBn7a83ihXinsuWv8u6QOIGpH4ne5ZrIhkYy
         oIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413532; x=1784018332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZomEEGTGH2mnRXgq1g8Tg7V1t4BtL5TuXlvu5Cqrtjc=;
        b=o/lGtnkuhcSKGVz8aeABm/lANodmuCT+lM/VRo5RztB+W9zbPAnz2tLhQoiLr+TUMb
         skRbcxr+m+o91oRUzwCOuE6sVaqj0G6mw0vbIwSF9r7kjjaP3WEftqXNgvhiy4NFDIYA
         Xki+hKkDfVJqLr7ebciuL4hGx//GpPTbtl06HDeM90JtCIrxkFzv10n0xmTYgouYv9Ns
         0S7bUz4zjVKy3mA2GhgGh1xKPLQi9/03kT1m43PnsE5XL4vSkNX9FuZ+Aftza/E3Z1sh
         FFDYx8RPuDvNjyDeA4A4uV6bXxzt3jiFCwC9KZ3XftIBFj9LuozFk9J8G3hM0bjEMVjW
         z2Mg==
X-Forwarded-Encrypted: i=1; AHgh+RpyfFm5Z/eQgTXVLSR2gi2fvQ4kzOeJ5G7eBeq+zle6RXEUTRK8tB+UGwF0vGzUSgVQecmKkDLUNOd9mxYlF68=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuPBtAj5bgYzMd/TnSnKDKIfFObv4n16T6asqcSJK1YZj/zpem
	fwmsPnX/41mzhxXO4UbSp8IH1lvvFuTRE4rbhuw0QXRw5dQYFge7SVda1Oha41Fw1zSsAMadjDB
	Tq4nyHO5z1OMI27y+tC6/xUawmbZzUlc=
X-Gm-Gg: AfdE7ckamaFn4T5bxdNGLZtwx6/ltsn9LxT9DxM2wzk9yZjCt3ZcS1AJwLr14b6ebyy
	O2AQjM/m9ZAK29LBahwdS/lTNM/j93ECVEJueln2oFtBa712dBLsTvYyBIw1UMZ31JyapTZqoid
	OnIPyeOPJYPgkeljhsM3/PndVU2b+JNnOsXGEetrOjn0otbTQMOHsG+ytGnYdMPK3XOgLctpwuw
	hMHHX5fZayssJI2VO7TAvxzwfpGlAl0pfD8bVW7jmQgCfJB1ZrYxSLaTjMtHoSkoIkdQlBh4Hay
	rdux2SdzGyxVqh7vo4/iFHiRWdY3k2zjnBYAUk7v
X-Received: by 2002:a05:690e:12cb:b0:664:dbfc:e454 with SMTP id
 956f58d0204a3-6677fa53cd3mr3038526d50.3.1783413531695; Tue, 07 Jul 2026
 01:38:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707060804.93561-1-sun.jian.kdev@gmail.com>
 <20260707060804.93561-2-sun.jian.kdev@gmail.com> <akynPc5YJKD12963@u94a>
In-Reply-To: <akynPc5YJKD12963@u94a>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 7 Jul 2026 16:38:40 +0800
X-Gm-Features: AVVi8Ccml7vKiUy3CRrWyBg3h2LKdgMnGaOrJjZ3WaoHakhkVoHtqOvoDbMJT8Y
Message-ID: <CABFUUZH44FfBqFdKhs8JdJrrB9_XqOzm-rTAsShbNLn0ZXOhcw@mail.gmail.com>
Subject: Re: [PATCH bpf v2 1/2] bpf: Reject negative const offsets for buffer pointers
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	shuah@kernel.org, mmullins@fb.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 3:17=E2=80=AFPM Shung-Hsi Yu <shung-hsi.yu@suse.com>=
 wrote:
>
> Sorry I missed that there was a v2 already. Reposting the comments I
> sent to v1 below.
>
> On Mon, Jul 06, 2026 at 11:08:03PM -0700, Sun Jian wrote:
> [...]
> > @@ -5344,6 +5348,29 @@ static int __check_buffer_access(struct bpf_veri=
fier_env *env,
> >               return -EACCES;
> >       }
> >
> > +     var_off =3D (s64)reg->var_off.value;
> > +     if (check_add_overflow(var_off, (s64)off, &start)) {
> > +             verbose(env,
> > +                     "%s invalid %s buffer access: off=3D%d, var_off=
=3D%lld\n",
> > +                     reg_arg_name(env, argno), buf_info, off, var_off)=
;
> > +             return -EACCES;
> > +     }
>
> Other pointer offset checks (check_mem_region_access and
> adjust_ptr_min_max_vals) seem to check var_off against BPF_MAX_VAR_OFF,
> and that `off` being >=3D 0. It would be great if the convention can be
> kept for consistency, albeit being more conservative.
>
> From a blind guess I would guess that compiler does not product a
> pattern where `off` encoded in the instruction is negative but the net
> overall offset is positive for PTR_TO_TP_BUFFER/PTR_TO_BUF, and
> rejecting such pattern is fine.
>
>   r6 =3D *(u64 *)(r1 + 0);
>   r6 +=3D 16;
>   r0 =3D *(u64 *)(r6 - 8);
>
> One more comment below.
>
> > +
> > +     if (start < 0) {
> > +             verbose(env,
> > +                     "%s invalid negative %s buffer offset: off=3D%d, =
var_off=3D%lld\n",
> > +                     reg_arg_name(env, argno), buf_info, off, var_off)=
;
> > +             return -EACCES;
> > +     }
> > +
> > +     if (start > U32_MAX || size < 0 ||
> > +         check_add_overflow((u32)start, (u32)size, access_end)) {
> > +             verbose(env,
> > +                     "%s invalid %s buffer access: off=3D%lld, size=3D=
%d\n",
> > +                     reg_arg_name(env, argno), buf_info, start, size);
> > +             return -EACCES;
> > +     }
>
> If we check that var_off is within BPF_MAX_VAR_OFF and that `off` is not
> negative, then `var_off + off + size` should be guaranteed to not
> overflow max_tp_access, since the maximum of `off` is S16_MAX and the
> maximum of `size` is 8.
>
> > +
> >       return 0;
> >  }
> >
> [...]

Thanks a lot for taking a look!

This makes sense. I=E2=80=99ll rework this to align the buffer access check=
 with
the existing verifier offset convention, including the BPF_MAX_VAR_OFF
bounds, and send a v3.

Thanks again,
Sun Jian
