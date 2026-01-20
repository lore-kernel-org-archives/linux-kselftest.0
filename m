Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF5043DA20;
	Tue, 20 Jan 2026 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931267; cv=none; b=YHZO74pTCzZKIHxD9FDDPrauvwL7bZND5AQF8nlXLs0luTng3tlrG3pBPpYtSNolkJfr7mZD+PceAxAybd4BblACSI1HbiZBt25s+niQ/mOBTqx4+4fRYqhTqMcgmf2svOCW4VtGlVva1QRQcr84yzsRIDkds3zX0KXUsdr3k7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931267; c=relaxed/simple;
	bh=kTyxrUC6CLXmKB4WiPhS98nLWRKe80cbQkubQV09cw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpSEqoCluyrqqxk5yiDUBN2FjLb3L8H9BraenzTtTRRbyIkBcV/S99qwTzR20mpVaXMeUxXxaaTox/6g6uBrMOSjAKw25V+DZbOSrJA78kPN3E6FTX94eL8LMYUj6seKdpNwLaxA62rESrY/8SSDAB0me1LtikdDJiNRAPOiok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjfohsLY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjfohsLY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB3BC16AAE;
	Tue, 20 Jan 2026 17:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768931267;
	bh=kTyxrUC6CLXmKB4WiPhS98nLWRKe80cbQkubQV09cw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjfohsLY2n3lhzlLuIaem06nUrkrYK25Vsr8jtE1qJtX1GFAV1ahjAEdbWd4kV6pQ
	 IF1iIU9wRnJoD6xq4YBNabtMvcGIWI8oaps0JECB6JdQ2JalO0BfrnxJTAzt1O6ftU
	 5yinsTx7AGDH5VCtkADKuBuBkQYlyCvZBQe8egdKsBvUznDBTiWs14r/ysOETfQAKG
	 4glBF1fE23o83O9JW2VRy/mI8fL/8DkWMZoZUbizml8OvJv6FP6PMgE/lLAEOXSFxa
	 S9FEeTEMvOHgtci1B/GHxiYzxIVfGNR1yk5YttjkuKi3lMwirEfn/UmS9zxRxrLDut
	 6ivA7ZI8oihdw==
Date: Tue, 20 Jan 2026 17:47:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Have the harness run each test category
 separately
Message-ID: <aaa9cdf2-8fd9-4073-8c5e-f4ae3762a1bb@sirena.org.uk>
References: <20260120-selftests-mm-run-suites-separately-v1-1-a4334f0cbb3a@kernel.org>
 <20260120092252.8597a496ed1cdebe5e120fb6@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QDSOccJa/e7tiZgO"
Content-Disposition: inline
In-Reply-To: <20260120092252.8597a496ed1cdebe5e120fb6@linux-foundation.org>
X-Cookie: Slippery when wet.


--QDSOccJa/e7tiZgO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 20, 2026 at 09:22:52AM -0800, Andrew Morton wrote:
> On Tue, 20 Jan 2026 13:25:32 +0000 Mark Brown <broonie@kernel.org> wrote:

> > has separately.  Since kselftest really wants to run test programs this
> > is done by providing a trivial wrapper script for each categorty that
> > invokes run_vmtest.sh, this is not a thing of great elegence but it is
> > clear and simple.  Since run_vmtests.sh is doing runtime support
> > detection, scenario enumeration and setup for many of the tests we can't
> > consistently tell the framework about the individual test programs.

> Thanks, let's see what people think.

> What happens with tests which are newly added but which don't integrate
> into this new framework?  eg,
> https://lkml.kernel.org/r/20260120123239.909882-2-linmiaohe@huawei.com

Anything adding a new category will just not get run by the kselftest
harness until someone adds a wrapper script for them, they'll still get
run if someone invokes run_vmtest.sh with no arguments directly.  As the
changelog says it's not particularly nice, but hopefully people don't
add new categories all that often.

--QDSOccJa/e7tiZgO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvv70ACgkQJNaLcl1U
h9AngQf9G3Ze83SF/F3V1fpJUOzG1cp7X3rxRdHXAD3jPIkkxrcJBCsPUCQ6ezUM
5ZpepjtIZTHUbOT+PP6W+2TDPgctkyjvPjhsHpzP2Sp6zX6jQsL8xK6oHf8uFyDu
mQldN1NgIN1UyG51gK9fuIK33+6U9s4q5f2ZW8cHaK9G4waMJ8syYWzaX1lUL694
8aUZUaKUyadQHoOfII3lpsTgSqQa21DhoAvOhm9oPuQ2aw0oCFlaH0wi216JJuhg
oM8qQ0sWPHjfV2focUPtnCa2sBjv9ZExJZUgvXYdfi9HKHVyYRcENjE9UCDJVa6p
9T6VXv0OEPvmur6nlJC1UbW5ak0BeQ==
=ABcn
-----END PGP SIGNATURE-----

--QDSOccJa/e7tiZgO--
