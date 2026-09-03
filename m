Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D534E1E1024
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 05:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413360; cv=pass; b=O3gI2JaV3bpqqAs1+ej+yD2b8Gs60gDeDVz7OUpQmNi6yeQtRGtU4xPlEjXgHRv7NjQ6MOSbAXXMWo4UsdRkAxSuAg18z8vuVyU2hmKl8PxShZqPP7fKB+p643C64g+3WbN0Lj93Oeg845raUWzB4xa2J4u8evHIqS1wTI9L1YE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413360; c=relaxed/simple;
	bh=xTw/AKqw9lQ3vl5u8L3lQjNutmW6u2P0Ksxmef5zCDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJneCPH7EYhFDPvy1UL6cfgHJOQq4b/mNAxtyxmfhpO++nw/1wD46kq4NvlaRg9MPGph1uRwsx6yI/iJzAeH7xBOl5KBrIKeP9ts0zoEoWExFp5dGMiAcQUv3My8ChTYBrOl7Z5nCaWc9oU0WhsHISLfUfVqWd25kBGgYg4DWWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/tnk8th; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/tnk8th"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4b381337e1fso1367319b6e.1
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 22:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788413358; cv=none;
        d=google.com; s=arc-20260327;
        b=WFXrh7DvDWu3UymnPsF6C1zSnEHxPZWK/Jw4siYjP5YpQ+E8Kxyx+dnlQzxn7BN4Q7
         coi/BhL1ZMjbBYknHjo/y+tDv95B2m4vgGaF8uUkerNIfpdqRUL93QnOeKdVCP4nmxta
         DdSGyz1aVlvzKFXEKXJ4Kb8aFdt1UiMeN1zYU6cD7Uh4eV+0waQx4COpZ+5EI7873U8E
         negpW2YKBUAYJ6f7DSAh2PZYzXUAdBnaV2LdxRDOxsM2XzKYwA5ACuAwWhF3HXhqocd4
         IfqNKhRX7z9HaEzRBqqmaMOLkb1w1uLSS0ePdzH4vbQzPj2SbhvaihH2lwNwwECPuB0s
         pQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eaizby62g8UPtzxLcn0sE8bIasG1h+ypC0y8Ds7psy0=;
        fh=Uz8palHaH/wFatAQKhcUN7sHZvkVBXs2ptV+T00bua8=;
        b=n6GLJhP4sYbF/KzIL48g+J5RvbTIhpOgGFG7gGnpUrcsBui+9dfea9vWZFeEL2375t
         Ejk9EJxZLnahECsDoEgFyUcEKoDk1c9005AJyLdGNhzEUrZlrUOu3YrmZHMB+N7a02dj
         gZRjNgNMlkpc7sBmzSrolHdqtt1S9LqkibJV2aFws6YNlazoXQXcdUVRZdrv79PIMD6c
         aWbkDvae17aOr7Mu3NoW8ZYSmvYuMCC8/UOPEa+lGX2j9rHs43UvYlLv3IwMfOHxtWgl
         dmyLIPeKp0ETC0irQb1SJ6fla8JYVb3AWjj1jEDMUR7FtRoFhGEInB3+g9kWNeYYsjUp
         wHNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788413358; x=1789018158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eaizby62g8UPtzxLcn0sE8bIasG1h+ypC0y8Ds7psy0=;
        b=o/tnk8thVHfmcePzQtFrZbcRfLWQXjTRIYiodu+SIM2TMudGnhsNF9V+Kq2/KIM54P
         qt3zPpE0pEZeq5Jq9qnORW/B6t9/ltHPx0ZE1K2wk2a5VwVDkhxvauPyt0OvI9sG8bvw
         UBqozdqocynp/tKLSQNqSuvSC43kHJAfr8P6i+9Sc1+/EjVBQXxxLrdaXHs76ZvGcCx/
         w82LD9p6fMKLrfNG1IyaycTVWORqU1apqkCTPdIfcVpiPdUMVTrRAiec892+1ZTfXoQi
         j/cCxv5jjx8sa1PjV8KaOEh9PGF6cmfiGcuBSJqh3dbxQIoqzat7aC+JA+XcDX/VIHBZ
         ti/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788413358; x=1789018158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eaizby62g8UPtzxLcn0sE8bIasG1h+ypC0y8Ds7psy0=;
        b=lzDmFmfL0SVuORQfVqPTbHw5/oGqZWWeZyz3KO0ysdMiKfEABJaOlYScGViIOvUVgf
         yZFb6QLOxO1cwsjIgQXedUeNnMl8OGtcx2k1KxqVv7lSLJabf6xNG6PyjiHJn44m7hvk
         yX3TPo8RiDoCVU+e1v8WL59ghCJ2WIZu14Uwz8ONY8oivRPYKoGQ9g3dkV91FKmCuOX2
         mwA/h+yKfx3J3/HB7OuiBkCn3ohrmwxVZU42keSknhCdpHzcYj0qEB81Fi8lk+dm5tTm
         HdIYTQiIz8SYWQqJbQVjDDmCCJsjT/PeEkyN5k/yfexUJqa5XjhVbafiTr9s2OwrqLr1
         b+SQ==
