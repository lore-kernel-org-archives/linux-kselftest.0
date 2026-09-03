Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D557376468
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451321; cv=pass; b=bwESUOVxCG3irGhk64/Ur3Znx+AXWMFStuIVpP+Dwk71boo1tHN561C0F83fHs/Kp6o9TU/G7UiFPn3fXS/BNKaSr07bSZ3RSDvzVJWAEQBhKOmPfl84i2Ud92i3jbcuNk9pyzwWA5zITAp/Cf+ffXlwF96//VjL/VEIPcnLI+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451321; c=relaxed/simple;
	bh=UQJOARb0hjrrxZqoI8tPjCF4BNxBhRids7cJ/ZQHpwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YncCA3kb+qd5YVUeyc9vZwLXHNA5jMWlbPiEPVZ/xeNenQKBF0a84zPNPt8zuTgqee9d1zaDLEjONhP9TRJInT37LPM8VcNiPj8/2tgolZ62FOlw7y/V1OWkSPdcoUaw8bD3eqdeLAPUYWnnzZLixvRActcPgz51MhyDak1+ak0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcKO8RvH; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcKO8RvH"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2336748a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 09:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788451318; cv=none;
        d=google.com; s=arc-20260327;
        b=orByuDlWQd6mOXdRk0H9ewnlHngzLg+6qLDlZiaSXQj5rz2TfHPN/8wz2ROsmcb8GH
         rdVkaIFSmhdDrITbwiU8UmgW715yqJ45OEPZCw4Iy3b4CKZrPZ+6imQUYYVh2kbvFTSk
         Jk9SMAI33EgX6+SXkB0GI488n0JEtq/+XTqRPM1oNnKqFDVrkScAn3SjARCE3usevbqH
         ULPDNeQY6VkHHKoDBVn4u76eaD9LBRTvsNDDgqIbEzyQZGejxteo4Tj4WhEPO+FaFA2a
         zt7kefEhXxJgqz+zQOlVLAIkd1FRvfqMF74gb36+DSABVLTHLvphaoemEjBMgogzC7tf
         AAtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ym1m2s7k69osu4j9IQLOfbeC7FHjlBRmEp9KBHwH/xs=;
        fh=xDhtC1tjvX3OBySfkXRK93o/iGCDpeqcOWcIkQkh7aE=;
        b=QuHYyDfrzi7shyWEAmf0JvMsCnIPLyEe9qs40U59OvE+LSJ11TuoNOvb5252Z5eqrI
         v0nlblIVWMlCCJk1RQu0XJoZyx3FUgU/NY9aToq0dtZfnJssvJrJ18GudRqTbGLdsZ+A
         7YM5GtCJrd0y91J/h86Rg4glIOUgvqQYm+ophFpVNY0RDx3E+NgP8/4cI6PcvojAliTV
         HyZzdldQES/P/w2I1JspvwrtZGDryLTZoXcaYSn8BBPFl4BCK0sUinJBzYApcw+8G67W
         UGjNRLZbD/sEnkfPwBQxQT6ehxPkYMF2iaiZL3AaYMB4hYGn1jehxPNE6jvJv7UzbIp6
         ucUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451318; x=1789056118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ym1m2s7k69osu4j9IQLOfbeC7FHjlBRmEp9KBHwH/xs=;
        b=QcKO8RvHQGNSBO4XH9NFw14lgD5LLJ9cqH9uZVbdQAsFQmxaI/jCa2U6TmEXrQ17CH
         CzwapOwJkhuwTuM1M3K919HKi+hI2Ji4SjnvUlvnWN3bdanuxVwxMvhPnkkpIFgevkGI
         OxUTMsbBAmM/CkpIFI8A04zMLq6z9VJkUdsq+hCG8V6eHJmwV1zCD3+7atNWI+1SjZgo
         aFTWsavhDTZUXTfUlPNjyFTQ2QXOZ9HYWX30BbfNTgg9mErIw935Sl2ly1aK2DvZKDqv
         8AZe2a7u5J370QeeYwuKLc5YGL71pfeflZtGW76PudJYZdG1vM7ZWOpcSNpDwxip67+W
         hXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451318; x=1789056118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ym1m2s7k69osu4j9IQLOfbeC7FHjlBRmEp9KBHwH/xs=;
        b=DXyKg4HVXy7A8+0wgCVlqnnVYZ0XdpJKhbd6Vllh5LTGGXz3KIvLZ0NL2g8gUG4rhX
         SZirXm5Qy/eIJQCp1v30ZU9vU50S5kuMI+7dnju4FlgbcXpMmASKVQfuZ4TILbkR8TGy
         oh6yWp3IuYQH9C2NpB0NkKysjSdOd4NN3lfji5TbYKKSDCGPWED+38VljMi3G5UclolM
         yi8B5IlN8I6LWPEAyCZPEmGxh5D++QpQnlBBsHTZG9N683FIOziSjsBBAzqxb5nIXtuW
         Fk1wTikSK/eGi1o4+A4neVB+FR/Q/6kpKJhXxLP1no5N31EhdN/TrbATNo+FkU2IJU1S
         NG1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwzyieijrBXkqPrNSMf8/mP0LVjLkkBXQkJ092aWp6EQQZmD7ZcOTaYjIm1AeW5nLwiDbx+7i8sp+hgiPnGVc4=@vger.kernel.org
