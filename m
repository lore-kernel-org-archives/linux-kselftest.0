Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB8D4071E7
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699186; cv=none; b=H39zMxXABFtifREUApMzaStx2IuiR+9QnNFID34W9QhqgeJf7XLBMGDwrQN0LCsdlXRbxM0OaO0gJrawkkZ0wRNw56oeFCCW1Dc25UpleL5W2r5JIYQVRrQy5lEP8OUZv0q3SFD/3D0ffjmy0FgF09TRmy1r/axRaz9/3pKHkdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699186; c=relaxed/simple;
	bh=vb2jXE+X/Hf1iYoX+ZnlPTpxTVJexi7Tdbw9iGRH/60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDHSSU1a9cIRyxQ49eHhTW3eBbJvd/tOPyuudpb2xqdr6vrG6sZcPSGluGREVRpSLBEJxNX7dNsMdume6ZB5qbFBVv60vCZHt+wLcPlueuvPUE16em3MDbLTbTXY0h2hEUqhaHqNEO4xbxYxOnZmEB6pRbcZAB+UmWbtaaUCaQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S8kdNCLy; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S8kdNCLy"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4601949975dso973026f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 05:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781699180; x=1782303980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Iim+7rfRj3+oRPn4MTff3Qg6MkJBVhCqBNuI2UP5kD8=;
        b=S8kdNCLyPKn+s/C3yKe+99tHMG1wxK3W0CExPbnzFNhctLvSxSxZIkz3E+Q19leuID
         LKowGszPlt7vhaSax2ZClyIxKUYNQS39nEWsZo3mhyLky3Oieg7wncOmM4CBMMNCmUPG
         BLv7lFCp6BcIdYhQtptxBP2Wpy2S9P58dfirMFyinbb9dbM7kz1TVpWU3kxm/O1/zM6C
         jP4GARok3jgF5OXRZrE7xRQitVwvbA+5eZLoAXzvfpIoHL1BxerJODs6z9tAEjXanQC3
         97oWrBRrPNxxBDwLHKR1DxIVzSqHW5+tL3zs0UYg/5T4n/fa7JjQivb0s5iIvs3xgs3C
         A2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699180; x=1782303980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iim+7rfRj3+oRPn4MTff3Qg6MkJBVhCqBNuI2UP5kD8=;
        b=oaKbEUOJeffwCmbLtYEyB+iqM7SFdU2Y0fiAlNmJsFN0bu85v3YM4Tn4tVnon2LXOC
         +hE+iZ3K/4YiCYYmfme7UPcjszx2yDzWvAVuPqg+49VzJakoavJ4NwsX2BR6+YJBokfy
         CApD0SUYlJ7ScdaR/gsWsL6YklwZrn+xOTwu4Dcw0AGXeEayIIAI1lrZPD83r5jlElxO
         miX5WGz57pfJ72QQ/QhVFyJTvVG/M0GZFTn7rqWqFuHWmuN4YkwhiRJIr+Eogq6j57if
         LUPt1+k4JxeE1sKr+NB0DIsW7cn4mXIhk/NH7wIBEs1x0MhVFPNLm0QcAUFcvBK8IHP8
         aaNA==
X-Forwarded-Encrypted: i=1; AFNElJ9xdGVFwZcyxU9/LI8eTFAYYNZS4M7AN/ng+B1W/QoBYew8oT55NrW1c8pxmpu8CBhRcRrVgSMtgJfz/kJZ8HE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+8o6Rmu3BEV9w/PhaNmWDO7J1I/Nk5l9QTDBt7DB9no8p94u9
	Gl/bq0bA5iLFUI4sGtDoG5xCHzoydJxm44RjnOREQYSPWrv9KEZz6cipZR5rCuUmIt0=
