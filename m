Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25419375AB5
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 22:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782254761; cv=pass; b=Y56f5i41q1tLnDitMHsw6Juoeu7Ob3KH7qTmcVMh8I+oHdPjaOv2CvrMxuLBXYftNSS1NHddXjYdI6phhs057Ag7RrNwgQOdcS5SU7QsoHzJuHCg8AyPV4SpEVoA5T/+4gzXooVQ3QHA3JZDvcKHYTVSRSYm8/etKg1TFvVJWYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782254761; c=relaxed/simple;
	bh=Z6NTdCIJZ1DmGGq9Tvl3c3bGMH1qcZhg1rY2c+290yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpaJ9KfCSB1WYzPzbntHEA78jmv4Vtqq2sK+k/anmscoT3kh1OfSjrlQXqKqvuPCMjkbQpFl94b8koPPUrMM65CN4HkTKpV9TZmwUDxGM7spS5OA0+5q9KZZkQccuWkNBYHcSZYx3zIVZUYpaDwCzZUsPD/zPEKX66KYI4ORX2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gj34D3S3; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gj34D3S3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c7cfa17fe0so1840965ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 15:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782254759; cv=none;
        d=google.com; s=arc-20240605;
        b=cE5HHdH+t3tpbaQCA/tjwEsNnx4pt9FcJ7B5zwuDCg6lT6+HJ/jPhFsM100sSrq9a6
         qMtj4+YEDy0bSv+SfKWtN0LpiiaHVf2MeHjXBBggYZBGal4U2MrbW22469QRRk3i9GCN
         2BssFAqBuKljAGotfAK22U2YtUpKOKMWFqasn56K0dFBmiyI9QEt0pvRBnZv2ukqx+fe
         sxcbsucUqQeyx0dSwfts5jqaH3QCm9bWlh19A0NK8a4Fk3ogB6P5aolgLhWUGvNekWr4
         uvDVOkQJ7rMZ3Bh4yOngNP2ObyBK9UFwA9mLA0f4nHdNxHhjHpx5GaZONvfWt7FWZgrp
         V9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=il77AzCwLeUfUqsM2Aaw4XWs0P8wSa8dmYuURo+uFyU=;
        fh=WPzR+HEb952WMR9S24/aNxhLSUCXissfnoGPLguxU/I=;
        b=Aj2oCEHTqnmHvNT/khFc5PXmte0Hloo4ZMaxEfxK3CXcL+gXBZYDjnjAolCfTom6ZS
         TYasTKg1G9ci8KUDqhzBuOI7U5NvNdIkKCoc1Ab3S2nmb0216cMrGZrO/MJLSRku7Kg7
         /wGVOFFrcxoUx89zc88LGiCyRWFCs8S7Qress4dQxkvgQm99W9QsbTQ3hR+9RBBvvn6N
         SdC46TmYFxjaZvuzuejgm3Reu8ggrllxjO7fr91y4GtEkP1fiRiF62TXbu9vEDhNEWRv
         eoXZQ4MVC+WcXNCKLaDn7J6YbLjyMTF1uPk39JfU2k4iqkONVSeBAevg6/MiZnSGo2IU
         nfbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782254759; x=1782859559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=il77AzCwLeUfUqsM2Aaw4XWs0P8wSa8dmYuURo+uFyU=;
        b=Gj34D3S3aT4vPls4Mk54C/VsiGu4nVAjDom+l7AkWDTmp/wMUtRo0tTmQVTX4MF8q4
         9uAsAuHi3ki59sQ9JP+f7xhyyLRds1XZJwyr4C1pEFhqeCkOf6Ink+KV9Vh5Hj397QOv
         8eVuYQAKzXpVC+1BT90IgaLtmvmIyhdUvnib78ocSkaRl8TsIrrNqLCrkLhs7UVr5sK2
         lfBhJrJF6Qs5ai+hRYu0uzkZQNyZCvBK6S8EfKEl//uK7TO7ORUoK0Dzp4kla7w+K2cY
         M9CtfA2PLG1yU4orEiXAHrLdd6wSWmhtI4gNUOgkWmzZghAKfCxnV4IzZzqFqF9rfKim
         qfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782254759; x=1782859559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=il77AzCwLeUfUqsM2Aaw4XWs0P8wSa8dmYuURo+uFyU=;
        b=HM5YCijGe2oduzDKKT/TpdO9HYhC9DXnkVRdhXl2iB+neEZ37MoFTf5X9GihtlkC0H
         mOiu+WFFFiWc134trgZFVIZhFaFaveuPa9+C3NDPvHWSwlHTTkfJDI9JBNSsrD6oly10
         yTfMVk9WPiWf7RY+JMg6Im/RR3te0VtJxkQJajOAeobgPU+5uSA2k3A+avT144JXoS0B
         4z4fsYKaWTd4G/kP7/4o54uLbQfXq9SLGL8fAh0h1yMTxdeQbKxgP7BNIXA19DyIOSHk
         xyzb30etVBdRLO08miPEGd/HlCGqNaU+IkLnlE/oh4s2IE2CmKAgujEZiPtV1lgosuJs
         fV5w==
X-Forwarded-Encrypted: i=1; AHgh+Rq0dMZ0VZDeweFQlZfU0DibgskF9VoKrI28eox7iXWnRJ6Ed8JqvZH3B0/uHFyoRnkCFEmD6gE20H2xjDMB0F0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPISttJQGJhcFEtxFM6fE1+IJO6ZIDSo38JTyL1okVv6Qu/YWb
	1+LhDli+s7FACqqxFo3jhOLs+Fws0neqP2SB1SXck191Gt29NSsGzslQ724qm0lDsW9RDg1n0ZO
	n10OtYZZP0nAnG33lC1sMr+lZ8+S/LRY=
