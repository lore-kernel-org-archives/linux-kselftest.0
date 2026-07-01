Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0919E3D7D80
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 19:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934351; cv=pass; b=GXFtVPeaD13gObFL0tFytsMBU8vSDJkp0kmE8ak3eh5aqrf+CYJB5iGBP7oTeTAQomhvvRysQnZUbc1w5s4sK/QzEG1m5yXTVA27evgH3fVsnTV3kH+J1NFTnjHObo6i9k88+teA8lekCAxK0HU9PBPiF1L7x21uOTlZTDNrtVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934351; c=relaxed/simple;
	bh=EyLLaXb9YvmlFZo/5AJiUAadFkjuIh2boXQbjRWgni8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gm+ByOcONuzbGCml6HpdKcia4kDwxD8GRE74UMTb9+/U4LZJ0teC/0pIaVynufc8qfBwPQlh27NMELk6OqfRgARD7p0sz5PTQuSH3AhDmnuy2yOpTpINLcHFmoDrq9qT1R18ZC4R+0zh2SO27v1qUhMdTuYjHhzGSRLqfVRCOus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/7SFpmb; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/7SFpmb"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so834680a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 12:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782934349; cv=none;
        d=google.com; s=arc-20260327;
        b=l28NdjwPHHJ7CAOY7JtVeQRCql9V5ds0+Rs4fYy6CAYsoLSYrbcL0KMSKN+ZSR/47c
         Lws3mesp4z8nettSutnASefUK9GlixC0ExjVAqU4qUC/NzwXRytKpRD/Ew3o6K7PRi0G
         SBmx6334kjiUvg/gb9KcyKxgxFLdpfKF7sngmU2EAmLG8E2oIuJWu2L+cULnF4glhKJ1
         1Nh7tNQgOGo1zmqodVhEmxpPaR7Kf/EQ/jwVh+TvkTZl0Gp6oGC8lziGHQ34MuaSyvrX
         ZD0aCGVjlbdn7pvHKgYjElhOfeyE4NZJCXriFzS0oT1eSDDdg+/xzgIq2EUC/YfO+eRX
         dBpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JzvANgXQEq0OEJ8TDGIUnErwic4f3K/wVGZYeMokZaM=;
        fh=3wxpIjUpugv7AaFA2xZjrcjP0YcywZNerb8fsXTOMtQ=;
        b=kvIFYrtW5iF6hx3D5Jiti5eftusKnPvXED2DLtwGqiPzpXnDg+oQ6op0K8Dywb/2eA
         Fa5eoDttHLzFXwI2w05Jf32pLzDnV//7l+IeOvTszYoV8Ykf3VcteEx4yI46hyWng5nu
         0y8085Jj4d5ycx0UVPIgYmRoDADr44iLxGPvt5Q4SM4OUxaCPSXlGb4N0lKFVnTePME+
         dTRzVGNvr4aWlUVSQrgvlsnOswbPV8frDj6e2wcPLG/ArFmQHGzush5v9CeyEWEZQe5i
         g02P8K0yIlbaBXEhuDebZ+0Z0UwafMTHlt4Jmja1p6PmJIgLoLp/F6gWYOptAoqytoRJ
         UnFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782934349; x=1783539149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzvANgXQEq0OEJ8TDGIUnErwic4f3K/wVGZYeMokZaM=;
        b=s/7SFpmbrEGmh7TLp0elBuBqXpQmHetQcLdK+hmDYYUeeCouDGE6mL2nxWVcm8tgpP
         ClcD2bLhlK8ciRbgLSyG8lvRK1ZwQYre3Bbf/wnA/EOb0yQeeAQGaXnYIl26Jk08AU2O
         plKfV2MBh8RAp9CknPrZ1KwromQ2LJ4cy4ftlxuPqYAakvizbrQzEPRlhiqBeG8qu6Ag
         G0TvrP4JBFCOc5hoKfC+b5kVdXJY6QQHXDwTuPgxrZlVjhVt5U+INNqHQgTXXZWr5aDT
         GNmPtdkqkJRp4qr/DoLiHXiaYE4wbrdJunQ7AksNY2shp37KTr0XKgsBv4WTD+u4zVc9
         rJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934349; x=1783539149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JzvANgXQEq0OEJ8TDGIUnErwic4f3K/wVGZYeMokZaM=;
        b=SwHRwE5kctOU4zaIcb5cvAsQAgM38IMAM4FCtTLBqxLGaf6cMX5MGsOgBWU5/EKDhK
         uAkUjU4dEPrW2sjo3WKGu+RlufnpbfwWCVW4zqV+VUfFFXRQmCTQSRiAnu0YCLsHasPR
         PDO+FVLKhhRwPk/faLLxzdzkPDg160VBhZPDHhk1IS+fXjI6ChwbIaPq3aQkQVIXVzhX
         wnGgxVNli5VFOFX37RYzwZKgs0WoQjUbCHAxSjYtZ0JH1PSDgrwiSA8icczllymYfxjx
         sHEpqg3/b25HzMimYGpjCpijYOqLZ1+NzuNiyfnbIjyNJbj7jGjmeNKLpbzCmfaVmxfK
         Xf6A==
