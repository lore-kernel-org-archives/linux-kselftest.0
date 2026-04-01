Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473E9175A9B;
	Wed,  1 Apr 2026 11:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042256; cv=none; b=l1asvozS/IFJFPZHftDiGladznsf82jkS9X1tVM5dxK0KOqZ+WHSKEv0d0so8bBJaZJ551nKlF4nHyKyzyrTBrPJ2vHl2NMRu8/X19bRN/xgCDfMRhG90RdZIuMVvF1tQP7vNddydiVuOTElG+c90fiOWjQ5aM1jfALoD5IAD/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042256; c=relaxed/simple;
	bh=N1Lg/uuMEG2XclojkpbMXk7nlKJI478QJMLpw9zok0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIrxS7nbIzXeKRG5sfo8TyMOARxVEHvWBAkM/iCYcD2eO5GtOOo+uCzshNcWFN/GfFARrTdLv62EALEta4OhUOnuUTDvyNURNIvicUbTW5joHxiEp2qrnVlDlQYIkwYB+rrHKjmX2PbjjhXgmfhBV4D7ec/OsuwYH1S4u9yu7LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtkyqXx0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtkyqXx0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0268DC4CEF7;
	Wed,  1 Apr 2026 11:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775042256;
	bh=N1Lg/uuMEG2XclojkpbMXk7nlKJI478QJMLpw9zok0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TtkyqXx0O7OeO7sZ0xDozi/d6eOhTtvwWBptDQHmVQaL4CKzCN9kCUoZBOpvrZKeE
	 Pp5UnmUUAFa95UoVI2lwUNtcTYvqACblxFId+EBTFK3q6sJSDeutW3aSA+s7ONlSv3
	 rG3M+xaK8nhjtsuL7b7mTVMFc7kEU1xGfJ53dsGjtPpveDkSpfUsf5rO+n1uu8CBLh
	 8bbc5nXSPsSWYr/a1/eBBQBVUNL5H2f+tFemz2mxJuovPcTcCbEGiXiDOmWtp0JyXI
	 QG6BpI3HY34L0gIlPJ4oem2aNcFY1S0Qyi1hOXmwYKyC9FmjGsMFcNibqcG3gqaL9H
	 LfmfYU4KvL2/g==
Date: Wed, 1 Apr 2026 12:17:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Anthony Yznaga <anthony.yznaga@oracle.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
	Jason@zx2c4.com, shuah@kernel.org
Subject: Re: [PATCH v2 2/2] selftests/mm: verify droppable mappings cannot be
 locked
Message-ID: <d20a7a98-2bc7-48fc-b467-21eba8df89a4@sirena.org.uk>
References: <20260310155821.17869-1-anthony.yznaga@oracle.com>
 <20260310155821.17869-2-anthony.yznaga@oracle.com>
 <52bec9ea-5627-4ea2-8f27-f1729957fa47@sirena.org.uk>
 <20260331141714.b2f4e41b494060e55610a5f3@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JxsWWm5ZucbJodln"
Content-Disposition: inline
In-Reply-To: <20260331141714.b2f4e41b494060e55610a5f3@linux-foundation.org>
X-Cookie: "Yo baby yo baby yo."


--JxsWWm5ZucbJodln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2026 at 02:17:14PM -0700, Andrew Morton wrote:
> On Tue, 31 Mar 2026 14:17:50 +0100 Mark Brown <broonie@kernel.org> wrote:

> > All these failures which cause the entire test program to immediately
> > die seem exceessively strong...

> Well, is the test code incorrect, or is the patch which it's testing
> incorrect?  That's 5435ba164b0d ("mm: prevent droppable mappings from
> being locked")?

I've done no investigation on the actual failure, sorry - the comment
above is a stylistic/usability one about the test program.

--JxsWWm5ZucbJodln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnM/skACgkQJNaLcl1U
h9CnEAf8D+qC45AiMzqQRSdGPBaX2a40RNgSp2rCACIzsmXr1xk7NNZ1k+XlQc2I
BMlDKY7emJ7ZDKoEdOFE4ghdlkNyLSpx3fY/p9Iu+tiN7cE4G14FJzmuqg9QY0DR
vNPFvJGsKVeCIAz5Rf4DsB2NwFCR3iD1iJNXe2LpjqNb9xDxL2823/F5jLXGeR9e
K0PN6ABceEV2fFUeXLg9O3iNp/0A7tbSfGirAlu0pebo+8Po+wISeXk5G/qNRn1w
IxqJ+HGTGiwAPcCmDs8LeOf816+NMN1XQ8vU3XkVXanViBgfjfYPcF0HRTey7M6j
w2yh4lWvUy1Gsn/uAr9LbLdR6jNhdg==
=T9t+
-----END PGP SIGNATURE-----

--JxsWWm5ZucbJodln--
