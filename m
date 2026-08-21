Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6CA3750CF;
	Fri, 21 Aug 2026 16:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328306; cv=none; b=he9NLnb+UIflediI641ePEUOF20WY4lpEo5AjFGh9cnd5ROFH3a1zD4e9FUKu0ScXNMdv1btZk589EaKWW9VxSnXhn6M4kor7ErCgdncpF+fZvMYrI8/6ITgMQuqRWbCU8FeudYAdQVbO16Xq7L7vkCiAxWchVt91wWfutYNYHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328306; c=relaxed/simple;
	bh=mGnf2cZEXZo+BToLGnE37FiUuHuPqvYT8KVlteX9Ezk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STLbv57P3X38FSwHqhqmMJnCbO9ZOZKuIYkrLU+BbJVesHyk/McsM8LnmJPx9pcWUbVvxpiExnToJVoa94FoZC1qn/wHx6EuWwZzvgzq+C9LhM6OcGSDWoBEfVyGiP1TJke1x2rqDyVEuICzHrO9/9nG6TvFpX0gauMaJBq77Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kItUVKmt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kItUVKmt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2111E1F000E9;
	Fri, 21 Aug 2026 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787328305;
	bh=mGnf2cZEXZo+BToLGnE37FiUuHuPqvYT8KVlteX9Ezk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kItUVKmt/8LMRL7P+pkPTRGn0ZuZ+1hM9+2UPinkTagoA1AvahXokdmPqwORJUPXb
	 jtzLReqX8Q1JpfY3lDUFz6O0KKOuSo4eH/BGUWlhxKDqkm55Osr1WHcaW0RL/itsEL
	 ++ICNuOixUzkqSd/tC5p3itCxn20v8Xcw5suPWD1+Nn2eG68OYBg2tahbIiCTHwZRj
	 PlqIf0fDdyb9Fk7vsbjGeFE4KrIWDdOks7zxgWkKPg+w69cRdXXyn2l31TwY/6zg9I
	 mzGOPZaRybWJYzHFuZgkXk7qiP+Dl19TJVnYkk9iOrn9EYmqAHgX+coCRdLjkdF4tX
	 YUCvCUQnJpCLQ==
Date: Fri, 21 Aug 2026 17:04:59 +0100
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
Subject: Re: [PATCH v2 2/5] selftests/arm64: Print missing MTE TAP headers
Message-ID: <b95d6b82-ce25-4d89-8d8e-8be1f111812f@sirena.org.uk>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
 <20260821141556.4065894-3-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q5tB8uJ6EHv0Zftr"
Content-Disposition: inline
In-Reply-To: <20260821141556.4065894-3-usama.anjum@arm.com>
X-Cookie: Package sold by weight, not volume.


--q5tB8uJ6EHv0Zftr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 03:15:50PM +0100, Muhammad Usama Anjum wrote:
> Most of the remaining MTE tests set a TAP plan and emit results without
> first printing the TAP version header. Direct execution therefore starts
> with a plan such as "1..20" instead of "TAP version 13".
>=20
> Print the header in every remaining MTE test that is missing it. Do so
> before setup and prerequisite checks so early failures and whole-test
> skips also retain the header.
>=20
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
> Newly introduced. This is an output-format consistency change and does
> not fix duplicated output or alter test execution behavior.

This should probably just be a single patch with patch 1.

--q5tB8uJ6EHv0Zftr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIdyoACgkQJNaLcl1U
h9AtRAf9FraLNy5r6DRRaaK6WNymSBVRB6v8lro0MTuUtEKZbEpRqy91F4I1kMeS
Gwa1jppwkI4dRDB2lk2zDOd+prsyT1uJu33HyMGwT3MCvNy57O6KQ8XLzjQJDZDI
qEAr5f6zdn08OZ8B08Q0CO82ZN32POfUGD8S4UA546FB+WFmA2Qah2U6oTg6jgSf
ee75yurCMzochaNuFBGUXg0MsWaXtuQxsteEcPhj3hIrI2JOmKdzkOXxjdU0ea8y
ZHP6Ko59utXjXq/0r2WRjSTs8WEeu2uCqdmZ1YvjibXFwaweaXZFlqF2LU2+x6hV
yV2r0E2HpNPjWUiHYRrksoN/WRV5pw==
=wVtU
-----END PGP SIGNATURE-----

--q5tB8uJ6EHv0Zftr--
