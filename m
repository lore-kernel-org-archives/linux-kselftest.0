Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E021E31D72E;
	Mon,  6 Apr 2026 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775492348; cv=none; b=YZsX3va0jQ7Omeya3C35XJCnP0odI4fwBMXpvk5EL0BTKJF9bCSO+EPOIA49fNW4Vch2PFIEd3eBu5PFZDw3KJg0w9cSPyeBy0RoBmvRVAyw+1+hNNQ9RSKtxUFsGgS4r1HOQWkZIgifCe7PHZqNJ6zhJLy52I1RJVJWx/+Skek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775492348; c=relaxed/simple;
	bh=HdIBiyz71lXmkEGm0gWWfPw+6wnk6xgQa6Xm/MflakI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxzASv/bG/wT1vQ1xEOR9gXccDY0ZFhCBgbpf1DxOExte6tFN21OQX8orf9qe4yt5Rm9PfJgeUXmiOFnjk/am/bHUiKfcFZwuVeInqBxnHst0/GY52ZKdbyf1Kziz0cNMAg05tc59+Fcf4NExnK/FY/RpEfvhbmQQI3nTKOKVUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRonesBm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRonesBm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4D7C4CEF7;
	Mon,  6 Apr 2026 16:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775492348;
	bh=HdIBiyz71lXmkEGm0gWWfPw+6wnk6xgQa6Xm/MflakI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRonesBmZ+vF6cVprCooMPQn8Ik/F4Zb6jcQa4i2DVQOhAA4SR6hsNx1PH+qt6rmS
	 f45xpus1EQ9xhJ3Niw5M22ipPT8YoIxEMW7qNdtntudtwSQp/LQmw0fem7nyVkIhFy
	 nmCln1JANZbv4RuzwG8DCE1kmCit6oGVg7svAjuzRIAaxK07SB26lzAPBniStgkVH/
	 ZEiDRQSte1/A0a2qHbuvLwbrw4Y6flq+IDUX1dbgKCh/dZUnDWTDWc3jwVqByC4Mr3
	 qRsWxKLMWwfeGXEhZKWWe4v+Gli9RbNHAoiLMzCHcCwpPX2de+2yHmhCo2akMmM3lv
	 aDsZ6ZPLE97pg==
Date: Mon, 6 Apr 2026 17:19:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 11/53] selftests/mm: hugetlb-read-hwpoison: use kselftest
 framework
Message-ID: <c0407e11-5e89-42ae-8bf0-8d36dff1fce5@sirena.org.uk>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-12-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0GHkfvRsn+CDD4Oe"
Content-Disposition: inline
In-Reply-To: <20260406141735.2179309-12-rppt@kernel.org>
X-Cookie: Does not include installation.


--0GHkfvRsn+CDD4Oe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2026 at 05:16:53PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>=20
> Convert hugetlb-read-hwpoison test to use kselftest framework for
> reporting and tracking successful and failing runs.

Reviewed-by: Mark Brown <broonie@kernel.org>

--0GHkfvRsn+CDD4Oe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnT3PQACgkQJNaLcl1U
h9AwIgf/V7Y2RmIqUM1Jd40HZGxkQeK7dhdkp7oqV1IYgkS8MTIayeFiAUpSAp93
CdlhlIE3Q2DB1ilnVoNTF90vynAf2p9Rpn2qOsGHzfY10qBsBSpitKCwKZplz8ib
IagSoK/2wvJYu9MnhqBxHTiVlPCwLUbDj1n/0KCic/1fXbWAkIwh2NabqqM3zxKL
LF0UqMMrLrppfXJgkOpAE2lwJTOV4vOSivp3nEejV58tZJH6iSQCQvta+e0phrz4
m5pYab4x6GYf5Tfq7y7VH8FTzayXFhzOC5MMmS7LCJCxblHTm+i1MLsxE94g/Yd0
Z5cBYEZHvn0SqRWlPsFQ3A5KtTuHnQ==
=8YFA
-----END PGP SIGNATURE-----

--0GHkfvRsn+CDD4Oe--
