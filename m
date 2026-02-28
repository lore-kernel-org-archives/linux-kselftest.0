Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333B8F48
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 13:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772285014; cv=none; b=KZj05usQjkvTdfFk+bcRJpuEaS4tb+a7SKS+39nr2GHThABzNQnRZGZlFWJqNt4yOIVyZdJoIFPqrLEhL84JJGCTnwXOVk4DJ+RRRF+DJU11M78bDRbdnpejVVgEXA6vYKStsMCNuKqYu4msP9ND6ZpfX6S4snnRlEfdmrcLjy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772285014; c=relaxed/simple;
	bh=4Yj1EOrYm8+kTVyue/2AFT2KdrUGzw+HB8PkTXeSxio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpMSr19D+sIqWTuf6wvIC6TSIjXkPY2F5Y9j+ypzUp8S3msHoxQDTlxdSKLvd+PBliwQSRTYkoBnoov4Ht3mGBwBScThB4ha0gWUHQDS9hVESov41fsnw3iFJ9sK/+upxPK9jsihM+AR4Os4Up2yA7XlDYJDGugPsAMpgepZKEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chjrN0Fd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chjrN0Fd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2144C116D0;
	Sat, 28 Feb 2026 13:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772285014;
	bh=4Yj1EOrYm8+kTVyue/2AFT2KdrUGzw+HB8PkTXeSxio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chjrN0FdkuKv3ZAFUO1jVGIdRk2RZv+HZ9rWxUG7P52F1QwhWZJSnWgmJZcMOwNTL
	 YwxFqgTUuZfnt4ThNmWJrGv8TW417QRhQUbkfOwykDPBMH5H1VnucMa0X1wzy3KRqy
	 bgGtM60agNLBzUy+Za4e5dDBzlKsD2shgd5+6R+5AldNNgr6PEacB54BSrH0BWEzVQ
	 udh0tPAMI+ny8LtuixB8kgyAY0pQk1n8nx+xEJ0Xmxn5LlKerpMWbNczlNI68GbiP5
	 bH13AhoH4pBlqJUxxOs/T9FYJd4yY72GriCPDr5y83+FHmIYrDGHb7o5LYa55CloCI
	 9IuLGCcLzsmMg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 533B41AC58E5; Sat, 28 Feb 2026 13:23:31 +0000 (GMT)
Date: Sat, 28 Feb 2026 13:23:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Yifan Wu <wuyifan50@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	yeoreum.yun@arm.com, jonathan.cameron@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linuxarm@huawei.com,
	xiaqinxin@huawei.com, prime.zeng@hisilicon.com,
	wangyushan12@huawei.com, xuwei5@huawei.com, fanghao11@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH 1/2] selftests/arm64: Implement cmpbr_sigill() to hwcap
 test
Message-ID: <aaLsU2sBQh3nW9c6@sirena.co.uk>
References: <20260227031933.4103333-1-wuyifan50@huawei.com>
 <20260227031933.4103333-2-wuyifan50@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ASHESnB7++zp1NOZ"
Content-Disposition: inline
In-Reply-To: <20260227031933.4103333-2-wuyifan50@huawei.com>
X-Cookie: Think big.  Pollute the Mississippi.


--ASHESnB7++zp1NOZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 27, 2026 at 11:19:32AM +0800, Yifan Wu wrote:

>  static void cmpbr_sigill(void)
>  {
> -	/* Not implemented, too complicated and unreliable anyway */
> +	/* CBEQ x0, x0, +8 */
> +	asm volatile(".inst 0x74C00040" : : : "x0");
> +	/* UDF #0 */
> +	asm volatile("udf #0" : : : );
>  }

I don't expect it to make a difference but it'd be nice if these were a
single asm volatile statement, just to make it absolutely clear that no
instrumentation or anything is supposed to go between the two.

--ASHESnB7++zp1NOZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmi7FIACgkQJNaLcl1U
h9D5ywf+PpCU63C+509/td+BWIUvUQQGyyK0Dt72wx27bQLQA5hKa2z3GggUFE4S
JSrtu+H1qBKKvgyuC+SnhEj0yTHWLrGMg7U4kCVEsg5bHT+Z75wMq/cBWzIYFKC/
v1jc24ZvGYUxasv2LQlxbphC/cjGNidebrHkdl+5+M04Ov/CTFzuBbTj4KqbLZ6n
dWOCQr85IgFQwzI+GqRpZG4ajhXjm0qZibgyTeDAm7JewFP1QFYO7+GY19PCiK9r
xnHRjGUcZb4isNjWXiMOo4p3Aho8FtL06JTIVkxT428tdvk5tGrJm1y/pHvamXaG
f/tdSX/RJGv0qP2W138B68L3kJwZMg==
=16LT
-----END PGP SIGNATURE-----

--ASHESnB7++zp1NOZ--