X-Gm-Message-State: AFuF++mb4gpz5jPJ4y1UFilDbwgb+LOGUCNIZgXmjRHigVHy/3wfc3uC
	Wt8GXi4c2G7u17kQsFIArhtha5ikmZo1tEimxQrnA0X9eRQQDuSewI9RaH2qr5H09+BW55dmEPZ
	Li1lH2FDvW/BRrhIupjpI+YLUbZBwuqE=
X-Gm-Gg: AYBFou2sPZLZPWr4sFbP1n5J+6gfmmp+6xq3HkaV1JbpX9QcPoYgkJkDMUw+xYpYVe6
	ZdaAsq9UvpunFrHvHsFOog/XWByJpZxbpIQPAeD8Q5WXiDHlHa4SjU+Vza37pa/kigyHDmZxY7e
	yna4gddDLCHHMC+1U09tqJNPc5g1sSGx6pyIB850AUO7H+GWmtbxDqwKS24Vlhoh/qSBfSKL8Jv
	nSxwhVcwgI4Lra8YxQkr0brj1seCSgVzopVEKA/ZN8H628NCJfyC/bmPra4zEps93hNiarBkfkU
	YRRDlrrGxsLzRAcI3+UZLSKhZ2aA/fwsH+2ayCJ8iFFkbGv5xBj8OPRXcebb7Hwp0BOyipWxwvo
	acIIlvL80NPshBvJUbr5M5Zs5wX9PI6G3r4V3PfEGSg==
X-Received: by 2002:a17:90b:2ec8:b0:398:9bd1:3216 with SMTP id
 98e67ed59e1d1-39b22fd5e8amr936066a91.23.1788451316207; Thu, 03 Sep 2026
 09:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901141954.29449-1-suchitkarunakaran@gmail.com>
 <CAEf4Bza6wQb1mSiKA_6U7FovYivcZvf3MCvU9NMdt01w-wAZPQ@mail.gmail.com> <CAO9wTFiA6BHbTtP8Y8GCNnEQqXgsOzecuibK3zsjBKfyN8Nfkw@mail.gmail.com>
In-Reply-To: <CAO9wTFiA6BHbTtP8Y8GCNnEQqXgsOzecuibK3zsjBKfyN8Nfkw@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 3 Sep 2026 09:01:41 -0700
X-Gm-Features: AcwNN1X-YqQqjC61b-JrUTGMCYd0EnTSl9FqXJbSPoltToJP7INN2w4pWDyVNgo
Message-ID: <CAEf4BzYUREsJYXw7ZU9twCDcfEJ6cTpR4Ypbvf5JTABK0uGi2g@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: Fix map_lookup_percpu_elem on sparse CPU IDs
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	memxor@gmail.com, shuah@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, jolsa@kernel.org, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, zhoufeng.zf@bytedance.com, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:29=E2=80=AFPM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> On Thu, 3 Sept 2026 at 06:02, Andrii Nakryiko <andrii.nakryiko@gmail.com>=
 wrote:
> >
> > On Tue, Sep 1, 2026 at 7:20=E2=80=AFAM Suchit Karunakaran
> > <suchitkarunakaran@gmail.com> wrote:
> > >
> > > libbpf_num_possible_cpus() returns the number of possible CPUs, which=
 is
