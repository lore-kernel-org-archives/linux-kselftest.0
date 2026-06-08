Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6E03D902E
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 18:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942727; cv=pass; b=T4fpsb2TJLg7GgucFR0KZNh24CMpsIUoyNjXosx9ppc77lBCcJZll6BWFeSoSE4U3lcwOMo1oeDhrgybEmW2u6bAa7EQeprSyMkX6mbvs/fa03OKHdxIOPnrOXXgrwit+1AZ/WScKhmaPeHiQgV3ga66qHVcI8xo1NyGA7q+Cs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942727; c=relaxed/simple;
	bh=d2yZGc+pur2tsE9GREIpCITGt9vkKOB4lYnN0N72K0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKs15gOOy3Wf1fMksn/xuOV7paUHZwteJu0GLIpPk8rV/cV/euNbR5ZbGsxGNcVxdu3ahzZxO40VO9nJnuiZi7nuiBKex0cmqOgaFjLNtPI2ElT6ZSVuTF9PDDD96MJO8EUXNAchtMyu0lYXXZ8FLwdUoePN8CHidRLCAr6krL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7O2yjPR; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7O2yjPR"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36bcf3d2565so3331377a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 11:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780942726; cv=none;
        d=google.com; s=arc-20240605;
        b=Pt4U6MFHC6K4pZKd3jYFmjfqvymNdzTY/GSGuMSDWt0iLzBGxHuq+clNo8LdiSDC4q
         JOGGUpjQcLtgrWm00NoEu1eBkrRzzOehpJycBcjCs2a7vlywq67lATUiXtSwcuVWfzL1
         GRvfaakNnevCZ4n9nB0YVj9o8Iqrd0Cl/b9JEx9TIvGQf9YZN2VxY5Ip5olsuJCKQwvP
         leLEeBYEDJU5HJWRAYo88S9URJ3tDRnj4aPN2NQi9e+IME6+RWuhs9/TIN8GFVX0ksNe
         tIMqFnwQRGAdBk6n9iPz9dYioJgFtlVPXb4pSSxbm6SwHO8ys1H34SXqYrXm9qsPsHDG
         LhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QVGYoj/1AbUgccCQxiAjwRvdNqm7duAViNPULxhObvY=;
        fh=r3gcnRqTvvchN136Ky0Up8DlNd2t67TZnsXD/WpoYlw=;
        b=YyHSjRBDpux/20fQJCY+Clywc9YA3ekeYh9A/wV4o0Jii9MkiLo9w+m+XFBI32kJMr
         wCWYwhJbPj6qHCdcrK/lqqOve13TlELs1arMg9tZMQ/d7qpVAZ1YbjamUMGWbNb+IrLs
         gHjKhjBO2W6oIA1gIyRAjDFkkT+97ioDwUFLGTdx+KSxE7aDFiLNS+0upsBwbZgqNOmG
         pu2/cYW5r6E3/w2idIAKkp7RSvelpYCSrs1dfnQVsyY5VppTa2jRu7iqApCyGliPWWB6
         MvhjDQlXYbgibT4t7hwJSG3eJb4ELa2wz/r2lAFeJMlm9pzAUc7aXlILswFQCAD/6x3F
         HxXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780942726; x=1781547526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVGYoj/1AbUgccCQxiAjwRvdNqm7duAViNPULxhObvY=;
        b=m7O2yjPRJEOvX3Jn/IHY4LNewqwSiZKGNlgxItNEqywCga0k+HAj/kfVPk6UXYkKY4
         r6XaYqYEQcGkajdXou+3N/Ilfzf7RZzetvoig8yh9rMOfX2lFeBptKIFznCIZLRtPb4j
         SqwCvs7Z1LqKqPb5l/lBWRPUej8VuYOxEveHrnXuoaYxnxH6VVPpip5hCYOVwnvpGKG/
         NTRKAIJkpiXYHIgJ/PWyP9+XJVVHzeYPuZm6b+M2B8RAoCjH45+GVwUi7aSni1Tdzgkg
         Y1oE9s79/8YjrlrPBEZ0nfVtjm153oc105XX0AVgOHT5O1fj8knDaheu8hnwgU1Pd4/r
         UWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780942726; x=1781547526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVGYoj/1AbUgccCQxiAjwRvdNqm7duAViNPULxhObvY=;
        b=JHEkePUCtK88E546tGi37ZXITtdtIcGUCnis3vwJawW14xcHYaNfeK3pBBdRZ35jAy
         udFuBcGD5b75pZ2UjtNsEP+/p+sfKiSqe2Ko8MgHIIh5zlyc1DmG+lQNMzq8xhZxgCan
         WwR9MUeETDW5DWojGT4ZS3Hhg/6ZJRylTxVXr//caT4LTesV7cb4cxrpJRqL9zG8u6q/
         LNw4j1mR1L74zYGI5mGRB5zov2LLBPExZpaWVxH2MaSuiZ4g0MBdvWZUPjjY+vwoFjnK
         3ZzSNuA0dkRfhzVPu/W2JaRWrNXpn0K++pv06PhXm1T7snHEGh+mAzo2ebzv4x3YZemr
         Mc1A==
