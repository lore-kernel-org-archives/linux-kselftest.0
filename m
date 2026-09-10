Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027FA4BFE9D;
	Thu, 10 Sep 2026 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037669; cv=none; b=Z4ePC3Ls5bOI67A7D0ZBF3f4yqZVao/h4axcYsnuY0XA+EXSCXMmOG3h5zPVhPb9jndBxGhBKecRy2tUAPF50Kti50TgkVQ/voLshEG5UIR3ttr9Hz2L12KdGeYLO++QuY4jyapKjMc9v8XVxxpAtYtftejDaoG57+yrhKdiyGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037669; c=relaxed/simple;
	bh=LZa/mTe3VR25KHQaR9yMTJp7T+IkVsTbaUvpTI1sUo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDLMJh5r+45DcomNJxHJNI20PeCcNj2Y9//gNCo8tvAc+qbKsIfmezokqmxuN7mn6o14C2vPkGMk9DdJ+pjtwGDv1MzckVho1z4ToVmXv8WbIFwCnxlmHNC0XLBmcihtRWczSFr5ODVLYlhAmexBqN7U6RDSKm7CuLfmCaDHAlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VN6MoQBj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VN6MoQBj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE2211477;
	Thu, 10 Sep 2026 03:54:15 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19E8E3F7B4;
	Thu, 10 Sep 2026 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789037659; bh=LZa/mTe3VR25KHQaR9yMTJp7T+IkVsTbaUvpTI1sUo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VN6MoQBjtpr1/cmo6G/4YZh5bHXuew9SIhpd11l+692psl/N9na3NbHc21NOsAUsU
	 3+TQmValjDyMFstToPCzXuQUZ63eChLMNCBjyW+gx19SIlNi9MqfNzNAp+KP3fHIbQ
	 6G3FQnvZE1lwfmo6X/7iJEX6alz2jYz4JAF7kQnc=
Date: Thu, 10 Sep 2026 11:54:13 +0100
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
Subject: Re: [PATCH v5 2/3] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
Message-ID: <aqKMVUDvN8bBpwVS@e129823.arm.com>
References: <20260907-fix_split-v5-0-822b810458bc@arm.com>
 <20260907-fix_split-v5-2-822b810458bc@arm.com>
 <956df69d-8c0a-420f-889e-7df2842605dc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <956df69d-8c0a-420f-889e-7df2842605dc@kernel.org>

> On 9/7/26 10:19, Yeoreum Yun wrote:
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
> > Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> > Suggested-by: Zi Yan <ziy@nvidia.com>
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  tools/testing/selftests/mm/vm_util.c | 145 ++++++++++++++++++++++-------------
> >  tools/testing/selftests/mm/vm_util.h |   1 +
> >  2 files changed, 92 insertions(+), 54 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> > index 4821a3563036..dc62ce84e143 100644
> 
> [...]
> 
> >  
> > -	if (hpage_size == pmd_pagesize)
> > -		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
> > +static bool check_huge_type(uint64_t categories, uint64_t kpageflags,
> > +			    enum check_huge_type type)
> > +{
> > +	const bool file = categories & PAGE_IS_FILE;
> > +	const bool swapbacked = kpageflags & KPF_SWAPBACKED;
> > +
> > +	switch (type) {
> > +	case CHECK_HUGE_ANON:
> > +		return !file;
> > +	case CHECK_HUGE_FILE:
> > +		return file && !swapbacked;
> > +	case CHECK_HUGE_SHMEM:
> > +		return file & swapbacked;
> > +	}
> 
> Why do we even need CHECK_HUGE_SHMEM?
> 
> That's really just a legacy thing for using smaps to identify huge pages.
> 
> It's sufficient to identify CHECK_HUGE_FILE if you know that you have shmem mapping.
> 
> You will not arbitrarily have non-shmem folios in a shmem mapping :)

Agree. but there seems the case where discern whethr the mapping is
with regular file or shmem like tmpfs -- khugepaged test where using
__shmem_ops. So I think it would be better to keep this as-is.

> 
> >  
> > -	return check_large_folios(addr, len, nr_hpages, hpage_size);
> > +	return false;
> >  }
> >  
> > -bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
> > +static bool __check_huge(void *addr, size_t len, int nr_hpages,
> > +			 uint64_t hpage_size, enum check_huge_type type)
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
> > +	if (kpageflags_fd < 0) {
> > +		close(pagemap_fd);
> 
> No need to cleanup when exiting.

Yes, but some test code does clean it up, so I was just confused
about the convention :\

> 
> > +		ksft_exit_fail_msg("open kpageflags fail\n");
> > +	}
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
> > +	ret = true;
> > +
> > +out:
> > +	close(pagemap_fd);
> > +	close(kpageflags_fd);
> > +	return ret;
> >  }
> 
> 
> 
> -- 
> Cheers,
> 
> David
> 

-- 
Sincerely,
Yeoreum Yun
