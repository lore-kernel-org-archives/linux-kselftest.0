Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCA3284690;
	Thu, 27 Aug 2026 11:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787829102; cv=none; b=Xr7D4vPQDKwe7qEyAgoxtCC6XMN1OiDeprdFbZcozlh9DnWMaUps6k+FYndJO6J5c6SAy1PapzTEvVrWrM6HJjnA43+5HfaS2/Vmo1UZP9YX30GrPrIgtLCoT+GXS79M6JLFMkAy9yHILVs8LZCCVGZPynpEaI6eeCPek4ceApE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787829102; c=relaxed/simple;
	bh=y4Ltva00upZxLtDuluXaAsdt9DyR/JLUL3X5FOumC40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slKKw1qq9W8JKvE5cvCyG3JZpyhNKRqE+urhkMeXVYjIkd6bK1jdakt/BkwNqcadM2ybyYchm8eKZ7Eed3iEr2OYRo6CGKR9dUeGQi7kL2PunxsHbMmaWX/BBssfZy3kkjXYgbVcEXXP+JBisxqqTNdcAq+u5z0sluV5Whx4P5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=J5h76EDg; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="J5h76EDg"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23CD51688;
	Thu, 27 Aug 2026 04:11:31 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 596433F66F;
	Thu, 27 Aug 2026 04:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787829094; bh=y4Ltva00upZxLtDuluXaAsdt9DyR/JLUL3X5FOumC40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5h76EDgUE0FZPkTnAGVaoJ7EKVyyZtoH9BAVzPXg1MD7e27Oa4E3uJ5alXx+G3bo
	 Pc7jiGS2F43frLNC3KOB3rr9BpljHw2b6IGEOhzvlnvPoJBLVz2+9ZZwgEUKLbLasB
	 eE5rAPXN+Joia7vMnv7p8ldUdwHuvNA/sq/H4PGg=
Date: Thu, 27 Aug 2026 12:11:30 +0100
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
Subject: Re: [PATCH v2 1/2] kselftest: mm: prevent random failure of huge
 page split for khugepaged
Message-ID: <apAbYl_g8pXlFesg@e129823.arm.com>
References: <20260826-fix_split-v2-0-71153c7f579a@arm.com>
 <20260826-fix_split-v2-1-71153c7f579a@arm.com>
 <36c54170-f7cb-4b1e-a1fd-50544390632b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36c54170-f7cb-4b1e-a1fd-50544390632b@kernel.org>

> On 8/26/26 14:24, Yeoreum Yun wrote:
> > There're some random failure for split_huge_page_test when khugepaged
> > collapses pages into pmd again which had split by the test.
> > 
> > Prevent the khugepaged's collapses for split page by setting the
> > mapped pmd-huge-page with MADV_NOHUGEPAGE before split.
> > 
> > Reported-by: Kevin Brodsky <kevin.brodsky@arm.com>
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  tools/testing/selftests/mm/split_huge_page_test.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> > index 86a603692826..8f68bc94a5ca 100644
> > --- a/tools/testing/selftests/mm/split_huge_page_test.c
> > +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> > @@ -180,6 +180,10 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
> >  	if (!rss_anon_before)
> >  		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
> >  
> > +	/* Prevent khugepaged from collapsing the pages. */
> > +	if (madvise(one_page, len, MADV_NOHUGEPAGE))
> > +		ksft_print_msg("MADV_NOHUGEPAGE failed to prevent khugepaged from collapsing pages.\n");
> > +
> 
> Ok, this is really only expected to fail on extremely old kernels or kernels
> without CONFIG_TRANSPARENT_HUGEPAGE (where we should never get to that point :) ).
> 
> Can we just turn that into a
> 	ksft_exit_fail_perror("madvise(MADV_NOHUGEPAGE)");
> 
> I'm okay with a ksft_print_msg() as well, but would shorten the message quite a
> lot ("MADV_NOHUGEPAGE failed" or sth).

Thanks. I'll change the message only then.

-- 
Sincerely,
Yeoreum Yun
