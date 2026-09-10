Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C6948422E;
	Thu, 10 Sep 2026 12:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042588; cv=none; b=V3OHCwU417NGhqjs3X1eeD8TQnJysR3epbxPWi4x1vbGsaKwn2zKStLLQMSAIQIKkOzMeOiTBP80hxPZ18KXc1ngYdVMTADyDbZ306YZYlX+B8YsiTLaB4hJ+RDPMTQ26wDWtMEcCXq8zXUjdfcgqkzgxzr3nrNsNcShLGS+sz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042588; c=relaxed/simple;
	bh=WsjDDm3IHVIayP7lqsvN5IGMpOV0o7Dhan6Mz0Czqww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDXQe/zT/YVPFw9kH7BxgjwlnGfzLA+cvSd3cYtAqucvAHlQcxth2tY2mGHDkKkAaMLUvSB+arqA10f/DU1qjotPYhyB6xagLo5/1tEwIGtv3+ZkCmxKBuCw18fcdDqTW0XBmquBCjKK+wdj7hpHmRcGtcHnsJ13b5M3j1JjY1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rKBqZ8tB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rKBqZ8tB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66177153B;
	Thu, 10 Sep 2026 05:16:17 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93A343F7B4;
	Thu, 10 Sep 2026 05:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789042581; bh=WsjDDm3IHVIayP7lqsvN5IGMpOV0o7Dhan6Mz0Czqww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rKBqZ8tBO5UMrN0IrTub/1n8Lwwds74nfqPxQ/OQ/OabGnJSIsqQmXDGZWavGtMEs
	 es+6uRxF9Hu4TaVVFyKAjUUjpjjLo8L+5dgrNO1/ek96yTDDYkgz+TIHm7wbwpQID6
	 KXjYDpYNpM8zzs5wmDMhPfRjtb04K3Qo6Qw7ohu0=
Date: Thu, 10 Sep 2026 13:16:14 +0100
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
Subject: Re: [PATCH v5 3/3] kselftest: mm: introduce alloc_isolated_mem()
Message-ID: <aqKfjqa6ye2AOU5k@e129823.arm.com>
References: <20260907-fix_split-v5-0-822b810458bc@arm.com>
 <20260907-fix_split-v5-3-822b810458bc@arm.com>
 <5c05b620-7a2f-453d-9725-fed4f536a019@kernel.org>
 <aqKOVGECsCNtSMIV@e129823.arm.com>
 <d0b3ea99-e20b-4883-8fa3-67fdbf5b1ee4@kernel.org>
 <aqKS7CP67X4h6NiM@e129823.arm.com>
 <31418d0e-9745-4e8d-bc02-dbbd5cb9e193@kernel.org>
 <aqKU0-Gm4yh78F3V@e129823.arm.com>
 <d6f2e6b2-9dc9-4f02-be37-14329c1a6798@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6f2e6b2-9dc9-4f02-be37-14329c1a6798@kernel.org>

> On 9/10/26 13:30, Yeoreum Yun wrote:
> >> On 9/10/26 13:22, Yeoreum Yun wrote:
> >>>
> >>> As I mentioned in my previous reply, what I’m trying to prevent here is
> >>> a failure when checking, immediately after memory allocation,
> >>> that a specific vm_flag is not set.
> >>>
> >>> Yes, I agree that this could have been a problem even before
> >>> the internal changes to memalign(). An unwanted VMA merge could already
> >>> occur at the time of memory allocation.
> >>>
> >>> So what I’m trying to avoid is a test failure where, due to such an
> >>> unexpected VMA merge during allocation, the subsequent check that
> >>> a specific vm_flag is not present fails.
> >> Which is only a guard-region marker problem?
> > 
> > Yes. so if we remove ASSERT_FALSE(check_vmflag_guard(ptr)), TBH
> > we don't need this patch unless other usage comes up to prevent unwanted
> > VMA merge.
> > 
> > Would it be better to drop ASSERT_FALSE(check_vmflag_guard(ptr)) in
> > guard test?
> 
> I guess there is value in asserting that not all VMAs by accident start
> with an over-indication of maybe having guard pages, which is why Lorenzo
> added that check :)
> 
> But I think even alloc_isolated_mem() is wrong in that regard: if the
> original VMA gets merged, we could inherit the guard-marker, no?

True. I overlooked guard bit is sticky.

> 
> Maybe the following would be good enough?
> 
> diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> index 5c8ec3ca75d7d..791bf6a68b9e6 100644
> --- a/tools/testing/selftests/mm/guard-regions.c
> +++ b/tools/testing/selftests/mm/guard-regions.c
> @@ -2257,10 +2257,20 @@ TEST_F(guard_regions, smaps)
>         char *ptr, *ptr2;
>         int i;
> 
> -       /* Map a region. */
> -       ptr = mmap_(self, variant, NULL, 10 * page_size, PROT_READ | PROT_WRITE, 0, 0);
> +       /* Reserve a 10 page region with 1 page space to both sides. */
> +       ptr = mmap_(self, variant, NULL, 12 * page_size, PROT_NONE, 0, 0);
>         ASSERT_NE(ptr, MAP_FAILED);
> 
> +       /* Map a new region that is guaranteed to not get merged in any way. */
> +       ptr = mmap_(self, variant | MAP_FIXED, ptr + pagesize, 10 * page_size,
> +                   PROT_READ | PROT_WRITE, 0, 0);
> +       ASSERT_EQ(ptr, ptr + pagesize);
> +
> +       /* Clean up the excess pages left and right. */
> +       munmap(ptr, pagesize);
> +       munmap(ptr + 11, pagesize);
> +       ptr + = pagesize;
> +
>         /* We shouldn't yet see a guard flag. */
>         ASSERT_FALSE(check_vmflag_guard(ptr));
> 
> -- 
> Cheers,

It's enough but alloc_isolated_mem() could be modified to allocate with
PROT_NONE first and then change the prot.

It seems whether make a helper or testcase should write the code
properly in case of unwanted VMA merge.

IMHO, instead of testcase write them all, it would be better to use
helper (but in guard-region.c, might need to wrapper function, munmap_()
like mmap_()).

-- 
Sincerely,
Yeoreum Yun
