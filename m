Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709323;
	b=41PjhYRvAv3O29TyVt6/F4B4/KGd5KXqE/uOr5m++4VT+FgPTlzLYLPI62/x5witCLOQ
	 J+SPO7GRG4ITA1q+y7VG0iMRXliHT0wgkeBm7W3jUE85AeLP6yx4d8G/pUFvEKPTyCDPS
	 W5gWW4Vl+v7rQcM2GmvQq/YMWc+7bu2TK5dtjQoosYDM4mGd3K15kpKn5Q4w9mEGoKjFj
	 m51nAW9FvKaSOmRR+3sd20juPxcL8Eq1su5fJ2ngwehL20lexC5MSLjUkKBKL6mjzFppY
	 kAvoFW9I/xp8ad/OrBv2DyjPFvGQMK2m37pgCTJIpwSlUB5yOpRUA5Tg36tx+H2P+tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709323;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=wp3Injhh/MFBbtstffPrZuiHYV7Qum0oflqNQ19xS4E=;
	b=wsH4wE+/Ph5/QWyCIwyJXBtmTffeZLbxaOZIw41eT3icav5kLhFMjGA3cDsGYvbw523V
	 9NF6swR3XkuOTXU0ilXWg595MhyMFXB6H8kv9AtUpU7LBXHkPAksmp7hGpvsuc0sf4G6l
	 dUiY1mokX7wdYsPUtMu3SS4hjUG9iR0cnWDB5f4KvtdXZRGZKeL03M3AGjG7CoLcV6qtK
	 s6fFyb+FHvE/7u0MZYvnJeWicI73sN3PSSM9mGOw1tXHBq89qxxfDItrPT5Kql0GXFXCR
	 NSxbjFXDU7NxqlVSIURYslOn/FQzuFdYRy4TNXFuB+dXl4p+0F40F0hz8sWlRRzca+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hyhJwNyr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7031606A31C;
	Thu, 26 Nov 2026 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hyhJwNyr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9271F000C6;
	Thu, 26 Nov 2026 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795709323;
	bh=wp3Injhh/MFBbtstffPrZuiHYV7Qum0oflqNQ19xS4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hyhJwNyr3l1xBOpFqa7eE+S8KN+Fv0Bta2CVh/2bpIDZ7TNOtjKcmjrWq1PdgD9gs
	 EWgXbhsRGqGZ/RPQMtL/V+AqAyFA9b7MquQiRdQL1i4fZHDF5kaiCtSthRWirkJYNg
	 qKiUOLjnYtA0EEs5MN2NuNLlvXJtgD6tXj4b45/OU+06QHisDe3lZSClDkW7Q7Hd6J
	 2USAJpsqToOv4b/XEwFQxuGCI5mb6xdzk1ULVRglc3O7KYqbT/F95Mrk0YkTKiaAUq
	 uNdn9rPmt9jyc+FF9gsutZmDV2HUf31nelsv755JStygljBVJ8Fy7vwa5D+mypZWsW
	 bmLFzGKlF4DFA==
Date: Thu, 26 Nov 2026 16:08:39 +0000
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Ben Copeland <ben.copeland@linaro.org>, linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests/alsa: Add a config file for the test-only
 options
Message-ID: <1d2ca5f6-2751-4ad2-9a28-b9350f749640@sirena.org.uk>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
 <20261126035526.1779288-2-sammiee5311@gmail.com>
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
	protocol="application/pgp-signature"; boundary="Lq0ZRms84AuoS2qJ"
Content-Disposition: inline
In-Reply-To: <20261126035526.1779288-2-sammiee5311@gmail.com>
X-Cookie: Sank heaven for leetle curls.


--Lq0ZRms84AuoS2qJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 26, 2026 at 12:55:24PM +0900, HyeongJun An wrote:
> Some of the ALSA selftests need kernel options that a normal config does
> not enable. test-pcmtest-driver needs the pcmtest driver, seq-ump-test
> needs CONFIG_SND_SEQ_UMP, utimer-test needs CONFIG_SND_UTIMER, and
> aloop-test needs snd-aloop. Without them these tests skip.

> +CONFIG_SND_PCMTEST=m

This is inside CONFIG_SND_DRIVERS, you need to select that in case the
underlying config has disabled it.

--Lq0ZRms84AuoS2qJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIWYYACgkQJNaLcl1U
h9DaXgf/fnePQ0ZWeQxrTjHPAfnd6YC3rQy6Lx9Qxv6m8bOnMd+nao3ywyql5qDT
HuIyPL5OdTVdHCvV/DQjEpq4Lsp+gUgm56Pb0zR921iQ+VFBCfLqzGk2EqmRtwU9
jxKzF6dbwyR6H5y1phRLcauL+Nj5pjT2tH6+URWlJtrAlHtTHdvshNt+BhwopO5L
kkX47IHZTg6grT59fgy801fwpobT6MZrt4aaBLGYzgIHvz6844y3GyVFNiXGRfBK
GqpE4Hkjv2vB1t/5WvLLVaq8OhTvbb8RjpGl6VUWdBtIWdnfaf3WQx1UH/oRyk2u
THKlrjBR+1EEFXTDpxPsOCdIeaPmbg==
=wHTL
-----END PGP SIGNATURE-----

--Lq0ZRms84AuoS2qJ--
