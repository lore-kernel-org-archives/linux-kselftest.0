Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A351156F20
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771683028; cv=none; b=bQGNguzKlF4wLrj9LnhuEnAkDAjsiIO+jon8AJCj9Q8J8rc/W296VwgPL4leFEZjvdcVHrRSBFenpSMPpsicl47m9dZV769w39SIU5Bs6MXTf1DF67259Dqrchs7QwBIahDhrVcTBZOYkvho5tErVhEKHGLpv7DMO1kSnYNdioE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771683028; c=relaxed/simple;
	bh=rqthq+rpUAvYKUCj0k+7wtcGyILtP3Zgjjxo6LRxS7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PB0Luq14O1KlyyA2v6rHdS6fKimBxoA7zQvXnp8A7VGOEEdElhzK7W2GonstfxcNfUtdj/9tzZceWDyUoNxlsDVdjFgwR4ILGXrD17V+YfzOsSw9jtqtQ20zaVzS+bvpTefMyrNStA7wwtoo6hQhukR8W0DHHs7KpY6tQBfZka0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvr6LS0t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvr6LS0t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE8BC4CEF7;
	Sat, 21 Feb 2026 14:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771683027;
	bh=rqthq+rpUAvYKUCj0k+7wtcGyILtP3Zgjjxo6LRxS7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvr6LS0te74pnwW1/12VgNqs3EeprC2k1X2Mt32vPuL5QRwoKcMUH03jWVf1H1HPC
	 NRrzm37BQFTKANGXQYqPEho4pJGIbK4mqQ4W5atmqlZHdGbL5OGoQdcVNsEET+KbK6
	 D6ACmrR7mfZFs0/sMI9UE8o6X64fXDbpFrlOdUW+WgmjepBQv/Vmo0O+hrwSMRZXVD
	 F451Pj3/CdFrMf4Ps2DyJTj2F863hyyHE/xwTA4XxItj72LnPdWSXG/C9VHs1iNB7o
	 eJNWtDV1rnHTiTJo2tLR9lUY+jbgo+L/CgjbTv7RcPcZGGxhpx1zidqKhYdfuBdfq/
	 Ya9ghLFoeQn9Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5DFFC1AC5849; Sat, 21 Feb 2026 14:10:25 +0000 (GMT)
Date: Sat, 21 Feb 2026 14:10:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: David Gow <david@davidgow.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: RCU stalls running KUnit on mainline
Message-ID: <aZm80VLT0ob8im-d@sirena.co.uk>
References: <b537dc5a-f7e2-4daa-bff1-d07c5852ece5@sirena.org.uk>
 <59e8c352-7bc8-4358-af74-fee8c29280ba@davidgow.net>
 <8aa71ce7-7c83-4446-b1fa-b0f862bde53f@sirena.org.uk>
 <cb63d5d8-d174-4d65-b5a3-877533f6cbd7@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NxBSfSXpDRB4O7Us"
Content-Disposition: inline
In-Reply-To: <cb63d5d8-d174-4d65-b5a3-877533f6cbd7@gtucker.io>
X-Cookie: Think big.  Pollute the Mississippi.


--NxBSfSXpDRB4O7Us
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 20, 2026 at 04:30:19PM +0100, Guillaume Tucker wrote:

> Yes, although I've run some automated VIXI bisections and found one
> reliable panic in rcu.  I had to do it in two steps as the first
> bisection landed on a merge commit.  After a bit more investigation I
> reported what I found here:

>     https://lore.kernel.org/all/0150e237-41d2-40ae-a857-4f97ca664468@gtucker.io/

> I can bisect the other KUnit issues separately too if that helps now
> that I have a quick workaround to avoid this panic (see email).

Thanks for tracking that down and reporting!  Hopefully it gets fixed
soon and we can turn KUnit testing back on for -next, one flaw with that
check for intermittent bugs is that it's not so easy to hold back the
tree introducing the problem.

--NxBSfSXpDRB4O7Us
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmZvNAACgkQJNaLcl1U
h9ABXwf/RiN1GOQ6hCInR+HUHqKVscjkWTaiJC5DeRrZx1sUH7EXG718wgxjVNsZ
TgWtRrl1P+RlYpbr9/128EXUXVF/yH4jJQvpnIlnLPEP27nZHNESAc5Fz/zB9/Ym
7hv85SE6SjnCHGvREFlZFXEToqfPAuogFEDvOnvsG/U9W037S5H/NqVw1GyRL0Wv
C1HYWU01zQoaeyI/3MIyN/LGA3j/BpQQooQcxrUa7KD6rho405qwTmwuZ3BofpxC
rRirwlqR7zLpG+ZhfFZfNoSd6pu5xZBNeOJOQ4ydhZ4vav9sCwy/JC2RWUm1dU8k
3EeAWU6iWlmGDd9bgdck1sJjd6GOYQ==
=7rN2
-----END PGP SIGNATURE-----

--NxBSfSXpDRB4O7Us--
