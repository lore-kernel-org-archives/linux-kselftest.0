Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769D64CCDD6
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 00:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788395548; cv=pass; b=PQda/neLtd0ZJfaebJMVeN/wmWCO+Q3qmmkBH/8ol9MNEJP13xjM26h7ttOgVCjDmeYRtZDxKYcPOPsKZNFAELFUqzWg3MUaDY0S54M4gviqPIPlhECU6qp+uipxCqvolGfN26UY0GIfNu48oCTef3VVbQNugGULVryUQW/hDqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788395548; c=relaxed/simple;
	bh=2jLCVEyTOu7enORfoyn4qAX/H9CGdtQm8tczTeRJKOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irVZahnD+GwjIy/DG6NOz1TkIVQe3Z3CWILeZrqxQLUktnzmV/CVu4tGV9SFRNOsnhCpzX1BKuUX50d1XyWh4386XPdEHYp6fZkLPMzHFlAHkVDAVhXQawug6OM1CF8Do8IWk5f/B91zVtzmaYUYMiU+TYpQS+OdzIYbgnrObt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMCQJgx1; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMCQJgx1"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8556ec44e9aso1685966b3a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 17:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788395545; cv=none;
        d=google.com; s=arc-20260327;
        b=Yk+dyK7ktYH3HwxVdVZ7BO+RuA/75qDSrh6KT7QPNq6w3XYUz0Zu7AejL1ME+iFCmH
         Hsvu4aJ4GBW3u+KsjlI4TBzN2tUPuy35WoZ8SuFhOa/pzSnsExmUjPUaCNCse2XTv+0P
         n8T4mIghUl0i4NLwVILAmqaDeChqHBkpypGEUQFBYC3C8cKsfeFgQ6gzxYPdJn4AXB6q
         lpcpl+JVTMi5So8SSnGrWbMZ2H4u1NqTeul44cnMq8WLpC2K3k2VV7y2dhvD1iFQEFYJ
         HW+xyHaJM+i1S6eqwEargaWbj8AJ2JTCpO7CT+O2eM0ZBg8HVTLcYhYZ+wzGeagZFZJt
         1mmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eFIFDsWKdpgTfW3uc7xRObLB/Ddh6TG5x2Js0xrqLKc=;
        fh=LxrGM1yoiXHd/xH+XFsryRB2ce8E1AsfuEfEDObkIWw=;
        b=omQmvAJeHg8AmgzHALQttv+pHMS+3geHpS5T/E2xLzNfAREjq0X4n0g+fMXZ35FaPd
         vLTZ+bI5NyofMHm0tjrcIkZ0M8UBqp80DSlhQhqj/RymOH3KTJiR69F8EFf1Ojna09M3
         HrRSjMu1UcP4byVpEQz69eEqZbVw8rhcMaudNcsI5qPn8zgTFePbQ581UDGkCK8t9Xd7
         +AEQb+lOwAUnBuXfmW27XCyvjdINyDDIh5/vELOEj7OjXIMROQuts0ZeAolf/s5340lI
         qPLPMbTBiGu1TDZIMEB2K8wIdTAD5n9s52mZKjRKS73q/m8hw6eq7TcBJTDUVYI26qDi
         Hg2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788395545; x=1789000345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eFIFDsWKdpgTfW3uc7xRObLB/Ddh6TG5x2Js0xrqLKc=;
        b=sMCQJgx1l4gSE9dPZflOsfqlck1C6c1I/hii8qjvwjwvyn4XQiUOQH8RJPRp3uGTSM
         w1Qg4OC7vb79a0tdwOBOZSVFLn4OVTLAE/1l0/RKGC9KMHmqGaE9Yt4/+EMkiL2ZLxVO
         wU7Lma1agWykLPTlgsQ/0rAEBR0LJxGfUFtWt32uSjXALd4dsHPHQKco4GD39nElW2IC
         EDLzuDR1KJllCxpindX/QWH6cgxpPdj0wKxUjTPthTLJ/2bV+7MibOcCYP+0dLzbW76Q
         ADYoJITHK88k/FfoOc9gJza02qXVZy8RnVaazwoeH3V6G5Bd9bF+QSZvCQgoE5SOzR9o
         RpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788395545; x=1789000345;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFIFDsWKdpgTfW3uc7xRObLB/Ddh6TG5x2Js0xrqLKc=;
        b=k4Ch7FMmUaxvFmxKdOatBJkqCkM+jMB/v/0opbpyRRdOui9EKwaz1QZTaehqQYwmHj
         3xirQAxjQUgqSGDSZzuH2eZKtI6XtAStQUCUHkG/cUZ799FNKuGX/0WqEx+UM02LnPH+
         OzOrUaMHO9IFVLO1+4QKllb+MjITXDCwwTBcv/HTOkDY9Vbqy3tNZK/wim5n9CvYP3hg
         VPIuz5oXQvMclyD2E8f+phlc/x3lVVvkfPdUgQYs2z/rUfb/V8htOK4ClbJmcUeWA7Sn
         V5s58ubHrxuXZ7Ad+wnDhCB2llEVErj6eVQRztFDFZGDwdarloUemGodzTq92mArxe9T
         PkbA==
