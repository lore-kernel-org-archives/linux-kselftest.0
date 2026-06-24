Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D98133A9FE
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 16:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782319636; cv=pass; b=seN+L1UrT4ET8Q6eu4xuAkk0N0e5BcAOSMySHF6OSmr89d15HM1475PjkRd9lD9GfP7A842Y4GhmDnnZ95XjuNSp2EDDcf7Y0FEUvykmq35jH8tuvIwdyZFWImHtUOUzPerFDARQaMxndp+hdW3TQGjZ5QL17ZuKBksfS6Yg3TM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782319636; c=relaxed/simple;
	bh=jb87HJfRSFh3ibClaIfUFqxc2lysBISQLAvxBTwcuj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bv9CwLbFJvoDLy2fN3ugMirhmBvHlT1a/qry7oSAcXcum4blgGiYdjoh1PHmzXiJVH55RHTyLbiSFqmD5aE/keGbqve5UNF93IJ8PxTEzHRDpIMjfoW9vqE8BMnZKmUDS6Vo/4pEB5m7txI37FHho74jHOLDBnKGGLQq2FkAXg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuKf5KIf; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuKf5KIf"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c892935bcdeso584488a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 09:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782319634; cv=none;
        d=google.com; s=arc-20240605;
        b=jFlsSDVKoOUAwBW7Z03RfyzDvFkI2Z1Zr/WgynnT14jZTJsTtpF9FeE4Ppra4h2yxo
         Wx8xvR+t8bLpFzOkLBptEzcckmx7EFig2i/ALLfgGJ87p4zwvJOWHhCdOH0+3AQ2sou/
         d1V7GpshW7J6qpJEsKoIcp1egsxVxYdBFy6dw95zTJ7dcqbALDz7Miun4i68m8EAp+70
         FonuvET5j14zMt+Fl9gykHdq7LtFeIw0xMa+7ru5lVBqtONolX/SORW6xzdcDM4UxJq4
         Wa+wuHafI0iruTSpfbIhNjb0mx4T7oplZadDCcsJRDYev48qlefL77rtqTVj0h+J+FzO
         Wwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6SeAj53ToL+iIhvb8r7rZIq250sEiBfsaAyAkUxRk5E=;
        fh=TMEWgmN88DJMD2exm1tIITtym7+vQz/XGZ3r00Y8Jrc=;
        b=BcLwlOt8wiforhNI9b+OLqubkSBXF8yt4O/E3+l3o53ugzKYZKzDyK5wKJKmn5vQws
         /aq+J5+FIPdVoHh5J2oPU8XeHC72SHEd93gP1adgndHtugxrixiP5wrsm5iwx1doiqG8
         nE/qCd+aceXRDEgIHReuxhmgRfh4ENKeJQuC/x2vfY1+YcWTTQ49uqaKwq9T2GHpgM0q
         yzH3jDrCuzEvW1G0gxocqOKcjHMyBWSIrthKD/FAIVWwSvipMmXdqehm2nhH5lSTVNng
         ZzXoBPMxY+KvFzEVZ9wkd5KTuhO2iOidirhcCTlDyVLhPIRbmiBv4/94epBBGGz2aPwe
         AJmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782319634; x=1782924434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SeAj53ToL+iIhvb8r7rZIq250sEiBfsaAyAkUxRk5E=;
        b=fuKf5KIfZCUhaMM7Jw5GCxvmtruSQOOWbiti6peSj/5///0KiIRN7QklHhqHVb40sh
         1SzdJDClUzooH7JMDT+hw6gU9hN2KRSoptwWkox/Sm5HKHTQtP1IWC9AMupskvAg9P1R
         09aDnY+O3ITXZ4cUXzHOpI+q5fjvR73qHMgjHbtB4ao13LZPrEGzBYgJWd4DOcyLKq/F
         ZSpYMGZ0YtEw+SlgzXip+JBLyegXWzMNC8JnILO1VoiugSYtjHDmUwcuN49kR+/VZTZZ
         Oj+zQm1DTopeLqj/h1YvfdP/fSQ/bHZDzXXQP0dS2TjAHiOLdvY04II0KIZPKf4R/5Me
         Nv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782319634; x=1782924434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6SeAj53ToL+iIhvb8r7rZIq250sEiBfsaAyAkUxRk5E=;
        b=PnIDWPAglr1PZY34ryuz/MNmOaHuEQbmv4nPrsco2wlf5RbQH2P+5UhP7I4ScYgSlw
         A/YjCm0XMvIf1adTY6DNBlE755dI9SDM2EtFEpl97w1eHuqh0Cyi6U4iLohLMZpyfZim
         y07UWeswaD0oebwUwmjCrtz9y+6Y3PH+dAxmTgEBD83mK1tG7dDY+TSwDUXJR1HmSmBz
         kXV6N+KEwj0A5c6oOCJxhfjuGgZ/ANxCsiRTA8D9jTq5xsX4xgRLgFBAda4Zosu4EDle
         KQtNXqbjJK2dXli0yz6siudxIYY+ahPU/8Sk0GDtSR0AEpUe1MdhT3n4G3KNkei328H/
         oF3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrwZlm7x18S2j7KRRL79xgXf3zGtV7bYISlK6fo1puqBUfsq7hCFQFQ568I3pVlPQeRHwQ/KxHWpFIFyHfcy54=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEZNqw4tpn94QoT0yBUT5dVlzULlK6OyMrljUeZve04L4gX16L
	pmwYLMF/VzUM3tgK88s0i/k+A3jrT8crIC9g4Wncxum8M3154EEHxetsbDVP8BQFvCtNyJJFQ0A
	26Hq7GHL9OenW44MjeqAqpiZsQPgNbNQ=
