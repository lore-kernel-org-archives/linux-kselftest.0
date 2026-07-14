Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DEE34B1B0
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 06:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011114; cv=pass; b=fjJqSTkBvzjVeryn0JAiS1FHwamDYhp/hmQe2sQvs4Qgu54Hjmnklo6+hErl8+R59+MRrrJKT1Ouzvd4mFV7lzzMcFVSN+KFQiarCRVeYoChGqxlIrhjexO3jg1MsfyWE5gnoQSBdr3BAk0fsiUsyTwSutYPfwyGJl2bIb5Nj3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011114; c=relaxed/simple;
	bh=y8xHWmkJkqubTyz+Whxf6Mqk6P6YdMklCfjtCXAS0DI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zv19HgBZcTOtnI2y0yX6zoHfs5ZSBU+29CLixzyHpVPT3zc3vh+XwnC91tkYEv4cC1GgUUeMhklT4J3IhitY9h1HTwOFfGbU+xom+h4rirZ3raoabry4uT3uM9sWAZ+IasT2I0DCDygBK2Xz76zTe9YSJy1VHM5yV5AGygWx8EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCtyWsHf; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCtyWsHf"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6675db463b9so584921d50.3
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 23:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784011112; cv=none;
        d=google.com; s=arc-20260327;
        b=SkLZqOyKZRUm/qynBVnHZi2+O5OUdHo9Vx9zZDju0DUK0ZmUxVRfVSz1aXu30VxNEl
         YaG8GU8jWQUJk9BRPgkxns3JDebJ6DDZcalrI8Mr0U0M9FJER+Gtrkq7umH/wFGnxEfQ
         7NGVlR2aQcZJSbSQ6JWrif+GaqxOV1B35stQ8o/YQRVPE2EweKWDhcd3rGCPbHiJswii
         zKnurEloIF6HtDJZ8J8vu0VnSYb5GHhgRgjrM+axP2R+in+GRkJNv35t1ZYzsabYyA+3
         rcPcRnGWkkKc9ngCczqUhUMYS8WFQbufCNsHM8sC8HBbTkfqdBkLTR0RF6wUG9iEv7p/
         KZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kfYwLW4pS/TGI+RDVYXaWxQ3zgK1Q7Yru9JeS97oBl0=;
        fh=6sXPErCdIUCujvnCA//kty/2Hlt3Oxl2/mdo6E3bVFY=;
        b=DmXZMpyQls0Aj1O74Mprudu/NgI4gl2mS8vfIpSzCCSwAkhiZf33NzEDOduVoSVfUJ
         UeVv7xrfYYMZ//wqvNQmbMdyy2W86sLGnLfisvbl8HYETsrMdzlcjvnNpbss7EG6CBdz
         FaAQnLTbUH+iYQKc1b/dILcaA4JaBWXLl6itOjagx5eR9gcmj8/ETx14RyJqXMFIyUB3
         12bIeBkLRijF6lagTTNJE6u6QY1vzJohuqNT2RZ3MUMt925StqMClhCGvXmsYKFw2Lul
         FPWw6e8LKxqM9KnHMsrZyWsb2fUCXAU+SEdFAwAQSf22Id4eIggEGqf43L+HvFHlbLCc
         veYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784011112; x=1784615912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kfYwLW4pS/TGI+RDVYXaWxQ3zgK1Q7Yru9JeS97oBl0=;
        b=DCtyWsHfFa34WGsH/FU/ot7DL5lVk21Ch+IuYgixgMS4QZv9kbkkyRzqYaBoFEvX4C
         bFcorL8VOrUHln/Gvpjdv+/KUfjoFj/Lojy5roxQZ+cQn2yWNIpEgWdssicH9SQ8lykD
         haxzX2zUNadlg4BEJ+bzMTTAAzPINuCa8Ls51MmfrXccgxxhKZCiI2NTgR6X8MA1U9Ty
         rGAh8DbmKdOdzA8Ru30bTsolChfKwIC/Z27EezlEX1WIcmd8ZEDwGiMb1t7NosDGZnAz
         WwWp+32sQXQoc8UutywqsInzhfmWo1DQ2V4A4gsA3n6NOr6abhr0L73gw3YHC6maGr1C
         z9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784011112; x=1784615912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kfYwLW4pS/TGI+RDVYXaWxQ3zgK1Q7Yru9JeS97oBl0=;
        b=Zi4GIy+ceNBh11quB+9083qidKmaozgrqBHPLvKGf0NOP6sv4Iw6PQkIZ0RcQSSLC/
         UnChg3D+8sGwYU6Ew7EtetDX6klQm/i6oEqAdkXd8DjKZ+qlnhztKT51NKjhK31HJsrA
         tALvEerniYOz+4Xaadh4CsrK/6LqfIdWu7Kcm+Br3hq80YHliU+uBMyyyUMop1LC+Fzt
         js9TgkK/HrCHl+TWe1eNJvxCnhSiB6Y/PtOPU3vZIqm/opWfJHVNV6/kqxAJG7/YsAKh
         jTf+STQaY6So9n9w81JUeXkw3jDVJ0BMRBWy/ynm0+y7UEQOvu9wr8viXl8HY/CNF35e
         yNEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrR0zQJJwV5vJllCQJ0afbEE8Bm4axVi4z8Y2LqQEA9A9GR9Yy/PbiHutRwgQlhZ+VVMd9hbapmk2y4maxrXPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNrE0sWieSQhO09sJGk0yMMJStDaqqzB/e8pOy7Y0dT1EbCqML
	KsAUxZOWfLnWWnd9uiEA1gfxL3Hb2yMz0upNIZOM6VyfAboyqKzlzCuAuRjvlb8szgl4lqensDB
	Khknt1fQJDNVlTT/M2XICGOOJRierTck=
