Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C418D40DFC1;
	Thu, 30 Apr 2026 00:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777508818; cv=none; b=ECr3sLeQrEpgejStvBOvmmoMsiVB2bmi+LlirvWhjT1wStl5RGcuAHr60B/lkcFssODgp+lzhWkUCMwbltviP2rQK9GNGd5jtY79X5w514czn2Cq6xCKeXKD6H48OjG/hsxCuJNaziuXYv+3JALo616C1SNaXPR/gm1+6RB6sUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777508818; c=relaxed/simple;
	bh=CO/0+jLzo0Lhv7wr/PvzYvvNfI5bRrqQLHvDPFKSj8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ierztym7U5diZdgzsHSY/3lR2FVK5mnMs6dgQ/16WiV5aoWTAGPj6Z0ofufkNbllaAJSt2saCy3K6od/TtHbrEkShW81nvVJX6jVFK0+kFphx9aTvqMMBnwBMN1advjwgs2DbDF0fUjmrKwc9KPmqD/89grpQO+PYeAW73vWNNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkFfceaB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkFfceaB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43105C2BCB3;
	Thu, 30 Apr 2026 00:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777508818;
	bh=CO/0+jLzo0Lhv7wr/PvzYvvNfI5bRrqQLHvDPFKSj8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkFfceaB8vuPalqSPNkELNNHm0YeJ1mLvYdAqud+XEcJ/t8twlwaWwooo1TtWo6az
	 1GLu/LRkVJHWd1M3BCXt5TnTLwyeapCzXP/H9Ck/E4i1+XtZGAkj6SF+WMUsFvw7K9
	 UZ/F2FlRwVIeej0FO9TzbyaGqEXdfX0xRTny4TBNxKyn5PKeExWxU+QGf+sH3MRx3m
	 LjaxU8SF7WgYTQYcdm38KjzV52c3kbrcnePTAYxpCii/caftMMEaRYa2gwFpHiISln
	 b4og/j45iXHnOliLHI4JWXgP5BRuGoLgx9ndNbAOngveVuSX+Bjzap2iwBAgJ3cLwi
	 V3B4SygL3FLWA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A25281AC585B; Thu, 30 Apr 2026 01:26:55 +0100 (BST)
Date: Thu, 30 Apr 2026 09:26:55 +0900
From: Mark Brown <broonie@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kselftest/arm64: Include <asm/ptrace.h> for user_gcs
 definition
Message-ID: <afKhz892PmLHrv5_@sirena.co.uk>
References: <20260429-selftests_arm64_gcc15-v3-1-7fd68be56b83@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OmBvADEWYAWPzpCG"
Content-Disposition: inline
In-Reply-To: <20260429-selftests_arm64_gcc15-v3-1-7fd68be56b83@arm.com>
X-Cookie: 667:


--OmBvADEWYAWPzpCG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 03:30:10PM +0100, Leo Yan wrote:
> kselftest includes kernel uAPI headers with option:
>=20
>   -isystem $(top_srcdir)/usr/include
>=20
> Include <asm/ptrace.h> in libc-gcs.c for the definition of struct
> user_gcs from the uAPI headers, and remove the redundant
> definition in gcs-util.h.

Reviewed-by: Mark Brown <broonie@kernel.org>

--OmBvADEWYAWPzpCG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnyoc4ACgkQJNaLcl1U
h9C9GQf+NOhc5i1MwWxubDh2bdGL/RXXFzMh7TOJbjJsabRAQ1+QhaCCgYGZA8Kn
Z6XvUoggWPub7Oyv4WgJYIgnv4N075s5ps8Y02WQy/LET7xJojMtFOMAsK5QCNyu
vq4uJWmrJ3e4zISnCpnc5Irjphii1ocaYeK05/QeQ1wXulHS6UiGzIQmPfYYc1ZC
SZxUD4ZDDO8itTFkDlfJr99MrdRUMhhAr0zCQGdllvpG/sLMJiHWz81E1WlGviSe
wY551AARf+cuELiGA8qDMmv9pKakxUCERrr70UVpj9frqbV2h89psWngR6D6ddVs
hBq5huCfeRvdVzUOsK8uAMqcvgZcOA==
=HLqY
-----END PGP SIGNATURE-----

--OmBvADEWYAWPzpCG--
