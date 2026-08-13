Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009D53CD8D3
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 17:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786643841; cv=pass; b=iJ15BCuw/CJunPkeeZ5P5nJ5gRX+NtxJjulYLBuom7/nH83WNnYvxDuWzZuNnDKbrcSTDmTsKO+SWD6cCm+Hh792qBD6VPxwGCS7SEHPODJosPN68geePamnEfSbc6T0I6ioliUDFO3SV00dy9O+SfqInsbbR8xVmvI3zHODoNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786643841; c=relaxed/simple;
	bh=pxjZogGhoQwedyJpdwQ8wZRuKcrI3e8ALoUqvv9xYKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiUSh99WV6JhIoXQ2Y5DlKC2dgZCK4cRAZFl2VrosoWx53r400l1+BggujUfH7BzzTrhUqYeYH6+ozv51VX5VefdnD5FIAeCr3ugHgLyZsECqdjY22PGh90DZBtHEDGzUExDVFXI/i4rY0gspJUgIbNERsFpQhZwcs32WPxJHGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPbDHVpT; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPbDHVpT"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbed97fa26fso60911a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 10:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786643832; cv=none;
        d=google.com; s=arc-20260327;
        b=D1ykGvPZRpTw7i0JePMqJXpNfwrmD53yz0bNnmZe2KcuIy0lVToSHK5vKVqV79izjP
         64ndBHPIaA8P9O6HJXgs5t2wurjj6ZvXIE4p78NJbIw9Kf4rYQKXXdS0Kt+BLhxq5Ozu
         xmM+8LvYLAMdXdi0pYFZNvUydJaZWXBfLfKgNhdCYlQWU7flotEEmmFHk3hRKU4FEg9o
         HXuWQkYpNbq1hC25X+02HcUacnWrMvafs+H1pv93ieaiXHoiX5Y8lhv5hgmSQygUVb3v
         C2lj8g4Cy7hXdchMJpLJFhVoxAdizodp3Fy6XamO4KkHrOKf8W0XvZsKD7oGOwzK0nWY
         7xsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oRrR0Bomgu4d4wxrr7e8CuFo7o1Kuq9WCM1ColLyvcI=;
        fh=3lgjypbAmE19bwDwiBwuCLsiej0fBK7PfY4/Hg89ejo=;
        b=Px/3+kq6tHaVxz/UAifaDmoLb0sidYjz8b/Up9PeFbZM5E6cbsDFK2T+NOE7hVnc74
         sZkMdjQeguCr0D66Qm6SX36bnFPXnp/NdCGxaBA25sVcHxN1nKmv30/laF3kuGZXyvlQ
         TOP/WLJJmt8Xuq9JAUdIwSjuEuoi5bpP5R3Bs0gcYFU7bGLxtcFK/jN28ydbpc/E1/TH
         zcGnn0vnkGkAGACq+RRMffEDzI0CtMNqyY8a8p5wtY1LyCVtJXOJ+flMuaOl20Wb/Hs2
         cMvLLRwCnZvaFpRJIMBzSXMBNntVFlyspF+0ue9lOkKPpL0n0cRfvNK8N8hAwpwEQ4UJ
         uAHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786643832; x=1787248632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRrR0Bomgu4d4wxrr7e8CuFo7o1Kuq9WCM1ColLyvcI=;
        b=CPbDHVpTdEBQJQXdYOBYXuWWwMdTZuHlRdueUPQaAfXyu8IQfk3fGvKUF0cdVS00dq
         dpJwxrdqXr2iIBvzdrmavxPR6025UZxc3Mj1Jtg2lMRgFDDq0ggxVoEHgvApICMsg2D8
         nrO3Ey3pXETqi1qgmHiD5wQLeiTwdmuckK7hUWTS4l+Qg37Tpqmnk+YE5sfNpZ7edGO1
         gWq3eUu95aAWNoZv0pR5mJ2ATZrqcU2Sbta+7nYEgJncEFj875p2ldIDg4usN4jP6MSN
         a8Fustvi4iSv/ks9Y5CPh7Nl93/MRc+xX0p8zAi4Xf3++n2hgCotOM7dc4y9x/6FilTu
         Nxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786643832; x=1787248632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRrR0Bomgu4d4wxrr7e8CuFo7o1Kuq9WCM1ColLyvcI=;
        b=mqRZzn+OzSlS6epMdgbO9/0Vke849qj3S8zOy2rlL9QAK6lQ0HKZ1evrGGb7+hm+p1
         SjvJUpBkWdb2tohIrTZM41kmpe5L3+8lUJ3NqG/oFRl5IxMyYEg59wJzcKdHeQBcUpRp
         Klfl7WIDu/D2ll2zk+2c177+xhF/yO6FGbA/kdmQ81nt5MdFxu3nnN7aSysGGMLxv6H3
         UWJJJNNn7dyK/iAG2h9g710yMOx6+uzi5pEOsDgrJXpr6h0U16ThdQCqDWUYFXTrPKtW
         76tKXqtasl7jPmIZy4+ERC7cAZNAJ3R8Lnez49+jHez63Q/iBGupRAFzf/NKH4sjdCSU
         X3KQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0VzC5BjuW39yVhP1y3SFHqYZJi1O5Qh9+ryJ2Z4yRacFc2pRT9cMuO+usUFPN5Qllcv61aNQfZnjZe3Ra2OM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxACHP5c28R5GnGdUu+OszkB1exPIjPzf8QA6MyE+nryIcgezR9
	7h4ZuWE6zoK0sGA6nWEUUsVZyhtQtkTbkjogYoTuP1OQGyjG8fhCmjE2EbsC7DlOaNDxw0AK/IO
	TtvOsaTmMxkRwt5z7PfPrzOmilxOjTF4=