X-Forwarded-Encrypted: i=1; AHgh+RrgTpGYxFGWCGyxE9jC9AQ3oxEp8NT4s/IrJqCu0l33Jun05kB9FTuYx3/4ogPFhIL3qDmgd8wbjirdvQxM94o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkl4q3jPOwAyDS1VueMZcm9Y9OZ+aijZ/95wvh11SahaBqwSvt
	XzAI7TS4O0Giu6K3S1AiVKrJp8QeYhSofXanKVSPflKnzPjTS0slHTHSqTP0xWUis92xsl9LDlt
	FI3hcNGRSoI1NMyHAKXtceJQNeazBjYI=
X-Gm-Gg: AfdE7ck4KwfMN/vQ03uzsGe9SzOm4sqz3VhIfaVbYM2DXKWsA0nTdBbh44gchyYLnWR
	+ooim59F/VrkHzS8MMjuZ4rilRWUxmTyfGWlmbB6qX+py4MveYrz1mzcQ2JaS2SVF8qtzcUD14l
	fEDosXPF0tWcEo5gI951RD3EtHWlxHG1L41MkFRXm3emyCTxABb294Atncqi6GdKpNDi8g2q8kD
	89/ueiZsBYRindt96XbmOaImFdF8DsS0IGLrwO5kyj9CXFlJkthTN4zW6DGXowAsIuxgqxkaK1P
	rpfcxAjdcsMUKUdOJXgfQsBaqd8mLiyDtVT06u677FAeJgCgLfTenA==
X-Received: by 2002:a17:90b:570c:b0:37f:c683:e643 with SMTP id
 98e67ed59e1d1-380aa1d4cbbmr2678626a91.24.1782934349278; Wed, 01 Jul 2026
 12:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629152406.52582-1-leon.hwang@linux.dev> <20260629152406.52582-6-leon.hwang@linux.dev>
 <a4e4adfe-4b2e-49c4-a708-89276514f930@kernel.org>
In-Reply-To: <a4e4adfe-4b2e-49c4-a708-89276514f930@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 1 Jul 2026 12:32:17 -0700
X-Gm-Features: AVVi8Cf26mExkF685IWBbEX3UhJ6IsWEmNK3NaBgDEocbc3NJEfCJeRdHdqrSLQ
Message-ID: <CAEf4BzbfA2nySpf3Oh6KVBRjDKMOOYN-NC279Sj73KwH32cGGg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v8 5/9] bpftool: Generate skeleton for global
 percpu data
