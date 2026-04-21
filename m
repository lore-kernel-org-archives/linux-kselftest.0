Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757A33D330C;
	Tue, 21 Apr 2026 12:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776369; cv=none; b=GucQ9qiBYn4czyUIptDmCiPmINXXCUTUsVGkbQig8yU8AHsU/94QSqUIQ/8ArgDu5Kva3oGMUW8vhbRmI+Nmmn8IMIEr9ZyVbCDolvKPXRizCctqynqZHMmIGlTIYVoX4RryYdKmCnxpXUIwwHCKfRGsSwoguZ6OtJcBnUgAMKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776369; c=relaxed/simple;
	bh=7BJvWRZ1a6ku7d9qmmaiiEL9TjM2jB3XUn/ujPzf5jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQAn7Q1snUMth4GvQpNd/WXywCwKJlFn7hojM1z0TEzFGUk3BsAA4aq+0JJoZqSkaJIhHcHQPGw6+1mdgGn2GliABoDLPL4scfUdaSSKfBdDsjindWsvkXiAXjSWtSCJdqO2IYRaFtSJm3JTJkgzPmIdCC4dXlzRJintmOzowOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0SW469D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0SW469D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5E3C2BCB0;
	Tue, 21 Apr 2026 12:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776776369;
	bh=7BJvWRZ1a6ku7d9qmmaiiEL9TjM2jB3XUn/ujPzf5jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f0SW469DCDLkyphmfplgZwLygarAdDL70IMLy/iHzp+Ucm5InCXYnYWSISkfC08mX
	 eoChHoUD21umvMkaem4XTnWXTcyO91YzjE4hLs04aZbdG8hOKnfvmPHKA2TUqOjm+c
	 5ovC8qJHgbL0miLTKT35kGEcdSO9OJowwaaZiWBXGSz6Eta956Il92a+y019HcRg+v
	 SHSIuM5QVAFCc07D6+xVUJLZcJUGvzmUNCe4EI7vyju2cDRxshrMyQ18aul3giEgvJ
	 I8vRKh0YE52tUBjwtZ75T+lYaxSE2N+7ZzUe3rypZcnR4s4x8ntAC+WNS1PMi9p4uf
	 k75/l5PD0EUTQ==
Date: Tue, 21 Apr 2026 13:59:21 +0100
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
Subject: Re: [PATCH v2 16/53] selftests/mm: protection_keys: use kselftest
 framework
Message-ID: <bf3133c3-ae12-45ac-a3d1-5e58b849f817@sirena.org.uk>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-17-rppt@kernel.org>
 <f8495e44-a34a-4289-90f8-0faa71bf1a71@sirena.org.uk>
 <aeczFjEs6sqRPy0w@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cpR1GJECWcVTjcOC"
Content-Disposition: inline
In-Reply-To: <aeczFjEs6sqRPy0w@kernel.org>
X-Cookie: Jenkinson's Law:


--cpR1GJECWcVTjcOC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2026 at 11:19:34AM +0300, Mike Rapoport wrote:
> On Mon, Apr 20, 2026 at 06:54:31PM +0100, Mark Brown wrote:

> > If that fflush() is needed it should go into the helper, particularly
> > since ksft_finshed() calls exit() so the fflush() will never be reachd.

> Looks like I'm missing prints because of something in my environment, I'll
> just drop the fflush().

Interesting.  Usually the culprit would be calls to _exit() that bypass
the libc cleanup but I'm not seeing any right now...

--cpR1GJECWcVTjcOC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnndKkACgkQJNaLcl1U
h9BbfQf/QK2ulYd+OvM6NWN36YQJmk1WXro4Gz6hEP9gvf5xt6mL0NdbQbBqOZEg
oq3OyXoq/n0k8B62IJqY0tkwuePlB/aDO6JrFB/QghSSZGffzDBcNv9PvMAWkyNl
CrDyRF/fWX/NDTWK1gPpdatn0Fs9A0rQdgsccm+7TskXbecDtsqTlhvEKJSrqC5p
IdvfMi2Ju33HFrP4t0crED2TZEyU2UTgSc7VZPXUhnXxWZiQTIZ+pBaQ3yqMgI6Y
8hQSS4I5ZjOdnAcPsoBK4PU+TzrXaxg/L3XUOcfVy+5tGBK64+8ZU76P9TO9gYVK
hgSe9jFdX+jwfS2eo0wmKPgDve4xWw==
=Wid2
-----END PGP SIGNATURE-----

--cpR1GJECWcVTjcOC--
