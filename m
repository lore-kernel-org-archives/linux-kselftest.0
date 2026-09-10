Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6202D7DE9;
	Thu, 10 Sep 2026 04:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789016372; cv=none; b=jgFb4dJfL+xtuozptw/lNfUrmN/1KfTiyWeWOlmLpjjE+im3nK6ARom+NM0mJrMDFphXC5gx4TdzBC5JbX6rNIX9hBxK1EsJKRqE5mnp7GJKl5XjIvyZImX6nkBN9KOAJALvStbCqO+jA37/bdcjnzF2mr+hmJRY+iBh87qdrX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789016372; c=relaxed/simple;
	bh=T2wk08jzigKQMVsHhFOAmlxPgOmq57LwytBcMHYpObk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=If0ci2HoIp/qO9qb0oo/1gWvV9yJA4kN17eSLFQQDwRN+SgE98oWFjZQXqxfidoLOoJfew//u+o4h1vkVTGY0gH6M+5vizbmTsevrKRK1fFIC+nNfpAsGxGnJVrG3vn1/MagtSabOOqSBUf+y4YTtXfM1kXXel0FFgM0Q8qmhVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=l3ZOs3f8; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="l3ZOs3f8"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789016358; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=5ql/2tajP1TkT4UOmZZW/kIFnjsqRcP7DEEYotvDlhI=;
	b=l3ZOs3f8N4UyfuBo0qQ6Pr3DcCszq+hDIuXZMo+JQKEU++UwWSs5BqhkXEvYlG7mxhF4wJ4qE2Wdjlksb68ZpdBwDgfdZVJ7Cal85ocARdhlPLNVzVz0tS0n5s7MuamCCnDtNC226y6FEfL0BTaDNRAgPR9CMNSsRovKpUg6wAQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XAgbVTJ_1789016355;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAgbVTJ_1789016355 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 12:59:16 +0800
Message-ID: <162af233-ae81-40e6-8c71-d13a41b5d892@linux.alibaba.com>
Date: Thu, 10 Sep 2026 12:59:14 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/19] selftests/mm: add order-parameterized khugepaged
 collapse cases
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
 <20260908125105.1510704-12-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260908125105.1510704-12-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> The mthp_khugepaged context runs the generic cases at a sub-PMD order,
