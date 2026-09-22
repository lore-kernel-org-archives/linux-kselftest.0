Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4554E535A;
	Tue, 22 Sep 2026 07:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060424; cv=none; b=mSY2kQA73f/LVtbCp2nbqzab0Ux6Beg84kiSBffoiq0LnnN0jwkPFhcGSJcQEirlqfkYSXE2h8PM6Ogqf8LyqPA7lzpMySjDKncVYzo430KU9Ckq++5veZDB2oaQmQjVyudut+7tcLB7DhRiI4+wKZNjCAApPip/wqf4VF+n6qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060424; c=relaxed/simple;
	bh=6Kp8giQhkkbgExJsxASyiXv/PoBHskz4VQuIIjYhF+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHT/RSF1YdNUpwKzvMUxq1aPjdAl7g8+zFiDjh72qn/09uiDdXXCFhUDT+hBdXzDQ1Uf1bs2FD4AgpusN79zwR/Sv0VBNQ4PLo1KgrX/Joaq3f/5o2lsQsBwaTRpkMJDqcoUp8EO96y+ReNTZO+LjtNBu85XmK9gzVnfNjMlvXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cn1d6rou; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cn1d6rou"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 314B51476;
	Tue, 22 Sep 2026 00:00:18 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8C963F632;
	Tue, 22 Sep 2026 00:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790060421; bh=6Kp8giQhkkbgExJsxASyiXv/PoBHskz4VQuIIjYhF+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cn1d6rou9SdrLcLfFzTuxUb6pl1re6Vl/j9CK3MrVwxozTBiOaC3aP6OhuUrGUmam
	 skiCDbeXynMb9eADcw0zp5cJdtit++8JeQSxlhwXyWgUPdHy5LA847YK/6wjhqaOPY
	 HQ6cRNZ7G3NjJfAbADxcb2WyGxrIKlc5sanNVSuY=
Date: Tue, 22 Sep 2026 08:00:16 +0100
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
Message-ID: <arIngE4f82b4Jj_v@e129823.arm.com>
References: <20260921-fix_split-v7-0-d25ec991159f@arm.com>
 <20260921-fix_split-v7-2-d25ec991159f@arm.com>
 <36465f31-59e2-43a5-8cd8-f8bb1844da3c@kernel.org>
 <arF74QGjx6oCIBnR@e129823.arm.com>
 <f3cd3778-7423-4241-8dd5-05eb63886e65@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3cd3778-7423-4241-8dd5-05eb63886e65@kernel.org>

On Mon, Sep 21, 2026 at 11:05:15PM +0200, David Hildenbrand (Arm) wrote:
> On 9/21/26 20:48, Yeoreum Yun wrote:
> > Hi,
> > 
> >> On 9/21/26 12:40, Yeoreum Yun wrote:
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
> >>> Since shmem pages are also file-backed, simply check whether the page
> >>> is file-backed.
> >>>
> >>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> >>> Suggested-by: Zi Yan <ziy@nvidia.com>
> >>
> >> Do we need a Fixes: tag?
> > 
> > Since this change is required for the chaning of behavior of glibc,
> > I don't think we don't need to add Fixes tag in here?
> > 
> Our test made wrong assumptions on the underlying behavior of the user space
> allocator (no VMA merging would happen). So I'd argue that we should add a
> Fixes: for the test.

Okay. while I do
  - add intermediate patch before this as you suggeeted.
  - on the intermediate patch, add fix tag.
  - based the patch, rebase this patch to add anon/file check for
    other check_large_folios() type.

Thanks.

> 
> -- 
> Cheers,
> 
> David

-- 
Sincerely,
Yeoreum Yun
