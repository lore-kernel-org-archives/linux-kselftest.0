Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB89F3D6CCF;
	Thu, 15 Oct 2026 18:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088236; cv=none; b=rMOFI2SGzYtq4k15V+kKhTzY5CRG/H/vH77ICkMSoQDYH11PhdjE1camSpV3s5XynMYdYKpMmhpkYDwWvla4UmRASMsAcKFgOdlegMqgOP3P98PXyoNFu1CtsOXw/R/pkChUXIsNDtY9czINskYNpdo0y6F354VO8eDr+i4BkIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088236; c=relaxed/simple;
	bh=4Wpd8ZaDIqKTRZJeEXKKKlTMACDQQ6OKalAajIFnFWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4wDHGWQvFDXeBdSdhFeAE1sNfdhbC9TSoFiZTXlYJY3HsEEbUQ9rHbK9dEQoOyO3/Jl7zNjiqqyC7LpaOnMDWmHFjvIkZrRogHmHbpLzppmxH4vpgdZ1suCLZLQMeAcoufqIv1kMXNJhM1Q+pEhbBtGSf5U6JDFLXgzcuAP+VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpsdpARh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpsdpARh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FA21F000C4;
	Thu, 15 Oct 2026 18:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792088223;
	bh=4Wpd8ZaDIqKTRZJeEXKKKlTMACDQQ6OKalAajIFnFWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LpsdpARhGYr41eV1EMUdnUedxaFou091rS8T/+A9xI9vvMiuDo7Q7bm5AZ3zfwa4/
	 /Nia4CIz5t5Pqq5sRM42kJz2JQ464mDT5N/7nt/a6WtfZVhAJThnsZuUgcGIC94Ea8
	 lIiZJlIBRjd3GjqzzOuvmNji2D2WSHaPfBCdVFTjDe6Y9kPFY/KINkpzGW+hw0+Y9Y
	 wBmonE1Q0sJBBQermpHDmPOmASiofJENOWA4KnMvCVREzqZ6VbUotRZgcaKFm//YPM
	 6f+eajbxaQ6L2kaXprbfwzrzp6sdDlkhcJU+bYQrsJ4aTaurHlMSCygxFqHY3DK8we
	 QRwe954fzEauw==
Date: Thu, 15 Oct 2026 19:16:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Ricardo =?iso-8859-1?Q?B=2E_Marli=E8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] kselftest/arm64: keep building and installing after
 a subdirectory fails
Message-ID: <5527ee60-e0bd-46d5-b63e-8a39fbdf2ad7@sirena.org.uk>
References: <20261014200115.1363363-1-sashal@kernel.org>
 <20261014200115.1363363-5-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NYWNnkWlSL6zYjFJ"
Content-Disposition: inline
In-Reply-To: <20261014200115.1363363-5-sashal@kernel.org>
X-Cookie: Tax and title extra.


--NYWNnkWlSL6zYjFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2026 at 04:01:12PM -0400, Sasha Levin wrote:
> The arm64 suite builds and installs its subdirectories in shell loops
> whose status is that of the last subdirectory. A failure in an earlier
> subdirectory is therefore lost unless FORCE_TARGETS is set, while a
> failure in the last one fails "make all" and, through "install: all",
> drops the installation of every other arm64 test as well.

> Make each loop fail only when no subdirectory succeeds, which matches
> how the top-level selftests Makefile treats its targets, and keep
> stopping at the first failure when FORCE_TARGETS is set. When a build
> report is requested, record each subdirectory as arm64/<subdir> so that
> a partially built suite is visible even though make succeeds.

Reviewed-by: Mark Brown <broonie@kernel.org>

I can't help but think it might be less annoying to convert these into
separate TARGETS but that disrupts everyone's results which isn't ideal.

--NYWNnkWlSL6zYjFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrRGJkACgkQJNaLcl1U
h9DQFQf+LiGBnxMlC8Nft/57njPqtSr4IrbEOYXfDtnVtE8C/qIDTms81g1IsDl9
ZsD5vzOSkVbGBsoFyWpurQfTf8ryWE0FlSxsSXC7S++ewunXZ+RLG5s7cVDHdqEt
45DtK73sods62xPWOohEwTf3GWlxEupQs3GuRmbFbC4qsuUSRrygBDa74bGUMOdD
v5LdfkpZmVnR71bi9zkcLkUPPhd7G6PfktHl9l9u4eN1U8c52tCYrgaqvkkoY+8f
oWzMotzmNe2M7/GZ/yV9WNtAYwsWk11/3XLzpg0AdrvNzaqUrivQqKN1Wb1IRfaB
amVPv/R1ZMmYwXbDArYC+mEi+syHtQ==
=SPc5
-----END PGP SIGNATURE-----

--NYWNnkWlSL6zYjFJ--
