Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B94B7405A;
	Fri, 12 Sep 2025 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757674196; cv=none; b=YoNsDyH1y8eBfhaZ1YORoM6yJfl/r2WdhFChJsTDV8038TlQUAxtz2BuMy62/bn0b3jAeo6OtouNX3mkRCajX/PKNyuIrPv7DhqI2t61pIFKEP2tYANb/1HzhM8ll4kA5/ipQf1cCtIBsYIinJ1KPtrKFQSghdjVQEqBaH9njgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757674196; c=relaxed/simple;
	bh=iXfdxi7NTU+LyAxuFNWMuc0/Yz4Vt7OLdRQgeuCuM5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpKlUl5X2vHO76oe08ja1xusIF8PANw3EuZsOOJZ657umaGBLs4XEcaXPzRH5UcU94cUkIiv2AQRt/A5E0uGLmWaO/tyFA0ak+QqDvaDASz/hHYNCF6R6V5SpWP4nH/VvLtotDrHZ+aup3QmBdLySSjhtTsSdlqhUVVgCLYjeAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6HgQC33; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6HgQC33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02B9C4CEF1;
	Fri, 12 Sep 2025 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757674196;
	bh=iXfdxi7NTU+LyAxuFNWMuc0/Yz4Vt7OLdRQgeuCuM5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G6HgQC33/g0o1mTr2TIiMT6vdS/Pq//5mMwW64MX6iHJlwTcIXmbHkFGVJlu01GDm
	 b4qXgljYTLIMDhZsMggj5tUNVtwJ0qoPOXFhhm+T9DsAU8CcETxwWRIS+WreqnXQCr
	 /mqHOtZqX4imM4LfGuEyi4Omdx6sbCI2gCxbYOWeSK3hDnPe7pIQKFwX4V7e0zKgP1
	 UbnEqrdG0rN4HSsO/pFUYWgFprl7Ytma8VTpvNuxSg4iVB8r4L9SOgjCIfzkwF60jA
	 4Em1eHMujCZjh6EHy6HKuuyR+ZcnCtKupHSSVgRdRYJ/PoVJeF4uW/IcWS3vBwlTq+
	 DiIGnXHL0NCXA==
Date: Fri, 12 Sep 2025 11:49:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: next-20250909: selftests/arm64/gcs/basic-gcs.c:390:30: error:
 use of undeclared identifier 'HWCAP_GCS'
Message-ID: <965c8d7e-c5f2-4bd8-ab7c-c3116632f015@sirena.org.uk>
References: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com>
 <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mSJ2Vs6vpLoMhbcO"
Content-Disposition: inline
In-Reply-To: <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de>
X-Cookie: Your domestic life may be harmonious.


--mSJ2Vs6vpLoMhbcO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 08:30:08AM +0200, Thomas Wei=DFschuh wrote:
> On 2025-09-12 00:48:47+0530, Naresh Kamboju wrote:

> index c99a6b39ac14..816b497634d6 100644
> --- a/tools/testing/selftests/arm64/gcs/gcs-util.h
> +++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
> @@ -26,6 +26,10 @@ struct user_gcs {
>  };
>  #endif
>=20
> +#ifndef HWCAP_GCS
> +#define HWCAP_GCS (1UL << 32)
> +#endif
> +

We're doing that for glibc using tests because there's some unfortunate
interaction between including the relevant kernel header and glibc's
headers (I forget the details) which means that including the kernel
header directly conflicts with something glibc is doing.  For nolibc I
would expect us to using the kernel's hwcap definitions?

--mSJ2Vs6vpLoMhbcO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjD+s4ACgkQJNaLcl1U
h9Bt6Qf/XdB1JDZOdU6heyTp+JQNrJnashNYRH4Aes6zoMxSkpZXP6KwEVScZ33e
mWNgJ1qzjIKi2qhUvTekSbjjhORaUnZm66B5hJtRjAaeYCMd4zLsYoZmawMLWH5T
k8MhocrSVmo3wEqT+ng0zRP0EqmYWDMXXgEurrqyV4BD8x+RI7FW/wNamai1MJpR
QqzhPmHaVmd8Y2IG6r58wUY45CbkUVMj5jvgcFOmUQZacaqmf1SUJqYLT9HkDvxD
JTe57vBvdczjwbucCAzVuNd3jP0unRe65VryUr3sheZEfKWhN6tt1ZzGsRIAIFps
M2x66/eYmn1/M1/5G4T21mA5E+fpLg==
=b3j+
-----END PGP SIGNATURE-----

--mSJ2Vs6vpLoMhbcO--
