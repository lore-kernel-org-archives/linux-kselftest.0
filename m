Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B8B374E6D;
	Tue, 21 Jul 2026 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641689; cv=none; b=q7xWNuR1gTqbA6q8hXWENoXjEk6L5FUdigQr5p4QYwTMpiHaUVP0A5Wu63egAEKzawaR1w63HJ1Qh42nR4ZHQusNwL2jDYHU3Jssaq/rltAOFF14fq5LVXpDx2bvc/XWJla//Xs72UQsBU2NGShfJVtZiyiEHoPDnJAX9JrKjBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641689; c=relaxed/simple;
	bh=2Ijr8E9sp0TZKnNsNz3/ZnkOh12J1gJC9WmNAODHvNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRmIAZYKyKTmFtgfREmG7RgzmqVbBKlwqdBdqHlTP6pwJSpPTTgAuzPNPqTfGJpRAAoFFjYgn5nmZANcKar+kwExsYE5QwVARJmUwiGPKdoMFfq9kY56rgCL9Cpdf4c5zUzyyRXz3g3Nk64zd3p6LC6SRLiBx0ekTLH71TSDKr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlgzPEfX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlgzPEfX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925D31F00A3A;
	Tue, 21 Jul 2026 13:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641688;
	bh=j5BIL8GcU7PIu2AZvJVGpBFeKZjfYIY1PBCsqrQF8aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZlgzPEfXRe/kF/voTjPInaLpADpX44VTagXe+XdlnbQv1d4jBBApC35FXzHiyKPrz
	 RE/DEtL/jQFkSyJdLuv22nEWkRmaFffNM83Nsc2olsPt/zDYWsFNr9BfKZL2YV/UBn
	 1tCpcLRePHkyanLcZkYk64I+wJ7Eakrockij/+n6RhWz+iW72UXmj+VMQEwWDg9GXD
	 UOiB1g5BZAZ/XsK6j0/Zlh5mIDIvsZ3kQ7eRXTXw3lmCaZp7aOCgkPGoEwMGowcL6Y
	 AYnf2HTLg5c0y1bIdP3erIs/Fsy2d0lOSOki9+YcRF/Z1WA+0sh3m1YWwIE5Gqsrl8
	 Ycp6uIL4gVxlA==
Date: Tue, 21 Jul 2026 14:48:01 +0100
From: Mark Brown <broonie@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Sarthak Sharma <sarthak.sharma@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] selftests/mm: make file helpers return errors
Message-ID: <004e11f5-ab21-479d-80a3-64ab89465b85@sirena.org.uk>
References: <20260716123226.197736-1-sarthak.sharma@arm.com>
 <20260716123226.197736-2-sarthak.sharma@arm.com>
 <b66c233a-7956-461a-a3d8-3421c76c937a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l4q+CPIb5QJ3JgXm"
Content-Disposition: inline
In-Reply-To: <b66c233a-7956-461a-a3d8-3421c76c937a@kernel.org>
X-Cookie: Love America -- or give it back.


--l4q+CPIb5QJ3JgXm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2026 at 03:39:09PM +0200, David Hildenbrand (Arm) wrote:
> On 7/16/26 14:32, Sarthak Sharma wrote:

> >  	fd = open(path, O_RDONLY);
> > -	if (fd == -1)
> > -		return 0;
> > +	if (fd == -1) {
> > +		int err = errno;
> > +
> > +		printf("# %s: %s (%d)\n", path, strerror(err), err);

> Shouldn't we be using

> ksft_print_msg()

> That does the magic "# " for us.

Or ksft_perror().

--l4q+CPIb5QJ3JgXm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfeJAACgkQJNaLcl1U
h9AAKgf/W2P3L6gxIJBRCaru02ROmZfAkRbbWouq52Dr8KqswGFqUwYVsaxjUZ/i
nQmWqBmLX8PrZxIizVYUZZxouuxbOoMIZ7mwboSXE8uGNnJ6CFxo6KLWOlcLP/Xg
akDd/juu/5coCFmz83G9Cd55h7RhRJeYjtqiNa0lE8Dg1BfqWPdKgCNDBOYMXvEW
Vzr9istUMQbKxMkwaOQjd0bbnDCnFn4mU8Fyz8rWvYe3AyOhEDnns5FUbqxgOf5s
hVWS0dTEuAj5JPN936nNldLO+rB2X/ixuPgfQAE8BEzTIkXdUkRxXWoiUrXb+432
hYB8m91tLzFurVsSIOCzhEQyLwhrTw==
=aOKi
-----END PGP SIGNATURE-----

--l4q+CPIb5QJ3JgXm--
