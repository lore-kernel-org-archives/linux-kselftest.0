Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77389419315;
	Mon, 24 Aug 2026 12:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574483; cv=none; b=gU6ZdmtXduD9n8mXnfqjopRJFIkC/lshsTpJcsDqzIm/7sfe4jqyqNfIKrurJXiK5PWksWTSO7cFQYeo1wbe3S3Pp99uvmUKvpKfWqM+2slEWJ5MEytcha6nFrkdAanLz2nb+9Yg9+FwLcHNzAzEAI+c1XAWsOuA+rkyQ6ibJ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574483; c=relaxed/simple;
	bh=hkewcHo2Mk5eAbz2tCXMgTDY4F6J+phB2cnyWQB50gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzhEX28ahJnhSJ3M7wq3jABkfa8qeTMQW1RnXOmyu0zjrpCCeS78UKgdaeWHJb6aNLNU6tYVMaYQlwLqGjQKSyHiiZzccfw2ND5zgwNH5r13IwcDXTlU6zulJMJ56pL1yXqXLpK6m7cl8wg94fLWU0K1Ko13LtY5aiUCU8L4rJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qeu+Vvyl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qeu+Vvyl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B331F00A3A;
	Mon, 24 Aug 2026 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574482;
	bh=cy9l3lM1kbxMRijBR1/D17zWRjBciAMYYTfa6ENsams=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qeu+Vvyl5pqKuxqyyx4Gc3d089MMKlyjZ/CtOWRI3ygeOSM7l/Fwu0dbBlvCT9xud
	 YtPHE/mtb8o5oTLNr3mFMsZEXb85zNmH8jQXUzjMh1REb1AnJyZZfiHwb9gEZ+2WG8
	 4Ws52jpWtZtRiWoABAgc49LoyV8BblkN13xh2s+JomZ2elDWej86iFataMPjm2PYyH
	 EhLEp9zUqAS38xxkSJgNu2Dbm0T3khDIIkgXVSeXVjl91TK9lztvXhcZ9gKy1m0ZP6
	 LTIP8Pxg/MpPAdtcXhTJmczUHiyes38YXhA1lXX+lP7n+4a+dczYAgv4eh4QisTvT/
	 wMRpkBRc7iDpA==
Date: Mon, 24 Aug 2026 13:27:54 +0100
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
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/6] selftests/mm: make file helpers return errors
Message-ID: <e4f8031e-20ea-46d1-914d-005595243f31@sirena.org.uk>
References: <20260813181230.483746-1-sarthak.sharma@arm.com>
 <20260813181230.483746-2-sarthak.sharma@arm.com>
 <75738049-24f9-4056-98c8-b4075552ab78@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L/9r1vqM2aKkt3uH"
Content-Disposition: inline
In-Reply-To: <75738049-24f9-4056-98c8-b4075552ab78@kernel.org>
X-Cookie: Accuracy, n.:


--L/9r1vqM2aKkt3uH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 24, 2026 at 02:17:03PM +0200, David Hildenbrand (Arm) wrote:
> On 8/13/26 20:12, Sarthak Sharma wrote:

> > +	if (buf[0] < '0' || buf[0] > '9')
> > +		return -EINVAL;

> This is to reject any negative or hexadecimal numbers I assume?

That won't reject hexidecimal - 0xNNNN matches the above.

--L/9r1vqM2aKkt3uH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqMOMkACgkQJNaLcl1U
h9CvGgf+O6xziDN2tC2WVmqshJiIPV2RTp+I6jL7UYGbu0/4SqXrGYtjV/06GpXL
XnqCVPhTbDWZdjCLVIxYvyIokjMuaRzRVVl6xGkwA6ynuBLRzkOv6vG9V1Vpz5mc
ZQ05N0r/DC1kHmSjwfi299fi5eHv6QCin3RDNMxG0NDXztSnw6A9tuKMH+dsZgdw
YHrYneZTcZUzGVopqKJijMvoUwXSi0U1PbVygYjM6wBrk1WhCBIUiR3SNjrb/XiK
XvzUl+tqMHROsxEik7UN7+NuH8jdQyYVXDnkU3LvBfFQmGnnDn2TO3KcxZQQZXJI
LvabEh4JA37rsghLhdN22otZ7sYftA==
=pTvz
-----END PGP SIGNATURE-----

--L/9r1vqM2aKkt3uH--