X-Forwarded-Encrypted: i=1; AFNElJ8pivmdXT2QOTBXnLQ0E7oyD2cOZfkBBidO32Fh+sVwftqmimru0ZNz9lHzS2wxda64XhqE0/ud3lUdUNOcnA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWKHczcekVaCaqeAxVur+JzMMO5WaTNo9Tb+Wqc9G1sl396T8A
	ukZpiNMOoY5jdysH99ee75RExp6737g6lmvWqCOtGNT0NUuAzqTkL44cLp6hTKhoEq9YhgPnbwd
	lYmghh6WKkJ5tZeuIeM5KtbolLmfXStQ=
X-Gm-Gg: Acq92OF0z5DmRXl+T4sR5V09VupFbFX46Aa8GGB09slVYXfImdjF0pZMxBfdzyeG4C3
	Baawxvtyzwp2cWrG761dw+DSRfinZLhggeyZhJWCay7ez6PioonPvZvMYdpfUHnAVy250b5TfQ4
	h1IAfhvIlM+kDUSbrvh7JC8awB7XGtLzdBPt7yoHDsrw518uxykxomHV55WcTYZ+wetnLzVbEbe
	Iw9hUzyUmg4FBzhYQRH1XqDJOWKvOHLYFTrVfPa5W7FznpNLnoFihz3FyFXad7EqTw3zTxFm6Kj
	aHtmlICxgEcck1O9tvrpvKb2mvBUL6Id8mkBDY0UF5HEsM04reUAxUF1LQrljwd3qdy7c7EPwdc
	nxD0TpyrZgJ/b6fs=
X-Received: by 2002:a17:90b:3fd0:b0:36a:3176:ad08 with SMTP id
 98e67ed59e1d1-370f0d52f42mr16776510a91.25.1780942725707; Mon, 08 Jun 2026
 11:18:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529031604.888137-1-chenyuan_fl@163.com> <20260604031033.806727-1-chenyuan_fl@163.com>
 <20260604031033.806727-4-chenyuan_fl@163.com> <a1561e36-08dc-4ad1-848b-88974f529d10@gmail.com>
In-Reply-To: <a1561e36-08dc-4ad1-848b-88974f529d10@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 8 Jun 2026 11:18:29 -0700
X-Gm-Features: AVVi8Ccp1BPMVe7rixi3BZCJ4sZctHvRQuY55dQObYYFeNddy9ZFd7YuHS4dJTw
Message-ID: <CAEf4BzbbmTFaNjT4bRTEm3BxAROkRrTdfxwPNy9HmMt_LFaSHw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 3/3] libbpf: fix feature probe failures for
 implicit BPF tokens
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: chenyuan_fl@163.com, andrii@kernel.org, ast@kernel.org, 
	bpf@vger.kernel.org, chenyuan@kylinos.cn, daniel@iogearbox.net, 
	eddyz87@gmail.com, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 7:40=E2=80=AFAM Mykyta Yatsenko