X-Gm-Gg: AfdE7ckcM6xoVQI5boyZ0MEQvTc18B9uxqUhqoDaT3ovoe/Pbuuur6cx5J41rasuM0s
	6JIEdp1hWErhzKsVmgYqf6j6+BtZuZEYiJbiLJgaWd10jNmhgWaSWWIzB2f4N9kDYkSxueQRLPb
	qKU6kVDZf9N1r2kp9jRXQ9W5SHyoUnvCtdw7vaQnEBXlSg+zE/AU3cShW1h0VOr7QLKMaZCyMNf
	0/1ULYqMOHqZnhosxpvdx7NL3dGdnubS5ms1zAQ86jdgm73QevjTUpV93CYn7kJ54nvP8LgzYgJ
	fFuHRyf14rSkrJdja2ttTnA9dVwD3GDJpC7nL5VWBQAZkmol8Wk/dBR1DSKU0XrTEbs=
X-Received: by 2002:a17:903:1aad:b0:2c1:ef9:4516 with SMTP id
 d9443c01a7336-2c7e15c5297mr43635345ad.35.1782319634356; Wed, 24 Jun 2026
 09:47:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622143557.22955-1-leon.hwang@linux.dev> <20260622143557.22955-8-leon.hwang@linux.dev>
 <CAEf4Bzay2Wssj1J4fEq3T7iTOBDswEZunm1OQNDJvPr2Cz2Usg@mail.gmail.com> <2330e6a8-c7eb-4296-8aa0-feaafd6b09cf@linux.dev>
In-Reply-To: <2330e6a8-c7eb-4296-8aa0-feaafd6b09cf@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 24 Jun 2026 09:47:01 -0700
X-Gm-Features: AVVi8CfvajdsKBdz7BjLSNC0Pr7m6oD_1G7bxZMh3vJsMu1aR84CN80Svee0E40
Message-ID: <CAEf4BzaiYCAqSQgxeEv=8tmtNLYaghj8OBmRJdUDiUm2AKAwSg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 07/11] bpftool: Generate skeleton for global
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

On Tue, Jun 23, 2026 at 9:15=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 24/6/26 06:46, Andrii Nakryiko wrote:
> > On Mon, Jun 22, 2026 at 7:37=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> [...]
> >> @@ -263,13 +268,12 @@ static bool is_mmapable_map(const struct bpf_map=
 *map, char *buf, size_t sz)
