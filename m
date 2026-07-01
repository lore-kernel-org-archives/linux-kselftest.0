Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6223A3A1D02
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 19:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934343; cv=pass; b=GGcuFsFTGAtK06iQFz47NgREEwkugLl+7EN4pviyhcBidiOMtjnieR8+dMPqjKeprIY3qOwE0II5lIT6Nl9GdcSHhfuRjh0anBU6IJFjs6PS5Lo2RHZMU8kC9gVsaqDFThU3nsmPliMbcCvIvEy1IRqwF68QfaFnst+SFenhhbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934343; c=relaxed/simple;
	bh=/RZvXQuviIKjERdOUPCvy5U2CWUH9PYXFVSplrN1NGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUhLuU3YO9yv7c6NzNZfu7qz6bDDGvNOmuD6IyjnaO0rEuFOyUXfzLVxiliTYKgZnoqTGjzAraSKtolkYPBI2kW090HPSRr9fnjdVGHRh3IYkWVpit1wJoFLauujRPBynI0/UNhjT4wvS/Lx7egPeP9NCnKdiGOZZew51lzCVmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcaULQ7/; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcaULQ7/"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so17150515ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 12:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782934342; cv=none;
        d=google.com; s=arc-20260327;
        b=ML6KBLNzZ5FNhMFlxbCzmuWecLujTNK7/+uEpVf3E+03Kj7sIR3KiVfYDvaWlMKWmD
         e4HfLP1KEpx/O5gUuSa/kG3zZBownpbzqP8X48nhndr/4q9KOONS59SgYPTUFe20SdKk
         U19FeeWg/R5XbH5Q9jrv3hKQ/UYwy12VpxtvLElxnuKDX91vHrczjIpFMZ34zhk0N+r6
         RGqaZr+QTTv+3VU8JOjlZfFlDoqCd+EY/aEGaKaLt0e5eD1VwiVw8s8p8Dg73Am8J17w
         dKjhpdIJvD+JK26tp067PVqOLUXfW/r5EgoY5RiiZqpsMo+7aZlXG43FLKMKHB1/u6e1
         u8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k+YkcI/qiltpqXhaOZqyvCi7FfaSc2Wpf/xvgMARz/I=;
        fh=TjMc45UBNNSu/9jTvRuV5IWpJMvpCz1QAyIyrVHsPns=;
        b=V/iILFU7usXQycWMYgvBttwVmpBqXlTl0qq9Jx5AYpEkaNZXLcK4Xe5ARb8F5GR1cb
         RyHlCIElcs7kZTivtDoJKpRwoJ7DdLUQyHlyFBLoncoFeuLIqGp95Fh5Ouy3jeORK1ea
         y4C6jNx+F0R2HIX81jXK1cndOPJgvwzwL6TShx0I6eYTRg1SYdzpL3t0Jtsx1t0Da5x+
         WhUZTLUE4PW0SAvnkkzJEIFr0g+m/NXOAgPxotwWSgt3P5YtKXKPgE67v98yCfElqCvX
         0i6d/+7EMOne7zNrI7TYJdkay0oIYwbDUUcD6NOQw+2T5uwDsqpDBYe7ffvFB/SfvftE
         7R3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782934342; x=1783539142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+YkcI/qiltpqXhaOZqyvCi7FfaSc2Wpf/xvgMARz/I=;
        b=WcaULQ7/3+7tdF6RR17t2HsLLv9ee8U6HX7ZsRjKeF1fTvT2bXREF8keuEvfTzLESC
         Iw5LQOKy6uei6CyR6gn5/4Fvg21qFkmxqStCUZjoqjoEFVZuStd1lvorvJ0T6GGQrnYe
         vMY2ajujMdDTFsbE7+g04vDB7Gs927jQ28zthbvVANvH7K2EL/wXy/ANuBZXnt98fRnX
         zpJj+y3w1DbGiDrqH49TkOahMuWAJw7+0x/jYcv3vYUoXGD9OUTFHZkaipF8LwP9X3H9
         N8MIHL/ZZnBR/Okam/+CyBGUmTm/Wbtci52rj5xnGzyPL/G2LQMssAzdT+/6RLt3XI0I
         vbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934342; x=1783539142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k+YkcI/qiltpqXhaOZqyvCi7FfaSc2Wpf/xvgMARz/I=;
        b=T+PGA1Bf+Fn6jGGRovkifE2b8FT4lCLjyXW/mrOIvNRpown93V0Edci+gag+qd3ZhW
         4WOEuxdj2OQ98C3CCmCixE7xVsZGtHZz05/9xf1TpVIxXn52MhFRZ/R1jH9vNIBDSgpj
         n5JQWV0PMiNAc1OvvfGIui5wotYZO4wG+eESHRbHRkg8+cx+w8krnQVuLmbDbAjUj++/
         f/RpGrXYGivsZB8Z0DyBWiSbWAmi5xUaBSJ+jKuONYLPDcyAcCzrqD/t5LtqfSyJ+Dce
         +yf0kuVs9lUZhUY8yfbPeT/bZgaBKsBg5S2wgAYHC368BS2PI6s8W1qg//dEmYgJLSPt
         XABg==
