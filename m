Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11783E0750;
	Fri, 28 Aug 2026 07:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787903089; cv=none; b=era8IqZYMlbE4/Db7To7Sd0+CvAeNjHJQAN/1KYdz3JtafNji8tohybEJCk5bTT+pTIgZi+ZaF4MwEzUJO442vf69LTlLsxLNzruzS4Xv5PF5u3UaxuXlpqCmza+qsb/76071KDadwhDPNp8r0f0i3jsn3ozf3ncgCdPLfN7oBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787903089; c=relaxed/simple;
	bh=Sb6T7e6Dpmin6+afUWtu00w2dT67ioqJumAh7UkldEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ma0N2i0dAZgdiHbc8MCQqkE6p9kxUmRAIHT53b06SDfcfVxlHrbVDfmF1mX0X1rhbS7d/0dKlG7+SaF68iWUq8Mesl0LArqku3gUu7ba1eOHziRsfEqT79a1oRW2Q1xr2CDdVGA56uT6Y7rtc/jnpSP+Dse7YCkuggpqBWvobec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lOH2zMsB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lOH2zMsB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABA051516;
	Fri, 28 Aug 2026 00:44:40 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 669BC3F7D8;
	Fri, 28 Aug 2026 00:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787903084; bh=Sb6T7e6Dpmin6+afUWtu00w2dT67ioqJumAh7UkldEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOH2zMsBPdKLvwthSEKVLB7tyKS/ksiXb6naox4kJHfi0M23aMS3r2Z/ij76/zoOM
	 jNTyqyynRrsf1MnRS9au654KSYWCj7b7va736HBoCMXHsfbzyx4b/2UhOp1jcXHr34
	 UJxtYx+9r9c/fulAtfAXaUiLZXOChRRKLH7GD4yc=
Date: Fri, 28 Aug 2026 08:44:38 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Zi Yan <ziy@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
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
Subject: Re: [PATCH v2 2/2] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
Message-ID: <apE8ZvWg219b9aW_@e129823.arm.com>
References: <20260826-fix_split-v2-0-71153c7f579a@arm.com>
 <20260826-fix_split-v2-2-71153c7f579a@arm.com>
 <0107447a-7c1f-44f8-94fb-109b0f850677@linux.alibaba.com>
 <apAVAvfxZSeEvf50@e129823.arm.com>
 <DKZTG6MI4EI2.35PCXKS36M1DY@nvidia.com>
 <apBruUeQoCgP_Mhh@e129823.arm.com>
 <31e649d3-7653-49c0-b73e-933ba2a86f4a@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31e649d3-7653-49c0-b73e-933ba2a86f4a@linux.alibaba.com>

