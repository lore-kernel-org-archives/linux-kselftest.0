Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD2147126E;
	Fri, 21 Aug 2026 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312313; cv=none; b=r3qrrJll1VNMOTq8NnUbFha7NhTFsW+bBMdjtZcMVWwngwBICiMZAgefjZysDNx/W4MtA6Op4MVZd/8/tf1FxFw25fiKK81KTc8wiRc9bTAePf3DFt6559a2DI2HFVut8yok2CqI1gv4M/NwZuR/+y1/xLfJ4KTMUx3vJmGCWzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312313; c=relaxed/simple;
	bh=v5J7kWvIHTMkgcrjix2ChnFzYVTqkSnCmBN2gfPhZZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fF3Le70sisx0qQOacU3ydA8/lXED46o8RVfHn19/0GR+K9aNyAn4cK4CLW095DR/MmVCBhUWLkD/hrXIsJ4VIpSxsK4UjSWKO+mUdqRKsFDWChoD3ZvFv+JfhH5UiJxWxg6V8yDoCrLLP1KcZQH6zfFMvayoZX/EcqhJe+LNfT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f99L/XtG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f99L/XtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1A31F000E9;
	Fri, 21 Aug 2026 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787312312;
	bh=asK2sRf6C2Innf5tCA3rGjkT06bvSeIo+EwUdsCsHXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f99L/XtGP1f7TT+Wy3ciJQLYdr9tFWa+gdlKUQkowqFU40Xy+hJLr5eB68VxEPaG3
	 7N2eSx1IlcMiHQwcrkjrPc2gDzQdP5il4f4zowsIzv/Vme6LvmgbcSNiHrb9arzwvT
	 F5+0LVG5yrNeeCbHipkLJ/bTDaAiKPpXNJt6xqhLfzQNkbnQ3GlSknmwly+MdlW/8F
	 phqlYPEX7T084ERpR2Pn/KeELDLomef1/Hw4MWjJmAFA6TJ6j4Sv3HIjtD+qwLfiK0
	 j6oNjrVym0gYdWhgGXau1OGtWzlHYfjQVMsRbKf8SdaAkndZCfA13mNpe0C/zn73r8
	 HXYNFYBnkVMzA==
Date: Fri, 21 Aug 2026 12:38:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>,
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
Subject: Re: [PATCH 4/4] selftest/arm64: Add MTE test config fragment
Message-ID: <1ea35531-7d69-4c57-af16-e887e852735c@sirena.org.uk>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-5-usama.anjum@arm.com>
 <aogSkJxWf9QndjuE@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kw4Yk4XN3KV3U5E/"
Content-Disposition: inline
In-Reply-To: <aogSkJxWf9QndjuE@arm.com>
X-Cookie: Package sold by weight, not volume.


--Kw4Yk4XN3KV3U5E/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 09:55:44AM +0100, Catalin Marinas wrote:
> On Thu, Aug 20, 2026 at 04:33:26PM +0100, Muhammad Usama Anjum wrote:

> > +CONFIG_SYSFS=y
> > +CONFIG_TMPFS=y

> These are all covered by defconfig. Are these fragments still necessary?
> Or are they supposed to work on custom configs? If the latter EXPERT may
> be set, hence the PROC_SYSCTL above. You probably also need SHMEM.

In theory, yes since people might not run defconfig and it's supposed to
show what's needed for the tests.  In practice people don't usually
bother, especially not for things like those which are going to be on in
any reasonable config.

--Kw4Yk4XN3KV3U5E/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIOLIACgkQJNaLcl1U
h9COAwf/T/9AZMQTnBsmw6u0/45ObTEmP024W7EPWkw2fMtMwk2Avr0iXoVMPnCW
Rc3A1eeuN+qDeaM1ahCcAW8t1Kknh6ptUeRNyMHaoJqQXAZuEl2cf7vosm2s7NXm
gxwnamyHYZtRr3l+T+vl4MmThq5gES7Yo33PvQHmuc7eV/+pVHMFWzP7fzZB7DhJ
2YOdsXG3uqYA0fNNyW+0Vg8ST7hEyBdh5WaOz2QBe5FHnFiklsIVKA1JA9mXlhs+
jZh17TPWHOezx1GCDv8E8BjeRzUO2fdDYcX6uIFBZoN7cZaKHb8461+gYOdbyHr5
ERqSjHd9HRey5Gt85AiEv32nBDgoNg==
=F2rd
-----END PGP SIGNATURE-----

--Kw4Yk4XN3KV3U5E/--
