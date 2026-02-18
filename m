Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE76283FF9
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 19:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771443110; cv=none; b=j35CqFlrSdQNZnUQUzfKpTF8NpWBrwvjsMzIexEyEh5dFNaJkCj0U5UNXqPPR+0jyE56jwe7Yp1kkD9YekpNEVjKA7ZOjsahLyab7KXDEBBS8J3X76WeZQ1V0CiKLQcTURi545JU0bS8SDQTk+6nN++nlhtjZdNmNiKMdGODFkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771443110; c=relaxed/simple;
	bh=CMRnMoPWJhgwkZolqvptXvKX3kf6HRjOgRZc1QOo+b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHUK2GCb9SkWR9Bd/eoSWqxcNGQusXnOfuqLrHtl8PfL7qKaQy9bQtJnvM5y90a3SnPpfdDROANWfelxucglicGdVhsEuWAiJd/IG0jHd2nyvT1cTOIfCyQ6gq2qLtjgx0N1/69nr8bLxF7llHD/fwRYvtgN7iIZLp8v/41Bfq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icOfzfH1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icOfzfH1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77EAC116D0;
	Wed, 18 Feb 2026 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771443110;
	bh=CMRnMoPWJhgwkZolqvptXvKX3kf6HRjOgRZc1QOo+b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icOfzfH1Oz8yOGs5mGz7wv2jdIIw4eNectn/AWoj9N8eGCenBy+FImBh9NYaUqAnC
	 BDKMuLqz4fMH+yjnFJDDCZQgGloJWyMnQlJtTf73FAGAKdaY8GQpLymtqueIj+nWC1
	 Z9ch1NywQeg8HOQLIEn/uvhVCobKEx5DMt2IOV6Sy8CaWgzaruRPfDPcwS+F62XPp+
	 infVvBs363yuqUnxSsXvAtKjs4b95qu8vbCSmCqnd3E3+SGYbxhPv4UwdKMgKPvqeb
	 xhDi/Jwgig8/33Ftgvre8Ek/vW1Wed58FJ8/YSfEtAVSKYDqJY54VR09xOihGhKfRR
	 FX6C3ZCa9uYGw==
Date: Wed, 18 Feb 2026 19:31:46 +0000
From: Mark Brown <broonie@kernel.org>
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: RCU stalls running KUnit on mainline
Message-ID: <8aa71ce7-7c83-4446-b1fa-b0f862bde53f@sirena.org.uk>
References: <b537dc5a-f7e2-4daa-bff1-d07c5852ece5@sirena.org.uk>
 <59e8c352-7bc8-4358-af74-fee8c29280ba@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XvlMryOiu4s4iKec"
Content-Disposition: inline
In-Reply-To: <59e8c352-7bc8-4358-af74-fee8c29280ba@davidgow.net>
X-Cookie: Avoid contact with eyes.


--XvlMryOiu4s4iKec
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 04:53:16PM +0800, David Gow wrote:
> Le 17/02/2026 =E0 10:10 PM, 'Mark Brown' via KUnit Development a =E9crit=
=A0:
> > When running KUnit via qemu on current mailine I'm seeing random
> > lockups, frequently but not always reporting an RCU stall.
> > Unfortunately these don't seem to happen in a consistent place which
> > makes it hard to figure out exactly what's going on, they started in
> > -next at some point shortly before or early in the merge window but I've
> > never managed to drill down and investigate them.  I don't imagine
> > they're due to KUnit specifically, though it seems likely some test is
> > triggering them.  Has anyone else seen this, or do you have any leads?

> I've not been able to reproduce it after reverting the kthread affinity
> series (git revert -m1 d16738a4e79e55b2c3c9ff4fb7b74a4a24723515), but that
> could just be due to luck. It's flaky enough that my attempt at bisection
> kept pointing at documentation patches.

One other data point is that there's some range of commits which
generates an actual failure in the runtime PM tests:

[19:26:28] [PASSED] pm_runtime_disabled_test
[19:26:28] Unable to handle kernel execute from non-executable memory at vi=
rtual address fff000000145f358
=2E..
[19:26:28] Call trace:
[19:26:28]  0xfff000000145f358 (P)
[19:26:28]  rpm_callback+0x74/0x80
[19:26:28]  rpm_resume+0x3cc/0x6a0
[19:26:28]  __pm_runtime_resume+0x50/0x9c
[19:26:28]  device_release_driver_internal+0xd0/0x224
[19:26:28]  device_release_driver+0x18/0x24
[19:26:28]  bus_remove_device+0xd0/0x114
[19:26:28]  device_del+0x14c/0x408
[19:26:28]  device_unregister+0x18/0x38
[19:26:28]  device_unregister_wrapper+0x10/0x20
[19:26:28]  __kunit_action_free+0x14/0x20
=2E..
[19:26:28] [FAILED] pm_runtime_error_test

which might upset bisections.

--XvlMryOiu4s4iKec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmWE6EACgkQJNaLcl1U
h9DUdAf/RJCKp/AIYTqR/pIuYJLRra4/ZKd48Vkum6SQljhlxesvgRAABFEip8Ei
jYa8O6pIKY7Aoeobj1M6jkV9WhqRZ0r8s8zyk7ht+7FzWaV9TcFQ5s6cBH6TV1iI
6TlpPTls/k46E7ncZyhciljORcMAtWivAZrec35u8jkjAK911yXzqRgru8sce59L
QJDodP+Fewy4QgGRCk+ntba0PxIrwelP03n/gaAOEwImJ0UhA6j4lmgKVrsP+TT+
UxGosJwP6Bc3es8bLJvUToxdnDvpQT0cHJ3bTey5pGASEZ1zmf2OVngI+ugIVD5o
gNZU/Za1ByUxcUnl7GviFf3xJQcanA==
=BDDF
-----END PGP SIGNATURE-----

--XvlMryOiu4s4iKec--
