Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3C426B741;
	Fri, 23 Jan 2026 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171712; cv=none; b=DDQLGv5C93k0IsEGfwdNjIhsGRACFbFNCDe4C58EqlpjzLKlfQ2Yyiu9fRkPklGrC2NPziAHA1/euJ2YwwhNvJlIxDDxyXv/8hNf9Imh7Zy6WPASrvZVuKcFpbU4sCWQVbPA/OPAPXJ24Rdk2xXnqQ29iBEGwWaLC6jF6RdBU+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171712; c=relaxed/simple;
	bh=Y0RUWLkH/P5b3HJWSokvO8jdgqHAxHs/mzXdH8gbm2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8mA5VC3hK+fRg3mo654y6BPj5WxJw6Vly9eQ0dp11VBVHkUuWPGEDRvrxggaNW5D+QDfurgjOQX1j3G9ls7tJwcYW3fiYNh01FZSBRzqgFTy6yqCfI8EqaNLgnuXENoJdnTcMvvfXAnbrp7yw4eaQlEDz1cmLFJ0HWw62rNQmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjkcs5dm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjkcs5dm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F10C19423;
	Fri, 23 Jan 2026 12:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769171711;
	bh=Y0RUWLkH/P5b3HJWSokvO8jdgqHAxHs/mzXdH8gbm2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fjkcs5dmq7GFL5PDSx0R7qRgmXWUsqdKC34r+wLQLZaDjzsZJIRuwTeKmkeGzD6bV
	 llBbuEB/LKA8HIRCxb7QzD+LwUmWuP2LVag2WIcTpBBWkURJIIQ1pqXkHMvCrkbWfy
	 u30Xy92fCCq97PV1ElaWQFKoZwWXsROHHbLBp2NBHBU+df/XRT/9vEMcnJAPaant9Z
	 pahAYDZqYOPCTK1AnQijJVQcVEvLHRizwXAK2FkmOZYWbaZtfWUpO8CsWdaTdxmO7m
	 7UOe9uLUCf+QFm7DT2uBN2B+gLWRWoEo7g+eX1Hs/HK8eRgYWRafbDwV1vjMXg/dbk
	 fogiSRZ91D8Mw==
Date: Fri, 23 Jan 2026 12:35:06 +0000
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
Message-ID: <56e2d214-fe48-48b0-88a2-287294520cb4@sirena.org.uk>
References: <20260120-selftests-mm-run-suites-separately-v1-1-a4334f0cbb3a@kernel.org>
 <897e1bf9-d29d-45da-926f-0c28558f8990@lucifer.local>
 <99b95c45-7bd5-4fc8-892a-cf9c69335706@sirena.org.uk>
 <04fc8a05-245a-4422-9e27-704ae2d2894a@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y3LPgYbgI7DEAkHz"
Content-Disposition: inline
In-Reply-To: <04fc8a05-245a-4422-9e27-704ae2d2894a@lucifer.local>
X-Cookie: HAIR TONICS, please!!


--Y3LPgYbgI7DEAkHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 12:09:52PM +0000, Lorenzo Stoakes wrote:
> On Fri, Jan 23, 2026 at 11:21:39AM +0000, Mark Brown wrote:
> > On Thu, Jan 22, 2026 at 07:13:06PM +0000, Lorenzo Stoakes wrote:

> > > # IMPORTANT: If you add a new test CATEGORY please add a simple wrapp=
er
> > > # script so kunit knows to run it, and add it to the list below.
> > > # If you do not YOUR TESTS WILL NOT RUN IN THE CI.

> > Is the Makefile the place for that or run_vmtests.sh?  You don't need to
> > edit the Makefile to add a category.

> As I said, you have to edit the Make file to _add a new test_.

> The point being you will necessarily see this. It'd be fairly odd to add =
a new
> category without adding a new test.

You do, but adding the category is actually done in run_vmtests.sh and I
can see someone doing something like adding the test to the Makefile to
build the test while still developing it, then going back and hooking it=20
up to run_vmtests.sh when they're satisfied that things work and
deciding at that point that it doesn't fit with any of the existing
categories.

> And since you'd need to update the Makefile, putting this comment at the =
top of
> the file immediately next to where you have to put it makes sense.

I guess.  At the top of the Makefile or right next to where you have to
add the tests?  There's about 50 lines of setup at the top of the
Makefile before you get to all the TEST_GEN_FILES.

> > > > +TEST_PROGS +=3D ksft_vmalloc.sh

> > > Is this something that only kunit will interpret, or will it impact t=
he
> > > build in any other way?

> > KUnit isn't involved here?  This is just how you specify which programs
> > are run by kselftest, this is a Makefile in the kselftest framework.

> s/kunit/kselftest/.

> I use the mm selftests locally by running sudo ./run_vmtests.sh directly.=
 So I
> don't know how TEST_GEN_PROGS interacts with anything else.

If you're not invoking any of the kselftest infrastructure it's not
going to do anything, nothing execept make looks at the Makefile.  When
you do a build it'll result in the specified binary being built (and
installed if you ask for that) but not otherwise interacted with by the
generic framework.  See:

   https://docs.kernel.org/dev-tools/kselftest.html

for the various variables that the build system has for suite Makefiles.

--Y3LPgYbgI7DEAkHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlzavkACgkQJNaLcl1U
h9AJqwf/XS13Yx64IWDW4Hcgo/ro9qk0S/cUYSWCjBV39IKoIWwZUTMGgW7RTyhO
GIoeTrdDasHzOUsbQlHXEn3ChdwjVIgVoHxYFj5iDajZNZMmFiCJK6p1CP/y5coQ
mIyyr35LszVL6VsV0uFeL5byyzo/jTP3zi9KyarxdFi8zqQus5x9TqMOposdQzhC
vFKCcZ2Fzg3DG/REUPfLhkw61fcdCbjIkGTsBElznV4NDauyfzfXy8jfUIL6tNva
I2RZ6ghueb5AA4JcFQFzI4q6TvM9MIxG3YxLUQBc8vt+m1PLq53aSfokuKFARcw2
LAWQs9o+tqrI82RsjS0A1Dbzs3vdSA==
=3TvK
-----END PGP SIGNATURE-----

--Y3LPgYbgI7DEAkHz--
