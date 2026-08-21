Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3481243712D;
	Fri, 21 Aug 2026 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326992; cv=none; b=t4j+0k/HUzuBwUA4QvjjB4fgfK+B/9jIfnh6NkIs/ENp1FKt+qox6chxu1Cz7FOIf+amNYB5YutoFU8jAGz6hjkB+1EKrTJZhAKYVcqAN6LAdhYW3r53q9pAogUfcIoVY4bLz/14FwIh4+0HEYFRO4uOilAmbI8YXf/FBcXi8Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326992; c=relaxed/simple;
	bh=B5vHO9/0mpvQu03+rqQ50y+nJYR0e5RTn05lMefE71w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvPewG2VwAsZvz7LJxQvFJG7hpQo/sBDriPxuKZZokP+to3rhB/OSHFwqzG3CFG0aKs23BcDeYXrrNdrs9HLi/VRCJM+4H3mZ36n0OgBtPSiOYjmVHbRWB0caYIftQCupulA1A6Ndtx8CmaKAz6MHkYjxjZuKAiuKbPPYnUKbGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrl3XYKF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrl3XYKF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4051F000E9;
	Fri, 21 Aug 2026 15:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787326990;
	bh=bloMdIx1erIxNEo6r5ccnCWGkwjtqp1KC4sGsNoKRCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nrl3XYKFmIFu+1hP2ijxIdOKyFmsG2Jq9bgNDI96dsjzOqx47hIL/R5gZAe5Qld8X
	 kKra3OiiP8Hws5o7Ch9sIr2QRFxOc48dAyCdFYA6EsmDi+6KM9op0i02ft10+qcEJ5
	 kkBslkpoBjRdPhg2sfelFCci0Pwdt9BoBLuEdirTmDyhfp0XBCwW1CNE9+j04nbjup
	 R701wcm8KKbXNpgjeto5IssdtWnxMpaQd9LKfiv+UiqyPkwGhYVn2Qrf8VIZDTkH08
	 ZjiKJD1Z23fxG3qeEUjBup29F54DSxTmZ3Zha7uRmiB9tzcfG/DJNfkL6NlLQppqsL
	 iOvW+B6DO/6Fg==
Date: Fri, 21 Aug 2026 16:43:05 +0100
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
Subject: Re: [PATCH v2 3/5] selftests/arm64: Treat KSM merge_across_nodes as
 optional
Message-ID: <918c46fc-f6ca-43a7-9629-0d8abb1c1e54@sirena.org.uk>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
 <20260821141556.4065894-4-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kglZDEHs6OmuKvS6"
Content-Disposition: inline
In-Reply-To: <20260821141556.4065894-4-usama.anjum@arm.com>
X-Cookie: Package sold by weight, not volume.


--kglZDEHs6OmuKvS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 03:15:51PM +0100, Muhammad Usama Anjum wrote:

> +static bool merge_across_nodes_available(void)
> +{
> +	const char *path = PATH_KSM "merge_across_nodes";
> +
> +	if (!access(path, R_OK | W_OK))
> +		return true;
> +	if (errno == ENOENT)
> +		return false;
> +
> +	ksft_exit_fail_msg("Unable to read and write %s: %s\n", path,
> +			   strerror(errno));
> +}

If prerequistites for the test aren't available I'd expect this to be a
skip rather than a fail.

--kglZDEHs6OmuKvS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIcgkACgkQJNaLcl1U
h9ALkQf/ZCJ29Aa9p/LhguuXln2b5yf1sALxuc/dqCZcWcS4tCu232TPnpB48Skg
YTl77e9f+duMFOuKabuwuopz7r7EI4tcIGFR1vkw0+Y3A3h6JpHwdCgo0EB3lww7
d/ag9bMjCpyzHy/pSzytYu7Zv21g5co/CMtWDZhkgQpBoAZ5EZJdLRGdGiaRqzXs
xlyymUIK2FFSRo+XJ/4AlRPwSmHAXGY+WCm0S+MvI7w9rXZYQAR3MHxOVwS1lTup
P6Dl1wZK7BOrCPaweXvWQ7n1Ts465xLcbkn/y8rmzFNsSCaNA8yRW6Ktx/iU8Qtk
gqSziD1ZuEwvUmR6D4aBIBRR/GJBqQ==
=PW0u
-----END PGP SIGNATURE-----

--kglZDEHs6OmuKvS6--