X-Gm-Gg: AfdE7cnT4vSx2RqDePpN6xylnL6zjk1fiMg3spkb/nPARSHqG42Q1jqTBdQGWnn0TJ5
	3k02t3AnRQ9GcmXUT1AM8GSNnB7XOe6IpvL7KANMFBlQwFBxgSiLOWmSJWHOB7G9tc1tM6jrCdf
	tBSVoQBPrvQYRxPXmB3r4Ky9dLT1eWTPZ8DNbM5eb10FnOq4pUTPaPnUqOv4WJRHmwhDruI+ajX
	joMzd7l9JHup3u3yNkJHboXR/mHrpVdLK4V2JYPNzNvCd01sRdexrdIHyi6ZQcRXscLvGvypoBs
	Uhxtz6JNGG7w/itCfDfoqaYcjTw8yG52sKjVFLtSYEs61mwqMDa96oHxWhF2cmtbpw/TxA==
X-Received: by 2002:a17:902:e5cd:b0:2c0:baaa:db94 with SMTP id
 d9443c01a7336-2c7e1598ed7mr7885055ad.22.1782254759435; Tue, 23 Jun 2026
 15:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622143557.22955-1-leon.hwang@linux.dev> <20260622143557.22955-7-leon.hwang@linux.dev>
In-Reply-To: <20260622143557.22955-7-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 23 Jun 2026 15:45:44 -0700
X-Gm-Features: AVVi8Cfz_AMiTjXuQaT2PnUupoQgQnU88wU1V3erLQ3ZDJb97JINyEDYr3KT8Go
Message-ID: <CAEf4BzZSeMSMnuYdLvEfb7-pmbthjU3J7W3QB4q9-WN_4+QrbA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 06/11] libbpf: Add support for global percpu data
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 7:37=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Add support for global percpu data in libbpf by adding a new ".percpu"
> section, similar to ".data". It enables efficient handling of percpu
> global variables in bpf programs.
>
> When generating loader for lightweight skeleton, update the percpu_array
> map used for global percpu data using BPF_F_ALL_CPUS, in order to update
> values across all CPUs using one value slot.
>
> Unlike global data, the mmaped data for global percpu data will be marked
> as read-only after populating the percpu_array map. Thereafter, users can
> read those initialized percpu data after loading prog. If they want to
> update the percpu data after loading prog, they have to update the
> percpu_array map using key=3D0 instead.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/lib/bpf/bpf_gen_internal.h |  3 +-
>  tools/lib/bpf/gen_loader.c       |  3 +-
>  tools/lib/bpf/libbpf.c           | 68 ++++++++++++++++++++++++++------
>  3 files changed, 60 insertions(+), 14 deletions(-)
>

[...]

> @@ -5353,6 +5387,13 @@ bpf_object__populate_internal_map(struct bpf_objec=
t *obj, struct bpf_map *map)
>                         return err;
>                 }
>                 map->mmaped =3D mmaped;
> +       } else if (is_percpu) {
> +               if (mprotect(map->mmaped, mmap_sz, PROT_READ)) {
> +                       err =3D -errno;
> +                       pr_warn("map '%s': failed to mprotect() contents:=
 %s\n",
> +                               bpf_map__name(map), errstr(err));
> +                       return err;
> +               }

hm... do we need to do this? what happens for LIBBPF_MAP_KCONFIG, do
we just null out the initial image? should we just do that here?
Basically what I am asking is how important it is to access initial
per-CPU image after load? What's the realistic use case for that?

>         } else if (map->mmaped) {
>                 munmap(map->mmaped, mmap_sz);
>                 map->mmaped =3D NULL;
> @@ -10806,16 +10847,19 @@ int bpf_map__fd(const struct bpf_map *map)
>
>  static bool map_uses_real_name(const struct bpf_map *map)
>  {
> -       /* Since libbpf started to support custom .data.* and .rodata.* m=
aps,
> -        * their user-visible name differs from kernel-visible name. User=
s see
> -        * such map's corresponding ELF section name as a map name.
> -        * This check distinguishes .data/.rodata from .data.* and .rodat=
a.*
> -        * maps to know which name has to be returned to the user.
> +       /*
> +        * Since libbpf started to support custom .data.*, .rodata.* and
> +        * .percpu.* maps, their user-visible name differs from
> +        * kernel-visible name. Users see such map's corresponding ELF se=
ction
> +        * name as a map name. This check distinguishes plain .data/.roda=
ta/.percpu
> +        * from .data.*, .rodata.* and .percpu.* to choose which name to =
return.
>          */
>         if (map->libbpf_type =3D=3D LIBBPF_MAP_DATA && strcmp(map->real_n=
ame, DATA_SEC) !=3D 0)
>                 return true;
>         if (map->libbpf_type =3D=3D LIBBPF_MAP_RODATA && strcmp(map->real=
_name, RODATA_SEC) !=3D 0)
>                 return true;
> +       if (map->libbpf_type =3D=3D LIBBPF_MAP_PERCPU && strcmp(map->real=
_name, PERCPU_SEC) !=3D 0)
> +               return true;

um... this is extra logic for DATA/RODATA is supposed to be backwards
compatible legacy stuff. We shouldn't need this for PERCPU_SEC. It
should actually be called just ".percpu", not "<object_name>.percpu".

>         return false;
>  }

>
> --
> 2.54.0
>
