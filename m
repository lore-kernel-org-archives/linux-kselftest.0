Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DB43A3E68;
	Mon, 20 Apr 2026 18:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776708698; cv=none; b=oTBPsN44SqJl4OJRII456RywWlQhuN+C6T35BHqhaJMPshl9iAa+lCizTVugiw6SNUyu41ssHqEiR1oKPnHg6kUXnYtc2LJxgILPdHT4J5YjdRXexrTh9bNIWwB4xp/zF9Sy7sBnZpMWvXCKC8QPrTfL48VOfkdopV8W4y4P3OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776708698; c=relaxed/simple;
	bh=qLOLoMBkDkZ0pB+x3H6AU8n/Y9slQg4Fo0juZWlHZyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jv9sSORFe2wNcn2iroI2nV17Wxvzby9+eAtdcqcBkDzcfD6YWTWgUqaUhjxPMSJak2jUOhfRM/MCmr9WcmTtRlHj0P2Tz9JPudU7EsHUd3y9OuuC65Nr1LV1ofwPksTwc75GEHbOPpl/wn6s2puAzYRbPDJnwO1jZnzIKfEFc4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhuGBP9n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhuGBP9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9165CC19425;
	Mon, 20 Apr 2026 18:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776708698;
	bh=qLOLoMBkDkZ0pB+x3H6AU8n/Y9slQg4Fo0juZWlHZyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mhuGBP9n4ebMzQyH46grk6GgVPBNJnYB2pFgplgMMwsLHJyX4v4bVgdT9+q7zw0Jd
	 i0MOqo1AQfBTbZqghe+Mh6TR3Usiv4vnKRhRaDNwWGsosoBF7l2RY7uHPzw8+4LjX+
	 6pAfORz6M93b6E6KdsiBnDHmORyZQoXLjxgILuTTRozTuCvB3oE45+i3stCnaTzfKx
	 O9EiEJAhGirEBvmNkFpQnqpzj9uEd1Yvkt5wemo38rTRsFTsfxYQk1QcRBG52WqSL+
	 vMf6d3wC6fVudUowFIHYDqadS2ZwWVhgd9FQITKIHT+rhVGuSDPxhblLFXA9q5Pm3V
	 tiVL1Jd5lQBjQ==
Date: Mon, 20 Apr 2026 19:11:30 +0100
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
Subject: Re: [PATCH v2 19/53] selftests/mm: va_high_addr_switch: use
 kselftest framework
Message-ID: <2abd2a19-08cd-4d6b-800f-24e42a66f00d@sirena.org.uk>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-20-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MGaPlC4M7Ms405kW"
Content-Disposition: inline
In-Reply-To: <20260418105539.1261536-20-rppt@kernel.org>
X-Cookie: Sales tax applies.


--MGaPlC4M7Ms405kW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2026 at 01:55:04PM +0300, Mike Rapoport wrote:

>  		if (p =3D=3D MAP_FAILED) {
> -			printf("FAILED\n");
> -			ret =3D KSFT_FAIL;
> +			ksft_test_result_fail("%s: MAP_FAILED\n", t->msg);
>  			continue;
>  		}
> =20
>  		if (t->low_addr_required && p >=3D (void *)(switch_hint)) {
> -			printf("FAILED\n");
> -			ret =3D KSFT_FAIL;
> +			ksft_test_result_fail("%s: %p not below switch hint\n", t->msg, p);

The test result reports should use a consistent name for each test and
log any diagnostic information about the source of failure in separate
prints.

--MGaPlC4M7Ms405kW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmbFIACgkQJNaLcl1U
h9Ac7Qf/YbGFkjLXCtCkUkv5NeqyfgkSPz1aVQhRjEfjzZTckZXlnW3Ike7z2Faw
qJCnzwwp6++nRGTUvo7CnGugOrtXoRfvK86V0rhJ/XpTehOijvxXk97KzKLT6M/P
iIE8JxxdLpJLVxsGHq51+zl1/wJ/FXQVt6knRVS9g3wy6PRQylMVY3hrxvFmd7pk
GaZ0sjBt0RC9m6wQVZJtG+aZ4fe5oyTmyhdjecfFKk/ogC28HI6CiizJRMSSNs/W
n1QQvdv6H1AP/4rMeTRjFe2hyOakCLlHPzI1atxVoXhcmAR7GxrwlszGle8CZIcI
DewtaLgGJzg7bct+d1fLtNy2RV88DA==
=5NEU
-----END PGP SIGNATURE-----

--MGaPlC4M7Ms405kW--
