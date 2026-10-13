Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05E2477998;
	Tue, 13 Oct 2026 19:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919062; cv=none; b=LzUrNT65Cu5rJcGbjpIKw7cso/II+0tv58ChO7aX7E5mun+eOUAZiuvl/ETFIYsNlI9p3gArTmDktHgQO0d3OSUd8y7LFR90LHsFnz19/vqIkqpw2RRxMMr5bXW9+x0mgdQzT5371SQ3d++W5fQ4+JOeM9KSxlW8b/+26M7RjX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919062; c=relaxed/simple;
	bh=tRmtvDD+61LFKfAJ/yki7gSA1SbAatoyJ8YHNw34tdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2lLLduqbqQnRTGcjWDRq81p2akbTba81VKg8as53SaTi9RdNpIb1AU/69hEFDFnCtCPKiNlxGg7JIsnxuLUndXLA49OjB6rIwJWQCn7ife0FQGfq40tkobvPxtstiAxY3e+pjzjQKqp2DZW/TXOLXvGs/k34qsFpfy0JP0wQkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WZ+WynWL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WZ+WynWL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3042169E;
	Tue, 13 Oct 2026 12:17:29 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09EDC3F673;
	Tue, 13 Oct 2026 12:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791919053; bh=tRmtvDD+61LFKfAJ/yki7gSA1SbAatoyJ8YHNw34tdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WZ+WynWLIZdtuXPjx12fDmi2/pks5e8wzTiXdv+ov6cMjm4fRm1eMnLdkSsZ8IEPJ
	 EXYq7kH/LMqkn111w8u5DtTR7w/3k1Q2UIt9wTEvxCdftys8LM/frPxDZgJCF0vZj1
	 nhAA2D+UAS9mmZIYpHPo5U1fPCjJ+I8OEGC+DUB0=
Date: Tue, 13 Oct 2026 20:17:27 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH v7 2/3] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT
 macro
Message-ID: <as6Dx5WkvTQty9K5@e129823.arm.com>
References: <20261013-fix_hpage_macro-v7-0-3d77129e0557@arm.com>
 <20261013-fix_hpage_macro-v7-2-3d77129e0557@arm.com>
 <b3f2a0bf-7b41-4cc9-958e-34f1a88ff5bf@arm.com>
 <as48D1SnImCro_Cb@e129823.arm.com>
 <aca0492c-f0d3-4ba7-8671-32952ceff913@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aca0492c-f0d3-4ba7-8671-32952ceff913@arm.com>

