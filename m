Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BDF3D891F;
	Fri, 25 Sep 2026 12:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340904; cv=none; b=tGs+QTXrYmwf0MM7EDD0+ssFPNPmUkDF0XrPgsig7stB+3gwr9U92EZOnKIOIQGv2fR1uWaAyPrQnhdlRn7ZveEAMqghdbP+RmhfRbsfA1nP53eRVqA3bY1Fs9cbNdBJ+320/b5Apc3+OVVBp5Qt8eeRc+Hox/CbjmzJQi+etwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340904; c=relaxed/simple;
	bh=j/85jN3gYWWQWBvqu4uwZCoLwy7OMcYx99dC/0gNZ/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aqzt2iMErlBzBYUgVBuI/woF2zX9j3lWtoaUdMQCXJIBvlxocrsc1orRKmusm8bZZRnl2rGE4cXp2d9wRPI5AQ7GaDYZK2xAdRB/VtRLClGhEAj/OoF3dFm7L4IA1eqEom4qa3t6uZZC92zH6Ws+mBnH+k6UQs041n1HcotaO8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=T2sDY/OT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="T2sDY/OT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6F40169C;
	Fri, 25 Sep 2026 05:54:57 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA2733F86C;
	Fri, 25 Sep 2026 05:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790340901; bh=j/85jN3gYWWQWBvqu4uwZCoLwy7OMcYx99dC/0gNZ/0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T2sDY/OT1wts5m+zf3YiB+h35c0wkFSU5O7wCdUM4ZIQDvj82832pGAwRVWgO6O4P
	 ls3SAOPMKxbCbE73jt4apBpB5wtgH643FtHhgqzeN2vytVostVCok9iKdS/zDUhGem
	 4aG0r2e4ya4jwiIvb3KUc+KaEx2ck1IE42sZpUG8=
Message-ID: <1dc9a608-16f0-445c-8e5d-a865d4ed0736@arm.com>
Date: Fri, 25 Sep 2026 18:24:52 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] kselftest: mm: integrate huge page checks
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
 <20260924-fix_split-v8-3-cba7359d882a@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260924-fix_split-v8-3-cba7359d882a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/25/26 12:41 AM, Yeoreum Yun wrote:
> check_large_folios() only checks for large folios without distinguishing
> between anonymous and file-backed huge pages.
> 
> To add huge page type checking, integrate the huge page checks into
> __check_huge():
> 
>   1. If hpage_size == pmd_pagesize, check PAGE_IS_HUGE instead of using
>      check_large_folios(), since only the mapping type matters. This
>      identifies PMD-mapped huge pages.
> 
>   2. Otherwise, use check_large_folios() to detect large folios. This
>      covers mTHP cases.
> 
>   3. Check the folio flags according to the huge page type.
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Suggested-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---

Looks good to me, some nits below.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

[...]

> -static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
> -		  uint64_t hpage_size, enum check_huge_type type)
> +static bool __check_huge(void *addr, size_t len, int nr_hpages,
> +		uint64_t hpage_size, enum check_huge_type type)
>  {
> -	int pagemap_fd;
> +	bool ret = false;
> +	int pagemap_fd, kpageflags_fd;
>  	int nr_pmd_mappings = 0;
> +	uint64_t pmd_pagesize, scan_mapping_size;
>  	uint64_t categories;
> +	unsigned long pfn;
> +	bool check_pmd_mapping, allow_nonpresent;
>  	char *start = addr;
>  	char *end = start + len;
>  
> +	pmd_pagesize = read_pmd_pagesize();
> +	if (!pmd_pagesize)
> +		ksft_exit_fail_msg("reading PMD pagesize failed\n");
> +
> +	check_pmd_mapping = hpage_size == pmd_pagesize;
> +	scan_mapping_size = (nr_hpages > 0) ? hpage_size : psize();
> +	/* Some mTHP tests check a partially populated PMD-sized range. */
> +	allow_nonpresent = (uint64_t)nr_hpages * hpage_size < len;
> +
>  	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
>  	if (pagemap_fd < 0)
>  		ksft_exit_fail_msg("open pagemap fail\n");
>  
> -	for (; start < end; start += hpage_size) {
> +	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
> +	if (kpageflags_fd < 0)
> +		ksft_exit_fail_msg("open kpageflags fail\n");

Again, can we change it to ksft_exit_fail_perror()?

> +
> +	if (!check_pmd_mapping &&
> +	    !check_large_folios(pagemap_fd, kpageflags_fd,
> +				addr, len, nr_hpages, hpage_size))
> +		goto out;
> +
> +	for (; start < end; start += scan_mapping_size) {
>  		categories = pagemap_scan_get_categories(pagemap_fd, start);
> -		if (!(categories & PAGE_IS_HUGE))
> -			continue;
> -		if (check_huge_type(categories, type))
> +		pfn = pagemap_get_pfn(pagemap_fd, start);
> +		if (pfn == -1UL) {
> +			if (!allow_nonpresent)
> +				goto out;
> +			else

Nit: We can skip this else here.

> +				continue;
> +		}
> +		if (check_pmd_mapping && (categories & PAGE_IS_HUGE))
>  			nr_pmd_mappings++;
> +		if (!check_huge_type(categories, type))
> +			goto out;
>  	}
> -	close(pagemap_fd);
>  
> -	return nr_hpages == nr_pmd_mappings;
> +	if (check_pmd_mapping && (nr_pmd_mappings != nr_hpages))
> +		goto out;
> +	ret = true;
> +
> +out:
> +	close(pagemap_fd);
> +	close(kpageflags_fd);
> +	return ret;
>  }
