Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD621BC2A;
	Wed,  5 Aug 2026 21:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965244; cv=none; b=A5/a/eeSy/DIICRhI4KOA3LEur9Pk/8cS6l//9QNzZTFNbbjkp5590kVb1EV90AI2KxsebyXkSI9xJ+YwBHR0evGKiks4PCHKooPO71R5jNIV/Gp8mqxmDFSWSADaEReB8uR9QuFEnUiuaBBojtzJTdFaUUH0H+GwJ03qtvv0AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965244; c=relaxed/simple;
	bh=sV0i0Hc1kJCerLVaoEYruC5xTA0H7MabkWGe/2E1zZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFYaM6eiOBi/DJWUV1882nSj/UmorzzaUCLn9W63MwL2bBKaRm5+o6B5dZCzd+7Vrbed/8D57CH5UP5N11Z7ZraCsHD1sccYLH96oqHWujyf9Xg9hEZmQAZfmZ1BHLFflUb2JnTg6P53gxuf3CRFMqzckY0B9R1jO2HtHIPNfGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKgPYbPu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKgPYbPu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382BC1F00A3A;
	Wed,  5 Aug 2026 21:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785965243;
	bh=bg9v/G2dn/2s5d+LUoOvXyvA9Yb9yYQ7XkamQksyPFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HKgPYbPuKwiBQ6yG+tcofF9mQxMGVqQebLm/vIjp7Vhu1iOQB/U4GYf9LEFQMj92u
	 y+LRgVZVJ9C6LSxBKqii8s2lfuz6PQJq0Us+tUK3IKpM/UMF+r7tt/lYPDQobFbZSX
	 w1MgUXrmtmaQnPsomzuYaOv4vcjdYxr6HjjTYivz3kZ9r5IlJJwPGzEZw93MMZHpxJ
	 30NSvkmw9T+1KTnuqfEM+TFM3END8/CPNuR7GOCuWtPhlEdFGpnAHJRdiH2g3dMD78
	 RiFeHO867xz7cdngVdf7jejjjO/mlIpHiRhiuQsd6Wgj7HzdOencNsFRiKtSLZlqgS
	 a2PJzdMCaSz3Q==
Date: Wed, 5 Aug 2026 22:27:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>, kernel-team@android.com,
	Mark Rutland <mark.rutland@arm.com>,
	Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE
 regsets
Message-ID: <21702e5c-2dcc-46ad-bffe-26cd76d844b9@sirena.org.uk>
References: <20260729004255.15630-1-kmehltretter@gmail.com>
 <178566413306.4141663.7146790540592743319.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ScPQ0QnzpWtbhx23"
Content-Disposition: inline
In-Reply-To: <178566413306.4141663.7146790540592743319.b4-ty@kernel.org>
X-Cookie: Stop ahead.


--ScPQ0QnzpWtbhx23
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 02, 2026 at 01:12:24PM +0100, Will Deacon wrote:
> On Wed, 29 Jul 2026 02:42:54 +0200, Karl Mehltretter wrote:
> > sve_init_header_from_task() takes header as a pointer, so for the
> > inactive mode

> Applied selftest update to arm64 (for-next/selftests), thanks!

> [2/2] kselftest/arm64: fp-ptrace: Fix checks for inactive SVE and SSVE regsets
>       https://git.kernel.org/arm64/c/bd290e7fc245

As noted in the changelog applying patch 1 as a fix and this only for
-next blows up the fp-ptrace test rather impressively in any
configuration which can generate headers only reports:

   https://lava.sirena.org.uk/scheduler/job/3075737#L3231

for the release.  Both patches really do need to go together.

--ScPQ0QnzpWtbhx23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzqrUACgkQJNaLcl1U
h9CHvwf+JPxMnonETncM/dMoMV4Fnite0HOpnx90jSgLB+FXAJEAuZbLbD3gLMx1
1iZSxmDzd1b2XQVNHMNOe0lIaqDiAZus+56/uqzZa6o4ge96EPadpcb/VnqP9JVf
wtV4884afXz1mKtMlsUC7eHFGbcFx21MY2kXiOK0XxDcd0Pk7rNupFYZw3eSrXxw
4jNHz7FQhpEYIll3S89vrVZ9EbZ8c1r5p/b6VjoIl6LFynQVeKJPdBRNMWzfgdci
G2WjVywPRVsPNyPyJLvZ96ZASHByMUcgXwnz5Wajm8zKSnKOS8kuKn4UthYquTys
WKwq7EN4Y/CkgrGn8nyWHxW/ld43jg==
=IU1t
-----END PGP SIGNATURE-----

--ScPQ0QnzpWtbhx23--
