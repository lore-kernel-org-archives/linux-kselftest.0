Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8E2486BB9;
	Thu, 20 Aug 2026 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787240646; cv=none; b=eXY2SXq+8xG92ObbaYP0nPvsYNfrNfqiqx50B3PvVKc99CN8FT3wOuTTNXNsRKqhoTwwMvfYWR29moxae3jFGL7f1uHPqPomuwDsYjnEVbg+Hq7HpIaoXzubSbZkvZkQK7Um84o0yIImaIdgJlyH7JzBxdua+qF6CjMdvoE8pv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787240646; c=relaxed/simple;
	bh=Af/3a02gFtOQgf3JISwJq466Y5Yg6W9YD9lmOHnq3gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/HiJ7MzoWDEfg+pEo86N6Z75MqL/xcWieibhHC0T5i+b8+JgU3u58gbP0Hf9y9lZRcCaYabHaGqv9W6x/4XWNExdEBMIHgLPqNupnpn0vvO9HyKYoe5XgDDeTY/CYvZFYp5Nd4AoJeXHv+MpHnpWjfkPrAnlGqRccdMbsxcqTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l11FHm9c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l11FHm9c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE4C1F0155D;
	Thu, 20 Aug 2026 15:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787240640;
	bh=odJWFvSgn+KXHaxCW8IvbQmBY3gj6jGkAqHSJNkE3wU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l11FHm9cCzy74FV08pM1SJv/nep8+oScM68U0SKAsjAPRfp55KzyZelt7TZxRGUrj
	 OQfrAkd4BXZmckHd0qUSzKmr9/DRseIZk7he1jNGb4i/3qQg4DuzASqZwwztebAn34
	 U/bnNigWCCzXFuqi4zCq3VnnZPHTP9jO2FNS3SA/m0swkmqJXwujFiWZGhPGuPiLBn
	 ZH/zC3FcSCFyXEFSn5j6p8vt1GvvlAvNRudaTUngUuwxDM9/yzS7BIIVmgI6s01l8n
	 G6bD4Uu334ghP3RsN12F/FBqocDiX23vHSV9EKN0Bt0fQE//j+fEoj8KX7YSQHaW3W
	 uRYfEoHcFXaOQ==
Date: Thu, 20 Aug 2026 16:43:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/4] selftest/arm64: Print TAP header
Message-ID: <39de9ea6-6963-4373-a87d-3a39a45ba4ba@sirena.org.uk>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-2-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Y3vnbzQu9pMdS1o"
Content-Disposition: inline
In-Reply-To: <20260820153331.2448875-2-usama.anjum@arm.com>
X-Cookie: Happiness is a hard disk.


--1Y3vnbzQu9pMdS1o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 04:33:23PM +0100, Muhammad Usama Anjum wrote:
> The test sets a TAP plan and emits a result but does not print the TAP
> version header. Direct execution therefore starts with:
>=20
>   1..1
>=20
> instead of "TAP version 13", leaving the output malformed for TAP
> consumers.
>=20
> Print the kselftest header before the plan, matching the other arm64 MTE
> tests.

Reviewed-by: Mark Brown <broonie@kernel.org>

--1Y3vnbzQu9pMdS1o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqHILoACgkQJNaLcl1U
h9Dn6gf+OEjhg5b2xlq7bMYMtV4zEEjB542k3UTiZQkBj2wPob5Ge6LT8pG7JWhS
yWzw4oHCN5Jg4MQRKxcIwOx/38uTnT9WkZW4eg9701noOyRDE/1nBVB2hBdCEld6
ZglQGi3+qGtmcJqmh92BORnlLRjBmT2rjgmz6Ax2dmJLabBmGM/nxrjJmOoSLW0h
1RcXrBkd8GtkmrCJLoj8XogC+ijxyGX9JvSBRxFcy6s6pPtX1IjMw6voiIQAehj2
h8bxnko8Yf+k1wuBoKf3bf3VA87GqNpTfWeKa4XdnpxA+mFlTfDtUrLUzVABrXV8
x8YKVcbles8XJ6qO0vvxjXeoIqZM2g==
=frCq
-----END PGP SIGNATURE-----

--1Y3vnbzQu9pMdS1o--
