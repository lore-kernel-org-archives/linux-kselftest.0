Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0147B3BB9EF
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 22:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773355488; cv=none; b=tHEGADaTDE/eLpNILaBJScNEcPglWRvHbTbbzvMgGRgNUhUAqGRolRlNapyUolpz9ZePstcXPz0t9rqV8KmLWqHnLFilyl3FeWfwViaTg2XZ07zLhOEnKc7nO+NyIbn3u7SMXajAZFIrZP4vj2m4Y4Vg4WcHvRf0qKI7qL4y+eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773355488; c=relaxed/simple;
	bh=PZ+ExTNvH3r1z7OlgBOP6Su9+77UcJ9UthTuCroOJOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKxebhbFkmCpumX8kyx/d5dZWRNMmVtSsbSjVOH2B9y9JxQIpw+ZHvg0jC5X/rA8pS/QB+gy8SjJotgV/gk5+51G2R31Mkrek0yhJsG+lCVg8ItQP+I4pNmwvpiuTwgCiYWU6QujivpxyXY32R/0Goq0MkH/KO+5wEwhs1VJqg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rA8piUuD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rA8piUuD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9ECAC4AF0D
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 22:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773355487;
	bh=PZ+ExTNvH3r1z7OlgBOP6Su9+77UcJ9UthTuCroOJOc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rA8piUuDVFXKQYUsfrjwk6SaEVW+aIAdCTLFC3sNlVOzwGiPKiQZU1ZBSikNbvUWt
	 4Acz8vgJGkGrocuoJVXBHZGhdvb3j3Fz7smyS2aHMocoCPqtL1Fa0EaYhflf5oJxx2
	 D+jLJGWHgUYTnQ5t11eseHtl1+dSi1QIDLVShM20IJMYOyUr1MZYC2qSDGDpKWv9Vh
	 VIMkPvixw1SBlKil0/ZRRTICkLZvbgqo4Pb++7CnAv4ffb546afArIAiPKQFKwjwnz
	 FtQEqjUjtkLlfXC43LtftVvAJ4uqgBMXXhC6G5u/BTcjRCPEA+jL1w3W/14We73tQ0
	 tCv4hxESzn3ew==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b942424d231so191843866b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 15:44:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnuor22WTKhnxuVRVXLL437zG/xoXCdSg4WDp38hUr8dzi57sGWzP8/34Fvb01vpFuubPlP1d0sNC/8//sfGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YydbkZO7gNI/UhVVXA6FsqCEYsjqiTJ/zaRchiEAKgnat1mPtjO
	FHNoLTLmNVA3aTOONxD3xqgWzaGRnhgtNJVgme9lDP4BawbTpO80GfpyM1A3mrxIcJmWcqYBhF/
	w4i+FxVQzPjZ3T7iAykG0U5L8/Fs6C5w=
X-Received: by 2002:a17:906:3184:b0:b88:7431:3942 with SMTP id
 a640c23a62f3a-b97651d185emr51530266b.33.1773355486758; Thu, 12 Mar 2026
 15:44:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312040627.55257-1-liwang@redhat.com> <20260312040627.55257-7-liwang@redhat.com>
In-Reply-To: <20260312040627.55257-7-liwang@redhat.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 12 Mar 2026 15:44:35 -0700
X-Gmail-Original-Message-ID: <CAO9r8zM=EHSsmkZMfc0TEqaviHUW=43=r_PW60enjaoxJXGgEw@mail.gmail.com>
X-Gm-Features: AaiRm524PNfkYxfVrpc2St54DerNH44DRfyB07Ocb7QbsQotuUYK5q2n16rFokU
Message-ID: <CAO9r8zM=EHSsmkZMfc0TEqaviHUW=43=r_PW60enjaoxJXGgEw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] selftest/cgroup: fix zswap attempt_writeback() on
 64K pagesize system
To: Li Wang <liwang@redhat.com>
Cc: mkoutny@suse.com, yosryahmed@google.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 9:07=E2=80=AFPM Li Wang <liwang@redhat.com> wrote:
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
> Fix this by always allocating 1024 pages regardless of page size.
> This ensures enough anonymous pages to reliably populate zswap and
> trigger writeback, while keeping the original 4M allocation on 4K
> page size systems.
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

Acked-by: Yosry Ahmed <yosry@kernel.org>
