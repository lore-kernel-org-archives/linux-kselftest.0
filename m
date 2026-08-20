Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D51E486BAE;
	Thu, 20 Aug 2026 21:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787261224; cv=none; b=u/a/rgT8rByIlmxRF50H492ymChjiEGfaX5crTqjJhV8WKJvqr+X8awSqDMa0GFIPzGrpkaGUsDfpWZCms0BHGzkjuMZho0wS3rVVy7duF1GqWLx96iNIpMgNTW1/Ts2cZLXX2WncyuSzm7HkwoRwom0Z4ZBSDtUFQ1K6i7Teyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787261224; c=relaxed/simple;
	bh=GtZxJZ2uVfeF4rlVw6qybAWaJ/Pn2JPxWEnBFkpsqmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5y+Dh3sX8pa944mPEDEKg7yhh69uxhuMfXV+rF4L4NoqFhmlhqUr6NApt3O99qstbJLSEY02+0BILYP2OJhFX6JkG/78d7wK6d0VEuCiBAt81FugJE4T1uuFKjI/iEVNSAydMiLeEyhfC6UZ0YRiJZvCtRI6fVSDYHm25Q6pck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QPDSeuHD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QPDSeuHD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A757B202C;
	Thu, 20 Aug 2026 14:26:56 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D49923F763;
	Thu, 20 Aug 2026 14:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787261220; bh=GtZxJZ2uVfeF4rlVw6qybAWaJ/Pn2JPxWEnBFkpsqmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QPDSeuHDSrpGU507oYLegehgj1gVzJa8qOPnvmiKgIYmXPt19bsNUNsaC8wFNCiSP
	 8ZvE88/GUEvv2MoMtV/TDPEfU77YEZm9CSQK7bb/PW21YKcHmSjBlZ4G2w3sNuhR2u
	 warTFMqvZUikr8QuZG1iiiMQ8sz/zHEhMhBJUpog=
Date: Thu, 20 Aug 2026 22:26:55 +0100
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
Message-ID: <aodxH5Qc6_zVay-M@e129823.arm.com>
References: <20260820-fix_split-v1-0-ab430c58c7cf@arm.com>
 <20260820-fix_split-v1-2-ab430c58c7cf@arm.com>
 <DKU1AFIKNMNE.2A0JUVSTKHHLC@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DKU1AFIKNMNE.2A0JUVSTKHHLC@nvidia.com>

> On Thu Aug 20, 2026 at 3:40 PM EDT, Yeoreum Yun wrote:
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
> > /proc/self/smaps to detect huge pages and change the meaning of
> > check_huge_xxx()'s nr_hpages argument:
> 
> Have you checked Baolin's patches[1] in mm-new? They resue
> gather_after_split_folio_orders() to reimplement check_huge_xxx(), also
> based on pagemap and kpageflags. Does it fix the issue?
> 
> [1] https://lore.kernel.org/all/cover.1785985999.git.baolin.wang@linux.alibaba.com/
>

Unfortunately, No. since __check_pmd_huge() in check_huge_xxx() still use
/proc/self/smaps [1] for pmd THP, it still has problem though ths patch
series applied.

[1] https://lore.kernel.org/all/56b16691f605426b33b5cf47319233de6127a6b3.1785985999.git.baolin.wang@linux.alibaba.com/


> >
> >   - nr_hpages > 0: check all of pages in the range are huge page.
> >   - nr_hpages < 0: check all of pages in the range are not huge page.
> >   - nr_hpages == 0: invalid.
> >
> > Reported-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  tools/testing/selftests/mm/khugepaged.c           |  26 ++---
> >  tools/testing/selftests/mm/split_huge_page_test.c |   6 +-
> >  tools/testing/selftests/mm/vm_util.c              | 135 ++++++++++++++++++----
> >  tools/testing/selftests/mm/vm_util.h              |   1 +
> >  4 files changed, 131 insertions(+), 37 deletions(-)
> >
> 
> 
> -- 
> Best Regards,
> Yan, Zi
> 

-- 
Sincerely,
Yeoreum Yun
