Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D803845B3;
	Mon,  6 Apr 2026 15:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775487968; cv=none; b=Ja/r/nXrZ77zp4PwUrvV4WhnwzxEf+kwnmADCxBtMRD031UorIfQy4FdvkGbl1WwIuiQ6JrV34yhoRqoG1WN4SWd+Y4PnbVOkwuzooAioQSe/Vk/6wwxrNtNUWhfC6k/2aMWkAh8o5TZlV769MqG4TfW0cKVcoCi8cTyAiTMBrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775487968; c=relaxed/simple;
	bh=t42c+RqBRpyaInTeeA+to+5PYImxlWv6emwwnUORnx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lol7n/k89KgCas8zbUdyLtwlAMTh03Ll6BqjAo9Sv+qgYA6KBd4smA4OFGjTUnwIwhtBGQ8ORSLOrgaI7uhYBFs6Pkq/XWCUuz/pLyCShFtSdZq+/1DSL+8DfObxIJQ70P7tNM8jde+igRHXaWuy7KKCH5hjJnNeBGndV2QYV8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2ot1zL4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2ot1zL4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59580C2BCAF;
	Mon,  6 Apr 2026 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775487968;
	bh=t42c+RqBRpyaInTeeA+to+5PYImxlWv6emwwnUORnx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2ot1zL4QVHwK6FBuamuF8/bGasFnCjqOeOfYa+xuNtF96uAfBzVgKydOk8g7kMHX
	 eIdu9j/r2VtKeQNapMwO1XkyfVsXswouPHGFUAdnSOd5Y0bQ5BkKufLQ9wl0PpyUr8
	 /3Bm/ebzpt8S+a0EohyZqkwiJ+NDImcqGBH60G7nvQdOwhYUvDrB1pnmje/fStiQfg
	 C4oZJMLROghBi0RQS4bXkxavQe52Z/0WVU3asy7pEd8IQd74PO9LuWvco9Az6Qfnyd
	 JZleqF7UpcUAXmPm6ArVJPH0KGHH0Fk0CNNmQ9m+qvF03pV5CRAT6j5SyF/BCBWaVx
	 mHC5XF1gvVlDQ==
Date: Mon, 6 Apr 2026 16:06:01 +0100
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
Subject: Re: [PATCH 10/53] selftests/mm: hugetlb_madv_vs_map: use kselftest
 framework
Message-ID: <7feb751e-bf2e-49d9-b8a2-c5d3966426bc@sirena.org.uk>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-11-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+GcDbzDnrxvyAWYm"
Content-Disposition: inline
In-Reply-To: <20260406141735.2179309-11-rppt@kernel.org>
X-Cookie: Does not include installation.


--+GcDbzDnrxvyAWYm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2026 at 05:16:52PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>=20
> Convert hugetlb_madv_vs_map test to use kselftest framework for
> reporting and tracking successful and failing runs.

Reviewed-by: Mark Brown <broonie@kernel.org>

--+GcDbzDnrxvyAWYm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTy9gACgkQJNaLcl1U
h9B6Hwf/TtciNqmmdW23+J3jS55anwwkpx7DorOTejFXA4CO/2cM+8JECjQLsDGM
rs6BBYo2feVBtrhVI800l0AdTKRuqMeyCmFpRA9p7fx3SM3ILhxx3RqNp6Blt2hI
E9iDZ6EsPi65lPSgy1aZNanJxdSypJyUINBUQFWFWxU2/0J3gp5VzzRp7+SGySIx
YfUmOitZHkhfUeNo+gvKjCyKNmdXqZE3nVUbhMtcFbUgB1koQSVv1sUfemnqTumo
171F+EQL29nieTz6kBa4N77ljHR9RlZcSZsUZ6kdx/rwJAobIYwcftFMbtGDmq/I
nCn+lhrSGcUVN7xPm34rn+5hW1uE5Q==
=FC6O
-----END PGP SIGNATURE-----

--+GcDbzDnrxvyAWYm--
