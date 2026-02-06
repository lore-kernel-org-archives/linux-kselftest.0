Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD522F5311
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 22:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770418219; cv=pass; b=GWVMdE3wtkM5v6tcQgsjaO6RBLysUcI3EZY+ntM6S/GIDIks3UGPPfKEVbPzV7v2yYqgNdrMtoXpxRcTyjD8pBsM/nKjc15YduYZWuz5K/5/P1JIOcOFVp0PSJjUf1kUwZnp6RSOCVbu/xAu9hco3SPGyFtdxW25mOphJnDuaAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770418219; c=relaxed/simple;
	bh=iQtWeiSNgPEPdaYwgKsUPFq1PwMnhYeNxsLcE4bOo68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kaM5nkiAGhR/B6uDwG3dgxnQuZvvrayUEpI4GQE9/59h5bbsxFIczzU5kDRVfyGBZYu4wkL/2TeF2gcEY6jRRToO652O3iJOqTatJXhUzCjdSusSZOSMfXTjUP9wqcNK+L49TCcxa4r+oz+zeb51uUrePA1H9MeQONlh0hpiwMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBenC7/p; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBenC7/p"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4362e77d7fbso709728f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 14:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770418217; cv=none;
        d=google.com; s=arc-20240605;
        b=SXdwoQrMdCdQvO7x470JAl8kjIMLwkYRB+n8hZPeBRqOOP/2Ynt61khPv0D1a28u+w
         e7XREeEFoDKCS+sLuyXxSGIbbvDWRV/3mXXTCUVaDGtJ/1PJiOlZRb5UxoqYKfQz/spp
         ZldVD1ZFUMX3P0U5tH04Zojgrp2TNq1+EcYE/UjKsOMefIog8lMeaDsSTTlixu3qFh7R
         2S7BGTeONYTL58IiqjeM5mIm+CuLv/Wu3/zjw5SWVwTs0qmBoz99ejWMOohCXGRJ6rFm
         J8jozFblEVMEWH6Mn6coWDTsPxZaE33buEUenuFuv+D3OCYB0rPIwrKYaRtWOiwnXiEl
         M4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pKIcE6GoeXBIyuDrXKVfe0dIRC3Ib5hok4aF2odJDyQ=;
        fh=qKbVDRbZIN/64NxeaARQHZE1hJkXAL2JXurb7rPMmHA=;
        b=MNhF3eXQnw8SDUr9zkJET6bhjPIqQzyCPIwO+udyIjWj+gy+fOWqPcqBjqxzOn0JjU
         grdt5raBatUUea6R2dugbHp5GMu9iqcV1a/B13yGNeE7ye2or18vUvSsrjMog2Ki2v9m
         ImZwqWqwpZqzEOC9t79fyO43tGRLpHjnMzubNsb9a3TOq/Bka6u9hrq0qwf9LEkxpFru
         ENBaXrGvmsQ3yCQI9wHCGXdYQNcwor4gfpUW5PcRUgj+fWqq0S5ieH3Xjvw5uw0V/J0f
         YnYYFRK44uFpEO9Jr1VlD63UkiUzj9PVY89DhmDdqfIF0qCBJ/Hh6WkCYUe65YaJOD2N
         asbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770418217; x=1771023017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKIcE6GoeXBIyuDrXKVfe0dIRC3Ib5hok4aF2odJDyQ=;
        b=EBenC7/pYvhgt9VftkJ6bdSw/J54P0RsOVJ0hPcw6vvChUP6B7xn7sxeYoynCQcWdf
         OjB+8MaYsTVCUotPiDeZeMaiDBq8Rx5XM0v4q7QC3K3I5VFKNkE7mngVucC64zSFUHE2
         P6h1ARTEGoAPuxc8+/dd2nd4CibHOFwQpqz8T0SN8seS99m4HUcC5GhMQ+T5ViGpV82g
         oEFNst3YKi2BJQtBEZpuQDkJifbUod5XAVnE14b4nip1x8sSvZqRn7/MqhfEARIP4aEB
         EC3q2OG29GprPWWSdv4it6V7qtblXsM3cjQfJDUhw8mKNP+yv7BEAF0sDdejX6yfTyp2
         u7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770418217; x=1771023017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pKIcE6GoeXBIyuDrXKVfe0dIRC3Ib5hok4aF2odJDyQ=;
        b=AndkxbAspYjx96Xdw61H2Pn++2aWT/BT3KuzZudadXbcu13tSzXs4Mg+PaUlksYi4I
         P3mpGaiGzd1fJqxPF79pfr4DphqSzgGKDX2RFqseIrzprLNy4hNA6NQVNs1TxNytM9vo
         PbjDYYpcB4oZHZpZgpQvOjhmoIZ5DyVmAlDjdANzfrbdLcxIEDWTkT6rBD1glbe+1u0A
         g3Iuj8Hp0RD/IcOeUi56IMeUbazglWrrluT/iZWbXSA0zii/2DhqHBGoyDRBryPMXqYL
         +U/HoxDPbWSeSbp/P9QJbuo5nIQjy+kT3h+nNrD9yvNYcLilKxOQsrJeA44VO9a70wA6
         /G7g==
