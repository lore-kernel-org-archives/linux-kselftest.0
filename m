Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E29222590
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772285952; cv=none; b=BUoP+oCuexWZ0P3wc/xmX4xI+IxFtk9eRtgPla+Ju0DqM8NuUTd/sSld+rVHxwrW9QKbhYTWG0ZpjF01BVgP2DP8UjklbmQjKxBf8ArDN9cLrRd3CLAdfm1I1hhSXK3g5n+0Nct613MJkvnb3EfckshB67jsbWFMxIT55tkHIvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772285952; c=relaxed/simple;
	bh=A+jgu3UIsJ6M/4OKomoCN0p7y+V5ItH79wf3WXnQeC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+Vc28AFLOzsBwii+T/W5cgWaL/euzUhDQkxnMVJkD9j1GKfSdF4S7zyfYuDsDxN1/W99AwUjmqm+lamu8PTpea72OHnUa+kgYbR/i0bpjF+0er3H0680+5g39LKaXO5zAUsU1OGuV9ZqFT1+0KOp23WxDM0Hi+1G4ZS8fVRg+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITRiTv4C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITRiTv4C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB101C116D0;
	Sat, 28 Feb 2026 13:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772285951;
	bh=A+jgu3UIsJ6M/4OKomoCN0p7y+V5ItH79wf3WXnQeC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITRiTv4CidtEFRpHIIPQD5Pni6Af5N7tgWhl1qZYUeSjKi7YoYDGCy1Xso2S6C5B8
	 Z6jqm8/mFhvJleeJoy59EIhOsbcg2lSniTPFzZ73Y9awZPxl7TPLT1i46XWdRvTi6u
	 et6n4iUwe36LuFg74xDOjbtm+FrcDI1jNYrgXGF2WeUXfheCeC/YfyFEoIPs/PMXTf
	 PQcpu+ozcLFBS/lqda6P9PQgQ7Fn/FwRjZqO1A3E2kgX9b1iPOfX2wLsQdDX4b2Kod
	 yiMsSTuViekA/wkH0uta+IFPVH9vA/ozGy5KB1mYEFJxj4F+jVa4IxOevqJCVl2dFo
	 K8nfrDImB2q2Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1311C1AC58E4; Sat, 28 Feb 2026 13:39:09 +0000 (GMT)
Date: Sat, 28 Feb 2026 13:39:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Yifan Wu <wuyifan50@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	yeoreum.yun@arm.com, jonathan.cameron@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linuxarm@huawei.com,
	xiaqinxin@huawei.com, prime.zeng@hisilicon.com,
	wangyushan12@huawei.com, xuwei5@huawei.com, fanghao11@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH 2/2] selftest/arm64: Fix sve2p1_sigill() to hwcap test
Message-ID: <aaLv_X7SihBUX5c_@sirena.co.uk>
References: <20260227031933.4103333-1-wuyifan50@huawei.com>
 <20260227031933.4103333-3-wuyifan50@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ww5PzAmBeP3CClFP"
Content-Disposition: inline
In-Reply-To: <20260227031933.4103333-3-wuyifan50@huawei.com>
X-Cookie: Think big.  Pollute the Mississippi.


--Ww5PzAmBeP3CClFP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 11:19:33AM +0800, Yifan Wu wrote:
> The FEAT_SVE2p1 is indicated by ID_AA64ZFR0_EL1.SVEver. However,
> the BFADD requires the FEAT_SVE_B16B16, which is indicated by
> ID_AA64ZFR0_EL1.B16B16. This could cause the test to incorrectly
> fail on a CPU that supports FEAT_SVE2.1 but not FEAT_SVE_B16B16.
>=20
> LD1Q Gather load quadwords which is decoded from SVE encodings and
> implied by FEAT_SVE2p1.

Ah, good spot - I think my search for instructions to use got confused
by them mention of SVE2 in the description of BFADD.  Since this is a
fix it should really be patch 1.

> -	/* BFADD Z0.H, Z0.H, Z0.H */
> -	asm volatile(".inst 0x65000000" : : : "z0");
> +	/* LD1Q Z0.Q, P0/Z, Z0.D, X0 */

That should be:

	LD1Q {Z0.Q}, P0/Z, [Z0.D, X0]

(the existing asm has some issues which we ought to get round fixing but
may as well keep the new stuff good.)

> +	asm volatile(".inst 0xC400A000" : : : "z0");

Verified the decode with objdump.  With the above change to the comment:

Reviewed-by: Mark Brown <broonie@kernel.org>=20

--Ww5PzAmBeP3CClFP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmi7/wACgkQJNaLcl1U
h9DVZgf/eYoxaImZMJFJqdQF0wT+T+ig4eiur8/tZT3g5gsg+VfHYUPi6NXyzs9p
stxVJ0eQrzEgJ/Gz65Y8scnRHIDaBZrrqKZ68Ud1meP01/gi4ThKoS7Oe9VfsfPn
unqStwMAVFnA5dzBDpz89lZD3+PmP6rRHasvcnbWZMpJTyU2SnlGT1mupvoJMttr
BXBQ/LO0bRqlarGr8MSiqWcuYXtG1cd7pgMx5dLW+4RRZB1EzC//U4unNoJ9//bB
4lMoIgZeYh8zBZxEE36oIzuQCdW61IhwKDZlrxPL/QC+/Zwy92nT9/1YuQqsxQLe
XpPwMp612+RAj5kbds1NyUvxMddXTA==
=Z7yh
-----END PGP SIGNATURE-----

--Ww5PzAmBeP3CClFP--
