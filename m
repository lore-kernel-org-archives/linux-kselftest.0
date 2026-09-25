Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FFA440632;
	Fri, 25 Sep 2026 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346327; cv=none; b=AXkMY9dSPMJiiqljLxawB5Y6hqn1UlFeAWxH+AcjXsW2qOCdXClwpWaDdDVpW1MQQu0lyoaKWhe3DzCT46fxodxnDyv10y06xF9IeFpnLOdArK05aVl7rm9DlOmnq5dQOq05js3g0Wuc6S/kXMcLxLFDLoSkQdVq7f1q8NHE+1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346327; c=relaxed/simple;
	bh=El1QITU3qpLvvUdEiQ9fxzYfH725rKJWjGdoB0s8u5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9EtjX3lrqSho/pEQQT7x/Bo0s7MaGa7V59FSWr180ivgYWMwZxHTc/zZzrB/C/9Kd04DdNEsg0VCfaxUC+KduIlmHJYmswhHodSMszIVTAUALTG3lQ24KgXbuZn+98vZzZX9KOarMJlmwhda3yjQhsBRszvqg2LepO8k/VndRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YSAupVJI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YSAupVJI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD6522F;
	Fri, 25 Sep 2026 07:25:20 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 788073F85F;
	Fri, 25 Sep 2026 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790346324; bh=El1QITU3qpLvvUdEiQ9fxzYfH725rKJWjGdoB0s8u5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSAupVJIBvAx9uHHYFskgna4GCDoxpLp26nfaAHBNg0Wc6F8sbHLSJ8Z1TFZBejl9
	 cmoy8SzPoCKDQG/qekljmEOJIVI9g/t75g7WV67KOLfA5/nerh7uLHWX8a730ZtK4Y
	 wwnWL5xCBqeR1PyB2LpdN5xTkawRCSZbgMzuIp9c=
Date: Fri, 25 Sep 2026 15:25:19 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
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
Subject: Re: [PATCH v8 1/4] kselftest: mm: prevent random failure of huge
 page split for khugepaged
Message-ID: <araET4RRCM2PxqaW@e129823.arm.com>
References: <20260924-fix_split-v8-0-cba7359d882a@arm.com>
 <20260924-fix_split-v8-1-cba7359d882a@arm.com>
 <07f94688-55ed-407a-a11a-78a4feedf5e2@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07f94688-55ed-407a-a11a-78a4feedf5e2@arm.com>

> 
> 
> On 9/25/26 12:41 AM, Yeoreum Yun wrote:
> > There're some random failure for split_huge_page_test when khugepaged
> > collapses pages into pmd again which had split by the test.
> > 
> > Prevent the khugepaged's collapses for split page by setting the
> > mapped pmd-huge-page with MADV_NOHUGEPAGE before split.
> > 
> > Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> > Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  tools/testing/selftests/mm/split_huge_page_test.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> > index c5d96a4b1db3..ef4058662b91 100644
> > --- a/tools/testing/selftests/mm/split_huge_page_test.c
> > +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> > @@ -108,6 +108,18 @@ static char *allocate_zero_filled_hugepage(size_t len)
> >  	return result;
> >  }
> >  
> > +static void disable_khugepaged(void *addr, size_t len)
> > +{
> > +	/*
> > +	 * Disables khugepaged from collapsing THPs in range, existing THP
> 
> Should it be "collapsing pages in range into THPs" instead?

That would be clear. I'll change with it.

> 
> > +	 * pages remain.
> > +	 */
> > +	if (!madvise(addr, len, MADV_NOHUGEPAGE))
> > +		return;
> > +
> > +	ksft_exit_fail_msg("MADV_NOHUGEPAGE failed, err=%d\n", errno);
> 
> I feel a ksft_exit_fail_perror() would be better here, since it will
> automatically print strerror(errno) as well. Still, it is not something
> that should require a respin of its own, so if you plan to respin for
> some other changes, you might fold these changes in as well.

Yeap. I'll change it with _perror.

> 
> Rest looks good, so:
> 
> Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
> 
> > +}
> > +
> >  static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hpages, size_t len)
> >  {
> >  	unsigned long rss_anon_before, rss_anon_after;
> > @@ -120,6 +132,8 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
> >  	if (!rss_anon_before)
> >  		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
> >  
> > +	disable_khugepaged(one_page, len);
> > +
> >  	/* split all THPs */
> >  	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
> >  		      (uint64_t)one_page + len, 0);
> > @@ -167,6 +181,8 @@ static void split_pmd_thp_to_order(int order)
> >  	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 4, pmd_pagesize))
> >  		ksft_exit_fail_msg("No THP is allocated\n");
> >  
> > +	disable_khugepaged(one_page, len);
> > +
> >  	/* split all THPs */
> >  	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
> >  		(uint64_t)one_page + len, order);
> > @@ -215,6 +231,8 @@ static void split_pte_mapped_thp(void)
> >  		goto out;
> >  	}
> >  
> > +	disable_khugepaged(thp_area, thp_area_size);
> > +
> >  	/*
> >  	 * To challenge spitting code, we will mremap a single page of each
> >  	 * THP (page[i] of thp[i]) in the thp_area into page_area. This will
> > @@ -482,6 +500,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
> >  		ksft_test_result_skip("Pagecache folio split skipped\n");
> >  		return -2;
> >  	}
> > +	disable_khugepaged(*addr, fd_size);
> >  	return 0;
> >  err_out_close:
> >  	close(*fd);
> > 
> 

-- 
Sincerely,
Yeoreum Yun