Hi Sarthak,
> 
> 
> On 10/13/26 7:41 PM, Yeoreum Yun wrote:
> >> Hi Yeoreum!
> >>
> >> On 10/13/26 4:07 PM, Yeoreum Yun wrote:
> >>> HPAGE_SIZE and HPAGE_SHIFT macro is written based on the 4KB PAGE_SIZE.
> >>> When this macro is used in some test, test result would be strange in
> >>> the system where PAGE_SIZE is more then 4KB.
> >>>
> >>> Here is the example with transhuge-stress test with 16KB PAGE_SIZE:
> >>>
> >>>   transhuge-stress: allocate 61073 transhuge pages, using 122146 MiB virtual memory and 1908 MiB of ram
> >>>     3.292 s/loop, 0.054 ms/page,  37106.002 MiB/s	2566 succeed, 58507 failed, 2566 different pages
> >>>     0.591 s/loop, 0.010 ms/page, 206850.792 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >>>     0.527 s/loop, 0.009 ms/page, 231895.107 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >>>     0.527 s/loop, 0.009 ms/page, 231839.704 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >>>     0.528 s/loop, 0.009 ms/page, 231544.782 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >>>     0.528 s/loop, 0.009 ms/page, 231462.074 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >>>     0.527 s/loop, 0.009 ms/page, 231770.300 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >>>     ...
> >>>   ok 1 Completed
> >>>
> >>> Remove the HPAGE_SIZE and HPAGE_SHIFT macro and introduce pmd_pshift()
> >>> helper to get the HPAGE_SHIFT properly. For HPAGE_SIZE, use pre-existing
> >>> helper, pmd_psize().
> >>>
> >>> Also, run the KSM_MERGE_TIME_HUGE_PAGES test with a size of 512 MiB,
> >>> which is the least common multiple of the PMD sizes for 4 KiB, 16 KiB,
> >>> and 64 KiB base pages. Since allocate_transhuge() allocates mappings in
> >>> PMD-sized units, the test may fail with the previous size of 100 MiB,
> >>> which is not a multiple of the PMD size when the base page size is
> >>> 16 KiB or 64 KiB.
> >>>
> >>> After this patch, output of transhuge-stress:
> >>>
> >>>   transhuge-stress: allocate 3817 transhuge pages, using 122146 MiB virtual memory and 119 MiB of ram
> >>>     2.558 s/loop, 0.670 ms/page,  47755.759 MiB/s	2585 succeed, 1232 failed, 2585 different pages
> >>>     2.640 s/loop, 0.692 ms/page,  46268.432 MiB/s	2585 succeed, 1232 failed, 2585 different pages
> >>>     2.635 s/loop, 0.690 ms/page,  46360.298 MiB/s	2585 succeed, 1232 failed, 2585 different pages
> >>>     2.782 s/loop, 0.729 ms/page,  43899.795 MiB/s	2616 succeed, 1201 failed, 2616 different pages
> >>>     2.692 s/loop, 0.705 ms/page,  45380.876 MiB/s	2627 succeed, 1190 failed, 2627 different pages
> >>>     2.612 s/loop, 0.684 ms/page,  46765.812 MiB/s	2628 succeed, 1189 failed, 2628 different pages
> >>>     2.683 s/loop, 0.703 ms/page,  45520.990 MiB/s	2630 succeed, 1187 failed, 2630 different pages
> >>>     2.727 s/loop, 0.714 ms/page,  44789.321 MiB/s	2631 succeed, 1186 failed, 2631 different pages
> >>>     ...
> >>>   ok 1 Completed
> >>>
> >>> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> >>> ---
> >>>  tools/testing/selftests/mm/guard-regions.c    | 10 +++++--
> >>>  tools/testing/selftests/mm/ksm_tests.c        | 16 ++++++-----
> >>>  tools/testing/selftests/mm/run_vmtests.sh     |  4 +--
> >>>  tools/testing/selftests/mm/transhuge-stress.c | 25 +++++++++++-------
> >>>  tools/testing/selftests/mm/vm_util.c          | 38 +++++++++++++++++++++++----
> >>>  tools/testing/selftests/mm/vm_util.h          |  9 +++----
> >>>  6 files changed, 71 insertions(+), 31 deletions(-)
> >>>
> >>> diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> >>> index f7d53ea3c2527..02f69244f9a42 100644
> >>> --- a/tools/testing/selftests/mm/guard-regions.c
> >>> +++ b/tools/testing/selftests/mm/guard-regions.c
> >>> @@ -2194,14 +2194,20 @@ TEST_F(guard_regions, pagemap_scan)
> >>>  TEST_F(guard_regions, collapse)
> >>>  {
> >>>  	const unsigned long page_size = self->page_size;
> >>> -	const unsigned long size = 2 * HPAGE_SIZE;
> >>> -	const unsigned long num_pages = size / page_size;
> >>> +	const uint64_t hpage_size = pmd_psize();
> >>> +	unsigned long size, num_pages;
> >>>  	char *ptr;
> >>>  	int i;
> >>>  
> >>>  	if (!thp_available())
> >>>  		SKIP(return, "Transparent Hugepages not available\n");
> >>>  
> >>> +	if (!hpage_size)
> >>> +		ksft_exit_fail_msg("reading hpage_size failed\n");
> >>
> >> I'm sorry for not catching this earlier, but I don't think calling a
> >> ksft_exit_fail_msg() for not being able to calculate PMD size is a good
> >> idea. Maybe call an ASSERT*() here, something like
> >>
> >> ASSERT_NE(hpage_size, 0);
> >>
> >> so that just this test fails, instead of the whole run exiting with a
> >> bail out?
> > 
> > No. The failure would occur if open() or read() fails, and subsequent
> > attempts would likely fail for the same reason.
> 
> I think I couldn't clearly explain my concern. Let me put it again,
> please let me know if I am missing something.
> 
> I was mistaken, on checking I found that guard_regions runs each test in
> a separate child process. So calling ksft_exit_fail_msg() won't exit the
> whole test run.
> 
> To reproduce the case, I bind mounted /dev/null over
> /sys/kernel/mm/transparent_hugepage/hpage_pmd_size in a QEMU so that
> pmd_psize() returns 0. Then on running ./guard_regions (your patches
> applied), I got this output (putting relevant section of that since the
> log is quite long):
> 
> 
> #  RUN           guard_regions.anon.collapse ...
> Bail out! reading hpage_size failed
> # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> # collapse: Test failed
> #          FAIL  guard_regions.anon.collapse
> not ok 29 guard_regions.anon.collapse
> .
> .
> ok 58 guard_regions.shmem.pagemap_scan
> #  RUN           guard_regions.shmem.collapse ...
> Bail out! reading hpage_size failed
> # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> # collapse: Test failed
> #          FAIL  guard_regions.shmem.collapse
> not ok 59 guard_regions.shmem.collapse
> .
> .
> #  RUN           guard_regions.file.collapse ...
> Bail out! reading hpage_size failed
> # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> # collapse: Test failed
> #          FAIL  guard_regions.file.collapse
> not ok 89 guard_regions.file.collapse
> #  RUN           guard_regions.file.smaps ...
> #            OK  guard_regions.file.smaps
> ok 90 guard_regions.file.smaps
> # FAILED: 87 / 90 tests passed.
> # 19 skipped test(s) detected. Consider enabling relevant config options
> to improve coverage.
> # Totals: pass:68 fail:3 xfail:0 xpass:0 skip:19 error:0
> 
> 
> which looks weird with all the bailouts. On the other hand, if we
> replace the ksft_exit_fail_msg() with ASSERT_NE(), here's the output we get:
> 
> 
> #  RUN           guard_regions.anon.collapse ...
> # guard-regions.c:2205:collapse:Expected hpage_size (0) != 0 (0)
> # collapse: Test terminated by assertion
> #          FAIL  guard_regions.anon.collapse
> not ok 29 guard_regions.anon.collapse
> .
> .
> ok 58 guard_regions.shmem.pagemap_scan
> #  RUN           guard_regions.shmem.collapse ...
> # guard-regions.c:2205:collapse:Expected hpage_size (0) != 0 (0)
> # collapse: Test terminated by assertion
> #          FAIL  guard_regions.shmem.collapse
> not ok 59 guard_regions.shmem.collapse
> .
> .
> #  RUN           guard_regions.file.collapse ...
> # guard-regions.c:2205:collapse:Expected hpage_size (0) != 0 (0)
> # collapse: Test terminated by assertion
> #          FAIL  guard_regions.file.collapse
> not ok 89 guard_regions.file.collapse
> #  RUN           guard_regions.file.smaps ...
> #            OK  guard_regions.file.smaps
> ok 90 guard_regions.file.smaps
> # FAILED: 87 / 90 tests passed.
> # 19 skipped test(s) detected. Consider enabling relevant config options
> to improve coverage.
> # Totals: pass:68 fail:3 xfail:0 xpass:0 skip:19 error:0
> 
> So the issue is not as severe as I'd thought. It can be argued that this
> is very less likely to happen. But yeah, I feel changing it would be
> better as it is more suitable with the ksefltest_harness and would give
> a cleaner TAP output incase this happens. Rest I leave it to you and
> other folks to decide whether this needs to be changed :).

Still I don't think it would be more suitable with kselftest_harness.
Anyway what I can see it's a only difference of the *message* --
"Bail out! reading hpage_size failed" vs "Expected hpage_size (0) != 0 (0)"

TBH, I don't think this difference makes the TAP output any cleaner.
I think it's sufficient as long as the message clearly explains the reason
for the failure.

-- 
Sincerely,
Yeoreum Yun
