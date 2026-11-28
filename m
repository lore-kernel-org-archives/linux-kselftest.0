Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880480;
	b=aPXSgNXPbjUkHIb5VL+XnyARvpcS0lidnwJjHR/ETKVbQaJ2ByzOvmt0WG4CDjuHD51J
	 CH2gXgnEJr0ZiP1FE42OW8U+gM9ILJg9EzI9LdRmnZbx+Vbt+CAuEfc2STW4DqUfklH/W
	 o3Ur1QBtpPABg8GKdUqKkI8LOjXRsOixDNb3I3TZe4TG+q1+qxbLMLcoIkbgiX0tqdG9P
	 CHNXjTVdGObX9WrbicXeBIb1a5bbrIbCLodXlME5H+VS4jo2qvyDdb3jwzj5/QXqBcDsy
	 QeF9i7zxklrlMOzWaGhs8OV5xATCbSAlk65sPfWoHmTuqTsI5BRGUnhATIY+xAzBNjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880480;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=4B/NrJdYHvz8ov3+2u/9Hy36CksBKWKQbeK3Duxn0Cc=;
	b=OqGJ9XRTHGtpr2G6ItY7V9E7YSe2xhYAmxj1cEsL69sFWAIx1vt90abmjk4ILhjOv4Bc
	 jz6fwLYNm/UNR0M9xoJqe7/mE0UnR0r6OfPlCgCNAIdmrg19fKdPn216jWm4Fp8z7P77M
	 t4a882+KJWZ1FWl52qQdKb+EIhKrJmQezWvE64TCM1Uf4xWYeytsDufyVO2pJglzD+frP
	 CMt3fk56VP7qYeonZ5WSl5Bii5WxivaLAUMrxVBG7X+PdQ5GFzcp1YaoYn590g6gW+n++
	 KlPxVdC7RMBnqgdhYKQ5k4sR6qjE/rkNZaLYY3lF7DSaD0TJckdN7+lHvyF5VCPSebA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PRFi9Z8K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B6A606A31C;
	Sat, 28 Nov 2026 15:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PRFi9Z8K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B8F1F00897;
	Sat, 28 Nov 2026 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795880480;
	bh=4B/NrJdYHvz8ov3+2u/9Hy36CksBKWKQbeK3Duxn0Cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PRFi9Z8KzPpXgO2BsW1Zr7hSqzytN6JhTfEMw8KiznRnoXuWlP8+P3cxEN+ZQnd6I
	 fJuUJJBRFYsyfJHviWrqlsQtxbqXliXR3C/kiYqeggprKylrYD+CCdufhsF8ZHpZQI
	 D/wZpDE0p0mOO1GVnFJ2O+7k1F86YW69PshCnA7n12RJjpBX5EaTTdhWiLb5mP27Zn
	 Pxd7eIOy9bErfRZirrFTJfT4BjOqyy9gy7FuneU65krsNJODDLN/J+B8Yki/fvl5lW
	 MuBH/R4ORVbTnODl/6GkuREyFDZvckR7JOyUq+cMNyb66RCiNB25YJAArT6AMWeZEP
	 mW/BgvEjnDEyg==
Date: Sat, 28 Nov 2026 15:41:15 +0000
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: tiwai@suse.com, perex@perex.cz, shuah@kernel.org,
	ivan.orlov0322@gmail.com, ben.copeland@linaro.org,
	linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] selftests/alsa: Let the pcmtest test run on
 kselftest kernels
Message-ID: <bcfa8762-753a-4f9e-8df0-f8aa83559132@sirena.org.uk>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
 <20261128065228.3628550-1-sammiee5311@gmail.com>
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
	protocol="application/pgp-signature"; boundary="ERnR/9DBvAT9Q70g"
Content-Disposition: inline
In-Reply-To: <20261128065228.3628550-1-sammiee5311@gmail.com>
X-Cookie: I'm a Lisp variable -- bind me!


--ERnR/9DBvAT9Q70g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 28, 2026 at 03:52:25PM +0900, HyeongJun An wrote:
> On the kernels that CI labs such as KernelCI build for kselftest, every
> test-pcmtest-driver case skips. The KernelCI arm64 kselftest kernel has
> CONFIG_SND_PCMTEST, CONFIG_SND_SEQ_UMP and CONFIG_SND_UTIMER off, and
> nothing would load the pcmtest module even if it were built.

Reviewed-by: Mark Brown <broonie@kernel.org>

--ERnR/9DBvAT9Q70g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsK9hoACgkQJNaLcl1U
h9Beqwf+KRLRuxqHvtMvwUkJ5TKHW2USV2IY78pY/MocNkcUeai7jFnOYQKEI9GU
PbNn7O+RTf0es94AUzLZmvempI3XqRlRBQx6DHL1ePE35clBo2xpgrkFRWCi4pvG
IqiCNoZ6LiO/HzbPElhBvY5D+W1ertDSBDX1AB8KpnqHZkSw59HbLMh9XudY5TiC
QYscZdRT0yhUudhOLcmDafxPipo8Or8gIPnaKXk8lkKoGECd2DSeIAt6ylefLUWW
Eacv6UvsTDCrOFXU0D7ujiFWB6lfnb8Q7YD3vqJLvI8YbrzL2kg0rNckOxFx0U5X
dzM5XRVTsj/V+TCYwBNlYxOngPbvpw==
=t30Z
-----END PGP SIGNATURE-----

--ERnR/9DBvAT9Q70g--
