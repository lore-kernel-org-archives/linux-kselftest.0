Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3FB3C09E9;
	Fri, 21 Aug 2026 16:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329268; cv=none; b=LTR9B73V0MqYmfVrSAN9AsfY9qWuoMVSZdq/Z4X8+qrntGCryhde3CGAf7BYcIE7mDAR05iz7o51YaDOZFa4rE8I+4afETHYOQaFV8L/OYfL19iNGahr9P/7b0XHBgeWGh774A/ByVRLL/3jqMTCnBRt4VVKWRimnJSTh8R3Umk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329268; c=relaxed/simple;
	bh=z9a7nA8HCBztJhljVkb8PGWuj4EJLsv7QEFc+3RJczQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8h59EHSU0g7J9Bk0JCm6EI/aOHTIktFpO28XGAgcS18c2TBsXqhsZO0FJiqutmNrTNtYD1e0y59gQeV7/gIl4PHBA51P/UVsdQLHDSSEywoZo7S85ZIlgiWRrc8Q3lX0SSNMgLsNxIDNK9pzn5qJMpuMp+mTjVSb2dXNoifRSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fj4rOAqK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fj4rOAqK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48BA61F000E9;
	Fri, 21 Aug 2026 16:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787329266;
	bh=z9a7nA8HCBztJhljVkb8PGWuj4EJLsv7QEFc+3RJczQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fj4rOAqKMbpDe1PX6o7tuErN64y3dcGBFYXjgXLVkXPj53jWdwJjXYhUYfq2uOnJD
	 SlGd8QJ/IjorY2JFB9BdWQicF8bxvld/RPywOsf+T3W/AAQu1amrHrkWOFq8z3ntWG
	 lzjZO3JLUWXsZJY2yFKvnda1RtefU2ebxuoTsvOWZ8qWP1a6Esk2kF3eXo/GXz2NY3
	 fvMykXafeEkOaA72aQFLcxNypD7QHg1WGWK06Eq7PVeN6ngXCliD7rjqMxHlftEOGr
	 RL6P5S8Mm4EelHXsKwiJPeexoMpgvLj2soMlX3CHtN5NCa08DorvMp9mMAS3MJcu0I
	 hU9+JxuuuLrKw==
Date: Fri, 21 Aug 2026 17:21:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] selftests/arm64: Print missing MTE TAP headers
Message-ID: <988acb8e-2918-4f88-99b8-a0b1a09f4793@sirena.org.uk>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
 <20260821141556.4065894-3-usama.anjum@arm.com>
 <b95d6b82-ce25-4d89-8d8e-8be1f111812f@sirena.org.uk>
 <dd3e1cec-1177-4b34-946e-20f0cfeaff7b@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EOfL+EvY5O+3PccB"
Content-Disposition: inline
In-Reply-To: <dd3e1cec-1177-4b34-946e-20f0cfeaff7b@arm.com>
X-Cookie: Package sold by weight, not volume.


--EOfL+EvY5O+3PccB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 05:11:28PM +0100, Muhammad Usama Anjum wrote:
> On 21/08/2026 5:04 pm, Mark Brown wrote:

> > This should probably just be a single patch with patch 1.

> My idea here is that the first patch would get backported as that's
> true logs cleanup patch. (1024 lines of 1..1 are avoided with that).
> This patch wouldn't get backported. Its just formatting fixing of the
> output.

I'm not sure there's any problem with the extra backports, and it's a
spec correctness fix for the output which given the existing scope of
stable backports is probably reasonable.

--EOfL+EvY5O+3PccB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIeuwACgkQJNaLcl1U
h9DZ/wf/Uc7VZul9UkxOxkJdDi7toiHRQY4lb39/45K0JzG0P2THIgCDZBF2MJUC
K9g4ZUHZu2IHVZ+vN4LkY5wezIA8DGLPG0unPwlFaLcFIOWvkncf2+rnXP4DFWtI
5oZjsHYr3Uu4jHQWtmPcsbDyd3cMyMq05UmAs6XGVTQTatpxuw6K0Iaex4TOn4Fz
rwacvfLU3dcnWfG5va+gw+1O+mNQ7MxeiaBxO57p5tKNKyC42SN6qsoZSDSHrKaV
GAns01v4GRq+dQGnUEGXE5VkAz7r0eALazIEU92cwegIf3GhjS3aRxfNrVZ9Etuc
v/WNTRfdkwQJKPT4WTHV9KrDKoX1SQ==
=ntHK
-----END PGP SIGNATURE-----

--EOfL+EvY5O+3PccB--
