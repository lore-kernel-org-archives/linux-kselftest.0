Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB193D9040;
	Tue, 21 Apr 2026 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776783505; cv=none; b=T4dGs6Q5jXL0kQjrSncrgZbvGxNWXQqtc1D+VKm11uitSftgFHZri26MPFdnoP6/pcf0WKIxOrSWCJ1Z9oGX68MTko+2NrS9/8mGLU49QiQC/ttSBYKHF6DBXY9tJkZPC7+pKWn6+iKHZpCRpN0dpah+2ioesQgluerEzk7bumY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776783505; c=relaxed/simple;
	bh=o08zvgVs/uglGhM5GgyiOdyS8YU6TA/C31x9P8r6wxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnmrZDJXw0Sk7HZeV00DkcGfOgZMyAPkilHmQPJxQSWnShzZIg7SdYJO1Dge8pUFsPpkzX9EufH8YPRjGdpSSoptb/tVgxXOk01dDAMM6kBbHsIocEeYKDDhkxUfC5SekXT0IWJ1E8Av2+vJH00esg9kMVpnIxkety4lklMXFyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kR3atssm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kR3atssm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652F9C2BCB0;
	Tue, 21 Apr 2026 14:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776783505;
	bh=o08zvgVs/uglGhM5GgyiOdyS8YU6TA/C31x9P8r6wxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kR3atssmQ+T7d/q3/arTXviH+DDAiikosMNgJN8PZ7Z0gzzceXyDYgY4P39L74WmC
	 TldUt5KoWJ8mIptTD+dwLnBisWpD+HyIw6JgQbU1Q4LOCoC7AkQkJhmCxVtJ1XFH2Y
	 83Ss6rgxmGf4R3wYMjfDrMPrdQ/4kVfs+o95tyLqXP1c61n7qWve96J8dhLpJrXlld
	 jRy8Y+hdPhwX11z09iCK6fvoEWqu9p2YIf1O+GF2heWOUz/IxMC4ZduhhoGe2sGKkA
	 aOfo5iCJ3c/ac/W/AME/reFI3d/MjwqW+0oKht7cLI4oVmCbCmAqY8BQtsxZJkT+nt
	 ytHwoRUzKquZg==
Date: Tue, 21 Apr 2026 15:58:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] kselftest/arm64: Add POE as a feature in the signal
 tests
Message-ID: <e9b7591d-9b8d-4e76-9c0c-814507a95fdd@sirena.org.uk>
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
 <20260421144252.1440365-3-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gg5tHGD+6ZP7azO2"
Content-Disposition: inline
In-Reply-To: <20260421144252.1440365-3-kevin.brodsky@arm.com>
X-Cookie: Jenkinson's Law:


--Gg5tHGD+6ZP7azO2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2026 at 03:42:50PM +0100, Kevin Brodsky wrote:
> Add the POE feature to the signal tests framework, to allow tests to
> require it.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Gg5tHGD+6ZP7azO2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnnkIsACgkQJNaLcl1U
h9BQ/wf/d+d8Dj4exxJCYGsm0nHnz4H26nZTo2KflCuh6+B53Zpb5XAtt/TCll5C
NAu/LWNLwOo9pBjFv/W59vH4+KUtMGrZcat3T/TWF9tMc76ROnYvvVpVvkHS9rzF
WpL2q7M6Rz/eJTXQz3Zhc84+B/NoC4/UzDLSarO05ERYX8+uhfZjzPb0NOexpqFP
v1kEUdp++EsVSoOvWyqpqTiRNuyYQ1WDrSWElj4/IpsSePDaD2EdFIeUaD74n0uY
Ib8Fxyw4m+sj7a59r5yPVvxE0Gp9rfFfCv2S9jB9plqtyIrme30PCUnBWI0FfGBp
6NoQiF/59bK8lU2W276mTqZc+G4oqA==
=r3w3
-----END PGP SIGNATURE-----

--Gg5tHGD+6ZP7azO2--
