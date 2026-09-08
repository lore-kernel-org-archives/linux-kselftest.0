Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB07440D57B
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855822; cv=none; b=DB00yDG2qe3X0WX1b2lzs+YYXGQDqEf08r/WfZRDiPSa2HUkIKZryy5We4/atI9tAtRGFpEoNyfyX/kRcRmM0CMpB7NL5Er+PUl1p3SpZK5lW43lzL24FVjNXxCO+a6A18TNlAB2LvOa76HmhdRMOarw5OnMlhsbou9Jfid3ucM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855822; c=relaxed/simple;
	bh=1cshaF9KXvhKzHME6ySEbcQXIVVb85vLyjPK5BazCe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMO0yH/ZrNDTgbWmZyWCOlzGZl3AFUeiN6LmZM3GMojc/figxZP+5XtPrfnnLvcMxnYPRRyvNVBa+bURLuFCsCUWrN8akBpm2R0RC0oa9XSk1a/tU1845Brs4sGSqa2JOa2GsYC5Hkwn1KXqB/oFGYO3ah5LkWMNBwcErvw6kQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MVQe8hDh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MVQe8hDh"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4D541476;
	Tue,  8 Sep 2026 01:23:34 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C92EC3F528;
	Tue,  8 Sep 2026 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788855818; bh=1cshaF9KXvhKzHME6ySEbcQXIVVb85vLyjPK5BazCe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MVQe8hDhvHDJEfbmH6OxwpGF7JrA+cKvf+eM5DA98nWOwzCUZt6oBa0ssa+ju3Mkm
	 PCZGEsWp8AR9FtSmK+Qo2N+uilBWdwAAIOaMTQ9mz6x/Am4CuQBfjAZSq+dk3mEqXS
	 bUqpSqAhr05lk48Y+WIvAfdG0HJ0Z8TvGxFO8IFU=
Date: Tue, 8 Sep 2026 09:23:33 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev,
	kas@kernel.org, sarthak.sharma@arm.com
Subject: Re: [PATCH v2] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT macro
Message-ID: <ap_GBdbMIkasmVO4@e129823.arm.com>
References: <20260907081509.924979-1-yeoreum.yun@arm.com>
 <9f8c6e91-c1c8-4ec5-96a9-9d6d4ab571cc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f8c6e91-c1c8-4ec5-96a9-9d6d4ab571cc@kernel.org>

On Mon, Sep 07, 2026 at 04:36:56PM +0200, David Hildenbrand (Arm) wrote:
> On 9/7/26 10:15, Yeoreum Yun wrote:
> > HPAGE_SIZE and HPAGE_SHIFT macro is written based on the 4KB PAGE_SIZE.
> > When this macro is used in some test, test result would be strange in
> > the system where PAGE_SIZE is more then 4KB.
> > 
> > Here is the example with transhuge-stress test with 16KB PAGE_SIZE:
> > 
> >   transhuge-stress: allocate 61073 transhuge pages, using 122146 MiB virtual memory and 1908 MiB of ram
> >     3.292 s/loop, 0.054 ms/page,  37106.002 MiB/s	2566 succeed, 58507 failed, 2566 different pages
> >     0.591 s/loop, 0.010 ms/page, 206850.792 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >     0.527 s/loop, 0.009 ms/page, 231895.107 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >     0.527 s/loop, 0.009 ms/page, 231839.704 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >     0.528 s/loop, 0.009 ms/page, 231544.782 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >     0.528 s/loop, 0.009 ms/page, 231462.074 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >     0.527 s/loop, 0.009 ms/page, 231770.300 MiB/s	   0 succeed, 61073 failed,    0 different pages
> >     ...
> >   ok 1 Completed
> > 
> > Remove the HPAGE_SIZE and HPAGE_SHIFT macros and introduce pmd_page_shift()
> > helper to get the HPAGE_SHIFT properly. For HPAGE_SIZE, use pre-existing
> > helper, read_pmd_pagesize().
> > 
> > Also, run the KSM_MERGE_TIME_HUGE_PAGES test with a size of 512 MiB,
> > which is the least common multiple of the PMD sizes for 4 KiB, 16 KiB,
> > and 64 KiB base pages. Since allocate_transhuge() allocates mappings in
> > PMD-sized units, the test may fail with the previous size of 100 MiB,
> > which is not a multiple of the PMD size when the base page size is
> > 16 KiB or 64 KiB.
> > 
> > After this patch, output of transhuge-stress:
> > 
> >   transhuge-stress: allocate 3817 transhuge pages, using 122146 MiB virtual memory and 119 MiB of ram
> >     2.558 s/loop, 0.670 ms/page,  47755.759 MiB/s	2585 succeed, 1232 failed, 2585 different pages
> >     2.640 s/loop, 0.692 ms/page,  46268.432 MiB/s	2585 succeed, 1232 failed, 2585 different pages
> >     2.635 s/loop, 0.690 ms/page,  46360.298 MiB/s	2585 succeed, 1232 failed, 2585 different pages
> >     2.782 s/loop, 0.729 ms/page,  43899.795 MiB/s	2616 succeed, 1201 failed, 2616 different pages
> >     2.692 s/loop, 0.705 ms/page,  45380.876 MiB/s	2627 succeed, 1190 failed, 2627 different pages
> >     2.612 s/loop, 0.684 ms/page,  46765.812 MiB/s	2628 succeed, 1189 failed, 2628 different pages
> >     2.683 s/loop, 0.703 ms/page,  45520.990 MiB/s	2630 succeed, 1187 failed, 2630 different pages
> >     2.727 s/loop, 0.714 ms/page,  44789.321 MiB/s	2631 succeed, 1186 failed, 2631 different pages
> >     ...
> >   ok 1 Completed
> > 
> > Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> 
> 
> [...]
> 
> > diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> > index d09f9f6a384e..24aa1de27c25 100755
> > --- a/tools/testing/selftests/mm/run_vmtests.sh
> > +++ b/tools/testing/selftests/mm/run_vmtests.sh
> > @@ -360,8 +360,8 @@ fi
> >  CATEGORY="memfd_secret" run_test ./memfd_secret
> >  fi
> >  
> > -# KSM KSM_MERGE_TIME_HUGE_PAGES test with size of 100
> > -CATEGORY="ksm" run_test ./ksm_tests -H -s 100
> > +# KSM KSM_MERGE_TIME_HUGE_PAGES test with size of 512
> > +CATEGORY="ksm" run_test ./ksm_tests -H -s 512
> 
> 
> Why the magic value 512? (desrves a comment)
> 
> A clear sign that the ksm tests must be rewritten to be standalone and just
> handle this internally. @Sarthak

