Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C10749B5C5;
	Tue,  6 Oct 2026 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791298890; cv=none; b=hRluSJF8v8JklVbqlgf1AKB3AlueqeN6lqdc7I7LTyqF0yk5zaXeFhr+HMGnJ7XBd1aEnuEhbvlZVaISBzaY1JrF4uQ6MNdzyOidJ87OShI9f6QigNzo8cP76bZ4mIFAiXjc047lEDD5QdJhW4yti58g3AxhAvBkzkVGEmgnCRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791298890; c=relaxed/simple;
	bh=vKUlAkv9kE2jfuS5he8GuXJYsMBv8JxaqPzw/w2RK7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2c+9xxQ0PVL76UfK6HJDXpOYYvWSsnOeULEaPgs0YTcl4YsbZucXLlWNqgLe1N8SZzKnODRuTfHuLnc+0xiqbdIgVFTc9OhIrzpmifSAb5ObMqu1U3P5NH004V+dGmEeFXGW7K6QBvZ776emQVgcwWbWlvRyMCrFtc6jUNdQMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9P9NTJ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9P9NTJ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BF11F0089B;
	Tue,  6 Oct 2026 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791298888;
	bh=zP7bMLfk/y3kcdTgl7DbKryqJaH2lXO8Bn7/SsVoFtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A9P9NTJ2DITgGi7O1t/cEg7rvO7Nk5MQywPHqp0ukCx9CMbFC4b+tv4jWlIGjt8LC
	 WcCShLyQuWtxeSKpFvWzij97IKE78K2jiev2wgaLPGTAsVDyMS9OKvbStox0G4Gny/
	 sZGlD71l92zxyuGpUtzmosHzXjU6aDNx4C1XOaG7U1x6uuIiwNWtO57jW4flC0MR5z
	 +uEFxL8BOSz8+PP0mK/mzyK1Ec/q6aArxcH6+pGvKxTorSdlGTYB4uOO2JKkpwr6uL
	 SHeDJ5BvLDDw8Va8i2Yd9TEgUzf76cfb/8UAEBoFAJF2zHkuRv552SehMAXqrWUj4M
	 aF2Bk9ax77DDQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 383CE172A99A; Tue, 06 Oct 2026 16:01:24 +0100 (BST)
Date: Tue, 6 Oct 2026 17:01:24 +0200
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/arm64: Check for -EPERM not -EBUSY in the
 locking test
Message-ID: <asUNRLuW4-zshydk@sirena.org.uk>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
 <20260910-arm64-gcs-lock-eperm-v1-2-d88e51855c9f@kernel.org>
 <asUIxt-XzxfWBW4N@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WTcFK7zLwtuPcd2Y"
Content-Disposition: inline
In-Reply-To: <asUIxt-XzxfWBW4N@arm.com>
X-Cookie: Use the Force, Luke.


--WTcFK7zLwtuPcd2Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 06, 2026 at 03:42:14PM +0100, Catalin Marinas wrote:
> On Thu, Sep 10, 2026 at 08:00:41PM +0100, Mark Brown wrote:
> > The API has been updated to return the more permissive -EPERM rather
> 					      ^^^^^^^^^^
> "descriptive" like in the first patch?

Yes.

--WTcFK7zLwtuPcd2Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrFDTsACgkQJNaLcl1U
h9D2Vgf9F8JtWBoktO7Uhu1XHssouxkmCvbDMt0+2dsV3P0CsnBTKlfKfVA0Av7p
ZTyEwDnIUm8YL4u3swJabYZO6zhbVnfMOJ9gFeA2k6eQ0xJOnHccyyMJsvCt7MN7
t87pPnXvEKoOom8Q02JpzfVTyO6RkSK14YuR/chrioW9KeYHq21/bjguDcF/K02/
uCLLqFLO41qlbteL3InrkjmfEAJqgFprIfaRCvu+SyOJWtsWJra70hoptjONgNaB
32iq21C2SARArB+m3d242txTFkGcQOIINt3N3iJvA99k+SMA2l+1LJoTou2Tpde0
XVBoE2PFpojw508zy5lNYW1a/YEDzw==
=JIsD
-----END PGP SIGNATURE-----

--WTcFK7zLwtuPcd2Y--
