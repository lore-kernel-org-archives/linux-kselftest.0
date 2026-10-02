Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB123815E4;
	Fri,  2 Oct 2026 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930644; cv=none; b=k1ovLIZmYM7pTkElWOkS73rqh0QguOuVYdpJj4yMowoC61JpJK+GooJg58A/DziE62z0g+Q/qO7DEgC20bjhkQWyeOKQtvoRDGW9WfXzFGPVvSb/H5hpb50UzySyET7uLBUyr/LE4ZBjBVu4qVsB9FY42IJLbGTAMHezCfQ0Abg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930644; c=relaxed/simple;
	bh=WMXtorft3yFSsxaaQVsOoB9M+UsRVtahEneyXQcysGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/o0uDU7Rsgu63ai5xx0KvZWJCVpWKAOhEbJikeVIxO0bgevHej3FpPtf0xpRLrcMbzD1QFYjvTk7ew4RoBUms2nTEt30Ijl5wenj3ygThWfR5CVrEBVDakNtzyormJpPbzh6opMNf3UvqIfHYqaOYDoPbusSnc/lx1Eq3RED9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vwe8P+39; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vwe8P+39"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858461F000FF;
	Fri,  2 Oct 2026 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930642;
	bh=QaW3NvlDbie2nX8q04QLao6HBP5b6PgxRU/jNxrvHlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vwe8P+39JCuHBizogmo2GNh1ALOKZtDQnio60+ojHg0sgpeiqScLp79z3mbw02V8F
	 EYxN83kKfoU1dBWiYlTSNvqPO1sv2qLGQOHtGQ88RqyFySjslidqooaKnggLK/gJKG
	 IWC5bqdlh9R7rDJ83vR8KTnnawGa9boU4Lb7HKydbTNBsoXeXWf2WMnkMILp6bICUN
	 iHO/PMicuO4lycVHpnBubmnWdEzmOyVRE765syr056W+9jA4+6LnbRxAw4zEa6ohWa
	 6CAE+VUsdlJvbi6bS41ZcL7w0M7FG61svR56MHeK92o8dhMmvZCsTExm2N2AYdnoxH
	 W1EwRBuRDq0NQ==
Date: Fri, 2 Oct 2026 09:43:55 +0100
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
	linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH v9 2/4] kselftest: mm: replace usage of /proc/self/smaps
 for __check_pmd_huge()
Message-ID: <ar9utGn5OEWjZUd9@gremlin>
References: <20261001-fix_split-v9-0-0f4ba8bbdbdf@arm.com>
 <20261001-fix_split-v9-2-0f4ba8bbdbdf@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001-fix_split-v9-2-0f4ba8bbdbdf@arm.com>

On Thu, Oct 01, 2026 at 10:17:52PM +0100, Yeoreum Yun wrote:
> Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
> glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> made by memalign().
>
> The underlying VMA may start at a different address from the aligned
> address returned by memalign(). Furthermore, a subsequent
> madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
> already set.
>
> This causes split_huge_page_test to fail because the check_pmd_huge()
> helpers incorrectly require the address returned by memalign() to
> match the VMA start address reported in /proc/self/smaps.
>
> Instead of relying on /proc/self/smaps, use /proc/self/pagemap and
> /proc/kpageflags to detect huge-page mappings checking PAGE_IS_HUGE
> and PAGE_IS_FILE according to type of huge page.
>
> Since shmem pages are also file-backed, simply check whether the page
> is file-backed.
>
> Fixes: 642bc52aed9c ("selftests: vm: bring common functions to a new file")
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

LGTM so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks for doing this! :)

> ---
>  tools/testing/selftests/mm/vm_util.c | 78 ++++++++++++++++++++++--------------
>  1 file changed, 49 insertions(+), 29 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index a0ab78ceedb1..a3c3a2706c22 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -351,24 +351,6 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
>  	return entry;
>  }
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
>  static bool check_large_folios(void *addr, size_t len, int nr_hpages,
>  		uint64_t hpage_size)
>  {
> @@ -410,20 +392,51 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
>  	return ret;
>  }
>
> -bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> +enum check_huge_type {
> +	CHECK_HUGE_ANON,
> +	CHECK_HUGE_FILE,
> +};
> +
> +static bool check_huge_type(uint64_t categories, enum check_huge_type type)
>  {
> -	uint64_t pmd_pagesize = read_pmd_pagesize();
> +	const bool file = categories & PAGE_IS_FILE;
>
> -	if (!pmd_pagesize)
> -		ksft_exit_fail_msg("reading PMD pagesize failed\n");
> +	switch (type) {
> +	case CHECK_HUGE_ANON:
> +		return !file;
> +	case CHECK_HUGE_FILE:
> +		return file;
> +	}
>
> -	if (hpage_size == pmd_pagesize)
> -		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
> +	return false;
> +}
>
> -	return check_large_folios(addr, len, nr_hpages, hpage_size);
> +static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
> +		  uint64_t hpage_size, enum check_huge_type type)
> +{
> +	int pagemap_fd;
> +	int nr_pmd_mappings = 0;
> +	uint64_t categories;
> +	char *start = addr;
> +	char *end = start + len;
> +
> +	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
> +	if (pagemap_fd < 0)
> +		ksft_exit_fail_perror("open pagemap");
> +
> +	for (; start < end; start += hpage_size) {
> +		categories = pagemap_scan_get_categories(pagemap_fd, start);
> +		if (!(categories & PAGE_IS_HUGE))
> +			continue;
> +		if (check_huge_type(categories, type))
> +			nr_pmd_mappings++;
> +	}
> +	close(pagemap_fd);
> +
> +	return nr_hpages == nr_pmd_mappings;
>  }
>
> -bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> +bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
>  {
>  	uint64_t pmd_pagesize = read_pmd_pagesize();
>
> @@ -431,12 +444,13 @@ bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
>  		ksft_exit_fail_msg("reading PMD pagesize failed\n");
>
>  	if (hpage_size == pmd_pagesize)
> -		return __check_pmd_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
> +		return __check_pmd_huge(addr, len, nr_hpages, hpage_size,
> +					CHECK_HUGE_ANON);
>
>  	return check_large_folios(addr, len, nr_hpages, hpage_size);
>  }
>
> -bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> +bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
>  {
>  	uint64_t pmd_pagesize = read_pmd_pagesize();
>
> @@ -444,11 +458,17 @@ bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size
>  		ksft_exit_fail_msg("reading PMD pagesize failed\n");
>
>  	if (hpage_size == pmd_pagesize)
> -		return __check_pmd_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);
> +		return __check_pmd_huge(addr, len, nr_hpages, hpage_size,
> +					CHECK_HUGE_FILE);
>
>  	return check_large_folios(addr, len, nr_hpages, hpage_size);
>  }
>
> +bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> +{
> +	return check_huge_file(addr, len, nr_hpages, hpage_size);
> +}
> +
>  int64_t allocate_transhuge(void *ptr, int pagemap_fd)
>  {
>  	uint64_t ent[2];
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
