Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47C629D291;
	Thu, 10 Sep 2026 11:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038172; cv=none; b=oYwGQyqt2qoAIIvwoWUQdGDbr7Y64r/Fz6TxVxIqKJGUTeAMoK5gYqN0ExnbtdxwSjL765r0mdhfVMDUpZegWL9hUnR7zDUQqdm5FbXsh50SbBV7NgY1d4J3hQ8/sqatnEt89kuWRNV3KjYDy6snPw3ahE0+OXShKwvdHtK2Q+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038172; c=relaxed/simple;
	bh=/dEIy4o63fAuLRmPsqw2tWaPBUfiEsjcQUh6U/nccpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dinOYez4R6S/TN8IsWxadDlC6wc7asKFGVzPpNAHwCPWgLatipqvE+77UH/UBrTOJ/IsISCIbFHVt4huAkn431iSU4Zn95udt1HkMzNQ9GMG4wTihloaDpTubM/m5PXaRF7RwFM/ci3RFPw2rYiOIvSQfDeJzGupBLPmTlRI/vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gUoQDdnh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gUoQDdnh"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 892701477;
	Thu, 10 Sep 2026 04:02:46 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AFBD3F7B4;
	Thu, 10 Sep 2026 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789038170; bh=/dEIy4o63fAuLRmPsqw2tWaPBUfiEsjcQUh6U/nccpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUoQDdnhVoQC6I8BCdAG+Us9oa8BWEbviuzUkHV9UxC2sIiCX+tWf6QfdCPkzZ+/G
	 w2mzMKUPN833StqmMeH9wS7ztmqdlQnVz1A3qJ+xbQzyiEDumaMULK+J6xpXPXLwbe
	 UzlnQ9wrliqUXi05PxhB8UrjRDpeHWEM7IKvi578=
Date: Thu, 10 Sep 2026 12:02:44 +0100
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
Message-ID: <aqKOVGECsCNtSMIV@e129823.arm.com>
References: <20260907-fix_split-v5-0-822b810458bc@arm.com>
 <20260907-fix_split-v5-3-822b810458bc@arm.com>
 <5c05b620-7a2f-453d-9725-fed4f536a019@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c05b620-7a2f-453d-9725-fed4f536a019@kernel.org>

> > diff --git a/tools/testing/selftests/mm/soft-dirty.c b/tools/testing/selftests/mm/soft-dirty.c
> > index 5f278913c4d7..b6fad38c8bee 100644
> > --- a/tools/testing/selftests/mm/soft-dirty.c
> > +++ b/tools/testing/selftests/mm/soft-dirty.c
> > @@ -92,9 +92,9 @@ static void test_hugepage(int pagemap_fd, int pagesize)
> >  	if (!hpage_len)
> >  		ksft_exit_fail_msg("Reading PMD pagesize failed");
> >  
> > -	map = memalign(hpage_len, hpage_len);
> > +	map = alloc_isolated_mem(hpage_len, hpage_len);
> >  	if (!map)
> > -		ksft_exit_fail_msg("memalign failed\n");
> > +		ksft_exit_fail_msg("alloc_isolated_mem failed\n");
> >  
> >  	ret = madvise(map, hpage_len, MADV_HUGEPAGE);
> >  	if (ret)
> > @@ -130,7 +130,7 @@ static void test_hugepage(int pagemap_fd, int pagesize)
> >  		ksft_test_result_skip("Test %s huge page allocation\n", __func__);
> >  		ksft_test_result_skip("Test %s huge page dirty bit\n", __func__);
> >  	}
> > -	free(map);
> > +	free_isolated_mem(map, hpage_len);
> >  }
> 
> smaps is really only problematic with merged VMAs when relying on exact page
> statistics. For other properties (vm flags, MMUPageSize) it's not a problem as
> long as our smap search just finds the VMA that covers an address.
> 
> Assuming we fixed check_huge_anon() to not use smaps, why is this change here
> required?

Since there is no interface to get vm_flags not via /proc/self/smaps,
It might be good to have it for preventing unwanted VMA merge.

And might be useful for future to prevent unwated VMA merge.

-- 
Sincerely,
Yeoreum Yun
