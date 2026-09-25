Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0F1485CEF;
	Fri, 25 Sep 2026 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338253; cv=none; b=b6CV6a7PypCGpcm12fh3sOaEw0fSb4+0fcAYdrXh2uoagJemfXIJp3cwgENU2wsyT+NY0J5SLVhCPkjUt6lXDfnwqDnWbEJmWsd+33yh31kbNUVku41iSAGrtg7+J9CdtF6n4vIFhw3/IHEzF3rN3dpc8hjuH04IIC5BwaNy44c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338253; c=relaxed/simple;
	bh=NEYUebGz1uDI7Npr1A5moQGPlxhm/IrhMht840u7NQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZt0s9nmMQkPP2fiVX/qoBgeemXEXDYDEHygjUNUsvOH43Dvw4oC6UIq+XaKGu2mD0n7guhi6HW9P8G9wzSOz0XFqCoJc43K2YTXkuv4thkmvrd0zGi/HwfYpSclTZtGs05fa/Np5pEf4sCBex5xOLf2NWw7mkiC2pc93VlwfEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Er6Bps5u; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Er6Bps5u"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44A1D1688;
	Fri, 25 Sep 2026 05:10:46 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E67F3F86C;
	Fri, 25 Sep 2026 05:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790338249; bh=NEYUebGz1uDI7Npr1A5moQGPlxhm/IrhMht840u7NQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Er6Bps5u28i6dwAxosn/pPKCYRMfwt73pA1zVb2TfE6fj8cf/A5kmRyUPZv2+ciQ2
	 j1TBYB48z5UXdNCINevu8QF8PkZUhtuiQ5Pn2Ro5HP7OJI2hN54ESlSYvVJvlz7uGi
	 wFpSLMRb/mEw4Rs/Nt2uP+2z8wwx6+vbNNgTL11g=
Message-ID: <07f94688-55ed-407a-a11a-78a4feedf5e2@arm.com>
Date: Fri, 25 Sep 2026 17:40:41 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] kselftest: mm: prevent random failure of huge page
 split for khugepaged
To: Yeoreum Yun <yeoreum.yun@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924-fix_split-v8-0-cba7359d882a@arm.com>
 <20260924-fix_split-v8-1-cba7359d882a@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260924-fix_split-v8-1-cba7359d882a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/25/26 12:41 AM, Yeoreum Yun wrote:
> There're some random failure for split_huge_page_test when khugepaged
> collapses pages into pmd again which had split by the test.
> 
> Prevent the khugepaged's collapses for split page by setting the
> mapped pmd-huge-page with MADV_NOHUGEPAGE before split.
> 
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/mm/split_huge_page_test.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> index c5d96a4b1db3..ef4058662b91 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -108,6 +108,18 @@ static char *allocate_zero_filled_hugepage(size_t len)
>  	return result;
>  }
>  
> +static void disable_khugepaged(void *addr, size_t len)
> +{
> +	/*
> +	 * Disables khugepaged from collapsing THPs in range, existing THP

Should it be "collapsing pages in range into THPs" instead?

> +	 * pages remain.
> +	 */
> +	if (!madvise(addr, len, MADV_NOHUGEPAGE))
> +		return;
> +
> +	ksft_exit_fail_msg("MADV_NOHUGEPAGE failed, err=%d\n", errno);

I feel a ksft_exit_fail_perror() would be better here, since it will
automatically print strerror(errno) as well. Still, it is not something
that should require a respin of its own, so if you plan to respin for
some other changes, you might fold these changes in as well.

Rest looks good, so:

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

> +}
> +
>  static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hpages, size_t len)
>  {
>  	unsigned long rss_anon_before, rss_anon_after;
> @@ -120,6 +132,8 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
>  	if (!rss_anon_before)
>  		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
>  
> +	disable_khugepaged(one_page, len);
> +
>  	/* split all THPs */
>  	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
>  		      (uint64_t)one_page + len, 0);
> @@ -167,6 +181,8 @@ static void split_pmd_thp_to_order(int order)
>  	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 4, pmd_pagesize))
>  		ksft_exit_fail_msg("No THP is allocated\n");
>  
> +	disable_khugepaged(one_page, len);
> +
>  	/* split all THPs */
>  	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
>  		(uint64_t)one_page + len, order);
> @@ -215,6 +231,8 @@ static void split_pte_mapped_thp(void)
>  		goto out;
>  	}
>  
> +	disable_khugepaged(thp_area, thp_area_size);
> +
>  	/*
>  	 * To challenge spitting code, we will mremap a single page of each
>  	 * THP (page[i] of thp[i]) in the thp_area into page_area. This will
> @@ -482,6 +500,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
>  		ksft_test_result_skip("Pagecache folio split skipped\n");
>  		return -2;
>  	}
> +	disable_khugepaged(*addr, fd_size);
>  	return 0;
>  err_out_close:
>  	close(*fd);
> 