X-Forwarded-Encrypted: i=1; AKwUvByfKKKx+IHg+aUJbBNAjSVQv1UgGEDuTjBwDIkZ2/wlHOmgLrq5KhH5z+E9BCx8ysoGSrhIoORv0Mb5VrffRLY=@vger.kernel.org
X-Gm-Message-State: AFuF++mGq0zGMCJRt5HoC5th0L2mZmDfgGhwH7VitYdI9jxCuW3+7DQg
	gMX0s2vo5U/tODSwHOupOviC1eZ63lro01oq5r5TJyRfA2MzW8u3plXFRJWxXqUgbQO2reAdAYk
	lGQpb2vgUaBkVQIoAt3LehtOfENf6ZJI=
X-Gm-Gg: AYBFou2696fo6lc8X8WuSjXIA/KwIzsc0oqoNuKQo/ixapfyrLwEcbfcaqoa9TK+eZ3
	zslwY2TxrnkmelzQIr2ZWBn5c/6ZHvNc26PLxrMNJV2ps0TVRzgQEOBoC6iXD7ES5wqwbkfTqkT
	qv5G6OguxNCm94/mYlkwLYEI2p8vmOcY2Y8vW8ugd2CSaCyBBVlzwq09WsOu8oWqFRyrtzdx8fe
	4Y8pDkgsUySJKPzlwwzABzU1HOJxWpHhqhudw04epF+i+2OtRHdj5FX9ykmtNGMXO37K3k+qvcr
	YYf1RzhZe/PCavsgxrYM92ENuXIP2owucFdoKU8yb5ZjrIbA08/S+EBbf1vr7goLsjm39t0AuLU
	4XsycV/uRcA==
X-Received: by 2002:a05:6808:c1e3:b0:4b3:3e1:4a25 with SMTP id
 5614622812f47-4b6beb4a5c1mr9010080b6e.11.1788413357610; Wed, 02 Sep 2026
 22:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901141954.29449-1-suchitkarunakaran@gmail.com> <CAEf4Bza6wQb1mSiKA_6U7FovYivcZvf3MCvU9NMdt01w-wAZPQ@mail.gmail.com>
