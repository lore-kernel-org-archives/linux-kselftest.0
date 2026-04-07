Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69DA3A3831;
	Tue,  7 Apr 2026 12:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564457; cv=none; b=dAn3NqEdZ4MDP4kolGU7rsoBAp+ipLnG9dXJDZPxDy8/Me9AVRw7IiEr4mVOQWaSm18lHvfVU7vZi7sx+X3jmTgf2NCXrVyNqchrKujqmVFlQfx6y5+sknAJE7rzR48rBpSH232E+vknvXV1fFwz9OVj3XuS1fBXMkYTSrY8Isk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564457; c=relaxed/simple;
	bh=o3kLDSVfNpzT6BVW4UKA7/dPjmbkTacLj84V/Z/kQ7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vx4xGQEamESfAuK1Fq95jm+/tRCVMuB+OzWdFIzdyVs9RqDhvv3hgBrscGf3J9Mo0Y7hGbEOCZFuKX5fKxTUe35vlI3E5oJvo+dlqCWWSolSBkxPKPme8+vJl/fF9XY7OFMDNX7+/awkRp1ikcNMYvw36MgFVJYi5pXlnR7LIj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgthcIfl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgthcIfl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADC1C116C6;
	Tue,  7 Apr 2026 12:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775564457;
	bh=o3kLDSVfNpzT6BVW4UKA7/dPjmbkTacLj84V/Z/kQ7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgthcIfllHzi3NJKHdLCW0ISo7LLxmRs/fYUErgOpg9O6p2VuFW66UyxLLs57RhOO
	 wkbCVzgnH8NLFKC234/Y7IBHpfM9mmPVzqZZc3/dbv8HY3yFJliezDGpFIp63+P+Ut
	 C0uCX593zwzGGd2E4XQFFm2xCWjK/2Hh4GCspiexg7wTZIVaBLg2lNoquADL6W0vOV
	 bs1A4fvRqOHXavJSXkoymxxazdzFmT3Ihvl4rVWwzE9fX5/tsM4HW5t053tb1zjgRn
	 hqvIMGloYSOrSjdmO09J/wkeis5AHGgLwyh7lfj9oa+raswHQO+lkc06MkjvW32Dd/
	 7K/AeiuOGNXGg==
Date: Tue, 7 Apr 2026 13:20:50 +0100
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
Subject: Re: [PATCH 00/53]  selftests/mm: make MM selftests more CI friendly
Message-ID: <94f6d6d0-148d-4760-9e8b-1bcb4684bd81@sirena.org.uk>
References: <20260406141735.2179309-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t0LR/773YTDwCZqz"
Content-Disposition: inline
In-Reply-To: <20260406141735.2179309-1-rppt@kernel.org>
X-Cookie: Now, let's SEND OUT for QUICHE!!


--t0LR/773YTDwCZqz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2026 at 05:16:42PM +0300, Mike Rapoport wrote:

> I don't mean for this set to land in 7.1-rc1, except perhaps the small fixes in
> the beginning of the series (patches 1-4).

It might be useful to get some of the conversion to kselftest stuff in
earlier as well, if only to make things a bit more digestable.

--t0LR/773YTDwCZqz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnU9qEACgkQJNaLcl1U
h9Di1Qf/TeRvBsDh7XTWAMsdbCRsin4+48rk/wKPGrV0+VtMmpSv6t6DyPGtU1+l
N9XKZD0V6+tdZj6uNk2JrSWXXSAHvZeNO+bHUWJLVrqZ7nJrfOUE/+Ez8PH5bjnE
XdrARxyG5s1p/aYAIu5FCXxzwk1FI+mmN8PDxa5BmSzIsaScVMnWcE+LKCI54f6z
6mZn7+HCCvqxjj965QlOQ3WlRkICWCuj01V0Iii92uOGUR6MJ6ME6S3swwYVnFTP
aV1XLdY1X6qcEF+9dv32HzfmamYA/jul13/vVyFZpvO+0bIRD8iMOhYO9z3hVesM
RnZqbJN+gJaXBeSK1k1TcBrLvuSpuw==
=xtd4
-----END PGP SIGNATURE-----

--t0LR/773YTDwCZqz--
