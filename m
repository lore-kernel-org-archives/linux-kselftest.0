Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B5737BE9C;
	Wed,  9 Sep 2026 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975290; cv=none; b=XJQkYEEzT2UcmUVOHVeyL0hOymIVhjTq3rYdIfzHC47sxSwPQHBT2ILx+7Zn1MTyLQ64tFXdacX9HRpRSQwSLJFaBNR00P8fGUYII45qr8I53Ri62HEWK2w1LIA3WhcSdtaAVdgcjCSHf6ZNWd9FR4uLwp47mc0rDtBJuTKJmzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975290; c=relaxed/simple;
	bh=Tr4VdxERUhV8HxN7l33149d0J+8lmjsaWAYgZOwAqAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Om9XEbucsxHApDTTn4bjssb+5YAz7jMtILulm4lea6Ej2ojnIbEtNnlaqIe04JD7ZXshxVMIwcfOCDXQSih0pT0ogcxLD4aChBbKTGT8is8d4l9/pphmx1/0j9XBL5iXxh8yr7szLZkiCVjQ95UG300CDr5/cX1tFnI8ZOgmI+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mvn54j8v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mvn54j8v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC471F000FF;
	Wed,  9 Sep 2026 17:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788975288;
	bh=bbP+LPyTIrLymnPyx3C1GnkLD9nptQPBrDixZ3LBabw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mvn54j8v2Vk5488SjbF3KsiKDQLuwtMXnO46zlphInEv8sn11l2eqbEMu4hGV61G+
	 cx+rU/PkBan/NnZqIXabA8qJDPBHOTUt039zgnfB9DB5cTmmHL63kqgkx1M+I4AVor
	 W5EA9xrYavVIkzMe1fnHc4vuYGU0spJrfYPeIh/Q4akx3XndXio1JJ+ba+xny17Uiu
	 hWrLtFldUpaAhx1FNLzW4iJFbOr4ftCV0dwi9WOGNLK3CmItekCctjwLeWKTMr5T0p
	 GjU0ESvBW/Uofqzu8k4MvE9a33DRHUGq1007291ruVV8ntHY22Pckl1EMBDi5SR69n
	 hdJb6e2ACj3eA==
Date: Wed, 9 Sep 2026 18:34:40 +0100
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
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 6/6] selftests/mm: add a GUP selftest
Message-ID: <07dab220-8497-4eea-a4d2-b27a6e01eaf8@sirena.org.uk>
References: <20260904123631.198697-1-sarthak.sharma@arm.com>
 <20260904123631.198697-7-sarthak.sharma@arm.com>
 <b0400430-c3b6-40d5-b476-49189b1cc292@kernel.org>
 <5e0b9365-cbac-4f2d-b915-85edf3093508@arm.com>
 <fadb8870-37f8-46f4-aefb-c21bc3a31e5b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KmRz5TkdMlywIsKu"
Content-Disposition: inline
In-Reply-To: <fadb8870-37f8-46f4-aefb-c21bc3a31e5b@kernel.org>
X-Cookie: Postage will be paid by addressee.


--KmRz5TkdMlywIsKu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2026 at 07:03:59PM +0200, David Hildenbrand (Arm) wrote:

> >> 2) Move it to tools/mm/modules or sth like that.

...

> > This is an interesting change. We can keep this open for discussion
> > here. If required, I can work on this in the future.

> Yes, we should in general try moving all test modules out of the core.

If you're working on this please make sure to take a look at how the
various automated testing systems cope with modules built under
selftests (personally I think everything I care about uses tuxmake
builds, but there's other stuff out there).  I think the answer for a
bunch of them right now is badly, but I didn't actually go check.

--KmRz5TkdMlywIsKu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqhmLAACgkQJNaLcl1U
h9BPiQf8CxE4IrSgHLYMJ5iNReJ7dS+KVJWt7vcB5HxJrCVmeLsaDp9p6fQbIG3d
P14bK7/go0oX5sScOruE0zw+rPFYr7OiSZMDNlYwLTXLVLz5PWrn9r25tDHWeRFS
F3oy5EsiGyp2GxAzVqk7lqmr/AEQGc0M2aN6wcn7/EShuAb51IHocAegVLZe7EJG
1jGpOfndf3DfYhtwc+u4QxnCDlyx2JEG8zhR6cPKyBUu0CxxsWmEC2rhyIFk5ruO
r5qdgt/NJpq02ec5v+V7t1GD61kzGf3FkcnE74o1WeSQ3qOo388w0Z4lvpLZUZ1e
gCvwOoLhVYcOoMtO5UCnK/cxc0pQyQ==
=tKSS
-----END PGP SIGNATURE-----

--KmRz5TkdMlywIsKu--