In-Reply-To: <CAEf4Bza6wQb1mSiKA_6U7FovYivcZvf3MCvU9NMdt01w-wAZPQ@mail.gmail.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Thu, 3 Sep 2026 10:59:06 +0530
X-Gm-Features: AcwNN1Vj42vaxl6KZiy5Wu478IV--ErhxAsq2YiX6zyNT3u27g3E8SGExrefwB4
Message-ID: <CAO9wTFiA6BHbTtP8Y8GCNnEQqXgsOzecuibK3zsjBKfyN8Nfkw@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: Fix map_lookup_percpu_elem on sparse CPU IDs
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	memxor@gmail.com, shuah@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, jolsa@kernel.org, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, zhoufeng.zf@bytedance.com, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Sept 2026 at 06:02, Andrii Nakryiko <andrii.nakryiko@gmail.com> w=
rote:
>
> On Tue, Sep 1, 2026 at 7:20=E2=80=AFAM Suchit Karunakaran
> <suchitkarunakaran@gmail.com> wrote:
> >
> > libbpf_num_possible_cpus() returns the number of possible CPUs, which i=
s
> > appropriate for sizing packed per-CPU map value buffers. It is not the
> > upper bound for logical CPU IDs.
> >
> > For a possible CPU mask such as 0,2-3, the test loops over CPU IDs 0
> > through 2. This incorrectly visits CPU 1 and misses CPU 3. It also
> > initializes packed per-CPU slots using their slot indexes rather than
> > the corresponding logical CPU IDs.
> >
> > Parse the possible CPU mask and keep the packed slot count separate
> > from the logical CPU ID range. Populate each dense per-CPU slot with
> > its logical CPU ID, calculate the corresponding expected sum, and make
> > the BPF program iterate over the full CPU ID range.
> >
>
> Is this the issue you ran into in practice or it's just another of
> those found by AI reading code?
>
>
> > Fixes: 7aa424e02a04bba5ecc84afe9b58b16e9e0b34f8 ("selftests/bpf: Fix so=
me bugs in map_lookup_percpu_elem testcase")
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >  .../bpf/prog_tests/map_lookup_percpu_elem.c   | 34 ++++++++++++++-----
> >  .../bpf/progs/test_map_lookup_percpu_elem.c   |  8 ++---
> >  2 files changed, 30 insertions(+), 12 deletions(-)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_e=
lem.c b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > index bfb1bf3fd427..849f33259c00 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > @@ -2,29 +2,45 @@
> >  /* Copyright (c) 2022 Bytedance */
> >
> >  #include <test_progs.h>
> > +#include "bpf/libbpf_internal.h"
> >  #include "test_map_lookup_percpu_elem.skel.h"
> >
> >  void test_map_lookup_percpu_elem(void)
> >  {
> >         struct test_map_lookup_percpu_elem *skel;
> > -       __u64 key =3D 0, sum;
> > -       int ret, i, nr_cpus =3D libbpf_num_possible_cpus();
> > +       bool *possible =3D NULL;
> > +       __u64 key =3D 0, sum =3D 0;
> > +       int cpu, nr_cpu_ids, nr_cpus, ret, slot =3D 0;
> >         __u64 *buf;
> >
> > -       buf =3D malloc(nr_cpus*sizeof(__u64));
> > -       if (!ASSERT_OK_PTR(buf, "malloc"))
> > +       ret =3D parse_cpu_mask_file("/sys/devices/system/cpu/possible",=
 &possible,
> > +                                 &nr_cpu_ids);
> > +       if (!ASSERT_OK(ret, "parse possible CPU mask"))
> >                 return;
> >
> > -       for (i =3D 0; i < nr_cpus; i++)
> > -               buf[i] =3D i;
> > -       sum =3D (nr_cpus - 1) * nr_cpus / 2;
> > +       nr_cpus =3D libbpf_num_possible_cpus();
> > +       if (!ASSERT_GT(nr_cpus, 0, "libbpf_num_possible_cpus"))
> > +               goto free_mask;
> > +
> > +       buf =3D malloc(nr_cpus * sizeof(*buf));
> > +       if (!ASSERT_OK_PTR(buf, "malloc"))
> > +               goto free_mask;
> > +
> > +       for (cpu =3D 0; cpu < nr_cpu_ids; cpu++) {
> > +               if (!possible[cpu])
> > +                       continue;
> > +               buf[slot++] =3D cpu;
> > +               sum +=3D cpu;
> > +       }
> > +       if (!ASSERT_EQ(slot, nr_cpus, "possible CPU mask weight"))
> > +               goto exit;
> >
> >         skel =3D test_map_lookup_percpu_elem__open();
> >         if (!ASSERT_OK_PTR(skel, "test_map_lookup_percpu_elem__open"))
> >                 goto exit;
> >
> >         skel->rodata->my_pid =3D getpid();
> > -       skel->rodata->nr_cpus =3D nr_cpus;
> > +       skel->rodata->nr_cpu_ids =3D nr_cpu_ids;
> >
> >         ret =3D test_map_lookup_percpu_elem__load(skel);
> >         if (!ASSERT_OK(ret, "test_map_lookup_percpu_elem__load"))
> > @@ -55,4 +71,6 @@ void test_map_lookup_percpu_elem(void)
> >         test_map_lookup_percpu_elem__destroy(skel);
> >  exit:
> >         free(buf);
> > +free_mask:
> > +       free(possible);
> >  }
> > diff --git a/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_e=
lem.c b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> > index ca827b1092da..d8da0696b97c 100644
> > --- a/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> > +++ b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> > @@ -7,7 +7,7 @@
> >  __u64 percpu_array_elem_sum =3D 0;
> >  __u64 percpu_hash_elem_sum =3D 0;
> >  __u64 percpu_lru_hash_elem_sum =3D 0;
> > -const volatile int nr_cpus;
> > +const volatile int nr_cpu_ids;
> >  const volatile int my_pid;
> >
> >  struct {
> > @@ -57,17 +57,17 @@ int sysenter_getuid(const void *ctx)
> >
> >         map_ctx.map =3D &percpu_array_map;
> >         map_ctx.sum =3D 0;
> > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
> >         percpu_array_elem_sum =3D map_ctx.sum;
> >
> >         map_ctx.map =3D &percpu_hash_map;
> >         map_ctx.sum =3D 0;
> > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
> >         percpu_hash_elem_sum =3D map_ctx.sum;
> >
> >         map_ctx.map =3D &percpu_lru_hash_map;
> >         map_ctx.sum =3D 0;
> > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
> >         percpu_lru_hash_elem_sum =3D map_ctx.sum;
> >
> >         return 0;
> > --
> > 2.55.0
> >

Hi Andrii, I did use AI to find this. I often go through recent
commits and then ask AI to check whether the related selftests have
been updated and that's how I found this.
