Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4F93DAAA3
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 18:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338303; cv=pass; b=bV3Vj6xIypTMPNJ2HvNaJf0obPplrH13WXDfuXlelKtnwR69kOLTYCx9+pkidnobtrgzmB/R65BHFDJpQvPUFkL4oE9KRUHa55q8+NhtxZne1Z/gDavSdVVgTF9QA2O1C2G30CPHAP1uftdhOF6Uig467cc6CimNa9RtWk3L8Xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338303; c=relaxed/simple;
	bh=NIWMkIUbvXPAl6EKgLhdrXX7S7LGSTaIhRjSJEMIXxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dG5j+/FEuRu8Btk5DGjOrdGyBx8V5ChPmFriprfb0CXUL5xShqTgOwpUOuBjuRC4fpw3BkkX3+6hZzWTkKZp3vFrER3DKQvyhVCj9hKU/cvGlRmwIFmcAohGZEkV6OIlF0oRk/BUQt2PaZe4PY9LLZS8pM2+zRbT4Qudvy2thYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rU7g80wD; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rU7g80wD"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8486ac3f347so2112594b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 11:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787338301; cv=none;
        d=google.com; s=arc-20260327;
        b=UYeejD6Ce1f/mLYdXo5I2huyWbxO6uBCoDhiBiRJzxg48Zyg6KF1cLAt3XRVaRIXbF
         7GDVYSM6Mh3z53JOdqfzzDuaZJdFnSbptRXoOQJr0CCfT1S7w2UjgPKEQavsyuwNbDra
         rxJO0sPc7dUyllyiZAokksMrOnAh85Y7fXAuO5/9aeujNvHlA+F9sdoTFxNAox25ftqT
         2Q/tYMOJSlv4lx4K8QyNsM1ioLS2fGT30/kHBLfCISNjr0YC+sz84FZZOU4rTlZHohAJ
         rVzT6EAvKFBgH48Kv9fnOK6xYvD1a7vbZJrbGdNSAey8pD8zhA+m7vezqxIexSUeXeWQ
         NBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oWZLGtODBbyXHduHG3YdRMHM3iRLVvqAMmx1MHvzdFc=;
        fh=fXegUuthUFxpafIPuj1Rr3mYQiDrVZ27G7/zQEUEkCE=;
        b=XT4z9is1BJn372f89nLs6/m2/6ipWajrs3YOZIHuUPTUH/HmQnLYbRvntVtcUHozs2
         p3hIVmmKloXMCNtnOzs/WRfyF0oqbHjlYnOriGYSRfTKbMuzCdcTz+T3OGKIZHI/2Dfy
         n7SU1aNrqzr/AEAm9R+aWmXn65jJ8NoPIt29onBMKAdZrtl5K3JnwM3SoE/tpjAtu5MY
         +MJIIhLqyM1u3hAeP/zCzB/Q5utW3rH+fYoTKTHrVIQMOqmjD9+Pj0KmPdG1blyW/e9r
         gQ/1tHKouxwJ+9ws5/wiknCR5abWQ5w9zlla9KyYarMwbQq5hZrlkhg36Q2OnqZGRHeC
         Vp/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787338301; x=1787943101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oWZLGtODBbyXHduHG3YdRMHM3iRLVvqAMmx1MHvzdFc=;
        b=rU7g80wDOXaAb4jBhHV9An+67bgu3DLz0OjQ5iNWcMu7Wfy+gIDfVBEjU/kJzTv/Z/
         1IQuC/TFt9ZNj1eqi21RYgnckcBukFR/oWKcTrHMwxZMSTBu93sjhUZr25hSEsP4pYK+
         gRpZ1GLLfOTiSmhqVFY5ogzFqasxy0jloyQ0o/0Y7mlZQsArnZiF7tfIzeYI6QaYcqry
         M4JzB4vNh066h2DHsEIqnHWW+X2Vg7QPpp5WjH+60KZ7OeMIK1ojPLYCbl6+GyXh5Zlj
         A4mAqvikRInLwRUU3HPzMDbqOvAT5cV2kh3C2PLtqz7qjdudtd13QERh9sLqwm0Gh67e
         x34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338301; x=1787943101;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWZLGtODBbyXHduHG3YdRMHM3iRLVvqAMmx1MHvzdFc=;
        b=Rdo+aXsK4C2FCNdG0goL/VeneK63ZCOeX7nyfd69VBPq8ErtAvWZ6oMyqxvTJjUWrE
         XXj4J3EBks0ND/dRRgB8gmn1zEh66zihRln1G0FpMSCrksZxMVs9qVrKUnkiSyrGbeu6
         ldE8DI1jo0OOX2BSVeW8j2F0nc+l+B34N6+p7YrCpw9nwSG6nPi1OQ9MAoSSn+ExUi0a
         HNjALOD/EQMJehbtf1sd9HByguZhtOauI5vaJV53FSWAOhLH9Sl8Zs0qzMkRFJOoVCuz
         LwqMUy/lB7mYkXO3YgmXKqzNIu8UDnUG4pUYnGcaiCYR82b0Hq1xDSdtX0Xf1Jlu1dsN
         6PBw==
