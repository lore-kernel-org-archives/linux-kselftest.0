Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEDD38B12C;
	Mon,  6 Apr 2026 16:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775494158; cv=none; b=pJCCpLa+NPtLppfjwvOZ9P4ie2jwxIwewTUhsxwvaB2jJ6dUP8nE7Cy2A5vkClWymrXoMZLPnMKFPG+2BZnEm2H9YZejm7BYIU1eoEw7zPyXAKhAg5T9NclB31i2v0TUowpCqdsYrTF0WM3rF93xm4x57JbRJNfL53KCtcW8Pco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775494158; c=relaxed/simple;
	bh=+h31anjlodIqSrDMTRCd87rH7VyvUE2n7uNwU5IzmM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTtFU/oKD1PYMnmMDmWUjVSK2+1KBwqpoNoOlwaUZIb4MhCa9MrMRE8MiqKD97mhBombZd4++kC1AzF5iIeQN/14MXQnGo8tGK+bJWV5pXCAPBax6GuHtVJxg+nxErN8uI3IIVQaiZICHMbgmNDwt0t6GvbEla29pMWRHEUw5Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GjVk2u+O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GjVk2u+O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550FAC4CEF7;
	Mon,  6 Apr 2026 16:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775494157;
	bh=+h31anjlodIqSrDMTRCd87rH7VyvUE2n7uNwU5IzmM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GjVk2u+OWCwejllUeeBb6pwZNUHHx905UrJoE1QX/OeCBU28l9f5TdMa5J19E4BZl
	 bSvNwybC/eVt++qKsBUQyDaEhKvsrf5d/bPofs5DHIolf3Yl29flNJVSUmbXITy7E/
	 JcE3EbEmem1Bo5W+E3fm7zQAwGt9zOk/L+Z7jbMyPwoYUX1sMFyCpFoJ8vALsEbHXV
	 PYqrvC88cou4AsfNPze29nqsYX9JsMI+Dc+nVNbEnJRvlWMFUbY82e7yAMLzwHfidj
	 7+A5R3ml0dK2vN00vP5uG8Hx7ERFpCYf6+qoilzie6e8aW+8LMC1pnJ4pvPJvFTkUA
	 P7+eA7VD5MUqw==
Date: Mon, 6 Apr 2026 17:49:10 +0100
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
Subject: Re: [PATCH 12/53] selftests/mm: khugepaged: group tests in an array
Message-ID: <b3daea31-dee3-4d64-b0a8-4773176d1876@sirena.org.uk>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-13-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aOUOKEiGsonxJhzu"
Content-Disposition: inline
In-Reply-To: <20260406141735.2179309-13-rppt@kernel.org>
X-Cookie: Does not include installation.


--aOUOKEiGsonxJhzu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2026 at 05:16:54PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

> Currently khugepaged decides if a test can run using TEST() macro that
> checks what mem_ops and collapse_context are set by the command line
> arguments.

> For better compatibility with ksefltest framework, add an array of 'struct
> test_case's and redefine TEST() macro to conditionally add enabled tests to
> that array.

It would feel more idiomatic to skip rather than ignore the tests but
both approaches work in the end.

> +	for (int i = 0; i < nr_test_cases; i++) {
> +		struct test_case *t = &test_cases[i];
> +
> +		exit_status = KSFT_PASS;
> +		printf("\nRun test: %s: (%s:%s)\n", t->desc, t->ctx->name, t->ops->name);
> +		t->fn(t->ctx, t->ops);
> +	}

The exit_status handling here is a bit weird but it looks like the test
is a bit weird and I didn't spend time figuring out what the best thing
is.

--aOUOKEiGsonxJhzu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnT5AUACgkQJNaLcl1U
h9Cq9Af/dIK2L+v6qUAFbxJCAZR90rEcaCia+4anZY3gyTO6tjSdXHJ26yxvhloX
K6bIZYgkLOp3VBdsY1eq8S4/yVYtAj0iAPMO+RBmqkDKodQSHj5vvxLTUCiqBuV1
0GWitlqeH65RC1qzeEnHgLIfhjhKNtrbPwGh4NTVTZ1cXcmfS+2/kJFH7OXOSaRJ
SuVIzRFlzkUmQZ4VfrK8d9UlK01C+9u4H/gVbVptGrao0TuOfokKgUY9ZsmZFX+n
+Gddk1kqoJJLq/T5w5lPHjG6mUXcq0/+VzErROCHQoWXKt23zf3TPNkWuhTT5mtU
Tj64uVWDhPRnHkupoctQiTPBo62yzg==
=0Jkt
-----END PGP SIGNATURE-----

--aOUOKEiGsonxJhzu--
