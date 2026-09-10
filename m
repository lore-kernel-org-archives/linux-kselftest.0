Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793791A683E;
	Thu, 10 Sep 2026 05:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789016956; cv=none; b=KB1WlGdr/ckeFmc4rhdqSFlbjjLSb5gC+uyY29JQBKA2ql0ooRs68qOC4upoyu5MUY47rrvjQUXTcQlxdOkw9hS2/kAlPN/XvKmiGn3e9frag6xFSED82bwlZPBhC9ZM1pQut2urZhN7OlRGtSHeDiIxkpKGnXqFXUxpU5tjRsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789016956; c=relaxed/simple;
	bh=PCVHBJaAL3BZ1eR/rKgURgdixDj62va6EToGnCOZ628=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uEE0j3f2yNhMz4ec80jNzMgFy4JC7yK0dLbo4MSDjcGffcuTy8maOank2Q5rMx0zQYifO21D6rXA1b+BxlCVpA66PF32EWkDZNPx8RKPv8b7DLEsTbOsckbCb+Bzq0qs2PXf5RJUQaQOokxiIYt0FyA0DW3yl/1Bw+DwsMNil2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Vju5ynF/; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Vju5ynF/"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789016944; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=iM97NZNkgRQvm4z0BalpDvlSr5wYN5Y0N3YdRoica9U=;
	b=Vju5ynF/KYPZj8/HSF0yR9zOZAr+RKtV5Qa1ia54T0pkJJg4PQjHrQN/m1T0VmRRGLehnEoOOsY9FwjtLrLHNe5TBMbaxm2i6Is7jabwwb9MuW37oN1+PsC6UMEaLVPb7LoZKtncBUVU1jn8AexFpF7DITaGqWV0uTRBNOYvN/s=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R521e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XAgbYFF_1789016941;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAgbYFF_1789016941 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 13:09:02 +0800
Message-ID: <4aeaa283-a417-45a9-9298-8123192dc707@linux.alibaba.com>
Date: Thu, 10 Sep 2026 13:09:00 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/19] selftests/mm: parameterize the mixed-source
 collapse case by source order
To: Kiryl Shutsemau <kirill@shutemov.name>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, rppt@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev,
 nico.pache@linux.dev, ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com,
 hughd@google.com, lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com,
 ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com,
 vbabka@kernel.org, agordeev@linux.ibm.com, jgg@ziepe.ca, leon@kernel.org,
 kernel-team@meta.com, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-13-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260908125105.1510704-13-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> collapse_order_mixed_sources() faults its region as order-2 folios and
> collapses them to the -c target.  Order 2 is below the contpte size on
> every arm64 page size, so nothing in this suite collapses a contpte-mapped
> source on purpose.
> 
> Let -s name the source order alongside -c.  The case then faults at that
> order, keeping order 2 when -s is absent, and the source order has to be a
> supported mTHP order below the target.  The other mTHP cases are
> unaffected: mthp_push_target_order() enables only the target order.
> 
> "-s 5 -c 7" on arm64/64K then collapses contpte-mapped sources into a
> larger mTHP.

Make sense. But we should validate invalid parameter combinations for 
'-s' and '-c'. For example, when I set the following unreasonable 
parameters, some test cases fail, so such invalid configurations should 
be rejected.

[root@]# ./khugepaged -s 7 -c 6 mthp_khugepaged:anon
TAP version 13
# Save THP and khugepaged settings... OK
1..8
# Allocate huge page on fault... OK
# Split huge PMD on MADV_DONTNEED... OK
ok 1 allocate on fault and split
#
# Run test: collapse_full (mthp_khugepaged:anon)
# Collapse multiple fully populated PTE table.... Fail
not ok 2 collapse_full
#
# Run test: collapse_empty (mthp_khugepaged:anon)
# Do not collapse empty PTE table.... OK
ok 3 collapse_empty
#
# Run test: collapse_single_mthp (mthp_khugepaged:anon)
# Collapse PTE table with half PTE entries present.... Fail
not ok 4 collapse_single_mthp
#
# Run test: collapse_order_single_window (mthp_khugepaged:anon)
# Collapse one fully populated window... OK
ok 5 collapse_order_single_window
#
# Run test: collapse_order_partial_window (mthp_khugepaged:anon)
# Collapse window with single PTE entry present... OK
ok 6 collapse_order_partial_window
#
# Run test: collapse_order_max_ptes_none (mthp_khugepaged:anon)
# Collapse full window, not the one missing a page... OK
ok 7 collapse_order_max_ptes_none
#
# Run test: collapse_order_mixed_sources (mthp_khugepaged:anon)
ok 8 # SKIP collapse_order_mixed_sources: no supported source order 
below target
# 1 skipped test(s) detected. Consider enabling relevant config options 
to improve coverage.
# Totals: pass:5 fail:2 xfail:0 xpass:0 skip:1 error:0

