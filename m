Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8934A361940;
	Sat, 26 Sep 2026 16:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790441738; cv=none; b=nJkmQ3u9VMbkheIsD2qcLt5ggtWV1TcSZqO536oOFGz9N7sSLuef+O8lodsGL8PONGS3yIQZGj0g7FjkSvzt+fRV28Ng+5XYm122UI4WzlE8+W3XFF3qT2OwUrPg8e/OAJ3ZpLh5OI5/waFVdQnxcFxJhVZV1Pg1+WMa5Ur+kl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790441738; c=relaxed/simple;
	bh=CqvP7gf2Dq7rvjICIZzTaMz2GgkhJDhdjg8YLb2Ql8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaVgunRt5f1JEUWLUqECw5VlnUZdeNnrRNa9Bq/SuO4cKx/yckfSc4egK0XEAOJbi7u2oe42ulombj3lAV19Am7I7a3jSFgPB/cPtBX46zsC+HVdhqm6pkj+tm23kgTcZr9VzNMIDBRMAD4xvVaOn1BwKT8X5CoZ732Q2p/uHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkIulwEo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkIulwEo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B641F000FF;
	Sat, 26 Sep 2026 16:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790441737;
	bh=HjCztDYloo8Gq2CmHiYQoWS93PLouDS1at7hq64aQWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jkIulwEowEWqBhMVaWgL/0jaXL5MkxmJ3nc44StW31NdYzyA0SiRtWof7oxAcRXMY
	 U/W5IumWU9L1SZjFo1MpMW83a/3CmGFIiIQ/s/tqpj40tfpWMdmVqaNQ9B/VgT3UkX
	 DCYxyyTW7LDAkskdxUzmrInIQ5JInqpbjizDfFlmJqCV4VztWZdXoXnkeWRNZs7Mz9
	 f4eBxN7qCDLi6eVEfCaDoebG55M0g8vo+H4IiAGvhzXOUCbnv99q1HHZieng1DLyED
	 2tbdZcMu1k5cKVxID1xbWy22KJ9NOdIV/DNS3K7pSGwhSuxwayYNhDA/YH2OSVQPN1
	 CIQj/00I2EZgw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 99ED112359BD; Sat, 26 Sep 2026 17:55:34 +0100 (BST)
Date: Sat, 26 Sep 2026 18:55:34 +0200
From: Mark Brown <broonie@kernel.org>
To: Alireza Feyzabadi Farahani <arfa79lg@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>, linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: ALSA: Skip tests when devices are unavailable
Message-ID: <arf5Bp6v36JoNH76@sirena.org.uk>
References: <20260926095756.2051290-1-arfa79lg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D2rAHvqMhlmFtLx+"
Content-Disposition: inline
In-Reply-To: <20260926095756.2051290-1-arfa79lg@gmail.com>
X-Cookie: Orders subject to approval.


--D2rAHvqMhlmFtLx+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 09:57:56AM +0000, Alireza Feyzabadi Farahani wrote:
> A kernel built without CONFIG_SND exposes no ALSA devices. In that
> environment, the mixer and PCM tests currently report success with a
> zero-test plan, while the userspace timer tests fail when opening
> /dev/snd/timer. Neither result accurately describes an unsupported test
> environment.
>=20
> Report KSFT_SKIP when no sound cards are detected and when the timer
> device is unavailable. Keep the PCM missing-card failures when a matching
> hardware configuration says that a card should exist, and continue to
> fail timer opens for unexpected errors.
>=20
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D218479

The timer tests are clearly a good fix here but the other two programs
are a lot less clear - they aren't reporting any false errors, they're
just reporting a pass as they found no sound cards and therefore no
problems on them.  Or to put it another way all the available sound
cards were fine.  We don't know if this was due to missing configs, or
just that the machine physically has no sound cards (eg, a VM).  I'd at
least make this two patches, or TBH just leave the PCM and mixer tests
alone.  They certainly don't have an issue that needs fixing in the same
way that the timer test does.

--D2rAHvqMhlmFtLx+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq3+QUACgkQJNaLcl1U
h9CXYQf/ZciubfZTlExAKfqewMjkhfZgA+oy8coSJ1uxLUFRBPXt3E6Jf7kuCEZI
ceW9a/bnk6av+s54Df96YwibjQBK1hgWyktKsR51i/cs0KY3WrONHW3QXm6lo42X
7rRguyFs0TIAsiv1cbTgMeSMtG7oHQfQxTzSDloSrU64l0bmIIEyR1gOh4d3tHK8
fWYQHBqwyqwrF5V+MPj+A8etHi4UWVYJzdjSwx1wWX2SXY2tW8YZchfbv//Vi0xT
NXPuBzI4tuIYidLoU9DGDcY92r0MTbPuD0Gzg7UPg8TaB8ePCwzQjHFVgwOIGQqj
q/w7bJ8VX08jqtBHwfq9gJWJ4r1/pQ==
=6Pxc
-----END PGP SIGNATURE-----

--D2rAHvqMhlmFtLx+--
