Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58483CF1F0;
	Thu, 27 Aug 2026 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819301; cv=none; b=qdWwouHbfOktFQLcNAI4whKZKLIhWrPFT3YtN46/YlWyg3YkNjX5Gs87sEvx0Ey2l8CLYN8XMb2zW4DKlzJSnD4Ztybx+L3ez0t/NOeHZjGKqyh7F0HtnIjpziv8T8YSjxK3ITLmGZfkA58TaM9yQ3NvFIpEkLHjkfaqvS8o0tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819301; c=relaxed/simple;
	bh=giqeAkD1Vc9WT3IBTjcmjVEXQSQpBSGwdcKcXvjnzRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpLLh+3Hqeblyt/sNHc8GsR/MLjjT2uVSfM3TP9M6jyxWQzX/YOMKbBZ/JxKDeByESWq/nLb8gPfeg37Dg3D+OmpjD0oipn9j5wiWoGYno+s5VCDZoohGya066xA/07QTam1f4iTbaUe8wcKblIwSkTTnxOdZak5DShUA+Ngai0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=PgzkalWw; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="PgzkalWw"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787819285; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=7ZyKXiDcMnJRL/Jca9p3GNNTfZ89CGVivxP5tkkYlU4=;
	b=PgzkalWwZQeBO1KJOXcWmv3mKarhsMZgdBEoih7LZcF4TPs6BkQhuhkHCnkao1/Eo63u1plO4nsSS1dO49gfvIj3e7il0mJkWLMzxUmJfTBfpUbcb4hEb5zqndT2xaCU44MghwRWjAAVRUt1j3xv6xZkaVK2i7Bxzx4ZfKNFfW8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R881e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0X9j9eTi_1787819282;
Received: from 30.74.144.120(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X9j9eTi_1787819282 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 27 Aug 2026 16:28:03 +0800
Message-ID: <0107447a-7c1f-44f8-94fb-109b0f850677@linux.alibaba.com>
Date: Thu, 27 Aug 2026 16:28:01 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
To: Yeoreum Yun <yeoreum.yun@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
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
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260826-fix_split-v2-2-71153c7f579a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/26/26 8:24 PM, Yeoreum Yun wrote:
> Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
> glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> made by memalign().
> 
> The underlying VMA may start at a different address from the aligned
> address returned by memalign(). Furthermore, a subsequent
> madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
> already set.
> 
> This causes split_huge_page_test to fail because the check_huge_xxx()
> helpers incorrectly require the address returned by memalign() to
> match the VMA start address reported in /proc/self/smaps.
> 
> Fix this by using /proc/self/pagemap and /proc/kpageflags instead of
> /proc/self/smaps to detect huge pages.
> 
> Reported-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   tools/testing/selftests/mm/vm_util.c | 130 ++++++++++++++++++++---------------
>   tools/testing/selftests/mm/vm_util.h |   1 +
>   2 files changed, 77 insertions(+), 54 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index 4821a3563036..1d0959b3b9e8 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -351,31 +351,13 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
>   	return entry;
>   }
>   
> -static bool __check_pmd_huge(void *addr, char *pattern, int nr_hpages,
> -		  uint64_t hpage_size)
> -{
> -	char buffer[MAX_LINE_LENGTH];
> -	uint64_t thp = -1;
> -	char *entry;
> -
> -	entry = __get_smap_entry(addr, pattern, buffer, sizeof(buffer));
> -	if (!entry)
> -		goto err_out;
> -
> -	if (sscanf(entry, "%9" SCNu64 " kB", &thp) != 1)
> -		ksft_exit_fail_msg("Reading smap error\n");
> -
> -err_out:
> -	return thp == (nr_hpages * (hpage_size >> 10));
> -}
> -
> -static bool check_large_folios(void *addr, size_t len, int nr_hpages,
> -		uint64_t hpage_size)
> +static bool check_large_folios(int pagemap_fd, int kpageflags_fd,
> +			       void *addr, size_t len, int nr_hpages,
> +			       uint64_t hpage_size)
>   {
>   	int order = 0, pagesize = getpagesize();
>   	unsigned int nr_pages = hpage_size / pagesize;
>   	int orders[MAX_NR_ORDERS], status;
> -	int pagemap_fd, kpageflags_fd;
>   	bool ret = false;
>   
>   	if (!nr_pages)
> @@ -386,15 +368,6 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
>   		ksft_exit_fail_msg("invalid order\n");
>   
>   	memset(orders, 0, sizeof(int) * MAX_NR_ORDERS);
> -	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
> -	if (pagemap_fd == -1)
> -		ksft_exit_fail_msg("read pagemap fail\n");
> -
> -	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
> -	if (kpageflags_fd == -1) {
> -		close(pagemap_fd);
> -		ksft_exit_fail_msg("read kpageflags fail\n");
> -	}
>   
>   	status = gather_folio_orders(addr, len, pagemap_fd,
>   			kpageflags_fd, orders, MAX_NR_ORDERS);
> @@ -405,48 +378,97 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
>   		ret = true;
>   
>   out:
> -	close(pagemap_fd);
> -	close(kpageflags_fd);
>   	return ret;
>   }
>   
> -bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> +enum check_huge_type {
> +	CHECK_HUGE_ANON,
> +	CHECK_HUGE_FILE,
> +	CHECK_HUGE_SHMEM,
> +};
> +
> +static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
> +			     uint64_t hpage_size, enum check_huge_type type)

