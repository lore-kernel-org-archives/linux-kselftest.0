Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FA9370D71
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 22:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782254784; cv=pass; b=M0DrGvSSlgTbDI+1hwQjocJ72n2wNNBQAfckr1vTrGu1s3NM0Mrz68Cg3HQZZQzGgoMTVW5R6phCQVFfHN2gcLRoOyrIFCju7uHJe8zlokoSTrmA6zl3nvxsSkYmjP3L84KpYI+Hv+2c6lpkeaiYSKLie1xRBxcyd1bt563XvNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782254784; c=relaxed/simple;
	bh=2KfuZmVM/gMcaXgErOb5bxKkcTPuwXT7L/88bA0HkXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tURt7oLvlaVVZOAnAK/7hsvuZPpgCEIJbDpu7rtJJUR9G4kcQ3Yveq9G5Sbafxx34TPV34B3e6Pssc4Nh70LZzuysjKwuCKXoubyNbtLImzA/yHKGCx4rfvOn1eWvhpyldzFwN+eVbj5cypGwuCWvwOOIEZldIB2At7mMAH7BnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/A32Cje; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/A32Cje"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c6ab886da6so1973055ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 15:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782254782; cv=none;
        d=google.com; s=arc-20240605;
        b=b3byTB9kidIR+XuA5s4uU6YV7eTM3NjdrILIF6gD/zLA9Ta7c+Wj58uehjccub7mnR
         KKrfdZD8vGi/bF024U5y1/b2llkg5CtdC0PMCwsSe/WcE/8zxXHSgeTeggL3qAq1bmNn
         yDixp7cKFyj/y9rK6ErV04UbqACuvQM45/TU976tFmtzdkPZ5HuI55OjujCFXMywXU4v
         QN6YJmBg8fR+3nJX7tmq+Yq66RsQoYfK3g31mZ+VH5ZzJK5eKjbTUGrf0saktYkxLA5i
         B6b098w5eFO4hU+rwJWh4kFj0v7z+VAIppQ4vA55tu8kv5PDt9tAWcJk1G/X4skFXBSa
         EfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LG2kX0FyH0fi9b0fEy2d9lpzMp4yF/LqqDGrDnJk65A=;
        fh=m/mq7BWYbVg2moL+UsRrZOc+tIY7ouz9oa6LOFg8I+E=;
        b=a4Aa7Ob1tdhxMpjs7zsDmivfTkBZYKddYKnfU44Kvx5KPFeb6MFpH9guObyQDC9WYO
         Q8nDNC1Fz19DPENcj7Ar7vhYr+1vQ1HzwGghYhuzf96qUNQIlDovWizg5rUge4ZwiGCV
         uV1imqcWquNgiwO2LnxTzLSIfRHfk7kLaiaAA5J3DSAA5xVwRBnFFW2XJbwtB1l1MiIv
         m1jrvkYs4pq7Xc7WbEv50YtEOgaU4vryX6apHw7r/61Bes0ozI5V3DiS51cp3TuxRW96
         hl9aXQs4gIF4yG8M1mBncV/OgpWVbLGnjZBGPZ/PSPOOJdFkiXJDCyQuJ1cyL+FvazJi
         Kq7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782254782; x=1782859582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LG2kX0FyH0fi9b0fEy2d9lpzMp4yF/LqqDGrDnJk65A=;
        b=R/A32Cjerpc/032rWMm9ZS/T7o81vkYKOWDTydhy9ANYA2qxavW5TBtMTGjJoBGvtP
         4yGMoPH+QZ4vmoYsdIvVQ6URjxoHeTwSBX8ghkUDj663WQrN5xmMxxxqdsjk/ed8TEXV
         nYQuDLHx/zJ8p3o6V3iLTiJcVXToj74tEadXEqplabrf7iOUvSHoQPIlbKw6KV26EXVJ
         cqxo2lJ5sLqZJ26+5yxX8l/Y+4gGUnPF5mqCD0COYIgcON9oojB/YGWiPfr6xLXQjqRk
         ZlBOyg1rbaUtcZMBqL50f50X5ghX6FdNXmtaQbyaPNNiXbX0e5dS3eAGfUraVhTetPoA
         9Vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782254782; x=1782859582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LG2kX0FyH0fi9b0fEy2d9lpzMp4yF/LqqDGrDnJk65A=;
        b=Gl4jui2HptCDiomm3x1WgueU6dP+tjgvpNqcJSzGwB5If9n78C3OGS993GeG8c1F1X
         1JCY0FyZJUcrsLCXpGwuHriGjC++q1Wxhek2+dJpy76h+Mz7iOXIOdNMleUh6s5Bh6Ij
         d8TjWX/c7KCcKHtY4rA9a13bz0KZj5dPvDUf4f1xfWfBv0ueyZG9Jo3YfF2kljLaCs3r
         F2kFZ/6ddUBSG1lAJ4DlISNBKt8tnIzYuAYq/ZVRy2rZMsZmxKR9M4wf31Lz9XDORois
         P4S/NMNYQNXcNjG5B5TDt8AuaXM9rVgH7/kHZL7Up176VBfFh3KoSeszwfMCSzg6rIB8
         85sQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqqxbz05LwExGOK0rhgL/9cPGAhasfH5ePwk3L4qqOKgwp0PlQqUGxcMGu3fdcVxaeVXJjECcXP2Vqu2Y7yuS4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/rxARBy9iXpLYZXnQxYX1oLwMurbczidx+34Ndn0dlQSRgQRF
	5yu42yvXoYyrj/VhvqXKNaU3VwlVY1rqjSC0QjCoXgrb+CYjRycj7hEdeI78mVTXqzAR1dbxlOG
	lPa+e21LX4FnstRyf2534AGBJaexSDjQ=
