Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1620E47143C;
	Thu, 10 Sep 2026 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039348; cv=none; b=B0NC4EKChJwk7bXg664JHPchoBCuCbOwfWfDxuHP45VrqgnALelzp+K0EVjzNfPNLLWZ6fupkiXXBvWLro6XOBb2j5P6DSJFZd8ul1kJIReWR7mhqJ8dKExCRnnBwBc4UgiCUK/5l4Z1sy27HlekWjGRLSPqX6/3Jf5kDUNYq1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039348; c=relaxed/simple;
	bh=38/OLHfK+M+1zXHjINgFF+BX6QfD20XmuFGEDGmyA0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2IZY0n8g+dS3Pj8tO/vM1kMUaenUURBDI14jR9mpZj8dkseaK5qArz2bIk/SPZksN7uVH0YF6ji0P5IZC+oTc7arFUuL+bPX9/B5VoIBpqrMe81oyxBLVWwgIqzIqVQ2ViGYWTAyyU2faMviEagYx66msWI7/u26wEj1Zj+K5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gNyRJvPv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gNyRJvPv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE457153B;
	Thu, 10 Sep 2026 04:22:22 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED7A73F528;
	Thu, 10 Sep 2026 04:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789039346; bh=38/OLHfK+M+1zXHjINgFF+BX6QfD20XmuFGEDGmyA0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gNyRJvPvTorSclWHavC3DluONl2GqzDYewmuGoFwfuSu95jgspzfpgyIeNA5lq8U8
	 2FENBwt8PF8W4hLeiuNSCZvUO7KTGzv0/LxQ42Zm2/QF8gtjerY30MPZpvnQV1+u8K
	 qE7nMiXoExbF3ZBVGOPVjxGpcw/SpJ734ssJvuCA=
Date: Thu, 10 Sep 2026 12:22:20 +0100
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
Message-ID: <aqKS7CP67X4h6NiM@e129823.arm.com>
References: <20260907-fix_split-v5-0-822b810458bc@arm.com>
 <20260907-fix_split-v5-3-822b810458bc@arm.com>
 <5c05b620-7a2f-453d-9725-fed4f536a019@kernel.org>
 <aqKOVGECsCNtSMIV@e129823.arm.com>
 <d0b3ea99-e20b-4883-8fa3-67fdbf5b1ee4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0b3ea99-e20b-4883-8fa3-67fdbf5b1ee4@kernel.org>

On Thu, Sep 10, 2026 at 01:14:42PM +0200, David Hildenbrand (Arm) wrote:
> On 9/10/26 13:02, Yeoreum Yun wrote:
> >>> diff --git a/tools/testing/selftests/mm/soft-dirty.c b/tools/testing/selftests/mm/soft-dirty.c
> >>> index 5f278913c4d7..b6fad38c8bee 100644
> >>> --- a/tools/testing/selftests/mm/soft-dirty.c
> >>> +++ b/tools/testing/selftests/mm/soft-dirty.c
> >>> @@ -92,9 +92,9 @@ static void test_hugepage(int pagemap_fd, int pagesize)
> >>>  	if (!hpage_len)
> >>>  		ksft_exit_fail_msg("Reading PMD pagesize failed");
> >>>  
> >>> -	map = memalign(hpage_len, hpage_len);
> >>> +	map = alloc_isolated_mem(hpage_len, hpage_len);
> >>>  	if (!map)
> >>> -		ksft_exit_fail_msg("memalign failed\n");
> >>> +		ksft_exit_fail_msg("alloc_isolated_mem failed\n");
> >>>  
> >>>  	ret = madvise(map, hpage_len, MADV_HUGEPAGE);
> >>>  	if (ret)
> >>> @@ -130,7 +130,7 @@ static void test_hugepage(int pagemap_fd, int pagesize)
> >>>  		ksft_test_result_skip("Test %s huge page allocation\n", __func__);
> >>>  		ksft_test_result_skip("Test %s huge page dirty bit\n", __func__);
> >>>  	}
> >>> -	free(map);
> >>> +	free_isolated_mem(map, hpage_len);
> >>>  }
> >>
> >> smaps is really only problematic with merged VMAs when relying on exact page
> >> statistics. For other properties (vm flags, MMUPageSize) it's not a problem as
> >> long as our smap search just finds the VMA that covers an address.
> >>
> >> Assuming we fixed check_huge_anon() to not use smaps, why is this change here
> >> required?
> > 
> > Since there is no interface to get vm_flags not via /proc/self/smaps,
> > It might be good to have it for preventing unwanted VMA merge.
> > 
> > And might be useful for future to prevent unwated VMA merge.
> 
> See my reply on why vm flags are generally not a problem. Just like other
> properties that are not changed during VMA merging.
> 
> Let's not perform random code changes without a clear picture.
> 
> And just to emphasize again: VMA merging could already be a problem before
> memalign() internal changes.
> 
> (also observe here how we do a MADV_HUGEPAGE, so this is all rather arbitrary,
> which is not good)

As I mentioned in my previous reply, what I’m trying to prevent here is
a failure when checking, immediately after memory allocation,
that a specific vm_flag is not set.

Yes, I agree that this could have been a problem even before
the internal changes to memalign(). An unwanted VMA merge could already
occur at the time of memory allocation.

So what I’m trying to avoid is a test failure where, due to such an
unexpected VMA merge during allocation, the subsequent check that
a specific vm_flag is not present fails.

I probably didn’t explain this clearly enough and ended up causing
more confusion. Sorry about that.

-- 
Sincerely,
Yeoreum Yun
