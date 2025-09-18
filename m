Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6240023E35B;
	Thu, 18 Sep 2025 12:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196842; cv=none; b=PTD13DuzL68xKTkQTvLD376x0peRv38LoDqU2COnkvW4MCjHEbTrxNIUIlHFyCVAwdQXAtHNwf9wCgrxn7Q+ncd0Ui7tDO7BvR0PKgEI7ly+SuYAs5xMDTXY6sIipj5zWyCkB1/LQBRRSUnYwAjACxOvjHjLWcamz7q3ma9v1sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196842; c=relaxed/simple;
	bh=uaDExXeL/34UENiB9oEbazFZaj9laAcFWPbmwXdDets=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhHWXtVXZQGVC9hiCkYVQMAoeoOwfObT7a5rxlGLad5+l8WRlvsl5R4/l884C0KE0GerqbH2pUEeQ3nbnXcO4vf5cS5jiY05MfoLfijY8nMS4fRD8ti7B3Fm7yH0ucdnr2Zd5mTBhuLYbyqlZYZuA8IOU8Ij4UqlBu0zV9SpYo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mDj3c0Im; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mDj3c0Im"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5567BC4CEE7;
	Thu, 18 Sep 2025 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196842;
	bh=uaDExXeL/34UENiB9oEbazFZaj9laAcFWPbmwXdDets=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mDj3c0ImOBTRTsZRIde5ZCK1uAHycNbTl5sgkvFeIpdF/A8yKtzFyUj1Lo+LET/DL
	 G8hTXbzye3PkKcwwep9JJ72BQAdirttpadB1/jkal6vpAWTWhRzRu1J2wwE+LxBkzo
	 b1htL3aUhflHSRh0Z1oUqnYoJ+4Q+uvpj1ePUmW6ihPNfRs4eJ2Bkd+X+7UdBJ+jAY
	 PhIFsaTsck/eo3+xsTGL8MeqcYieLWzhrLt/cRQnVUXY+H3T6klGJddQydEBP3vfzv
	 B6RcFYtocMWIAnbUM2rJnhjMmkwgl0WNbCouEq1G7Sfcv70Co+fl6IvwCcQZgogdzg
	 w8yDq0I01L5hQ==
Date: Thu, 18 Sep 2025 13:00:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Oleg Nesterov <oleg@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Spickett <david.spickett@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Luis Machado <luis.machado.foss@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64/sme: Support disabling streaming mode via
 ptrace on SME only systems
Message-ID: <8e99cb8a-cc9b-483c-9b71-22fd640cc1e0@sirena.org.uk>
References: <20250820-arm64-sme-ptrace-sme-only-v1-0-f7c22b2871f8@kernel.org>
 <20250820-arm64-sme-ptrace-sme-only-v1-3-f7c22b2871f8@kernel.org>
 <aMvxkzg_LT4C4Quh@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bvjGEp7kODe4zFUz"
Content-Disposition: inline
In-Reply-To: <aMvxkzg_LT4C4Quh@willie-the-truck>
X-Cookie: Victory uber allies!


--bvjGEp7kODe4zFUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 18, 2025 at 12:48:35PM +0100, Will Deacon wrote:

> It would be good to have an Ack from the userspace side (GDB?) so that
> we know that the minimal ABI change you're proposing is sufficient.

Yes, we need confirmation from the userspace side before this is merged.
I've had some informal feedback from some of the Arm people that was
positive but they needed to do some more thorough validation, and we
need feedback from people outside Arm too.

> In the meantime, I'll pick up the first two selftests as they are
> independent of this part.

Thanks.

--bvjGEp7kODe4zFUz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjL9GMACgkQJNaLcl1U
h9C86gf+OjW6SC1j2hLmMmr8tVWsSjMpw6sm0E+0BYO1sNqhyaVpq7tZ480kgRuG
Zun/blkfFADtOYns4v0uejGuAgUPZh1rUd2PPsrpJXCgzIZ8l7ybYHSNcDp+O6sv
4tvtC63ooo4Hw4so+ldcrx790Wm9hQbtdcCbCLrnr8E1mStPjGevJ2Dl4oczpS9Q
59XgVlzbsimHPb6DgRPziNyjo/k9DGYMr+BRO/Ysqq5LLNde6X1bT1gpozjytV+h
UgQr5UcnPjmwgBedNGnhPntpno5xXusX3pp7LH6AJUzWI9G+okL4dMIL91iwhk0I
6vjx6PdurHVoAZHfRnaPgolpi6lnUw==
=BfEc
-----END PGP SIGNATURE-----

--bvjGEp7kODe4zFUz--
