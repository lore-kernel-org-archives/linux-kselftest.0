Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87CC3F44EC;
	Thu, 27 Aug 2026 10:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828189; cv=none; b=lH2McXYmlaaRcbv9T31xZuJRYT/lzW9OJrbxkBjHW2PhoSJy+EtuXkg4r/nGXfxQ8vHXwouhLjG1KW5IJO0Ip4HQ+qcCpp0k1XrlLmmCaPaC6On7d8CZm//ygEfusGXh+yXi48hWBzmXPco16YRiQby4knKFY6HnCV++2I8kYuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828189; c=relaxed/simple;
	bh=aeLOKipWhz7t3kYjsBn/bJ0T5mlSlbCPe9WPUdSgV/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqFQ5QLpEDVX3U712/uROBT4FWfW+HRb6sYemd585fCFA8hYB1Z5dfZuMb2e61f7x+y/G1Ki0M1ledLdOOovk3WiLk/jISPe1MaLCpTXsJ3rYcowYCg0BpvCwEmXcG3CLCqgeDYLpLpu9OmDOoKXN6BfKPHBMBEPjez838qST9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqAkKGTh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqAkKGTh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884EE1F000E9;
	Thu, 27 Aug 2026 10:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787828187;
	bh=NFSoHGGqxxziGMu2IRcDTRzduPnwUAK7ed4z65urCyM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hqAkKGThxGJWMDhKFcSqIWlnjHYbdxq1MeNgfjxCRuLwN4q6Unx/ArGi1iZEnVRvu
	 Iv7dJcszqIzAJbFJsWXjHXD1+RsWJUxwC8j5Ks+evINia+X5Ozh67I5DYAQ53x2sA6
	 ImjOty7oGpySiMZzOvF75EtrAk5qVpXX2dRmif+/T1O+/UGu9i7E+5tmYuVhWNWUxV
	 wbTlrMwiZOTS1625hnk4jnRHRraUo038M1/ftEcQCVtClBMO5Gf4u42PMvrCDsm8nG
	 jGP7E7920p8wsb0FNIMiK5eJs+xLOaIUtwoG3yz1aEZq1G4QC1bOBA7M+Oag9b2hiT
	 1xm3sIdxFgf9g==
Message-ID: <44d36fb6-fdf4-4a8b-8e74-084a4b4f802e@kernel.org>
Date: Thu, 27 Aug 2026 12:56:20 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260826-fix_split-v2-0-71153c7f579a@arm.com>
 <20260826-fix_split-v2-2-71153c7f579a@arm.com>
 <0107447a-7c1f-44f8-94fb-109b0f850677@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <0107447a-7c1f-44f8-94fb-109b0f850677@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/27/26 10:28, Baolin Wang wrote:
