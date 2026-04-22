Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE02D8385;
	Wed, 22 Apr 2026 17:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776878421; cv=none; b=MiFsy2l9+dNC+iZVP4rVQtMlq44hgsOAYfILCLfqvd0ShRRNHaAlpQbPRH75247jOZ0PuGbEkZ0gpzt8KNaovytsGImucghqsMoKWD12VxnFzDD9H8hQGOyMIxubqwG+sl0k25lFW3c6RZwnyOFrU7HQ+hMN9AY1j1GceVuiuQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776878421; c=relaxed/simple;
	bh=D4358O16wmyLgUeamrhlg2RP4x61t3u/UfesRcKy8I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcmBbeFzZrTaCUYcqpeOZn33ZukZOHYTtkfTQ4+f1oiJrBctRuT5I3Y4YCXzoehlhHScv4+Fc8AYI8nyS/kcrkggOrrxwFRVFOOwcm8dXVk3mslvZGlFv7prWXVFS2t4ev/BH6leoR7nmCKATKbDS56VJR22FtQ0rgrzJQenDvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAF+IVSc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAF+IVSc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8EFC2BCB2;
	Wed, 22 Apr 2026 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776878421;
	bh=D4358O16wmyLgUeamrhlg2RP4x61t3u/UfesRcKy8I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAF+IVScTCD3pTNviz1AJIPRlteZadkFjuj1vBekRnD/dzDwUNfJcVAN9Bau4ggp/
	 KjOGvjYRsDeNRSlX4hb6L6xdquiN6wQIYAFiwlPGmcNiTvnmWA05RWwxlx9vNVcghR
	 /eb+Rsp6p8IMfXYCxenZVPlnD6yCD8y3x6B8E4b/WUJzDKhOiqL+s8QkFYcgU5yHzF
	 6YLnxv5QakItDAp8iSBgKO+0nE9dSihXPQsYc0HMvhw04DJbBpS1jNNxR2weaoU9zZ
	 CecvxqC1223RJj2E9bsIoC0IGMdkXXWizB7G7ibTcpjb4mtBuAdq48npD5dcRgUdU5
	 FH+qQDWTc6p3w==
Date: Wed, 22 Apr 2026 18:20:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <8690e67b-3637-45de-8956-e27486470866@sirena.org.uk>
References: <20260422-selftests_arm64_gcc15-v1-1-0d919ea5ac5f@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NH2ONQh63iws1FPL"
Content-Disposition: inline
In-Reply-To: <20260422-selftests_arm64_gcc15-v1-1-0d919ea5ac5f@arm.com>
X-Cookie: I'm definitely not in Omaha!


--NH2ONQh63iws1FPL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 06:01:39PM +0100, Leo Yan wrote:
> Building on Debian sid with GCC 15 fails:

> GCC-15 defines NT_ARM_GCS in the toolchain headers, causing gcs-util.h
> to skip its fallback definition of struct user_gcs. This leads to the
> compiler error.

Are you sure it's GCC and not libc?  Anyway...

>  tools/testing/selftests/arm64/gcs/libc-gcs.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tools/testing/selftests/arm64/gcs/libc-gcs.c b/tools/testing=
/selftests/arm64/gcs/libc-gcs.c
> index 17b2fabfec386e523e788d8bcfcafa553c93bd9b..72e82bfbecc99e34da71d56cf=
5401c137d6e9a48 100644
> --- a/tools/testing/selftests/arm64/gcs/libc-gcs.c
> +++ b/tools/testing/selftests/arm64/gcs/libc-gcs.c
> @@ -16,6 +16,7 @@
> =20
>  #include <asm/hwcap.h>
>  #include <asm/mman.h>
> +#include <asm/ptrace.h>

Shouldn't this be in gcs-util.h where the local definition is?

--NH2ONQh63iws1FPL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnpA08ACgkQJNaLcl1U
h9AfMwf+LeHbYFk3XVNgKZhX1fgnIL1di317+6P71Duwc1yNNAL9TlLKpirWPaVc
gIwXDO4vXZL7f5SPwFvX/8RedM+oX2gxbDgrvfWr2eLpff8+idR1B6nC9B5bdH9s
0rEG3VFJf+gkIPgE7XOUuxkjJWCPALtT5FSdkkQ37kZ1q6+d5yfbzRz+Wt23qu0e
lTXDVWd9Bzy3aQaDqFg/F1IS4d5jacaAmucqBU+YwYfi1Bmpf5d3aDz0BCoy6Lii
WHzHzizXro0hqwrcb3wF5Y7Jd5Rwq1d4ElZP9+hlsvs/8JeahxbiMHmLusOHkIrP
sL+ElLbJB7EDhZu8RZb8LBqji1E4cg==
=OiBd
-----END PGP SIGNATURE-----

--NH2ONQh63iws1FPL--