> >>                 return true;
> >>         }
> >>
> >> -       if (!bpf_map__is_internal(map) || !(bpf_map__map_flags(map) & =
BPF_F_MMAPABLE))
> >> -               return false;
> >> -
> >> -       if (!get_map_ident(map, buf, sz))
> >> -               return false;
> >> +       if (bpf_map__is_internal(map) &&
> >> +           ((bpf_map__map_flags(map) & BPF_F_MMAPABLE) || bpf_map_is_=
percpu_data(map)) &&
> >> +           get_map_ident(map, buf, sz))
> >> +               return true;
> >>
> >
> > just add `if (bpf_map_is_percpu_data(map) return true;`? maybe also
> > move get_map_ident check a bit earlier. I think that will be a bit
> > cleaner, this condition is quite hard to follow
> >
>
> Makes sense.
>
> With adding the helper bpf_map_is_skel_data(), will this change looks
> more readable?
>
>
> +static bool bpf_map_is_skel_data(const struct bpf_map *map)
> +{
> +       return bpf_map__is_internal(map) &&
> +               ((bpf_map__map_flags(map) & BPF_F_MMAPABLE) ||
> +                bpf_map__type(map) =3D=3D BPF_MAP_TYPE_PERCPU_ARRAY);

if (!bpf_map__is_internal(map))
    return false;

return (bpf_map__map_flags(map) & BPF_F_MMAPABLE) ||
bpf_map__type(map) =3D=3D BPF_MAP_TYPE_PERCPU_ARRAY;

or just split that last return into two if (...) return true);

both work for me

> +}
> +
>  static bool is_mmapable_map(const struct bpf_map *map, char *buf,
> size_t sz)
>  {
>         size_t tmp_sz;
> @@ -263,7 +274,7 @@ static bool is_mmapable_map(const struct bpf_map
> *map, char *buf, size_t sz)
>                 return true;
>         }
>
> -       if (!bpf_map__is_internal(map) || !(bpf_map__map_flags(map) &
> BPF_F_MMAPABLE))
> +       if (!bpf_map_is_skel_data(map))
>                 return false;
>
>         if (!get_map_ident(map, buf, sz))
>
>
> >> -       return true;
> >> +       return false;
> >>  }
> >>
> >>  static int codegen_datasecs(struct bpf_object *obj, const char *obj_n=
ame)
> >> @@ -343,6 +347,9 @@ static int codegen_subskel_datasecs(struct bpf_obj=
ect *obj, const char *obj_name
> >>                 if (!is_mmapable_map(map, map_ident, sizeof(map_ident)=
))
> >>                         continue;
> >>
> >> +               if (bpf_map_is_percpu_data(map))
> >> +                       continue;
> >> +
> >>                 sec =3D find_type_for_map(btf, map_ident);
> >>                 if (!sec)
> >>                         continue;
> >> @@ -669,7 +676,7 @@ static void codegen_destroy(struct bpf_object *obj=
, const char *obj_name)
> >>                 if (!get_map_ident(map, ident, sizeof(ident)))
> >>                         continue;
> >>                 if (bpf_map__is_internal(map) &&
> >> -                   (bpf_map__map_flags(map) & BPF_F_MMAPABLE))
> >> +                   ((bpf_map__map_flags(map) & BPF_F_MMAPABLE) || bpf=
_map_is_percpu_data(map)))
> >
> > also we can add a helper to check if it's an internal map with a
> > dedicated data section in the skeleton (too lazy to think of a good
> > name right now.. ;)
> >
>
> How about bpf_map_is_skel_data()?
>
> Then, this 'if' will be updated as 'if (bpf_map_is_skel_data(map))'.

yeah, I like the name

>
> Thanks,
> Leon
>
> >>                         printf("\tskel_free_map_data(skel->%1$s, skel-=
>maps.%1$s.initial_value, %2$zu);\n",
> >>                                ident, bpf_map_mmap_sz(map));
> >>                 codegen("\
> >
> > [...]
>
