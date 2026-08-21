Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4328317993;
	Fri, 21 Aug 2026 00:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787272014; cv=none; b=Hx3uM1/i8ajuYRURMGp8PG4Z4DeipCYa25oTzfa3RbIxMSA+bKFACfE5KhArURxwOipWEJpjKRypUEVtTDdmbV1GB0A3uKj6oy4Uk36JeejiuJSKT6PorvzYKVJ77PrdHyOpVQly4plX1RDAY1Dt7O8+ntig30+CdCXjsvA1VV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787272014; c=relaxed/simple;
	bh=rZtzriMNQLdFVOWizIVfqbKh0as8DbXMCiKrEQ8ecIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBJQ6YAwXZCuVobqEuoHrlfKFUszfnu1wyPi0Dntug+KlDDkggnlFS4/mehGMbPpyZDMXrkD1kkI1HnywL/FhpEfrCCF4GJcc/yRU0qlcxIswkT7BQPn91D+QS7ACsAZzjJkGoTWhWr/+Co8rIloEI2jSczxfz+kUbhK6fHCz+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OpB9Z52b; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OpB9Z52b"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AC33202C;
	Thu, 20 Aug 2026 17:26:48 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7778D3F66F;
	Thu, 20 Aug 2026 17:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787272012; bh=rZtzriMNQLdFVOWizIVfqbKh0as8DbXMCiKrEQ8ecIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpB9Z52bMX+u/hTZY2vChYPYCd1qlV0jQCF3mgYzesh4wViGlYG6Xl+gbXqySp7JR
	 eqW0aDi78KPuR2W5srPpKsUWliPqtXW1gSVewlxs+004FHq/Tj48UKbjcRsM0qHqB9
	 BTaElZfW9yVhKEGypc9R+7NE8wX4L1Lr4rtjNMwg=
Date: Fri, 21 Aug 2026 01:26:47 +0100
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
Subject: Re: [PATCH 2/2] kselftest: mm: replace usage of /proc/self/smaps for
 check_huge_xxx() helper
Message-ID: <aoebR7VhQH8kU-xJ@e129823.arm.com>
References: <20260820-fix_split-v1-0-ab430c58c7cf@arm.com>
 <20260820-fix_split-v1-2-ab430c58c7cf@arm.com>
 <DKU1AFIKNMNE.2A0JUVSTKHHLC@nvidia.com>
 <aodxH5Qc6_zVay-M@e129823.arm.com>
 <DKU6OCPNSECE.O9BZZWTSU1H4@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DKU6OCPNSECE.O9BZZWTSU1H4@nvidia.com>

On Thu, Aug 20, 2026 at 08:09:12PM -0400, Zi Yan wrote:
> On Thu Aug 20, 2026 at 5:26 PM EDT, Yeoreum Yun wrote:
> >> On Thu Aug 20, 2026 at 3:40 PM EDT, Yeoreum Yun wrote:
> >> > Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
> >> > glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> >> > made by memalign().
> 
> I just googled the commit and find that Dev did that. ;)
> 
> >> >
> >> > The underlying VMA may start at a different address from the aligned
> >> > address returned by memalign(). Furthermore, a subsequent
> >> > madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
> >> > already set.
> >> >
> >> > This causes split_huge_page_test to fail because the check_huge_xxx()
> >> > helpers incorrectly require the address returned by memalign() to
> >> > match the VMA start address reported in /proc/self/smaps.
> >> >
> >> > Fix this by using /proc/self/pagemap and /proc/kpageflags instead of
> >> > /proc/self/smaps to detect huge pages and change the meaning of
> >> > check_huge_xxx()'s nr_hpages argument:
> >> 
> >> Have you checked Baolin's patches[1] in mm-new? They resue
> >> gather_after_split_folio_orders() to reimplement check_huge_xxx(), also
> >> based on pagemap and kpageflags. Does it fix the issue?
> >> 
> >> [1] https://lore.kernel.org/all/cover.1785985999.git.baolin.wang@linux.alibaba.com/
> >>
> >
> > Unfortunately, No. since __check_pmd_huge() in check_huge_xxx() still use
> > /proc/self/smaps [1] for pmd THP, it still has problem though ths patch
> > series applied.
> >
> > [1] https://lore.kernel.org/all/56b16691f605426b33b5cf47319233de6127a6b3.1785985999.git.baolin.wang@linux.alibaba.com/
> 
> In that case, is it possible to use and extend check_large_folios() for
> all check_huge_xxx()? You still need pagemap_scan_get_categories() to
> check PAGE_IS_HUGE to identify huge mappings. Or at least
> check_huge_xxx() in your patch can share most of the code.

Agree. but TBH, I think check_large_folios() can replace checking
PAGE_IS_HUGE and keep the later part to check wehther PAGE_IS_FILE
and SWAPBACKED according to check_huge_xxx().

BTW, Should I do this after [1] is merged into mm-unstable?

> BTW, in your check_huge_shmem(), expect_huge seems to be inverted
> compared to other check_huge_xxx().

Yes. I've noticed. this was my typo while I change the variable name...

Thanks!

[1] https://lore.kernel.org/all/cover.1785985999.git.baolin.wang@linux.alibaba.com/


> 
> -- 
> Best Regards,
> Yan, Zi
> 

-- 
Sincerely,
Yeoreum Yun
