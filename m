Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793917097;
	b=S/N3tvCtpHS+rjX0YboBYrLbZa0ALxCTfQnKsHpRXssI4+HMwVxIkrdvg2v3wMj6NhnL
	 aiyZpGGuNK/jPMwD+XBsGAngOcE2gOoKDkj6smL5LNW2+DaBngMjZTPEEotIhk0zQjans
	 UnnI+8wtox2UWKR4ecWle3rbb1Ih5f8D+qLNQCvmeP3OGg1suXua940dU6Sv0+NaoyaVA
	 445PQmNiGT6IsBSNlMmBZjhKn3F5RlwwmcT+9j27QFmb8g1saUKswoWcLbMq5M4fqA0pd
	 wDwoGkGdYVP5ImpeEUiAVNNCOSEx4Ms+xrKb+kdlK2pGsU5sSsgZx69/n1HIKxk+cCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fqGVZPaa7rOGThM2M7sm+fUU71jDaMCbeLhN4/WfcaI=;
	b=08M/p6nv6lfl3lXwzIHPyMzv/BYfRcmI9E+4HaPYQIaomgDIi6LsU0WkOahLwc83ZZfU
	 fbJfchjWgGktOLnuc/tvZZ8cL3/cwRA6rxwRplXGHPWEJ+hugYJvrO1HQeC7zkmFsDEFO
	 +O0TPUYTFCi5ljORNWGIzjZOsEzp1D+FJ6CRgRUXBzSLxAUOEJyOdcxBwSzFx3dZTtXzd
	 oT6ACjEGfvIVeq0hAf78diirNQJGAVdoA9Df+eHmzLqNKQwQa4m6wn/Z68dDf7YMtxToq
	 62gYBX+NXt+qh7ZsJ+SfL8U79EiR1mM7y53UmaeF1lpuD7ZbhdQwvOskLCNDsAI67CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKp3A2Od;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1783F606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 22:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1783F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKp3A2Od
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9995ce866so75015ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 14:18:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793917096; cv=none;
        d=google.com; s=arc-20260327;
        b=TrSrGdfp7VwhFfekm11l55ygVpFEgQCEmm2+mTJfOYT7uSt+FtMkSRayGJazmI6YTx
         O6qzkME9W4VrsHENrxvSel1EflJj1l0bFFOnypINBH+lKFWgVl3OQivPSGL2L2CzPvAD
         ozU5tdaeT8kFoX9zGkIAth2ZCy+xGb4PJ4Ix1eI2NuaMkwWB0TUW3jCLLrCuvmx9zMgB
         Agehc5sa7GDorj0V/Qv8Y+ntz0/USADEVUSbEZUx63RVoxQpSx/SzGcXVMNzRYz8Uz6G
         oFXA4s7w0Hd2njtdtIZZpu/xQe4B15OGMl/miovWyik8i5cuEdlCjQqToBQqlSbUfMyk
         G5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fqGVZPaa7rOGThM2M7sm+fUU71jDaMCbeLhN4/WfcaI=;
        fh=vRfeVVSmDw2GjGwPRNdve2x5VNs04duqh0LmpmHF7Zw=;
        b=cHTS0lLCygHVi5siE387L2LXKqgWQP0y7xiS7zD+e3X0CiFMPMJ7VjjCT3cw4FlVnu
         R9xT5L+uEmmlgvlUItQTvvsu3D4GD8c9/rOl8ci9NrTu67YitybCpKKjUejVz89+kr2V
         VrWiRbOFXkhHLjO/W/AYJXQWepj7TC+kxFXfef7CcRmPRaCAIAHuf3J8i6FQfy+9nw47
         rTJSOm8lfLB7LEpxAc/3pt/vg7MFVgpIPfQfu8q7hPAK5fzimLGPl2ctSJFhmyr4GARv
         ByA4LK/WsEVt1gNOxylKSJGJPAeUF4lAZ+MiK3X5yhoEO0pXdVOegh+JU9RlsQoCTfK8
         Cvrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917096; x=1794521896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqGVZPaa7rOGThM2M7sm+fUU71jDaMCbeLhN4/WfcaI=;
        b=gKp3A2OdyUpr1iXmwvuJ2I9EuqFYLOqS2j7DQeAsRTzzvAH+XY6WgsVnEE/gdB9pN3
         t5sX1e5kUT91YUSzuJdqTs2fMBx7/Hng+qcBD2ciZMLVEdJwKMhQxb6VwOhdn7e6nRW5
         6jwg69YY6b+SNYBLO/eJXMepPYpc876dW6v3VRyiUve4KkCGsI/QyW2+a+i2uLlATGsj
         5gHUKpozkhbpl7iV/OHI25MpxIuZr5flRSeTrvZZzCDtn578uVn5RoVyJ+ez8wqeoKmR
         H6Me4PwMLSo5v4Wa3n8CDDCSM7iQHYKkZx49kpE8xH06oQStwJja6G6TmJG0QExJAHzV
         PL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917096; x=1794521896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqGVZPaa7rOGThM2M7sm+fUU71jDaMCbeLhN4/WfcaI=;
        b=yUpESHZ58ymUL8hZy5BcEY+QY+Um3TTdyI2D80ZRlYSmJZeudgxRXiknWRPYwhypJ6
         6lvHfH2u7ceW2kSWYDVXwOogexXejZ9muMvz7VesQYBRE3/Ou85MGPF9PH+uX5dm90oR
         di8fcyUUevLAHGPfgtoCD7zZ72q5DN63/QYS3wve+DJ23uy6Fwq02YmbgfWLyPSfB7+V
         42B5dA5PiUVkRcvcwX0NLXPo3lm0WZ5DLS0KUdeHs8zV8zgE8QHdWMv3Rl3xDQKNX/OU
         3lGmdCY4jS/tDtYrQoM8daS57VhXbflmMNZqq4Vg4UAF3mrxtotsYYUyDUrKWfT8+YKT
         jiKg==
