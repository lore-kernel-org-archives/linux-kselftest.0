Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B523F3DB335;
	Thu, 27 Aug 2026 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787827467; cv=none; b=YiPS90wkh2VfhGVkwJXC4hmeUmUHdXLIY7/R4j4ZUdEvRpfr/+n7D5DSji4RbeKfOZxEsOrnMaaQFeMJCeuy+EMsvsDuTxK0wU155L5SiM8CRC44kiMqVMgRFrbIuhV3AWesty1SsyzttZ7icrWFSroCU0AwBIpcyfNQbsuNM9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787827467; c=relaxed/simple;
	bh=CdLu2KUFUsEkRIIPJNlBxOqx2DafOnqj7hAjt/hce0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pla0GOVRHa8xtqSWFAJZ5F7sosAbY1cOM2clKJ0RWqYSMDzFyLO38cBjg7Th1Kz79UXETvo4svGUMKct98J+XtpbWpZu8NT+/wtOUUjy9HtjrZvrlzlNEgMHFIK8CXjo87UgfCFxIizuwzAjI8xn2eq1kpFY/iaWqpoD7QoM0vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qcAJA9oz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qcAJA9oz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 155FD1688;
	Thu, 27 Aug 2026 03:44:20 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C621B3F85F;
	Thu, 27 Aug 2026 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787827463; bh=CdLu2KUFUsEkRIIPJNlBxOqx2DafOnqj7hAjt/hce0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcAJA9ozo2cE518o8/55ljeNZVRnj89P77su+lYVZo7nwGiX/uIc4M+9ctfSvHg2Z
	 qiC/yKQhBEl6314tempnyM+pcjzQjBtyEZ0ZoBvJ4UCq4DC1+XScwCp/DAd8rRiBDu
	 TFUjilcY1kJzP7K1v0kCgMHuz5KeXiuIT4eQT/a8=
Date: Thu, 27 Aug 2026 11:44:18 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
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
Message-ID: <apAVAvfxZSeEvf50@e129823.arm.com>
References: <20260826-fix_split-v2-0-71153c7f579a@arm.com>
 <20260826-fix_split-v2-2-71153c7f579a@arm.com>
 <0107447a-7c1f-44f8-94fb-109b0f850677@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0107447a-7c1f-44f8-94fb-109b0f850677@linux.alibaba.com>

Hi Baolin,

> 
> 
> On 8/26/26 8:24 PM, Yeoreum Yun wrote:
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
> > Fix this by using /proc/self/pagemap and /proc/kpageflags instead of
> > /proc/self/smaps to detect huge pages.
> > 
> > Reported-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   tools/testing/selftests/mm/vm_util.c | 130 ++++++++++++++++++++---------------
> >   tools/testing/selftests/mm/vm_util.h |   1 +
> >   2 files changed, 77 insertions(+), 54 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> > index 4821a3563036..1d0959b3b9e8 100644
> > --- a/tools/testing/selftests/mm/vm_util.c
> > +++ b/tools/testing/selftests/mm/vm_util.c
> > @@ -351,31 +351,13 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
> >   	return entry;
> >   }
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
> >   {
> >   	int order = 0, pagesize = getpagesize();
> >   	unsigned int nr_pages = hpage_size / pagesize;
> >   	int orders[MAX_NR_ORDERS], status;
> > -	int pagemap_fd, kpageflags_fd;
> >   	bool ret = false;
> >   	if (!nr_pages)
> > @@ -386,15 +368,6 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
> >   		ksft_exit_fail_msg("invalid order\n");
> >   	memset(orders, 0, sizeof(int) * MAX_NR_ORDERS);
> > -	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
> > -	if (pagemap_fd == -1)
> > -		ksft_exit_fail_msg("read pagemap fail\n");
> > -
> > -	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
> > -	if (kpageflags_fd == -1) {
> > -		close(pagemap_fd);
> > -		ksft_exit_fail_msg("read kpageflags fail\n");
> > -	}
> >   	status = gather_folio_orders(addr, len, pagemap_fd,
> >   			kpageflags_fd, orders, MAX_NR_ORDERS);
> > @@ -405,48 +378,97 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
> >   		ret = true;
> >   out:
> > -	close(pagemap_fd);
> > -	close(kpageflags_fd);
> >   	return ret;
> >   }
> > -bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> > +enum check_huge_type {
> > +	CHECK_HUGE_ANON,
> > +	CHECK_HUGE_FILE,
> > +	CHECK_HUGE_SHMEM,
> > +};
> > +
> > +static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
> > +			     uint64_t hpage_size, enum check_huge_type type)
> 
> The original __check_pmd_huge() is only for PMD-sized large folios, but now
> it not only checks PMD-sized large folios but also mTHP large folios, which
> I find confusing. Please keep its original semantics, and only check
> PMD-sized large folios.

