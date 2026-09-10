Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C1C47255C;
	Thu, 10 Sep 2026 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039513; cv=none; b=X9XbNaXV/UsmLEFNsNRjQ2AzbdEReschOGTaajV8kTOfC3L3J2KaZ0Uwp9yBj3VpKBm5s2dQsT9vHebspkGQuFymxJHJ2z178b/anbIEsYWNqsW/9Vebm7+Wki3H+0LyWlPPBQuUykwI7G/ys7vuKu9BflSMc1SC1RjJn4KYnGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039513; c=relaxed/simple;
	bh=bUjVsfpDZcgmzBY7GROwv4WXzBSIWvoSj7+OppCPLvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSRLkR7L/TtcUXjAnwqYM3nbJ/g+PFL3M2fhYWdxMprfhdmwklFPhDJNkPFRx+YPet59XtRoFT/0NIxJUPBTgl2nRwEiflqrNfDZw65qqXdxlEJ3SHW2GzZ5wuQWiKlyjvNu2/j7KYJ2n4qWDqEPhoQ1LcGfDUqaPAubxVe9mww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LWpqWq0C; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LWpqWq0C"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3179153B;
	Thu, 10 Sep 2026 04:25:07 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A06E3F528;
	Thu, 10 Sep 2026 04:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789039511; bh=bUjVsfpDZcgmzBY7GROwv4WXzBSIWvoSj7+OppCPLvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LWpqWq0CrMWof9QLnwbGJYPVmUIlhn1D0Yzrc/G5UkATJmpaYm3u0RxDex0YwMmjx
	 Y1KrMDqWG4txvyHTU0XP4Yh22k5k3dLc0VRguF/0dfVMjCKk1y3nFfahfoL8kaPRZt
	 FL6NAADXiEt0r7gFE2bpjJbM+WnaA0Jw+Xv7xQxg=
Date: Thu, 10 Sep 2026 12:25:06 +0100
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
Message-ID: <aqKTkkK0wnm6cqpX@e129823.arm.com>
References: <20260907-fix_split-v5-0-822b810458bc@arm.com>
 <20260907-fix_split-v5-2-822b810458bc@arm.com>
 <956df69d-8c0a-420f-889e-7df2842605dc@kernel.org>
 <aqKMVUDvN8bBpwVS@e129823.arm.com>
 <1968ed37-3836-44df-a266-9a37219c2f6f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1968ed37-3836-44df-a266-9a37219c2f6f@kernel.org>

> On 9/10/26 12:54, Yeoreum Yun wrote:
> >> On 9/7/26 10:19, Yeoreum Yun wrote:
> >>> Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
> >>> glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> >>> made by memalign().
> >>>
> >>> The underlying VMA may start at a different address from the aligned
> >>> address returned by memalign(). Furthermore, a subsequent
> >>> madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
> >>> already set.
> >>>
> >>> This causes split_huge_page_test to fail because the check_huge_xxx()
> >>> helpers incorrectly require the address returned by memalign() to
> >>> match the VMA start address reported in /proc/self/smaps.
> >>>
> >>> Instead of relying on /proc/self/smaps, use /proc/self/pagemap and
> >>> /proc/kpageflags to detect huge-page mappings and large folios:
> >>>
> >>>   1. If hpage_size == pmd_pagesize, check PAGE_IS_HUGE instead of
> >>>      using check_large_folios(), since only the mapping type matters.
> >>>      This identifies PMD-mapped huge pages.
> >>>   2. Otherwise, use check_large_folios() to detect large folios. This
> >>>      covers mTHP cases.
> >>>   3. Check the folio flags according to the type of huge page.
> >>>
> >>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> >>> Suggested-by: Zi Yan <ziy@nvidia.com>
> >>> Reviewed-by: Zi Yan <ziy@nvidia.com>
> >>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> >>> ---
> >>>  tools/testing/selftests/mm/vm_util.c | 145 ++++++++++++++++++++++-------------
> >>>  tools/testing/selftests/mm/vm_util.h |   1 +
> >>>  2 files changed, 92 insertions(+), 54 deletions(-)
> >>>
> >>> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> >>> index 4821a3563036..dc62ce84e143 100644
> >>
> >> [...]
> >>
> >>>  
> >>> -	if (hpage_size == pmd_pagesize)
> >>> -		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
> >>> +static bool check_huge_type(uint64_t categories, uint64_t kpageflags,
> >>> +			    enum check_huge_type type)
> >>> +{
> >>> +	const bool file = categories & PAGE_IS_FILE;
> >>> +	const bool swapbacked = kpageflags & KPF_SWAPBACKED;
> >>> +
> >>> +	switch (type) {
> >>> +	case CHECK_HUGE_ANON:
> >>> +		return !file;
> >>> +	case CHECK_HUGE_FILE:
> >>> +		return file && !swapbacked;
> >>> +	case CHECK_HUGE_SHMEM:
> >>> +		return file & swapbacked;
> >>> +	}
> >>
> >> Why do we even need CHECK_HUGE_SHMEM?
> >>
> >> That's really just a legacy thing for using smaps to identify huge pages.
> >>
> >> It's sufficient to identify CHECK_HUGE_FILE if you know that you have shmem mapping.
> >>
> >> You will not arbitrarily have non-shmem folios in a shmem mapping :)
> > 
> > Agree. but there seems the case where discern whethr the mapping is
> > with regular file or shmem like tmpfs -- khugepaged test where using
> > __shmem_ops. So I think it would be better to keep this as-is.
> 
> Let's not add or maintain unnecessary complexity.
> 
> hmem_check_huge can really just become check_huge_file.
> 
> Even file_check_huge can just be simplified.
> 
> There must be a pretty good reason why we'd want to keep this.

Okay. then I'll change the check_huge_shmem() to check_huge_file()
with the separate patch.

-- 
Sincerely,
Yeoreum Yun
