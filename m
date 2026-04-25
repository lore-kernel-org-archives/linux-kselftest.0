Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86540DFA9;
	Sat, 25 Apr 2026 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777108807; cv=none; b=HGbaL2oq+NmnIzAcv6CxSEZAwwSDi4aM+WoMVJ1pvH4ac/UDpj46ioRRUY0i8z43zlSWWZssqAermOYrdpk1z8/ZZisTktz1XM2D/TYhBYDc4kvHjIXz4osFTBivS2k5G99eKB/+WvjTqGrZzfzKx8o9Nm/Tvg9tm0pXpAd7yq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777108807; c=relaxed/simple;
	bh=UpHIvSShmli0yvarMS8zFU7rWyK9POcDK0gwCighl1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gggBpjK87WV86sjUck9jw983SNyndO+EZFJLSME6pEb9GBNwmQuoUvgXZvRim/f5XjVt6ja4d28lnmO+W90YqdUvRts9n7QllNXhHd6bid3Q6S95lRXHwI9nQ0vMZn70PzFtd3uOu0Ct77M3MEBxGbmn7krlyaY39LgpaOEUaIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppJESJUT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppJESJUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06160C2BCB0;
	Sat, 25 Apr 2026 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777108807;
	bh=UpHIvSShmli0yvarMS8zFU7rWyK9POcDK0gwCighl1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ppJESJUTnMlIchUddBtrKRhcr7r+Qgy6mLfBp5t3RFZe4nWSyeowsFGg62sSKPTD8
	 IA3aIzpjB/q6yglJ8grs+J3qIhOSRpOGXK/PNwup7Cwr5dPirwVyKMn7rNbtyyybVf
	 POkt1sD4/mtUOgWLhYI1MgptaUIsSxhqR4pByNgXmglzMIsttGt1eIuabZJHOf/nM6
	 +nuPUSO/myAaAIbkJy1alH0o+NExCuD150U2Jq4Qiej/IVM6BiBLXSR54W0mwjwZ1k
	 SSB8GfbYATdr72GJhcqxGH++88tYSE/pgGKov5x0axX30S8G3PsLCtjQTcXxw7rvDB
	 XtYJWbjZYl7Fw==
Date: Sat, 25 Apr 2026 11:19:55 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 03/53] selftests/mm: migration: don't assume hupe page
 is TWOMEG
Message-ID: <aeyHO4PJoWk9siqB@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-4-rppt@kernel.org>
 <c1e9cc74-e831-4068-9d34-1f3a665b3fd6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1e9cc74-e831-4068-9d34-1f3a665b3fd6@redhat.com>

On Fri, Apr 24, 2026 at 01:14:44PM -0400, Luiz Capitulino wrote:
> On 2026-04-18 06:54, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > migration tests presume that both THP and HugeTLB huge pages are 2MB.
> > 
> > Add dynamic detection of huge page size with read_pmd_pagesize() for THP
> > and with default_huge_page_size() for HugeTLB.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Reviewed by: Donet Tom <donettom@linux.ibm.com>
> > ---
> >   tools/testing/selftests/mm/migration.c | 44 +++++++++++++++++++-------
> >   1 file changed, 32 insertions(+), 12 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> > index 60e78bbfc0e3..e3c2f831e15a 100644
> > --- a/tools/testing/selftests/mm/migration.c
> > +++ b/tools/testing/selftests/mm/migration.c
> > @@ -184,22 +184,27 @@ TEST_F_TIMEOUT(migration, shared_anon, 2*RUNTIME)
> >    */
> >   TEST_F_TIMEOUT(migration, private_anon_thp, 2*RUNTIME)
> >   {
> > +	unsigned long pmdsize;
> >   	uint64_t *ptr;
> >   	int i;
> >   	if (!thp_is_enabled())
> >   		SKIP(return, "Transparent Hugepages not available");
> > +	pmdsize = read_pmd_pagesize();
> 
> This is really minor, but I'd match read_pmd_pagesize()'s uint64_t
> return type.

Ack.

-- 
Sincerely yours,
Mike.
