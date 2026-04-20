Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2BB39F16D;
	Mon, 20 Apr 2026 17:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707501; cv=none; b=fSeXQ9FGMovbRo1L0IxLT8RzUIZENXTkypEPSHKizy4dWwyHL+zCy0PZWuX1D/zEuVGxd+oZ5H4Hzwz8GJZ/3WdMD2MIBKkxGbjmPN8UhTv0kU9ZfqMD2cMKFavTjB1RVifmPJprA8b4wIArmttL/UtpOYir+rrgKAZ4/cmZDU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707501; c=relaxed/simple;
	bh=mY3wXEdJYqtwFobZpfSvTxCXivXipe897zMwAWd+YOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPPUuilENgaKrkxwm1gin2Bi0whuq3gVc4Y2rQpUMTWaGfFU0KKmWAtCXUIy6bfw10LdhRMS2BUE93ZZa4De1mPzByjnLplKAQUhwqopGPWbI3ocU4AvefkvxaWIvOcoUc+HHF3Lu2R2LSetalUY1Moeh8y2Sy4ucAjee82LVII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BuIgrQaN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuIgrQaN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF285C2BCB0;
	Mon, 20 Apr 2026 17:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776707501;
	bh=mY3wXEdJYqtwFobZpfSvTxCXivXipe897zMwAWd+YOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BuIgrQaNq4uoXEaCFD2DpUHqay50D6HKzat2ERmkvo22WJO8qePCU2ThNrGznmVh8
	 4Lv3wLdIuiqf66HqzGMpLojU/JfKR6rmdJdLrVsh55ngTYUHMU25FyfZHf51KM3NEG
	 7UGFdmb8oFRd/edkLE02HpgxWwhQ4OEX5IQlCmex1jTn0Pfo8KEbx5MIdXjgIiXRhF
	 XkQeaNkF5Qd5RAhoMxUEnqtD99gE5jLH6fzivX+5la61UZmaJlmGGnp3fPmrHJi2pR
	 8RthTZ1tJcWOI1GFe5GQhvxb+dl7zv7NuwW4ALVDVNLRRnjpq4mUR9Y9vx/EPU5tnq
	 FNkdnqjPuPTEg==
Date: Mon, 20 Apr 2026 18:51:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
Subject: Re: [PATCH v2 14/53] selftests/mm: ksm_tests: use kselftest framework
Message-ID: <16b3422b-0fbb-4710-a2ae-db708346ce92@sirena.org.uk>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-15-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YrrUwhb8sA1+ksjl"
Content-Disposition: inline
In-Reply-To: <20260418105539.1261536-15-rppt@kernel.org>
X-Cookie: Sales tax applies.


--YrrUwhb8sA1+ksjl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2026 at 01:54:59PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>=20
> Convert ksm_tests to use kselftest framework for reporting and tracking
> successful and failing runs.

Reviewed-by: Mark Brown <broonie@kernel.org>

--YrrUwhb8sA1+ksjl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmZ6UACgkQJNaLcl1U
h9DS7Af+LE2J8Vug2BqjVkH/zXOkpj6UrkW7RN1F0jc/3ZuqQ0expDQl0KjOVFMB
0gbqY0roNAF5hs35blJEVYKNk50YSJUcgwPlPI8RYU4I6YR3Jo1qdsuorbhZrUT2
JHY5BBrOtyH5lowILhNNOFwa8RFMdgP7+NNiP54zO7Iv4FVYYMDZPGEYaMAx68JN
x5WIm9U9eKKtnZ5z9h9ALxS6zkCp2t9zecqAJkLh4bqhRtJUh7hsMtS+P2XyyDLN
FrXy1i2Lt9XmAiEDOzFQnKz0JPzKStgtx+p7Lr/6nLms3YICIZ5zPZKhOXWo/dpj
8gKv9vq6wWF4ecR88j1eRFClBeFhcA==
=ay45
-----END PGP SIGNATURE-----

--YrrUwhb8sA1+ksjl--