X-Forwarded-Encrypted: i=1; AHgh+Rqihpztx8+Uz99qfTPxiWDObBypponN17vBIS3wp4qXtZjpuP4qu7sAjjHsW3KziHkfihpadS/ICqNVXBeBj/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mGNY9VgW0KhPVqZSE4qyfu61C84Qz8cA46qe9RlNE4xQmv4G8L
	3lKEnx7K/hTW5CQdmRRm0GahDAeAkGcE1qJwe3W2pP4bIYThVWfvDymgvbP261O3NF5beNXYpnp
	Kv1sGaAizE3kp1aG6hEkPUj1oX5uvUBQ=
X-Gm-Gg: AR+sD13kmEbPglYA0EoONkYH8Lrm8U/+iUZhMRa/CJuyjXg3H1yIbyZXr3ptxUcRr0+
	Jpu+WMwTwBIU14aoPlYjGYVJB9afU/zaFnyhpsKscYImt2K86vs7d3SD+aDI2bYCm4IUMr/qUt7
	6QhYOCiWLyfXGDhKD5zI1gCunXodn9Ipk5Tn5ObXStVEHizypwDcVjCDfwZblH5AYBT/OkMgBB4
	vmS7bG2p1Uku4VZHZ0jb1yyZE6ItCAmIXjB2JlEt0A6DzSy0628t5/xYAVBtInUScAwSKdO+NBs
	IRH9jXo0CqS4zrgw5il0A2ZQzIdZjKJkvjIw0VjlpOBy7wxbIUB/ywgpYZqJ3PlrmJcrxbdEMtJ
	1QrSFAEthE1qVuY0doa0K/D7aBw==
X-Received: by 2002:a05:6a20:d805:b0:39c:4e62:b843 with SMTP id
 adf61e73a8af0-3cd31b9c813mr9418948637.10.1787338301310; Fri, 21 Aug 2026
 11:51:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819090426.267-1-zhaofuyu@vivo.com> <20260819090426.267-2-zhaofuyu@vivo.com>
 <5efea1c6d5feb9bfc4ffe3eedde9ab98c2613776.camel@gmail.com> <7fcd1b5f-dc15-486d-a56f-4961a25b133a@vivo.com>
In-Reply-To: <7fcd1b5f-dc15-486d-a56f-4961a25b133a@vivo.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 21 Aug 2026 11:51:29 -0700
X-Gm-Features: AcwNN1XkOXrewpBSkANR7_Y5df-c4uXL2CXnt-IDty4MWVZudHFMenfRjr9_y8E
Message-ID: <CAEf4BzbbdjeSW88EEk2xRvAxq-HWUJ7qTw4BYnL3kLH0f0uhwg@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v3 1/2] libbpf: support selective kernel
 module BTF loading via bpf_object_open_opts
To: Fuyu Zhao <zhaofuyu@vivo.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>, bpf@vger.kernel.org, alan.maguire@oracle.com, 
	andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	shuah@kernel.org, yatsenko@meta.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 8:51=E2=80=AFPM Fuyu Zhao <zhaofuyu@vivo.com> wrote=
