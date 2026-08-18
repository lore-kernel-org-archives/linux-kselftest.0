Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F033B38A4;
	Tue, 18 Aug 2026 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050095; cv=none; b=BJ3visVI+vQzo17mnA+aG7ac17afNareJUFVyip1tzQx1OZoSbqfGYy2VaYkQcVNBW3thG94Z9rOmSPWh79hNZgiImmlF8E2OWs5zEMlm9/GJ9FX45iAVS8VV/i1Vv925+P6/7XdY1b3VvR04MgnywOHFi7NKcVBU+s203N3Y+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050095; c=relaxed/simple;
	bh=fG8p40L0B0d7N+yEWqSB43BWGFnYXahhNWHEFkSahN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vdwn1xFOrOC6p+9kspxdtuda9vQEcgkojqkj9GZoh+kNUyWeSsaAfy2jo2vYTkPWy8ZO9xPuEacwEuKM1KY7Y7h1POXJpe2AUZKVM644gwtpWsGM3uLoKqIe4eLLK14Ne6QTnB70rrE4m6r4Ka7mnCrNgMrgIg1qlhxARw+N7J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kovZU/7y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kovZU/7y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A171F000E9;
	Tue, 18 Aug 2026 10:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787050093;
	bh=TwDFq2/nctY3UN8IAyIO34Zdwtve/TgTXGFFNJcRkJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kovZU/7yFKFvJPqXoBS0X3229pO/YGiRjL/oizBOHC+qfQK8bfQhnZfdgUqDk7hkA
	 GaShO+716CkLWGmpVZaPOADp1L4ehZRqyIXUrAa5OvUC2AK1bja8tWz7fs5dyPAqV6
	 W+mehPIeD7NtE14bhH9nx00IlGeFThgElEQUqBLZgDNXNGOXhwBzgncEqHpuo6Kwst
	 Y8HDr8T+qP9uVd5sd2fdfat956HVYyXVw3zVpk/D27mBbPZ8jtc5arIHYXyBubhHJ3
	 R6CgzJarFMrdTTLwVzzFIyaAH0vFA8qzXbOXNfIPNCRXPuednxD7p3erzmiE2mHHQ/
	 BkrYzH323wq6g==
Date: Tue, 18 Aug 2026 11:47:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, nico.pache@linux.dev, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
	vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kas@kernel.org
Subject: Re: [PATCH v4 12/19] selftests/mm: parameterize the mixed-source
 collapse case by source order
Message-ID: <aoQ2XCILH-0h2B3G@lucifer>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-13-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815015901.1236937-13-kirill@shutemov.name>

On Sat, Aug 15, 2026 at 02:58:54AM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> collapse_order_mixed_sources() faults its region as order-2 folios and
> collapses them to the -c target.  Order 2 sits below the contpte threshold
> on both arm64 page-size configurations, so nothing in this suite unfolds a
> contpte source on purpose.
>
> Let -s name the source order alongside -c.  The case then faults at that
> order, keeping order 2 when -s is absent, and the source order has to be a
> supported mTHP order below the target.  The other mTHP cases are
> unaffected: mthp_push_target_order() enables only the target order.
>
> "-s 5 -c 7" on arm64/64K then collapses contpte-mapped sources into a
> larger mTHP.
>
> Assisted-by: Claude-Code:claude-opus-5
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Looks reasonable to me so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/khugepaged.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 0489967d6ee0..1844ddd77b59 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -1389,10 +1389,13 @@ static void collapse_order_max_ptes_none(struct collapse_context *c,
>  static void collapse_order_mixed_sources(struct collapse_context *c,
>  					 struct mem_ops *ops)
>  {
> +	int source_order = anon_order ? anon_order : MIN_MTHP_ORDER;
>  	struct thp_settings settings;
>  	void *p;
>
> -	if (collapse_order <= MIN_MTHP_ORDER) {
> +	/* Sources must be a supported mTHP order strictly below the target. */
> +	if (source_order >= collapse_order ||
> +	    !(thp_supported_orders() & (1UL << source_order))) {
>  		ksft_test_result_skip("%s: no source order below target\n",
>  				      __func__);
>  		return;
> @@ -1400,23 +1403,22 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
>
>  	mthp_push_target_order();
>
> -	/* Fault the whole region as order-MIN_MTHP_ORDER folios. */
> +	/* Fault the whole region as order-@source_order folios. */
>  	settings = *thp_current_settings();
> -	settings.hugepages[MIN_MTHP_ORDER].enabled = THP_ALWAYS;
> +	settings.hugepages[source_order].enabled = THP_ALWAYS;
>  	thp_push_settings(&settings);
>  	p = ops->setup_area(1);
>  	ops->fault(p, 0, hpage_pmd_size);
>  	thp_pop_settings();
>
>  	/*
> -	 * The order is enabled, but the allocator can still fall back under
> -	 * fragmentation.  That leaves nothing to collapse from, which is the
> -	 * machine's answer rather than a reason to end the run.
> +	 * The order is enabled and supported, but the allocator can still fall
> +	 * back under fragmentation.  That leaves nothing to collapse from,
> +	 * which is the machine's answer rather than a reason to end the run.
>  	 */
> -	if (!is_range_backed_by_folio_orders(p, hpage_pmd_size, MIN_MTHP_ORDER,
> +	if (!is_range_backed_by_folio_orders(p, hpage_pmd_size, source_order,
>  					     pagemap_fd, kpageflags_fd)) {
> -		ksft_print_msg("No order-%d sources to collapse...",
> -			       MIN_MTHP_ORDER);
> +		ksft_print_msg("No order-%d sources to collapse...", source_order);
>  		skip("Skip");
>  		ops->cleanup_area(p, hpage_pmd_size);
>  		thp_pop_settings();
> @@ -1425,7 +1427,8 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
>  	}
>
>  	madvise(p, hpage_pmd_size, MADV_HUGEPAGE);
> -	ksft_print_msg("Collapse region backed by smaller large folios...");
> +	ksft_print_msg("Collapse region backed by order-%d sources...",
> +		       source_order);
>  	if (!khugepaged_wait_full_pass())
>  		fail("Timeout");
>  	else if (window_collapsed(p, hpage_pmd_size))
> @@ -1456,6 +1459,8 @@ static void usage(void)
>  	fprintf(stderr,	"\t\t-s: mTHP size, expressed as page order.\n");
>  	fprintf(stderr,	"\t\t    Defaults to 0. Use this size for anon or shmem allocations.\n");
>  	fprintf(stderr,	"\t\t-c: collapse order for mTHP collapse, expressed as page order.\n");
> +	fprintf(stderr,	"\t\t    With -s, -s names the mTHP source order for the\n");
> +	fprintf(stderr,	"\t\t    mixed-source case (source order below the target).\n");
>  	exit(1);
>  }
>
> --
> 2.54.0
>

--
Cheers, Lorenzo