X-Forwarded-Encrypted: i=1; AKwUvBxoPBuy7dtGwjmxcpYtOnLzflwRtOmX4mM+H5mr/477djJ/bOY2PNPoV1NkZVeo3Y/dUcJJhBk2cqj2bwcn5Ws=@vger.kernel.org
X-Gm-Message-State: AFuF++lBvcfXvdbAqRRkud/EWrwLCg5Sf0GijcOoEe3O6Hu3JODKig/h
	AmTfNkzP55WM6A89AhqxN8UZm+SLSdmE/pnsEu9bsp5WIkSrOpmYAb6NvgijmZP5Va5opHz4QJj
	lJTy4MDSrWemyFMnAmKeDvWimY/678GQQ5A==
X-Gm-Gg: AYBFou3UHjRjc5rBmROGg96/pPicbskMtAX6QcryRkPfNvTYpe1GEFmR6l9UNfCeBRv
	9zQNe/QwNh8Ad0IN3SKMi2Ev6OMNXK79g3m7qs8PpDY719X+z+pIUliXgyOH/EXOGt8vA+omxLb
	ADqPPMflNi/r2q6WI08H4xya2YM734Szy7Eg+Ri9ZVN/g4GRVncsI4T7xZw+qVsJhfhCL8CIUjz
	gD2rOqp33iS1hboaRWBmSzRjwJ4LABHai1mlKd7w30+Eq/SAr7VTBCWP8SXWNdD6BFWqyEF0yRx
	shFR1Sek/fdQ2Ou6Q8YMNuoD6xHps7n+MCE6CPGgkSrFJqScRq+3K3lEay8xRNco8U8pt5aC9c+
	A/ZAISBwVW/kKqLDiAzm6LY1JjT4XHwsvzDN5
X-Received: by 2002:a05:6a00:408f:b0:857:72ba:ff0a with SMTP id
 d2e1a72fcca58-85ed3f7037amr14628468b3a.18.1788395544725; Wed, 02 Sep 2026
 17:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901141954.29449-1-suchitkarunakaran@gmail.com>
In-Reply-To: <20260901141954.29449-1-suchitkarunakaran@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 2 Sep 2026 17:32:11 -0700
X-Gm-Features: AcwNN1V-qWBcxzc6uVnaZe41jS2cEpg1nCoSdKsbr4-IBlSBAnW0ZGSIW3ssxGY
Message-ID: <CAEf4Bza6wQb1mSiKA_6U7FovYivcZvf3MCvU9NMdt01w-wAZPQ@mail.gmail.com>
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

On Tue, Sep 1, 2026 at 7:20=E2=80=AFAM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> libbpf_num_possible_cpus() returns the number of possible CPUs, which is
> appropriate for sizing packed per-CPU map value buffers. It is not the
> upper bound for logical CPU IDs.
>
> For a possible CPU mask such as 0,2-3, the test loops over CPU IDs 0
> through 2. This incorrectly visits CPU 1 and misses CPU 3. It also
> initializes packed per-CPU slots using their slot indexes rather than
> the corresponding logical CPU IDs.
>
> Parse the possible CPU mask and keep the packed slot count separate
> from the logical CPU ID range. Populate each dense per-CPU slot with
> its logical CPU ID, calculate the corresponding expected sum, and make
> the BPF program iterate over the full CPU ID range.
>

Is this the issue you ran into in practice or it's just another of
those found by AI reading code?


