Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBE83515C5;
	Fri, 11 Sep 2026 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139345; cv=none; b=ZbyrLxyqxiS1sr7AMz6MBg8o0VcsDoS4TeAODZHV6Ng05os+AMoyNNA0X1sTYS6hoS0YaYKqKEVBtd7aI1UkXHtndRu/Ke3E7DvSu9Fxf65XjSyr7VM0UraFRepHSiyWHUJwBDflebi3IFFVjPtKqa+s1LdE12KXKNY7QXSYj2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139345; c=relaxed/simple;
	bh=ppcBcedm4D465IJ58n/qnyBbFm5fXRIDdBbCmMInPrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzkKnVXhEc0ytD80LHWx8VAB5lAv2qHB+krQRmEzi0aY8t+TUlOTOCkzGKv4ThjNtqMuRfxd2hayEaqRUwBzygXoo7S1QzUW7P2Yy//jM7rI5MHzJsBwKKYKWS2fEuUThSEkMj04IeDAS3FMG/w6qj8NKvKhywWmkCNrlJeO9MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NS7gZy6S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NS7gZy6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7C71F000FF;
	Fri, 11 Sep 2026 15:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789139344;
	bh=kzgXhdLZSs4NxTLiyI14ZA3CfLDXqLC8jREZHJce2fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NS7gZy6SN+xnsHuNlU71+OkJM/5LHmagnlEezHZ5rT6uf9tgIQApuw8pZKspwiU8p
	 8PNJw1lTD37QHu39KAEOXpHuKba5FVQJKhnsAwk2RH7QTdkOTZN5b9XQFT0AWKzKpd
	 +C8+DVDYjUFAv5cfSGGMF/3uGRjXh/CYOsA6y1qg+2KlvGfCrvT4nM8PEjD7tha+en
	 KqCGHNmv+loLT6yVd62quyYaGXYOEdTrBIxc7oJ8aMME59uoWMht910OApVHUAHbWE
	 DQdTQ2Age9vRBLBP0vLzIUVvkmYeHKDwW0B4+JXk9kbCjoKe6XXWxDg2ZMVcfrkHEM
	 SNphhW8nrqOYg==
Date: Fri, 11 Sep 2026 16:08:59 +0100
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>, linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/alsa: Test writes to IEC958 controls
Message-ID: <4d02a638-1467-4694-99f8-7dba500944c7@sirena.org.uk>
References: <21cc0424-8b57-4be4-9555-892b980d2f74@sirena.org.uk>
 <20260911134416.1860354-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a682oqKC1836CZ7H"
Content-Disposition: inline
In-Reply-To: <20260911134416.1860354-1-sammiee5311@gmail.com>
X-Cookie: Close cover before striking.


--a682oqKC1836CZ7H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2026 at 10:44:16PM +0900, HyeongJun An wrote:
> On Tue, Sep 08, 2026 at 05:23:19PM +0100, Mark Brown wrote:

> > It seems like we should have a test that we can actually find this
> > control, right now it looks like we silently ignore it being missing.
> > Are all IEC958 controls supposed to have one of these?

> I couldn't find anything saying they must. 32 of the 36 writable
> Playback Defaults in the tree have a Con Mask, Pro Mask or Mask sibling,
> 4 don't (fsl_spdif, fsl_xcvr, uniperif_player, stm32_sai_sub). The
> driver docs only ask that mask and default share an iface, and
> sound/core doesn't check. So unless there's a rule I'm missing I'll keep
> the non audio guess for those and print that no mask was found, rather
> than fail them.

I dunno, if 32 of 36 have a mask that sounds more like there is a
standard for all practical purposes but we've got a few drivers that
could be improved to better implement things.  This is quite common with
mixer-test - we generally enforce things relatively laxly compared to
the spec.  It's probably more helpful all round to add the missing mixer
controls.

> One thing I'd like to check with you first. Failing on an advertised
> bit that's dropped turns three drivers that pass today into failures:
> au88x0 (mask says 0xff, put() reads only the FS bits), ice1712 on Delta
> 1010 and Mediastation (mask 0xff, no put callback), and rme32 in
> professional layout (mask advertises the whole emphasis field, the
> converter reads one value). I think those are the mask not matching the
> driver, which is the kind of thing the test is for, but I don't have
> any of that hardware. I'll go with strict for v3 unless you'd rather
> those were reported without failing. Happy to do either.

Yes, I think this is a reasonable thing to add - like I was saying above
it's realtively common given our lack of enforcement and general driver
quality for us to see existing bugs.  Hopefully someone with the
hardware will notice and take a look, or if they don't perhaps it's not
actually causing them problems anyway.

Thanks for working on this!

--a682oqKC1836CZ7H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkGYoACgkQJNaLcl1U
h9CPYgf/TSElJKQOsYTzDB8LAUkruaKRXRFElVJ5snrCFfmesFoYlu2uo9nnsmDU
Bew6jr7TXSyhy39PTdLpMM4UtmQ1VOZh4BdqZ9fPIuA8uoi+GPDRt0mjy5yu4+lL
EzH9ey29Cvjb8seEQZTeSAFo20e4Mf15fkqgblBikw9cBu9HKLPi21J4Q3wyjTBN
Prnkdmc8WGjeuIBvnBPH8hr5Fg/39yWddOGmgx4bkmOgLKVBlJmhraTjj6dR8Gfs
l/2davQTUTuD/Bu2bP86StCaZL+nr/OXomZ69/ZlJmlE4z6tIDI4/HipV+rFaZ4X
U992EcBxigD4UQt3M22v1IK9ZqJwgw==
=5hq8
-----END PGP SIGNATURE-----

--a682oqKC1836CZ7H--
