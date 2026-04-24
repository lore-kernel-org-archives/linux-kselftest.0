Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D735E2BD587;
	Fri, 24 Apr 2026 16:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777046866; cv=none; b=TsGzUhyefHfGMC41NB4p70c8ih8uiFBWkinPc8b4GPkem6T1Eg+Aw1qK3Nh/O//7APUxRDVQDMW0WItelHzm/Okzi9pcnTAU9rpsMdqyuMvRTHnfdnsR3YzciQZ5GNnbjGXhy+Ce89qe15rTCNNnCyWXPYyj4GrewtQ047a6sTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777046866; c=relaxed/simple;
	bh=BR4nqODHdCgirkaG/hgtBFtkqB80B7MFxhUj/ibJi0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fttcR1k5epmggSSXJ42cnj06mCtOKvM9KbmP4zDV0DCHvoiyWJu1RCz7JK88696cZ4VgMxj5zsqWc1mf0huheuPKD/3u54bsr7zTsINenBMG+kD1zsfPYuMwTo4zQQGujnG1CXLEaUVhxnY07u/5j683hpk7Gc0T6CbKsT0FbDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+Fn5p7E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+Fn5p7E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83ABC19425;
	Fri, 24 Apr 2026 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777046866;
	bh=BR4nqODHdCgirkaG/hgtBFtkqB80B7MFxhUj/ibJi0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+Fn5p7E2mN5Mic0TLYajA1XWAoIXI2mJfKi8b0EoxPNnaw84eIRSoI+GbMUG1HGL
	 bzH2Nv64Hg7/C9hDBuIOEzyeLJe/F979kvHcGUsXNkmgv8iKIgMMAqMwwEdNBY4BqD
	 Jr9z83zhPLFyUTwlVJOW+3wCNflLBEOveaUB2nZnMc4Z+/YkhjceuzXLm5OM3rnXwX
	 7VG5R0lR54fnJoTj3d78kIkGdNm59QCSv1872DBVEkr+SUl1v0/vfbmtr4UFzVzA6X
	 WtHm83cDEFEKdEAmTEsokDtiJfsV1z6KlpkURxegNnw5CD7V4ULuuVchA77nn0Ar1d
	 ky2ZnEiBoCvNg==
Date: Fri, 24 Apr 2026 17:07:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <63409143-f4eb-48c3-89de-1aef4fb57381@sirena.org.uk>
References: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
 <aeuRfEeOUWEHzPix@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RtU1zfulaMlWAB9P"
Content-Disposition: inline
In-Reply-To: <aeuRfEeOUWEHzPix@arm.com>
X-Cookie: I can't drive 55.


--RtU1zfulaMlWAB9P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2026 at 04:51:24PM +0100, Catalin Marinas wrote:
> On Wed, Apr 22, 2026 at 06:42:54PM +0100, Leo Yan wrote:

> > Building on Debian sid with GCC 15 fails:

> I think a better fix is to always define struct user_gcs and only
> conditionally define NT_ARM_GCS (IOW, move the #endif higher).

I've not actually double checked that everything is wired up properly
but I believe these days this should actually pick up asm/ptrace.h from
the headers_install target so a current kernel copy.  We ought to be
able to remove the local definition of struct user_gcs I think, there's
still some weirdness with the NT_ definitions I can't remember but the
struct should be fine.

--RtU1zfulaMlWAB9P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnrlU0ACgkQJNaLcl1U
h9AxYgf7BOPVG3eQDCLMYm/VdAFnMAnm4vr8ZWmUpjNri670GAtZk+L9mzA7FpG3
ixGB1i1CGccPnJfmkcOrXF1y6EVillyp6iW6VXISPuz3ISWBQ0mLiDol8j31KovO
D8B1eafYxOJPO0jyMF/faevcSmq2cqZN8XUkoQMSl9tfwHgIqxNgHhWSq95eZuox
BTHrxhMfPNAuUyrDmCHd1iwuYFInf+HPuoc/Lphtfk2HVp4g+ZwEQKiJv69X+zlw
yt9v2Zeza21CCjPWJ2Dc7nn8fjirbSPGyOgcGDAnfE15go8ym2Nuiy2KmnxfeJXs
xFPXq25N5X2RwFQLeIL67+m7XG72lw==
=J4TN
-----END PGP SIGNATURE-----

--RtU1zfulaMlWAB9P--