> > > appropriate for sizing packed per-CPU map value buffers. It is not th=
e
> > > upper bound for logical CPU IDs.
> > >
> > > For a possible CPU mask such as 0,2-3, the test loops over CPU IDs 0
> > > through 2. This incorrectly visits CPU 1 and misses CPU 3. It also
> > > initializes packed per-CPU slots using their slot indexes rather than
> > > the corresponding logical CPU IDs.
> > >
> > > Parse the possible CPU mask and keep the packed slot count separate
> > > from the logical CPU ID range. Populate each dense per-CPU slot with
> > > its logical CPU ID, calculate the corresponding expected sum, and mak=
e
> > > the BPF program iterate over the full CPU ID range.
> > >
> >
> > Is this the issue you ran into in practice or it's just another of
> > those found by AI reading code?
> >
> >
> > > Fixes: 7aa424e02a04bba5ecc84afe9b58b16e9e0b34f8 ("selftests/bpf: Fix =
some bugs in map_lookup_percpu_elem testcase")
> > >
> > > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > > ---
> > >  .../bpf/prog_tests/map_lookup_percpu_elem.c   | 34 ++++++++++++++---=
--
> > >  .../bpf/progs/test_map_lookup_percpu_elem.c   |  8 ++---
> > >  2 files changed, 30 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu=
_elem.c b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > > index bfb1bf3fd427..849f33259c00 100644
> > > --- a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > > +++ b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > > @@ -2,29 +2,45 @@
> > >  /* Copyright (c) 2022 Bytedance */
> > >
> > >  #include <test_progs.h>
> > > +#include "bpf/libbpf_internal.h"
> > >  #include "test_map_lookup_percpu_elem.skel.h"
> > >
> > >  void test_map_lookup_percpu_elem(void)
> > >  {
> > >         struct test_map_lookup_percpu_elem *skel;
> > > -       __u64 key =3D 0, sum;
> > > -       int ret, i, nr_cpus =3D libbpf_num_possible_cpus();
> > > +       bool *possible =3D NULL;
> > > +       __u64 key =3D 0, sum =3D 0;
> > > +       int cpu, nr_cpu_ids, nr_cpus, ret, slot =3D 0;
> > >         __u64 *buf;
> > >
> > > -       buf =3D malloc(nr_cpus*sizeof(__u64));
> > > -       if (!ASSERT_OK_PTR(buf, "malloc"))
> > > +       ret =3D parse_cpu_mask_file("/sys/devices/system/cpu/possible=
", &possible,
> > > +                                 &nr_cpu_ids);
> > > +       if (!ASSERT_OK(ret, "parse possible CPU mask"))
> > >                 return;
> > >
> > > -       for (i =3D 0; i < nr_cpus; i++)
> > > -               buf[i] =3D i;
> > > -       sum =3D (nr_cpus - 1) * nr_cpus / 2;
> > > +       nr_cpus =3D libbpf_num_possible_cpus();
> > > +       if (!ASSERT_GT(nr_cpus, 0, "libbpf_num_possible_cpus"))
> > > +               goto free_mask;
> > > +
> > > +       buf =3D malloc(nr_cpus * sizeof(*buf));
> > > +       if (!ASSERT_OK_PTR(buf, "malloc"))
> > > +               goto free_mask;
> > > +
> > > +       for (cpu =3D 0; cpu < nr_cpu_ids; cpu++) {
> > > +               if (!possible[cpu])
> > > +                       continue;
> > > +               buf[slot++] =3D cpu;
> > > +               sum +=3D cpu;
> > > +       }
> > > +       if (!ASSERT_EQ(slot, nr_cpus, "possible CPU mask weight"))
> > > +               goto exit;
> > >
> > >         skel =3D test_map_lookup_percpu_elem__open();
> > >         if (!ASSERT_OK_PTR(skel, "test_map_lookup_percpu_elem__open")=
)
> > >                 goto exit;
> > >
> > >         skel->rodata->my_pid =3D getpid();
> > > -       skel->rodata->nr_cpus =3D nr_cpus;
> > > +       skel->rodata->nr_cpu_ids =3D nr_cpu_ids;
> > >
> > >         ret =3D test_map_lookup_percpu_elem__load(skel);
> > >         if (!ASSERT_OK(ret, "test_map_lookup_percpu_elem__load"))
> > > @@ -55,4 +71,6 @@ void test_map_lookup_percpu_elem(void)
> > >         test_map_lookup_percpu_elem__destroy(skel);
> > >  exit:
> > >         free(buf);
> > > +free_mask:
> > > +       free(possible);
> > >  }
> > > diff --git a/tools/testing/selftests/bpf/progs/test_map_lookup_percpu=
_elem.c b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> > > index ca827b1092da..d8da0696b97c 100644
> > > --- a/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> > > +++ b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> > > @@ -7,7 +7,7 @@
> > >  __u64 percpu_array_elem_sum =3D 0;
> > >  __u64 percpu_hash_elem_sum =3D 0;
> > >  __u64 percpu_lru_hash_elem_sum =3D 0;
> > > -const volatile int nr_cpus;
> > > +const volatile int nr_cpu_ids;
> > >  const volatile int my_pid;
> > >
> > >  struct {
> > > @@ -57,17 +57,17 @@ int sysenter_getuid(const void *ctx)
> > >
> > >         map_ctx.map =3D &percpu_array_map;
> > >         map_ctx.sum =3D 0;
> > > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
> > >         percpu_array_elem_sum =3D map_ctx.sum;
> > >
> > >         map_ctx.map =3D &percpu_hash_map;
> > >         map_ctx.sum =3D 0;
> > > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
> > >         percpu_hash_elem_sum =3D map_ctx.sum;
> > >
> > >         map_ctx.map =3D &percpu_lru_hash_map;
> > >         map_ctx.sum =3D 0;
> > > -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> > > +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
> > >         percpu_lru_hash_elem_sum =3D map_ctx.sum;
> > >
> > >         return 0;
> > > --
> > > 2.55.0
> > >
>
> Hi Andrii, I did use AI to find this. I often go through recent
> commits and then ask AI to check whether the related selftests have
> been updated and that's how I found this.

in that case I'm inclined to leave selftest as is. This set up where
possible cpu mask is not contiguous seems to be some fancy qemu-based
setups so far, and frankly a bunch of other code is probably broken in
such situations anyways. let's keep things as is for now

pw-bot: cr