X-Forwarded-Encrypted: i=1; AJvYcCU4HJRgUIWnk0G0tdmIDAwVACJMzg4k4iJFy9CkBp9FMHUQcvlseptMtJqXcrMuVdjE9yPOo9kXxdZ9JqzsY5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhlV+Y2DCU2aI4jcyU+vzKaQhB07SxNWuY5Hl41ACjydpZ5jor
	079j8qMpuKut/8vg1T5ylJaLRRwEA0glERZGDrHo4deHS1DSQDvFwv1D9J2pHlbdGdqZ5jVN55v
	CXDVHtsFBYx6Jp1iGTWnLBHINFW0pSK8=
X-Gm-Gg: AZuq6aK3mhvc7QUAEJ5DHW/3j4OSk+mC6Z+CfjUp6v8MoSUbRArOMEMT+DDneU4c/v6
	+VuXVubfF28swF5NdC7uOQeRI8ptKUyetiR1XdZAWIsWEwX6FU30UP2XFkf2YCVqSJede87NTgd
	oYZ4UlmGpV1T6gtDiRHO5App83HRzccudzMXWo6I9lpkkNe6SsKnY+9wtM4zN6b6Np3vautV9oi
	5uBTyd6Kc8bvp9hnlU2kSiKeBQ22P9ALHEBt81gG1Hm//Kj8eCdDGWU1fSGrjt+1sKGrJliQkeb
	BYOM8c1WXgXnI35HYKJ8HEPSWaHOGLSRES0fNlvy9wtAFA+zVluM3tQ31FJDyCaP6BY7yA==
X-Received: by 2002:adf:ea06:0:b0:436:307c:b762 with SMTP id
 ffacd0b85a97d-436307cb87bmr1734201f8f.60.1770418216969; Fri, 06 Feb 2026
 14:50:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206072220.144008-1-jiayuan.chen@linux.dev> <20260206072220.144008-3-jiayuan.chen@linux.dev>
