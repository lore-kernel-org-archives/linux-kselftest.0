Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DAD44AB9A;
	Fri, 28 Aug 2026 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927749; cv=none; b=SAM2FVgLu2qZi0u5/bTD2zkcCnqlQNdT/qoYsbbf89+PGYvfrrtsWen/OLcYQwr9i6yY3xt7KmiepaBc/jEI0Li6Rp4P51IdUbPPiqTESUtwhkiUbCKBF6sXes1XlEwYwmg9l4jBftKxKrF3KC9vBh5NHcr+pCzGieA1BhgREtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927749; c=relaxed/simple;
	bh=GEQqJb7ZJiF14KfX2zAfeBZ+4mYFVAPuL2qPuZG//aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXi6I8eAlSr3xAq07wZF/LEfYukfozOi9ysuWHQrvBGP5xUXwCL4i4dGoQlkFdQ7vSCnn5llryUa5cfZVx3wdZ00dUSsYUSKsGqsoN6wjYN8RO0FEYk0DsoCzBc91Q/Dxceu5Xjz4Iyyak0rHl22QWwxPcyHCInb9RHSeoyMBOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AGSQi1TR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AGSQi1TR"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E222514BF;
	Fri, 28 Aug 2026 07:35:40 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E25A3F85F;
	Fri, 28 Aug 2026 07:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787927744; bh=GEQqJb7ZJiF14KfX2zAfeBZ+4mYFVAPuL2qPuZG//aI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AGSQi1TRSmfg1FbkdYNLZ5UNAIsnrubMGwlnDXd24eTlDAbdHp/EqlnBucndUmOEZ
	 Gpq1XJr3O0EurkEBuWYPt7LZ+ks20tqbTNqw4LhoGb61ZWGMpzqV88Hr0ylm+QmzL1
	 N8hpkSXNAAeKy6SQzzxdVpf+8f/6FTcNzHTYbCQA=
Date: Fri, 28 Aug 2026 15:35:39 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
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
Message-ID: <apGcu_haNc93cnzU@e129823.arm.com>
References: <20260828-fix_split-v3-0-374022586a4b@arm.com>
 <20260828-fix_split-v3-2-374022586a4b@arm.com>
 <apFMvo8pCzaGKope@gremlin>
 <apFgVvNMbdhYnu6p@e129823.arm.com>
 <apFhDA4e1sBfDOeh@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apFhDA4e1sBfDOeh@gremlin>

> On Fri, Aug 28, 2026 at 11:17:58AM +0100, Yeoreum Yun wrote:
> > > On Fri, Aug 28, 2026 at 09:11:34AM +0100, Yeoreum Yun wrote:
> > > > Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
> > > > glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> > > > made by memalign().
> > > >
> > > > The underlying VMA may start at a different address from the aligned
> > > > address returned by memalign(). Furthermore, a subsequent
> > > > madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
> > > > already set.
> > > >
> > > > This causes split_huge_page_test to fail because the check_huge_xxx()
> > > > helpers incorrectly require the address returned by memalign() to
> > > > match the VMA start address reported in /proc/self/smaps.
> > >
> > > Hmm, is the test correctly putting sentinels either side of the VMA? Any test
> > > that doesn't risks flaking due to unwanted VMA merges.
> >
> > I believe that with this change, we don’t need to worry about unwanted
> > VMA merges when checking for huge pages, since the test no longer relies
> > on VMA sentinels but directly checks whether the mapping is huge or not.
> 
> We always need to worry about that though, anything that asserts stuff on a
> VMA level must prevent unwanted merges first.
> 
> I guess I'm asking you in a roundabout way to go check and if there isn't
> isolation like that (i.e. mapping PROT_NONE VMAs around the VMA you want)
> then to go do that :)

Oh. Sorry not to catch your intend. not for only this series but for
the future usage, might it sound reasonable to add some mem alloca
fucntion for the test which could replace memalign() with above concept.

> I think glibc going off and mapping a bigger VMA is possibly a symptom
> of this not being done.

TBH, what user would generally care whether VMAs are merged or not?
Anyway, it would be better to add a helper with some PROT_NONE guards
to prevent unwanted VMA merges while testing.

> 
> >
> > Also, this flaky failure was not caused by a VMA merge, but by a change
> > in glibc’s behavior that sets HUGEPAGE for sufficiently large areas.
> 
> Yep your change is worthwhile reagrdless! :)

Thanks :)

> 
> >
> > Might for the *NO_HUGEPAGE* setup, there would be a chance to merge
> > VMA area, But since it seraches the mapping directly, it's fine.
> 
> As above, generally we should put this protection in case, even if it's
> unlikely for a VMA with VMA_NOHUGEPAGE_BIT set!

Agree. let me add one for this and replace memalign() used in
khugepagd and split_huge_page_test at first.
> 
> >
> > >
> > > >
> > > > Fix this by using /proc/self/pagemap and /proc/kpageflags instead of
> > > > /proc/self/smaps to detect huge pages.
> > >
> > > You should probably call out the fact you're doing some refactoring here
> > > also!
> >
> > Okay. I'll spell out with some detail. Thanks!
> 
> Thnks!
> 
> >
> > >
> > > >
> > > > Reported-by: David Hildenbrand (Arm) <david@kernel.org>
> > >
> > > Should always have a Closes: tag if Reported-by: ideally.
> >
> > Yes. but talked with personally nothing to close. So Reported-by tag
> > only. Would it be better to remove?
> 
> Yeah or Suggested-by maybe? If he said it to you on-list then a Closes:
> <lore link> works also!

Okay. I'll drop the Reported-by: and change to Suggseted-by.

Thanks!

-- 
Sincerely,
Yeoreum Yun
