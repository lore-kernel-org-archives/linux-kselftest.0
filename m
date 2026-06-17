Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6203F7ABD
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699144; cv=none; b=J+72pdy60t1JteSCdQ/DgYzXnegKA3zAsUQ+t1cRBXHEUkwSNNMOndoOnNu35fsd/IR81yjY0W6z/lb2pldfxvSqCH11Oaa3GzfcvhcIX1JWbMa2Es6+XxXdXh6PBMW5SUnsE73mSRDhATADFrrRh/1BwTrnSaDOX3Xqc3HCSJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699144; c=relaxed/simple;
	bh=55oehVVJrmbgSWpqFQjMcXle7kXrC4IU8zhtK3UJFn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wcko9IfF11VX9Zb/DdlyA/180aeXkBDn+VeK953ZtsBoGWH82bVCJpOrgQlT6S5eBY9Glqf9qW3J5aiO590Yv5T9J5c2QvStEU34kkUZyOlBr2P91olUsWx2GSgfQbRjVNvFqxp366dPDxXzNtKoD+5j5GfVidHnZx/Z7jVL/9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PL5Zse+k; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PL5Zse+k"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4626fdc829aso625528f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 05:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781699139; x=1782303939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0GtI51H7Zd74M1RsBhYXt9g8xAv+Fn70VlHsGIGT064=;
        b=PL5Zse+kBTa3E2DF8RlgL+llKyk9XrWurGnrRud3SssnE9D9BXFbCI/DazFsFYfapo
         zNZQU19WfyxIIUF3ftuWyF2dCmq4AH7hrxDdWznVzpYYxzDeGVFExJIujjmIZ/eefJYX
         ZJ9Wd66ZODnJy8cY7bQ8CCfZnioAG6mWYjRyERtqYkYlpMJdeNg4Rb3kTJ/cubdRKgl8
         PNv+/p2utPSqaC99enUM+FHWX6mMfsoJccwrA/1t8XATC9j3B4hAjIBqPlszfV1H5/hy
         etqUVf3ssG8fr4zINGWfGRh53HqJBrOrahuLCW7GDARod7HExCeOSChbQQut2uc1fPfa
         EcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699139; x=1782303939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GtI51H7Zd74M1RsBhYXt9g8xAv+Fn70VlHsGIGT064=;
        b=NbmkbsGRKsyiN2Yd24JdrjBFHlKuoKn6VysZWD6LMv0CicICff6OlfSxwrZtOrj6Bb
         CWIWI6lasLeAsbmdKHdmaB/MkrXqxCkI6ZZ/xj0F0x0/Ie5rJpATym1qVQ56gZOO2QCy
         ZyHkxmRq0SEUY8tEo0zhhLhtcPiZxckMBhGWtuKPd1wSc1CgVMWGetu8c+qfTs4IczyY
         WSNHdm9u+WpJiB7lqp5x8bqeKSZOUM8R02QUvnYycwRVOgdRKvjv9qoZ9sjIILO3r0Xa
         7u7HrpRJ1LVL8gK73+X9QPHHOSvA6lqXgx5xXygkSnvYNzGwgwZojw9XGk4uGtxsbvgc
         Ny2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/sv1FA3uNhDzJS03x1e6jDS++5PcJIOTejO+Wqsh8krnWoj9uCUs1wkkZkks61N4at2yoiL1keNemTlt9kC5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YydA16vfWtPczCEa5Los56gMdzmS4YoF8XpF5b44QNPDoexsY6o
	JDcMx6fTrn5Pvz5dg9UiJRdN99hssCruFKHeTrhLh3MNaeHmJB4rnllhQPDcFEMbmF8=
X-Gm-Gg: AfdE7clyylQnN5uQFdcEjpilAd846JPN/x/O5qGK9iPMuAvwWoX08Fa9adv4gTESFwU
	38SO+X5xkoZ5ONE8+QkfSYflErKPlQSxLGoK/1Bt6WnZTwre4etbBG8g11LauSluKrZIlVAlakx
	FA2pxSAef1ikbYK/zzdCg1JyX6z8qeznPuoHNZMgSsqwnNYXX1A1U/myEBScMF2nqYlPiRT8vPb
	39kydjns86HFgNn+KMAdoezzAybYyZsAG5ji8HspBQs36thZr58Tk1phbZdMRMxUlxnXhah30Dv
	dwF3edTycNnsGwj375sO30s0yy9LDUZ5Gj8wdkh5fWAFuOJxhHXaAU5LDl+O/hBKLOUqPP/7LfA
	xhOQrxmfFj1pyL6dnO6mjmgSTcrbluqicQEQH+gdS6vynMz8snRGjRYSoC2CJlJgkxvB7kLeDWC
	gMFtchIgtpyakfTHd9cA==
X-Received: by 2002:a5d:588d:0:b0:43f:dbbf:6d93 with SMTP id ffacd0b85a97d-462410d3c5bmr5999253f8f.27.1781699138624;
        Wed, 17 Jun 2026 05:25:38 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f726sm51008107f8f.15.2026.06.17.05.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:25:38 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:25:36 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Li Wang <li.wang@linux.dev>
Cc: akpm@linux-foundation.org, tj@kernel.org, longman@redhat.com, 
	roman.gushchin@linux.dev, hannes@cmpxchg.org, yosry@kernel.org, jiayuan.chen@linux.dev, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, shuah@kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Hocko <mhocko@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH v7 1/8] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
Message-ID: <ajJu85Kq26jWeiCy@localhost.localdomain>
References: <20260424040059.12940-1-li.wang@linux.dev>
 <20260424040059.12940-2-li.wang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xz3b5522yngbc7la"
Content-Disposition: inline
In-Reply-To: <20260424040059.12940-2-li.wang@linux.dev>


--xz3b5522yngbc7la
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/8] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
MIME-Version: 1.0

On Fri, Apr 24, 2026 at 12:00:52PM +0800, Li Wang <li.wang@linux.dev> wrote:
> test_zswap currently only checks whether zswap is present by testing
> /sys/module/zswap. This misses the runtime global state exposed in
> /sys/module/zswap/parameters/enabled.
>=20
> When zswap is built/loaded but globally disabled, the zswap cgroup
> selftests run in an invalid environment and may fail spuriously.
>=20
> Check the runtime enabled state before running the tests:
>   - skip if zswap is not configured,
>   - fail if the enabled knob cannot be read,
>   - skip if zswap is globally disabled.
>=20
> Also print a hint in the skip message on how to enable zswap.
>=20
> Signed-off-by: Li Wang <li.wang@linux.dev>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Michal Koutn=FD <mkoutny@suse.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Nhat Pham <nphamcs@gmail.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: Yosry Ahmed <yosryahmed@google.com>
> Acked-by: Yosry Ahmed <yosry@kernel.org>
> Acked-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  tools/testing/selftests/cgroup/test_zswap.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)

Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>

--xz3b5522yngbc7la
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCajKSOxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ag2DAEA2nNoiQ15OgJR5VxoVnSf
lqGp2dpx3cwAQ5ux10qjH68A/1bVmadDbo1mKFNPpy/OmWnyJnAthaTKN3GT+oTM
BcoO
=cwDP
-----END PGP SIGNATURE-----

--xz3b5522yngbc7la--
