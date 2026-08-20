Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2B237B41F;
	Thu, 20 Aug 2026 16:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242482; cv=none; b=PZgnb+HS18iOv0qrwhbEt+yA2RqKaLrqK0/XBcFXt29dkrx9Gdnb74RNJWdsKFWlTuL+wZcp45OIftzCvNwZu8BRDvUqqGfNnYnJlsOphmmD8Jod0IAQ+kzark6Lmmh6E4afJ05maJOByjyd4TAYJvVDdED/xUZFPeYQzrEPoaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242482; c=relaxed/simple;
	bh=YCFP9PuCnlyZu1GASIDw3bZvu+ESLn6I8eeMVlJjcSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkaz7++FGn0b/wuAlX+G58KWqhzyYp/n6+3RTGTbexIgtgcP2Z8h6V4Rl/j95nuTY+oW9yyAxu3Ia7T3VfxZBPdVw/i8ckjqDVom3TQARJWhCAlkn/O+I6qJsvhm74wcsQ5oVY01j11RPGYs7iGaTU2kbrjTpAWC7EaMbdaaRGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6W12qPz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6W12qPz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D767F1F000E9;
	Thu, 20 Aug 2026 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787242481;
	bh=8aoQP1ke55o7ZlnsPRPy19/NwxfeReydZilR+JtUt1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C6W12qPzFrERIpBztgTsYtgb3Uh69b9peGeyZF9Mbo541mJOwfc2j8pa9pHRTRRMN
	 r+/ogc9G45BbjsxnXG8gov3xHqiYGLGkJ5rKnR6S+a/inMCrhjlI6qn3xSU895nOnD
	 RhZQwP+F9VgF76i61o6Ve39G1WmiJLKHy4S4xvPmsN8ewPJ1m/NYm1Oj+W/Si8JvbV
	 fKo+qBD6wJgj2vdODMF7ciAno4vqJvz1gttcosT4j9e6FAL0GDfpa1dLdGh9cyQnTb
	 oF97ALgaSTOLk3zvyP5i+/QKHnb93IYlmEqMueUlxpnfpk6KaiR0W9J81J9lWanrcB
	 dKMuZWwaoPieg==
Date: Thu, 20 Aug 2026 17:14:36 +0100
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
Subject: Re: [PATCH 3/4] selftest/arm64: Fix MTE prctl TAP plan
Message-ID: <d2ec01fd-9137-4c54-910b-e8b1f79baae1@sirena.org.uk>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-4-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zzm5Gqxb7iIxOy2D"
Content-Disposition: inline
In-Reply-To: <20260820153331.2448875-4-usama.anjum@arm.com>
X-Cookie: Happiness is a hard disk.


--Zzm5Gqxb7iIxOy2D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 04:33:25PM +0100, Muhammad Usama Anjum wrote:
> The MTE prctl test emits one result from check_basic_read() followed by
> one result for each of the seven entries in mte_modes[]. However, the TAP
> plan only accounts for the array entries, producing:
>=20
>   # Planned tests !=3D run tests (7 !=3D 8)
>=20
> Include the basic read check in the plan so that all eight emitted results
> are declared.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Zzm5Gqxb7iIxOy2D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqHJ+sACgkQJNaLcl1U
h9DiEQgAhDv5tY97vPZ4VNlLZxKM+QVdGlhLUQV+Xw5939EP40d52n/RFYhwaQRQ
gv6YhqY38VwV6/ndUohwwrMbZm5XZh1gk+YK1FI2abn7GuAYa9mN6lfVGEjnqXJs
kA46IxRctrhTGVY52OOPiV2FRAGtb9jdtfdXv8Cy6o0wpXZi/aKm6rwQfybARHBj
F0rqHJff5IoIxszX47u/N/HIUOGLKKG5UigmzklTVpd0UoVwTwh1N0etkZExFtY0
/8OnNtvphgNzHHT/F9vNriKGFEkyARcIghWIDuFdy7k4hDt2wRz6MGBRE4TCCLo5
SapBsgoVvtHgdrzkR4Mz5NQVavo9Ow==
=yMPo
-----END PGP SIGNATURE-----

--Zzm5Gqxb7iIxOy2D--
