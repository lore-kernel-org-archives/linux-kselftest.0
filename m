Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93262333429;
	Fri,  4 Sep 2026 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517271; cv=none; b=VEKfApSHkOYjT8NtHsr+/k6be0XBZp4UgLPStYf/uo/lBUv3Wqm3BXxk2VRvymjjxyy+K9HF949l5CAasPrA+o6wf89eMGP+YMYGzVvmZyix9V+vh3/8WhUNcIc1q/hy2v/C06mknTK6vQCU1a2y6FAJNJgRM4rGcuDM5GJDyFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517271; c=relaxed/simple;
	bh=S8RihI4BwJzUzxKmvTIduWbDdVRytf5mEqrzMAXTa5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRGP8JXWyJA3fBSkc844Id+2eeesRycfMPv+V9RgdF+wx1VG5nfhg3C2K+VbfyXjO1OaN3iFOLHvKr5moc5MiUGCV+3cjZ3TOHO5pHfQePKXMU6ajudMFqfTgMCwtBPQlcK84vbeQ9H+4HlvUAakowGiZ0EiMOjTj1YxzFTwZ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZigLBqAv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZigLBqAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DF01F00A3D;
	Fri,  4 Sep 2026 10:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788517259;
	bh=XU8aCrhOETyBfO+73JloONLIrIJD004kwUnOWuao5n4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZigLBqAvcW34px07bOy6XpV/N+ImTSQ6nJn9+PjdculoGgQQ4vCVDQIAznUUOTOY7
	 o3d/vgzFr2+aRBQoA8MpfHxa80gtESMHP591+NgWWZ/c6VAEFVAcDCO0pfNTD9jN7w
	 oVk4jGF2e50JZbYlIlglPBe/WpBkLrKfKxAY1vD+sWEikskwiCAJfYPMk0JBjsyIeA
	 GwJK06EMEB+38FiASagoi2kCcrgOgbDkjGJKhNlJVbFL/w1ROslu5zZznzbJN3/7SA
	 kwmi5AXXkfIJNDuyA9R18Ga3IWRjpVG3HopZ4jr3DYNpzHGzQUZcTQ28Sb5d1Ynrso
	 ymJDfsGw2Ln2g==
Date: Fri, 4 Sep 2026 11:20:54 +0100
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>, linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/alsa: Test writes to IEC958 controls
Message-ID: <857e7970-002a-407f-b5ac-6a38ae6a9101@sirena.org.uk>
References: <20260904021939.149468-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LHzYKjPZnZzDT1I9"
Content-Disposition: inline
In-Reply-To: <20260904021939.149468-1-sammiee5311@gmail.com>
X-Cookie: A is for Apple.


--LHzYKjPZnZzDT1I9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 11:19:39AM +0900, HyeongJun An wrote:
> Nothing checks that the put() callback of an IEC958 control reports a
> change, because write_valid skips these controls.

> +/*
> + * Throw away the events from a write we are not grading, one left behind
> + * would make a missing notification look like a notification we got.
> + */
> +static int drop_events(struct ctl_data *ctl)
> +{
> +	int err;
> +
> +	do {
> +		err = wait_for_event(ctl, 0);
> +	} while (err > 0);
> +
> +	return err;
> +}

This seems like an unrelated change that wasn't noted in the changelog,
and one that should be made for all control types if we're going to make
it.

--LHzYKjPZnZzDT1I9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqam4YACgkQJNaLcl1U
h9C7ZAf/XoDogke1SxeuaPRuTu6YFFVy2jaPSpZ3aLr/1bx5JA+RXH6IzqnuV3OD
E3iB5WA3m9remvU6vPDXXi/pkItLG7CUYZyboFjCCL/6G49RKkF/jCDXBOTbtIDx
4sCCs8iZCid1hSH2o3qxWk7pTlYDylATi3kXHNon63tr6dWfVwXO1/vMHQRdqzY+
XGfELezwa05+J8M+jUUfssBhkJYH5bRW04BNo8/gy5aDJmoMJAcKMxA7Fni2C3Tx
RdxcuEnRUuHrsK4y6yN4PgSnPNh+mZVH0fnh2veohBp/jwTI4B/ZZPt9exGqnLBM
fbWqUTsi/T2ekhAzq+Y+gMCPfKFOOg==
=XQ+R
-----END PGP SIGNATURE-----

--LHzYKjPZnZzDT1I9--
