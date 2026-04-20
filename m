Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF792D77E5;
	Mon, 20 Apr 2026 17:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707882; cv=none; b=Kiko3MQfu2P/uPtPjxpdPligJRmfPTOH4VQfIWX+WDXHQqnonO1djlr5KDlu1oCCpikVe4Z0sy2dH/JchFXip2iaRSogyw4qxPgiFg+2jDcnZsk2P6amF83T1+a/BrPydDgq+TwqUtzED6mUwty9bHfBtaiR07S1qYt/J2prOTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707882; c=relaxed/simple;
	bh=kLIOzET/D58na+rPPFjcGkdlBaa/HxOhjKJa3Rd8tjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0A4i9XInEVVaZDQ3ewYhdUcuHqugMoxDxRj3IHYyoU2s4UqpQv/TqqNL9V+Hjyjb/ciI71Q+p5jNJGXT5vHxKy3RD857wJCorsZam1rNHPj97JIteGId4rGBQhPkVC0eIfH68ecBAWbeW72AjWNiyvhS49aM5aaGt9aTOf5gbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMm7+giC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMm7+giC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33D9C19425;
	Mon, 20 Apr 2026 17:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776707882;
	bh=kLIOzET/D58na+rPPFjcGkdlBaa/HxOhjKJa3Rd8tjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bMm7+giCluWHF0RzVtWdhyDN0IPTzco5n6XFZT7fqadS+fwgoBgvLACkCCJD7voEH
	 ddoEMf39hTWByXrvoYC8LNKIdCMSlwQsYIEHsZp9f8r5pzncJKFn67Dxy2UXYuPJ23
	 /YyULIThFY68K4dsjdKl6QwNabyq9vRaztn8K/YODjza9JjauLu/F0xKol+N9zMqFV
	 QNiC0yVdDhRcEjLRO40ON4t1KQjuQT0ljp4haWePcL39EVIWNss8OSj3MlvFJZbUL+
	 VXlwlvUiNox+Nr8RPG94Ei04/2QoIyP1cjr/sCXrt9bZalCkRBSNIeNPwPvJh4zH1f
	 IOgDEtW75zeVw==
Date: Mon, 20 Apr 2026 18:57:54 +0100
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
Subject: Re: [PATCH v2 17/53] selftests/mm: uffd-stress: use kselftest
 framework
Message-ID: <d27c7e98-df80-4fde-a86d-5344b30e6cf2@sirena.org.uk>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-18-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C53RmCkSuzJ78xCF"
Content-Disposition: inline
In-Reply-To: <20260418105539.1261536-18-rppt@kernel.org>
X-Cookie: Sales tax applies.


--C53RmCkSuzJ78xCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2026 at 01:55:02PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>=20
> Convert uffd-stress test to use kselftest framework for reporting and
> tracking successful and failing runs.

Reviewed-by: Mark Brown <broonie@kernel.org>

--C53RmCkSuzJ78xCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmaSEACgkQJNaLcl1U
h9AbZAf+M0NjB3aaF0QjVePHnBgGW1gUeY6+7l7UnDBmp/GJJhqNO4H6oBtG49YS
seD8JPsYmYIVl9j936Nd8oxedlExJjLc4qvGJq32WRC36ZO7kk99HQ8cRRxho/f0
zhWSSoUeFgkc51g15AmkVXHymhUJKF1WUHNH+WjDNwI2OlOQ5tMUnaTx+fKtAnhR
kQ58YBWlOvfT+57XPjKwMZpJHO2p/YgnKinv/eGr0EuLBgC+HirH114B4EA2VKCY
kU/up+4l5qvS22OrxUm7pF18q3REXExtnI6pYrStdWW1iLewSTOB4a4R+lyeIVo/
xwQpgYvN+EFAkVPtJfyOXf9TN8N4jw==
=UFx+
-----END PGP SIGNATURE-----

--C53RmCkSuzJ78xCF--