> 
> 
> On 8/26/26 8:24 PM, Yeoreum Yun wrote:
>> Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
>> glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
>> made by memalign().
>>
>> The underlying VMA may start at a different address from the aligned
>> address returned by memalign(). Furthermore, a subsequent
>> madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
>> already set.
>>
>> This causes split_huge_page_test to fail because the check_huge_xxx()
>> helpers incorrectly require the address returned by memalign() to
>> match the VMA start address reported in /proc/self/smaps.
>>
>> Fix this by using /proc/self/pagemap and /proc/kpageflags instead of
>> /proc/self/smaps to detect huge pages.
>>
>> Reported-by: David Hildenbrand (Arm) <david@kernel.org>
>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> ---
>>   tools/testing/selftests/mm/vm_util.c | 130 ++++++++++++++++++++---------------
>>   tools/testing/selftests/mm/vm_util.h |   1 +
>>   2 files changed, 77 insertions(+), 54 deletions(-)
>>
>> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/
>> mm/vm_util.c
>> index 4821a3563036..1d0959b3b9e8 100644
>> --- a/tools/testing/selftests/mm/vm_util.c
>> +++ b/tools/testing/selftests/mm/vm_util.c
>> @@ -351,31 +351,13 @@ char *__get_smap_entry(void *addr, const char *pattern,
>> char *buf, size_t len)
>>       return entry;
>>   }
>>   -static bool __check_pmd_huge(void *addr, char *pattern, int nr_hpages,
>> -          uint64_t hpage_size)
>> -{
>> -    char buffer[MAX_LINE_LENGTH];
>> -    uint64_t thp = -1;
>> -    char *entry;
>> -
>> -    entry = __get_smap_entry(addr, pattern, buffer, sizeof(buffer));
>> -    if (!entry)
>> -        goto err_out;
>> -
>> -    if (sscanf(entry, "%9" SCNu64 " kB", &thp) != 1)
>> -        ksft_exit_fail_msg("Reading smap error\n");
>> -
>> -err_out:
>> -    return thp == (nr_hpages * (hpage_size >> 10));
>> -}
>> -
>> -static bool check_large_folios(void *addr, size_t len, int nr_hpages,
>> -        uint64_t hpage_size)
>> +static bool check_large_folios(int pagemap_fd, int kpageflags_fd,
>> +                   void *addr, size_t len, int nr_hpages,
>> +                   uint64_t hpage_size)
>>   {
>>       int order = 0, pagesize = getpagesize();
>>       unsigned int nr_pages = hpage_size / pagesize;
>>       int orders[MAX_NR_ORDERS], status;
>> -    int pagemap_fd, kpageflags_fd;
>>       bool ret = false;
>>         if (!nr_pages)
>> @@ -386,15 +368,6 @@ static bool check_large_folios(void *addr, size_t len,
>> int nr_hpages,
>>           ksft_exit_fail_msg("invalid order\n");
>>         memset(orders, 0, sizeof(int) * MAX_NR_ORDERS);
>> -    pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
>> -    if (pagemap_fd == -1)
>> -        ksft_exit_fail_msg("read pagemap fail\n");
>> -
>> -    kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
>> -    if (kpageflags_fd == -1) {
>> -        close(pagemap_fd);
>> -        ksft_exit_fail_msg("read kpageflags fail\n");
>> -    }
>>         status = gather_folio_orders(addr, len, pagemap_fd,
>>               kpageflags_fd, orders, MAX_NR_ORDERS);
>> @@ -405,48 +378,97 @@ static bool check_large_folios(void *addr, size_t len,
>> int nr_hpages,
>>           ret = true;
>>     out:
>> -    close(pagemap_fd);
>> -    close(kpageflags_fd);
>>       return ret;
>>   }
>>   -bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t
>> hpage_size)
>> +enum check_huge_type {
>> +    CHECK_HUGE_ANON,
>> +    CHECK_HUGE_FILE,
>> +    CHECK_HUGE_SHMEM,
>> +};
>> +
>> +static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
>> +                 uint64_t hpage_size, enum check_huge_type type)
> 
> The original __check_pmd_huge() is only for PMD-sized large folios, but now it
> not only checks PMD-sized large folios but also mTHP large folios, which I find
> confusing. Please keep its original semantics, and only check PMD-sized large
> folios.
> 
>>   {
>> -    uint64_t pmd_pagesize = read_pmd_pagesize();
>> +    int pagemap_fd, kpageflags_fd;
>> +    uint64_t pmd_pagesize, granule;
>> +    uint64_t categories, kpf;
>> +    unsigned long pfn;
>> +    bool check_large, huge_mapped;
>> +    char *start = addr;
>> +    char *end = start + len;
>>   +    pmd_pagesize = read_pmd_pagesize();
>>       if (!pmd_pagesize)
>>           ksft_exit_fail_msg("reading PMD pagesize failed\n");
>>   -    if (hpage_size == pmd_pagesize)
>> -        return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
>> +    if (nr_hpages > 0) {
>> +        check_large = true;
>> +        granule = hpage_size;
>> +    } else {
>> +        check_large = false;
>> +        granule = psize();
>> +    }
> 
> This is incorrect for the mTHP large folio check. I already hit a selftest
> failure. Please test your patches before sending them out.
> 
> [root@]./khugepaged -c 4 mthp_khugepaged:anon
> TAP version 13
> # Save THP and khugepaged settings... OK
> 1..4
> # Allocate huge page on fault... OK
> # Split huge PMD on MADV_DONTNEED... OK
> ok 1 allocate on fault and split
> #
> # Run test: collapse_full (mthp_khugepaged:anon)
> # Collapse multiple fully populated PTE table.... OK
> ok 2 collapse_full
> #
> # Run test: collapse_empty (mthp_khugepaged:anon)
> # Do not collapse empty PTE table.... OK
> ok 3 collapse_empty
> #
> # Run test: collapse_single_mthp (mthp_khugepaged:anon)
> # Collapse PTE table with half PTE entries present.... Fail
> not ok 4 collapse_single_mthp
> # Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0

FWIW, the CI flags this as well:

https://github.com/linux-mm/linux-mm/actions/runs/33028595020/job/98375618491

-- 
Cheers,

David
