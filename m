Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0458C3815D3;
	Mon,  6 Apr 2026 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486420; cv=none; b=lmrAe8C4ZA7N51DxJxqdI+8JDjM2x/b7rThOuK1R5IHupYhTDC6x/3ZY1UkuPoWnxBWp2nLpJg35bbIrEyYqp45JxX7mSjJsI1jpQKE14jA6hbTNbEK3xLmnovg7VGUOyJhaVvaDgTgkCWYnFvl9VKxhbqM+wQ9IkaFMtIMXiac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486420; c=relaxed/simple;
	bh=HscdZE1jDaO1VYvJpYRdXQ9Wi5iKVDR3QAVSOFgAsBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iF0DVMfFRg3ahY5c2ttGIG5+/kruVnHYOG5S/1XUHqjFEPH+03X1tB8D/m2m880BnnyjAbq2A5CSAVInU84g8vCoRRhHsHfEhLKY2raYAafPwoJjNYEfreW3HH8I9YQv6QlOd7UTUPp+sTYM13RdFY/hyh4NP20W0BRbxGoUP6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOoOPAma; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOoOPAma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3768C4CEF7;
	Mon,  6 Apr 2026 14:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775486419;
	bh=HscdZE1jDaO1VYvJpYRdXQ9Wi5iKVDR3QAVSOFgAsBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OOoOPAmaH1Y8DegRrnnfMlzu+H6uGHOagyI2JNc7CoxCD+c9DD0ZB2C6W/3ouIbV6
	 suOx8cQJWFQtD6FMADAyAy4txgJvztbqUwP2hIuFfcfClvMMw8J3QH4WrwGAHpgb1Q
	 cP5XgMjU1dU6/iLu5OU5AQDbCVpHKspw+uTE3YZoDg0P05NHOxSmiIw413uKfsWblx
	 0pARqVMuF8LW1WL4RibikVC5q8i4Hi3qkMn9kGzKbP1QSktqExaw4UtJiDGgbyBN/l
	 0kmIZ0V9IclCQj7+ngUtlHI1VYj2dqU30LhHhrW5jOf35b3Aqbs2T5GuwFdL37Aejq
	 IA5IKGqKdVRpA==
Date: Mon, 6 Apr 2026 15:40:12 +0100
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
Subject: Re: [PATCH 08/53] selftests/mm: hugetlb-vmemmap: use kselftest
 framework
Message-ID: <4bab29d7-7c19-4c82-872e-18b88f07d7c0@sirena.org.uk>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-9-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fpQPRiuMKCXEzmVa"
Content-Disposition: inline
In-Reply-To: <20260406141735.2179309-9-rppt@kernel.org>
X-Cookie: Does not include installation.


--fpQPRiuMKCXEzmVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2026 at 05:16:50PM +0300, Mike Rapoport wrote:

> Convert hugetlb-vmemmap test to use kselftest framework for reporting
> and tracking successful and failing runs.

Reviewed-by: Mark Brown <broonie@kernel.org>

--fpQPRiuMKCXEzmVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTxcwACgkQJNaLcl1U
h9B5CAf/XdUXfquEQHZ5DM2V/kApM++qoDQKaMD7fdZ5l8Xp5RNeZiYWwDSdnV4y
BzN2kujxbiutqc0bxY7+zKjitcMX+CRVtTNtW1XgThNQ+OfohcV6dL/A1ssDQ3Sz
wfdtlbNpr3HuSeVJE6qhhAWcRqYwcbOPByaAx6jCWgFJiw1Na8vcv5HUV2ZjPJaA
u5q4yUUu5v+/5NyctEg1l+PVkX7jrv2X+nPreiUmrUYHHpdNLqd70zX3tMysRo48
hLIJFUlk+70HNYaez6k3ErRUXXcbQhjPplmIgZ79hEYlJDt0p3Xdf+3s7ZWRguZc
KtvvAihTywn7/0j7iXx50d7PalSG3g==
=gqnL
-----END PGP SIGNATURE-----

--fpQPRiuMKCXEzmVa--
