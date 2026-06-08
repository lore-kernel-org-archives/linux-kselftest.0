Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CD63D3480
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 18:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942670; cv=pass; b=O8VpGJpm+qURzHVJmTorKytsJszjhcwrhFq/sgHiCj6ga4dZaodq2qgbfbVZgq+kFcpfr97chz1uepl0e4qIkDnCqM0rPmnTzMCkJgUW5C/cyXYnyhh2jFjQAecHpswc0bVBFWibkeWodiktYjiStWQR09odPMb6l9wvSbb2b5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942670; c=relaxed/simple;
	bh=qEXPWKJAUq9h7gKR3mFd+TXuFcMvNL0MlYhGUvYhw74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEEuUALgpextB0byVjkcJAutCTx9hKHuIQN06BxeJ7h3RidoTIDLZAYNa/7SH4tUAaCdaPof6l6Hx1RYbj97A560D079DeQ0GHUH/y8xarGD5vjFPueoIP3GxItDKbzIKQHvb3nHEFd4Z23eJ6aStqvtdWIxxbIKdiDrnJovkK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcSDhrqL; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcSDhrqL"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c379e8ffso31649455ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 11:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780942667; cv=none;
        d=google.com; s=arc-20240605;
        b=hmbakt/ZJE6GplKaHLJV926dhgLHqqSEM6mhKGnjEVpJ4N236crITwuoWV9F2Rlpsa
         ++XQ5PB0Zdb/Ywn9upqpjmF65A+310ia+fv71f0BU8FMg8dWI8hb+8uLL5CB/73DyFWZ
         3ELMRwLxAYtDQDzlEQNl1cLlAzbidz2VvUX3ZH/ibg7+XRr3XGQfUuJIwoo2mAdHiiIP
         Y02uwiZ2vvVGoK8twvkRBiegPtvqNIcUpOgrmPYah//Vaz+pOyA62UewEpALSo5UaAsc
         Ytr3A/+jdFLrwlrRMX9X5DxlAs6YVqfUkfTTHHZG2hoePe9Obzk8wMIQZKOBlpi21hV3
         Iiww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t5DnDar6JBnPe48ajQB1Hb9265gKUCW9aay647po/SI=;
        fh=Zrs6nMyXrutz0GRzCKsoMzawIdGuxgsyKUb5oMzbQ9c=;
        b=jv5jgiNTpBgUtcP/PGY9nheuMy0yU5HhPZDlFAlLB1UbE9NVkJAuROZE/yaCBgjVea
         H7sYNWcfBQLO2/l74lk8tt6jwImQfqxpRxY5ZZmUEnP95rDFaxVnFbrZewlgLDPdbw9p
         H33qjh4drpdRy3SW9+kJ9hAe7nepPNfCdTh4q3Cb8iAe6wXBEvUFdLnRn9xbZ6EhR6Hh
         Al9yUTHOj5BFdU4akpvFB6a9L2CHyNe8C8zHonItj0htS/oerav2evmq3eU+fW81ky9t
         ct2BLGULnd3gut3zv82QP8KPRwKRxFpiqUekAun4l2bsJo2+gREha1LL5tiUxMkfoC/G
         UJaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780942667; x=1781547467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5DnDar6JBnPe48ajQB1Hb9265gKUCW9aay647po/SI=;
        b=pcSDhrqLqZgA9oHaxYDBaH5WqiBwXPi5NJ7hSn9ETt3Eo3lmZ39nh4EyGS3XeWgueu
         BxlUSn7HvrLwOdQcML8aQfaJVcODOfB7X5GCDVCeQYG+K7bIrTSJAud1ht9BIrurtHLX
         XBCF0dz0vlzEF6MX6I/gf6X7YqxVZIu5v4Crkzjt9pKpJm6MV9xq3K5sDcnQVYcRQaWA
         7YNUqEK+S90fHiNtO40xi+pSs5bcIrcd0CQNSd1TxCPjG2DDv0UJ7btUqUeb2hRakZRA
         maKSifJtb1ElbQZ8+ZhUJP2acxqs9DtdvX2lwwkjn8A1O6j1HzDOYrFB1uuKUwrSvwBX
         aIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780942667; x=1781547467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t5DnDar6JBnPe48ajQB1Hb9265gKUCW9aay647po/SI=;
        b=JWPBdlkm/UvAXaiXQ3/TIiSkaBzizsW8DoltMSGR/kq0hJM0+neza9fUz0tvgZitrX
         fPZnmqfW9ReBd8iijtvr7fU4d9VIsh5oSkQ7GJ+oceWFGMnpHEMcaSPoGwUYj9QfvRNw
         UutwV75sX8eJS7eNwu5G+rgxh1M8SZmfcO10aPFfkeJG3q3gffkOToaud3+jS63SVM/3
         dIvFOk3tCAv7r8S6/t7TLd84OXguJGjs5sV4WsmngPfRnGiPyov2oCslT8DfbcbWCvW+
         b7Cy9FkNrD5YvnPYs2/I+1YlLhrzsOP5L/JsuUJeCzRW6p+nNGYOZ0vrMt73u4DUXJU0
         +ZtQ==
X-Forwarded-Encrypted: i=1; AFNElJ/a29zCS2PS7xfxUCQ32fzwwmF8hR9Cx5eorCMH2TpksH6j3RIy08ttlwGs+QdFTmiBRSaeMN9ojf/FhjwEEgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfsTevugfZbQauswYeYm+rG8V9fURYrI0eXftbjhkq7FZAmuSs
	OTeKf4GWaKcJyLOo/P7FaOFYjBUOLMqWV79uhM+eW1m6HJ1uzo3wSE8LNiP14bnrlBctilGVghd
	XoIhfTAOE33ukcPQGRCaFJjUl8+BDrPA=