> Fixes: 7aa424e02a04bba5ecc84afe9b58b16e9e0b34f8 ("selftests/bpf: Fix some=
 bugs in map_lookup_percpu_elem testcase")
>
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>  .../bpf/prog_tests/map_lookup_percpu_elem.c   | 34 ++++++++++++++-----
>  .../bpf/progs/test_map_lookup_percpu_elem.c   |  8 ++---
>  2 files changed, 30 insertions(+), 12 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_ele=
m.c b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> index bfb1bf3fd427..849f33259c00 100644
> --- a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> +++ b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> @@ -2,29 +2,45 @@
>  /* Copyright (c) 2022 Bytedance */
>
>  #include <test_progs.h>
> +#include "bpf/libbpf_internal.h"
>  #include "test_map_lookup_percpu_elem.skel.h"
>
>  void test_map_lookup_percpu_elem(void)
>  {
>         struct test_map_lookup_percpu_elem *skel;
> -       __u64 key =3D 0, sum;
> -       int ret, i, nr_cpus =3D libbpf_num_possible_cpus();
> +       bool *possible =3D NULL;
> +       __u64 key =3D 0, sum =3D 0;
> +       int cpu, nr_cpu_ids, nr_cpus, ret, slot =3D 0;
>         __u64 *buf;
>
> -       buf =3D malloc(nr_cpus*sizeof(__u64));
> -       if (!ASSERT_OK_PTR(buf, "malloc"))
> +       ret =3D parse_cpu_mask_file("/sys/devices/system/cpu/possible", &=
possible,
> +                                 &nr_cpu_ids);
> +       if (!ASSERT_OK(ret, "parse possible CPU mask"))
>                 return;
>
> -       for (i =3D 0; i < nr_cpus; i++)
> -               buf[i] =3D i;
> -       sum =3D (nr_cpus - 1) * nr_cpus / 2;
> +       nr_cpus =3D libbpf_num_possible_cpus();
> +       if (!ASSERT_GT(nr_cpus, 0, "libbpf_num_possible_cpus"))
> +               goto free_mask;
> +
> +       buf =3D malloc(nr_cpus * sizeof(*buf));
> +       if (!ASSERT_OK_PTR(buf, "malloc"))
> +               goto free_mask;
> +
> +       for (cpu =3D 0; cpu < nr_cpu_ids; cpu++) {
> +               if (!possible[cpu])
> +                       continue;
> +               buf[slot++] =3D cpu;
> +               sum +=3D cpu;
> +       }
> +       if (!ASSERT_EQ(slot, nr_cpus, "possible CPU mask weight"))
> +               goto exit;
>
>         skel =3D test_map_lookup_percpu_elem__open();
>         if (!ASSERT_OK_PTR(skel, "test_map_lookup_percpu_elem__open"))
>                 goto exit;
>
>         skel->rodata->my_pid =3D getpid();
> -       skel->rodata->nr_cpus =3D nr_cpus;
> +       skel->rodata->nr_cpu_ids =3D nr_cpu_ids;
>
>         ret =3D test_map_lookup_percpu_elem__load(skel);
>         if (!ASSERT_OK(ret, "test_map_lookup_percpu_elem__load"))
> @@ -55,4 +71,6 @@ void test_map_lookup_percpu_elem(void)
>         test_map_lookup_percpu_elem__destroy(skel);
>  exit:
>         free(buf);
> +free_mask:
> +       free(possible);
>  }
> diff --git a/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_ele=
m.c b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> index ca827b1092da..d8da0696b97c 100644
> --- a/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> +++ b/tools/testing/selftests/bpf/progs/test_map_lookup_percpu_elem.c
> @@ -7,7 +7,7 @@
>  __u64 percpu_array_elem_sum =3D 0;
>  __u64 percpu_hash_elem_sum =3D 0;
>  __u64 percpu_lru_hash_elem_sum =3D 0;
> -const volatile int nr_cpus;
> +const volatile int nr_cpu_ids;
>  const volatile int my_pid;
>
>  struct {
> @@ -57,17 +57,17 @@ int sysenter_getuid(const void *ctx)
>
>         map_ctx.map =3D &percpu_array_map;
>         map_ctx.sum =3D 0;
> -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
>         percpu_array_elem_sum =3D map_ctx.sum;
>
>         map_ctx.map =3D &percpu_hash_map;
>         map_ctx.sum =3D 0;
> -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
>         percpu_hash_elem_sum =3D map_ctx.sum;
>
>         map_ctx.map =3D &percpu_lru_hash_map;
>         map_ctx.sum =3D 0;
> -       bpf_loop(nr_cpus, read_percpu_elem_callback, &map_ctx, 0);
> +       bpf_loop(nr_cpu_ids, read_percpu_elem_callback, &map_ctx, 0);
>         percpu_lru_hash_elem_sum =3D map_ctx.sum;
>
>         return 0;
> --
> 2.55.0
>
