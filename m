Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEB43A1CD;
	Thu,  5 Mar 2026 14:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772720138; cv=none; b=BbGWj+R8LGJtIv4IA3zqHTkr6RdlBeav3AJ6eC5p1/g+iL4p5ERGPHF/vold5eDijFWp0Zgu0MFaPe6DZRkMZn/5/xxHlhzU1PyuyVunjammmLGSVjXXf0CPLhgCmjXMMkGqYuCwr94443UiuCLnfU71chcrVMbT6oQ+xTRD4EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772720138; c=relaxed/simple;
	bh=lwFZtwwUHU51thyn9ZTePSP0KyHtnuAeJ2If0LKZXIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tm4Hp1fkYA/batwoBThpv4XfpfA01KEsg0nFQ7yky9ocClH7SrB+fn/NxrcSxNMEbFrC3pRcdN1U+HSAmurPoJLp0fgmOWPp2D06qR+GjR0SHMSXZpK5ezOK6TKv+V/r6SFa9x3if7IqtTJWH9HipzL1w7PVsA0qWlTE3qnQ9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qoIS2LOr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qoIS2LOr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41342C116C6;
	Thu,  5 Mar 2026 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772720138;
	bh=lwFZtwwUHU51thyn9ZTePSP0KyHtnuAeJ2If0LKZXIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoIS2LOr7V02/EFRBwqdAJUmleXkuyNvIkmxwsOIMzyI+Mmpls4CGh/d4sSH3AnCS
	 Zh7Bi33nhwMP/U1ZTX2QkDZ7hZ2DuIZSOG5LplAdv3qMK3ZEnV5yTHdBdjlvwFW+V9
	 65PY8RuH6S6PB5VElq9uygBWL0KeWmISQyowprMtjgea9uYhBc57B9a7us87DRORGm
	 nwbr6Cfx57JAI5jch6bkqY9LQ40+rIzA/tjAaG4pg5uCf4z3RcVZzUxkdI2mDJZxad
	 ycAzU+ORpteFvhPrNJ+C439GiZHLIqxEjyZRWacIRdN4cHktaIFZj/P232PSg/79R7
	 XWirhF0CxDrLg==
Date: Thu, 5 Mar 2026 14:15:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Yifan Wu <wuyifan50@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	yeoreum.yun@arm.com, jonathan.cameron@huawei.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linuxarm@huawei.com,
	xiaqinxin@huawei.com, prime.zeng@hisilicon.com,
	wangyushan12@huawei.com, xuwei5@huawei.com, fanghao11@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v2 2/2] selftests/arm64: Implement cmpbr_sigill() to
 hwcap test
Message-ID: <9e4e0af5-992a-46d5-9e5c-21ef747498f9@sirena.org.uk>
References: <20260305013638.992301-1-wuyifan50@huawei.com>
 <20260305013638.992301-3-wuyifan50@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F1N8Q+cYn7f9aq1L"
Content-Disposition: inline
In-Reply-To: <20260305013638.992301-3-wuyifan50@huawei.com>
X-Cookie: Onward through the fog.


--F1N8Q+cYn7f9aq1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 05, 2026 at 09:36:38AM +0800, Yifan Wu wrote:

> The function executes a CBEQ instruction which is valid if the CPU
> supports the CMPBR extension. The CBEQ branches to skip the following
> UDF instruction, and no SIGILL is generated. Otherwise, it will
> generate a SIGILL.

Reviewed-by: Mark Brown <broonie@kernel.org>

--F1N8Q+cYn7f9aq1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmpkAMACgkQJNaLcl1U
h9CNbgf+M2ibIDYwmqQ3xHMNxWIfRowucYliLdhtvGU8lCixXS3u9NLLggngaIv6
l62DHNfWJResPAz+9ENbXcUNDancgqZzYOkF20jCKUhQAq6LgPcSuAeZCjrpoq7g
F07cbectKD5R+t6hlSsQFv5hfp2ltC/TpWovGbSrPIVP8WWe7TexR7jbdx+itdvO
HuHwsiFPeZPRL4Ru6DXGnJvVO2zcjYUOH+aIP4VoXoNszt0zhH3DZWnwA17V7OW+
PkQm/rqcV29zYL00C0gAHZ++O8tmdm42AYihqaqLDV8tlwlrC+oSlMuXolFxOQW7
lj8zDJ0cCQjNYv7THHdt3JHBXqQ/Dw==
=ClP2
-----END PGP SIGNATURE-----

--F1N8Q+cYn7f9aq1L--
