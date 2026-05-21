Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E502F25E4;
	Thu, 21 May 2026 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362556; cv=none; b=bu+FEkZO1F1GbOEOs8SV7UUIlJEkasvAJucf0hftyTz7dnOdQopfz1L0aDdXKfy7cOOUpkprq84NNqBN0lHmJIC0mWCcR/9cvk7Gz+l1ZVDwJrl1tfhVJ+1S9ckpmbsFcFclGQbex8dtFLUzE5dhg9ez2Ptl4a6BteyoR23en48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362556; c=relaxed/simple;
	bh=obfXihmBstNTo7SHhzWMdL0kUh4Z6AH+sp0RLZbcpwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4NW1RhehEi87hc/Nnj+5WmmuWUIi6xtIzdmk4/vFEFcJHkbghueuuam3lPtIN/6Y993a7etVEViF1D7g1tcwqUD/J7+hwC79PtV37/PGUvaWKdX1YdLh2eG71LvMxJ2RfNkdvKdR9tgcmZM2PFQWn0Wozg4ZASiYbjPBR381gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/qNH1bM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/qNH1bM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D2C1F000E9;
	Thu, 21 May 2026 11:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779362554;
	bh=VUJnhxSzF/JjiGI40PuXjiACHn4MaFrGkULPDFp60Zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P/qNH1bMbeo7E7xYFTDiDBSadXT01q9ZrLrONJ29Vm2++HT++qtgkvdaUUCfjM3Ix
	 kWfIb0+MlIMOABVGXgpbeudrXfpSNvSTEBPvTdL9J1zCv1MLjLouw5KtNGXFM6g9f0
	 HAtnPr7vZIw66a6v0DPZSpTre2LuZPgW9RV/HMJy+Qti7mnKoIRdtSlbGZ5PAleG4f
	 TaNR6o6tCbLQwnvZFSZtlJjc0XdSgHkbWf6/BQCBJBc++3JJI+bNo9SWmD7J58VqiK
	 d/dJQksj+tjZScbDazJHyaPL3XZbVHN5LG8ULtX7qW0QA4nj+ghPQjwqoKs/jvWv9W
	 +TgMJPlDIEq7A==
Date: Thu, 21 May 2026 12:22:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/arm64: Add test for atomic futex uaccess
 with POE
Message-ID: <8fc7713d-6451-4f05-86cd-df833cedd94b@sirena.org.uk>
References: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
 <20260521-poe_futex-v1-2-1da286b8f9b2@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8gHwo4h6itunB5YS"
Content-Disposition: inline
In-Reply-To: <20260521-poe_futex-v1-2-1da286b8f9b2@arm.com>
X-Cookie: No shirt, no shoes, no service.


--8gHwo4h6itunB5YS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 10:42:31AM +0100, Kevin Brodsky wrote:

> Add a new test to ensure that atomic futex uaccess succeeds on
> memory mapped with a non-default POIndex/pkey.

> +	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
> +		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	ASSERT_NE(ptr, MAP_FAILED);

Doesn't matter while there's only one test but we should probably
munmap() this when we're done.

--8gHwo4h6itunB5YS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoO6vUACgkQJNaLcl1U
h9BITAf/W5tXsBU0Xh1izfDnu9SsVFj3BAtEWDHZ6vzUNNcsELP8H0KaA5ocwt3v
rcby3YsdoKQuf7QBDyZlOdnSVS2Ih4QXr4bTGPPVaq3ksEob9VyI2f0gT8Yeiu97
xRVS1Kn3yCe3s4tnvkjcmlJ/BOSuAKL+AsRttUsTRft6CKrcZ1qR+0VY6S9XRu4o
2zydOkryzlr6LX2ulGks+SfoBVuTVMRaQ5lIL9Aa3MPBiYchsuSHhcHG3coB/y0u
4Fx0N/ZguVYCE9yyYY5pqieKuBcBMtzPu0AXcmrqrXIxHiBJj3ZJeVZSidokZdNl
a9gX56dETStqiF47IP4HjxXvv0qCog==
=ZQZV
-----END PGP SIGNATURE-----

--8gHwo4h6itunB5YS--
