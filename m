Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB16042AF95;
	Thu, 20 Aug 2026 16:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787244140; cv=none; b=LBymcegBimyJfcHcBpyhSwy2B3AqQadQI2hJZ8lWh5peuJnxJBWAGFuqndmosGnShO/1lAmxd/l5Ggaca/m9n/xDG6lMDG8s9wP63aFTrYmjgG3YMXbOBkrSGJUyG9D5QQKOAHh9CeySdzJP+p1zi5PPsBxjHBN7JoVnAAgbKQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787244140; c=relaxed/simple;
	bh=lWKMNFN2JdcrYl5pM+I09UhEZVtQRbKrRYuDH3VZzT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaOhZowQyB2aX4jBKEbMFiZo2u//yN7UEjaxoPkC6VnCwb36il2js0JJU55O7qzb14tQYRyejtFInn3zv1Bpq/AFuEyHhYKEZou3QDCWfqAjuO2CWBvuxvXsyT/CiUQYksoU1UXSTePBXhdX29LK5Au/fUtpjIY4l369RbAf7qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gq6fRyVc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gq6fRyVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332AD1F00A3A;
	Thu, 20 Aug 2026 16:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787244139;
	bh=rT5neA1u30HZVnukFcxjKJuaBHUsVDHuaLME3TTzW28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gq6fRyVchssuYp/w09UnjVV7POn/M94fFN0uibkI7nvjq65nbMjAKol64gt+RbcgS
	 0WvC5Ms2fj3rT+hOqjhemztgQ4BQTPrWCPhEozyM0WrVhxStv/WHjvWGmcckh6M/o5
	 kPIn2BZM9AgQtQY+IerbNMnAik2W4aAZ7vLpOPJlAd1DtgfI6Q1PBDIRRefWFJLlb4
	 OOhNBPeLhNXdazsAqushflwLzRviQrXybknH7ELTWTu1MNUAMqLt6kTnNHcIe4yeNW
	 KwJLg206LQcb6Ya6x/JjHJ5NTNl8PL+yTdQjuPZsSu8A3ENllAhXg1qNj8wtcwzASa
	 SbYrgmbrfOEYg==
Date: Thu, 20 Aug 2026 17:42:14 +0100
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
Subject: Re: [PATCH 4/4] selftest/arm64: Add MTE test config fragment
Message-ID: <04a6555a-7def-4a2f-b91c-91483f7d3b28@sirena.org.uk>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-5-usama.anjum@arm.com>
 <3c469ee4-cc64-4d79-8e78-deeff30c59a6@sirena.org.uk>
 <630beb10-66fb-4d9e-9b86-df406ef585a9@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IB5beCqjp3sOuuks"
Content-Disposition: inline
In-Reply-To: <630beb10-66fb-4d9e-9b86-df406ef585a9@arm.com>
X-Cookie: Happiness is a hard disk.


--IB5beCqjp3sOuuks
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 20, 2026 at 04:42:16PM +0100, Muhammad Usama Anjum wrote:
> On 20/08/2026 4:38 pm, Mark Brown wrote:

> > Is tooling going to pick this up or should this be at the arm64/ level?

> Yes, it will be picked up. The top-level kselftest-merge target recursively
> finds every file named config under tools/testing/selftests, so
> arm64/mte/config is included.

That's good, though looking at the list we have requirements for
CONFIG_SYSFS in other tests, probably some of the other stuff as well so
we should either do something at the top level or decide we're going to
do this independently for all the subdirectories.  Top level seems
easier TBH.

--IB5beCqjp3sOuuks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqHLmUACgkQJNaLcl1U
h9BkrQf8CpY8qgC6cPPXtBx5aHrIHhFC3E7w5hF+DfPJQErsBUrZ9Yov5Vgxv+h2
Pz+zK6O4GjjFAlbreWCj1hCsEabFOaLtvgIyc091mDj7bJJTZgQHzCmXMa3iquZA
zcmh4LYZw7BEK4AdUmces5kpevbYYt9RoCPvLp24qu3ezmqp1M8mEOlJ1+PjUNsa
a2qMXhpzw5nK+4SAG293wVhAYToGOvI0f1TqsJPtrca/rCstat3FClFWwD3rtkuo
0bUQmsM2PwUrgBOk0iJsucQpS9Lia160KemuxKYIBDBEqCJx+atsjfwqWG2t5LI3
A62dhkWrWJBP5iJWk7Nq3ylaNVi7AA==
=7UiJ
-----END PGP SIGNATURE-----

--IB5beCqjp3sOuuks--