To: Quentin Monnet <qmo@kernel.org>
Cc: Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 9:49=E2=80=AFAM Quentin Monnet <qmo@kernel.org> wrot=
e:
>
> 2026-06-29 23:24 UTC+0800 ~ Leon Hwang <leon.hwang@linux.dev>
> > Enhance bpftool to generate skeletons that properly handle global percp=
u
> > variables. The generated skeleton now includes a dedicated structure fo=
r
> > percpu data, allowing users to initialize and access percpu variables m=
ore
> > efficiently.
> >
> > For global percpu variables, the skeleton now includes a nested
> > structure, e.g.:
> >
> > struct test_global_percpu_data {
> >       struct bpf_object_skeleton *skeleton;
> >       struct bpf_object *obj;
> >       struct {
> >               struct bpf_map *percpu;
> >       } maps;
> >       // ...
> >       struct test_global_percpu_data__percpu {
> >               int data;
> >               char run;
> >               struct {
> >                       char set;
> >                       int i;
> >                       int nums[7];
> >               } struct_data;
> >               int nums[7];
> >       } *percpu;
> >
> >       // ...
> > };
> >
> >   * The "struct test_global_percpu_data__percpu *percpu" points to
> >     initialized data, which is actually "maps.percpu->mmaped".
> >   * Before loading the skeleton, updating the
> >     "struct test_global_percpu_data__percpu *percpu" modifies the initi=
al
> >     value of the corresponding global percpu variables.
> >   * After loading the skeleton, "maps.percpu->mmaped" has been marked a=
s
> >     read-only in libbpf. If users want to update the global percpu
> >     variables, they have to update the "maps.percpu" map instead.
> >   * For lightweight skeleton, "lskel->percpu" will be protected by
> >     "mprotect(p, sz, PROT_READ)".
> >   * For subskeleton, those variables of global percpu data will be
> >     skipped.
> >
> > Assisted-by: Codex:gpt-5.5-xhigh
> > Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> > ---
> >  tools/bpf/bpftool/gen.c       | 49 +++++++++++++++++++++++++++++++----
> >  tools/lib/bpf/skel_internal.h | 24 +++++++++++++++--
> >  2 files changed, 66 insertions(+), 7 deletions(-)
> >
> > diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
> > index 6ae7262ebe0c..2e60296358db 100644
> > --- a/tools/bpf/bpftool/gen.c
> > +++ b/tools/bpf/bpftool/gen.c
> > @@ -92,7 +92,7 @@ static void get_header_guard(char *guard, const char =
*obj_name, const char *suff
> >
> >  static bool get_map_ident(const struct bpf_map *map, char *buf, size_t=
 buf_sz)
> >  {
> > -     static const char *sfxs[] =3D { ".data", ".rodata", ".bss", ".kco=
nfig" };
> > +     static const char *sfxs[] =3D { ".data", ".rodata", ".bss", ".per=
cpu", ".kconfig" };
> >       const char *name =3D bpf_map__name(map);
> >       int i, n;
> >
> > @@ -117,7 +117,7 @@ static bool get_map_ident(const struct bpf_map *map=
, char *buf, size_t buf_sz)
> >
> >  static bool get_datasec_ident(const char *sec_name, char *buf, size_t =
buf_sz)
> >  {
> > -     static const char *pfxs[] =3D { ".data", ".rodata", ".bss", ".kco=
nfig" };
> > +     static const char *pfxs[] =3D { ".data", ".rodata", ".bss", ".per=
cpu", ".kconfig" };
> >       int i, n;
> >
> >       /* recognize hard coded LLVM section name */
> > @@ -254,6 +254,20 @@ static const struct btf_type *find_type_for_map(st=
ruct btf *btf, const char *map
> >       return NULL;
> >  }
> >
> > +static bool bpf_map_is_skel_data(const struct bpf_map *map)
> > +{
> > +     if (!bpf_map__is_internal(map))
> > +             return false;
> > +
> > +     if (bpf_map__map_flags(map) & BPF_F_MMAPABLE)
> > +             return true;
> > +
> > +     if (bpf_map__type(map) =3D=3D BPF_MAP_TYPE_PERCPU_ARRAY)
> > +             return true;
> > +
> > +     return false;
> > +}
> > +
> >  static bool is_mmapable_map(const struct bpf_map *map, char *buf, size=
_t sz)
> >  {
> >       size_t tmp_sz;
> > @@ -263,7 +277,7 @@ static bool is_mmapable_map(const struct bpf_map *m=
ap, char *buf, size_t sz)
> >               return true;
> >       }
> >
> > -     if (!bpf_map__is_internal(map) || !(bpf_map__map_flags(map) & BPF=
_F_MMAPABLE))
> > +     if (!bpf_map_is_skel_data(map))
> >               return false;
> >
> >       if (!get_map_ident(map, buf, sz))
>
>
> Thanks! The bpftool patch looks good, with one reservation: after this
> patch, I believe "is_mmapable_map(map, ...)" will return true if map is
> a percpu map, although percpu maps aren't mmap-able, so we should
> probably update the name of that function to avoid any confusion?
>

Great observation, Quentin!

bpf_map_is_skel_data() I think was supposed to be exactly that generic
name. But it seems like Leon went half-way through with unification.
Unless there are some subtle situations where per-cpu array shouldn't
be handled where is_mmapable_map() is handled, we should rename
is_mmapable_map() and add BPF_MAP_TYPE_PERCPU_ARRAY check (assuming
it's internal map, of course) there.

Leon, can you please check?

pw-bot: cr


> Quentin