X-Gm-Gg: AR+sD13tOyPX76ZWiFymxVYW6Q18SnvhiFIk6wTkD7pWn9csLA6BT2pGL4DN/8clSWU
	cfc27rJAlQHBoIZZKIOBNnXW22c9NVDMFcVOUQGR9q92jS/MAJOcAYhuZ1NX92Ph+zX+Gwx/Uqu
	ESJIcDANPGxjjniUiEKKdcskvXxCaj0P5gzNY8gX7kDW48+sY7VPpS2Nb3q2u960fFAgS99t9Dh
	zNF43slG+5KsWaNjaXNPZfTr6gDk+rNrbZu2l4sY5WzVV8R+vglUbWbZkHMNBmFkQ8s7SeApa5c
	/x5qK8A3o/RFb5aB1a5i4v3GWAWR0w9sLLIf912I5xZyqLFE/dJ1DEBjRGt+y2SL397Ov2hnYyW
	VtoWi89c/gHrY2yfNJts6GycHdVIp4F0OtR1JmcgVrw==
X-Received: by 2002:a05:6a20:2450:b0:3cb:b6b0:1ada with SMTP id
 adf61e73a8af0-3cc57c406a3mr8656424637.13.1786643831419; Thu, 13 Aug 2026
 10:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813152324.97937-1-leon.hwang@linux.dev> <20260813152324.97937-7-leon.hwang@linux.dev>
In-Reply-To: <20260813152324.97937-7-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 13 Aug 2026 10:56:56 -0700
X-Gm-Features: AUfX_mxq5bBvm13KR6j4JCv_EZxTyHWyf2WYiBiHTsTVuDjtgVzk5Qn_fEDssmU
Message-ID: <CAEf4BzYRqZ--=5d2LBWA=mOL72CYe4y4iCGS3c5Dw8PEd9BOiA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v12 06/10] bpftool: Generate skeleton for global
 percpu data
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

On Thu, Aug 13, 2026 at 8:24=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Enhance bpftool to generate skeletons that properly handle global percpu
> variables. The generated skeleton now includes a dedicated structure for
> percpu data, allowing users to initialize and access percpu variables mor=
e
> efficiently.
>
> For global percpu variables, the skeleton now includes a nested
> structure, e.g.:
>
> struct test_global_percpu_data {
>         struct bpf_object_skeleton *skeleton;
>         struct bpf_object *obj;
>         struct {
>                 struct bpf_map *percpu;
>         } maps;
>         // ...
>         struct test_global_percpu_data__percpu {
>                 int data;
>                 char run;
>                 struct {
>                         char set;
>                         int i;
>                         int nums[7];
>                 } struct_data;
>                 int nums[7];
>         } *percpu;
>
>         // ...
> };
>
>   * The "struct test_global_percpu_data__percpu *percpu" points to
>     initialized data, which is actually "maps.percpu->mmaped".
>   * Before loading the skeleton, updating the
>     "struct test_global_percpu_data__percpu *percpu" modifies the initial
>     value of the corresponding global percpu variables.
>   * After loading the skeleton, "maps.percpu->mmaped" has been marked as
>     read-only in libbpf. If users want to update the global percpu
>     variables, they have to update the "maps.percpu" map instead.
>   * For lightweight skeleton, "lskel->percpu" will be protected by
>     "mprotect(p, sz, PROT_READ)".
>   * For subskeleton, those variables of global percpu data will be
>     skipped.
>
> Acked-by: Quentin Monnet <qmo@kernel.org>
> Assisted-by: Codex:gpt-5.5-xhigh
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/bpf/bpftool/gen.c       | 53 +++++++++++++++++++++++++++--------
>  tools/lib/bpf/skel_internal.h | 24 ++++++++++++++--
>  2 files changed, 63 insertions(+), 14 deletions(-)

[...]

> @@ -263,13 +269,24 @@ static bool is_mmapable_map(const struct bpf_map *m=
ap, char *buf, size_t sz)
>                 return true;
>         }
>
> -       if (!bpf_map__is_internal(map) || !(bpf_map__map_flags(map) & BPF=
_F_MMAPABLE))
> +       if (!bpf_map__is_internal(map))
>                 return false;
>
>         if (!get_map_ident(map, buf, sz))
>                 return false;
>
> -       return true;
> +       if (bpf_map__map_flags(map) & BPF_F_MMAPABLE)
> +               return true;
> +
> +       if (bpf_map__type(map) =3D=3D BPF_MAP_TYPE_PERCPU_ARRAY)
> +               return bpf_map__btf_value_type_id(map) !=3D 0;

why do we need this btf_value_type_id() check? in what case it's
expected that there will be no BTF info set?

> +
> +       return false;
> +}
> +
> +static bool is_mmapable_map(const struct bpf_map *map, char *buf, size_t=
 sz)
> +{
> +       return is_skel_data(map, buf, sz) && bpf_map__type(map) !=3D BPF_=
MAP_TYPE_PERCPU_ARRAY;
>  }
>

[...]
