Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21C63A8735;
	Tue, 21 Apr 2026 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776783640; cv=none; b=qALPrcTh5opi+MTKWFT9EwhMaPCp4MpBb0xAeIBcpqXdobKMhrlt5j+PxLX8QX1CW9YELEOudL9PyyFDaH4yU/pkxOfEZ9vo3xRcxWBN2dA54yRWQbNChat3cGgOvVoLjB8+OfmZdmeykfSj5CrsNxs6sa44v6we/ONFZtyMi70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776783640; c=relaxed/simple;
	bh=BY4ZcYeKT1ZmWpHrs72wtBIW2jKai2+yD2DksELsrlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPCxK/I5I0ESbiOK1MYSwxzcuBJHeC92q9NH/x/i3l6tpHshP5Nk5QmiFSP59s3x2JCmPSbRg9R0jiFezCbHmXz0GoerLS19mnV0YMWukBegNXQ3tiFwGVsAPEZMebFzYnLLfDe7zpCJYBfZCtWxXeGNyt3srwtvu3sSKpBETDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERt1o4lL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERt1o4lL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CA3C2BCB3;
	Tue, 21 Apr 2026 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776783640;
	bh=BY4ZcYeKT1ZmWpHrs72wtBIW2jKai2+yD2DksELsrlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERt1o4lL3QHb0fVTF8vh9a3mUdbO0p5VO/YRBwmuIRL94sD/tyTyP6aeWj006xAvS
	 +ZJ2z29sOxThUErLS3YqW5ZC7mMN2cYxlUKDe6iRNssdIwKiVucWSIKTHqTChO+wO1
	 6CqYw2cL2JvDiMCUNRoou6+klBt5InVISxO+3wgFXBi2bL1mNZH+AWXj/f/BUyeqBG
	 k6xCiw795YyRG2oP8xekQFwA8SwlxXMXbDVzBny9FwaDUvcUWlodQbIhsIThk5uTLG
	 z9Lu81IAUEbeaG6g4Xh08/OxKCPw0OzvFouIoPqjPaCChTFrkEc1Lq7b8BjDlj2Z2k
	 5Hi/TnF7VsFCg==
Date: Tue, 21 Apr 2026 16:00:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/4] kselftest/arm64: Add POE helpers to
 test_signals_utils.h
Message-ID: <2d02b94d-c52c-45f2-9109-b026ee180364@sirena.org.uk>
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
 <20260421144252.1440365-4-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="knx1Nj6YYBbldjdt"
Content-Disposition: inline
In-Reply-To: <20260421144252.1440365-4-kevin.brodsky@arm.com>
X-Cookie: Jenkinson's Law:


--knx1Nj6YYBbldjdt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2026 at 03:42:51PM +0100, Kevin Brodsky wrote:

> In preparation to adding further POE signal tests, move
> get_por_el0() to test_signals_utils.h and add set_por_el0().

Subject line should probably also say move if there's a v2 but otherwise

Reviewed-by: Mark Brown <broonie@kernel.org>

--knx1Nj6YYBbldjdt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnnkRMACgkQJNaLcl1U
h9Azogf/SQqDAwRupQHxGlne5yRQN/rE6ll2wslCxDlxuUPdO+ZLDluxI0/NJnrf
QrfU4Qx17GUnsB0kS7gCpXwmFqYXoQyhBJa9abKmLrD4nw/4snua/MSDiZ9Hut/Q
jucnIBt4D5KAidScivrMfdpH9iUNadvtJj/0KeYSKznpbL6dcUvA5cNMeGFFn9Bd
Po/nmHgB+gXVnX5FVlP/wur0u1Ak5Y9IhV6tAnTEizZdmPTB6CV6dntecXhljOFb
obyaKqIsWAlb28Ts69R2nb+HtHqfJzEHLXelnY9LoShEPrCy7r7Rhy7quVIvu46p
PaeSUZmZdyessufDP6qeTnEaUsSzZA==
=PI4t
-----END PGP SIGNATURE-----

--knx1Nj6YYBbldjdt--
