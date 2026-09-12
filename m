Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD033F23BE;
	Sat, 12 Sep 2026 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209959; cv=none; b=AykLSNzIOpL89DiZqXisymLR3aPlMGr1mYPCfdNNeYCPY/84b2V7m0IAXJUnEBRj4RNxXEnDd0lOmiXLWPKCAEH/vB3Lg2WZw1N08AXm+FDf21exQSP7HtJ2sTw0n41/C6fX2UrzNYLxox84cSTBarnlrHuzV/pFopU3EXALKsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209959; c=relaxed/simple;
	bh=6ZHX+KXqqUnpV+lj0b2E7UfTu5GySDXzprd1+AnLZ6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RftLjdNH6ngukTXZfA8S2WCeiv/Nstoot27y+xid+VvOfH3XjXRa/lMD8HTU/qAjZMiKwjnJBn+XtR4hRJ1vm8xKpJQEZywNotaYNIcdm9tALvPqU5DvQQyTAMTkMVtPXcEEjwwtcp2FhWYXVAMcqw5CXAZd2Kz3J3xtEC+pV6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xgdwkz8q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xgdwkz8q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB79A1F00893;
	Sat, 12 Sep 2026 10:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789209958;
	bh=6ZHX+KXqqUnpV+lj0b2E7UfTu5GySDXzprd1+AnLZ6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xgdwkz8qixw35R1je+ZAZJuVPJBGED1D4IL6BYG6xZHzHEv9sK06Rfh8wTP1dzmE4
	 KlHEdV2BdOtZ2gvqVaOSSokLI6Lk1FDO6CPt8W/D21av4BI1TOxghmK6G5ux0mCQgs
	 i8TqaUwtjjFUMRVRXgkJgtuHj1zAmX/uaqbPXobpN0lNrbwyS3KPScH7sAgGmN80BQ
	 TAinq5nBnQ/Lv3qoe1lz8QNzOozPoFg96IARKuB7U9umlx1goKGsUOjqIUQk8vLOLL
	 eFOIPAG8/uzNlFJ+4kUkUW6z333LH2IDQfW32IDEDSrNbKM5ow0XWr9/0oWSz4qFfM
	 h1C6Ypw+KW9fw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 415DDE06029; Sat, 12 Sep 2026 11:45:52 +0100 (BST)
Date: Sat, 12 Sep 2026 11:45:52 +0100
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, shuah@kernel.org,
	linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] selftests/alsa: Test writes to IEC958 controls
Message-ID: <aqUtYK3mEYH2OiRS@sirena.org.uk>
References: <20260904123334.1505003-1-sammiee5311@gmail.com>
 <20260912025430.2102149-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RjOQ/8si06ScYdmy"
Content-Disposition: inline
In-Reply-To: <20260912025430.2102149-1-sammiee5311@gmail.com>
X-Cookie: Orders subject to approval.


--RjOQ/8si06ScYdmy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 12, 2026 at 11:54:30AM +0900, HyeongJun An wrote:
> Nothing checks that the put() callback of an IEC958 control reports a
> change, because write_valid skips these controls.

Reviewed-by: Mark Brown <broonie@kernel.org>

--RjOQ/8si06ScYdmy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqlLV8ACgkQJNaLcl1U
h9B+sgf9EGlda527nHH1iurG77KIl5ca10p0cQUhLQk+2avhfdspCbv5awWBMiey
2tmPsaZmeLJhjNakT8UIflPfXgpK8H0dOHnArqmSilLch+RWE5XxJCak0WXxXiPh
FPhBmsmEv98Gr6QEuQQdbS4o225rhTGYuP9HhJVZvUdAaI0SDYXt2h7whqpKNKoe
kEJshASluQzZT1Qv1NbUy5j5/Y8MMSvXwOApvC2K6xhiPjWtbVLEuDvKJIdZ/JR6
PVpYONzZb/A+wQV6cuk+C8roL/TY8HYG3GBx7mTC16YDGU63QKJbtgsjlyUZKVLz
0t3eZW/YTwXE136aGgcAPavg3zBM7Q==
=UODH
-----END PGP SIGNATURE-----

--RjOQ/8si06ScYdmy--
