Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793309750;
	b=DiMJkq8QVZAgoLcHLvv4wfNanerZIv2nPRvlmDhqemSdvrcRIRtFCpK7/vVy+1W29SVb
	 VoX6/3YAquBTc6NlD6w9aZtz71WoDw54h3gNsD+PLCkppXrNcDIi6e1ZMOhsAis9xkXe1
	 /fPKj9vMRXtAQ1iusC9+gw8osyLQ7sZ6JXDKOq3Gjl69RUtnGRSLfLYpNPPJFl73Q8P/w
	 VwB7I5wFzcClZU2Pbf25j1p+35Y95YhJEOHNohcZbHUEYr67NKHFNHObK2BXEMGqouc/A
	 TXZv76fwnjJ4PD80WeG8BfVp32kGIRvaeSSQyqvqtLrBQlui0OoC6BrEX2HUQWXgp7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
	b=z6adfN/weZeenv5q/TSiAKZXylOe0rqcp5MWd4EME8pgN+K0BNrs7R599ZK6X9I3H+Cl
	 zkXDg8IEBZkc5jTqGdwXSsap44nV6arWLVvnOJyAgl9ApDgrWQ61EgQR1DAUu808Y2VCt
	 eTLX1URDR9l+/mvuOVj7ErMZu28WBxmlXfG2bhdQcU1D+KWETKi37T82wakzP2yG1m73a
	 7UT84/wlJChxF/ePAuMs2ASPEBB1FlzC/yXpGiACKOyzHqgOp31m2jYboR+BHmbVulE74
	 NH02esCydn20uXsG73BcK5builrs0A9jnI9OkLcF65T/cYLMK7p2bFAxIV+Zl1a4sIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ny4Qf79m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67E3606A31F
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 21:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C67E3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ny4Qf79m
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c43fbcb4393so2380566b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 14:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793309748; cv=none;
        d=google.com; s=arc-20260327;
        b=WMGWil4nzN8vzVTbHt6NtcXqpHjBiwtK1QNfp7s2OdWpusZIpS7PG1qS1JgZzRcmZZ
         0IO6rDh7CZZTSM8PSQZim02touTBJKpQaqOKzanv8tr9YrhMV54707VTTIa/JDZFyFRe
         EfdHvMZIN4Grug/eDjzGAOa0KotId43Pvy1L4SjvcIjwj6ynRgZC/Yv9B8zrq1Bhb/Kr
         hy9ET3SV5o7WeBcAhdZev3s/77V16N4Chy3K+24NTNx68qDoLf7zYJp/nlM/sX7qRpRY
         Fuu4Zy9CnJjxztaBUyK/UhmF2A5vEEsUYJHPm7MuW5j7F9BgMI9ON8TlLu4rf9wkomw1
         D9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
        fh=pSp3Cd8vE1gqZUVBmSx16c4iGY7qT9u7/Snxeb4RUOc=;
        b=WyoopW8MDGi2Gu+qy62TllzK4ZgjHvFs4YqyMoWXLW9BqLECi+7yfHgI9Izgxxfwhe
         1+VhEDKp00to/LyNUMoGVIkR/p3/eBD3barCHI4RWNodCdkFgueA++5kjzB5q7K51PyC
         M1JzQiFoZUCIHAlxGi8Zx3EIllHeVOOXb7RSA3IuFVwLwiKSbPbvI5wAUCkqfuhr5fbY
         Sy042hCvANpVPwEcohLWhgTV36Cwv9ksqg5uf3h2SfIFxFnUZRz5rybzNEWwXVauIbIi
         YW4FBqAkJJiqoTuaU4yLclDW+9gARxi9TDwVor3DIoIeUL6fqhXTk+MJ78mRZCGcuVxF
         qyjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793309748; x=1793914548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
        b=Ny4Qf79msA3Ol1Y6e8/IcUAH9yOvaHBe2q/r2VBC2ELpk56XQeNul05malBDOFT8ku
         3iNV5LUh1WN6OSi58GJtPL1CdzJ6Gfdq1EwPPwQTHQ+fJYrr4uuUNxUlmh+B6VBLkI3H
         ZEj0B1DaLGuydvsPOrmNnyN+V5M9uzXhIOuB8IAfuS4x7RzFZc8EHwvHkIbq2HZsSAXO
         f8K9v16/gbB/xNpURIL1Ixe+3ZCyFOiwul7kpsyeMIznZ8WtYjV+3pMV90juEncbUJ39
         jANFHK4YH+YJxQHzX5N4bA9Y7nUKExBRqIOMrQJ2r0F5nLrYhReYCpQZmLjrgHbgSrOi
         AU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309748; x=1793914548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
        b=u+JfYzu0xf2oAaPXUgYMvikSQ2M6Kot477RmXvqwjq3h1K3AlbiRbNmVA6AMRzdfWf
         +xYlcSruUMDr2in3fBRc/SM6J85TT/ywl++3s6hodB5ey3Z8vV+HguCbNp8RUCyvENlW
         a8b+Rm6YJITbUk8W2HW7B0dmm4A18k6t7hS+INV2V3qUOcbjoYGt/zRIfuuPIQJur0x8
         qEh0WtUJbtvjKLLMqb1zQgmm3aMJgB6ICUllqrTKdtSgTezPDb5LPHAYddEjyJ65n/CK
         hXwIWEg7vaSaFNgMO0ZxopJUTgsUC9g4fqBSByR2oP051fNpQlMOZZkEkZeqb+pLTM63
         F/1A==
