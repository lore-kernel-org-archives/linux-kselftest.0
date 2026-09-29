Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47C937DE8D;
	Tue, 29 Sep 2026 21:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718976; cv=none; b=EZFPfvZV7xuy7Ku6Zn7Msea0fsKj1BPykN+aNzaOu1KQUrEDBn85JejykGIBNSaK8XMUZjX8Lf/IBLR1OzFDo65VRiCGKGaVuiylB9ajO1sRxcMUh1n/hIJD09+PgaauMXs1HwvIP+TF8KHOweteajtAIDZOaPAf2THI0pmHvJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718976; c=relaxed/simple;
	bh=zUIC2VCMrwz7Mc9wvMFbGrapY6XsDKKaIKaIUQsMM/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dws3Xs5EqBIy5V++6ssWanpYYSfhzGwbX+oKYea30yGopw+YbjbTfqY4BswWbXyIASJHnWepf9v3EW2viQbdxO4EGNuaZISl3mYkc/1hfOq2+R7VPAbNO320EhXdKOqfvkwQgKIU+yfqx2e2GJOsM7fSfIQLOf6XrJiSWq7yN0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=im/ErjYU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="im/ErjYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD271F00898;
	Tue, 29 Sep 2026 21:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790718975;
	bh=Re4QQcAs/Cvsl5dDnqb8X6ZnBVY+DhJFENczAUr8r6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=im/ErjYUssfdgz/Kf72KQ0N245vq4BW+IBFkzEpUWQAoG3lSon1uiI+p32sa8Fdou
	 h7Oy535Oa89aPfdBABT/h2WoTSkyA79XbU0X6Gk+azJLeF86D89+6XxkefMS0IcTRm
	 XF+blcrtiMQN7CP1L6+k8Oj95J2XLir6SRSF7Y7VmmrVhyfzzo10T5IssJLLE5Z/FC
	 taSyRJTDVeKVgKkHirWNKhq9OjbXeC3pVJ2y7o74vZQe+IjOwpPcM1A1ctXl5w4wYU
	 zA0v7yfeFtbBpPMDEEJrvkZo4gor8xSlUnC4TXrxMAM9k9u+puj9j21FMEwBPOVEJ5
	 RSoQirlxQI/fA==
Date: Tue, 29 Sep 2026 22:56:10 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
Message-ID: <636db593-b6b6-4338-b9b0-e87c54111d14@sirena.org.uk>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
 <arvjKjrh1NU4CKPE@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zPKB6sLRXO6DyADj"
Content-Disposition: inline
In-Reply-To: <arvjKjrh1NU4CKPE@gremlin>
X-Cookie: 1 bulls, 3 cows.


--zPKB6sLRXO6DyADj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2026 at 05:22:44PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Sep 01, 2026 at 06:06:43PM +0100, Mark Brown wrote:

> > No functional change.

> I don't think this is accurate, as you're changing the register into which a
> value is loaded (x0 instead of x1).

> That seems to be correct to me, but worth calling out that you're fixing that up
> in the commit message and dropping this line.

That's actually an unintentional bugfix, the original code just uses
whatever random value was in x0 as an exit code.  Probably that was
non-zero so it all works out but still.

--zPKB6sLRXO6DyADj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq8M/oACgkQJNaLcl1U
h9DbeAf8C8nZFlnRID2OBd8OZhIoqwONWnOjUfc7e88n8BL3U3f9gqi0aLKUu21a
49TZ0kD3k7FLWElNkch4olF4stGSIOSX3oXbf/1CDqg4idW0/zJZNriF7p6olzD2
VtgfsTxGHdHmvno6HUx3mQAQ0iDghOrx4VWj/VeOmnysW+XH2xisYGx+hBTdS9To
WMZFDoE9kTTmDHHArh6KqxPcVGHEzTqJ5lgRv0Fj5p8KP/Px5QEosC+24dNnQcpR
zAiI4W2PjFFKXgUbs8QPVwWNJSz7kHNDPdCh1zfXmgShEecIX2GUrDyYR7cWzmf6
c4XrVFVy895JLbLtZviifPCyQOzP6A==
=90AP
-----END PGP SIGNATURE-----

--zPKB6sLRXO6DyADj--
