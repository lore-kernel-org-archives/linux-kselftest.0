Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D973DA5BA;
	Wed, 20 May 2026 11:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278319; cv=none; b=YweGnYc7JmgihHqXG8ERCiDgdaAzPw7ox14f6+AEFjKKtnc+1Is38UvmxknQ4iXBAxWQQX/1ysg7JuxdC2cC+Bgv2MUH2nZNPmkHn3iC9onTiIl2rH0OjZkH033ygPTsnIiKfKWHXbvOtLYEYXEszijoGB203HZIESRv3F1gR/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278319; c=relaxed/simple;
	bh=Nvdt2XBzMkZ+30asNAQ3e3GOOKzUVXPt5E+OSJEk6nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQNl2eaVIMnaBiA3WjzSghN9TS5e9SX3t1qRPEfBkKrWDOjqN/Tj5NDFfulfnG8V17eZFyfJURqoHjOiNziMmbk6Jdc9wf5bx2W6hWrIYNP8y+vqbycwAO14PTuItQohC09dtkEYvNgC8XjuO9Mf8plZcw5uASjVDg/YhSf/FYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdhFk2F5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdhFk2F5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C6D1F000E9;
	Wed, 20 May 2026 11:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779278317;
	bh=Nvdt2XBzMkZ+30asNAQ3e3GOOKzUVXPt5E+OSJEk6nU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZdhFk2F5966kLepjIdaky6WJcw6IIG6qenuVxN3ZBN7E4N/ulH63cJrkdUGr1pTCm
	 SYU4odwJZ/aYtrOoa4k8BZJ+v5/H4GTNUhKl5SqIvH3MAFS34X9aur3RYvklwDYGwk
	 K7Pw4bsh3RG+VLOPM4jycGPRBsHmly1frrtwa+3GVw437KzFlPcAwyFYxo4EuWBThv
	 kWDAV78wXt2X2SptbtLwOxedKOhBb0Jth2eOsGHvIJByUMCb6PdepA4ntPc8FKvY80
	 LzjXt/L3HmqTmp2lhOSEA5rtlGCaRKJms1pdI0IteSlCLMZ5oQ3fiX00pNcwlQUMOu
	 O195huIjS/mdQ==
Date: Wed, 20 May 2026 12:58:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] tools/mm: add a standalone GUP microbenchmark
Message-ID: <67e9ecff-e532-4659-b4de-7019474af608@sirena.org.uk>
References: <20260519120506.184512-1-sarthak.sharma@arm.com>
 <20260519120506.184512-2-sarthak.sharma@arm.com>
 <ag13GbKcLMIoHOHj@kernel.org>
 <9382431f-3746-4477-bbef-87abb58bf180@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y95J1WJC+suJuyFP"
Content-Disposition: inline
In-Reply-To: <9382431f-3746-4477-bbef-87abb58bf180@arm.com>
X-Cookie: Natural laws have no pity.


--Y95J1WJC+suJuyFP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2026 at 03:45:53PM +0530, Sarthak Sharma wrote:
> On 5/20/26 2:25 PM, Mike Rapoport wrote:

> > It seems that we need to better share the common code in
> > tools/testing/selftest.

> > And adding another copy of the hugetlb detection and setup code does not
> > seem like a great idea.

> Agreed, but that was the least disruptive approach I could think of.

> I am thinking of doing this now: should I move the
> hugepage_settings.[ch] to tools/lib/ and move the read_num(),
> write_num(), read_file() and write_file() helpers to a separate file in
> tools/lib/ itself without any ksft dependency? Then both
> tools/testing/selftests/* and tools/mm/ could share the same code.

Using tools/lib sounds sensible to me - as well as the sharing it makes
it clear that it's a library used by multiple things so avoids the
issues we sometimes have with selftest directories referencing each
other.

--Y95J1WJC+suJuyFP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoNoecACgkQJNaLcl1U
h9Bl5AgAgt7Ok9vKRoNdgZt9TjhnvZ1xKFdzccZFLZzdrU0guIFV4m32I5KLw9PB
6+fSYh9BahFlRTraKPMKUVmk++cX8pLP5U/OQ+5/F7uYzDwXhALqzH8uWsuV9cBL
zQH1yPDS/Svb1BNviCRN4RJkBgIARQslzPOnapN1aBFTBhAZiNrRrCEoZV8aZeNI
xi3oIEyRbHrb+/hVVc1R6JWiVjtHS6dWmguqFT3uSNpu/4uNO4k+8kIHWkCztKJM
IvL2UUhIJsDaS4ictHYzDFcSfyS0B2aknQk29HPkxxtgWRLHTCmYktWr8ExgQMw9
ABGVA0g/7QpFx9SPMdYJUCpfB8/YaA==
=JG5s
-----END PGP SIGNATURE-----

--Y95J1WJC+suJuyFP--