X-Forwarded-Encrypted: i=1; AKwUvBxNkc6kbGL5jK9ezbQzLMUw2Jq5k5VG8GJYaDsUZ87nbr1Qt7N5XdGXAHkI4sEs+LX0NEzZQXRHB9d6hoaH2YA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkw5/0zvUv8F3xhkbpPiCytcxNXwBunnpiSQX+EICttWeLz9he
	pb1V4SPOwc+AfJv/YoTnhCm53i8cbNeRjeQ2SIQQz8SdQEShcZzjQmMJ5ecH6DaK+GCLJ+8MJyU
	7xv/G+S0TjGZMfWHOb3KrGYQ2P8oqe7z3BuYrg5ig
X-Gm-Gg: AYBFou0MQ523JI3mAoVTcfer7YU+rtr2Y22phj2m6KtVK92h1lfjia5w+rCQ0pca8Yc
	B9SKVhyN8thQ2HzRpFWIoCnHW6WjdSlkczfpylV0FTleKbCjSXH94k76ByTxfD0oJl4WWnK5NCv
	gxoU/eDFdNmYHvwLiT3oHr+JJtKWsQ9H5w96hPV91+tgk6dT/6+OeOfInpoR3EFOF/gJddM71YD
	5hejCSG9Ydm3brPFCs6nXvLua8JTwtsUbVDpzmj/Pr+mWUU0QCs6SFYUtxBA3SzwCAEvua65dmJ
	AJX2vN16C9reY5IOFB3JMi3WRwBrrR8VrfD2cLbbU6y8x1h+H62h2btELpQmgo08EiJa/R6EBK3
	AwscrCtySsAUMB2wmGG7BHN5iqXQPCjF6yYePxK897rBKLPyZTLOp13m4jyKiqm5kkGSB2gc=
X-Received: by 2002:a17:907:805:b0:c3f:a728:b437 with SMTP id
 a640c23a62f3a-c4ca7ac07eemr32967066b.45.1793309747666; Thu, 29 Oct 2026
 14:35:47 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-12-wusamuel@google.com>
 <at8dNNb4vwovNZcZ@krava> <CAG2KctpMEuK5OJSedSFshNMSwOqe1g87m2ZOKBhn=Z5iCA45Aw@mail.gmail.com>
 <20261028140127.7bfeab46@pumpkin>
