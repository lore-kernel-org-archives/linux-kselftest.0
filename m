Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72433423A9D
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779459450; cv=none; b=kSPpy6GMPeZGcbslznDpOjasW0UO1P+uKYpTTFUGiWo93x3ey45Sv0Bc0Kn0g2Qu7WcNWyf23Hyouknaw1Hwi9exgxpum/PNe//VOad5BSceQgpm7clLN4AdfsJX2tGUMRfOg7ZsZShynqd2oywO68saCI+66DX+zxFGCPjvO6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779459450; c=relaxed/simple;
	bh=2IT4bU7zJWIhEAUx5KMcM7p2nf/aXZLIR7rfEpTYgnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IS6GAMJpbabscDxJv7z2tDgQ5z2w4XK17O09A1ecmnYnSMLH2nesAUULEx5lGC0iSQbE7sW1OCMxCHGjjtaB9i+r5FT0qUz2IkKjC7MQYUAO3f6QKRNRmUEnO1UpLwvN+xrssfH/z2x0S80lW7epvBb3eM/eei+FVdpzgvOFKS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eIImTcFT; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eIImTcFT"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso6177488f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779459441; x=1780064241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q3AZPvBEFe3lqUHmEjYuLSqF1EqkmBHaAzjNMZgdm2Q=;
        b=eIImTcFTlAlr9HOQzgXQPUBKfb7ft69d9iss6RXOmKFxsMd1ToaR9DPW4WXvbfBolv
         JEhqlj24APDnehsYP3wDssxWXZdKd4NI2hpFZLXot+2m827U6XmLrKgr+Qn+Xnas21QM
         hAV5pU+aDlPo1tXCz/DQSrrB8OhHAU+B9IiH191EloPUlR9FTiVA5i0fQ/dzxDSAKDp7
         Th1O+HX2wmzi6oFJnkvyldzOzze8rwyyJvWhIeisEFCSvz5LbzzqPzyKTPCUnH6YoW/m
         2I6goD8TsaInZVCPRvte5ikhIonoDmAvK/gTzexhAwRP8NBazkgi8x1/FGl0+EFuo8Ic
         aqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779459441; x=1780064241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3AZPvBEFe3lqUHmEjYuLSqF1EqkmBHaAzjNMZgdm2Q=;
        b=H7K6BHoCwJXWN/itdfsI5z5E9MTVJlS1mfTTKOD3c6CYrWlrYWxwGltCJpKJyi8Wx9
         t18THYesg75L/qF6QAIj+vnYjmrpUNuYp+yrb44rxAjY7LItxIj45qcYNEEm1da2GDs/
         vHQgtfxEuoh+W41GGNribeTbYwsN39LNdGCCVpeg5xCOlnhZretdSh2RzOUmMmE9F9w7
         5UaAEv5tmt9T7Pce8UjRmp4hGK+GZJ1nRPnOssACY/Qx1tLzL5sjErqpcJa5VyiZwmOi
         Z4zV6B7yTfUCH/fKs8DF129unRMf+yh1zK8dCT9d9IGO4owYyK3bxiqqQmLkmZuJplUo
         75eA==
X-Forwarded-Encrypted: i=1; AFNElJ8rWG2hlfsxopv8w1Hn7FU7AXYeWFUe++thVyHdbRle1zA/5bDinc4rM3lg1C//mX5jDDZZnKyLSxliw95Xy/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFRn2fs0Hd0coLBHvH2aZHOpIo2XHnMLB1rix3FRJ01aLO0XW
	cVfNDzneCW4RyQwGI7l+sZJ0bOlcRKIWGHdl/BqNKScDeUXgClc5qnEHiDE1kJ22JtA=
X-Gm-Gg: Acq92OFfqwn7Q8BDzof5tmMzR80UH0sBrrinvsOJFn89fRLzFyANzs+U5ieigg1A/1C
	6M4um+K+cooTCmr5ViJ0iT9Itk0Y1YAW7T/LgefqD+5A3rkUrbxRKzo/Miqhk63Aa2hnahDkNqq
	QUcvA9oKu8sK46plIId3cN7GMON55Vb7QqCKyndP6ooZDGEfwCrh5vx+Py3Sf8fL8WYF3/SrhCB
	yGKy0BpEfM1SbXAa9xOb+J2sGEDaCM8r3SzJYm7b04jgOvGsRpZsom10bmYFEUncRaB/8DK8oM8
	h4V2posZpdWkYIiC730r/6eKH3nnYeT7eHaEN32ve2LKs3fTJG7QR72Zj90iQLc7Rkent/C7zOn
	Omf6VMXatKJf6S3yd+wgR3Jylz5F9f8ZB7/pJiHa3NNdWlm9IMfAibvU0zAW48LgUIDjUJ3RTz9
	TZPkfbKnrhMe6+ruuTNp/ZQxdiYIOwtaZ44eKjlZb2QXEfFOSL
X-Received: by 2002:a05:6000:1446:b0:43c:f1a5:56f6 with SMTP id ffacd0b85a97d-45eb38df638mr6017569f8f.43.1779459441546;
        Fri, 22 May 2026 07:17:21 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f598sm4662287f8f.6.2026.05.22.07.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:17:20 -0700 (PDT)
Date: Fri, 22 May 2026 16:17:19 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Guopeng Zhang <zhangguopeng@kylinos.cn>
Cc: Shuah Khan <shuah@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Hildenbrand <david@kernel.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/cgroup: enable memory controller in hugetlb
 memcg test
Message-ID: <ahBlG9kRRFD8xSVc@localhost.localdomain>
References: <20260520093130.490020-1-zhangguopeng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ioeyy53bhh73ifv"
Content-Disposition: inline
In-Reply-To: <20260520093130.490020-1-zhangguopeng@kylinos.cn>


--4ioeyy53bhh73ifv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] selftests/cgroup: enable memory controller in hugetlb
 memcg test
MIME-Version: 1.0

On Wed, May 20, 2026 at 05:31:30PM +0800, Guopeng Zhang <zhangguopeng@kylin=
os.cn> wrote:
> test_hugetlb_memcg creates a child cgroup and then writes memory.max and
> memory.swap.max. When the test is run standalone, the memory controller
> may not be enabled in the test root cgroup's subtree_control.
>=20
> In that case, the child cgroup is created without the memory control
> files, and the test fails during setup before reaching the hugetlb memcg
> accounting checks.
>=20
> Skip the test when the memory controller is unavailable. Otherwise, enable
> it in subtree_control before creating the test cgroup.

Makes sense.

> Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
> ---
> Tested with a cgroup namespace where memory is available in
> cgroup.controllers but not enabled in cgroup.subtree_control:
>=20
>   before: test_hugetlb_memcg failed with "fail to set cgroup memory limit"
>   after:  test_hugetlb_memcg passed and cgroup.subtree_control contained =
memory
>=20
>  tools/testing/selftests/cgroup/test_hugetlb_memcg.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--4ioeyy53bhh73ifv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCahBlahsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Aj5lgD+KS03JEmXK2JC8snPY5sv
PAmo66NuwBsqgnP9kOfQ8ZcA/2IFpR2fC0yXtbS+OysEn2k3bmEuzcNLcjI0lbRg
ndEG
=yptN
-----END PGP SIGNATURE-----

--4ioeyy53bhh73ifv--