:
>
> Hi Eduard,
>
> Thanks for the suggestions. Please see my responses inline below.
>
> On 8/21/2026 7:58 AM, Eduard Zingerman wrote:
> > On Wed, 2026-08-19 at 17:04 +0800, Fuyu Zhao wrote:
> >
> > Overall the logic seem to be fine for me, please find a few comments be=
low.
> >
> > ...
> >
> >> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> >> index 514e4e9daa82..37934ca49dd7 100644
> >> --- a/tools/lib/bpf/libbpf.c
> >> +++ b/tools/lib/bpf/libbpf.c
> >> @@ -779,6 +779,13 @@ struct bpf_object {
> >>      char *token_path;
> >>      int token_fd;
> >>
> >> +    /* kernel module BTFs to load, as specified via bpf_object_open_o=
pts */
> >> +    struct {
> >> +            char **names;
> >> +            size_t nr_names;
> >> +            struct hashmap *names_map;
> >
> > We already have a strset type, please use it instead of a direct
> > hashmap reference. This would remove the need for `names` field
> > and simplify the bpf_object__init_kmod_btfs() function.
> >
> > Also, do you expect `nr_names` to be high?
> > If not, wouldn't plain array search be simpler/faster here?
> >
>
> I initially used a hashmap to avoid repeatedly walking the requested
> module name list. But I don't expect nr_names to be high in practice, so
> a plain array search should be sufficient and simpler. I'll change this
> in the next version.
>
> >> +    } *kmod_btfs;
> >
> > Why indirection?
> >
>
> I followed the existing pattern in bpf_object and used an anonymous
> structure with indirection here. I don't have a strong reason to keep
> the indirection, though. I'll simplify it.
>
> > Also, I agree with the bot here, prior fields use "module" in the name,
> > so something like "btf_module_names" or similar is a better fit.
> > Same for publicly visible 'opts' name.
> >
>
> I think `btf_module_names` is a much better name than my original choice.
> I'll change that in `opts`, too.
>
> > ...
> >
> >> +static int bpf_object__init_kmod_btfs(struct bpf_object *obj,
> >> +                                  const struct bpf_object_open_opts *=
opts)
> >> +{
> >> +    const char **kmod_btf_names;
> >> +    size_t i, kmod_btf_names_cnt;
> >> +    int err;
> >> +
> >> +    kmod_btf_names =3D OPTS_GET(opts, kmod_btf_names, NULL);
> >> +    if (!kmod_btf_names)
> >> +            return 0;
> >> +
> >> +    kmod_btf_names_cnt =3D OPTS_GET(opts, kmod_btf_names_cnt, 0);
> >> +    if (!kmod_btf_names_cnt) {
> >> +            pr_warn("kmod_btf_names_cnt must be set when kmod_btf_nam=
es is provided\n");
> >> +            return -EINVAL;
> >
> > I kinda agree with the bot here, why disallow an empty filter here?
> >
>
> I understand the point now. I hadn't considered the use case of
> explicitly skipping all module BTFs. A non-NULL `kmod_btf_names` with a
> zero count is a way to represent this case, so I'll support it in the
> next version.
>

besides all Eduard's suggestions, one naming nit: don't use double
underscore naming, those are reserved for extern method-like APIs,
while you are adding internal helpers


> >> +    }
> >> +
> >> +    obj->kmod_btfs =3D calloc(1, sizeof(*obj->kmod_btfs));
> >> +    if (!obj->kmod_btfs)
> >> +            return -ENOMEM;
> >> +
> >> +    obj->kmod_btfs->names =3D calloc(kmod_btf_names_cnt, sizeof(char =
*));
> >> +    if (!obj->kmod_btfs->names) {
> >> +            err =3D -ENOMEM;
> >> +            goto err_out;
> >> +    }
> >> +
> >> +    obj->kmod_btfs->names_map =3D hashmap__new(mod_name_hash_fn,
> >> +                                             mod_name_equal_fn, NULL)=
;
> >> +    if (IS_ERR(obj->kmod_btfs->names_map)) {
> >> +            err =3D PTR_ERR(obj->kmod_btfs->names_map);
> >> +            obj->kmod_btfs->names_map =3D NULL;
> >> +            goto err_out;
> >> +    }
> >> +
> >> +    for (i =3D 0; i < kmod_btf_names_cnt; i++) {
> >> +            size_t idx =3D obj->kmod_btfs->nr_names;
> >> +
> >> +            if (!kmod_btf_names[i] || !kmod_btf_names[i][0]) {
> >> +                    pr_warn("invalid kernel module BTF name at index =
%zu\n", i);
> >> +                    err =3D -EINVAL;
> >> +                    goto err_out;
> >> +            }
> >> +
> >> +            obj->kmod_btfs->names[idx] =3D strdup(kmod_btf_names[i]);
> >> +            if (!obj->kmod_btfs->names[idx]) {
> >> +                    err =3D -ENOMEM;
> >> +                    goto err_out;
> >> +            }
> >> +
> >> +            err =3D hashmap__add(obj->kmod_btfs->names_map,
> >> +                               obj->kmod_btfs->names[idx], 0);
> >> +            if (err) {
> >> +                    zfree(&obj->kmod_btfs->names[idx]);
> >> +                    if (err =3D=3D -EEXIST) {
> >> +                            pr_warn("duplicate kmod BTF name '%s' ign=
ored\n",
> >> +                                    kmod_btf_names[i]);
> >
> > Nit: I'd downgrade this to debug level, if at all.
> >
>
> Agreed. I'll downgrade this to debug level in the next version.
>

when you copy over a list of kernel module names, sort it, and do a
pass to detect duplicates. if there are any -- just error out, specify
in the documentation that the list of kernel modules names should not
contain duplicates. It's not a particularly limiting restriction, is
it?

> >> +                            continue;
> >> +                    }
> >> +                    goto err_out;
> >> +            }
> >> +            obj->kmod_btfs->nr_names++;
> >> +    }
> >> +    return 0;
> >> +
> >> +err_out:
> >> +    bpf_object__free_kmod_btfs(obj);
> >> +    return err;
> >> +}
> >
> > ...
> >
> >> @@ -8515,6 +8645,7 @@ static struct bpf_object *bpf_object_open(const =
char *path, const void *obj_buf,
> >>      err =3D err ? : bpf_object__init_maps(obj, opts);
> >>      err =3D err ? : bpf_object_init_progs(obj, opts);
> >>      err =3D err ? : bpf_object__collect_relos(obj);
> >> +    err =3D err ? : bpf_object__init_kmod_btfs(obj, opts);
> >
> > Nit: all other options are collected before bpf_object__elf_init()
> >      call just above.
> >
>
> Agreed. I'll change it in the next version.
>
> >>      if (err)
> >>              goto out;
> >>
> >
> > ...
> >
> >> diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
> >> index b965ad571540..2f8ff6d2d3df 100644
> >> --- a/tools/lib/bpf/libbpf.h
> >> +++ b/tools/lib/bpf/libbpf.h
> >> @@ -224,10 +224,24 @@ struct bpf_object_open_opts {
> >>       * point (/sys/fs/bpf), in case this default behavior is undesira=
ble.
> >>       */
> >>      const char *bpf_token_path;
> >> +    /*
> >> +     * Optional list of kernel module names whose BTFs should be load=
ed.
> >> +     * kmod_btf_names_cnt specifies the number of entries in
> >> +     * kmod_btf_names.
> >> +     *
> >> +     * If kmod_btf_names is NULL, all module BTFs are loaded, preserv=
ing
> >> +     * the default behavior. Otherwise, only the specified module BTF=
s
> >> +     * are loaded.
> >> +     *
> >> +     * kmod_btf_names_cnt must be non-zero when kmod_btf_names is
> >> +     * non-NULL; otherwise -EINVAL is returned.
> >
> > Nit: please add a complete list of behaviors this affects, e.g. CO-RE,
> >      fentry/fexit resolution, etc.
> >
>
> I'll expand the comment to cover the affected behaviors in the next versi=
on.
>
> >> +     */
> >> +    const char **kmod_btf_names;
> >> +    size_t kmod_btf_names_cnt;
> >>
> >>      size_t :0;
> >>  };
> >> -#define bpf_object_open_opts__last_field bpf_token_path
> >> +#define bpf_object_open_opts__last_field kmod_btf_names_cnt
> >>
> >>  /**
> >>   * @brief **bpf_object__open()** creates a bpf_object by opening
>
