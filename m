Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF1B4A6CF7;
	Wed,  2 Sep 2026 15:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362195; cv=none; b=BEzj1wSbPkgGAQJ2R+BYycPM3WPbH5RsckUc8jUiVCMEwvtLc3DDOlA5xJHU2HO+IgBgkvZ3rNsjkN76s/K6O+V2juASGScLPr0dVVeO2VvQiE+CsoPX/7ht0B0YkW1VKh0d8PJpvPa8zatagQT8Gp21pkOBfqEvY2hstfpTNRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362195; c=relaxed/simple;
	bh=KsyQ1rPRmvCHtzOCo63ii5xx5ue86O70GfpjScs7JMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYNJhx551J93l3sG5UVlWSXv5qvMJYB98sRf/Q9LKxPn7+h+Rb5ilj/9Wqz35jHPJ+U57tJP3iVmE3fc2aAEh7qNDnYWMmh6euKRuUhAcO46Kqo5U9zzr1kpb5esVCDbQO19jxgCS4jI/1EuG+/wROqZ3+GJX4/fVpDGqrdjTw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXZ31SXF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXZ31SXF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE8D1F000E9;
	Wed,  2 Sep 2026 15:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788362193;
	bh=+rQ7EcvByoK4DZLWp9NFal1KQajz/7yVumEJS4KpGI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oXZ31SXFQeKa7qgBq6JYStg/0PJqGBLSHHohhrgz32lgk+c/BNuaqzvv3VETRiUog
	 J6ypkPHFnqifKoYj7ko/uPMsMQt8oDeQ6tkbdn2/Idw8/3gHz812zI0Sq5PIwz5Tr0
	 qK89oRDxGrxDas/68u3QtmLXYmUVsIlXmgIt0oBtSo4/cMHq7pwdCs0F6mMY9ktWez
	 g1W5VS5jLlM2mpaBbVds1crSoi5BGSXqP4RZbNXpHr4qjTL6BQCtpKkZbbj+fEgsd0
	 pBjCEhNDU7Bu6CrdoLsCTBxUmNyiFaCoo3Y7GYFP42ghQ/9UeLsrUiuEGg8ftDgQ7j
	 cjSH4pHVNNRKA==
Date: Wed, 2 Sep 2026 16:16:26 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] kselftest: mm: prevent random failure of huge
 page split for khugepaged
Message-ID: <apg9nqZFSosFyg4E@gremlin>
References: <20260902-fix_split-v4-0-85f03905f7b1@arm.com>
 <20260902-fix_split-v4-1-85f03905f7b1@arm.com>
 <apg7FNLtFO3Ea5qC@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apg7FNLtFO3Ea5qC@gremlin>

On Wed, Sep 02, 2026 at 04:15:17PM +0100, Lorenzo Stoakes (ARM) wrote:

> Maybe call it disable_khugepaged() to make it explicit that's what this is doing
> rather than eliminating any THP pages in the range?
>
> > +{
>
> Maybe a comment here like:
>
> 	/*
> 	 * Disables khugepaged from collapsing THPs in range, existing THP
> 	 * pages remain.
> 	 */
>

Oh and with these changes you can delete all of the:

	/* Prevent khugepaged from collapsing the pages. */

Comments below as they will be implied by the name and explained by the comment
:)

Thanks!

> > +	if (!madvise(addr, len, MADV_NOHUGEPAGE))
> > +		return;
> > +
> > +	ksft_exit_fail_msg("MADV_NOHUGEPAGE failed, err=%d\n", errno);
> > +}
> > +
> >  static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hpages, size_t len)
> >  {
> >  	unsigned long rss_anon_before, rss_anon_after;
> > @@ -180,6 +188,9 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
> >  	if (!rss_anon_before)
> >  		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
> >
> > +	/* Prevent khugepaged from collapsing the pages. */
> > +	madv_nohuge(one_page, len);
> > +
> >  	/* split all THPs */
> >  	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
> >  		      (uint64_t)one_page + len, 0);
> > @@ -227,6 +238,9 @@ static void split_pmd_thp_to_order(int order)
> >  	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 4, pmd_pagesize))
> >  		ksft_exit_fail_msg("No THP is allocated\n");
> >
> > +	/* Prevent khugepaged from collapsing the pages. */
> > +	madv_nohuge(one_page, len);
> > +
> >  	/* split all THPs */
> >  	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
> >  		(uint64_t)one_page + len, order);
> > @@ -275,6 +289,9 @@ static void split_pte_mapped_thp(void)
> >  		goto out;
> >  	}
> >
> > +	/* Prevent khugepaged from collapsing the pages. */
> > +	madv_nohuge(thp_area, thp_area_size);
> > +
> >  	/*
> >  	 * To challenge spitting code, we will mremap a single page of each
> >  	 * THP (page[i] of thp[i]) in the thp_area into page_area. This will
> > @@ -542,6 +559,8 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
> >  		ksft_test_result_skip("Pagecache folio split skipped\n");
> >  		return -2;
> >  	}
> > +	/* Prevent khugepaged from collapsing the pages. */
> > +	madv_nohuge(*addr, fd_size);
> >  	return 0;
> >  err_out_close:
> >  	close(*fd);
> >
> > --
> > 2.43.0
> >
>
> --
> Cheers, Lorenzo

--
Cheers, Lorenzo
