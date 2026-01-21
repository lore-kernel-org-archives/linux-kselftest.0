Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47643B8BCE;
	Wed, 21 Jan 2026 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768994247; cv=none; b=jWbJPHXj7fISbOchyRzXsTKWkkk+0+Kl34MsbTDGH9gRnK43V2gzTJUQvZCclZ4gucehInUJuOeTJrYIpOfD20ZMr9XF0Dft/L0M64gnnIck4FjaLpb4fn7zfkzk6azLyGQTWyrA7VZACQabUQ/S5ntwrnLloPgCaYQSXrGx9RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768994247; c=relaxed/simple;
	bh=UVjrrOUybRdchUO2zQhNsUuDB0kG8y8GNSns/te8tYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIYviNYmx2NoZcJJHP5zz9URSApabQ2+/XDjjyHEqTZiKuGoWgW4jJu1DdZF9WZS/GFSvU7+efOwbFKZrxGzcAhDhzynN1AGYRbwE2vxSxNkTphGRk/x9EGTQFk26yrgvIrmxpda1DaVzRqATgas0iy+PXxFOJ2dJFrHxd1rawE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWVtuXyF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWVtuXyF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A15C19422;
	Wed, 21 Jan 2026 11:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768994247;
	bh=UVjrrOUybRdchUO2zQhNsUuDB0kG8y8GNSns/te8tYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UWVtuXyFklhh7/NH3E8DzkzMHmZPwkjCHWg7xvjvaGo0n/urnbzps3c9ASpFhOAV5
	 2S2nAa54eg5FnuTiNG5oEmMqYAiBUw1oGvIe8GxQtbM0iyORtFQGfySEZQB6aqAEpa
	 5fTJN2dKrA+qFg7JVnSRYaJEQcfDPPP8tvzpC9hNTzipRbYS+gViUCpOB+NLQo2CUC
	 pUGdh3MZsp7ZSsV9lXB8sLBIUoRJZG49qTbqTBgCm7i8LAEcTaZYingWXEXsIJUic7
	 LPnUQbnk0+Jdi3AvnO3CxgTyTxb1/NlhFn9c7ll4bb+p9tlRF5gKRV18oVfIej8I4F
	 9ntNeFqZ4FnAg==
Date: Wed, 21 Jan 2026 11:17:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: akpm@linux-foundation.org, shuah@kernel.org, david@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	nao.horiguchi@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/3] selftests/mm: add memory failure anonymous page
 test
Message-ID: <857ec09e-deac-4d70-af6c-5f89ba0b9798@sirena.org.uk>
References: <20260120123239.909882-1-linmiaohe@huawei.com>
 <20260120123239.909882-2-linmiaohe@huawei.com>
 <737310eb-05e5-4234-af67-9118b3f395ab@sirena.org.uk>
 <f1cb6029-9140-3784-5b44-ff58b4edde2c@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ntNwiMA8Q5N3tkRg"
Content-Disposition: inline
In-Reply-To: <f1cb6029-9140-3784-5b44-ff58b4edde2c@huawei.com>
X-Cookie: Eschew obfuscation.


--ntNwiMA8Q5N3tkRg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 21, 2026 at 10:05:07AM +0800, Miaohe Lin wrote:
> On 2026/1/21 1:46, Mark Brown wrote:

> > You should also add HWPOISION_INJECT and likely also MEMORY_FAILURE
> > (which it depends on) to the config fragment in

> >    tools/testing/selftests/mm/config

> Currently if HWPOISION_INJECT or MEMORY_FAILURE isn't enabled, the test
> will be skipped.

Yes, it handles them being missing correctly - it's just about letting
people know what they need to enable so the tests get run.

--ntNwiMA8Q5N3tkRg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlwtcEACgkQJNaLcl1U
h9ALEAf9HyGTBdDStODta1E5/aFHzVxupOBCCR+llLW72boxsbuj52j1RUdv4DRJ
Yd6UuvWvt9OT0hsfHtT+HX3HJOPNRBk2Stmos6qs5js3NBCA/Yi5dHPdaOK1pRwt
sokzcj9kQtgX4piNhwnQ7CWI3V3vNvKf3kpuxI55MUsTN3pwNA6GIFLUDW0qktbR
2bCNHG5CTyUX4arR4y55v1Wem+5p0GbZXyHrlkfOuVvt2+7DiyHnoBPpQ/nRxV4G
X8ISnvlBIZLOYcFT0nyoZY69SyzAbAEhzfIDB82oxDHr3MHesVRuRl8WV+hTTJ9V
Qv3LP3X9K/eVooLQAbsJurpnEcHUBg==
=VjLu
-----END PGP SIGNATURE-----

--ntNwiMA8Q5N3tkRg--
