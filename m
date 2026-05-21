Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288B4220F2A;
	Thu, 21 May 2026 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365207; cv=none; b=dZn35HT0GqX35FqP7qBQ6mTcfifib4trklHtujKeq+ZYyg94vjhlkEa/dFsHNgrCiZPmRGXyxQ5r9zPA34ekCql1Uq+DppW6gkISTrrPv3+w2zRLUryG5SkdDzhb1xcWipp/gMTr8n+pNwVaSBydbjkee5Oi51svXob4PirjRrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365207; c=relaxed/simple;
	bh=6zULtrGopCFhNZ6Tb2Rz3K1BwIBpUuqnOsGReXyiJCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFHDdqYlLUD52EfoMA6+Co4nwUGXYS5yO+jUXjns+ZPvnOl2vWhqlFzk32O0R4yip8q/HdK8QTreaQ/kZuEgWkTmlQukWYb46C86zENSAviCto9i0zMpwKb27NT1JHawA8YPYYU/NYFpdBr8VFqcUqzwPKb5qYyFg0BJ5Cm9e0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPKz2fOg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPKz2fOg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5721F00A3B;
	Thu, 21 May 2026 12:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779365205;
	bh=DdPSMqplxokFnI6BOtK6gRL8vbCdTn2h+eaPI1K/I8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LPKz2fOgRpN7SmzEI+Q/lEAb5AJepMtwdqvrAhd8tU5MDe2UFcWE1dGEr35MKA3MT
	 DasgHPG4RdYWBiekLwO4JX9RUvR0zZ/OYKnfbCQNgnjqhv7em/9Ja9dobQgQw2EhGx
	 6K8VahFi3ciOltwV+QtN1O3Il7kqdBRh4d95AcXgzItAIcAawWM06/oKmKJfeJoXE0
	 Q4FQcDGxW8jAhdH4+VQImjIzx2CHjhSR/OlrXL9DIrTHN8jGa/EB406iDrKHiT6Z4M
	 m+JbUAaIVFB9qBLRCYNT3XO/OcxxZ4D8HjASxH6Fpy3zUrfoFRRScxijvMlyrcBhLt
	 7VZNmvagiNy8A==
Date: Thu, 21 May 2026 13:06:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/arm64: Add test for atomic futex uaccess
 with POE
Message-ID: <eeb367a8-23f8-45ba-ac20-624d83ddcf43@sirena.org.uk>
References: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
 <20260521-poe_futex-v1-2-1da286b8f9b2@arm.com>
 <8fc7713d-6451-4f05-86cd-df833cedd94b@sirena.org.uk>
 <c140c0da-4ad7-48ed-ad83-663ada282b14@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uts9jJP3d9TWK+YD"
Content-Disposition: inline
In-Reply-To: <c140c0da-4ad7-48ed-ad83-663ada282b14@arm.com>
X-Cookie: No shirt, no shoes, no service.


--Uts9jJP3d9TWK+YD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:01:17PM +0200, Kevin Brodsky wrote:
> On 21/05/2026 13:22, Mark Brown wrote:

> > Doesn't matter while there's only one test but we should probably
> > munmap() this when we're done.

> Fair enough, I was being lazy :) A pkey_free() is also in order to be
> comprehensive, another wrapper to add. I considered using
> ../../mm/pkey-helpers.h but helpers there aren't implemented inline...
> Maybe refactoring for later.

There was another thread librifying the GUP helpers which might be a
good model:

   https://lore.kernel.org/linux-mm/20260521111801.173019-1-sarthak.sharma@arm.com/T/#t

I'm always a bit nervous about peering inside other selftest
directories, it can work well but some instances of it are relatively
frequent sources of regressions as people working in the main directory
don't think about users in other directories when doing updates.

--Uts9jJP3d9TWK+YD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoO9VAACgkQJNaLcl1U
h9DVSAf/VAEkyQTsz/fLRx3YtFCj2VfHVAXIHbu+ljIHKMHbozKj/jWZQkPp4Lc1
4q/Xbn27fq0GMD6GKlJybosoVFijN3S4tb+9VJ7b2d07bmLtnIkx68Wer4xAAt7C
Jw9ksVjgrDJUbPYrQcPF+Qv58VYdd9xu3j+lS4ihKPs3IiK9/77cWVORHm7+ldMx
XqtStOA8JNatXwm/skkV+5BOhMuVo5aFmd0HnVEV1FjyScujJMtS5jqlLoX1Cxqo
KwcpZby0wuFoSM3tub2e+uhm6KVBiL4Dhiz1eS20tSAQhgjSLwGbdo6cbigEp1X/
rz/RyJwqG3CoS2ixyAhqGOgZFjH5uA==
=0VOZ
-----END PGP SIGNATURE-----

--Uts9jJP3d9TWK+YD--
