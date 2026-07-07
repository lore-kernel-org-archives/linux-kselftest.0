Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C892C3FBB50
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 12:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425700; cv=none; b=SFVdoc7C9Yz2yFvNp8iVyiQH5e/W0BlcyA+eMuYTzSGMI0opP+ekfMgPYQCL+Mlvvg4NI6v8FhprcGET1e1Utn9mBF4JHdVWdRL52T3Lpw3IkbdtP8vDs/BANJXIXS9lhD9OMLB36R/DGCPhb6zrBdRNeU7o0kj8FulljwsChzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425700; c=relaxed/simple;
	bh=/8GUkb5deBcpAM3zS7bUZUXYwSqR4M6QK/IwDpzwj60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1CDoJ/7QfHckd1JNzSB1WQuOj3/1T+/1NIg5gkQjjIEAq8KDFEFH1sG/eGuBjlhyuB6vMO+BHctj1E/PO69DFdFt0tGsGWb9mR3HQqChvEZx31WB6mHxrNKKeFlrnx7Mgbqcs7cNZjQiDUsmdW0/XHQ+FxW3ku34dKLA2qFxT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ovf3ok1t; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ovf3ok1t"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso25976155e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 05:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783425696; x=1784030496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2foD8/m5jsx3KDxdM1AXAhJaa/uPNeOmtxQBIkqM8nk=;
        b=Ovf3ok1t7gVBe80wsLEjTuo3DgGqyi/DXr4UQhWI4DK2bkjClmH4+pm+2RmBOMk0ow
         KUl6UcVQAqd3d4IzcNbDM3VOek+jvB+maiS8e2q/RYmkXtypKIj5OdTVbIs+6AdHAStB
         huEIkoHs7/w42DD7qa/qSsKr2MfLsQjQFMWCjJxKWr+hTI7XXr6fwSYzwVM9sH0NKHHP
         D4HD29nh/PxwCAyiBEuLIMPWby8OzY1J3XY8s9djumhxmAFYcswmy30tFggRfHlZ+Xg7
         72D49KoSa7Pnwkqk1Fp7Mu5YqhAKixjqGs0WLLolGdNluGEaAmQ94lEFnMxwkJrRKQxp
         CIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425696; x=1784030496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2foD8/m5jsx3KDxdM1AXAhJaa/uPNeOmtxQBIkqM8nk=;
        b=Y2SGNaDY9cTQ08Sm0LzcOhr3cJ9E0jxV+EUA+ZhZuBjyisXu/5FybwqJencLZjYHeX
         qnbiZIB5l+YWMMZyOXgqrFpYBd7V8OEkGv7zAJKQMm2681mtsxsUgL+20jCWzskFlA1G
         zhPYEafIatDOQr0jA1Ey2cTjaKZn+IrRvQvQTF6xA7pZ9PHDpCsVXfxrz2DYItvfu21X
         A5IgPUIh/HwGr+GuXXkHAipkXYTXNLJ3lVTfvmgyUdtkogXkkLZiNErfGgYR7/AT3DcF
         cBivLZddyWzzJwAP2VazmUBU9MwfjABmGOHH0fEakuKyA7EPDbxEabUEHvfrStmtp1m7
         BV+g==
X-Forwarded-Encrypted: i=1; AHgh+Roe7gLxUCD8s5IFd07bp5ZS8IRVK61cG2pgLVz2hrXIBtac23Ung5G0nzNNK4hOZxq4Cfr/Blg++Gp8yGl5JUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLvbu4VYG9SfK1fQXA4nSCWrS+zYUUMPO6NmV59r9FZKmPadmL
	PTSdERMHK/xPwA9Tqw7ATUkHps1QJmhm7K+tHuqRcMkZe5gtAW/0uc0ie9LL1L/CWPI=
X-Gm-Gg: AfdE7ckfyLCit+aCozYZJVZVuk0FygPqVNRq5YOWLNuNCJShe5TsMAV3hF3qRmbWyoG
	LXlxiOBUMEsmqx46JiEvRWGvvFVPo/XYx8/Wmx6ILWM35UguEAL98CG5o3UmxGFL8BHexUF1nK4
	Ae+UPdAcBdEOW/NXPHjsVVO8F3M1TEn8QnDTgn1j6XfuqqGnlKlTrnCbhG7bkOp9kX/au3uuWHv
	TqoyTS57LfA/6HMFDwryt2WPeCBG99BYsdM5rx3jHCVTfqIgHbOYy1uLPq9bbKlGEbnwtrI8HVB
	9QDOybRVx/HmLwTiGrg6VAOutktwT0W8WPFleP0iMgWAb3bJ6BG4CuYVisu48PSQJtK/r8/37q+
	OOfT0jKxSVFHla8JGiBcEvKKjx+XY6Ueytv6YAEEW7ApDqzO6tazrkpw6dnIdKzv98nBqllLoEE
	V9R28BR2MejElj7hr2+9cDbB7e4ZWSbL7vQO29cA==
X-Received: by 2002:a05:600c:3b01:b0:493:b91c:6bf with SMTP id 5b1f17b1804b1-493df0a74c1mr48992425e9.18.1783425696112;
        Tue, 07 Jul 2026 05:01:36 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm32347941f8f.23.2026.07.07.05.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:01:35 -0700 (PDT)
Date: Tue, 7 Jul 2026 14:01:33 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, 
	yosry@kernel.org, nphamcs@gmail.com, chengming.zhou@linux.dev, tj@kernel.org, 
	Shuah Khan <shuah@kernel.org>, mhocko@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Li Wang <li.wang@linux.dev>
Subject: Re: cgroup/test_zswap failed with "zswpout does not increase after
 test program"
Message-ID: <akzpi93tZry0cCCe@localhost.localdomain>
References: <c0970cee-42c2-4844-b88e-229853f08e90@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n32fxil2i3lu57lp"
Content-Disposition: inline
In-Reply-To: <c0970cee-42c2-4844-b88e-229853f08e90@linux.dev>


--n32fxil2i3lu57lp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: cgroup/test_zswap failed with "zswpout does not increase after
 test program"
MIME-Version: 1.0

Hello Zenghui.

On Tue, Jul 07, 2026 at 05:38:13PM +0800, Zenghui Yu <zenghui.yu@linux.dev>=
 wrote:
> Hi,
>=20
> Running cgroup/test_zswap on my arm64 box failed immediately with:
>=20
>   [root@localhost cgroup]# ./test_zswap=20
>   TAP version 13
>   1..8
>   # zswpout does not increase after test program
>   not ok 1 test_zswap_usage
>   [...]

What version of the tests do you run?
Namely, does it have the recent patches from Li [1]?

Thanks,
Michal

[1] 83476cc97bc63 ("Merge tag 'cgroup-for-7.2' of git://git.kernel.org/pub/=
scm/linux/kernel/git/tj/cgroup") v7.2-rc1~136

--n32fxil2i3lu57lp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCakzqcRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjPxQD/TSp3AgFunXblm/wv+t06
iUtOKzzPQFXPcFo4roUGy6UBAPI9Y58AN6NvZtotdqoeb85Dry7/rdwq9AfzhNfP
8pEH
=dE8U
-----END PGP SIGNATURE-----

--n32fxil2i3lu57lp--