> Assisted-by: LLM
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>   tools/testing/selftests/mm/khugepaged.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index fb4efaf67c40..b15cd07fc0b3 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -1352,11 +1352,13 @@ static void collapse_order_max_ptes_none(struct collapse_context *c,
>   static void collapse_order_mixed_sources(struct collapse_context *c,
>   					 struct mem_ops *ops)
>   {
> +	int source_order = anon_order ? anon_order : MIN_MTHP_ORDER;
>   	struct thp_settings settings;
>   	void *p;
>   
> -	if (collapse_order <= MIN_MTHP_ORDER) {
> -		ksft_test_result_skip("%s: no source order below target\n",
> +	if (source_order >= collapse_order ||
> +	    !(thp_supported_orders() & (1UL << source_order))) {
> +		ksft_test_result_skip("%s: no supported source order below target\n",
>   				      __func__);
>   		return;
>   	}
> @@ -1364,7 +1366,7 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
>   	mthp_push_target_order();
>   
>   	settings = *thp_current_settings();
> -	settings.hugepages[MIN_MTHP_ORDER].enabled = THP_ALWAYS;
> +	settings.hugepages[source_order].enabled = THP_ALWAYS;
>   	thp_push_settings(&settings);
>   	p = ops->setup_area(1);
>   	ops->fault(p, 0, hpage_pmd_size);
> @@ -1374,10 +1376,9 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
>   	 * The allocator can fall back to smaller folios under fragmentation;
>   	 * having nothing to collapse from is not a failure.
>   	 */
> -	if (!is_range_backed_by_order(p, hpage_pmd_size, MIN_MTHP_ORDER,
> +	if (!is_range_backed_by_order(p, hpage_pmd_size, source_order,
>   				      pagemap_fd, kpageflags_fd)) {
> -		ksft_print_msg("No order-%d sources to collapse...",
> -			       MIN_MTHP_ORDER);
> +		ksft_print_msg("No order-%d sources to collapse...", source_order);
>   		skip("Skip");
>   		ops->cleanup_area(p, hpage_pmd_size);
>   		thp_pop_settings();
> @@ -1387,7 +1388,8 @@ static void collapse_order_mixed_sources(struct collapse_context *c,
>   
>   	if (madvise(p, hpage_pmd_size, MADV_HUGEPAGE))
>   		ksft_exit_fail_perror("madvise(MADV_HUGEPAGE)");
> -	ksft_print_msg("Collapse region backed by smaller large folios...");
> +	ksft_print_msg("Collapse region backed by order-%d sources...",
> +		       source_order);
>   	if (!khugepaged_full_pass(MTHP_PASS_TIMEOUT_S))
>   		fail("Timeout");
>   	else if (all_windows_at_order(p, hpage_pmd_size))
> @@ -1418,6 +1420,7 @@ static void usage(void)
>   	fprintf(stderr,	"\t\t-s: mTHP size, expressed as page order.\n");
>   	fprintf(stderr,	"\t\t    Defaults to 0. Use this size for anon or shmem allocations.\n");
>   	fprintf(stderr,	"\t\t-c: collapse order for mTHP collapse, expressed as page order.\n");
> +	fprintf(stderr,	"\t\t    -s, if set, is the source order for the mixed-source case.\n");
>   	exit(1);
>   }
>   

