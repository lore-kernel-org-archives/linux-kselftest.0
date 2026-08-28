Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ACF3F107F;
	Fri, 28 Aug 2026 01:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787878836; cv=none; b=B9apMXVWsbuu2Ets92OrzHj1PBcFlmT1bZAE9+N/ZrX4iz0rTRIBHFC9iYtnR3vQicOEpFlJlC5sJxLa5BQLQ5gmWGA3Pa4CVBXIHau9/Es8kJWqT7i4EIMhXPm4zPdn6EQwltnLpgqET9C+F+i6RGcLTY7GC/QkY44ufAaJdb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787878836; c=relaxed/simple;
	bh=fs2hvbO7iWbwwGiGXrBMjMIOMxteSXx/qxFGMHeV35k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzutAO0IA9UonweVxf67hclYyLllPLO7IP++nTI2+5438NTRuDfIV3r2yAUtxO5VXif5Sglcf7cRAEMaN2ORIcjZfS0poOpSiOODhFwZuKXFxv3dChnGxyiXP5iIH97Et+OPhp8g7IvKn26dR2jLCi4JzvW7oGbELAAd6scIH7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=RQIcawO1; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="RQIcawO1"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787878824; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=XHRViBtgSocj7ST9LHbAW0j4BF79ADX7KgqA3w9ixWU=;
	b=RQIcawO1AqmKedgsccY+EiaJNkmFOXr04nRk15QccbCp0NFKfMZw5yJ36XpPn7UACMq4MkkHC6dsZqQ4wv7bwl2fgeqCN/y2lZWYMrihoEI+hQrgg3kYFYCezx2hYWNA+2KZQiBQgFYO78c3IavS7ZLYOBXFjXmpNeaUmMNQPkE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0X9kg5WH_1787878821;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X9kg5WH_1787878821 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 28 Aug 2026 09:00:22 +0800
Message-ID: <31e649d3-7653-49c0-b73e-933ba2a86f4a@linux.alibaba.com>
Date: Fri, 28 Aug 2026 09:00:20 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
To: Yeoreum Yun <yeoreum.yun@arm.com>, Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826-fix_split-v2-0-71153c7f579a@arm.com>
 <20260826-fix_split-v2-2-71153c7f579a@arm.com>
 <0107447a-7c1f-44f8-94fb-109b0f850677@linux.alibaba.com>
 <apAVAvfxZSeEvf50@e129823.arm.com> <DKZTG6MI4EI2.35PCXKS36M1DY@nvidia.com>
 <apBruUeQoCgP_Mhh@e129823.arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <apBruUeQoCgP_Mhh@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/28/26 12:54 AM, Yeoreum Yun wrote:
