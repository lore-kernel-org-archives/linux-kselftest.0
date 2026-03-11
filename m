Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C5D3803D2
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773255553; cv=pass; b=QJDExj4JpiMe7eYKx+MXt5uQ+ZWcgKVlb+MIEoJDyFN54kGtkrTicGbORYSHtp0rJubphAd/WTT4feHdym+InbKq0MjTuZqOuyXQvt85ardvAjG/Am3WJ5GsZMiEVy9nxVD7DbcP7ywlnDKA2lpRFozpFmZocs+zvWdEbhM1Vt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773255553; c=relaxed/simple;
	bh=RHOQnICtwtIbHF0ju6bUMVthJhDP+CN2OunBzuzQvdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnyBDOmUeitaOVEkHENsnm5aobB7veJxAuZy7xWiYWrlImkf7uCuvx9RGqrxtR7eCOpmpZhZSiyzV8YvB+29FEU7/lE39gW04ubko6Cnj5ttBDpB3TGgUyP6okPsTmoYvk+cIG9vhWM5k05Bwc7ZugW7OoXzRCf5o15an3PhtNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WLr/dPRf; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WLr/dPRf"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94de63dea9aso89412241.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 11:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773255551; cv=none;
        d=google.com; s=arc-20240605;
        b=BiQVC73nMut2yu7Pxq1Z4guKY5ZGkYs76xOcjdiuoybZibb/P0XxDt1V6tnfVEk2u2
         dTwPRDGJCSVkDYYmhDsQwvhP19uaH3r71mDUNnx+Y+Gx3WY2Pdb5uZ/PvHTAnTs5UolR
         CWLiFsjqQ94lcyplvx9qEnI7gxm5Uabnzss8vxlpG8uFfVsXjtSffQHDe/ifdlhAmOL3
         zRuVgUvl3wUliTQLQ7UGIH0n+EwW8drx3gNR9ufCM0LMfsLumw7maKw2K9n2jVnT23w3
         oFnWvOA+QPGTg7EyXx49ozT5xWH21+9Iyqm1afeC7hBfxnnBovgcPLsJTrP9q4Rwq2zi
         p3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bciw34v7t0IyVuChEacEVc0ZCJfvKonKs/M56CZBfrs=;
        fh=y9AwH/+rDfvEJUaHCSu1emqoSC0AhfY0AzO5q+VFeTA=;
        b=YCI/oiSt+P6XZ8+eE5wp50DOhqhhgTNsS/vVDCZ7NcfK0TYX8/n+uLVBMY8nrErRI+
         vBvacSXaftPV7osdfrUENUscRuEZNlbPxQpzZyuP++/gViGchBIlkRJ1OE6Q5MUS2eq7
         XI2rpZZHZsXjZie21WQrOlyTdVyDGM8OMDYCJIVhC3zE59sfiz8k3QYNmsBQdiXvQiqZ
         bEa2gWs3SG3dC4wBKLI66B6G5JRGfpIuxip/ZQF5cMIBIj7jY3t2j50dXpL3vrD6/WpT
         ArmJmYc37ttVZiOH9Vfx9sLL8b1dHDqWy+Qh6MuBjamZqXqodQjjCjWLyCoF7yDKjdaN
         J+gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773255551; x=1773860351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bciw34v7t0IyVuChEacEVc0ZCJfvKonKs/M56CZBfrs=;
        b=WLr/dPRfQagtsE1UlLu6qh//njp47HpVKfo4AXqHcWcf4mKmOxwLk++IN25N3TdZj5
         g1Gulz3oHFYV4qp6ymVbwZc9fdw5+sa6dn5JwT2ULAj0e51vgcEolIlidNYRdHn0gd04
         PNzCxyCtWrQHqMVY38xikSBWycU/xaIPf/qFiFK9EnGofl0PGZmpwPkq2b1kxKhWFwfv
         rrdrbah/H70dniy5ZOH5tGbDzUcW2PmjG7erd7h7gMSGL4tSugu2/HPXM84DxJAPSoFh
         DUr0gKF2IHGrxlBcPMdBBC92L/xZod1CgMzgajucc2NBk+FmwltEWY7Awuq1K3LzIpz5
         VExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773255551; x=1773860351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bciw34v7t0IyVuChEacEVc0ZCJfvKonKs/M56CZBfrs=;
        b=k49ASDPNRklEQrZJhwMbRir9YY3rI4ldXT+4Obe3XHBESo8mDS6NfRxva4Fk/rQXed
         eC0w2UIVB7+cr8TfUQ2/wq+7qXBOWX0kXMawfWq4Sn8ENhbr0sYq9IrRSvwVVUefgtQd
         HD8Zd6K+vgc7X3dA6sINlbCRypAaaidvh94Li0U4rp/Y1CNScb5onRaGccwIxoZwmPJA
         ToivrRCHNnC9BDixy85pXbI43T4t8oOmNk/5LGB/a6yyslk/GRzdDl1aV7+cUHmukoQo
         GrdeyJ0GN3MBD3XFStvprjdTajEgsXDdr8qHydZMo5iTsmY2LJlXfj4fYmtD/830bOUG
         Q/IA==
