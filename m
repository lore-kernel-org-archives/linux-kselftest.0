Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A673DF002;
	Thu, 15 Oct 2026 18:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792087250; cv=none; b=YHrfkdA2EPDUEKhTbEpKq/VLwcqpRClawp1v4fJHMn/AtXmOe0CTnviELGDLV2CsW2t3obxszbQln1gzfyiCq4k0gxqfQRD8/0XG2mPLKmZiFG9H+7MdwQ0Y2KRyud0XQVMf02NYLyQ2ba0mZWo250LZv1/VEzlQ8VPK8l2YmHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792087250; c=relaxed/simple;
	bh=HGRhgs0YTRt2Egqbh5D7928fazb2gNLd1N7x8T6paVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdCdnHKMtbhYo3T+LNADM3MeCsQPCOcNTdMsKyRoAM1STyZm5XadE17eOvghpdt3IS16hsACL26WGUnGkmW8ONkjSljQ7dlojV8HiZ8etu59M4Ac4ydBtJrOyGZPcaVoTgheAgeTK4PUR5k90reSA9aChOK9oGIbAgmU8BJaa0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUd/YYIx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUd/YYIx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697DC1F000C8;
	Thu, 15 Oct 2026 18:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792087239;
	bh=HGRhgs0YTRt2Egqbh5D7928fazb2gNLd1N7x8T6paVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gUd/YYIxeYk7OF2DxSicuxLDZGuS8V0VOPR6C5ZP/0Qyza86uy7DWiISMClLxUe+D
	 LTqPptJoNGkCBmWTGip/q6CDgzyLHL6frWY0h2YpIXUpDl1jeis82USIEjTnWG9+aq
	 uY6GSJ396GXNnUiy09HBjSKCF7X+ciUHQ5Kt+YjSrniBJivb0iZ49HVEQfh+v8U7AY
	 hRb2k7fEmsoy6TXZl3dcFxmY0Av4WE4t1tiZsw974UxmqFHEq0DpWVORFuRl2zjKns
	 zpFUgZfWFRmPuOJF16RtrySdLXRcZCyBvuWiAnR5OiI/JTW820y6WU6MunICvpEdHG
	 H/V1s3xUazZpw==
Date: Thu, 15 Oct 2026 19:00:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	Ricardo =?iso-8859-1?Q?B=2E_Marli=E8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] selftests: keep the build status from wrapping to
 success
Message-ID: <f64e8221-cedb-4b4e-aed4-a87ac23c26cf@sirena.org.uk>
References: <20261014200115.1363363-1-sashal@kernel.org>
 <20261014200115.1363363-2-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1ZgetmzRbUVnSdeg"
Content-Disposition: inline
In-Reply-To: <20261014200115.1363363-2-sashal@kernel.org>
X-Cookie: Tax and title extra.


--1ZgetmzRbUVnSdeg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2026 at 04:01:09PM -0400, Sasha Levin wrote:

> Record a successful target instead of multiplying statuses. The rules
> still fail only when no target succeeds, and FORCE_TARGETS still stops
> at the first failure.

Reviewed-by: Mark Brown <broonie@kernel.org>

--1ZgetmzRbUVnSdeg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrRFMMACgkQJNaLcl1U
h9BQdQf+OliQ0dUqua4MpWOPO5fKMFhEJCXpeQdceH0WCwGi4jQwqxXCkBlt2Vk3
7f/QOuJkOROv9paHpIz3I0HpkYQmT4w3F5ch5svvfena89MJLb8xA+AI/81P1f7S
1SFazw/y8PiQwjJi2nd/F/EHXubZYi7JAclG9mT20CH+h4wkBNbdhCPt46Xil5r5
r6gaTWpanUrcuyT5nRbnomb1j96ns+cwO8xjPg2XaMquFLOT7F9JFpUgmxMytQAu
6LnMPn6eO9QFKHbO0eoP3d2UTO6lhpg59+Lh0PTJwTViiQRzfbxYFy8qjFlhkUMj
r38c3LLRmCQ9mxUZMUSOcIft5L0Wgg==
=OKGF
-----END PGP SIGNATURE-----

--1ZgetmzRbUVnSdeg--
