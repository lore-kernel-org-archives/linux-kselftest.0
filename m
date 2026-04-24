Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F86344DAC;
	Fri, 24 Apr 2026 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777052177; cv=none; b=IGz7Q53+QD3aTnNPlNJUs3RrM1sjFi+HGigd6Re4adCGgqGU8qQ7envv52bpu4Jx7OOrXyQlXKRC1AP/nWa4cPPfXuTOTJjrbBCaZpW7n7YsOIuSN3arGlbLQswO1tn8njJY4PjsUWm3dWRW8Az2CgqhEd4zDm/gF2h+pncwjmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777052177; c=relaxed/simple;
	bh=CHDOwNRYG2bj/v4igJm1ULxAjW/zxl269FB69HbK180=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDt50B/qWwm8aCGnF53IbXxcXq5JJzHHtTZWNfs/HXawxrrE0GsEuua35dsie6rKa9BSDxxtGJZLnaAWBDDw/VzvO1WiPEqp3ynbRHa8dQwU5acIKzGzdbIL+wUfYDOe9r6bgtIZI22EnNkL8xkSrKvORRxx3j2C3YQqXASR2VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdqPztEq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdqPztEq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C63C19425;
	Fri, 24 Apr 2026 17:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777052177;
	bh=CHDOwNRYG2bj/v4igJm1ULxAjW/zxl269FB69HbK180=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HdqPztEq6GgG+lx4rIeXweQ+HFDlgQy45R2pauOCrgB2ju68+qqXeOaw4z0DNTYP+
	 s2+zRDeyp6eFktSfGoIbm4sIrEYdYhcwxjZAbOhuarg7LCeF8hcAiUJjw1X/dphSSP
	 7OnbVkx7eges0WkthglliKS2zqUGoKdUU9kSVF/tgi/s/BBatOYu8oWig71H1Wsm8N
	 iPmYRAIN4tSWKd38BApz2P/AqWf94Q9Sy50lkzFKw1o/kmGNtLLBbTXHYBFwz7GQZU
	 JvTQa3qr3iVAWe3Y8IgSOrnRh/jy7mafFtZOexfhtKlFwEw8+GehGvKyE6A3jz64Qc
	 oFRqlBPFo4oyQ==
Date: Fri, 24 Apr 2026 18:36:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 06/53] selftests/mm: rename hugepage-* tests to
 hugetlb-*
Message-ID: <30bb8071-06df-4953-b189-ab6a0520739d@sirena.org.uk>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-7-rppt@kernel.org>
 <4d2fb0ec-91e4-4902-9d7f-68d782ee98c7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fMCaExAVrSqimxm0"
Content-Disposition: inline
In-Reply-To: <4d2fb0ec-91e4-4902-9d7f-68d782ee98c7@redhat.com>
X-Cookie: 1 bulls, 3 cows.


--fMCaExAVrSqimxm0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2026 at 01:20:02PM -0400, Luiz Capitulino wrote:
> On 2026-04-18 06:54, Mike Rapoport wrote:

> > --- a/tools/testing/selftests/mm/.gitignore
> > +++ b/tools/testing/selftests/mm/.gitignore
> > @@ -4,6 +4,10 @@ hugepage-mmap
> >   hugepage-mremap
> >   hugepage-shm
> >   hugepage-vmemmap

> Shouldn't we remove these? Also, there's a reference to hugepage-mmap in
> Documentation/admin-guide/mm/hugetlbpage.rst.

Linus complained at some point about removing things from .gitignore
causing issues with old binaries left around in the working directory.

--fMCaExAVrSqimxm0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnrqggACgkQJNaLcl1U
h9BgyQf9GE7Gxqd6ZWhu6oYwgnH6MS5KcKZDxeEzEVo7XnAa6yCx54tOLV55nHUy
KLvJ74V0fzhAkFZqXXwe3pP+ZwjE8WX8/osZdpYk1Hzw9J7MH47lmL9LnW9MGeNz
SXF4HGRzP9WjlGs9wDmR1xQW2wx2wTCvWBjaSdWHkp0vkty8bkjxiJ8sJcI1JKDV
Mdi9tTjg3bDelR9IJ9V5rcO2KDQ1W/58f0AUnisFmLKOR6tt+F6CI1PZtVewAHQn
LdFHWUgwBFRBFPjqnhDuGBHGyd2jL9lJHAJgMurBBQ5AUdtGW13Pw/5HJth3Xbav
MnwVIHp2xlYA8EGQWL1Z1uPDBD5ykQ==
=hz+5
-----END PGP SIGNATURE-----

--fMCaExAVrSqimxm0--
