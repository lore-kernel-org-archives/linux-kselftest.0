Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEA72367DC;
	Fri, 23 Jan 2026 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769167305; cv=none; b=ju6/MgcUlUsGobbPSYcpJzQjWc1on8Xv6nhPjldHPUJmyDZ+9Jv0iZ4uW/R2wop9zfeOTuEA/Aa2RgBCeAElW3dmh2u9hFUygz8UTjtUi7ESYNcA2/7GPUbpmfIGxRdnx7dmueihfKNULguWoOc/MFZVJ+GkW55B+wu+BAbOmN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769167305; c=relaxed/simple;
	bh=MolMDS3zogBJvk53nL2gW86E9ZEJYFZYnB8cGLMNcxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7N3evdhLE+R/5laFoVlcU1Km2lZ+fzuwG3Im+yWiqZgSytlZwPC7OTGgov2SUT04e80jYcXJIQZh2aGDeZgQ9OwNSzDFSJcfg3qjvSewI8KB2WsaWPvZWkFWMozik3iItJ6WfAFPfkWlnLL3CB5qHt2AmlnJm6iXuNciFLsjNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/NH2iN5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/NH2iN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43F8C4CEF1;
	Fri, 23 Jan 2026 11:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769167305;
	bh=MolMDS3zogBJvk53nL2gW86E9ZEJYFZYnB8cGLMNcxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/NH2iN5Lsx9y851wRiX7HOCBrZi6o2gu2QUS+grGKNWcZmdj0GR9XlUDzR5n1/om
	 eVXKTlT59WHm8pSfm1ScfEzezoyQRN5S5+X1lS/oISu8bVj8M1VQwUfDOdxcWSVWfQ
	 HTqhzifMPI2h9kFJco5OhtIc+E/RkT9WKmROf9TniXWCmsGTjru0U58126ZnVdyxvB
	 qUALaIW+3sHtjv83HoTg9DF/llMmjxas4ALmLWIKPOIB3IsnDGBWaGAZ++xgtYWtBo
	 auUCnTo/yQjwOaDc1KbYERTGo9B0WmXMUb7DyxCWklCGycpPRfiZPI1ik2MQryR0lK
	 rdvj9xtc5Dxeg==
Date: Fri, 23 Jan 2026 11:21:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Have the harness run each test category
 separately
Message-ID: <99b95c45-7bd5-4fc8-892a-cf9c69335706@sirena.org.uk>
References: <20260120-selftests-mm-run-suites-separately-v1-1-a4334f0cbb3a@kernel.org>
 <897e1bf9-d29d-45da-926f-0c28558f8990@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FMMmPfkX7SbHC6IX"
Content-Disposition: inline
In-Reply-To: <897e1bf9-d29d-45da-926f-0c28558f8990@lucifer.local>
X-Cookie: HAIR TONICS, please!!


--FMMmPfkX7SbHC6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 22, 2026 at 07:13:06PM +0000, Lorenzo Stoakes wrote:

> People have to edit this file to add a new test anyway so should see
> it. Something like:

> # IMPORTANT: If you add a new test CATEGORY please add a simple wrapper
> # script so kunit knows to run it, and add it to the list below.
> # If you do not YOUR TESTS WILL NOT RUN IN THE CI.

Is the Makefile the place for that or run_vmtests.sh?  You don't need to
edit the Makefile to add a category.

> > +TEST_PROGS += ksft_vmalloc.sh

> Is this something that only kunit will interpret, or will it impact the
> build in any other way?

KUnit isn't involved here?  This is just how you specify which programs
are run by kselftest, this is a Makefile in the kselftest framework.

--FMMmPfkX7SbHC6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlzWcMACgkQJNaLcl1U
h9BQLQf/UnpU2CHz/WPyt0EJuVIOeS4gb0aK+zd0zg2lyECwEDrVeeqF2sz1Zhtl
6/o4k0nubqIj/CovsRmmFWR/vcXItDO4aSVo1znB92s4yI+xSl/u75deJ2tIqldn
iRhAOyRnCV8ZtyXp/Zj3+vSB8DCq6gogxo6uGCmcj4L3ly41vcZOTwJCyYQQ7JF6
CtDdc4zMV4Zek3lEBWfWYnL9SZ4ec2sbsM3PzpR6M28Z5QS/dLh++5wfdbZlhWfB
JlyTaTDcF6m/s7DW1gtrgW30vb4BZnJ8AB/2wffALuSpm8NSlMqsO6xG0ZKjiaj9
6n1zNLNx9q4f/ieDvW9BN7ZPIw/YUw==
=qKKG
-----END PGP SIGNATURE-----

--FMMmPfkX7SbHC6IX--
