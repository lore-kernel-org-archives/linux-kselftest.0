Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066455;
	b=yhsX+/QdIVP39Ww5TH8RBStNbsqbuPbNS0d6FglIC7oyWI88dV8AJF9814Yre+w36yHu
	 7FTDetZMeuaks/sYRhZmyCUALw3sPBYh4or7blxtxZ2NmOsQrw+TQTbvurwb9bJoA9qPp
	 5pIgv18Tl3cYlk7nRSbwbDxrX/qzXw0095B2S8zNzu4ydC3FDmQ60ar6kxHDF8jsK43i0
	 9t/jmupmRzzoHR0aKjS7y2e9u0NHJ1s3jkQ0fmvV6+7HpssPthnW6HPJL8WrM2tOEUVkt
	 za1aOaaw7bRPxhcxMAeFSFqhAWw/O/ZDpEkythtabvTFooAfagChUZE/9S1i/ptQKsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066455;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=uU7D09cq1ks/B8NMKh/1GkJKltkQ8t+g0nFELK0yHN0=;
	b=HAvPTD/xIpN9Vcjim638JqDfNMLFm82wpf2A/O+Twh9M56qjS3Ukdg/P2i2wO2s176Ee
	 MbQEbnEJOfW/uCCXoz0YJRTyYGHVHapF5K8bUjhDXDCO8BmP2sHEBzA2/cmheU18PCOTG
	 Q5ZtVAEPFMqc0RmumZc1kXY8wzHnLzSA10DvWN4MtbPtzugjO8cBPfaSO7UN0RNw/IrfG
	 jubL6uxHhJ/wUUf6Z7Ge0OY32BTBY5bdPntft/es5G5DEp5EjSE/p0jReEOprgoSNvuUu
	 gv143Csmgv6c5drQuk9MFyM4Vy5EUSNYwx8Zxp23wKS1z6xc8w6yfAHqpzmhPC0aMeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pd+jSCEq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED73606A32C;
	Sat,  7 Nov 2026 15:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pd+jSCEq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACAA1F0089F;
	Sat,  7 Nov 2026 15:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794066454;
	bh=uU7D09cq1ks/B8NMKh/1GkJKltkQ8t+g0nFELK0yHN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pd+jSCEqzt+s65ZxJxE3uVJgK/iRybEl4fjTcswy42q9ilr8BxsqAZ4OlFuPvFS6Q
	 vRBHpdppI8PwtgUmH3yK3ugJrRyRiQZNFSSIlMVy65XxYKYYQ9O9lkZdDJmSkwzAxX
	 ylx8/Uj9kKz0Y1zzZrQfLTkqcO9a1sxu13YHT58UxHmYWRAWrpuHf/USRfyHz89Ysg
	 0A24AdEQe0kOHKJLVHsAE20/4d5FMjWNf3b9ea695wzg5x/mlL4Fvc2GeO4sG0hhbj
	 ugP2tfmk4WX70fpdsZ6I9kjNHQS3REWGLB9FMgapWyfqrz2AnQ2JE0IkxnnkHCAr+9
	 g1ovDnVeHeeIw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id F3BEA2AB38BF; Sat, 07 Nov 2026 15:47:31 +0000 (GMT)
Date: Sat, 7 Nov 2026 15:47:31 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Iv=E1n?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] selftests/arm64: GCS must survive io_uring SQPOLL
 worker exit
Message-ID: <c85236ec-26ff-48a4-b520-dd4d6761c6c0@sirena.org.uk>
References: <179330742036.2531571.12603232226357262067.b4-ty@b4>
 <20261030170046.439736-1-ivanrwcm25@gmail.com>
 <20261030170046.439736-2-ivanrwcm25@gmail.com>
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
	protocol="application/pgp-signature"; boundary="SZxYcYud1/U/NOA6"
Content-Disposition: inline
In-Reply-To: <20261030170046.439736-2-ivanrwcm25@gmail.com>
X-Cookie: Whoever dies with the most toys wins.


--SZxYcYud1/U/NOA6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 02:00:46PM -0300, Iv=E1n Ezequiel Rodriguez wrote:
> SQPOLL threads are create_io_thread() workers (args->fn + CLONE_VM).
> They inherit GCS tracking via arch_dup_task_struct(); without
> gcs_reset_thread() their exit runs gcs_free() on the parent's stack.
>=20
> Create a SQPOLL ring, wait for iou-sqp-* to appear and leave
> /proc/self/task (close only queues async teardown), then check the
> parent ss VMA count is unchanged. QEMU: pass with the reset, SIGSEGV
> without it.

Reviewed-by: Mark Brown <broonie@kernel.org>

--SZxYcYud1/U/NOA6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau9IEwAKCRAv73Ows9A4
iVUeAP4+wDIv2GPKt+l2yTn1w5szvM1AJDSSxh8FCFL4sNAOAAD8DsKaoTX8S+f+
D2qSg3AzHbrDA/3xom8hGlenJvgi5QQ=
=rHeZ
-----END PGP SIGNATURE-----

--SZxYcYud1/U/NOA6--
