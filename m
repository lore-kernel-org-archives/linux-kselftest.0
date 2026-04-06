Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B786538C42E;
	Mon,  6 Apr 2026 17:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775494964; cv=none; b=ND8Kzl/hVkk6WTUKr82nmo7K5TCROUcDjoZpKaZ5DtTRCu22ZAub5YFt+ERvBM3ZEaEmjANAdeiK7NU7HjHDnRvw0GbCKvazUQEMbJf01C5iTvT3iR/f/A85+w+CHzKqb92PjrYyu5eQDU91w3dECeuqdF2XRBAsZ/CGY3sQmS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775494964; c=relaxed/simple;
	bh=1OHRxbzs5ZLFp5EmvSXkhp4DU8ALMByenOOrQqA0Nak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7XFix1oLdOdPy+rVUpEGuPIYIiIoGH/Eh2JzM6+piDUOaAjnpQuNfFhT4A5KtSe9MqTp4W7Vx+CVO8cc6GzkGebuicUwYH40ZynThEnJsm2tZwZSt4IX23du9qAS+QekbyL3O7DmPQjVe1WClJTvns/ceEOR7vLa/V1DbjK3Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRekFqRb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRekFqRb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BBEC4CEF7;
	Mon,  6 Apr 2026 17:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775494964;
	bh=1OHRxbzs5ZLFp5EmvSXkhp4DU8ALMByenOOrQqA0Nak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sRekFqRbPP6f7L+v4sJvXmNEf4oA2o5i5iBPaKOPHYUJiSOna11t65QKJpSbdkqQX
	 QPoAnKM1ILbSaVIooKb+Q12e8gd1Of1/lILNYlkYtzBftWYp4GRvGw0cZ1J5hD0ILj
	 wRP4ZRTW3fiQ55yll0GdPtwpTkzr/dsyoQNWP3lZ+JIwDbJ+t2edmQFfg+4N4Hyx/3
	 u1JqOysGAANkjzYWwPQ07JjypMFuiHc+OV4jnvBAWuMjNbV83RwYwEgNFSfP5gtu5x
	 gaP5nh4YT1vQTZZ8UwCZ0EtGUjLaAwDCxXCmpLuUabpJYXVVySl7m5PCX9G0wcW0+s
	 H8SxkIYAt7XOg==
Date: Mon, 6 Apr 2026 18:02:37 +0100
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
Subject: Re: [PATCH 16/53] selftests/mm: protection_keys: use kselftest
 framework
Message-ID: <8c36ea8d-946e-4c1f-b8c4-f2def693b419@sirena.org.uk>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-17-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="guarDYyngoZXCIIc"
Content-Disposition: inline
In-Reply-To: <20260406141735.2179309-17-rppt@kernel.org>
X-Cookie: Does not include installation.


--guarDYyngoZXCIIc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2026 at 05:16:58PM +0300, Mike Rapoport wrote:

> Adjust dprintf0() printouts to use "#" in the beginning of the line for
> TAP compatibility and add fflush(stdout) in the end of the test to
> ensure all the ksft_print_*() messages are really output.

We should probably add those flushes to the kselftest helpers (eg, the
one at the end of the program should be in ksft_finished()) if they're
needed.  It ought to be redundant though, we do set stdout to be line
buffered in ksft_print_header() which means that either ksft_finished()
will print a line and flush or for abort_hooks() it's immediately before
we call exit() which should do the right thing anyway.  If exit() isn't
flushing I'd not be optimistic that fflush() is going to work.

--guarDYyngoZXCIIc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnT5ywACgkQJNaLcl1U
h9D5Nwf+MMYxIQWa4F6gozvVcNV6+ePvHrr6/prRVcCkxODrFSS3spHDUaCWC7Bw
Exj8uoNR58d84g9XdfXgrowyWDgwSr48/RbUNIlB0mn732lkugeTjpJCa8MFIMgG
rMLTgZzFVkwIge43kxq1CWct1RZqwBDGBZ7MnBXnpzTwABu3vrROZ1Hh2sUiVx2f
oAbDIr/1M6z5r8goejyhaTS9csE2I36eE/KdRxblWzBZYFXmXQFgLpMSbsnL2OcW
Z0RQDsDPT44kt/UTG4gaF/k2+awJkDDRmk/3X6H5H/Ieqcyi7Jw5IHZAaw/RGDgw
eaPqUDkSj/y4Rc6SQgbwELKCP7JXjA==
=vqHQ
-----END PGP SIGNATURE-----

--guarDYyngoZXCIIc--