X-Forwarded-Encrypted: i=1; AHgh+RriURXryDwSNASz/7H/ss9AiDp1QDQHxmqQQ1wAsMZr4HdrwB+6j0RE/+QYBEKaAFA91W+FmJZQqF6JQ/4ulsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMgjj48AAhchNYtt2kXc+Ze249nKMkB/1B6gmcn02n/HzzogIp
	XP4w0VqonD00Eh/3hLCH61WVbg+YO3R380wLCP986899fWvDStuw0oX0U4rAOoV8A/X/IX0TJIv
	zQSgvHt2iRy8NrkYdngK9tFQLHe+0lI0=
X-Gm-Gg: AfdE7cmQ0WPsOkKvtRdwCIHcXujuteA85fz/CO/8GnzbbfQFfNqJj1o+0NDOTgeL2Y4
	MuhTcdAgJ7qkub87JIRzj9t2k4dXJmJJqXugmD4FlFjggoCstLDa4/m2oz2FGgV5TITfjgJZvbx
	TjwkRm9Ovus/auYQhcld3RnS+HR6FCfiPEdGozjUS83nSitrBlo+YLWkTVORRTJRr1Q7BQhnBrZ
	cfXyRxPjzPcdlMelGzJp6nCHN7VelYIrQgJtq1pt5S4H1k9LuFGA0rzSq8CmMOBlMwcPGwE06EX
	LsmCjL/JlLTcid3zJ56TuIZ8649xlF5z0VVDPIX0gL6so7Xsssid2S/Z+0fpdqHO
X-Received: by 2002:a17:902:e54c:b0:2ca:53f7:3c69 with SMTP id
 d9443c01a7336-2ca53f73fefmr54977475ad.9.1782934341579; Wed, 01 Jul 2026
 12:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629152406.52582-1-leon.hwang@linux.dev> <20260629152406.52582-5-leon.hwang@linux.dev>
In-Reply-To: <20260629152406.52582-5-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 1 Jul 2026 12:32:06 -0700
X-Gm-Features: AVVi8CczmSeujx_AKyHagQGJNsjmXmV7uzErQkbJ0H1vmGYLjCXAb29ckN_chSU
Message-ID: <CAEf4BzYVdP23ASHtAAzpuGH2Agx+aXRRxTsy6MZx0OgE+OffjA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v8 4/9] libbpf: Add support for global percpu data
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

On Mon, Jun 29, 2026 at 8:25=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
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
>  tools/lib/bpf/libbpf.c           | 57 +++++++++++++++++++++++++++-----
>  3 files changed, 53 insertions(+), 10 deletions(-)
>

[...]

> @@ -1975,7 +1981,7 @@ bpf_object__init_internal_map(struct bpf_object *ob=
j, enum libbpf_map_type type,
>         map->sec_idx =3D sec_idx;
>         map->sec_offset =3D 0;
>         map->real_name =3D strdup(real_name);
> -       map->name =3D internal_map_name(obj, real_name);
> +       map->name =3D is_percpu ? strdup(real_name) : internal_map_name(o=
bj, real_name);

nit: I'd probably pass type into internal_map_name() and let it handle
all this in one place, consider that for follow up

>         if (!map->real_name || !map->name) {
>                 zfree(&map->real_name);
>                 zfree(&map->name);
> @@ -1983,7 +1989,7 @@ bpf_object__init_internal_map(struct bpf_object *ob=
j, enum libbpf_map_type type,
>         }
>
>         def =3D &map->def;
> -       def->type =3D BPF_MAP_TYPE_ARRAY;
> +       def->type =3D is_percpu ? BPF_MAP_TYPE_PERCPU_ARRAY : BPF_MAP_TYP=
E_ARRAY;
>         def->key_size =3D sizeof(int);
>         def->value_size =3D data_sz;
>         def->max_entries =3D 1;

[...]
