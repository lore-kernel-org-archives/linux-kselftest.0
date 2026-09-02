Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A104A43F7;
	Wed,  2 Sep 2026 15:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362126; cv=none; b=pCDA3MMUaZQa0oH+B6YWYK1bq6oTZZhKftpUvgfXO/3LIxgCKMVU1FOTVZkzlee975Lnwj2QSDjWc7RHGRGEekgHDfgQ7c98qxm3Qv0/XPjQLvi7sevDoU2hqZmEXnzrV4lUvb+mVr+8Lx5YTn3FX9XT5tRlRsOVOsPTwPd461k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362126; c=relaxed/simple;
	bh=oJsxERgsDwR7OSxVnfBU24RfTD0I1dH81Vcv78gUMtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1JzDuz0ZP/8A0NRWstUYcDsPEZHws3l14ZWsEj48q8ySo/ydaiXLd0Ht7qn6DKoqrwyYgqolz+cpmHtrjjIJIJMyxsjLB3AdcXLTB+uf3BxWnGyFsh0Y/eGAY/HSM6MPSyF0qzx831zBhgIikmzDMBG1SjHHt4NtKIu22TfQBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jA50Z6Fg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jA50Z6Fg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DDD1F000E9;
	Wed,  2 Sep 2026 15:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788362124;
	bh=geLLc9OYOHH6RJHOH7p2OvUwcIlLmy1uLQiXbiK2XfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jA50Z6FgFOKtz4B3l8//fub6qKXdyUdDE5W7bOPXPB7K0hAdVjfJB9790JMkQ9tS0
	 FDb6SW92xBK/9UzaF6r3H4sJuvwp9xV0MD2h+NTDnYxfa7Hdpbabz+EVeWqOlGmd/I
	 jFRgtyJRex0uZ1/JRBfaPwFMHjhjrGOWdqfcAKDr7wicaGosAExmxJT6oiFzMq6Cx6
	 3dzI6+V8Mavdpm7AMMKbVvTAHZZ11ZDao34wA/BNAYROpvuhRvQ8rcxHVM4aJ5BhzL
	 MHjwtCXqXTccM8A+7FPNSejUlzocVjb9VS1FPSP77GrAIMZud9fCDgB+rhEznmQ6D2
	 jWr6+PZrV5toQ==
Date: Wed, 2 Sep 2026 16:15:17 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] kselftest: mm: prevent random failure of huge
 page split for khugepaged
Message-ID: <apg7FNLtFO3Ea5qC@gremlin>
References: <20260902-fix_split-v4-0-85f03905f7b1@arm.com>
 <20260902-fix_split-v4-1-85f03905f7b1@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-fix_split-v4-1-85f03905f7b1@arm.com>

On Wed, Sep 02, 2026 at 01:09:35PM +0100, Yeoreum Yun wrote:
> There're some random failure for split_huge_page_test when khugepaged
> collapses pages into pmd again which had split by the test.
>
> Prevent the khugepaged's collapses for split page by setting the
> mapped pmd-huge-page with MADV_NOHUGEPAGE before split.

Maybe worth saying that MADV_NOHUGEPAGE doesn't immediately split anything, just
prevents future khugepaged collapses?

>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

LGTM, thanks, with a few nits above/below (sorry! :P)

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/split_huge_page_test.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> index 86a603692826..4bbad892bc57 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -168,6 +168,14 @@ static char *allocate_zero_filled_hugepage(size_t len)
>  	return result;
>  }
>
> +static void madv_nohuge(void *addr, size_t len)

Maybe call it disable_khugepaged() to make it explicit that's what this is doing
rather than eliminating any THP pages in the range?

> +{

Maybe a comment here like:

	/*
	 * Disables khugepaged from collapsing THPs in range, existing THP
	 * pages remain.
	 */

> +	if (!madvise(addr, len, MADV_NOHUGEPAGE))
> +		return;
> +
> +	ksft_exit_fail_msg("MADV_NOHUGEPAGE failed, err=%d\n", errno);
> +}
> +
>  static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hpages, size_t len)
>  {
>  	unsigned long rss_anon_before, rss_anon_after;
> @@ -180,6 +188,9 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
>  	if (!rss_anon_before)
>  		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
>
> +	/* Prevent khugepaged from collapsing the pages. */
> +	madv_nohuge(one_page, len);
> +
>  	/* split all THPs */
>  	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
>  		      (uint64_t)one_page + len, 0);
> @@ -227,6 +238,9 @@ static void split_pmd_thp_to_order(int order)
>  	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 4, pmd_pagesize))
>  		ksft_exit_fail_msg("No THP is allocated\n");
>
> +	/* Prevent khugepaged from collapsing the pages. */
> +	madv_nohuge(one_page, len);
> +
>  	/* split all THPs */
>  	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
>  		(uint64_t)one_page + len, order);
> @@ -275,6 +289,9 @@ static void split_pte_mapped_thp(void)
>  		goto out;
>  	}
>
> +	/* Prevent khugepaged from collapsing the pages. */
> +	madv_nohuge(thp_area, thp_area_size);
> +
>  	/*
>  	 * To challenge spitting code, we will mremap a single page of each
>  	 * THP (page[i] of thp[i]) in the thp_area into page_area. This will
> @@ -542,6 +559,8 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
>  		ksft_test_result_skip("Pagecache folio split skipped\n");
>  		return -2;
>  	}
> +	/* Prevent khugepaged from collapsing the pages. */
> +	madv_nohuge(*addr, fd_size);
>  	return 0;
>  err_out_close:
>  	close(*fd);
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