X-Gm-Gg: Acq92OETsFXKsH5hm9DOM5WkTR/FoBhOSkLAVbmwxnh5hXnH6WeQeF17eal99rKOuRV
	XgZc3tRuvZsD1fkGG/FMx6nkHpnxJMds3lEExOMQtPaESekleGoiykuB4onFAtnfHfxweTl4vEH
	wok4jZxfM5qRBkaLvajJRoxRqFtxBKcnFeiKXFLQW7pB2KgRInxvM1T3lo4xqcvHO7+nOnnTYBM
	jzzbzOOh4PutLgNavcXu8NNGU3XbPxVqk/UPO41LnW2p8rRnomn57dO+yvBssllKMDR95lfCnFz
	UcE3An9mz6HUXUmSegxjxC7AyxO7ZCf+vsRplPRA5/nPHxlG9qbzNtlQEnFXeFfCC1uVfoxXzrG
	SRLZiG7j1iCFjEk4=
X-Received: by 2002:a17:903:1b44:b0:2c0:c262:b925 with SMTP id
 d9443c01a7336-2c1e7f9252fmr195715815ad.25.1780942667015; Mon, 08 Jun 2026
 11:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529031604.888137-1-chenyuan_fl@163.com> <20260604031033.806727-1-chenyuan_fl@163.com>
 <20260604031033.806727-2-chenyuan_fl@163.com> <e23baad8-1709-4210-81c8-22741b9dfb3e@gmail.com>
In-Reply-To: <e23baad8-1709-4210-81c8-22741b9dfb3e@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 8 Jun 2026 11:17:31 -0700
X-Gm-Features: AVVi8CcTUadNsMgxD4J0IajYU5XL2tzBD2ThgUFwBi0fy2o_akjL-kP-J_G8V_M
Message-ID: <CAEf4BzaY3LLmMbSm1ritXwTvqGYi+KSWSkqMYJd62D7opu4ZnQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/3] libbpf: Skip bpf_object__probe_loading()
 when BPF token is in use
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: chenyuan_fl@163.com, andrii@kernel.org, ast@kernel.org, 
	bpf@vger.kernel.org, chenyuan@kylinos.cn, daniel@iogearbox.net, 
	eddyz87@gmail.com, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 4:16=E2=80=AFAM Mykyta Yatsenko
<mykyta.yatsenko5@gmail.com> wrote:
>
> On 6/4/26 4:10 AM, chenyuan_fl@163.com wrote:
> > From: Yuan Chen <chenyuan@kylinos.cn>
> >
> > bpf_object__probe_loading() tries to load trivial SOCKET_FILTER and
> > TRACEPOINT programs to verify the BPF environment works.  When a
> > BPF token is in use with restricted program type permissions, these
> > probe loads may fail because the token does not allow the specific
> > program types, even though BPF loading is perfectly functional.
> >
> > Fix by skipping the probe when a token FD is present: BPF token
> > creation itself proves the kernel has a working BPF subsystem.
> > Real BPF issues will be caught during actual program and map loading.
> >
> > Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
> > ---
> >  tools/lib/bpf/libbpf.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > index ab2071fdd3e8..7e21c5eb9533 100644
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
> > @@ -5167,12 +5167,8 @@ bpf_object__probe_loading(struct bpf_object *obj=
)
> >               BPF_EXIT_INSN(),
> >       };
> >       int ret, insn_cnt =3D ARRAY_SIZE(insns);
> > -     LIBBPF_OPTS(bpf_prog_load_opts, opts,
> > -             .token_fd =3D obj->token_fd,
> > -             .prog_flags =3D obj->token_fd ? BPF_F_TOKEN_FD : 0,
> > -     );
> >
> > -     if (obj->gen_loader)
> > +     if (obj->gen_loader || obj->token_fd)
>
> This change makes sense, bpf_object__probe_loading() does very basic
> check that BPF works on a given kernel. In this case, when token is
> passed, this is ok to skip. An alternative, trying to make
> bpf_object__probe_loading() correctly token aware is worse.
>
> Acked-by: Mykyta Yatsenko <yatsenko@meta.com>

This is the only patch in the series that makes sense to apply, but I
don't see this series in patchworks. Can you please resend just this
one to BPF mailing list? Thanks

>
> >               return 0;
> >
> >       ret =3D bump_rlimit_memlock();
> > @@ -5181,9 +5177,9 @@ bpf_object__probe_loading(struct bpf_object *obj)
> >                       errstr(ret));
> >
> >       /* make sure basic loading works */
> > -     ret =3D bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, NULL, "GPL", i=
nsns, insn_cnt, &opts);
> > +     ret =3D bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, NULL, "GPL", i=
nsns, insn_cnt, NULL);
> >       if (ret < 0)
> > -             ret =3D bpf_prog_load(BPF_PROG_TYPE_TRACEPOINT, NULL, "GP=
L", insns, insn_cnt, &opts);
> > +             ret =3D bpf_prog_load(BPF_PROG_TYPE_TRACEPOINT, NULL, "GP=
L", insns, insn_cnt, NULL);
> >       if (ret < 0) {
> >               ret =3D errno;
> >               pr_warn("Error in %s(): %s. Couldn't load trivial BPF pro=
gram. Make sure your kernel supports BPF (CONFIG_BPF_SYSCALL=3Dy) and/or th=
at RLIMIT_MEMLOCK is set to big enough value.\n",
>
