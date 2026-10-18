Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AC7274670;
	Sun, 18 Oct 2026 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314983; cv=none; b=j0GsZEHyDypg/1zAxyLimxwCRMPKPkznVp44go1o6zRNM3dd2MyFqg4cULkxNYu5Z+0lPnA+pfrf92/ANW5hKiWyd46KHnKpuBgay6hQq2JIKVLTM7A9aQv5th5ppVvIMa/xFHk/jl6Z635S9duRl8rGobpK8/rJXcqsA5FlnPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314983; c=relaxed/simple;
	bh=oJpNb8Qtpz2hwjHNteWDG0Ok5lFWuSPHXqUIWwJ3X0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKE5DxArTcq7YHiWvwl0QjnfqZKubAmGvWxqXA2vQ5W/+l3DFnzBqRimMQ1gsWfMhb2zx9OWIaub6ivfXrorEJAO7Fi6YjCX6DslvMpi8QTPxUGB/vW0It0gOdz7SeAjzH2jH94qjNp22Pox5POVRq0nOo87pWzgHohLXMJClRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNcKJzte; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNcKJzte"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA9D1F000C4;
	Sun, 18 Oct 2026 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792314981;
	bh=oJpNb8Qtpz2hwjHNteWDG0Ok5lFWuSPHXqUIWwJ3X0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UNcKJzteRecOB++h4s47oRngj6bIEl2xSyUQ3iuYcf24gPYwX0750CiaIZpsAYwkt
	 TGPM+DdiUbT1tHGEOsD9V0P3ynmmmlm9zc3atfWSOTkhVonU+gJXIf54DkXhZ151+G
	 4qJ3jomtTMpWHlXIkoSpysFbGcQwHrNOU7mnmeA6K9DuxdHxazLYqCuiciJ2sA/Dbr
	 4B4dVvzfyKUP3H/UFCUPYXREWO5GJShLQZqdbvuOzsnChGTR/c6H/XHNu3bnqjXvUn
	 S4URbA7FwiNPhr4Fob4+sE3F8tkM5AgKyO0JmwIzC1oUU/V2lm3HdgwqCYl285mhwt
	 LgnLQRQx+IcBg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id E0CF21C270ED; Sun, 18 Oct 2026 10:16:17 +0100 (BST)
Date: Sun, 18 Oct 2026 10:16:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Abdalla Eldoumani <aamsdoumani@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: Re: [PATCH 1/2] kselftest/arm64: Report test failures in
 vec-syscfg's exit status
Message-ID: <atSOYTo_iTfUUnDp@sirena.org.uk>
References: <20261017182455.1884-1-aamsdoumani@gmail.com>
 <20261017182455.1884-2-aamsdoumani@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QF5T/0szQhvGCOW0"
Content-Disposition: inline
In-Reply-To: <20261017182455.1884-2-aamsdoumani@gmail.com>
X-Cookie: Whoever dies with the most toys wins.


--QF5T/0szQhvGCOW0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 12:24:53PM -0600, Abdalla Eldoumani wrote:
> From: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
>=20
> vec-syscfg ends with ksft_exit_pass() whatever its tests reported, so it
> exits 0 even when tests fail. The kselftest runner decides whether a
> program passed from its exit status, so failures in vec-syscfg are only
> visible in its TAP output and the run as a whole is reported as passing.
>=20
> Use ksft_finished() so the exit status reflects the results. Unsupported
> vector types are reported as skips, which ksft_finished() treats as
> passing, so systems without SVE or SME are unaffected.

Reviewed-by: Mark Brown <broonie@kernel.org>

--QF5T/0szQhvGCOW0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrUjkwACgkQJNaLcl1U
h9AQnwf9FMPtO7q3lZ82Vq3n5m6oUf9l15G+1ObgOfoDBOWQ/dhb+USFEF4jxycS
tX4jwat3sc4po1SOrzSIqK4IOswiDCDFqimecKi0wY+rz+5zHafbGJrbUy7jVPxa
hfmdsrRPUO1oU/OSXHFteZnuT9dbv0IaDh4J6nI6WMrZnoqsi2xP5lv8n3y2Rbd0
JrHWiQHysi4ikantM+xWbEkrqSQ5NXdG49m2GQv/IURg1n7o64t5xmopNneAoskb
Xv9ZFUiusAB0T54f0vnJDnmEOO9SSd77yqU7f/Uxg54nOZeOpqyQe4/hnpgNHyUX
s5Oqi0WtcYpuu8per1Qcm4I6jlB+dQ==
=MKPq
-----END PGP SIGNATURE-----

--QF5T/0szQhvGCOW0--