> 
> 
> On 8/28/26 12:54 AM, Yeoreum Yun wrote:
> > On Thu, Aug 27, 2026 at 11:03:17AM -0400, Zi Yan wrote:
> > > On Thu Aug 27, 2026 at 6:44 AM EDT, Yeoreum Yun wrote:
> > > > Hi Baolin,
> > > > 
> > > > > 
> > > > > 
> > > > > On 8/26/26 8:24 PM, Yeoreum Yun wrote:
> > > > > > Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
> > > > > > glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> > > > > > made by memalign().
> > > > > > 
> > > > > > The underlying VMA may start at a different address from the aligned
> > > > > > address returned by memalign(). Furthermore, a subsequent
> > > > > > madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
> > > > > > already set.
> > > > > > 
> > > > > > This causes split_huge_page_test to fail because the check_huge_xxx()
> > > > > > helpers incorrectly require the address returned by memalign() to
> > > > > > match the VMA start address reported in /proc/self/smaps.
> > > > > > 
> > > > > > Fix this by using /proc/self/pagemap and /proc/kpageflags instead of
> > > > > > /proc/self/smaps to detect huge pages.
> > > > > > 
> > > > > > Reported-by: David Hildenbrand (Arm) <david@kernel.org>
> > > > > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > > > > ---
> > > > > >    tools/testing/selftests/mm/vm_util.c | 130 ++++++++++++++++++++---------------
> > > > > >    tools/testing/selftests/mm/vm_util.h |   1 +
> > > > > >    2 files changed, 77 insertions(+), 54 deletions(-)
> > > > > > 
> > > > > > diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> > > > > > index 4821a3563036..1d0959b3b9e8 100644
> > > > > > --- a/tools/testing/selftests/mm/vm_util.c
> > > > > > +++ b/tools/testing/selftests/mm/vm_util.c
> > > > > > @@ -351,31 +351,13 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
> > > > > >    	return entry;
> > > > > >    }
> > > > > > -static bool __check_pmd_huge(void *addr, char *pattern, int nr_hpages,
> > > > > > -		  uint64_t hpage_size)
> > > > > > -{
> > > > > > -	char buffer[MAX_LINE_LENGTH];
> > > > > > -	uint64_t thp = -1;
> > > > > > -	char *entry;
> > > > > > -
> > > > > > -	entry = __get_smap_entry(addr, pattern, buffer, sizeof(buffer));
> > > > > > -	if (!entry)
> > > > > > -		goto err_out;
> > > > > > -
> > > > > > -	if (sscanf(entry, "%9" SCNu64 " kB", &thp) != 1)
> > > > > > -		ksft_exit_fail_msg("Reading smap error\n");
> > > > > > -
> > > > > > -err_out:
> > > > > > -	return thp == (nr_hpages * (hpage_size >> 10));
> > > > > > -}
> > > > > > -
> > > > > > -static bool check_large_folios(void *addr, size_t len, int nr_hpages,
> > > > > > -		uint64_t hpage_size)
> > > > > > +static bool check_large_folios(int pagemap_fd, int kpageflags_fd,
> > > > > > +			       void *addr, size_t len, int nr_hpages,
> > > > > > +			       uint64_t hpage_size)
> > > > > >    {
> > > > > >    	int order = 0, pagesize = getpagesize();
> > > > > >    	unsigned int nr_pages = hpage_size / pagesize;
> > > > > >    	int orders[MAX_NR_ORDERS], status;
> > > > > > -	int pagemap_fd, kpageflags_fd;
> > > > > >    	bool ret = false;
> > > > > >    	if (!nr_pages)
> > > > > > @@ -386,15 +368,6 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
> > > > > >    		ksft_exit_fail_msg("invalid order\n");
> > > > > >    	memset(orders, 0, sizeof(int) * MAX_NR_ORDERS);
> > > > > > -	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
> > > > > > -	if (pagemap_fd == -1)
> > > > > > -		ksft_exit_fail_msg("read pagemap fail\n");
> > > > > > -
> > > > > > -	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
> > > > > > -	if (kpageflags_fd == -1) {
> > > > > > -		close(pagemap_fd);
> > > > > > -		ksft_exit_fail_msg("read kpageflags fail\n");
> > > > > > -	}
> > > > > >    	status = gather_folio_orders(addr, len, pagemap_fd,
> > > > > >    			kpageflags_fd, orders, MAX_NR_ORDERS);
> > > > > > @@ -405,48 +378,97 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
> > > > > >    		ret = true;
> > > > > >    out:
> > > > > > -	close(pagemap_fd);
> > > > > > -	close(kpageflags_fd);
> > > > > >    	return ret;
> > > > > >    }
> > > > > > -bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> > > > > > +enum check_huge_type {
> > > > > > +	CHECK_HUGE_ANON,
> > > > > > +	CHECK_HUGE_FILE,
> > > > > > +	CHECK_HUGE_SHMEM,
> > > > > > +};
> > > > > > +
> > > > > > +static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
> > > > > > +			     uint64_t hpage_size, enum check_huge_type type)
> > > > > 
> > > > > The original __check_pmd_huge() is only for PMD-sized large folios, but now
> > > > > it not only checks PMD-sized large folios but also mTHP large folios, which
> > > > > I find confusing. Please keep its original semantics, and only check
> > > > > PMD-sized large folios.
> > > > 
> > > > But, It seems to valuable to check other page-flags than checking
> > > > the large-folio only.
> > > > 
> > > > > 
> > > > > >    {
> > > > > > -	uint64_t pmd_pagesize = read_pmd_pagesize();
> > > > > > +	int pagemap_fd, kpageflags_fd;
> > > > > > +	uint64_t pmd_pagesize, granule;
> > > > > > +	uint64_t categories, kpf;
> > > > > > +	unsigned long pfn;
> > > > > > +	bool check_large, huge_mapped;
> > > > > > +	char *start = addr;
> > > > > > +	char *end = start + len;
> > > > > > +	pmd_pagesize = read_pmd_pagesize();
> > > > > >    	if (!pmd_pagesize)
> > > > > >    		ksft_exit_fail_msg("reading PMD pagesize failed\n");
> > > > > > -	if (hpage_size == pmd_pagesize)
> > > > > > -		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
> > > > > > +	if (nr_hpages > 0) {
> > > > > > +		check_large = true;
> > > > > > +		granule = hpage_size;
> > > > > > +	} else {
> > > > > > +		check_large = false;
> > > > > > +		granule = psize();
> > > > > > +	}
> > > > > 
> > > > > This is incorrect for the mTHP large folio check. I already hit a selftest
> > > > > failure. Please test your patches before sending them out.
> > > > 
> > > > Since for a split case, large folio can be as-is but only remove
> > > > the PMD mapping only, skipping the large_folio checking seems valid
> > > > when nr_hpage is 0.
> > > 
> > > What split care are you referring to? split_huge_page_test() always
> > > splits the folio.
> > 
> > Not for split_huge_page_test case but for khugepage testcase like
> > collapse_full_of_compound() test.
> > 
> > > 
> > > > 
> > > > And the failure of test seems because of unmapped area after
> > > > changinng the collapse-order. Therefore, it seems to fine with below
> > > > patch:
> > > > 
> > > > ---------------&<----------------------
> > > > 
> > > > diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> > > > index 1d0959b3b9e8..f174a76d2310 100644
> > > > --- a/tools/testing/selftests/mm/vm_util.c
> > > > +++ b/tools/testing/selftests/mm/vm_util.c
> > > > @@ -387,14 +387,14 @@ enum check_huge_type {
> > > >          CHECK_HUGE_SHMEM,
> > > >   };
> > > > 
> > > > -static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
> > > > -                            uint64_t hpage_size, enum check_huge_type type)
> > > > +static bool __check_huge(void *addr, size_t len, int nr_hpages,
> > > > +                        uint64_t hpage_size, enum check_huge_type type)
> > > >   {
> > > >          int pagemap_fd, kpageflags_fd;
> > > >          uint64_t pmd_pagesize, granule;
> > > >          uint64_t categories, kpf;
> > > >          unsigned long pfn;
> > > > -       bool check_large, huge_mapped;
> > > > +       bool check_large, check_huge_mapped, allow_nomap;
> > > >          char *start = addr;
> > > >          char *end = start + len;
> > > > 
> > > > @@ -405,11 +405,20 @@ static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
> > > >          if (nr_hpages > 0) {
> > > >                  check_large = true;
> > > >                  granule = hpage_size;
> > > > +               if (granule == pmd_pagesize)
> > > > +                       check_huge_mapped = true;
> > > > +               else
> > > > +                       check_huge_mapped = false;
> > > >          } else {
> > > >                  check_large = false;
> > > >                  granule = psize();
> > > >          }
> > > 
> > > The else is for nr_hpages == 0? But it looks like we allow negative
> > > nr_hpages. Maybe add a bool expect_huge = nr_hpages > 0 to make it
> > > explicit.
> > 
> > Fair enough. I'll change.
> > 
> > > 
> > > granule is an optimization for PAGE_IS_HUGE scanning? When we expect a
> > > PMD mapping, we just scan at pmd_pagesize granularity, otherwise we
> > > check every single page?
> > > 
> > > At the high level, the function looks good to me, the rules are:
> > > 
> > > 1. if hpage_size == pmd_pagesize, we need to check PAGE_IS_HUGE and
> > > check_large_folio() can be skipped, since we only care about mappings.
> > > This checks for PMD mappings.
> > > 
> > > 2. in other cases, check_large_folios() is always needed. This is for
> > > mTHP checks.
> 
> Yes, this is also what I thought. And the following code looks good to me.
> Thanks.
> 
> > Exactly, but for some testcase where use this function, doesn't
> > trigger split of large _folio but only check the HUGE MAP is removed
> > (nr_hpage == 0), it skips the chekc_large_folio().
> > 
> > > 
> > > I think the ifs at the beginning is confusing. Can we do something like
> > > below to get rid of the ifs? I also moved KPF_* checks in a separate
> > > function. Feel free to make changes if you find any issue there.
> > > 
> > > static bool check_huge_type(uint64_t categories, uint64_t kpageflags,
> > > 			    enum check_huge_type type)
> > > {
> > > 	bool file = categories & PAGE_IS_FILE;
> > > 	bool swapbacked = kpageflags & KPF_SWAPBACKED;
> > > 
> > > 	switch (type) {
> > > 	case CHECK_HUGE_ANON:
> > > 		return !file;
> > > 	case CHECK_HUGE_FILE:
> > > 		return file && !swapbacked;
> > > 	case CHECK_HUGE_SHMEM:
> > > 		return file && swapbacked;
> > > 	}
> > > 
> > > 	return false;
> > > }
> > > 
> > > static bool __check_huge(void *addr, size_t len, int nr_hpages,
> > > 			 uint64_t hpage_size, enum check_huge_type type)
> > > {
> > > 	int pagemap_fd, kpageflags_fd;
> > > 	int nr_pmd_mappings = 0;
> > > 	uint64_t pmd_pagesize, scan_mapping_size;
> > > 	uint64_t categories, kpf;
> > > 	unsigned long pfn;
> > > 	bool check_pmd_mapping;
> > > 	bool allow_nonpresent;
> > > 	bool ret = false;
> > > 	char *start = addr;
> > > 	char *end = start + len;
> > > 
> > > 	pmd_pagesize = read_pmd_pagesize();
> > > 	if (!pmd_pagesize)
> > > 		ksft_exit_fail_msg("reading PMD pagesize failed\n");
> > > 
> > > 	check_pmd_mapping = hpage_size == pmd_pagesize;
> > > 	scan_mapping_size = nr_hpages > 0 ? hpage_size : psize();
> > > 	/* Some mTHP tests check a partially populated PMD-sized range. */
> > > 	allow_nonpresent = (uint64_t)nr_hpages * hpage_size < len;
> > > 
> > > 	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
> > > 	if (pagemap_fd < 0)
> > > 		ksft_exit_fail_msg("open pagemap fail\n");
> > > 
> > > 	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
> > > 	if (kpageflags_fd < 0) {
> > > 		close(pagemap_fd);
> > > 		ksft_exit_fail_msg("open kpageflags fail\n");
> > > 	}
> > > 
> > > 	/* PTE-mapped large folios cannot be identified by PAGE_IS_HUGE. */
> > > 	if (!check_pmd_mapping &&
> > > 	    !check_large_folios(pagemap_fd, kpageflags_fd, addr, len,
> > > 				 nr_hpages, hpage_size))
> > > 		goto out;
> > > 
> > > 	for (; start < end; start += scan_mapping_size) {
> > > 		categories = pagemap_scan_get_categories(pagemap_fd, start);
> > > 		pfn = pagemap_get_pfn(pagemap_fd, start);
> > > 		if (pfn == -1UL) {
> > > 			if (!allow_nonpresent)
> > > 				goto out;
> > > 			continue;
> > > 		}
> > > 		if (pageflags_get(pfn, kpageflags_fd, &kpf))
> > > 			ksft_exit_fail_msg("read kpageflags: %s\n", strerror(errno));
> > > 		if (check_pmd_mapping && (categories & PAGE_IS_HUGE))
> > > 			nr_pmd_mappings++;
> > > 		if (kpf & KPF_COMPOUND_TAIL)
> > > 			continue;
> > > 		if (!check_huge_type(categories, kpf, type))
> > > 			goto out;
> > > 	}
> > > 	if (check_pmd_mapping && nr_pmd_mappings != nr_hpages)
> > > 		goto out;
> > 
> > Again, because of collapse_full_of_compound() testcase,
> > it would be failed for this. so, it would better to skip
> > check_large_folioes() when nr_hpages is 0.
> 
> IIUC, when nr_hpages is 0, we should also call check_large_folios() to
> verify that there are no large folios within this address range, which is
> also what the previous code did.
> 
> Also, I tried Zi's code, and it passed all my khugepaged selftests. I'm not
> sure why you saw the collapse_full_of_compound() test case fail.

Ah, Sorry to my misunderstding I've misread the code on condition :(.
(!check_pmd_mapping as check_pmd_mapping)...

Yeap. it seems fine to check PAGE_IS_HUGE instead of large folio for
pmd_hugepage case.

Sorry to make noise.

-- 
Sincerely,
Yeoreum Yun
