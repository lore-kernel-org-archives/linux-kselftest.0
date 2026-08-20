Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523C6376A06;
	Thu, 20 Aug 2026 15:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787240314; cv=none; b=Fb8ba115HqOWmt1zm/Qzpv0shc/zw2y5UaUv+hYSS2iynqJkonyYJzDvH2YrSjDWYDndkpKqRjnsg2Mqc6nlJSKHKZtbO3kz5inprDvEZL9BsOkD45p4gdzm6XAGVYJkpV6MlL2J8LlmI2S2oxr03CitQuIOcUSsNySkUl4Xpog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787240314; c=relaxed/simple;
	bh=nVSZXW3423ktU6z4XcoFB9p2nfzBOiAasYgVWaoOm6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVSDayaOmFXNP7XWq0t7rUhRaeYWpvgDDIZ0oVIqOIvZ11ktZ+UWgKDUVQtolDb0mSd53uEUkjQ8HAFuUiLhtrFFwHE/Vzpe7RuQreZz2ftL4l9JQPeq3K5SCqVXf2CMj5pzd5kBeFcQmgT7wpKddxKHKSOpDR+p6PUH/IUyVVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSZb22ew; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSZb22ew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718721F000E9;
	Thu, 20 Aug 2026 15:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787240313;
	bh=V9+n6yZ9yz0WzKubwizayKc87+tB4M0rtZcS+dSKvDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VSZb22ewuYnt6n/5ebQy0fRjxHwe+rIGyPv9K0kDUxUF/JtoJiwf8pRcEV+Dt2Jj6
	 KAqa77aTLeQBSYdZ5FI0BY/pYKfeGecdOhbJ0Ss/DdcQ7fczVsFJQqoSPpT0ekoaa5
	 09eMB9ce0G/s1r5J2Xg2E3UNPvPgkt7MEss23qWCUB7m4v0HtT4X6Zg46/F/oOEo16
	 9PGVD/arRIdyu9IByaU7hV3ys4bcLn6g8ErrFXF2a+8epUPc3XiOdGiPRD/cDXdaUQ
	 +DVL1YfcHQWRJ6rLVBzHp/PdtwMrQ9OKSEaUqXLiJo5du4uPiDSI3ym0wMVD+aG9Tu
	 aF6Ujid77tW5w==
Date: Thu, 20 Aug 2026 16:38:27 +0100
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
Message-ID: <3c469ee4-cc64-4d79-8e78-deeff30c59a6@sirena.org.uk>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-5-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8094Vs83lBy8oqp0"
Content-Disposition: inline
In-Reply-To: <20260820153331.2448875-5-usama.anjum@arm.com>
X-Cookie: Happiness is a hard disk.


--8094Vs83lBy8oqp0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 20, 2026 at 04:33:26PM +0100, Muhammad Usama Anjum wrote:
> The arm64 selftest collection has no Kconfig fragment, so kernels built
> with the selftest requirements are not guaranteed to provide the support
> used by the MTE tests.

>  tools/testing/selftests/arm64/mte/config | 8 ++++++++

Is tooling going to pick this up or should this be at the arm64/ level?

--8094Vs83lBy8oqp0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqHH3MACgkQJNaLcl1U
h9A3ygf/fD/s3KwqoBJbnYpD4DV1b5+f0x52mtrtfy9QiCxQ1Tlo88eCciZJ6+Lb
m/RBF8aH8ZahA7xj713OT9ZQAUuZbYaOTatyDFfTm91LGsRACFxy2jjDM5H7vVum
HnzrmUMiudXte4z72/dSAT36uIV92pKUo0gndNnJd/3FEYa66oF+zerLrPMkaty9
I90leHzz0APaEqWbpq1jYyazcXx4UkKWZ8j0kySS35dXLTB18C33AFVIT9H6sz5V
b4ZzTa5JC7+r5whe3aQxYY6HQijv+kZtKnxziiFFd3luzjNITn8YTHzjdkBPGJAR
QZsmcg5eY8J9A30YgJxjmCipU+BQsw==
=NBXB
-----END PGP SIGNATURE-----

--8094Vs83lBy8oqp0--