But, It seems to valuable to check other page-flags than checking
the large-folio only.

> 
> >   {
> > -	uint64_t pmd_pagesize = read_pmd_pagesize();
> > +	int pagemap_fd, kpageflags_fd;
> > +	uint64_t pmd_pagesize, granule;
> > +	uint64_t categories, kpf;
> > +	unsigned long pfn;
> > +	bool check_large, huge_mapped;
> > +	char *start = addr;
> > +	char *end = start + len;
> > +	pmd_pagesize = read_pmd_pagesize();
> >   	if (!pmd_pagesize)
> >   		ksft_exit_fail_msg("reading PMD pagesize failed\n");
> > -	if (hpage_size == pmd_pagesize)
> > -		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
> > +	if (nr_hpages > 0) {
> > +		check_large = true;
> > +		granule = hpage_size;
> > +	} else {
> > +		check_large = false;
> > +		granule = psize();
> > +	}
> 
> This is incorrect for the mTHP large folio check. I already hit a selftest
> failure. Please test your patches before sending them out.

Since for a split case, large folio can be as-is but only remove
the PMD mapping only, skipping the large_folio checking seems valid
when nr_hpage is 0.

And the failure of test seems because of unmapped area after
changinng the collapse-order. Therefore, it seems to fine with below
patch:

---------------&<----------------------

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 1d0959b3b9e8..f174a76d2310 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -387,14 +387,14 @@ enum check_huge_type {
        CHECK_HUGE_SHMEM,
 };

-static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
-                            uint64_t hpage_size, enum check_huge_type type)
+static bool __check_huge(void *addr, size_t len, int nr_hpages,
+                        uint64_t hpage_size, enum check_huge_type type)
 {
        int pagemap_fd, kpageflags_fd;
        uint64_t pmd_pagesize, granule;
        uint64_t categories, kpf;
        unsigned long pfn;
-       bool check_large, huge_mapped;
+       bool check_large, check_huge_mapped, allow_nomap;
        char *start = addr;
        char *end = start + len;

@@ -405,11 +405,20 @@ static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
        if (nr_hpages > 0) {
                check_large = true;
                granule = hpage_size;
+               if (granule == pmd_pagesize)
+                       check_huge_mapped = true;
+               else
+                       check_huge_mapped = false;
        } else {
                check_large = false;
                granule = psize();
        }

+       if (nr_hpages * hpage_size < len)
+               allow_nomap = true;
+       else
+               allow_nomap = false;
+
        pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
        if (pagemap_fd < 0)
                ksft_exit_fail_msg("open pagemap fail\n");
@@ -428,18 +437,15 @@ static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
                categories = pagemap_scan_get_categories(pagemap_fd, start);
                pfn = pagemap_get_pfn(pagemap_fd, start);
                if (pfn == -1UL) {
-                       if (check_large)
+                       if (!allow_nomap)
                                goto out;
                        else
                                continue;
                }
                if (pageflags_get(pfn, kpageflags_fd, &kpf))
                        ksft_exit_fail_msg("read kpageflags: %s\n", strerror(errno));
-               huge_mapped = categories & PAGE_IS_HUGE;
-               if (check_large != huge_mapped) {
-                       if (!check_large || granule == pmd_pagesize)
+               if (check_huge_mapped != !!(categories & PAGE_IS_HUGE))
                                goto out;
-               }
                if (kpf & KPF_COMPOUND_TAIL)
                        continue;
                if (!!(categories & PAGE_IS_FILE) != (type != CHECK_HUGE_ANON))
@@ -458,17 +464,17 @@ static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,

 bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
-       return __check_pmd_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_ANON);
+       return __check_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_ANON);
 }

 bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
-       return __check_pmd_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_FILE);
+       return __check_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_FILE);
 }

 bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
-       return __check_pmd_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_SHMEM);
+       return __check_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_SHMEM);
 }


If it's good for you, I'll repost again.

Thanks!

-- 
Sincerely,
Yeoreum Yun
