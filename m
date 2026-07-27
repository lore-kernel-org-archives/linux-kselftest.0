Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D934C4156C9
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 17:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172726; cv=none; b=MmWL0SvjBrFy70RfnhdOU9Q/CT8DvnO54AWKkHqh72Kmj1+kLTDf7Tuq/vnGoQIsEGT7SiL66Tz9QUFhpb7/PfbJp3Hv2ziXSK931fFUwjpasFM2vtDO2R/Eucvr548SEEbkXqBO9R6j3R182Ggc1W15/fOa1LEsjki46KtuW74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172726; c=relaxed/simple;
	bh=py/hK1hVwJWqIhYUqPZH6fuHOu9xZak88H+BU1Dr+5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwcIIHnYeZOfdrZQAn0eB7KAxymNQl6BsQiMxqzQ7L6l6+6wK+ADngoLJg1GbWcdt3qDHI9uS3uD8HDwzxPiJVy6LDuuCdqxu3EjunW3uaBB0fX7k8RAIv6s1C05jbHfxqvCsJs5HQ7G7LdqkU5EO89/qVCVvFKWHqDjT7s8Sg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SrvT9X6n; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SrvT9X6n"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785172712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vuWbOoJyujNfmWfTnbDRre0Xx+nHPBkZLj3gLNMEYTM=;
	b=SrvT9X6neSmjeBoZuqVI8g5upFQUa3BlCUtZ36e7neOQ65nl2n5rm5LE5ogKmPN4Tavk4Z
	5lu/hB5Ep+0rpZxAR12DEBl9RVmiLn4/CJkSj6nipM+1dr2plskjC/0MD03y2GIcLyKjwy
	qPMR3asJHVlIlP/BnwzOQs1q4+o2Q58=
From: Usama Arif <usama.arif@linux.dev>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] selftests/mm: skip khugepaged swap tests without swap
Date: Mon, 27 Jul 2026 10:18:25 -0700
Message-ID: <20260727171825.2835957-1-usama.arif@linux.dev>
In-Reply-To: <20260727095225.372655-4-usama.anjum@arm.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Mon, 27 Jul 2026 10:52:19 +0100 Muhammad Usama Anjum <usama.anjum@arm.com> wrote:

> collapse_swapin_single_pte and collapse_max_ptes_swap require
> MADV_PAGEOUT to replace anonymous pages with swap entries. On swapless
> systems there is no backing store with which to create those entries,
> so check_swap() reports missing setup rather than broken khugepaged
> behavior.
> 
> Swapless configurations are common on Android and other constrained
> test devices. Failing these cases obscures actionable results from the
> rest of the khugepaged suite.
> 
> Check /proc/swaps before either swap-dependent case and skip when no
> active swap area exists. With swap present, retain the existing
> MADV_PAGEOUT and swap-entry assertions unchanged.
> 
> Print each existing swapout diagnostic before the prerequisite check
> so skip() completes a KTAP diagnostic line instead of emitting an
> unprefixed message.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
> Changes since v1:
> - Print swapout diagnostics before reporting no-swap skips.
> ---
>  tools/testing/selftests/mm/khugepaged.c | 38 +++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 10e8dedcb087d..54e888eb48bbc 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -100,6 +100,28 @@ static void skip(const char *msg)
>  	exit_status = KSFT_SKIP;
>  }
>  
> +static bool is_swap_enabled(void)
> +{
> +	char buf[MAX_LINE_LENGTH];
> +	FILE *file;
> +	bool enabled = false;
> +
> +	file = fopen("/proc/swaps", "r");
> +	if (!file)
> +		return false;
> +
> +	if (!fgets(buf, sizeof(buf), file))
> +		goto out;
> +
> +	/* Check for first active swap entry. */
> +	if (fgets(buf, sizeof(buf), file))
> +		enabled = true;
> +
> +out:
> +	fclose(file);
> +	return enabled;
> +}
> +

Could is_swap_enabled() be moved to vm_util.c. This will definitely be reusable
in other places.

>  static void save_settings(void)
>  {
>  	ksft_print_msg("Save THP and khugepaged settings...");
> @@ -734,10 +756,16 @@ static void collapse_swapin_single_pte(struct collapse_context *c, struct mem_op
>  {
>  	void *p;
>  
> +	ksft_print_msg("Swapout one page...");
> +	if (!is_swap_enabled()) {
> +		skip("No active swap");
> +		ksft_test_result_report(exit_status, "%s\n", __func__);
> +		return;
> +	}
> +
>  	p = ops->setup_area(1);
>  	ops->fault(p, 0, hpage_pmd_size);
>  
> -	ksft_print_msg("Swapout one page...");
>  	if (madvise(p, page_size, MADV_PAGEOUT))
>  		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
>  	if (check_swap(p, page_size)) {
> @@ -760,10 +788,16 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
>  	int max_ptes_swap = thp_read_num("khugepaged/max_ptes_swap");
>  	void *p;
>  
> +	ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap + 1, hpage_pmd_nr);
> +	if (!is_swap_enabled()) {
> +		skip("No active swap");
> +		ksft_test_result_report(exit_status, "%s\n", __func__);
> +		return;
> +	}
> +
>  	p = ops->setup_area(1);
>  	ops->fault(p, 0, hpage_pmd_size);
>  
> -	ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap + 1, hpage_pmd_nr);
>  	if (madvise(p, (max_ptes_swap + 1) * page_size, MADV_PAGEOUT))
>  		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
>  	if (check_swap(p, (max_ptes_swap + 1) * page_size)) {
> -- 
> 2.47.3
> 
> 