X-Gm-Gg: AfdE7clp/yhBAcGV/n2PLUU9s6CNvx7VZszcmFAsu8ypeMleRVYzQgkLGvy2E1eUSyH
	Qb912QhPHFqoZzZ/Htrv3gdeAWaxQ+/fe3l+lrKQe00cW4R6a7JN8/8oBetUstB/XBsuKv7qdRO
	D5kSG/N136nz6ROxELxo8+R9FG/gX2b+j6NTavLXdhTOtyY9j7kaSvMeYXYTd1fF1M++HjRKGeD
	jT3yknwwAIgEYizUpw+hzIqX2dg5ri6wVpU1j+ZB7Mgyf01JIHOqxDmGM/xbsohFsdIlUkrhTVe
	XVij+IJQijCwPcJ7LO/jy0lvhZ3lzEWQmJG1W847q9lljrVND+8oRmFlBm5a/YLtZFbXnKQad6r
	UkTR7ekpSujf6W5RkizImZ5F0re9zjzxrL3WDZbiWH1iRAjPhz/kljFR1P/jZsx3ibHrfEWHsFd
	5ThVeLMwtlhAeDteELUg==
X-Received: by 2002:a05:6000:46da:b0:461:a5a3:692e with SMTP id ffacd0b85a97d-4623f2e7e00mr4513543f8f.5.1781699179970;
        Wed, 17 Jun 2026 05:26:19 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c10sm53060827f8f.21.2026.06.17.05.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:26:19 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:26:17 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Li Wang <li.wang@linux.dev>
Cc: akpm@linux-foundation.org, tj@kernel.org, longman@redhat.com, 
	roman.gushchin@linux.dev, hannes@cmpxchg.org, yosry@kernel.org, jiayuan.chen@linux.dev, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, shuah@kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Hocko <mhocko@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v7 7/8] selftest/cgroup: fix zswap attempt_writeback() on
 64K pagesize system
Message-ID: <ajKKABt0ZKO9UJTI@localhost.localdomain>
References: <20260424040059.12940-1-li.wang@linux.dev>
 <20260424040059.12940-8-li.wang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t4tngv5chqbx2jyz"
Content-Disposition: inline
In-Reply-To: <20260424040059.12940-8-li.wang@linux.dev>


--t4tngv5chqbx2jyz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 7/8] selftest/cgroup: fix zswap attempt_writeback() on
 64K pagesize system
MIME-Version: 1.0

On Fri, Apr 24, 2026 at 12:00:58PM +0800, Li Wang <li.wang@linux.dev> wrote:
> In attempt_writeback(), a memsize of 4M only covers 64 pages on 64K
> page size systems. When memory.reclaim is called, the kernel prefers
> reclaiming clean file pages (binary, libc, linker, etc.) over swapping
> anonymous pages. With only 64 pages of anonymous memory, the reclaim
> target can be largely or entirely satisfied by dropping file pages,
> resulting in very few or zero anonymous pages being pushed into zswap.
>=20
> This causes zswap_usage to be extremely small or zero, making
> zswap_usage/4 insufficient to create meaningful writeback pressure.
> The test then fails because no writeback is triggered.
>=20
> On 4K page size systems this is not an issue because 4M covers 1024
> pages, and file pages are a small fraction of the reclaim target.
>=20
> Fix this by:
> - Always allocating 1024 pages regardless of page size. This ensures
>   enough anonymous pages to reliably populate zswap and trigger
>   writeback, while keeping the original 4M allocation on 4K systems.
> - Setting zswap.max to zswap_usage/4 instead of zswap_usage/2 to
>   create stronger writeback pressure, ensuring reclaim reliably
>   triggers writeback even on large page size systems.
>=20
> =3D=3D=3D Error Log =3D=3D=3D
>   # uname -rm
>   6.12.0-211.el10.ppc64le ppc64le
>=20
>   # getconf PAGESIZE
>   65536
>=20
>   # ./test_zswap
>   TAP version 13
>   1..7
>   ok 1 test_zswap_usage
>   ok 2 test_swapin_nozswap
>   ok 3 test_zswapin
>   not ok 4 test_zswap_writeback_enabled
>   ...
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
> Acked-by: Yosry Ahmed <yosry@kernel.org>
> Acked-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  tools/testing/selftests/cgroup/test_zswap.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>

--t4tngv5chqbx2jyz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCajKSZRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Aho+AD/XAL/DakRMJXz9yk1Zazg
v5ZtizO1OMSuDPj/gKs2+1sA/iTg96YzL1efNS85Rz0XMUIW3UE34U/bKW2+nSp8
/SII
=BiG6
-----END PGP SIGNATURE-----

--t4tngv5chqbx2jyz--
