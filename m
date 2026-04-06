Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4542B2EB84E;
	Mon,  6 Apr 2026 16:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775494301; cv=none; b=jEjZbg8IKhBuYJdIA8Db0tRDmwO+BFkmaKCE69lwKgxONAml0E80YCZZ2SubEk3uy5I3siyLZH0oYiAs0QfYUAh8rgHGs1PkO4oWDdQTYjhZFaI5aYzVTAElrX37vgPIVMcg+Hz8PCfoLn+2wOU3swNpRXf2UgErqz9+V8Y7D/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775494301; c=relaxed/simple;
	bh=KpQ+nF1UYQoeBL/LLUra4z3jUi1UpdwVgKThzgblpnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffGo25r6/SGq7fqs3AMgnuyRGUd4CBY8CCNjNoWZJkFfSDC4gPIFCI1L5dYgF1E/tKk3cyTncpq9YQ9S7xbUukT1QaZj4yX6mZLZKoIATkhqM/vztZ4L7djajoYEFOwiOh+H0isnLnrJ5JYd8MbCaazUtZOg3rVGB2P2O2g/4So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1wCQEax; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1wCQEax"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D004AC4CEF7;
	Mon,  6 Apr 2026 16:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775494301;
	bh=KpQ+nF1UYQoeBL/LLUra4z3jUi1UpdwVgKThzgblpnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1wCQEaxYvxJ4UK8hMu3A5e9XOD11z7L8jfBp8/tan2Li6rM6NvH0t5Aj9PAWpFJH
	 o6xlVdL9G5YMPKGS6/3ff5PSyRqiuk/0EiNYnxdgaDNJi28H2WypqBuo8mDiK+IsMX
	 RZorqq1Mk/ATutfg1BWZvfKqzbIFBNc6d7eYzmKbINNwafQ03gCTveql4k2gNsNOiW
	 K+BQr7hBIDbUdfsJFScblbllMAPWyoSEPpulN+ELyiKDLBhlOAzGE03Ujtpfr+M+XV
	 ldB2cWD+Um4CEMzuP+8QpVI/bI7/Uy+4+x04Vg3ih1TLiFmsZwvCVzsaf9teDNpo8Q
	 ZZYqlm8CRgmJw==
Date: Mon, 6 Apr 2026 17:51:34 +0100
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
Subject: Re: [PATCH 15/53] selftests/mm: protection_keys: use descriptive
 test names in TAP output
Message-ID: <274d9c8c-ebad-4fea-a9ce-a4e7f1bc4f2b@sirena.org.uk>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-16-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ap2wh4yXxp1Kxaml"
Content-Disposition: inline
In-Reply-To: <20260406141735.2179309-16-rppt@kernel.org>
X-Cookie: Does not include installation.


--ap2wh4yXxp1Kxaml
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2026 at 05:16:57PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>=20
> Replace the numeric test index in TAP output with the actual test
> function name.

This isn't TAP yet!

> Use a structure containing function pointer and its name rather than
> only the function pointer in the pkey_tests array.

Definitely a win though

Reviewed-by: Mark Brown <broonie@kernel.org>

--ap2wh4yXxp1Kxaml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnT5JUACgkQJNaLcl1U
h9DURAf/d5nVR2wkPpv96T/T/nObvpCeUkM4FI6CupWcpktcsVqzEeRU4N5kk1Bj
s4AtAPdskn0GcPKBlHKmYVK4M8xHfZvbGKQwFniMpCMuZ0POUciHyHpt+rDAw6iR
ISKMqeWjAHEX7TU9Krg2m7HDx9DDgumwDQzKmpSJ5wqeiR+OQIaU+G93bbwhkRmD
teK4DpxKNsTX9LFNgxatffnBtQmAyv1WmMO8Y7/h0eeY2OjQCg9vvPAsbgtZSCmH
hMC0hKAGNjQ7OlYM9AOfZ8tdFAODEKajDPXJUQOz4WeDtTy7MDqYhQwImHnDIFbP
btDe5BYqPoDoDydXals14k72h9Dx0g==
=4t+F
-----END PGP SIGNATURE-----

--ap2wh4yXxp1Kxaml--
