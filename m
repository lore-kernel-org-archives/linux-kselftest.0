Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E4E3DDAFA;
	Thu, 20 Aug 2026 08:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215286; cv=none; b=WAyPc4sp/E6ul3J2vKnsQFrvntrhkjIQEBgRCy9agC2k4RhKXQomp/Ls0LhVONa3wIeidLVpWK8Pe5Be5culbpgZKR2l5sC6GAVycT5ySAfv2R3XnBvYK1uiD4o/PvTSz8VCMqlJVyNe9KteH22jMXP5JDFpWtJYPy3RavbWdUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215286; c=relaxed/simple;
	bh=CufGdtujt6KxcZGh+tZL/jWdaNulhvi0Qw9FMFFrVCQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=DXdKMe0yqKnkI8YfUUWHj3Q45+dIT0qn/uGfDjO3A2ufHR/KDtGSPUYFxcr3NGMnZESGUx0yjeCFHnvPxaRCUlthb2tOH2HJfmHBuQUb9zhU5piNYbBi96RZzC00AVTo4UDOwJqt77zbFXCOHfHqDGNKpKLXahyr+cRZ9YGFn5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+fX4A+c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+fX4A+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F8D1F000E9;
	Thu, 20 Aug 2026 08:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215284;
	bh=jNxWCi3yGoXYWUtnpfwteYPUr0j/rlA3LzUwoatWwKs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=O+fX4A+cfqy2cu5BO8P/JfVmsMImoss5n48YQ3xypQhyEM+oLIrHih8bInNvcCMZb
	 GOemMbD1pzlmKwgBnjl+LWFjvX8wnRF4mzbXuWDTwI85BU4z/+sOn2pOrvvj5HeNpu
	 MsayuynthssBO7r7ZQr7uoi0JpIaJJHq2LKZTLyH7sUq/nFes48yZNFEpze5a8/Jz4
	 Kc0rw6JwHs8l0kV4fng9drAEgR+GIwQkU43S2YyqHzkZRDeVKUMxKBaN/SWxnU/5fq
	 UCnpbmd+/aE+KqhTNS96PY18JprbZ8m9qOEAqDVs1lvSAxgOvTJm0tnoKH0Ez+tvB3
	 rpWHnZ4zhfmUw==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 11/19] selftests/mm: add order-parameterized
 khugepaged collapse cases
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
 dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, 
 liam@infradead.org, mhocko@suse.com, rppt@kernel.org, ryan.roberts@arm.com, 
 shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
 vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, 
 agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kas@kernel.org
In-Reply-To: <20260815015901.1236937-12-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-12-kirill@shutemov.name>
Date: Thu, 20 Aug 2026 11:40:35 +0300
Message-Id: <178721523517.2799959.18230284669032818374.b4-review@b4>
X-Mailer: b4 0.17-dev

> The mthp_khugepaged context runs the generic cases at a sub-PMD order,
> which answers how many folios of that order a range ends up with.  It
> cannot say which window they are in, so "the populated window collapsed
> and its neighbour did not" and "one window collapsed twice" look alike.
> 
> Add four cases that check each aligned window on its own, with the
> folio-order helpers in vm_util:
> 
> - collapse_order_single_window(): only the populated window collapses;
> - collapse_order_partial_window(): the default max_ptes_none lets a window
>   with one present PTE collapse;
> - collapse_order_max_ptes_none(): with max_ptes_none=0 a full window
>   collapses and one missing a page does not;
> - collapse_order_mixed_sources(): sources that are already large folios of
>   a smaller order collapse to the target.
> 
> Each case faults its region before MADV_HUGEPAGE with only the target
> order enabled, so the sources are order 0 and the result can only come
> from khugepaged.  They wait for a full pass rather than for the result to
> appear: without a completed pass, "not collapsed" and "not scanned yet"
> are the same thing.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 5aa92de93ec1..56e364320145 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -31,6 +31,8 @@ static unsigned long page_size;
>  static int hpage_pmd_nr;
>  static int anon_order;
>  static int collapse_order;
> +static int pagemap_fd = -1;
> +static int kpageflags_fd = -1;
>  
>  #define PID_SMAPS "/proc/self/smaps"
>  #define TEST_FILE "collapse_test_file"
> @@ -1261,6 +1263,216 @@ static void madvise_retracted_page_tables(struct collapse_context *c,
>  	ksft_test_result_report(exit_status, "%s\n", __func__);
>  }
>  
> +/* Smallest order khugepaged will consider for mTHP collapse. */
> +#define MIN_MTHP_ORDER 2
> +
> +/*
> + * Order-parameterized collapse cases for the mthp_khugepaged context.  What
> + * they add over the generic cases run under that context is per-window
> + * detection: which aligned window collapsed, and which of its neighbours did
> + * not.  check_huge() answers how many folios of the order the range holds,
> + * which cannot tell one window from another.

This comment again reads like in the context of the changes driven by
the current prompt.

> + *
> + * The region is faulted before MADV_HUGEPAGE, and the target order is only
> + * enabled for madvise, so the sources are always order 0 and the collapse
> + * product can only have come from khugepaged.
> + */

Hmm, what claude tries to tell us here?

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
> +	 * The target order, for madvise only, and nothing else enabled: the
> +	 * cases fault their region before MADV_HUGEPAGE, so the sources are
> +	 * order 0 whatever -s asked the fault path for.  That matters for the
> +	 * cases built around a hole -- a large source folio would fill it in
> +	 * and the window would collapse after all.
> +	 * collapse_order_mixed_sources enables the source order it wants on
> +	 * top of this.
> +	 */
> +	settings.thp_enabled = THP_NEVER;
> +	for (i = 0; i < NR_ORDERS; i++)
> +		settings.hugepages[i].enabled = THP_NEVER;
> +	settings.hugepages[collapse_order].enabled = THP_MADVISE;
> +	thp_push_settings(&settings);
> +}
> +
> +static bool window_collapsed(void *p, size_t len)
> +{
> +	return is_range_backed_by_folio_orders(p, len, collapse_order,
> +					       pagemap_fd, kpageflags_fd);
> +}
> +
> +/* No aligned window in [p, p + len) is backed at the target order. */
> +static bool window_not_collapsed(void *p, size_t len)

I'd expect window_not_collapsed to be !window_collapsed.
Maybe we need to add some order notion to both of them, like
exact_order, any_order or something like that?

> +{
> +	size_t window = mthp_window_size();
> +	char *addr = p;
> +
> +	for (; len >= window; addr += window, len -= window) {
> +		if (window_collapsed(addr, window))
> +			return false;
> +	}
> +	return true;
> +}
> +
> +static bool khugepaged_wait_full_pass(void)
> +{
> +	/* Wait up to 30 seconds for the pass to complete. */

Isn't it clear from the call? And do we really need this wrapper?

> +	return khugepaged_full_pass(30);
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
> +	if (!window_not_collapsed(p, hpage_pmd_size))

!window_not_collapsed  reads weird

-- 
Sincerely yours,
Mike.