The original __check_pmd_huge() is only for PMD-sized large folios, but 
now it not only checks PMD-sized large folios but also mTHP large 
folios, which I find confusing. Please keep its original semantics, and 
only check PMD-sized large folios.

>   {
> -	uint64_t pmd_pagesize = read_pmd_pagesize();
> +	int pagemap_fd, kpageflags_fd;
> +	uint64_t pmd_pagesize, granule;
> +	uint64_t categories, kpf;
> +	unsigned long pfn;
> +	bool check_large, huge_mapped;
> +	char *start = addr;
> +	char *end = start + len;
>   
> +	pmd_pagesize = read_pmd_pagesize();
>   	if (!pmd_pagesize)
>   		ksft_exit_fail_msg("reading PMD pagesize failed\n");
>   
> -	if (hpage_size == pmd_pagesize)
> -		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
> +	if (nr_hpages > 0) {
> +		check_large = true;
> +		granule = hpage_size;
> +	} else {
> +		check_large = false;
> +		granule = psize();
> +	}

This is incorrect for the mTHP large folio check. I already hit a 
selftest failure. Please test your patches before sending them out.

[root@]./khugepaged -c 4 mthp_khugepaged:anon
TAP version 13
# Save THP and khugepaged settings... OK
1..4
# Allocate huge page on fault... OK
# Split huge PMD on MADV_DONTNEED... OK
ok 1 allocate on fault and split
#
# Run test: collapse_full (mthp_khugepaged:anon)
# Collapse multiple fully populated PTE table.... OK
ok 2 collapse_full
#
# Run test: collapse_empty (mthp_khugepaged:anon)
# Do not collapse empty PTE table.... OK
ok 3 collapse_empty
#
# Run test: collapse_single_mthp (mthp_khugepaged:anon)
# Collapse PTE table with half PTE entries present.... Fail
not ok 4 collapse_single_mthp
# Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0


> -	return check_large_folios(addr, len, nr_hpages, hpage_size);
> -}
> +	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
> +	if (pagemap_fd < 0)
> +		ksft_exit_fail_msg("open pagemap fail\n");
>   
> -bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> -{
> -	uint64_t pmd_pagesize = read_pmd_pagesize();
> +	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
> +	if (kpageflags_fd < 0) {
> +		close(pagemap_fd);
> +		ksft_exit_fail_msg("open kpageflags fail\n");
> +	}
>   
> -	if (!pmd_pagesize)
> -		ksft_exit_fail_msg("reading PMD pagesize failed\n");
> +	if (check_large && !check_large_folios(pagemap_fd, kpageflags_fd,
> +					       addr, len, nr_hpages, hpage_size))
> +		goto out;
>   
> -	if (hpage_size == pmd_pagesize)
> -		return __check_pmd_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
> +	for (; start < end; start += granule) {
> +		categories = pagemap_scan_get_categories(pagemap_fd, start);
> +		pfn = pagemap_get_pfn(pagemap_fd, start);
> +		if (pfn == -1UL) {
> +			if (check_large)
> +				goto out;
> +			else
> +				continue;
> +		}
> +		if (pageflags_get(pfn, kpageflags_fd, &kpf))
> +			ksft_exit_fail_msg("read kpageflags: %s\n", strerror(errno));
> +		huge_mapped = categories & PAGE_IS_HUGE;
> +		if (check_large != huge_mapped) {
> +			if (!check_large || granule == pmd_pagesize)
> +				goto out;
> +		}
> +		if (kpf & KPF_COMPOUND_TAIL)
> +			continue;
> +		if (!!(categories & PAGE_IS_FILE) != (type != CHECK_HUGE_ANON))
> +			goto out;
> +		if (type == CHECK_HUGE_ANON)
> +			continue;
> +		if (!!(kpf & KPF_SWAPBACKED) != (type != CHECK_HUGE_FILE))
> +			goto out;
> +	}
>   
> -	return check_large_folios(addr, len, nr_hpages, hpage_size);
> +out:
> +	close(pagemap_fd);
> +	close(kpageflags_fd);
> +	return start >= end;
>   }
>   
> -bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> +bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
>   {
> -	uint64_t pmd_pagesize = read_pmd_pagesize();
> -
> -	if (!pmd_pagesize)
> -		ksft_exit_fail_msg("reading PMD pagesize failed\n");
> +	return __check_pmd_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_ANON);
> +}
>   
> -	if (hpage_size == pmd_pagesize)
> -		return __check_pmd_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);
> +bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> +{
> +	return __check_pmd_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_FILE);
> +}
>   
> -	return check_large_folios(addr, len, nr_hpages, hpage_size);
> +bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> +{
> +	return __check_pmd_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_SHMEM);
>   }
>   
>   int64_t allocate_transhuge(void *ptr, int pagemap_fd)
> diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
> index 9a49af88702e..f19bd17817e5 100644
> --- a/tools/testing/selftests/mm/vm_util.h
> +++ b/tools/testing/selftests/mm/vm_util.h
> @@ -18,6 +18,7 @@
>   #define PM_SWAP                       BIT_ULL(62)
>   #define PM_PRESENT                    BIT_ULL(63)
>   
> +#define KPF_SWAPBACKED                BIT_ULL(14)
>   #define KPF_COMPOUND_HEAD             BIT_ULL(15)
>   #define KPF_COMPOUND_TAIL             BIT_ULL(16)
>   #define KPF_HWPOISON                  BIT_ULL(19)
> 