> which answers how many folios of that order a range ends up with.  It
> cannot say which order-sized window they landed in, so "the populated
> window collapsed" and "the empty window next to it collapsed instead" look
> alike.
> 
> Add four cases that check each window on its own, with the folio-order
> helpers in vm_util:
> 
> - collapse_order_single_window(): only the populated window collapses;
> - collapse_order_partial_window(): the default max_ptes_none lets a window
>    with one present PTE collapse;
> - collapse_order_max_ptes_none(): with max_ptes_none=0 a full window
>    collapses and one missing a page does not;
> - collapse_order_mixed_sources(): sources that are already large folios of
>    a smaller order collapse to the target.
> 
> Each case faults its region before MADV_HUGEPAGE with only the target
> order enabled, so the sources are order 0 and the result can only come
> from khugepaged.  They wait for a full pass rather than for the result to
> appear: without a completed pass, "not collapsed" and "not scanned yet"
> are the same thing.
> 
> Assisted-by: LLM
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>   tools/testing/selftests/mm/khugepaged.c | 212 ++++++++++++++++++++++++
>   1 file changed, 212 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index e9bc8fe8a1f8..fb4efaf67c40 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -31,6 +31,8 @@ static unsigned long page_size;
>   static int hpage_pmd_nr;
>   static int anon_order;
>   static int collapse_order;
> +static int pagemap_fd = -1;
> +static int kpageflags_fd = -1;
>   
>   #define PID_SMAPS "/proc/self/smaps"
>   #define TEST_FILE "collapse_test_file"
> @@ -1207,6 +1209,198 @@ static void madvise_retracted_page_tables(struct collapse_context *c,
>   	ksft_test_result_report(exit_status, "%s\n", __func__);
>   }
>   
> +/* Smallest order khugepaged will consider for mTHP collapse */
> +#define MIN_MTHP_ORDER 2
> +
> +/* Time budget for one khugepaged pass in the collapse_order_* cases */
> +#define MTHP_PASS_TIMEOUT_S 30
> +
> +static size_t mthp_window_size(void)
> +{
> +	return page_size << collapse_order;
> +}
> +
> +static void mthp_push_target_order(void)
> +{
> +	struct thp_settings settings = *thp_current_settings();
> +	int i;
> +
> +	/*
> +	 * Only the target order, and only for madvise: the cases fault their
> +	 * region first, so the sources stay order 0 whatever -s asked for.
> +	 */
> +	settings.thp_enabled = THP_NEVER;
> +	for (i = 0; i < NR_ORDERS; i++)
> +		settings.hugepages[i].enabled = THP_NEVER;
> +	settings.hugepages[collapse_order].enabled = THP_MADVISE;
> +	thp_push_settings(&settings);
> +}
> +
> +static bool all_windows_at_order(void *p, size_t len)
> +{
> +	return is_range_backed_by_order(p, len, collapse_order,
> +					pagemap_fd, kpageflags_fd);

Like I mentioned in patch 8, you can implement these helpers using 
check_large_folios() in vm_util.c. Then you do not need to add new 
'pagemap_fd' and 'kpageflags_fd' variables.

> +}
> +
> +static bool any_window_at_order(void *p, size_t len)
> +{
> +	size_t window = mthp_window_size();
> +	char *addr = p;
> +
> +	for (; len >= window; addr += window, len -= window) {
> +		if (all_windows_at_order(addr, window))
> +			return true;
> +	}
> +	return false;
> +}
> +
> +static void collapse_order_single_window(struct collapse_context *c,
> +					 struct mem_ops *ops)
> +{
> +	size_t window = mthp_window_size();
> +	void *p;
> +
> +	mthp_push_target_order();
> +
> +	p = ops->setup_area(1);
> +	ops->fault(p, window, 2 * window);
> +	if (any_window_at_order(p, hpage_pmd_size))
> +		ksft_exit_fail_msg("Unexpected large folio after fault\n");
> +
> +	if (madvise(p, hpage_pmd_size, MADV_HUGEPAGE))
> +		ksft_exit_fail_perror("madvise(MADV_HUGEPAGE)");
> +	ksft_print_msg("Collapse one fully populated window...");
> +	if (!khugepaged_full_pass(MTHP_PASS_TIMEOUT_S))
> +		fail("Timeout");
> +	else if (all_windows_at_order(p + window, window) &&
> +		 !any_window_at_order(p, window) &&
> +		 !any_window_at_order(p + 2 * window,
> +				      hpage_pmd_size - 2 * window))
> +		success("OK");
> +	else
> +		fail("Fail");
> +
> +	validate_memory(p, window, 2 * window);
> +	ops->cleanup_area(p, hpage_pmd_size);
> +	thp_pop_settings();
> +	ksft_test_result_report(exit_status, "%s\n", __func__);
> +}
> +
> +static void collapse_order_partial_window(struct collapse_context *c,
> +					  struct mem_ops *ops)
> +{
> +	void *p;
> +
> +	mthp_push_target_order();
> +
> +	p = ops->setup_area(1);
> +	ops->fault(p, 0, page_size);
> +	if (any_window_at_order(p, hpage_pmd_size))
> +		ksft_exit_fail_msg("Unexpected large folio after fault\n");
> +
> +	if (madvise(p, hpage_pmd_size, MADV_HUGEPAGE))
> +		ksft_exit_fail_perror("madvise(MADV_HUGEPAGE)");
> +	ksft_print_msg("Collapse window with single PTE entry present...");
> +	if (!khugepaged_full_pass(MTHP_PASS_TIMEOUT_S))
> +		fail("Timeout");
> +	else if (all_windows_at_order(p, mthp_window_size()))
> +		success("OK");
> +	else
> +		fail("Fail");
> +
> +	validate_memory(p, 0, page_size);
> +	ops->cleanup_area(p, hpage_pmd_size);
> +	thp_pop_settings();
> +	ksft_test_result_report(exit_status, "%s\n", __func__);
> +}
> +
> +static void collapse_order_max_ptes_none(struct collapse_context *c,
> +					 struct mem_ops *ops)
> +{
> +	struct thp_settings settings;
> +	size_t window = mthp_window_size();
> +	void *p;
> +
> +	mthp_push_target_order();
> +	settings = *thp_current_settings();
> +	settings.khugepaged.max_ptes_none = 0;
> +	thp_push_settings(&settings);
> +
> +	p = ops->setup_area(1);
> +	ops->fault(p, 0, 2 * window - page_size);
> +	if (any_window_at_order(p, hpage_pmd_size))
> +		ksft_exit_fail_msg("Unexpected large folio after fault\n");
> +
> +	if (madvise(p, hpage_pmd_size, MADV_HUGEPAGE))
> +		ksft_exit_fail_perror("madvise(MADV_HUGEPAGE)");
> +	ksft_print_msg("Collapse full window, not the one missing a page...");
> +	if (!khugepaged_full_pass(MTHP_PASS_TIMEOUT_S))
> +		fail("Timeout");
> +	else if (all_windows_at_order(p, window) &&
> +		 !any_window_at_order(p + window, window))
> +		success("OK");
> +	else
> +		fail("Fail");
> +
> +	validate_memory(p, 0, 2 * window - page_size);
> +	ops->cleanup_area(p, hpage_pmd_size);
> +	thp_pop_settings();
> +	thp_pop_settings();
> +	ksft_test_result_report(exit_status, "%s\n", __func__);
> +}
> +
> +static void collapse_order_mixed_sources(struct collapse_context *c,
> +					 struct mem_ops *ops)
> +{
> +	struct thp_settings settings;
> +	void *p;
> +
> +	if (collapse_order <= MIN_MTHP_ORDER) {
> +		ksft_test_result_skip("%s: no source order below target\n",
> +				      __func__);
> +		return;
> +	}
> +
> +	mthp_push_target_order();
> +
> +	settings = *thp_current_settings();
> +	settings.hugepages[MIN_MTHP_ORDER].enabled = THP_ALWAYS;
> +	thp_push_settings(&settings);
> +	p = ops->setup_area(1);
> +	ops->fault(p, 0, hpage_pmd_size);
> +	thp_pop_settings();
> +
> +	/*
> +	 * The allocator can fall back to smaller folios under fragmentation;
> +	 * having nothing to collapse from is not a failure.
> +	 */
> +	if (!is_range_backed_by_order(p, hpage_pmd_size, MIN_MTHP_ORDER,
> +				      pagemap_fd, kpageflags_fd)) {
> +		ksft_print_msg("No order-%d sources to collapse...",
> +			       MIN_MTHP_ORDER);
> +		skip("Skip");
> +		ops->cleanup_area(p, hpage_pmd_size);
> +		thp_pop_settings();
> +		ksft_test_result_report(exit_status, "%s\n", __func__);
> +		return;
> +	}
> +
> +	if (madvise(p, hpage_pmd_size, MADV_HUGEPAGE))
> +		ksft_exit_fail_perror("madvise(MADV_HUGEPAGE)");
> +	ksft_print_msg("Collapse region backed by smaller large folios...");
> +	if (!khugepaged_full_pass(MTHP_PASS_TIMEOUT_S))
> +		fail("Timeout");
> +	else if (all_windows_at_order(p, hpage_pmd_size))
> +		success("OK");
> +	else
> +		fail("Fail");
> +
> +	validate_memory(p, 0, hpage_pmd_size);
> +	ops->cleanup_area(p, hpage_pmd_size);
> +	thp_pop_settings();
> +	ksft_test_result_report(exit_status, "%s\n", __func__);
> +}
> +
>   static void usage(void)
>   {
>   	fprintf(stderr, "\nUsage: ./khugepaged [OPTIONS] <test type> [dir]\n\n");
> @@ -1375,6 +1569,20 @@ int main(int argc, char **argv)
>   
>   	parse_test_type(argc, argv);
>   
> +	if (mthp_khugepaged_context &&
> +	    !(thp_supported_orders() & (1UL << collapse_order)))
> +		ksft_exit_skip("Order %d is not a supported anon THP order\n",
> +			       collapse_order);

This check can be moved into parse_test_type(), where the 
'mthp_khugepaged' parameter is parsed.

> +
> +	if (mthp_khugepaged_context) {
> +		pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
> +		if (pagemap_fd < 0)
> +			ksft_exit_fail_perror("open(/proc/self/pagemap)");
> +		kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
> +		if (kpageflags_fd < 0)
> +			ksft_exit_fail_perror("open(/proc/kpageflags)");

When you change to use check_large_folios(), these fds can be removed 
from this file.

> +	}
> +
>   	setbuf(stdout, NULL);
>   
>   	/*
> @@ -1425,6 +1633,10 @@ int main(int argc, char **argv)
>   	TEST(collapse_empty, madvise_context, anon_ops);
>   
>   	TEST(collapse_single_mthp, mthp_khugepaged_context, anon_ops);
> +	TEST(collapse_order_single_window, mthp_khugepaged_context, anon_ops);
> +	TEST(collapse_order_partial_window, mthp_khugepaged_context, anon_ops);
> +	TEST(collapse_order_max_ptes_none, mthp_khugepaged_context, anon_ops);
> +	TEST(collapse_order_mixed_sources, mthp_khugepaged_context, anon_ops);

These test cases look good to me. Thanks.
