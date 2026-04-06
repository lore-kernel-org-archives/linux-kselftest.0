Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95C637419B;
	Mon,  6 Apr 2026 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485683; cv=none; b=SUdpNO1FtQJUK+NIvsxcFWjZ6NnoccNhPyxgiqtYK3vx5OTB+J6nljmVzabM6KsCaxGldSUt9mOCbVoyBvgBaqAltWjVOckfqY4Q6Uu3A6B6uzVHg2bV8p5c+2DMjGEBTALkL94FPgK+lROXypHT7Bt0ZoOGSw1JzfbLhu4Qs6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485683; c=relaxed/simple;
	bh=Jgs8OcyaNYF6N+1kAZCcYjNNqypzJ8NmBV0NzOlPQYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqSZQUyJUQoFobR72fVdD80WfSsk+khtOzP3Hqt9j5W2SJw3QmOQ0ExcQ4DnGE4d9x7fs6uqMD/7iYMRS/s3ehzAQJj5eJK4Jga2laQhtMda7aAdYXBfVqM2NClhsNCldgRYdSgkJ7tpKbBhvzX6oa4tfg0X9MLXhOo8YMWTB1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQD9n4RC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQD9n4RC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2C2C4CEF7;
	Mon,  6 Apr 2026 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485683;
	bh=Jgs8OcyaNYF6N+1kAZCcYjNNqypzJ8NmBV0NzOlPQYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pQD9n4RCELRdVba2kMQkSyXgQDtf++kFban9FsTWhEPNtWk8XBv4Hv50YyIcWXKWW
	 k2aUlrPJnRh4ZF+1BMORV5+PsSEP5dWJQMxr0WmBDQndC/ElOpccsR9PwABv4MQoDq
	 Gr+h0KW2woti0uV8U2vwJ0Jep6d1dQNRafoAJkmTQz+xI3+MlRqDZOurUJ/rk45PX8
	 Y3HaZWKAbHNPFzDvwniINwiVeZfjj6eI3ANDOws8+pK1Uw+/HdZQu0Xvcf2m5Gswwc
	 ii2tTWBzTdVpGt0EoJA9MAeLAaImt7LaydMRExvFqAOPFhwMRNvjT4xLXmo1Tk1sa0
	 26eTuce+7N0Jw==
Date: Mon, 6 Apr 2026 15:27:50 +0100
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
Subject: Re: [PATCH 07/53] selftests/mm: hugetlb-shm: use kselftest framework
Message-ID: <8fac53c1-f7c3-43dc-9389-07cb60fbbda5@sirena.org.uk>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-8-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1MwePQTqQaQ8/AtX"
Content-Disposition: inline
In-Reply-To: <20260406141735.2179309-8-rppt@kernel.org>
X-Cookie: Does not include installation.


--1MwePQTqQaQ8/AtX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2026 at 05:16:49PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>=20
> Convert hugetlb-shm test to use kselftest framework for reporting and
> tracking successful and failing runs.

Reviewed-by: Mark Brown <broonie@kernel.org>

> +	ksft_print_header();
> +	ksft_set_plan(1);
> +

There's not a huge advantage where it's only one test but still, good
practice.

--1MwePQTqQaQ8/AtX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTwuUACgkQJNaLcl1U
h9CBbQf8Cl2vPXTZJB8sRNcTWsB0R9qT/5VUc3ynOeQWV3/yZvAfG+ztF2cfIzyq
kxxdAgubXGfwFxee+9gr09hJLBTBFEt2y7yWxL+xSM6BeDqt0NA4xjeYW1ECUg+3
5STEM/g3eJiuxNOAYnjbquFE9GcKf9AyvHpPKGMnvADpNbDfYnYIrZ4u5Frkqh3H
6HqnaJ/a9xUSw7tNV3PbLdIekE4Ttw0SGpvO3TXha86ix8PW2GXXvrq3Qll6u7cF
KunndEVCG2GKjcgdtnBukVJA1BfIVhjQdBNW2yGoYZnxBuMVuRvLyYar7Dmg8T8z
dCCxEtiq3xGNm0mHEMHJPETv/pwAow==
=bzJF
-----END PGP SIGNATURE-----

--1MwePQTqQaQ8/AtX--
