Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9723AB29E;
	Mon, 20 Apr 2026 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776708583; cv=none; b=RizWQ3irzwxHCiWOz6q06mzFLVDftpruHnjtWPqXnFRMwNLpbXs8LS+vGiWyk4GhTg7ZM9NUXOnPkdrpY+Zlj8WJdc/9VUZI2wWZao5idngGA2Zx2GHQLDQg60B0+c8CCJQgPSIh+MELDc01cUnHsoIb6Zt8Av6vORc/H1c+YwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776708583; c=relaxed/simple;
	bh=5lqu7gVxDph9rA+RFSYbNtE6EvF6ZbWBXm7k2cxJnso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfoVQWn+tDfC5n6xEtQ3M8mPXG5fDvG7GuGX6++RB1qPwCaEUAnwQp6YUX+eIOmXIJl+0TvM9mTf4aeUq7wrYG8JV54bUxjFAchIsucCoEftmcsYIRVomR5t262nUc7XCs9AOUPJqMpSFUMT+NwhS1di5OWh5qZipAH94E/ch6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZbeS0smw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZbeS0smw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC90AC2BCB8;
	Mon, 20 Apr 2026 18:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776708583;
	bh=5lqu7gVxDph9rA+RFSYbNtE6EvF6ZbWBXm7k2cxJnso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZbeS0smw+nBW+utwOMzphiEHf9/5NOi7pPk40Sh5zyPTfRl7IzKoN8lk5ULyzEM2g
	 zTdxdFAJ40kTCu4Ub+30mR6f5raGwr7fM2oKq82KUbbm20nw0gCJT4syLQBv6yx+Dc
	 jsFSI5rbyzkkPyCKwCcebpegMUVCfHCpgpcK0aoLz97ntSJKYrMTyjwozSTtBD9WQs
	 KftuTZbiVKiM1bw0UTNskULvxbJg/eo/x8ba+xaM9E+yAblx0ug8+zJG4FNHgizDLG
	 9NUTU9yHEHSBGBoQLXvMI6J34ESlSZaezaUlB021ZObC3hug4tF8sdhhnbHpSqTnn/
	 OvrCF8uEaCxhw==
Date: Mon, 20 Apr 2026 19:09:36 +0100
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
Subject: Re: [PATCH v2 18/53] selftests/mm: uffd-unit-tests: use kselftest
 framework
Message-ID: <089df1ee-59ea-4333-af17-f4316a66833d@sirena.org.uk>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-19-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Yx+TiVjhCn0KM6v"
Content-Disposition: inline
In-Reply-To: <20260418105539.1261536-19-rppt@kernel.org>
X-Cookie: Sales tax applies.


--9Yx+TiVjhCn0KM6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2026 at 01:55:03PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>=20
> Convert uffd-unit-tests to use kselftest framework for reporting and
> tracking successful and failing runs.

Reviewed-by: Mark Brown <broonie@kernel.org>

--9Yx+TiVjhCn0KM6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnma98ACgkQJNaLcl1U
h9DBHwf/XblVSuDksuXGMxVxGmW9m0Ph9Bysu4Tp38cfVfnmD8sze3Bo0lG2K1IL
dkcpJSTVZXuuXVsgOL3xB71p9wTMsa8fbBUGT+g9HQTjp1QZ/ifqBG8roiCZ49HQ
l8ot8QLae3oxwK/CTnxdGqd0Uhy4MGyVPDr1Y2n+yGeYDpTLv0P72nlg7E4Sv609
nccgj3Jq7fBhwE2MzhX7xJIV2oPdssWCc6LpVZW/wSl8YARJuqFVzTBzcv/bAPpY
huTBAQ/wG4VqeAWIzVc+eu9ni5DwUP/c8c88SKTOMaISZd3whpEed2/otOV8eFwm
TCcPS2fYQyBNJs9KcX+39OD/eecmVg==
=WdXE
-----END PGP SIGNATURE-----

--9Yx+TiVjhCn0KM6v--
