Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525F53009FA;
	Thu, 19 Mar 2026 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920182; cv=none; b=Sy/fRKcbjaqT/nUfEQWSHQQpG54Iva8RYFARVM04yMJaQAy4nEsHjhe24Ho0+dpH5dfhoaQT0A7n2CuF6MLcPpVtEkzOqY+bcyeX6iOGDcgozL6QNoTb74tT+RzoQxvm5EPn2BcRLbtfyTtdN5Bjyg7ZC+1hz0ZXZk3iS4mIHKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920182; c=relaxed/simple;
	bh=mI5Niued13lWroralkbRCKzUCQf0t2KVY0BX5P2HIXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTTMjbVycavxLnV++K549EpTjv8Q2vCE2nxp4qRszpY20VFNgJkA2/fHZRj72e+7Gy6KXjpjvGy0nIz7c3N5REQzu78MloK1mT5Z22IQvyWFn8CDnkXfwt0GKg6glgthYqCiEMbDlgPGy01c8kE/ej84922HZggxM659vE4YQk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHpexXCk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHpexXCk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33C5C19424;
	Thu, 19 Mar 2026 11:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773920181;
	bh=mI5Niued13lWroralkbRCKzUCQf0t2KVY0BX5P2HIXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHpexXCkQZc2a0WGs+u/3+2VTNF+KRD14kC2QA6c7zMjyOUx5myQJvh+vbaFWZZYI
	 PkDz/dVqJSKLgdrb+NN70uG25yNaA9M44vKj/kQ5GuwdfYH255ziQiAmi1NzOzyZiJ
	 /8WTsu6NNVkJqRCNl9+PcKKKxtLW4uvNoGVSw6pNX0LAejWDXq5WzhGN672Azj4NhE
	 b+jV5GgVqsJigImfZfeZ3GkF+E+7TBdg8GVwGOPg3Q1cCGDeRIsR3OB/kk5mv3/J0c
	 u9tFsLou+jwl1UTMJ808IGY/4gI2T5SnbmogIj90tKX6dcA8qE0JfSUoZ3pwacu1ZE
	 rhZOdG1Z82C7Q==
Date: Thu, 19 Mar 2026 11:36:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Copeland <ben.copeland@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: alsa: add config for required kernel options
Message-ID: <0abf3675-886e-44f9-a9f7-d9198b66086e@sirena.org.uk>
References: <20260319084347.134744-1-ben.copeland@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kx5iu//9ocq2fYx+"
Content-Disposition: inline
In-Reply-To: <20260319084347.134744-1-ben.copeland@linaro.org>
X-Cookie: Given my druthers, I'd druther not.


--Kx5iu//9ocq2fYx+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 08:43:47AM +0000, Ben Copeland wrote:
> The alsa kselftests are missing a config file to declare their required
> kernel configuration options. This causes the utimer-test (timer_f.utimer)
> to fail on kernels without CONFIG_SND_UTIMER enabled, as the
> SNDRV_TIMER_IOCTL_CREATE ioctl returns -1.
>=20
> Add the config file with the necessary sound configs so that
> 'make kselftest-merge' can enable them automatically.

These tests fit awkwardly into the config fragment stuff, since pcm-test
and mixer-test are mostly testing drivers we should in theory have every
single audio driver enabled as part of the fragment, but that is
annoying to maintain and bloaty.  Fortunately people usually put these
in their defconfigs so we actually do the right thing in practice most
of the time without the need to build a custom kernel.  On the other
hand the test-pcmtest-driver test requires a test module which *does*
need a config option so it requires a cutom config.

Separately to what we're doing here utimer-test ought to skip rather
than fail if the driver it needs isn't present just as a general
kselftest style thing, I see it's not doing that now.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Kx5iu//9ocq2fYx+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm7360ACgkQJNaLcl1U
h9CVzQf/Q7nlYX1wL0lRpQve3LLU1B1wDKVuqUi3J0Qm6abmoWQmskN6oqpt6iBJ
WMF2nL6i9Q+ClABE094gmKdtqgICw9Pl51+66+hLlwHf8xoChYbaAK+qA2lgw81G
pldSA2lPiFEk+8DlNFiTR6cLLd6C01H+mtGFAbwqlGdAqlY7ZOnSqKyJOv8DBKnc
GYSGI4a0ui0ZXNQn8SY0Xsj/JR9N9vMZcLQ7JnUK5x2ENPnwLWSOQBqN5sQxLxYo
UxgdNHwCWxZMVmNkILvQ7lBe0KQ/lXjVHogKfhhbQ9cgSFtT5zU+/w75DNd8bIHG
rWfX/W/XjGA5Zr9G+XrZAVRJGiowBQ==
=wpOt
-----END PGP SIGNATURE-----

--Kx5iu//9ocq2fYx+--
