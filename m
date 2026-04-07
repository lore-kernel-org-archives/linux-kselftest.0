Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73A31EB5FD;
	Tue,  7 Apr 2026 14:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572492; cv=none; b=jhzaPqQV0F0t/f3BcFoB7qGCf4L7+C5q1fvpeLmH8jA4QZC6M93JhqFDncdYvnhkkXZYRY3yiaeoclITumt+UM0wu/BOGD8EQs8RUER3Fxy3mZtRfEXaMD3nXs+fpWk9zJMN/jI+KWvMUGX/e2YQFA8xZdl90WVRXCBX+LD7fvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572492; c=relaxed/simple;
	bh=RCmKhdjPi8Jskr47gc+moRDVhuEspqo0T/BYmwAP0vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/Va0MpfqvxrsoZftuxtRbc65yWkLWJjGlWAzvwqTjgnADSy3VCT8OFanRQ2CoJF5tBk6RCcPfHEjyKMRGaixm80Zvv+9bl6uMD5ceHPJMebzztloI24BzrFKpEtnNbg2nifcFyQqq0y972gVCcVX3t/h9f+xIjMzu8DrliHTwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1bqf43h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1bqf43h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251C4C116C6;
	Tue,  7 Apr 2026 14:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775572492;
	bh=RCmKhdjPi8Jskr47gc+moRDVhuEspqo0T/BYmwAP0vE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1bqf43hK9lhDea23rRAGPHaGVpNN+dsaboOjP0v99SbjVKrncfAnmGzS5RwBtNWO
	 Io1/sFyKC07KeA5jlKXxakwJhEUtbIzY/h7HN96mNVHmcSiGULsCMHulOfafFZRrsP
	 7Kb9CaJOYQ9qj/qx0lp/bXygrfX+HnHrN+GryuJpK4DYIffadZUt9vXV7RbE0Ea+1i
	 lehS/gPRNB/Nix/zpp+1iagwCoiNyEutG8xvaLDKrww7/dhjoGA2tY3JHPtyKkhtaX
	 WTyJf3Zt+GylUYYpywmCXpUSwZj94sV9oeCfZjedHGcbjgF1BmYWdO0einjgDT+GzH
	 bi9kGKRzjaJGg==
Date: Tue, 7 Apr 2026 15:34:45 +0100
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
Subject: Re: [PATCH 19/53] selftests/mm: va_high_addr_switch: use kselftest
 framework
Message-ID: <1857da58-925e-4e3d-b684-8a76eabc51f9@sirena.org.uk>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-20-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b2yQFTIeWGRWvWGc"
Content-Disposition: inline
In-Reply-To: <20260406141735.2179309-20-rppt@kernel.org>
X-Cookie: Now, let's SEND OUT for QUICHE!!


--b2yQFTIeWGRWvWGc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2026 at 05:17:01PM +0300, Mike Rapoport wrote:

>  		if (p == MAP_FAILED) {
> -			printf("FAILED\n");
> -			ret = KSFT_FAIL;
> +			ksft_test_result_fail("%s: MAP_FAILED\n", t->msg);

ksft_test_result_*() should use a consistent name for the test,
otherwise tooling won't be able to correlate passes and fails from
different runs (or different fails if the fails print different errors).
The entire string supplied is taken as the test name.  Log the error
separately.

--b2yQFTIeWGRWvWGc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnVFgQACgkQJNaLcl1U
h9CLzgf/Z7enUVELGg09YPk+CGx5ueR+92ySPouJPQGYBbRto0TTfc2bvyL7Pe4q
hslkud5LA/NyHwJBRJh8cmSxbuYQd6BPYuwCUXG6c/e3QgSmMXPKNSZjucha0mYr
p9D9CNO7oNF3th34Tg+N3Kda7F3Q+xd/n9TXQBeRIo22zUn0ZGX4PXo/oKKjYnle
R9xShmfN8z/eqpRf03Ek/tY1W2Q3idhqRrQgNniSOar2j4E+1eeREXNEGm4sv13s
N1SSnSFJN+ADSEPJSYaRmxEbioktWuKkeEmzEupvyR/29LHsUNjQE+pL4Ljji0c5
kLpJjGqqHqB9K73AzqzDeHMnNMBCWQ==
=Q7yh
-----END PGP SIGNATURE-----

--b2yQFTIeWGRWvWGc--
