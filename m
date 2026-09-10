Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EA2404BF9;
	Thu, 10 Sep 2026 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036329; cv=none; b=G1yG7wr5C3PtAbLMgK142pZv+lwkWc4Q+C6sDXc8xzonIknjcVJt4h1sp/ukGOWgBCVRgyf721ffLpqfoXjtNjyNO+IelGB3MH78jBu53Uj0nCbl9zRYk0Pqs6RHA/y2JCqemr9fubCMJpa7uRrB0dH86SbuXXZGZU0jIK9b53I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036329; c=relaxed/simple;
	bh=IJITZrrt2zEXZ32wbq+QH7wuDa0njOtO4c73SNtm858=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQxup8JeonmI/6MJU51SQiWpkGFI5po4Cc5ofDPrl8m2ELDzYLZHGcYPY3ZIFLrxvxBo4LOKFIY1LGdmz1uoTycd7jD5pkwruQib1t4ORZueY8E+oJU2mOQnuEce4NRTH/aJTrtzXvJLvImEOiQuyZWusze7XmLf76o6dZt3jwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CDPjjO6E; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CDPjjO6E"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C23D143D;
	Thu, 10 Sep 2026 03:31:58 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BA793F7B4;
	Thu, 10 Sep 2026 03:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789036321; bh=IJITZrrt2zEXZ32wbq+QH7wuDa0njOtO4c73SNtm858=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDPjjO6Em49wTSXUqIvdn3jp5muCpT3ua9fqMM8tKJpqwyGetLZMKlfpHQ+qVh6Hi
	 8LGMz2ByUY3yc6yei07ZAu5ptJ9ER8pFXzwPLZJneyOxpyTZy6E7inUvtOJCpk23n+
	 XxaPElyRDTa4HYEa12Ksa+fMK9uZpuc8/ErKPjy0=
Date: Thu, 10 Sep 2026 11:31:57 +0100
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
Subject: Re: [PATCH v5 0/3] kselftest: mm: fix some failure of
 split_huge_page_test
Message-ID: <aqKHHWKvOonYZPy0@e129823.arm.com>
References: <20260907-fix_split-v5-0-822b810458bc@arm.com>
 <b923f63c-db7c-4ecb-949d-368bc6311626@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b923f63c-db7c-4ecb-949d-368bc6311626@kernel.org>

> On 9/7/26 10:19, Yeoreum Yun wrote:
> > split_huge_page_test can fail for the following reasons:
> > 
> >   1. During the test, khugepaged may collapse previously split pages again,
> >      causing intermittent failures.
> > 
> >   2. Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
> >      glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> >      made by memalign(). The underlying VMA may start at a different address
> >      from the aligned address returned by memalign(). Moreover, a subsequent
> >      madvise(MADV_HUGEPAGE) call does not split the VMA because it already
> >      has the same advice.
> > 
> >      This causes the test to fail because the check_huge_xxx() helpers
> >      incorrectly require the address returned by memalign() to match the
> >      VMA start address reported in /proc/self/smaps.
> > 
> > Address these issues by applying MADV_NOHUGEPAGE after faulting in the
> > huge page, preventing khugepaged from collapsing it again, and instead of
> > relying on /proc/self/smaps, use /proc/self/pagemap and
> > /proc/kpageflags to detect huge-page mappings and large folios:
> > 
> >   1. If hpage_size == pmd_pagesize, check PAGE_IS_HUGE instead of
> >      using check_large_folios(), since only the mapping type matters.
> >      This identifies PMD-mapped huge pages.
> >   2. Otherwise, use check_large_folios() to detect large folios. This
> >      covers mTHP cases.
> >   3. Check the folio flags according to the type of huge page.
> > 
> > Also, current usage of memalign() would result memory area may
> > unexpectedly merge with an adjacent VMA, causing tests
> > that inspect it through /proc/self/smaps to fail.
> I'm not particularly happy about this.
> 
> Relying on VMA merging details rather hints that we shouldn't be using smaps to
> query some stats/properties.
> 
> Which exact things are test querying through /proc/self/smaps? Could we convert
> the code to just query that stuff through different interfaces?

Well, users currently for using /proc/self/smaps are for check vm-flags:
  - guard-regions where using check_vmflags_guard()
  - pfnmap test where uses check_vmflag_pfnmap()

AFAIK, there is no interface to get vm-flags except /proc/self/smaps,
we should add new interface but I'm not sure whether it's useful except
for test purpose.

Since for a testing, the most chance for VMA merge is when using anon
private mapping and this would be enough with allocate_isolated_mem().

-- 
Sincerely,
Yeoreum Yun
