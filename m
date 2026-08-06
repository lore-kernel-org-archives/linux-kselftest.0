Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3A730D41F;
	Thu,  6 Aug 2026 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021391; cv=none; b=O+Iln4JtlNS51YKhIDSkNRms2t6ASlNm7g42GTb3fbJ5ySEw4GopsxxJsNoyWVCiecHJtCCnzkRS+4oXhnJoqQMNjuEbOzsUo6MP3IJv2wY5BYOKDpm0H4CL9UkBTEN0VoB9f3ER+6OAP+IOQ6ES5woF/1WGKO1iogl6H4w7Ic8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021391; c=relaxed/simple;
	bh=JSn56+DYSOXJ2iZ1w5qn43Y5g5CMEdHdImGwx9YHxy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eotf/yybv3aAO44obNFpPLR8E5kHdV/A2FEjSvXXYof4RIcitK1Mx+zlj5BWkZsqBwBHmMmiJ1OffRhP5244eGAdn/vh8ssbXkJv9iTco1TWqICIYWlfI/WOCqECiCvRbTnthhrd/JDEqP6D7nY8mkHSEngZDxh8fevHz0p6FQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAqR/md3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAqR/md3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9EA1F00A3A;
	Thu,  6 Aug 2026 13:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786021389;
	bh=JSn56+DYSOXJ2iZ1w5qn43Y5g5CMEdHdImGwx9YHxy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VAqR/md3lY0Np7J5g+7PCy9Kv0s3ffF940IHzM16KmiNsQjNvC+mnpv+TTiC+nqlO
	 wmKXklNzOFsqWN34MogqyAgG2KVoMqXZoRqyGLrUwhednBUCl1jvxK3oyfT7pnKM2t
	 69DATYTJByZg14XIazIH+HcyTTxZ2mnIMebstBKku50uebtJwJ0+kUOlnXPBDX9uH9
	 TOPkaCzAquD3+NmyS+u/yplt4GxOLAx88aypCBbt1jIGzcZauxE0XbUAqLsOB1Q14K
	 E0MxTXFKMGYSSPFrEbuWM7QsuCd9rxpNXBcR+vEaDtY3K6UhvwHSxeh9mQdgnRbW3+
	 vCQOUA9j0gZ1A==
Date: Thu, 6 Aug 2026 14:03:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] kselftest/arm64: Fix abi test compilation errors
Message-ID: <7dbf3b5d-aa34-4bc6-b0b6-a289b9cee61e@sirena.org.uk>
References: <20260806111546.42042-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yq0d5faj/qF8uiCc"
Content-Disposition: inline
In-Reply-To: <20260806111546.42042-1-ruanjinjie@huawei.com>
X-Cookie: Brain fried -- Core dumped


--yq0d5faj/qF8uiCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2026 at 07:15:46PM +0800, Jinjie Ruan wrote:
> The arm64 ABI selftests fail to compile due to missing include paths
> for kernel headers, causing errors like incomplete type struct sock_filter
> and implicit BPF macro declarations.
>=20
> Add $(KHDR_INCLUDES) and -I$(top_srcdir)/tools/include to CFLAGS
> to resolve the header search path. Also remove the hardcoded __NR_write
> macro and include <asm/unistd.h> to obtain the correct syscall number.

This should really be two patches but meh:

Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>

--yq0d5faj/qF8uiCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0hggACgkQJNaLcl1U
h9C7QQf2NiOCySiDgot8UbZfwsitm689g/jkmP0vR2jilm7PzliJ0UKBBLwgWTEb
yaviBeyp6IAlYUj5JiJr0RPtcCOIiEJtHrMrETRwelnMF8S8YZ3WZHze+lMmyU7f
JmUPRmBZAHRVMSV/dpWDWDuw5/wNmJtEd75PODOh5hj1kaTJMY6YVzwR9a6qpKZx
1BPwBaXGK19sV7M1GRAp3gtVnQqkPO0+xUDwrlPZBaqdlH+Ie4Ud+kVmf+pnzfo/
WLJmo5c5Wv1yiKP4mABVeEwU3J4VG7CVV8iq0JDWPpx/OVYd9Cj8JKsgasAWWKFf
iMu7+iYxwy+cozuvSNExg2rIoXtc
=W9U8
-----END PGP SIGNATURE-----

--yq0d5faj/qF8uiCc--
