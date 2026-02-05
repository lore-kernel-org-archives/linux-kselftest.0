Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76DD2DECBA;
	Thu,  5 Feb 2026 11:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770290928; cv=none; b=tYV05L27Jzv5WmiXSiLW2IBOxGTFboVjphUtOiot8XNVFlWWaumxS/G8v98/ntzSqE1o2BA61hv+2CGPjY4OtjfGqnMy8rNVigPyCTpczBaxbb8RO9O6CWkbEMsPm/rdV0q6BDUY0NxL5hcPJZJjideo7ZvkpLmmPyl95Nd/gvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770290928; c=relaxed/simple;
	bh=Ir3rF+We/v/jeDeCoAQnTP2mNTyALL/4ipRHcYZSqOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aR4EbiV6WjYsWQJM9ZwSfLHrjSFb4CTZs1OpSU5rtKtL9D4kUt+cwzrpYr6z+L5W98YHPGwT3ZKX5gJzZZXzMaAFDFJTjh5KRAYWAsdAjhYpboY2VlxR1Hy+lB/Lr+Cs1iDsRfSI4C0VIAwvtKOQGC5IB19chTTH8runtxk4mXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ae/tFLNI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ae/tFLNI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064C0C4CEF7;
	Thu,  5 Feb 2026 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770290928;
	bh=Ir3rF+We/v/jeDeCoAQnTP2mNTyALL/4ipRHcYZSqOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ae/tFLNIlQiLcQz3w8qXISrY1vDad4PIFtdLksZwSB7zFP9q80c3+9IXI+0VB8hgr
	 rE0cvyT0qRDjhbRXKQOiKN4doIAm9GDkH8VF5ZfLLYnACC4ZAPRejDlDNxMMSVdeih
	 E0Pl2GXqay2Q/+j/PE92lgsCniVqfMUhqfT1PQxJ8yRFyB3JEzJe+W13+luQpKBN+p
	 wHjitr44gt44OO+2F5CI/YfTlZ3fXhw8BFnDO3X2uDi+Pz24er9rOOqXaFG5n/JUSk
	 f8tu25tEQVfOFn2DPZcN8gmCJ3o77GdmlggG4kuJd4ShLnPBBcEZP1DfOdXm/6JAaY
	 PwtHNcCi24CWA==
Date: Thu, 5 Feb 2026 11:28:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: akpm@linux-foundation.org, shuah@kernel.org, david@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	nao.horiguchi@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 1/3] selftests/mm: add memory failure anonymous page
 test
Message-ID: <73756615-b779-44b1-8ff5-b4b2d5e3c7cf@sirena.org.uk>
References: <20260204073331.899406-1-linmiaohe@huawei.com>
 <20260204073331.899406-2-linmiaohe@huawei.com>
 <2028f5e1-e032-4909-8240-15fe0b3c82a5@sirena.org.uk>
 <0a84104a-32e3-8518-ebc0-703814e233d4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qmBBxdvcuvo1k9qE"
Content-Disposition: inline
In-Reply-To: <0a84104a-32e3-8518-ebc0-703814e233d4@huawei.com>
X-Cookie: Non-sequiturs make me eat lampshades.


--qmBBxdvcuvo1k9qE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 05, 2026 at 02:58:50PM +0800, Miaohe Lin wrote:
> On 2026/2/4 19:26, Mark Brown wrote:

> > In -next I added a hack with wrapper scripts per category to improve the
> > integration of the mm selftests with the kselftest framework, could you
> > please wire things up into that, see:

> Sorry, I missed that. Do you mean adding something like below to run memory-failure test separately?

Yes, pretty much - I'd keep the list of TEST_PROGS sorted but otherwise
that's it.

--qmBBxdvcuvo1k9qE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmEfuoACgkQJNaLcl1U
h9CBBQf+PU/CcNHjF6foxK8v9Dc0VdDIgPTuJgv98j4HpNS1sFKDSmYY8E99jo1a
ri3Cfy+MwxIeD9KHMnk/wJPhFQh6NzhKLl80lR87yS9PUFTTwAg83Q7M+UDu3DUz
mL1vyDbo4yqmLiXDLcXvgRbTy3iVaUBXRO9iC8M8RbR6L31p08SuJKlIV+SbN8js
h3vptu7nIBLkJzWCMQM9hko9m150v/7I8uVif8SNKTO+AB/HFtUIs1413jOYEQ98
n4Tc9vP9beAxASPS1mbxmUXFMx7Dxea/9CMwIJliH5pprLXa2g1mBHdrZcVzZd6j
q74R/rofwXu0N928mS2XhwwX3PONOQ==
=FBpU
-----END PGP SIGNATURE-----

--qmBBxdvcuvo1k9qE--
