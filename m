Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05DD3D75DE;
	Fri, 24 Apr 2026 17:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777050547; cv=none; b=MpABwglyeVr3uX93VXrHlDA0vS+8loGbUHWmlDwUPvNx31c3F4W/CpKmbyCAO0HruyDFvyGwYX5zY4XVQbDu83jUTIwGEfcFsXioySVIOtyca2GyKc0seEBmPhY2FidiblVW9qYitddsz9JpC02AP/By8dMCA+Hbm8zbm1tDWf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777050547; c=relaxed/simple;
	bh=Jf5eRC+3hkPXLe9spFMB3uryYrD4+VVs7GGxsuqeMj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6GeOBT/z7R8Pq01VqGvY+YioWwol45jC7vCnOy02ZSAz8cESnCXSNq8TdqaWT1EN33YLstrTAS0HPnd9KzQT8ySNAZmL+SXLZcc3H0vXqJ3NPeianEE0dXsreNlSm9gM4Ah2ShJsz89UNIqYNd2+bi8xW3w4biHcGpjx+v6I+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tfb1S295; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfb1S295"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D475C19425;
	Fri, 24 Apr 2026 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777050546;
	bh=Jf5eRC+3hkPXLe9spFMB3uryYrD4+VVs7GGxsuqeMj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfb1S2958mVyEkFt1mafWUZ0kVRVwKN7mJKUQLl6vJbmyK4oQRSrK12fXqEHePOIq
	 8K6JArXVW2Zj3O3UP+YoVtW45pZID3HXQSlXnHXY5tPyKn2RV/98MmjIOlO8LERJZ0
	 rO/BNxRgtrki1SwfVald0GZ9h7TkvT+/ShqmWZ9uUkdkAQxNH51bFx0ex2iXTznyF3
	 H1TlVKEYZZahL0BW0evQG0JEczsyIULn7pDLg5VCTxdjNKMWgus4GFcFY9MRx4JH3i
	 ETCL97Wi47BJj4/pOv7juf+BlfqDura2fSCZEww8nNG3Pt7Wwuz1Mgly9+1gJWU5no
	 hhIxjioDgrAsw==
Date: Fri, 24 Apr 2026 18:09:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <b94bce09-69d5-4454-b4a0-81612f286f0a@sirena.org.uk>
References: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
 <aeuRfEeOUWEHzPix@arm.com>
 <63409143-f4eb-48c3-89de-1aef4fb57381@sirena.org.uk>
 <aeud4Hqxq4PNitMc@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VjQb+OJ8kMEE1O8V"
Content-Disposition: inline
In-Reply-To: <aeud4Hqxq4PNitMc@arm.com>
X-Cookie: 1 bulls, 3 cows.


--VjQb+OJ8kMEE1O8V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2026 at 05:44:16PM +0100, Catalin Marinas wrote:

> OK, so it does look like it picks the kernel uapi/asm/ptrace.h. It
> builds fine on Debian stable (no GCS anywhere) with including
> asm/ptrace.h and removing struct user_gcs.

> But I think we should include asm/ptrace.h in libc-gcs.h and not the
> gcs-util.h header (for NT_ARM_GCS it's fine to keep in gcs-util.h).

It's not glibc specific so it seems reasonable to keep it in gcs-util.h,
even though we don't currently have any nolibc stuff that uses ptrace.
That said this isn't particularly strongly held opinion so I don't
*really* mind either way.

--VjQb+OJ8kMEE1O8V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnro60ACgkQJNaLcl1U
h9DvmQf9Hl6f4XgZtvRirHt/yJ8iddnSzTd4OQv+Zs3n2ozcevp7y3izjmDagx/K
czNCAe0Halgs1SEIbgXSyvXYQQ4GcgcMNVohwP3tZYQka9YmKCqxgEOttLXe2yzh
Rbb3NDYLtdMdDMu02NGmD3jl7WvZojy5V8+McZyMqdHkUwHewLeQH3H6t7JaMPe9
r5mVnyCz3k/3ifer/jcvOneHlltIXPWzdhVOxYLP/Vvu4SkmTMCbXWuYNRUeKy8C
U3OHUi4CHvRVXtanIBQgeWhDxGkSk9GWtABiZxQrXs/nJ+WzrkH0TWpTnQbOaU07
AClEmEae7Aty1eX3k6gmaydJIPYhdQ==
=6Uel
-----END PGP SIGNATURE-----

--VjQb+OJ8kMEE1O8V--