In-Reply-To: <20260206072220.144008-3-jiayuan.chen@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 6 Feb 2026 14:50:05 -0800
X-Gm-Features: AZwV_QjoaGZjUJoZZAUbUNek4v2vd9XA09_63K25KesvtBZQTlzS_xae5VjsBQ0
Message-ID: <CAKEwX=MgvCHVMOWNprWu1xbQ6=CO4ok_sywH2Cgz05aT_pdZ5A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] selftests/cgroup: add test for zswap
 incompressible pages
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 11:22=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>
> Add test_zswap_incompressible() to verify that the zswap_incomp memcg
> stat correctly tracks incompressible pages.
>
> The test allocates memory filled with random data from /dev/urandom,
> which cannot be effectively compressed by zswap. When this data is
> swapped out to zswap, it should be stored as-is and tracked by the
> zswap_incomp counter.
>
> The test verifies that:
> 1. Pages are swapped out to zswap (zswpout increases)
> 2. Incompressible pages are tracked (zswap_incomp increases)
>
> test:
> dd if=3D/dev/zero of=3D/swapfile bs=3D1M count=3D2048
> chmod 600 /swapfile
> mkswap /swapfile
> swapon /swapfile
> echo Y > /sys/module/zswap/parameters/enabled
>
> ./test_zswap
>  TAP version 13
>  1..8
>  ok 1 test_zswap_usage
>  ok 2 test_swapin_nozswap
>  ok 3 test_zswapin
>  ok 4 test_zswap_writeback_enabled
>  ok 5 test_zswap_writeback_disabled
>  ok 6 test_no_kmem_bypass
>  ok 7 test_no_invasive_cgroup_shrink
>  ok 8 test_zswap_incompressible
>  Totals: pass:8 fail:0 xfail:0 xpass:0 skip:0 error:0
>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
> ---
>  tools/testing/selftests/cgroup/test_zswap.c | 96 +++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>
> diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/=
selftests/cgroup/test_zswap.c
> index 64ebc3f3f203..8cb8a131357d 100644
> --- a/tools/testing/selftests/cgroup/test_zswap.c
> +++ b/tools/testing/selftests/cgroup/test_zswap.c
> @@ -5,6 +5,7 @@
>  #include <unistd.h>
>  #include <stdio.h>
>  #include <signal.h>
> +#include <fcntl.h>
>  #include <sys/sysinfo.h>
>  #include <string.h>
>  #include <sys/wait.h>
> @@ -574,6 +575,100 @@ static int test_no_kmem_bypass(const char *root)
>         return ret;
>  }
>
> +static int allocate_random_and_wait(const char *cgroup, void *arg)
> +{
> +       size_t size =3D (size_t)arg;
> +       char *mem;
> +       int fd;
> +       ssize_t n;
> +
> +       mem =3D malloc(size);
> +       if (!mem)
> +               return -1;
> +
> +       /* Fill with random data from /dev/urandom - incompressible */
> +       fd =3D open("/dev/urandom", O_RDONLY);
> +       if (fd < 0) {
> +               free(mem);
> +               return -1;
> +       }
> +
> +       for (size_t i =3D 0; i < size; ) {
> +               n =3D read(fd, mem + i, size - i);
> +               if (n <=3D 0)
> +                       break;
> +               i +=3D n;
> +       }
> +       close(fd);
> +
> +       /* Touch all pages to ensure they're faulted in */
> +       for (size_t i =3D 0; i < size; i +=3D 4096)
> +               mem[i] =3D mem[i];
> +
> +       /* Keep memory alive for parent to reclaim and check stats */
> +       pause();
> +       free(mem);
> +       return 0;
> +}
> +
> +static long get_zswap_incomp(const char *cgroup)
> +{
> +       return cg_read_key_long(cgroup, "memory.stat", "zswap_incomp ");
> +}
> +
> +/*
> + * Test that incompressible pages (random data) are tracked by zswap_inc=
omp.
> + *
> + * Since incompressible pages stored in zswap are charged at full PAGE_S=
IZE
> + * (no memory savings), we cannot rely on memory.max pressure to push th=
em
> + * into zswap. Instead, we allocate random data within memory.max, then =
use
> + * memory.reclaim to proactively push pages into zswap while checking th=
e stat
> + * before the child exits (zswap_incomp is a gauge that decreases on fre=
e).

I wonder if we can do MADV_PAGEOUT? Anyway, I'm fine with memory.reclaim to=
o.

> + */
> +static int test_zswap_incompressible(const char *root)
> +{
> +       int ret =3D KSFT_FAIL;
> +       char *test_group;
> +       long zswap_incomp;
> +       pid_t child_pid;
> +       int child_status;
> +
> +       test_group =3D cg_name(root, "zswap_incompressible_test");
> +       if (!test_group)
> +               goto out;
> +       if (cg_create(test_group))
> +               goto out;
> +       if (cg_write(test_group, "memory.max", "32M"))
> +               goto out;
> +
> +       child_pid =3D cg_run_nowait(test_group, allocate_random_and_wait,
> +                                 (void *)MB(4));
> +       if (child_pid < 0)
> +               goto out;
> +
> +       /* Wait for child to finish allocating */
> +       usleep(500000);
> +
> +       /* Proactively reclaim to push random pages into zswap */
> +       cg_write_numeric(test_group, "memory.reclaim", MB(4));
> +
> +       zswap_incomp =3D get_zswap_incomp(test_group);
> +       if (zswap_incomp <=3D 0) {
> +               ksft_print_msg("zswap_incomp not increased: %ld\n", zswap=
_incomp);
> +               goto out_kill;
> +       }
> +
> +       ret =3D KSFT_PASS;
> +
> +out_kill:
> +       kill(child_pid, SIGTERM);
> +       waitpid(child_pid, &child_status, 0);
> +out:
> +       cg_destroy(test_group);
> +       free(test_group);
> +       return ret;
> +}

LGTM :)

Acked-by: Nhat Pham <nphamcs@gmail.com>
