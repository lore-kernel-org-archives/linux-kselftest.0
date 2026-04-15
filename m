Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1458345731;
	Wed, 15 Apr 2026 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776270344; cv=none; b=XN3AaE2+CRttnQrmtAvWGNJ8YfqCZc/D6qrin7L2Q5N9Vbefu6sy7kjvV3HQTs12l8oJD8qhPoW2/f50+NvEU+XRukmMLidfcsBEJqbTODHs0oNyuKTZdKS9fEyXVOiqQ2MLB6icPoAgnkYv8Paxsz9AZsBmOpF1kLXjKigbkOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776270344; c=relaxed/simple;
	bh=un+ATsJ5Cw6umsIX3zZIVaIBltggIUXJn6UmaVIm/ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQU/UQ63nC43aVkEqdjdAzcJq/ULazfJZuE9edr3b4fTI3qMdPZQIFLz2mMsxX+F1OxHiwdZcPbbwiZyk44s38k3Yg8ZmnyjTeA6djvbcmJWeTYdsQrNnliMERKV4QbNsuf0Y2Z5tVGLUslBAhWx8u4+E1S8Dbop5jaZrBPqMtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4sZMTfR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4sZMTfR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDFAC19424;
	Wed, 15 Apr 2026 16:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776270343;
	bh=un+ATsJ5Cw6umsIX3zZIVaIBltggIUXJn6UmaVIm/ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4sZMTfRaNmVwB86c8jSMqpZwGAqYqL6ybFS7/763p5tlHdRc2rZLzn6g4brZOh7W
	 Wi0ffngAQatss5GAOCu3kWQ6/ZPcWynwjtITvs8cO/fpIMgIW7YWZyCP0B/jkDQKhg
	 gmDStCrwzph0VCmscIFN8+dvywFAW1fg9OfiCi0eA1YmPr25AAs+u0zT1miaAbtD2W
	 AJ1i8qzMskSHQPU4qjGzfq+RrwJ8LfYV68kooRSn2aNDihN7O3rLurwQdZrw/VScqS
	 h8P1zZGIhzvkpjz6etVY0R4j/buwD2yA/ceaROBVQqY9FpOVV7iclgRxYG8wMhvVrm
	 p+QSajxbTS9Rw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A0B5E1AC57F4; Wed, 15 Apr 2026 17:25:40 +0100 (BST)
Date: Wed, 15 Apr 2026 17:25:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Ricardo =?iso-8859-1?Q?B=2E_Marli=E8re?= <rbm@suse.com>,
	torvalds@linux-foundation.org, Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Aishwarya.TCV@arm.com, ben.copeland@linaro.org,
	kernelci@lists.linux.dev
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
Message-ID: <ad-8BIkw_ijCLqcF@sirena.co.uk>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1kDWPyE+2eqpH0DT"
Content-Disposition: inline
In-Reply-To: <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
X-Cookie: Victory uber allies!


--1kDWPyE+2eqpH0DT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2026 at 09:40:37AM -0600, Shuah Khan wrote:
> On 4/15/26 07:58, Mark Brown wrote:

> > This wasn't showing up in my -next build tests since I set FORCE_TARGETS
> > and explicitly choose a restricted set of kselftests which actually
> > build with my system and configuration.  It was less obvious than it
> > should have been with the other systems since they did not expect there
> > to be a complete failure to generate a kselftest tarball and variously
> > masked the error or reported it in a manner that looked like an
> > infrastructure issue.

> I didn't see it when I did test on linux-next and my repo. I did install
> to catch problems.

> Sorry for not catching this. We can drop this patch.

Yeah, it's easy to miss if you're set up to build everything.

> Mark, would you like to a revert for this?

Yes, I'll massage the text from my report into a changelog send
something - it'll probably be tomorrow now.

--1kDWPyE+2eqpH0DT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnfu/8ACgkQJNaLcl1U
h9BI5gf+KXvGn3DH+IpwUwveDzkjAj5R4Vyqf0AMUkk8q9rZOAvlkarJmuucf49R
T2Bm/CFoaZMz97Eni2lqkrfO6IHRjQ4jGP8BQ4t4NeDm9EjinFp/7JEBKZNH9Sez
OBLnDXdf0FgFEecNCom8FNv3Agmd5E8N0KgxdPvyFtIJextiAVghonaIRSfEAR/m
mJ1HL6wQ1O0M8CQQ+l0QihUi7F5C7joUxtKufC+rYEQVIKqV3bb0wz5VjAnzDu3p
2JvAnDtkDIWWnK3Oi4qjdT8w+QQLfSi2H6WRlrsYVyiBvsyRjXzeE8Xil04aM+K+
K1V1cWxTuEefR5gIDq1nnPO4lx+PDg==
=qMB8
-----END PGP SIGNATURE-----

--1kDWPyE+2eqpH0DT--