Acked. I thought it's enough to spell out in commit message but
I'll spell out into comment too in this round not refactorying by me
for ksm test.

> 
> >  # KSM KSM_MERGE_TIME test with size of 100
> >  CATEGORY="ksm" run_test ./ksm_tests -P -s 100
> >  # KSM MADV_MERGEABLE test with 10 identical pages
> 
> [...]
> 
> > index 4821a3563036..f75bf0bacd18 100644
> > --- a/tools/testing/selftests/mm/vm_util.c
> > +++ b/tools/testing/selftests/mm/vm_util.c
> > @@ -21,6 +21,8 @@
> >  
> >  unsigned int __page_size;
> >  unsigned int __page_shift;
> > +uint64_t __pmd_page_size;
> > +uint64_t __pmd_page_shift;
> >  
> >  uint64_t pagemap_get_entry(int fd, char *start)
> >  {
> > @@ -161,6 +163,9 @@ uint64_t read_pmd_pagesize(void)
> >  	char buf[20];
> >  	ssize_t num_read;
> >  
> > +	if (__pmd_page_size)
> > +		return __pmd_page_size;
> > +
> >  	fd = open(PMD_SIZE_FILE_PATH, O_RDONLY);
> >  	if (fd == -1)
> >  		return 0;
> > @@ -173,7 +178,25 @@ uint64_t read_pmd_pagesize(void)
> >  	buf[num_read] = '\0';
> >  	close(fd);
> >  
> > -	return strtoul(buf, NULL, 10);
> > +	__pmd_page_size = strtoul(buf, NULL, 10);
> > +
> > +	return __pmd_page_size;
> > +}
> > +
> > +uint64_t pmd_page_shift(void)
> > +{
> > +	if (__pmd_page_shift)
> > +		return __pmd_page_shift;
> > +
> > +	if (!__pmd_page_size)
> > +		__pmd_page_size = read_pmd_pagesize();
> > +
> > +	if (!__pmd_page_size)
> > +		return 0;
> > +
> > +	__pmd_page_shift = (ffsl(__pmd_page_size) - 1);
> > +
> > +	return __pmd_page_shift;
> >  }
> The interface is a bit inconsistent.
> 
> read_pmd_pagesize() vs. pmd_page_shift().
> 
> Consider renaming read_pmd_pagesize() to pmd_pagesize() in a cleanup patch.

Okay.

> ... or (better?) adding a size_to_shift() helper instead?
> 
> I think most places that want the shift also want the size.
> 
> So this can just be
> 
> const uint64_t hpage_size = read_pmd_pagesize();
> const uint64_t hpage_shift = size_to_shift(hpage_size);
> 
> 
> In size_to_shift(), you can just handle
> 
> if (size == 0)
> 	return 0;

Hmm, most of tests care mainly two sizes and shiftes --
psize()/pshift() and pmd_pagesize() and pmd_pageshift().

Would it be better to keep both kinda of helpers and
add size_to_shift() helper for nother hpage size then?

-- 
Sincerely,
Yeoreum Yun