X-Gm-Gg: AfdE7clA9DztFMF9Xs7ZRQOTQS0xxj+thllD2kmFkg04VwBmu0dutkfhkTEtCejKu4L
	otwLu/qoeVpRsSBYm4ximUH0UL0tHiN2Uo/2PZogu9nLoyewhcm67jLFchR51pvvCdewx/71C/X
	fhVDUrercEYAQ7o4/J6WjwzKPRff1rpeOVk6MMRi2D9rWK4AN7GZatyIv8uBrJxB3Qr3H2vu8Ej
	BqUczxuniBDoWwLsXQgkLzb5aLADJrrHONfZ/aAWxO29iGc39x+CPPVs4I954nKAk5LX7SZkv3K
	fqPSs/CL1yZcO24CoKTJh195oxEUUmxm0SXYKU4EVGk9+xFt2xYlYSI6jbaNRTeuAURnOA==
X-Received: by 2002:a17:902:ccca:b0:2bd:9803:9308 with SMTP id
 d9443c01a7336-2c7e1599b6bmr7966225ad.36.1782254782100; Tue, 23 Jun 2026
 15:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622143557.22955-1-leon.hwang@linux.dev> <20260622143557.22955-8-leon.hwang@linux.dev>
In-Reply-To: <20260622143557.22955-8-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 23 Jun 2026 15:46:03 -0700
X-Gm-Features: AVVi8CcgnEvwwbjcYZujttXeSs_xcAFmcG2-55vXm4A13ZgA43xyrkXYm4hX8Rw
Message-ID: <CAEf4Bzay2Wssj1J4fEq3T7iTOBDswEZunm1OQNDJvPr2Cz2Usg@mail.gmail.com>
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

On Mon, Jun 22, 2026 at 7:37=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
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
> Assisted-by: Codex:gpt-5.5-xhigh
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/bpf/bpftool/gen.c       | 43 +++++++++++++++++++++++++++--------
>  tools/lib/bpf/skel_internal.h | 24 +++++++++++++++++--
>  2 files changed, 56 insertions(+), 11 deletions(-)
>

[...]

> @@ -263,13 +268,12 @@ static bool is_mmapable_map(const struct bpf_map *m=
ap, char *buf, size_t sz)
>                 return true;
>         }
>
> -       if (!bpf_map__is_internal(map) || !(bpf_map__map_flags(map) & BPF=
_F_MMAPABLE))
> -               return false;
> -
> -       if (!get_map_ident(map, buf, sz))
> -               return false;
> +       if (bpf_map__is_internal(map) &&
> +           ((bpf_map__map_flags(map) & BPF_F_MMAPABLE) || bpf_map_is_per=
cpu_data(map)) &&
> +           get_map_ident(map, buf, sz))
> +               return true;
>

just add `if (bpf_map_is_percpu_data(map) return true;`? maybe also
move get_map_ident check a bit earlier. I think that will be a bit
cleaner, this condition is quite hard to follow

> -       return true;
> +       return false;
>  }
>
>  static int codegen_datasecs(struct bpf_object *obj, const char *obj_name=
)
> @@ -343,6 +347,9 @@ static int codegen_subskel_datasecs(struct bpf_object=
 *obj, const char *obj_name
>                 if (!is_mmapable_map(map, map_ident, sizeof(map_ident)))
>                         continue;
>
> +               if (bpf_map_is_percpu_data(map))
> +                       continue;
> +
>                 sec =3D find_type_for_map(btf, map_ident);
>                 if (!sec)
>                         continue;
> @@ -669,7 +676,7 @@ static void codegen_destroy(struct bpf_object *obj, c=
onst char *obj_name)
>                 if (!get_map_ident(map, ident, sizeof(ident)))
>                         continue;
>                 if (bpf_map__is_internal(map) &&
> -                   (bpf_map__map_flags(map) & BPF_F_MMAPABLE))
> +                   ((bpf_map__map_flags(map) & BPF_F_MMAPABLE) || bpf_ma=
p_is_percpu_data(map)))

also we can add a helper to check if it's an internal map with a
dedicated data section in the skeleton (too lazy to think of a good
name right now.. ;)

>                         printf("\tskel_free_map_data(skel->%1$s, skel->ma=
ps.%1$s.initial_value, %2$zu);\n",
>                                ident, bpf_map_mmap_sz(map));
>                 codegen("\

[...]
