Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D0C4F85DA;
	Mon, 21 Sep 2026 18:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016491; cv=none; b=V5EGZ+237FwMeuBbwVyfsLFlHkHUDKaENPE+QGjfnUKRksHF/PfYG5cUevvYC52HyfHaAmLQasa3JNbChJh6vTcpIDp8bkXlF/O36sbEVWZ8Xk0Yt1R1Mrsh24C/n+Il705v8oruEIFEON1gFDGin0XdyGo0gFOXobAx1G3SDjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016491; c=relaxed/simple;
	bh=YM+1/gq/RepS0kNvZW6wyJeC+DF4kRB26NAW1AqaE/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vp1vne9HhBP362eHDRZgPQrn125QI5ch2RRfkWkcueMXmL65y96SjyCTYvmoYoyV1gzJP21t0guwbCLkJZ7gMXSWNKGtqykpIHavsnhgt0dLHHjQi30DiXnEEhjUMRQ2DTU9VeSPs8NsExr+7/2yJdMFO8tDHEmlFN50loy/6nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oBY+bShy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oBY+bShy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A0CA19F6;
	Mon, 21 Sep 2026 11:48:03 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D60F3F632;
	Mon, 21 Sep 2026 11:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790016486; bh=YM+1/gq/RepS0kNvZW6wyJeC+DF4kRB26NAW1AqaE/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oBY+bShyQ0bNQXjP9gdX3fGwrvgGQUATU3gQFGVgJL8mqL/TR5oDrVz6XFqEM6e5M
	 e8gi6bfUu5XP2aG42ZazcEmUx29v5KoYyD5jHSzMeCvBe6UIFVP6wh1J8cmptFQGYD
	 lVo6z5RIXnADfgqudL07n/iGDMQ1W7KVwSECXDHM=
Date: Mon, 21 Sep 2026 19:48:01 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
Message-ID: <arF74QGjx6oCIBnR@e129823.arm.com>
References: <20260921-fix_split-v7-0-d25ec991159f@arm.com>
 <20260921-fix_split-v7-2-d25ec991159f@arm.com>
 <36465f31-59e2-43a5-8cd8-f8bb1844da3c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36465f31-59e2-43a5-8cd8-f8bb1844da3c@kernel.org>

Hi,

> On 9/21/26 12:40, Yeoreum Yun wrote:
> > Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
> > glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> > made by memalign().
> > 
> > The underlying VMA may start at a different address from the aligned
> > address returned by memalign(). Furthermore, a subsequent
> > madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
> > already set.
> > 
> > This causes split_huge_page_test to fail because the check_huge_xxx()
> > helpers incorrectly require the address returned by memalign() to
> > match the VMA start address reported in /proc/self/smaps.
> > 
> > Instead of relying on /proc/self/smaps, use /proc/self/pagemap and
> > /proc/kpageflags to detect huge-page mappings and large folios:
> > 
> >   1. If hpage_size == pmd_pagesize, check PAGE_IS_HUGE instead of
> >      using check_large_folios(), since only the mapping type matters.
> >      This identifies PMD-mapped huge pages.
> >   2. Otherwise, use check_large_folios() to detect large folios. This
> >      covers mTHP cases.
> >   3. Check the folio flags according to the type of huge page.
> > 
> > Since shmem pages are also file-backed, simply check whether the page
> > is file-backed.
> > 
> > Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> > Suggested-by: Zi Yan <ziy@nvidia.com>
> 
> Do we need a Fixes: tag?

Since this change is required for the chaning of behavior of glibc,
I don't think we don't need to add Fixes tag in here?

> 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  tools/testing/selftests/mm/vm_util.c | 137 +++++++++++++++++++++--------------
> >  1 file changed, 84 insertions(+), 53 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> > index 4821a35630363..a7c5caf6925e0 100644
> > --- a/tools/testing/selftests/mm/vm_util.c
> > +++ b/tools/testing/selftests/mm/vm_util.c
> > @@ -351,31 +351,13 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
> >  	return entry;
> >  }
> >  
> > -static bool __check_pmd_huge(void *addr, char *pattern, int nr_hpages,
> > -		  uint64_t hpage_size)
> > -{
> > -	char buffer[MAX_LINE_LENGTH];
> > -	uint64_t thp = -1;
> > -	char *entry;
> > -
> > -	entry = __get_smap_entry(addr, pattern, buffer, sizeof(buffer));
> > -	if (!entry)
> > -		goto err_out;
> > -
> > -	if (sscanf(entry, "%9" SCNu64 " kB", &thp) != 1)
> > -		ksft_exit_fail_msg("Reading smap error\n");
> > -
> > -err_out:
> > -	return thp == (nr_hpages * (hpage_size >> 10));
> > -}
> > -
> > -static bool check_large_folios(void *addr, size_t len, int nr_hpages,
> > -		uint64_t hpage_size)
> > +static bool check_large_folios(int pagemap_fd, int kpageflags_fd,
> > +			       void *addr, size_t len, int nr_hpages,
> > +			       uint64_t hpage_size)
> 
> The function used two tab indent for a reason ;)
> 
> Use two tabs also in the functions you change below.

Okay.

