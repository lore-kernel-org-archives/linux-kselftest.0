Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170F6175A85;
	Mon, 12 Oct 2026 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800010; cv=none; b=Q0Z/7zEQEnd0lcCXtTKujMxVJw1KnyuXKVWqcSBC+ACBYP1F7RZlYoqclBPOOvTkU+ZOdg5LD95+LExx+eUb4GBiqBgWAs8KiC/a88CLI3Q5HBV6qFpSmGq/HnRmVB2iQxWmuUAIkEXo4eIRVAPirj0cvsn2/XQceVP5qCjWqyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800010; c=relaxed/simple;
	bh=WbsJ+VVJv8PRArnVKz6VpTkUlNDlxU6p0nj4wdwxnbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYL8kPT6J48yKrkzmeKX1VXi2icufVIbhYTTpqPDBRyiPsKc7sEmrCzh5pGdRjS/Z3CS0aj+qaXIDbtKYyUbsL8cdYdArgV6MRKxyTtAyfhOJu95GG+2yTy8gaQP6JX7D3K6PnfXLxF9eH082u/1wVemypKhzigu5c0e1f01FDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cn9Ff8MY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cn9Ff8MY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D081F0089B;
	Mon, 12 Oct 2026 10:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791800000;
	bh=D/l6twGSi8Tv/lid+YWGIvfrNTjgFzfBWWIeKTSOErY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cn9Ff8MYQe3UISF+r6gBfLnNaTTS3i4pISLKlqevgMMMdI/reW+MnkisEzP0Z+uKr
	 9GzUCM3j3Qlz7LXc8jVMVKjqitJ4dff3tMidZR92hhpCB4/JY+iBDFCRVwb5NFjqd0
	 KIPN4n1CzvRQ3hjufLnbYuVsHOyM9Vujen3zS+pLqTKuCpNw8WxFFvqBr3Lnb7gdFO
	 V/5VppGwhqd895q06Ud4OYjLVamaDNFCMLT3y9mGimR3Kb2op5iW2Q7QAr51lQR45J
	 X5TfRRPPYTkmA81t92iZjPnpC0WNZvy5mJZfaDfiVAQyhH7D1k27EQYGtjp2MKzgWe
	 pGJV9/deaxAmg==
Date: Mon, 12 Oct 2026 11:13:13 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@suse.com, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org, jhubbard@nvidia.com, kaleshsingh@google.com, 
	anshuman.khandual@arm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/12] selftests/mm: improve mremap_test
Message-ID: <asyxQbp8EfVE9yQs@gremlin>
References: <20261006092511.145776-1-sarthak.sharma@arm.com>
 <3a0673a6-744b-45a1-80fd-737a366fafc4@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a0673a6-744b-45a1-80fd-737a366fafc4@arm.com>

On Mon, Oct 12, 2026 at 10:20:45AM +0530, Sarthak Sharma wrote:
> On 10/6/26 2:54 PM, Sarthak Sharma wrote:
> > This series fixes correctness issues in mremap_test, simplifies its
> > test infrastructure and strengthens validation of remapped mappings.
> >
> > Patches 1-3 remove unused command line handling, unnecessary cleanup
> > checks and redundant errno handling. Patch 4 converts the test to use
> > kselftest helpers and removes manual failure tracking.
> >
> > Patches 5-8 fix handling of unavailable userfaultfd support, unexpected
> > mremap() successes, data-corruption failures and cleanup after mmap()
> > failures. Patch 9 removes perf tests and timing infrastructure.
> >
> > Patches 10 and 11 replace threshold-based random-data validation with
> > sampled validation and a deterministic data pattern. Patch 12
> > strengthens multi VMA validation by also checking the mapping state
> > of holes after remapping.
>
> [...]
>
> > ---
> > Sarthak Sharma (12):
> >   selftests/mm: mremap_test: remove command line options
> >   selftests/mm: mremap_test: drop munmap() checks from cleanup paths
> >   selftests/mm: mremap_test: simplify errno handling
> >   selftests/mm: mremap_test: use kselftest helpers
> >   selftests/mm: mremap_test: skip test when userfaultfd is unavailable
> >   selftests/mm: mremap_test: fail unexpected mremap successes
> >   selftests/mm: mremap_test: fail on data corruption
> >   selftests/mm: mremap_test: handle cleanup after mmap failures
> >   selftests/mm: mremap_test: remove perf tests and timing
> >   selftests/mm: mremap_test: replace validation threshold with sampled
> >     checks
> >   selftests/mm: mremap_test: replace random data with deterministic
> >     pattern
> >   selftests/mm: mremap_test: strengthen multi VMA validation
> >
> >  tools/testing/selftests/mm/mremap_test.c | 701 ++++++++++-------------
> >  1 file changed, 291 insertions(+), 410 deletions(-)
> >
>
> I wanted to address the concern Sashiko has over this patch series [1].
> It says that mremap(..., MAP_FIXED) over a range containing multiple
> VMAs should unmap the whole range first and then map the VMAs.

I don't think you need to spend time worrying about sashiko stuff about
mremap() behaviour in a test series :)

>
> But this is not the case, as was discussed on the list earlier as well.
> We iterate over the VMAs in the range and only unmap and then map the
> region that the VMAs occupy. IOW, as quoted by Lorenzo [2], "the
> sematics are such that gaps are not propagated (i.e. it is as if you
> mremap()'d each individually)". So if we remap over an existing mapping,
> the mapping region on which a hole is remapped should not be affected at
> all. So this is a false positive.

I will be removing the gaps stuff in any case (as discussed elsewhere
too).

It's problematic, more so for the fact stuff can get mapped in gaps before
the mremap() operation.

>
> While here, requesting for some feedback on this series, if anyone has
> had a chance to look at it :).

Thanks for the series, this cycle has been very busy so I think this is one
for the next cycle (i.e. targeting 7.5).

So I'd recommend resending at 7.4-rc1?

>
> [1]
> https://sashiko.dev/#/patchset/20261006092511.145776-1-sarthak.sharma%40arm.com
>
> [2] https://lore.kernel.org/linux-mm/agH1ZSdX_7QF8P_I@lucifer/
>

--
Cheers, Lorenzo