X-Forwarded-Encrypted: i=1; AKwUvBwSb6nDZFYe5tS5w2LwLt+80p1yv8P+SkdIhn26U4K+zaeH5GLquP2eM0CmoGkqUNaaiAc9DpWucwZq3Xf6FiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qim4FaqK5gNQQqpNJnrknO5J+FPgEkKvoG+aDEWZZUApovX6D
	uuDuW5bquhAcjpRwEaMfmUvTwAe12ROYDEXBuuBWy6lVFh7onmPfG1TMR/yQjOPN+Zb5x2mOLa7
	qunq7Tcb73KF82RHerJGy6luXrpobG9U=
X-Gm-Gg: AYBFou3vhvG0v3S+IiIfALZL32mtmC6xAVlWnolAC78DrpQ8tiKku2twO6vulRKGrsk
	/6o6tvN0LZkFwHRnNlCcf9OUK3cECjzszXFXmw01ajqiXZ9WCzc+ZWuznygM52n3kBDyInH5/kj
	lmUf+/McLp+9G/1AO9DV+djK5gcqtWzcvA0uwcP2cYWrGRo97pQ3iG4jLo/ewQ9KUErPspA4Ah8
	hp8pDNDBft+E7HKBVex/c1Vz2YaSDnq+mYYwwP4H9GRps1l3yIQeXjL/kU8S0+fWmI52Z3BP1GI
	PQ2mGIirqagQGw/kP0SQRwU9V5i4dI6VrrCWTTDAMRrbII7jPwjsm0aeOPQr7WFwy4Ef5oYFAqM
	McZG+9qmdHw7qYbSXupvnvTFK0TRRMvkoBeQQ4e1ssCoPk8SmmWr9LA287/ovJ5z9YYY1oDIUUG
	Zn6tA8j9I8uz9IlkJcER73LIIlZjeJeyAfYQ==
X-Received: by 2002:a17:902:d2cd:b0:2e8:5202:aa8c with SMTP id
 d9443c01a7336-2ed41c447c2mr10044985ad.48.1793917096355; Thu, 05 Nov 2026
 14:18:16 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101103221.51534-1-dennylin0707@gmail.com> <20261101103221.51534-3-dennylin0707@gmail.com>
In-Reply-To: <20261101103221.51534-3-dennylin0707@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 5 Nov 2026 14:18:03 -0800
X-Gm-Features: AclHuK_dLJPArclYNX3UADg6ClTszBmlVMJeiwepHsSAXolKV5xcFCTVjjhNWVg
Message-ID: <CAEf4BzaES0KDyhHhk7UguLmRKVWxGoiEXhNvp7QHpeJSZSjbYA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/3] bpftool: Preserve unsigned enum values in
 data dumps
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: ast@kernel.org, bpf@vger.kernel.org, andrii@kernel.org, qmo@kernel.org, 
	daniel@iogearbox.net, yonghong.song@linux.dev, eddyz87@gmail.com, 
	ihor.solodrai@linux.dev, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 2:32=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com> =
