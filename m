Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA44E3FE679
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 12:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699170; cv=none; b=tyHMuu048qvJtK8vXb11q3vpXLkS6HZVbC6YFaO/ZK5iWsgs/2pqBtYNSl3qD6zETgKtuKeeUY7V+M1M4wRZczR0JamuEQj4mZPcxSHBBugVJ+ruj9efjTJ7Q5inxJf49t9F4yKiNFkPZ3Dwy0oLIhDEoZeRIzAFlOWgM3Wb7Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699170; c=relaxed/simple;
	bh=jXv3Lp1VAkZliGQZVvjo9P0HvOkaYz9n//YoA1Z/TW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgpC/hC6OCAtbvqK8F8mmtohooCBATEiQ0m/alNIURR0/ucfRL04ufyMOoBQ1cw+z+D3gkQxzXZj1K6UKBuUMhraWqPaaDvZ65z6A5+Ky/0A6dt+v8fYfwMbbZj+Isq02krqf615G4Z4FNWR3lBr2eszun/lj0Kdz9s3NAeVrrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SbUyNTX1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SbUyNTX1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4631679f204so219088f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781699164; x=1782303964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UPt25DcGCAYbTcLBdAYH1YOTb8QxGJA5VYhPTuLTerQ=;
        b=SbUyNTX1MZBASicJ68JQ/I9QN8XY1IZkGhvUKf8al6VPdI+pPol9XrpZIduVTClmmO
         qsQwdW71wAL/UazVDTm/hvcEflzQrsRBct9zgv3OLn8JAocOORddIi0k0+kOfdPsnZ7R
         db8KpzLvoM2t0lCS9J8rS8SLo44fMak7eo/kgtRAdfvs4Ay8kaYtkbYEh+CSL6hYHNB1
         f4BKBfRmb7oMtmbBd2tR4VD0BERtnhtSBs7SwVraM194iiv2tJWX5Cg6qzV3RvTib06x
         X3tU52UveN506IxYsMO9GMDOrgTWq87j6B4eHx9dE103iwER7VsnMi8yYlDWG+QBU8AK
         Ozbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699164; x=1782303964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPt25DcGCAYbTcLBdAYH1YOTb8QxGJA5VYhPTuLTerQ=;
        b=QDLsyXGhsBwjGw5DeSBfcy3VZSSDXhfDDI6tVjwqQQNJgWaPx0tJp1JYDUu3VvrU44
         N6zvjZQsqZJlGnPLjq6N/ChCZlpReAgVgz6KrgXoClRn86PKiywjA+t3nI3OJft4iXTN
         DH4NfnXzGI2eBds5gF9gzouvQ98FhvMBjjgpdKBhMMrGRW3jmNQh03LTd2tnRiom+ym9
         52XdMcEGNjqQUPghVJDFKtyhC0IzMfQsVs9cVGX1ghC2kW6x3weQ6gdZUg93TqHW/6Gn
         F8/4PHrosazy44laxlByd/VTW4OwaMa621Jp9LzMCGIUScFWrporQH+QS/PEyFQXtM+U
         rgDw==
X-Forwarded-Encrypted: i=1; AFNElJ+wf896fQc1XfB6eFC6d2Rky6SQpQXkfzHqNojIurBLgG6Mcdk9I2jkSl7dACyhfF6Gw2zbCnLGcbG2qMfErJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZAqj3WFF5n59mCuZr8c40NMdh+jWHGmxi6BT2Shtts+QG3vY1
	ykU5DLswDwe0BzP7a82hM72JfMM+W0kHeeiteA61p4oW4r+nd8kN8ovdrUGQR8hjJyg=
X-Gm-Gg: AfdE7cm/3lli4V5sAMVARuPCpjC1n//ZYgMVpccSYwHPyW4OrKCazl/Bfyllo7XMd1v
	VyAeeh0onvEwspdFGx1mxX0VjLDesKHsdDhVJ9gqGfkcefBzD4kiuNOCbUQuH6jo/kUTqT3w9CL
	C1T4Ich68wpYrwvuaytzOO9TwJmBlvL/+kD23OFjjIS6j3iDJgcEr1ODIdjx7M8xOqki1FZr2AI
	IHat7Wd4iHALi5QWRbtYF7Puj/rmnjJWUCifGuyXPE2yVIGkTmiR1+HE6mcIbvXmZCgOP0Gy3YP
	G7klOJKXzxNwokRuHTtJEH4FS9S/1T1HnAyNNRcDXfPjVZmq8GiG08WstT+cIF/vL1bWs6Yih35
	NPN80Gpsz5Y4FqjXhnanu5hMF3I90B/Y9DofmC1tjt7C9OmnH03oSgYle76eGkAxf73ap3RWw3b
	UxZZ7/RChgvSw0oRd51ebC2iYZsOL2
X-Received: by 2002:a05:6000:603:b0:463:1d06:ab33 with SMTP id ffacd0b85a97d-4631d06ab96mr1913666f8f.27.1781699163597;
        Wed, 17 Jun 2026 05:26:03 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462e7fc53fasm3497433f8f.33.2026.06.17.05.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:26:03 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:26:01 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Li Wang <li.wang@linux.dev>
Cc: akpm@linux-foundation.org, tj@kernel.org, longman@redhat.com, 
	roman.gushchin@linux.dev, hannes@cmpxchg.org, yosry@kernel.org, jiayuan.chen@linux.dev, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, shuah@kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Hocko <mhocko@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v7 2/8] selftests/cgroup: avoid OOM in test_swapin_nozswap
Message-ID: <ajKRLmEoR3P2QTNW@localhost.localdomain>
References: <20260424040059.12940-1-li.wang@linux.dev>
 <20260424040059.12940-3-li.wang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n7t6jkbdigw2ibo4"
Content-Disposition: inline
In-Reply-To: <20260424040059.12940-3-li.wang@linux.dev>


--n7t6jkbdigw2ibo4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 2/8] selftests/cgroup: avoid OOM in test_swapin_nozswap
MIME-Version: 1.0

On Fri, Apr 24, 2026 at 12:00:53PM +0800, Li Wang <li.wang@linux.dev> wrote:
> test_swapin_nozswap can hit OOM before reaching its assertions on some
> setups.

Is it because of differences in available IO or what does it depend on?

> The test currently sets memory.max=3D8M and then allocates/reads
> 32M with memory.zswap.max=3D0, which may over-constrain reclaim and kill
> the workload process.
>=20
> Replace hardcoded sizes with PAGE_SIZE-based values:
>   - control_allocation_size =3D PAGE_SIZE * 512
>   - memory.max =3D control_allocation_size * 3 / 4
>   - minimum expected swap =3D control_allocation_size / 4
>=20
> This keeps the test pressure model intact (allocate/read beyond memory.ma=
x to
> force swap-in/out) while making it more robust across different environme=
nts.

I see you used allocation value that is preserve absolute values from 64k s=
ystems
test is differnt on 4k ones. Any specific reason for that?


Thanks,
Michal

--n7t6jkbdigw2ibo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCajKSVRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AhqQQEAhKvnU2uXdtmJBVHmhU0h
vihGBStgNmEeFai/1TzvfbMA/jfIjPkmuNEjQrWZRoxCNCCn746++JvMF9TKwDBC
VKQL
=xbR8
-----END PGP SIGNATURE-----

--n7t6jkbdigw2ibo4--