<mykyta.yatsenko5@gmail.com> wrote:
>
> On 6/4/26 4:10 AM, chenyuan_fl@163.com wrote:
> > From: Yuan Chen <chenyuan@kylinos.cn>
> >
> > probe_fd() converts BPF syscall failures to return value 0,
> > which feat_supported() interprets as 'feature absent' (ret=3D=3D0),
> > even when the probe failed due to a BPF token's restricted
> > program/map type mask.
> >
> > In a user namespace with an implicit BPF token, the sequence is:
> >   1. bpf_object_open() -> no feat_cache yet -> global cache used
> >   2. bpf_object_prepare_token() -> creates token, sets feat_cache->toke=
n_fd
> >   3. bpf_object__create_maps() -> feat_supported() runs probe
> >      -> bpf_prog_load(SOCKET_FILTER) with token -> -EPERM
> >      -> probe_fd(-EPERM) -> returns 0
> >      -> feat_supported sees ret=3D=3D0 -> FEAT_MISSING
> >      -> internal maps (global data) skipped -> verifier EINVAL
> >
> > Fix by making probe_fd() return the negative error on failure
> > instead of 0, so feat_supported() enters the ret<0 path.
> >
> > Additionally add a token_fd rescue in feat_supported() for the
> > ret<0 case: when a BPF token is present, a failed feature probe
> > is treated as 'feature supported' because token creation itself
> > proves the kernel BPF subsystem works.  Real BPF issues will
> > be caught during actual program/map loading.
> >
> > Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
> > ---
>
> It looks wrong to say that any feature is supported just because there is
> token_fd present. In patch 1 we only checked that BPF is available, so
> it was ok skipping probing. This one looks a bit more risky.

Yep, agreed, this is not the right approach. Please double check what
kind of issues you still have with only patch 1 applied, and let's
discuss possible solutions (if there are still problems).

> Is the reason this code fails because of BPF_PROG_TYPE_SOCKET_FILTER not =
enabled
> in the token? I suggest fetch the first supported program type from the t=
oken and
> pass it down to bpf_prog_load().
>
> >  tools/lib/bpf/features.c | 23 +++++++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/lib/bpf/features.c b/tools/lib/bpf/features.c
> > index b7e388f99d0b..f934452e52f0 100644
> > --- a/tools/lib/bpf/features.c
> > +++ b/tools/lib/bpf/features.c
> > @@ -16,7 +16,14 @@ int probe_fd(int fd)
> >  {
> >       if (fd >=3D 0)
> >               close(fd);
> > -     return fd >=3D 0;
> > +     /* Return 1 on success, negative error on failure, so
> > +      * feat_supported() can distinguish probe errors from
> > +      * genuine feature absence.  When a BPF token is present,
> > +      * a negative return triggers the rescue path that marks
> > +      * the feature as SUPPORTED (token creation itself proves
> > +      * the kernel BPF subsystem works).
> > +      */
> > +     return fd >=3D 0 ? 1 : fd;
> >  }
> >
> >  static int probe_kern_prog_name(int token_fd)
> > @@ -725,9 +732,21 @@ bool feat_supported(struct kern_feature_cache *cac=
he, enum kern_feature_id feat_
> >               } else if (ret =3D=3D 0) {
> >                       WRITE_ONCE(cache->res[feat_id], FEAT_MISSING);
> >               } else {
> > +                     /*
> > +                      * A BPF token may restrict which program/map typ=
es
> > +                      * are permitted, causing the probe to fail even
> > +                      * though the kernel supports the feature.  When =
a
> > +                      * token is present the probe is best-effort: BPF
> > +                      * token creation itself proves the kernel has a
> > +                      * working BPF subsystem.  Real BPF issues will b=
e
> > +                      * caught during actual program/map loading.
> > +                      */
> > +                     if (cache->token_fd)
> > +                             WRITE_ONCE(cache->res[feat_id], FEAT_SUPP=
ORTED);
> > +                     else
> > +                             WRITE_ONCE(cache->res[feat_id], FEAT_MISS=
ING);
> >                       pr_warn("Detection of kernel %s support failed: %=
s\n",
> >                               feat->desc, errstr(ret));
> > -                     WRITE_ONCE(cache->res[feat_id], FEAT_MISSING);
> >               }
> >       }
> >
>