> 
> >  
> > -bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> > +static bool __check_huge(void *addr, size_t len, int nr_hpages,
> > +			 uint64_t hpage_size, enum check_huge_type type)
> 
> 
> >  {
> > -	uint64_t pmd_pagesize = read_pmd_pagesize();
> > +	bool ret = false;
> > +	int pagemap_fd, kpageflags_fd;
> > +	int nr_pmd_mappings = 0;
> > +	uint64_t pmd_pagesize, scan_mapping_size;
> > +	uint64_t categories, kpf;
> > +	unsigned long pfn;
> > +	bool check_pmd_mapping, allow_nonpresent;
> > +	char *start = addr;
> > +	char *end = start + len;
> >  
> > +	pmd_pagesize = read_pmd_pagesize();
> >  	if (!pmd_pagesize)
> >  		ksft_exit_fail_msg("reading PMD pagesize failed\n");
> >  
> > -	if (hpage_size == pmd_pagesize)
> > -		return __check_pmd_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
> > +	check_pmd_mapping = (hpage_size == pmd_pagesize);
> 
> No need for ()

I see.

> 
> > +	scan_mapping_size = (nr_hpages > 0) ? hpage_size : psize();
> > +	/* Some mTHP tests check a partially populated PMD-sized range. */
> > +	allow_nonpresent = (uint64_t)nr_hpages * hpage_size < len;
> >  
> > -	return check_large_folios(addr, len, nr_hpages, hpage_size);
> > +	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
> > +	if (pagemap_fd < 0)
> > +		ksft_exit_fail_msg("open pagemap fail\n");
> > +
> > +	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
> > +	if (kpageflags_fd < 0)
> > +		ksft_exit_fail_msg("open kpageflags fail\n");
> > +
> > +	if (!check_pmd_mapping &&
> > +	    !check_large_folios(pagemap_fd, kpageflags_fd,
> > +				addr, len, nr_hpages, hpage_size))
> > +		goto out;
> > +
> > +	for (; start < end; start += scan_mapping_size) {
> > +		categories = pagemap_scan_get_categories(pagemap_fd, start);
> > +		pfn = pagemap_get_pfn(pagemap_fd, start);
> > +		if (pfn == -1UL) {
> > +			if (!allow_nonpresent)
> > +				goto out;
> > +			else
> > +				continue;
> > +		}
> > +		if (pageflags_get(pfn, kpageflags_fd, &kpf))
> > +			ksft_exit_fail_msg("read kpageflags: %s\n", strerror(errno));
> > +		if (check_pmd_mapping && (categories & PAGE_IS_HUGE))
> > +			nr_pmd_mappings++;
> > +		if (kpf & KPF_COMPOUND_TAIL)
> > +			continue;
> > +		if (!check_huge_type(categories, kpf, type))
> > +			goto out;
> > +	}
> > +
> > +	if (check_pmd_mapping && (nr_pmd_mappings != nr_hpages))
> > +		goto out;
> 
> 
> There is way too much happening here, which makes this rather hard to review.
> 
> Why can't we just focus on the smaps change for now?

Yeap. I think we can simplify as your suggestion with a little bit
change. I'll spin again.

Thanks.

> 
> I.e., something like the following (untested)
> 
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index 4821a35630363..5d348d6985026 100644
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
> @@ -410,20 +392,34 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
>  	return ret;
>  }
>  
> -bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> +static bool __check_pmds(void *start, size_t len, int expected_file_pmds,
> +		int expected_anon_pmds, uint64_t pmd_pagesize)
>  {
> -	uint64_t pmd_pagesize = read_pmd_pagesize();
> +	int found_anon_pmds = 0, found_file_pmds = 0;
> +	int pagemap_fd;
> +	void *addr;
>  
> -	if (!pmd_pagesize)
> -		ksft_exit_fail_msg("reading PMD pagesize failed\n");
> +	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
> +	if (pagemap_fd < 0)
> +		ksft_exit_fail_msg("open pagemap fail\n");
>  
> -	if (hpage_size == pmd_pagesize)
> -		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
> +	for (addr = start; addr < start + len; addr += pmd_pagesize) {
> +		const uint64_t categories = pagemap_scan_get_categories(pagemap_fd, addr);
>  
> -	return check_large_folios(addr, len, nr_hpages, hpage_size);
> +		if (!(categories & PAGE_IS_HUGE))
> +			continue;
> +		if (categories & PAGE_IS_FILE)
> +			found_file_pmds++;
> +		else
> +			found_anon_pmds++;
> +	}
> +
> +	close(pagemap_fd);
> +	return found_anon_pmds == expected_anon_pmds &&
> +	       found_file_pmds == expected_file_pmds;
>  }
>  
> -bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> +bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
>  {
>  	uint64_t pmd_pagesize = read_pmd_pagesize();
>  
> @@ -431,12 +427,12 @@ bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
>  		ksft_exit_fail_msg("reading PMD pagesize failed\n");
>  
>  	if (hpage_size == pmd_pagesize)
> -		return __check_pmd_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
> +		return __check_pmds(addr, len, 0, nr_hpages, pmd_pagesize);
>  
>  	return check_large_folios(addr, len, nr_hpages, hpage_size);
>  }
>  
> -bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> +bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
>  {
>  	uint64_t pmd_pagesize = read_pmd_pagesize();
>  
> @@ -444,11 +440,16 @@ bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size
>  		ksft_exit_fail_msg("reading PMD pagesize failed\n");
>  
>  	if (hpage_size == pmd_pagesize)
> -		return __check_pmd_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);
> +		return __check_pmds(addr, len, nr_hpages, 0, pmd_pagesize);
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
> -- 
> 2.43.0
> -- 
> Cheers,
> 
> David
> 

-- 
Sincerely,
Yeoreum Yun
