Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6CA3DE44C;
	Fri, 28 Aug 2026 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911488; cv=none; b=GEIotMa+07IZGc5o2xojTMM//88x9FEz3UrEwKHHcmMAykmkS2/7Spq+ERdMCNFAmWqGpFmm5IKqnVMSS3pgKNrMSW9AksaPJiuNVnf6+Y5dVaxLgEBJXaA4PlkTuDvZ56Ga4VmsoS5Cv+gqT6VB9K2M1I9TSIqkeFKuv/xCh48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911488; c=relaxed/simple;
	bh=aumBSDnENz5VHBnc+jg6Re4gRmKjWjReCkyLV/sOPr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2qXykEFl3kUlpb2mxa8EkTA4my69T4ed57oDcjb/XVKC8PPD4046efnEgvNGyKwCsl2h7tQK2w7ukRZaPoalh+lpwOL3SFCDavfM5sl3B7SnyUkHr/nEBUAvaFSjznEx2HdnchxavAZDCR/oxjnd2vVd9tfpidGPBwL4lUOnFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=P0pj3wCI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="P0pj3wCI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB8101595;
	Fri, 28 Aug 2026 03:04:39 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 296B53F85F;
	Fri, 28 Aug 2026 03:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787911483; bh=aumBSDnENz5VHBnc+jg6Re4gRmKjWjReCkyLV/sOPr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0pj3wCIhsi+UzojrdVHcOu1eEF6Lj5JFlSy0yBfViLLp6P5WyERT4jzhkYA9pKXT
	 ZcGJhuKYlxe3MX+Zafvy1SCiglBGhK+rnuLve3kU3HVmbki9TqcimksfNEDV3Mzk8Y
	 L/Cwgjc5sHUtFnJUvtxp624zelSBigJfXmV/yBs4=
Date: Fri, 28 Aug 2026 11:04:38 +0100
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
Subject: Re: [PATCH v3 1/2] kselftest: mm: prevent random failure of huge
 page split for khugepaged
Message-ID: <apFdNhauXl3z7nu4@e129823.arm.com>
References: <20260828-fix_split-v3-0-374022586a4b@arm.com>
 <20260828-fix_split-v3-1-374022586a4b@arm.com>
 <apFWAppcVKt4xhIT@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apFWAppcVKt4xhIT@gremlin>

Hi Lorenzo,
> >  	if (!rss_anon_before)
> >  		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
> >
> > +	/* Prevent khugepaged from collapsing the pages. */
> > +	if (madvise(one_page, len, MADV_NOHUGEPAGE))
> > +		ksft_print_msg("madvise(MADV_NOHUGEPAGE) failed\n");
> 
> This should probably terminate the test no? There's no reason to expect this to
> fail and it's better to fail then to risk a flake :)

Okay. I thought it was rare, it seemed enough with just message.
I'll change with your suggesttion.

> 
> > +
> >  	/* split all THPs */
> >  	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
> >  		      (uint64_t)one_page + len, 0);
> > @@ -227,6 +231,10 @@ static void split_pmd_thp_to_order(int order)
> >  	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 4, pmd_pagesize))
> >  		ksft_exit_fail_msg("No THP is allocated\n");
> >
> > +	/* Prevent khugepaged from collapsing the pages. */
> > +	if (madvise(one_page, len, MADV_NOHUGEPAGE))
> > +		ksft_print_msg("madvise(MADV_NOHUGEPAGE) failed\n");
> > +
> 
> Same comment as above, also since this is a repeated pattern, I think it's worth
> abstracting it like:
> 
> 	static void madv_nohuge(char *ptr, size_t len)
> 	{
> 		if (!madvise(ptr, len, MADV_NOHUGEPAGE))
> 			return;
> 
> 		ksft_exit_fail_msg("MADV_NOHUGEPAGE failed, err=%d\n", errno);
> 	}

Acked.

> 
> >  	/* split all THPs */
> >  	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
> >  		(uint64_t)one_page + len, order);
> > @@ -313,6 +321,10 @@ static void split_pte_mapped_thp(void)
> >  		goto out;
> >  	}
> >
> > +	/* Prevent khugepaged from collapsing the pages. */
> > +	if (madvise(thp_area, thp_area_size, MADV_NOHUGEPAGE))
> > +		ksft_print_msg("madvise(MADV_NOHUGEPAGE) failed\n");
> > +
> >  	/* Split all THPs through the remapped pages. */
> >  	write_debugfs(PID_FMT, getpid(), (uint64_t)page_area,
> >  		      (uint64_t)page_area + page_area_size, 0);
> > @@ -542,6 +554,9 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
> >  		ksft_test_result_skip("Pagecache folio split skipped\n");
> >  		return -2;
> >  	}
> > +	/* Prevent khugepaged from collapsing the pages. */
> > +	if (madvise(*addr, fd_size, MADV_NOHUGEPAGE))
> > +		ksft_print_msg("madvise(MADV_NOHUGEPAGE) failed\n");
> 
> Obviously same comments re: this and above
> 

Thanks!

[...]

-- 
Sincerely,
Yeoreum Yun
