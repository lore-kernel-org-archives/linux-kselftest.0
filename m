Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F9E490BFA;
	Fri, 21 Aug 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328489; cv=none; b=F+U8Lt+IVwMqYh4nQAkPYfoSRYwVOfBp2dBVWU/Xlriazxif1aZ+AgeNGXpAcugQ1QaFJPECi8eSV28pER2mg3mviPHv3ujVrbfYTm5I+QDiz1WJQlB42ZedvUL6Bslyiyc0CkfwTW4Hk96zys5gUgpVUiTkxowCyD7HyRzKnmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328489; c=relaxed/simple;
	bh=quCDSpU6BUwBXwCDVKaB8dpg8Fz9dYPX75IFlT5fHZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbYS5EiryoYaVkVg9SVWNqMO/UjSsflLDEH8EZT/hPNP7lh/jPs5KbpJRhXecgs9/BLRaEa1eCybS2urXmzKpNGebbfdoFZZDSvdoob1AKKs9KlYCjJzSWaUZQ1PfmNWUSLdaR0oNIrdgA7gTdwtuGYtjRUKdIU7do76UiLu+eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoRsmmw7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoRsmmw7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D851F000E9;
	Fri, 21 Aug 2026 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787328483;
	bh=quCDSpU6BUwBXwCDVKaB8dpg8Fz9dYPX75IFlT5fHZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VoRsmmw7Qyq8ye80DdDzNVQWPev2x6gZhwCwmujCXOLMOk6XK67XTqMb3vHNGE0yy
	 fMQ4obri3qndrvzJDfZqlxubSoUwwd91U08FYVE/7hy1XMuUum4WivvVXk1JQp1bIk
	 V7+V0+UjCBDD6i99FLk4pqBAX0ZrNgwZcofRBlAu38TFhvVsS3Hcw/lBScave0XNGX
	 7f++itfKpoc2vbapYG6HXdFu+eAW952R7xAJonEvPsn+dcFyXmZ7fWSzaFv9UYuwrp
	 n+DlcHaPoIXL2GtotjzL0Bk6aYUWAdalHFZYlrKmGJom32z0AgZlYGC046tUYh9jnM
	 Shuv5XOlNphWg==
Date: Fri, 21 Aug 2026 17:07:58 +0100
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
Subject: Re: [PATCH v2 5/5] selftests/arm64: Add MTE test config fragment
Message-ID: <7304e0e2-70a7-4953-93b1-dcf73b879a86@sirena.org.uk>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
 <20260821141556.4065894-6-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6R45SNmXiGQnf5lN"
Content-Disposition: inline
In-Reply-To: <20260821141556.4065894-6-usama.anjum@arm.com>
X-Cookie: Package sold by weight, not volume.


--6R45SNmXiGQnf5lN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 03:15:53PM +0100, Muhammad Usama Anjum wrote:
> The arm64 selftest collection has no Kconfig fragment, so kernels built
> with the selftest requirements are not guaranteed to provide the support
> used by these tests.
>=20
> Add a fragment covering all tests in arm64.

Reviewed-by: Mark Brown <broonie@kernel.org>

--6R45SNmXiGQnf5lN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqId90ACgkQJNaLcl1U
h9Dcmgf/QyTxw+YDeMZ55aWJgzR6bZ5u7TsuxAsv3Sg0nrV6C75YitWwJRgx7yVP
RJ+8u2KmnwIKAavwNmziiyhVYMT6ysITLZo9fdoQF70xy3mVD+wQ/lBDcl7PCPS+
Krc3IE1IvKRKSXv7OsLZ8hXQbgQeGBGtJa4EFKoQIr+yqPIVUIqoahBsbMNQHapm
FM3t0c6QErfbXjEJBuMxQoHNRLiJxn2ANMpa8S0UZCQ6vmsbeMPLY0R79eevpvca
DPEwy7IeDexNeXsHiW54C4dwPg548kQtO+sl4DvGy6v9ih9it5t4z70roj0Jf/ew
nmg9/INV62xV0Ke1oKGo2mlUZ/nUYw==
=TwVb
-----END PGP SIGNATURE-----

--6R45SNmXiGQnf5lN--