wrote:
>
> btf_dumper_enum() loads ordinary enum data as signed and uses signed
> numeric output. Unsigned values with the high bit set can therefore be
> printed as negative numbers. Narrow unsigned values also fail to match
> their enumerators: an eight-bit 0xff is loaded as -1, while its named
> value is stored as 255.
>
> btf_dumper_enum64() likewise uses signed numeric output for unmatched
> values. For example, 0x8000000000000001 is printed as
> -9223372036854775807 instead of 9223372036854775809.
>
> Load the data according to the enum's signedness, use btf_enum_value()
> for name matching, and select the numeric writer according to kflag.
>
> Retain the original signed-width comparison and give it priority over
> new matches. This preserves names from older BTF without signedness,
> including eight-byte ordinary enums, and keeps the selected name when
> multiple enumerators could match. Remember the first normalized match
> while looking for an original match so only one scan is needed.
>
> For an eight-byte BTF_KIND_ENUM with kflag clear, a negative stored
> enumerator can therefore match both its sign- and zero-extended values.
> The record cannot distinguish legacy signed metadata from unsigned
> metadata with the same bits.
>
> Unmatched values are printed as unsigned when kflag is clear. This
> includes BTF read back from kernels without enum64 support, where libbpf
> clears kflag before loading. The original signedness cannot be recovered
> from that flag.
>
> Fixes: ca7e6e45d108 ("bpftool: Print the enum's name instead of value")
> Fixes: 58a53978fdf6 ("bpftool: Add btf enum64 support")
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  tools/bpf/bpftool/btf_dumper.c | 42 +++++++++++++++++++++++-----------
>  1 file changed, 29 insertions(+), 13 deletions(-)
>

how old by now are those btf produces that do not emit kflag=3D1 for
signed enums? should we even care at this point or just assume that
kflag is set correctly?

> diff --git a/tools/bpf/bpftool/btf_dumper.c b/tools/bpf/bpftool/btf_dumpe=
r.c
> index 3267163119dc..792e210cb503 100644
> --- a/tools/bpf/bpftool/btf_dumper.c
> +++ b/tools/bpf/bpftool/btf_dumper.c
> @@ -148,37 +148,50 @@ static int btf_dumper_enum(const struct btf_dumper =
*d,
>                             const struct btf_type *t,
>                             const void *data)
>  {
> -       const struct btf_enum *enums =3D btf_enum(t);
> -       __s64 value;
> +       const struct btf_enum *enums =3D btf_enum(t), *match =3D NULL;
> +       bool is_signed =3D btf_kflag(t);
> +       __s64 value, legacy_value;
>         __u32 i;
>
>         switch (t->size) {
>         case 8:
> -               value =3D *(__s64 *)data;
> +               legacy_value =3D *(__s64 *)data;
> +               value =3D legacy_value;
>                 break;
>         case 4:
> -               value =3D *(__s32 *)data;
> +               legacy_value =3D *(__s32 *)data;
> +               value =3D is_signed ? legacy_value : *(__u32 *)data;
>                 break;
>         case 2:
> -               value =3D *(__s16 *)data;
> +               legacy_value =3D *(__s16 *)data;
> +               value =3D is_signed ? legacy_value : *(__u16 *)data;
>                 break;
>         case 1:
> -               value =3D *(__s8 *)data;
> +               legacy_value =3D *(__s8 *)data;
> +               value =3D is_signed ? legacy_value : *(__u8 *)data;
>                 break;
>         default:
>                 return -EINVAL;
>         }
>
> +       /* Prefer existing name matches, including signed enums without k=
flag. */
>         for (i =3D 0; i < btf_vlen(t); i++) {
> -               if (value =3D=3D enums[i].val) {
> -                       jsonw_string(d->jw,
> -                                    btf__name_by_offset(d->btf,
> -                                                        enums[i].name_of=
f));
> -                       return 0;
> +               if (legacy_value =3D=3D enums[i].val) {
> +                       match =3D &enums[i];
> +                       break;
>                 }
> +               if (!match && value =3D=3D btf_enum_value(t, &enums[i]))
> +                       match =3D &enums[i];
> +       }
> +       if (match) {
> +               jsonw_string(d->jw, btf__name_by_offset(d->btf, match->na=
me_off));
> +               return 0;
>         }
>
> -       jsonw_int(d->jw, value);
> +       if (is_signed)
> +               jsonw_int(d->jw, value);
> +       else
> +               jsonw_uint(d->jw, value);
>         return 0;
>  }
>
> @@ -204,7 +217,10 @@ static int btf_dumper_enum64(const struct btf_dumper=
 *d,
>                 }
>         }
>
> -       jsonw_int(d->jw, value);
> +       if (btf_kflag(t))
> +               jsonw_int(d->jw, value);
> +       else
> +               jsonw_uint(d->jw, value);
>         return 0;
>  }
>
> --
> 2.43.0
>
