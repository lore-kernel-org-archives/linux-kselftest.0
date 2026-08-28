Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EA933260D;
	Fri, 28 Aug 2026 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909969; cv=none; b=iYPw+7IToZvVSpMQAQTqJKXMy9l8gSK100THNJeSp9wojh7D8DalLGvQMxs3kWfgnyIX+8BFstX1+u7qaZmwYfqj+IIrohugZ4U6/FUGt9st9TQBlNfhGyjkNK6TahquddtHWhTu1AaPEA1gO+HO1YpNhuo3RW6wJjpCxEK5Cpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909969; c=relaxed/simple;
	bh=3ixTxxxL7+wBx4fLq257bhKCHi6MZNedmcQUSSVJG54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKTx+SIviGN6aFqlq7zNc/o06pcNh5TwdXtW4LkrRrOUemIvBJ+8VvBorVzC/cZmEpV6Pu960fUwosxfDs4EmpKoq3zNF+PGaFWQR9W7dKYLDi1ykfx/vXR15vD4hYvYcI9+9T2axw+nFjGEdoChGtlFOU1dJO6T2hE6GuGwkBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sto3diAR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sto3diAR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35EF1F000E9;
	Fri, 28 Aug 2026 09:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787909965;
	bh=LcwtPFDsGrgdCaDCg66fqoG97Ouh7ZMZoj1sJOxY13o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sto3diARgnSgihsBVkQyf2L4hleE9pUpjugWfj7HFQbJ7nIWicQiyg9kl6aXmpQ8B
	 kJhrfTXxUAN2JAtxD2Ng4Bn72SdgEXPHNledJdxXAA8W0TT14DgOOkI8zSdLeLvUV9
	 czM4iTcmnePZcdrsk1ttZE70YEqa8Qs0oVnjsje2siEQ7nKXk2Bh6gyyr03U4YNTeQ
	 RZSUIvXrf6bCrhIqHpzBiYxdnBXq+9YFYvdVhKeGs9pxX4ubGbe8f96RdSVKJmx86q
	 qLvqHIBzlxmljjNRS2z56YiQ4n3YVKsN0uNnmOm6TdT29XosbKvCeQ90sqqPLXOXlK
	 cIruOBdDZE5Zw==
Date: Fri, 28 Aug 2026 10:39:18 +0100
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
Subject: Re: [PATCH v3 1/2] kselftest: mm: prevent random failure of huge
 page split for khugepaged
Message-ID: <apFWAppcVKt4xhIT@gremlin>
References: <20260828-fix_split-v3-0-374022586a4b@arm.com>
 <20260828-fix_split-v3-1-374022586a4b@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-fix_split-v3-1-374022586a4b@arm.com>

On Fri, Aug 28, 2026 at 09:11:33AM +0100, Yeoreum Yun wrote:
> There're some random failure for split_huge_page_test when khugepaged
> collapses pages into pmd again which had split by the test.
>
> Prevent the khugepaged's collapses for split page by setting the
> mapped pmd-huge-page with MADV_NOHUGEPAGE before split.
>
> Reported-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/mm/split_huge_page_test.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> index 86a603692826..c718269a291f 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -180,6 +180,10 @@ static void verify_rss_anon_split_huge_page_all_zeroes(char *one_page, int nr_hp
>  	if (!rss_anon_before)
>  		ksft_exit_fail_msg("No RssAnon is allocated before split\n");
>
> +	/* Prevent khugepaged from collapsing the pages. */
> +	if (madvise(one_page, len, MADV_NOHUGEPAGE))
> +		ksft_print_msg("madvise(MADV_NOHUGEPAGE) failed\n");

This should probably terminate the test no? There's no reason to expect this to
fail and it's better to fail then to risk a flake :)

> +
>  	/* split all THPs */
>  	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
>  		      (uint64_t)one_page + len, 0);
> @@ -227,6 +231,10 @@ static void split_pmd_thp_to_order(int order)
>  	if (!check_huge_anon(one_page, 4 * pmd_pagesize, 4, pmd_pagesize))
>  		ksft_exit_fail_msg("No THP is allocated\n");
>
> +	/* Prevent khugepaged from collapsing the pages. */
> +	if (madvise(one_page, len, MADV_NOHUGEPAGE))
> +		ksft_print_msg("madvise(MADV_NOHUGEPAGE) failed\n");
> +

Same comment as above, also since this is a repeated pattern, I think it's worth
abstracting it like:

	static void madv_nohuge(char *ptr, size_t len)
	{
		if (!madvise(ptr, len, MADV_NOHUGEPAGE))
			return;

		ksft_exit_fail_msg("MADV_NOHUGEPAGE failed, err=%d\n", errno);
	}

>  	/* split all THPs */
>  	write_debugfs(PID_FMT, getpid(), (uint64_t)one_page,
>  		(uint64_t)one_page + len, order);
> @@ -313,6 +321,10 @@ static void split_pte_mapped_thp(void)
>  		goto out;
>  	}
>
> +	/* Prevent khugepaged from collapsing the pages. */
> +	if (madvise(thp_area, thp_area_size, MADV_NOHUGEPAGE))
> +		ksft_print_msg("madvise(MADV_NOHUGEPAGE) failed\n");
> +
>  	/* Split all THPs through the remapped pages. */
>  	write_debugfs(PID_FMT, getpid(), (uint64_t)page_area,
>  		      (uint64_t)page_area + page_area_size, 0);
> @@ -542,6 +554,9 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
>  		ksft_test_result_skip("Pagecache folio split skipped\n");
>  		return -2;
>  	}
> +	/* Prevent khugepaged from collapsing the pages. */
> +	if (madvise(*addr, fd_size, MADV_NOHUGEPAGE))
> +		ksft_print_msg("madvise(MADV_NOHUGEPAGE) failed\n");

Obviously same comments re: this and above

>  	return 0;
>  err_out_close:
>  	close(*fd);
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