> On Thu, Aug 27, 2026 at 11:03:17AM -0400, Zi Yan wrote:
>> On Thu Aug 27, 2026 at 6:44 AM EDT, Yeoreum Yun wrote:
>>> Hi Baolin,
>>>
>>>>
>>>>
>>>> On 8/26/26 8:24 PM, Yeoreum Yun wrote:
>>>>> Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
>>>>> glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
>>>>> made by memalign().
>>>>>
>>>>> The underlying VMA may start at a different address from the aligned
>>>>> address returned by memalign(). Furthermore, a subsequent
>>>>> madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
>>>>> already set.
>>>>>
>>>>> This causes split_huge_page_test to fail because the check_huge_xxx()
>>>>> helpers incorrectly require the address returned by memalign() to
>>>>> match the VMA start address reported in /proc/self/smaps.
>>>>>
>>>>> Fix this by using /proc/self/pagemap and /proc/kpageflags instead of
>>>>> /proc/self/smaps to detect huge pages.
>>>>>
>>>>> Reported-by: David Hildenbrand (Arm) <david@kernel.org>
>>>>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>>>> ---
>>>>>    tools/testing/selftests/mm/vm_util.c | 130 ++++++++++++++++++++---------------
>>>>>    tools/testing/selftests/mm/vm_util.h |   1 +
>>>>>    2 files changed, 77 insertions(+), 54 deletions(-)
>>>>>
>>>>> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
>>>>> index 4821a3563036..1d0959b3b9e8 100644
>>>>> --- a/tools/testing/selftests/mm/vm_util.c
>>>>> +++ b/tools/testing/selftests/mm/vm_util.c
>>>>> @@ -351,31 +351,13 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
>>>>>    	return entry;
>>>>>    }
>>>>> -static bool __check_pmd_huge(void *addr, char *pattern, int nr_hpages,
>>>>> -		  uint64_t hpage_size)
>>>>> -{
>>>>> -	char buffer[MAX_LINE_LENGTH];
>>>>> -	uint64_t thp = -1;
>>>>> -	char *entry;
>>>>> -
>>>>> -	entry = __get_smap_entry(addr, pattern, buffer, sizeof(buffer));
>>>>> -	if (!entry)
>>>>> -		goto err_out;
>>>>> -
>>>>> -	if (sscanf(entry, "%9" SCNu64 " kB", &thp) != 1)
>>>>> -		ksft_exit_fail_msg("Reading smap error\n");
>>>>> -
>>>>> -err_out:
>>>>> -	return thp == (nr_hpages * (hpage_size >> 10));
>>>>> -}
>>>>> -
>>>>> -static bool check_large_folios(void *addr, size_t len, int nr_hpages,
>>>>> -		uint64_t hpage_size)
>>>>> +static bool check_large_folios(int pagemap_fd, int kpageflags_fd,
>>>>> +			       void *addr, size_t len, int nr_hpages,
>>>>> +			       uint64_t hpage_size)
>>>>>    {
>>>>>    	int order = 0, pagesize = getpagesize();
>>>>>    	unsigned int nr_pages = hpage_size / pagesize;
>>>>>    	int orders[MAX_NR_ORDERS], status;
>>>>> -	int pagemap_fd, kpageflags_fd;
>>>>>    	bool ret = false;
>>>>>    	if (!nr_pages)
>>>>> @@ -386,15 +368,6 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
>>>>>    		ksft_exit_fail_msg("invalid order\n");
>>>>>    	memset(orders, 0, sizeof(int) * MAX_NR_ORDERS);
>>>>> -	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
>>>>> -	if (pagemap_fd == -1)
>>>>> -		ksft_exit_fail_msg("read pagemap fail\n");
>>>>> -
>>>>> -	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
>>>>> -	if (kpageflags_fd == -1) {
>>>>> -		close(pagemap_fd);
>>>>> -		ksft_exit_fail_msg("read kpageflags fail\n");
>>>>> -	}
>>>>>    	status = gather_folio_orders(addr, len, pagemap_fd,
>>>>>    			kpageflags_fd, orders, MAX_NR_ORDERS);
>>>>> @@ -405,48 +378,97 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
>>>>>    		ret = true;
>>>>>    out:
>>>>> -	close(pagemap_fd);
>>>>> -	close(kpageflags_fd);
>>>>>    	return ret;
>>>>>    }
>>>>> -bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
>>>>> +enum check_huge_type {
>>>>> +	CHECK_HUGE_ANON,
>>>>> +	CHECK_HUGE_FILE,
>>>>> +	CHECK_HUGE_SHMEM,
>>>>> +};
>>>>> +
>>>>> +static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
>>>>> +			     uint64_t hpage_size, enum check_huge_type type)
>>>>
>>>> The original __check_pmd_huge() is only for PMD-sized large folios, but now
>>>> it not only checks PMD-sized large folios but also mTHP large folios, which
>>>> I find confusing. Please keep its original semantics, and only check
>>>> PMD-sized large folios.
>>>
>>> But, It seems to valuable to check other page-flags than checking
>>> the large-folio only.
>>>
>>>>
>>>>>    {
>>>>> -	uint64_t pmd_pagesize = read_pmd_pagesize();
>>>>> +	int pagemap_fd, kpageflags_fd;
>>>>> +	uint64_t pmd_pagesize, granule;
>>>>> +	uint64_t categories, kpf;
>>>>> +	unsigned long pfn;
>>>>> +	bool check_large, huge_mapped;
>>>>> +	char *start = addr;
>>>>> +	char *end = start + len;
>>>>> +	pmd_pagesize = read_pmd_pagesize();
>>>>>    	if (!pmd_pagesize)
>>>>>    		ksft_exit_fail_msg("reading PMD pagesize failed\n");
>>>>> -	if (hpage_size == pmd_pagesize)
>>>>> -		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
>>>>> +	if (nr_hpages > 0) {
>>>>> +		check_large = true;
>>>>> +		granule = hpage_size;
>>>>> +	} else {
>>>>> +		check_large = false;
>>>>> +		granule = psize();
>>>>> +	}
>>>>
>>>> This is incorrect for the mTHP large folio check. I already hit a selftest
>>>> failure. Please test your patches before sending them out.
>>>
>>> Since for a split case, large folio can be as-is but only remove
>>> the PMD mapping only, skipping the large_folio checking seems valid
>>> when nr_hpage is 0.
>>
>> What split care are you referring to? split_huge_page_test() always
>> splits the folio.
> 
> Not for split_huge_page_test case but for khugepage testcase like
> collapse_full_of_compound() test.
> 
>>
>>>
>>> And the failure of test seems because of unmapped area after
>>> changinng the collapse-order. Therefore, it seems to fine with below
>>> patch:
>>>
>>> ---------------&<----------------------
>>>
>>> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
>>> index 1d0959b3b9e8..f174a76d2310 100644
>>> --- a/tools/testing/selftests/mm/vm_util.c
>>> +++ b/tools/testing/selftests/mm/vm_util.c
>>> @@ -387,14 +387,14 @@ enum check_huge_type {
>>>          CHECK_HUGE_SHMEM,
>>>   };
>>>
>>> -static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
>>> -                            uint64_t hpage_size, enum check_huge_type type)
>>> +static bool __check_huge(void *addr, size_t len, int nr_hpages,
>>> +                        uint64_t hpage_size, enum check_huge_type type)
>>>   {
>>>          int pagemap_fd, kpageflags_fd;
>>>          uint64_t pmd_pagesize, granule;
>>>          uint64_t categories, kpf;
>>>          unsigned long pfn;
>>> -       bool check_large, huge_mapped;
>>> +       bool check_large, check_huge_mapped, allow_nomap;
>>>          char *start = addr;
>>>          char *end = start + len;
>>>
>>> @@ -405,11 +405,20 @@ static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
>>>          if (nr_hpages > 0) {
>>>                  check_large = true;
>>>                  granule = hpage_size;
>>> +               if (granule == pmd_pagesize)
>>> +                       check_huge_mapped = true;
>>> +               else
>>> +                       check_huge_mapped = false;
>>>          } else {
>>>                  check_large = false;
>>>                  granule = psize();
>>>          }
>>
>> The else is for nr_hpages == 0? But it looks like we allow negative
>> nr_hpages. Maybe add a bool expect_huge = nr_hpages > 0 to make it
>> explicit.
> 
> Fair enough. I'll change.
> 
>>
>> granule is an optimization for PAGE_IS_HUGE scanning? When we expect a
>> PMD mapping, we just scan at pmd_pagesize granularity, otherwise we
>> check every single page?
>>
>> At the high level, the function looks good to me, the rules are:
>>
>> 1. if hpage_size == pmd_pagesize, we need to check PAGE_IS_HUGE and
>> check_large_folio() can be skipped, since we only care about mappings.
>> This checks for PMD mappings.
>>
>> 2. in other cases, check_large_folios() is always needed. This is for
>> mTHP checks.

Yes, this is also what I thought. And the following code looks good to 
me. Thanks.

> Exactly, but for some testcase where use this function, doesn't
> trigger split of large _folio but only check the HUGE MAP is removed
> (nr_hpage == 0), it skips the chekc_large_folio().
> 
>>
>> I think the ifs at the beginning is confusing. Can we do something like
>> below to get rid of the ifs? I also moved KPF_* checks in a separate
>> function. Feel free to make changes if you find any issue there.
>>
>> static bool check_huge_type(uint64_t categories, uint64_t kpageflags,
>> 			    enum check_huge_type type)
>> {
>> 	bool file = categories & PAGE_IS_FILE;
>> 	bool swapbacked = kpageflags & KPF_SWAPBACKED;
>>
>> 	switch (type) {
>> 	case CHECK_HUGE_ANON:
>> 		return !file;
>> 	case CHECK_HUGE_FILE:
>> 		return file && !swapbacked;
>> 	case CHECK_HUGE_SHMEM:
>> 		return file && swapbacked;
>> 	}
>>
>> 	return false;
>> }
>>
>> static bool __check_huge(void *addr, size_t len, int nr_hpages,
>> 			 uint64_t hpage_size, enum check_huge_type type)
>> {
>> 	int pagemap_fd, kpageflags_fd;
>> 	int nr_pmd_mappings = 0;
>> 	uint64_t pmd_pagesize, scan_mapping_size;
>> 	uint64_t categories, kpf;
>> 	unsigned long pfn;
>> 	bool check_pmd_mapping;
>> 	bool allow_nonpresent;
>> 	bool ret = false;
>> 	char *start = addr;
>> 	char *end = start + len;
>>
>> 	pmd_pagesize = read_pmd_pagesize();
>> 	if (!pmd_pagesize)
>> 		ksft_exit_fail_msg("reading PMD pagesize failed\n");
>>
>> 	check_pmd_mapping = hpage_size == pmd_pagesize;
>> 	scan_mapping_size = nr_hpages > 0 ? hpage_size : psize();
>> 	/* Some mTHP tests check a partially populated PMD-sized range. */
>> 	allow_nonpresent = (uint64_t)nr_hpages * hpage_size < len;
>>
>> 	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
>> 	if (pagemap_fd < 0)
>> 		ksft_exit_fail_msg("open pagemap fail\n");
>>
>> 	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
>> 	if (kpageflags_fd < 0) {
>> 		close(pagemap_fd);
>> 		ksft_exit_fail_msg("open kpageflags fail\n");
>> 	}
>>
>> 	/* PTE-mapped large folios cannot be identified by PAGE_IS_HUGE. */
>> 	if (!check_pmd_mapping &&
>> 	    !check_large_folios(pagemap_fd, kpageflags_fd, addr, len,
>> 				 nr_hpages, hpage_size))
>> 		goto out;
>>
>> 	for (; start < end; start += scan_mapping_size) {
>> 		categories = pagemap_scan_get_categories(pagemap_fd, start);
>> 		pfn = pagemap_get_pfn(pagemap_fd, start);
>> 		if (pfn == -1UL) {
>> 			if (!allow_nonpresent)
>> 				goto out;
>> 			continue;
>> 		}
>> 		if (pageflags_get(pfn, kpageflags_fd, &kpf))
>> 			ksft_exit_fail_msg("read kpageflags: %s\n", strerror(errno));
>> 		if (check_pmd_mapping && (categories & PAGE_IS_HUGE))
>> 			nr_pmd_mappings++;
>> 		if (kpf & KPF_COMPOUND_TAIL)
>> 			continue;
>> 		if (!check_huge_type(categories, kpf, type))
>> 			goto out;
>> 	}
>> 	if (check_pmd_mapping && nr_pmd_mappings != nr_hpages)
>> 		goto out;
> 
> Again, because of collapse_full_of_compound() testcase,
> it would be failed for this. so, it would better to skip
> check_large_folioes() when nr_hpages is 0.

IIUC, when nr_hpages is 0, we should also call check_large_folios() to 
verify that there are no large folios within this address range, which 
is also what the previous code did.

Also, I tried Zi's code, and it passed all my khugepaged selftests. I'm 
not sure why you saw the collapse_full_of_compound() test case fail.
