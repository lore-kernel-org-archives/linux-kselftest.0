Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B3232470E;
	Tue, 28 Apr 2026 14:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386765; cv=none; b=nIkd0zh/T0i28cy4ssrJ1W/LQkNdpo0Dzaot6VNT9C6YdYwnczxxrFTcZz+sT1EZb1+Oi/lvuwGmMxobgD5PjWDx+pPhmThBR1yvAbdjpbCUI8+zoTcydIIE/OGIOu522BRm93AwIOKCuRYHvTZ/p4ktTaBpD138oqPHouS8zkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386765; c=relaxed/simple;
	bh=OHEK/kEtPQzApv+jcGVsp7S0wEC3laGy8Z9NSXLdV/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMOPX6vKF6I8qWpNF5/0TEwj7SND5eqpcBuZpvipTzG04cV8JU+Zg7hUOMq0RJSa2Kk/8X//iY98jfGsEhZON2DDS7SROdQFCzoztJQWlZo1D7XMiRxWXkVIQWhRWWnzfiUUENhHi5vWB+u2HKs43KgL/GJqhRuMnzVeqerhq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/xQuy7G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/xQuy7G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1879C2BCB5;
	Tue, 28 Apr 2026 14:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777386765;
	bh=OHEK/kEtPQzApv+jcGVsp7S0wEC3laGy8Z9NSXLdV/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/xQuy7G/IWRp/2joV3S5/rhJ/oAsWEdR3rS4YRVDvEtO/bg/E3UBd8Atd4UeB+k9
	 hn8mCMDzdTAzRvykGy8lNJOvOFv4HzuLiDBcPasKcZ3mD2Ex6SZW0ibGC1sgN/vXfO
	 w5lArH4FNU/RdwVjbE6QWtGFkIWF5stBfQZyUF44++vO9LCryxIlBx+4va/DtWBObL
	 OEZp5BloPLPxdekNzjoAzWW0cXC8sM53KOiOBCA3CXfOHPHtA1Bjlczh/hrSBuwdJL
	 djw5HhPa+TzYPoAmYhs4rIWoA4+JHgzAwDg1fwgR4ddXkGe6IAMW48ZBDPyoWfGJVq
	 HsaAYOsXy2dUQ==
Date: Tue, 28 Apr 2026 16:32:36 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 13/53] selftests/mm: khugepaged: use ksefltest
 framework
Message-ID: <afDFBB8CqNx2mWAL@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-14-rppt@kernel.org>
 <231d0f73-ed99-4c7c-879d-3a2223945b21@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <231d0f73-ed99-4c7c-879d-3a2223945b21@arm.com>

Hi Sarthak,

(please trim your responses next time)

On Tue, Apr 28, 2026 at 06:35:51PM +0530, Sarthak Sharma wrote:
> On 4/18/26 4:24 PM, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Convert khugepaged tests to use kselftest framework for reporting and
> > tracking successful and failing runs.

...

> > @@ -830,16 +783,12 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
> >  	int i;
> >  
> >  	p = ops->setup_area(1);
> > +	ksft_print_msg("Construct PTE page table full of different PTE-mapped compound pagesd\n");
> 
> A small typo here, "pagesd" should be "pages".

Thanks.
 
> >  	for (i = 0; i < hpage_pmd_nr; i++) {
> > -		printf("\rConstruct PTE page table full of different PTE-mapped compound pages %3d/%d...",
> > -				i + 1, hpage_pmd_nr);
> > -
> >  		madvise(BASE_ADDR, hpage_pmd_size, MADV_HUGEPAGE);
> >  		ops->fault(BASE_ADDR, 0, hpage_pmd_size);
> > -		if (!ops->check_huge(BASE_ADDR, 1)) {
> > -			printf("Failed to allocate huge page\n");
> > -			exit(EXIT_FAILURE);
> > -		}
> > +		if (!ops->check_huge(BASE_ADDR, 1))
> > +			ksft_exit_fail_msg("Failed to allocate huge page\n");
> 
> In case we are not able to allocate a hugepage at fault, should this be
> reported as a per-test failure instead of bailing out the whole binary
> with ksft_exit_fail_msg()? In alloc_at_fault(), a failure to allocate a
> hugepage is reported as a normal test result via
> ksft_test_result_report(), so should this case behave similarly or is it
> intentionally treated as fatal? I realize it was being treated as fatal
> before this patch as well, but just wanted to check whether that is
> necessary.

I don't think it's necessary, but let's address it separately. Here I only
mechanically convert the code to use kselftest helpers.
 
> Also, when ksft_exit_fail_msg() is called, totals are printed twice:
> once from ksft_exit_fail_msg() itself, and then again when exit() runs
> the restore_settings_atexit handler.

This is temporal, restore_settings_atexit() is removed from khugepaged in
later patches. If anybody feels strongly about it I can fix, but IMO it's
not really important.
 
> > @@ -1242,8 +1186,6 @@ int main(int argc, char **argv)
> >  	save_settings();
> >  	thp_push_settings(&default_settings);
> 
> Also, can save_settings() and thp_push_settings() be moved below
> ksft_set_plan(), preserving their order?

Yes, you are welcome to send a patch ;-)
There a lot of possible improvements all over the place and I wanted to
keep changes here to minimum. Let's keep it for the next round.

> Since save_settings() is printing a debug line of its own, it would look
> better if ksft plan is printed just below the TAP version line.

The message from save_settings() is printed after the TAP header:

# TAP version 13
# # Save THP and khugepaged settings... OK
# 1..26

-- 
Sincerely yours,
Mike.
