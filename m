Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E298A306775;
	Fri, 28 Aug 2026 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930548; cv=none; b=rT/BuYZEju7C2DFamdz/GaeugUhAE4uNUP1fOASWtDfzTQl+v+6sN/Yy/0U6FF4ehBfFh3xKe7cuIy/lKrdcC2FQUDnPOB7QdPY5pdTiJJCHiS1qM96Ly4WUwa8k1BJ6C0QzAkUThT2llvdpNIFT9ZnFduJ7lkohz0IWW5CNNw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930548; c=relaxed/simple;
	bh=DeoGFjBx4QLJFcn9hvDThwnNjY7LxUiYB4ZZ9ewETl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqqNc3PZU+8P/neI2M1Ur1NYmdjWhH3xY9kwuDNMnO0L3fq/TyJmw3gCwr5tVrpI3pyTl8JwWsdYDD9Zmh7xQBWzZS21QA5lHWljxLNVqEcuk9PjrbDMvq21FsVdOQEBWQXggmssKhx2GLBjMONHEFKKKlQX1fz7933GuomJE+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iP1lnHdg; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iP1lnHdg"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44F541570;
	Fri, 28 Aug 2026 08:22:21 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F01223F7D8;
	Fri, 28 Aug 2026 08:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787930545; bh=DeoGFjBx4QLJFcn9hvDThwnNjY7LxUiYB4ZZ9ewETl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iP1lnHdg/9SHv+4JNCQ7rQjXirwsx40DhHTEyr7I0/55vHHoe6LgJqGsGDhKr/jfK
	 M2pOWxa4Us+u+fR0QBf0ZVWt0rXfJ4osSoW5Mi9gWwYfixqt/7/SHTyz/MBbck2n6u
	 5hGNxmUuwR53Rq+/Zkld5N+Ru3N2Db8y+AjqDaE0=
Date: Fri, 28 Aug 2026 16:22:19 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
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
Subject: Re: [PATCH v3 2/2] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
Message-ID: <apGnq7HNAbPOQhLO@e129823.arm.com>
References: <20260828-fix_split-v3-0-374022586a4b@arm.com>
 <20260828-fix_split-v3-2-374022586a4b@arm.com>
 <DL0OA5ZF6VX2.33NA9XE20959G@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DL0OA5ZF6VX2.33NA9XE20959G@nvidia.com>

On Fri, Aug 28, 2026 at 11:13:00AM -0400, Zi Yan wrote:
> On Fri Aug 28, 2026 at 4:11 AM EDT, Yeoreum Yun wrote:
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
> > Suggested-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  tools/testing/selftests/mm/vm_util.c | 145 ++++++++++++++++++++++-------------
> >  tools/testing/selftests/mm/vm_util.h |   1 +
> >  2 files changed, 92 insertions(+), 54 deletions(-)
> >
> > diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> > index 4821a3563036..083b72d92b14 100644
> > --- a/tools/testing/selftests/mm/vm_util.c
> > +++ b/tools/testing/selftests/mm/vm_util.c
> > @@ -351,31 +351,13 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
> >  	return entry;
> >  }
> >  
> 
> <snip>
> 
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
> 
> There is a trailing tab.
> 
> > +	if (check_pmd_mapping && (nr_pmd_mappings != nr_hpages))
> > +		goto out;
> > +	ret = true;
> > +
> > +out:
> > +	close(pagemap_fd);
> > +	close(kpageflags_fd);
> > +	return ret;
> >  }
> >  
> 
> Otherwise, LGTM. I assume the replacement of memalign(), from the
> discussion between you and Lorenzo, will be added in a separate patch.
> For this patch,

Yeap. I'll post with the separated one.

> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

-- 
Sincerely,
Yeoreum Yun