X-Gm-Message-State: AOJu0YzC9YGTRt1lZotUvAnwYEnx8nzYCkx0XlDNZ+5jQ+Qc2LVNS7aM
	8EJEmtT7o2yc5BsgKlDRgt2eDxYU0drqGyqcGYRy71ZIWaPMbjB773hvP2k3eMa9zvmkd6bQ/IZ
	aO2g7fbNBtd6ug4p+4nBdgYAtLtTzMsO5gAOZ0gbruVeTmn0Z5bo9gPtz
X-Gm-Gg: ATEYQzyxVF2590Ssz5K44DOdE42EP4/0Cyckm+Tag6W73/djmX3+l9tUXoND5XYvB6i
	ITA2ZyD6ULQkTmQ4V7TC3BBwgPlq7xhqMlKWYTDcqcLDaSQyZvXYaoiFRtMZFpiCS+zDUTtyHhH
	DUtiMiB6idAgd1S17M2nH6jQBZkJH4m+6abwLJYIDfHzrYU1ajeT7A97hzcg9bHZRZvc/fzJHvQ
	1/cTzdqy8jfDs8P2fO1A6nB9Ochc1TpJFMCY7BPtvqZhHtwRdqNb2/B60ACkUetKapvDEW4KdXz
	9oSrwg==
X-Received: by 2002:a05:6102:4404:b0:5ff:c7bd:27e2 with SMTP id
 ada2fe7eead31-601def4cd2emr1426502137.22.1773255551119; Wed, 11 Mar 2026
 11:59:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311110523.26624-1-liwang@redhat.com> <20260311110523.26624-5-liwang@redhat.com>
In-Reply-To: <20260311110523.26624-5-liwang@redhat.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 11 Mar 2026 11:58:34 -0700
X-Gm-Features: AaiRm53qE8mZD9vnALocAiC-cDh7w8EM119yOXDFPhiLFXcIOIQ_USUe1dV5sDc
Message-ID: <CAJD7tkZ8nrb75a7UWGif-Z28ByRPv0tS87hacuyf4L+xDjJ6sw@mail.gmail.com>
Subject: Re: [PATCH 5/5] selftest/cgroup: fix zswap attempt_writeback() on 64K
 pagesize system
To: Li Wang <liwang@redhat.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 4:06=E2=80=AFAM Li Wang <liwang@redhat.com> wrote:
>
> In attempt_writeback(), a memsize of 4M only covers 64 pages on 64K
> page size systems. When memory.reclaim is called, the kernel prefers
> reclaiming clean file pages (binary, libc, linker, etc.) over swapping
> anonymous pages. With only 64 pages of anonymous memory, the reclaim
> target can be largely or entirely satisfied by dropping file pages,
> resulting in very few or zero anonymous pages being pushed into zswap.
>
> This causes zswap_usage to be extremely small or zero, making
> zswap_usage/2 insufficient to create meaningful writeback pressure.
> The test then fails because no writeback is triggered.
>
> On 4K page size systems this is not an issue because 4M covers 1024
> pages, and file pages are a small fraction of the reclaim target.
>
> Scale memsize up to 64M on systems with page size larger than 4K, so
> that enough anonymous pages are allocated to reliably populate zswap
> and trigger writeback. The original 4M is kept for 4K page size systems
> to avoid unnecessary memory usage and test runtime.
>
> =3D=3D=3D Error Log =3D=3D=3D
>   # uname -rm
>   6.12.0-211.el10.ppc64le ppc64le
>
>   # getconf PAGESIZE
>   65536
>
>   # ./test_zswap
>   TAP version 13
>   1..7
>   ok 1 test_zswap_usage
>   ok 2 test_swapin_nozswap
>   ok 3 test_zswapin
>   not ok 4 test_zswap_writeback_enabled
>   ...
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Michal Koutn=C3=BD <mkoutny@suse.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Nhat Pham <nphamcs@gmail.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: Yosry Ahmed <yosryahmed@google.com>
> ---
>  tools/testing/selftests/cgroup/test_zswap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/=
selftests/cgroup/test_zswap.c
> index 30d3fbf6b4fb..2d065184eea4 100644
> --- a/tools/testing/selftests/cgroup/test_zswap.c
> +++ b/tools/testing/selftests/cgroup/test_zswap.c
> @@ -264,7 +264,7 @@ static int test_zswapin(const char *root)
>  static int attempt_writeback(const char *cgroup, void *arg)
>  {
>         long pagesize =3D sysconf(_SC_PAGESIZE);
> -       size_t memsize =3D MB(4);
> +       size_t memsize =3D pagesize > 4096 ? MB(64): MB(4);

pagesize << 10 or pagesize * 1024?

>         char buf[pagesize];
>         long zswap_usage;
>         bool wb_enabled =3D *(bool *) arg;
> --
> 2.53.0
>
