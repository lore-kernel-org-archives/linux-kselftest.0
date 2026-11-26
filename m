Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709496;
	b=ChIYswIqv7Eu52Mb8H2J4+zg1hGENcQJFhCdKutwoSkevn3zKl0AJ+cCmUb9Lrpbu89h
	 XtpWk6l3fzUDZXhy9F6hsCLSRxlyTxWDSCFW5vYqVBHQpX2YhikNpjHHZqRHYGDI549tl
	 34cebYEzF8q7cR0FASPTWu5VNuGaDSlnLQkM1EjBSxD2Y92qTWuOacJOutr2bgfk9XDgg
	 vhFB0Si2pjOABZr9pUBd3F08s/mpoWZWhLhaYLgNT6baY4OqViEreP4+Zm24mfVkQBmf1
	 0u4HueOdEzuKw6CzdzF/8rUvz2AyIBIwocuQT7MqytFXHEWl8D5QUHsR8j3HREDuBOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709496;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=PndWGLfIPHhkLT7wWeXkF6zasrlrMwqpJFZ4kXLIVgA=;
	b=ocCedF8qpda81woycYt/HRmjvaxzPafIn+80wKypbQFViufKrV2FvGBaEhwsQCl1IqB6
	 OVkkF3VkACUpHV5B6B2vKOsbN6nfMGY2ja9CnGtRaPOla8ej040wgWlqUqUwP8KboRNa5
	 4iqxTy31oXGnL/ZVBrhGFazC614u0nEfFkSg3kvoU1S0vgq3/oBxofmYTZtGCJ6Msphrb
	 zGFOCVU6rf15EjRgjog9uci4jrweact5+E4hWWUqL2TU8ClPh7u1YpNyIonrYdB3OEx95
	 c1phrEsn8BsESdymMQaIeDY+ONwG1HoupO3yU/edmbGov7vtBEFM66Qc9MIIb9e5D5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qv7w+0cL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0656C606A31C;
	Thu, 26 Nov 2026 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qv7w+0cL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A13E1F000C6;
	Thu, 26 Nov 2026 16:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795709495;
	bh=PndWGLfIPHhkLT7wWeXkF6zasrlrMwqpJFZ4kXLIVgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qv7w+0cLz2JdED5tHUu2UuErAR4/SBdDlCw9fF7lO83ZiDTnz+W2PuzJ69iEHagZp
	 9glRJzWCg23UObMuQTGVd3HYahaNBLJqZzKHvsMHFx8fEYVe8M+7RHeQNzourpXhLb
	 ABtqsIAjYqeDyu4/rbufAlLmM3PJliI4VxGej8zSrq4l+3NkZDMHbUU/DuIfQTGCHT
	 sN9rgySP1Tn2SoKiqoJiVK0pbAHwiNB/YOHCjBdfm+WCNIpSGdzriSAVLXWVGiLwN6
	 /yL/5QWlzgbDQGrKtWPYthWkRsXncO85SokFUP++grCoMUO7ysxYL9Ex+4RCd4/IOx
	 LwysMme+JO6fw==
Date: Thu, 26 Nov 2026 16:11:31 +0000
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Ben Copeland <ben.copeland@linaro.org>, linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests: ALSA: pcmtest: Load the module when it is
 missing
Message-ID: <bd9dd7ee-a946-4901-9c94-13fdd35523d1@sirena.org.uk>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
 <20261126035526.1779288-3-sammiee5311@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yW60I46ndAXTBx2V"
Content-Disposition: inline
In-Reply-To: <20261126035526.1779288-3-sammiee5311@gmail.com>
X-Cookie: Sank heaven for leetle curls.


--yW60I46ndAXTBx2V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:55:25PM +0900, HyeongJun An wrote:
> test-pcmtest-driver skips when the pcmtest debugfs files are missing.
> The driver has no device to bind to, so nothing loads the module, and the
> test skips even on a kernel that builds it.

> Run modprobe once before skipping, as the net pktgen test does. The
> module stays loaded. In the default order the test runs after mixer-test
> and pcm-test, so the extra card does not change what they check.

> @@ -171,6 +172,9 @@ FIXTURE_SETUP(pcmtest) {
>  		SKIP(return, "This test needs root to run!");
> =20
>  	err =3D read_patterns();
> +	/* nothing loads the module on its own, so ask for it */
> +	if (err && !system("modprobe -q snd-pcmtest"))
> +		err =3D read_patterns();

It'd be polite to unload the module if we caused it to be loaded, though
potentially more trouble than it's worth.  I'm also not sure if this
does the right thing if someone decided to build the driver in (to make
it easier to deploy onto a test system for example).

--yW60I46ndAXTBx2V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIWjIACgkQJNaLcl1U
h9AyNgf/Vav3oI4f/yKn7v2f8IMW0a2ujBNxDys8GG15Vy0bQr0u4HKph3pQKHH0
RilJbSRzLg4R3QC6j5MQjHc5TuOoIQGF3HNX0c4vHhft6ZkRNYP2PWkvgywsJPqE
2OjdsvxNDK1Tmg/pWx2umwM2Q29++KgLCyRYImaYj13jIoGqmlKOLe8R0aN5GhhX
n5sZ4nmU2T7NA9jS2Sbzudbt4POpCFaDUduw3wU8a4Lm3M/w8OU0smZhzQQnIYEA
FVI2pZMEBpwV3R1j9Z50XtWHEsqTqy8Dpp8rRkhSbZIq1rAr7qigDiLViGVcWqH1
hG44k0NXHjTMgYTga69VqXyhmEE7cA==
=F4/q
-----END PGP SIGNATURE-----

--yW60I46ndAXTBx2V--
