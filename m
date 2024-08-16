Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B450E1BF324
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Aug 2024 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723825820; cv=none; b=jVl7Jm3xdnVRN56VxLPbrpqTQxGTZje5rfVDz3s98NzZePQ/p+oB6WqBXM8drZ6L4D5yv+dCqyPa7EH52zaUIESphISGWsdPJ3+lFTPm9KESjUwojToVEdzsw5tJSNa1Ip8jAaEA3yGK8YrV/lOadVrf7FleQbNa3UdogiM9uJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723825820; c=relaxed/simple;
	bh=+BYvX24cLa/FANWyBe7SOQWRoyDezSfeF3GZwTzhb1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=honEt8/DHzQp4h1809CjpXvk9N1LzfSgO/Q8vHSPNNqUsF5qrlkop/ZlXciaHDfLUgIYvG3CqJ9IrDq2DTyn+hARZSArZG8gMSCddl0eX3YRB02r9DUMB5VRhDUnNnxJEQI7VooHpvn5dhB9kADVrWuUhkN/D0+dG2DbmkK49Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DizK2Zre; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DizK2Zre"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECEDC32782;
	Fri, 16 Aug 2024 16:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723825820;
	bh=+BYvX24cLa/FANWyBe7SOQWRoyDezSfeF3GZwTzhb1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DizK2Zre2bByWb8utpu74+zMwTDbLzVMf+ouaxETy8lPSsRrbGmuj2A7ky7fzaRi0
	 23zW1Y1QeXL1jlIjm7x4Fwr/j6431nQdUlBSyc0VJZMa4P63Obn5U1V/ddK5VPBE0i
	 cdVKqNatYTl12IRyZZpaRY8E49pzmkf0iottZoK67H9J7VeZ9hFOyusxwgZc5g/ak5
	 nc97UMotlUE7yAacHjiZac8masRCLhfkhsD+01yC1865kQKZmtvepStCTropJCwoFS
	 QzlSKmvyWIadcb8DxUQEM2Dx48w99TIgzBPQwFeX76s1uvvr/LhJBaF//gVc0RC7AF
	 THnvl/x8tjSGQ==
Date: Fri, 16 Aug 2024 17:30:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 5/8] kselftest/arm64: mte: fix printf type warning about
 mask
Message-ID: <1afb487d-b5ba-499e-bae1-8579d7b3303c@sirena.org.uk>
References: <20240816153251.2833702-1-andre.przywara@arm.com>
 <20240816153251.2833702-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kZidmRSNPMd+66mX"
Content-Disposition: inline
In-Reply-To: <20240816153251.2833702-6-andre.przywara@arm.com>
X-Cookie: A Smith & Wesson beats four aces.


--kZidmRSNPMd+66mX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 04:32:48PM +0100, Andre Przywara wrote:
> When masking the return value of a prctl, which is clearly an "int", we
> use a uapi header provided mask, which is defined using an "UL" modifier,
> so the whole expression is promoted to a long. This upsets the compiler's
> printf type checker, because we use "%x" in the format string.
>=20
> While we could simply upgrade this to a "%lx", it sounds wrong to
> promote the "ret" variable, that is clearly an int.
> Downcast the mask instead, to keep the type correct.

This suggests that we've got some confusion with the UAPI, these flags
need to go through a prctl() return so they shouldn't be unsigned
long...  That said, it's UAPI so I'm not sure that's fixable.

> -	if ((ret & PR_MTE_TCF_MASK) =3D=3D mask) {
> +	if ((ret & (int)PR_MTE_TCF_MASK) =3D=3D mask) {
>  		ksft_test_result_pass("%s\n", name);
>  	} else {
>  		ksft_print_msg("Got %x, expected %x\n",
> -			       (ret & PR_MTE_TCF_MASK), mask);
> +			       (ret & (int)PR_MTE_TCF_MASK), mask);
>  		ksft_test_result_fail("%s\n", name);

TBH my inclination is that this is worse than letting the value be
promoted, casts (particularly casts of constants) are just obviously
suspect in a way that printf() formats aren't.

--kZidmRSNPMd+66mX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma/fpYACgkQJNaLcl1U
h9A7Owf+PL7QElIAhX7DEsnk5MxoB+ZseB4eihNWbzXTf5uBLPAKaaQy4C5qeaRH
hPnDaIWjY0lxu9FRe7F6GcZt3GO36T0O7Z9bVDIc9JJRXtY61ncyQJNH8YrNHOui
s6BhsRGvaKlgFzP5i0BKQx571T//KgtO8b2gdr5hptDOp6Aoz6d/oAeGYXkXqDyd
4ozVUehdkfruj3Bxl6+NBjoi2E3UO/Kxt2KBm1bhUFwJRpEapHX59Kd/pAx7v03V
hNHz82sDgMijFC1eD990BbQ/SOLsUaCT/uMg6x+YXMgh0B2zq2rNEvM+d5DGA/p2
RIyEK1eQysVpJubcIZDe7Q3/F2cz6g==
=vJvr
-----END PGP SIGNATURE-----

--kZidmRSNPMd+66mX--
