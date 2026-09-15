Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9849E3A542B;
	Tue, 15 Sep 2026 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466156; cv=none; b=AL1Fd5DaEAS/9eV+fPepd40rZs2Xva9OxhcKkjr9mfweLiXBlqS23MsRedkgbam4fIq47Jw+7MMPU1UVepA51uByZoiyq/RPMvh1Oj/4tjRlJt4pW4aryJRMU/1XvwnuQSJmYVR4h8/p3fLoxq7IVzAVr4yvNnoPvNUb3HeFyd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466156; c=relaxed/simple;
	bh=EMX0qo0UVNl8ZepEUC0xv4Vnnqu93XsGXG70yuuxNL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5PYaf5Z+5O8hWrNJIIU1TEzZ1zoT3R8sjMHCl5TSxwVO5glDqkZNBqAOq4f1moOYb91bsihuRtqpxDuokTs/7hnqIvnSe70mQt3PTPCjsx/hjcE672QcLknLrfvxdGTzEvSz9mxmm0Ynwsop0HFeObs6gmN3lidbH32mfFxSW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JE6cUinM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JE6cUinM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C13372F;
	Tue, 15 Sep 2026 02:55:48 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48EC33F86F;
	Tue, 15 Sep 2026 02:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789466152; bh=EMX0qo0UVNl8ZepEUC0xv4Vnnqu93XsGXG70yuuxNL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JE6cUinMBVzNN/8G8PAV+q/DwLtm+ojw5bdV9l6TOJOydpHbph85gxXY1F7jFZ4vG
	 /YwhPyNEYiG5oNo2F7+/18eIKpdrhCPCxHVqPbFUphvjwZcnAJ+BP1VPZLpyHZhG4z
	 PFIPbTHfDiKNsqVc7+Nl/mmYxwcXR8PBoZetoyMw=
Date: Tue, 15 Sep 2026 10:55:46 +0100
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
Subject: Re: [PATCH v6 3/3] kselftest: mm: remove check_huge_shmem()
Message-ID: <aqkWIrqfuHDop8P4@e129823.arm.com>
References: <20260914-fix_split-v6-0-16ed7123800b@arm.com>
 <20260914-fix_split-v6-3-16ed7123800b@arm.com>
 <1be327b0-aec3-4b46-9a96-c701e87d3c3a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1be327b0-aec3-4b46-9a96-c701e87d3c3a@kernel.org>

On Mon, Sep 14, 2026 at 04:16:40PM +0200, David Hildenbrand (Arm) wrote:
> On 9/14/26 09:30, Yeoreum Yun wrote:
> > check_huge_shmem() was required to distinguish shmem huge pages because
> > /proc/self/smaps reports them using a dedicated “ShmemPmdMapped” entry,
> > as opposed to “FilePmdMapped” for file-backed huge pages.
> > 
> > Now that /proc/self/smaps is no longer used to detect huge pages and
> > /proc/kpageflags is used instead, it is sufficient to distinguish
> > between file-backed and anonymous pages since the ShmemPmdMapped is also
> > kind of file-backed.
> > 
> > Therefore, remove check_huge_shmem() and use check_huge_file() instead.
> > 
> > Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  tools/testing/selftests/mm/folio_split_race_test.c |  2 +-
> >  tools/testing/selftests/mm/khugepaged.c            |  5 ++---
> >  tools/testing/selftests/mm/uffd-common.c           |  4 ++--
> >  tools/testing/selftests/mm/vm_util.c               | 11 +----------
> >  tools/testing/selftests/mm/vm_util.h               |  2 --
> >  5 files changed, 6 insertions(+), 18 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/mm/folio_split_race_test.c b/tools/testing/selftests/mm/folio_split_race_test.c
> > index 1960635a953e..4c0d3b6a411b 100644
> > --- a/tools/testing/selftests/mm/folio_split_race_test.c
> > +++ b/tools/testing/selftests/mm/folio_split_race_test.c
> > @@ -182,7 +182,7 @@ static uint64_t run_iteration(void)
> >  	for (i = 0; i < TOTAL_PAGES; i++)
> >  		fill_page(mmap_base, i);
> >  
> > -	if (!check_huge_shmem(mmap_base, FILE_SIZE, NR_PMD_PAGE, pmd_pagesize))
> > +	if (!check_huge_file(mmap_base, FILE_SIZE, NR_PMD_PAGE, pmd_pagesize))
> >  		ksft_exit_fail_msg("No shmem THP is allocated\n");
> >  
> >  	if (pthread_barrier_init(&ctl.barrier, NULL, NUM_READER_THREADS + 1) != 0)
> > diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> > index f82673f5f6b4..6cd1effea465 100644
> > --- a/tools/testing/selftests/mm/khugepaged.c
> > +++ b/tools/testing/selftests/mm/khugepaged.c
> > @@ -416,9 +416,8 @@ static bool file_check_huge(void *addr, size_t len, int nr_hpages,
> >  {
> >  	switch (finfo.type) {
> >  	case VMA_FILE:
> > -		return check_huge_file(addr, len, nr_hpages, hpage_size);
> >  	case VMA_SHMEM:
> > -		return check_huge_shmem(addr, len, nr_hpages, hpage_size);
> > +		return check_huge_file(addr, len, nr_hpages, hpage_size);
> >  	default:
> >  		ksft_exit_fail_msg("Unknown VMA type\n");
> >  		return false;
> 
> 
> Assuming we do:
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index f82673f5f6b47..9542173a748e2 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -53,7 +53,7 @@ struct mem_ops {
>         void *(*setup_area)(int nr_hpages);
>         void (*cleanup_area)(void *p, unsigned long size);
>         void (*fault)(void *p, unsigned long start, unsigned long end);
> -       bool (*check_huge)(void *addr, size_t len, int nr_hpages, unsigned long hpage_size);
> +       bool (*check_huge)(void *addr, size_t len, int nr_hpages, uint64_t hpage_size);
>         const char *name;
>  };
> 
> 
> Could we then simply use check_huge_anon/check_huge_file directly and get rid of
> these helpers anon_check_huge + check_huge_file entirely?

Yeap. I'll follow your suggetion. Thanks!

-- 
Sincerely,
Yeoreum Yun