In-Reply-To: <20261028140127.7bfeab46@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 14:35:36 -0700
X-Gm-Features: AclHuK84Rx0Zv6bqYRMUgm-AA1OaD1X9ao32PPa3PHwJ78sUr0bqSyZbITTizzQ
Message-ID: <CAG2Kctra0GYjkzggB0cdMxPK-b9U9x-m+gR6E8goAYvhsNXEdA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
To: David Laight <david.laight.linux@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 7:01=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 27 Oct 2026 15:07:44 -0700
> Samuel Wu <wusamuel@google.com> wrote:
>
> > On Mon, Oct 26, 2026 at 2:28=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> =
wrote:
> > >
> > > On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:
> > >
> > > SNIP
> > >
> > > > +static int bpf_object__query_ksyms(struct bpf_object *obj)
> > > > +{
> > > > +     struct kallsyms_query q;
> > > > +     struct extern_desc *ext;
> > > > +     int err =3D 0;
> > > > +     int fd;
> > > > +     int i;
> > > > +
> > > > +     fd =3D open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> > > > +     if (fd < 0)
> > > > +             return -errno;
> > > > +
> > > > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > > > +             ext =3D &obj->externs[i];
> > > > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > > > +                     continue;
> > > > +
> > > > +             q =3D (struct kallsyms_query){
> > > > +                     .size =3D sizeof(q),
> > > > +                     .query_flags =3D KALLSYMS_QUERY_BY_SYMBOL,
> > > > +                     .sym_name_addr =3D ptr_to_u64(ext->name),
> > > > +             };
> > > > +
> > > > +                     err =3D -errno;
> > > > +                     if (err =3D=3D -ENOENT) {
> > > > +                             err =3D 0;
> > > > +                             continue;
> > > > +                     }
> > > > +                     if (err =3D=3D -EADDRNOTAVAIL)
> > > > +                             pr_warn("extern (ksym) '%s': resoluti=
on is ambiguous\n",
> > > > +                                     ext->name);
> > > > +                     break;
> > > > +             }
> > > > +             ext->is_set =3D true;
> > > > +             ext->ksym.addr =3D q.sym_addr;
> > > > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0=
x%llx\n",
> > > > +                      ext->name, ext->ksym.addr);
> > > > +     }
> > > > +     close(fd);
> > > > +     return err;
> > > > +}
> > > > +
> > > > +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *o=
bj)
> > > >  {
> > > > +     int err;
> > > > +
> > > > +     err =3D bpf_object__query_ksyms(obj);
> > >
> > > hi,
> > > we could also add similar support for libbpf_available_kallsyms_parse=
 and
> > > probably in some other places like bpf_get_ksyms.. which makes me thi=
nk it
> > > could be useful to have KALLSYMS_QUERY support for multiple symbols
> > >
> > > thanks,
> > > jirka
> > >
> >
> > Thanks for lookiing over this Jiri!
> >
> > Using KALLSYMS_QUERY for libbpf_available_kallsyms_parse() would
> > theoretically by O(m*log(n)) instead of O(n*log(m)), where m is the
> > number of tracefs symbols, and n is lines in kallsyms, with n >> m.
> > But AFAICT, libbpf_available_kallsyms_parse() would only be called in
> > pre-6.5 kernels, for kernels without commit 83f74441 (ftrace: Show all
> > functions with addresses in available_filter_functions_addrs); so this
> > ioctl could never be called.
>
> Isn't that code also O(n*log(m)) ?

Yes, sorry maybe I wasn't clear before, but the current code is
O(n*log(m)), and the ioctl approach would be better since it's m
lookups of O(log(n)) for vmlinux symbols, where n >> m. However, this
is a red herring because that path only runs on pre-6.5 kernels, which
won't have this ioctl.

> I've got a patch (I might send it after the merge window) that changes
> one of the ftrace functions to look up every symbol by name, not just
> when only asked to look up one.
> It can also use the 'callback' function to detect duplicates.
> That should be massively faster - especially with my ~18 fold improvement
> (also waiting for the merge window to end before posting a new
> (not much changed) version).

Excellent, I'll keep an eye out for it!

> Does look the the code could do with getting the 'symbol name table index=
'
> for the symbol so that it can read the entries sequentially from that
> point onwards.
>
> David
>
> >
> > And regarding bpf_get_ksyms(), it loads all traceable functions and
> > needs the full syms table, so a /proc/kallsyms should fits better.
> >
> > I did profile a slightly different form of querying multiple symbols
> > at once [1], but didn't see much benefit. struct kallsyms_query is
> > extensible via size and query_flags, so we can update in the future as
> > needed.
> >
> > [1]: https://lore.kernel.org/all/CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS=
_1HJ1wSm7sJ1w@mail.gmail.com/
> >
> > [...]
> >
>