X-Gm-Gg: AfdE7cm/VsSQeFBw+/E2asHnTujIM50vBBTXUGvRK7BNDjecceS6iQHB3vvPHQUG3RD
	lg1ScuyXh1vDOFXLAgb009b+xeEHrE6V2qq79+6pBzAYeHVVw8fef8VYzl0WNUd+ison9rpNWJJ
	f4vnmRceDle9iL6FC3y3MgucHvfZHI+zorNUyCQjwA1NY0wPBvvaKSzNIJ5jONi0FtLkI5A2JaR
	Xggg5jxe70Y2J5L2gs7O2mjnW+z0qUiMow8HTNT7FVDL8Owad7SUSqRR27JEmB3xt/a4iXGkHT5
	ETG1D/qFFY3C27S+M56JDNjRtx0o/33gvdcyaa7COOCkJUPpTUw=
X-Received: by 2002:a05:690e:1447:b0:664:ae6a:ee9 with SMTP id
 956f58d0204a3-667d7be0259mr7772187d50.71.1784011112312; Mon, 13 Jul 2026
 23:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713063513.215781-1-shung-hsi.yu@suse.com>
 <08508d2133284d49e1da297895c85cf854a97bf3.camel@gmail.com> <alWsBzShn4sgDRl-@u94a>
In-Reply-To: <alWsBzShn4sgDRl-@u94a>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 14 Jul 2026 14:38:22 +0800
X-Gm-Features: AUfX_myWt_NEQQv-BJRVLkgSebpkvKsdZl_YXe7JCUgTiKFP3vZHGE0QBxAv-Pg
Message-ID: <CABFUUZFJ6N6uC3kJM+qRcMFk75S2+6mTK_+052u3zdscz=DErA@mail.gmail.com>
Subject: Re: [PATCH bpf 1/1] selftests/bpf: Enable BLK_DEV_NBD for raw_tp_writable_reject_nbd_invalid
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>, bpf@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matt Mullins <mmullins@mmlx.us>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 11:32=E2=80=AFAM Shung-Hsi Yu <shung-hsi.yu@suse.co=
m> wrote:
>
> On Mon, Jul 13, 2026 at 01:47:18PM -0700, Eduard Zingerman wrote:
> > On Mon, 2026-07-13 at 14:35 +0800, Shung-Hsi Yu wrote:
> > > The raw_tp_writable_reject_nbd_invalid test relies on availability of=
 the
> > > nbd_send_request tracepoint, which is only present if the selftest ke=
rnel is
> > > built with CONFIG_BLK_DEV_NBD=3Dy and the kernel built from current B=
PF selftests
> > > config lacks.
> > >
> > > Without it, the bpf_raw_tracepoint_open() call always returns with -2=
, leaving
> > > raw_tp_writable_reject_nbd_invalid test always passing without exerci=
sing the
> > > checks bpf_probe_register().
> > >
> > > Cc: <stable@vger.kernel.org> # 5.2.0
> > > Link: https://lore.kernel.org/bpf/alRtilWhKw4zzMkI@u94a
> > > Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
> > > ---
> > > Not sure if fixes tag is the right thing to use here, so use the cc
> > > stable tag instead to get this config change propogated to other stab=
le
> > > branches to make stable BPF CI's job easier.
> >
> > Shung-Hsi,
> >
> > Thank you for figuring this out.
> > I'd suggest we switch to bpf_testmod_test_writable_bare_tp() [1]
> > from the test module to avoid the config dependency and let
> > Sun pack all of this as a single patch-set to simplify backports
> > (if such are necessary). Wdyt?
>
> Make sense, that's probably for the better.
>

Hi Shung-Hsi and Eduard,

Thanks for tracking down the CONFIG_BLK_DEV_NBD false
pass and for the test-module suggestion.

I'll fold everything into the v5 series:

1. Keep only the necessary effective-start check in the verifier fix,
dropping the BPF_MAX_VAR_OFF and size < 0 checks as Eduard suggested.
2. Move the attach tests to bpf_testmod_test_writable_bare_tp(), use
subtests, and remove the NBD configuration dependency.
3. Add the PTR_TO_BUF negative-offset verifier case requested by Eduard.

> pw-bot: changes-requested
>
> @Sun can you make sure to include the follow tag for [1] when you send
> it? Should give a better guarantee that is will be picked up by AUTOSEL.
> Thanks!
>
>   Cc: <stable@vger.kernel.org> # 5.2.0

Will do.

Best Regards,
Sun Jian
