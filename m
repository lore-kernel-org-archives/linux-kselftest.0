Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730E23033DC;
	Thu, 19 Mar 2026 15:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934933; cv=none; b=LoEwFVCqZLI5YahWLfT+YEu4Bj0enRL/QCO3Nq5Fd5WbRYsOFvLWbCHw9oW5lB817XLwCTrTMUfQMJBZDVl6HBV1falDHWcn9h8eSosTRCbQFvtVV5fu5zSTEnVvGmzlN2lVqrPvzhUjoRl/xzezcoOasS1FnjFusN6vzrzDgrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934933; c=relaxed/simple;
	bh=ddwCQSambwYhQk+Gsdfv4G9cQ4n4k0xN/Xf5jL5ONSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QS3ZS4EuL7DZsxlSG3fVzIW8QB0tFaYgfFfzWDVGDcIHCDG0RXEGBDtAM6IrXzIahhLoFkunzsfTVnWkP2KLaPAxfIzzIvkFif5l/OpQe2Y9Wwc88g5WqI+aqXBoiE8hAyMF2jvq2BRYPRDtkbV/jdTlUjOCwiqrhsYbCItqffc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z018L9Ma; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z018L9Ma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EEAC19424;
	Thu, 19 Mar 2026 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773934933;
	bh=ddwCQSambwYhQk+Gsdfv4G9cQ4n4k0xN/Xf5jL5ONSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z018L9Mak6kJMccjvcDtf9kU/gKi2xvWqu3Nn24TK/JUCbiVBonRRqd9vGgzuKqc6
	 a7MZUk1D5gPNrtaqHxzmo7toXNDIsCnJgjlbap47KUZP52UrYfIlOcdn1mX340p3MS
	 o7kPN5nendZl6j4TQJQD0QAC337GqDQJrMnyOXi5tKmBB/xH4TFMhEgSXdrhYQ8d0A
	 VpTfsK862COAupBKT5D+iLtiIf1kZNqUKaKRXOycyq+RjGiZFSjTs7aapyfZM9C+df
	 NNhyAxNRNuOh4sarGLaHaNAET257IrdhIg1tGmDQjKglosykUDoKj4wfDyyrUAbsZl
	 wXPDOxkUEGj+w==
Date: Thu, 19 Mar 2026 17:42:06 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, kernel-team@fb.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] selftests/mm: Add UFFDIO_MOVE huge zeropage PMD
 regression test
Message-ID: <abwZTnbQ5QWSYvAh@kernel.org>
References: <abongwF3X0G8xY1I@chrisdown.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abongwF3X0G8xY1I@chrisdown.name>

On Wed, Mar 18, 2026 at 12:18:11PM +0800, Chris Down wrote:
> The existing uffd-unit-tests move-pmd coverage exercises PMD-sized
> UFFDIO_MOVE on anonymous THPs, but it does not force the huge zeropage
> PMD path in move_pages_huge_pmd().
> 
> Add a dedicated anonymous UFFDIO_MOVE PMD test that exercises this
> relatively comprehensively.
> 
> Signed-off-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/mm/uffd-unit-tests.c | 100 +++++++++++++++++++
>  tools/testing/selftests/mm/vm_util.c         |  12 +++
>  tools/testing/selftests/mm/vm_util.h         |   1 +
>  3 files changed, 113 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
> index 6f5e404a446c..9cc4cbab9a23 100644
> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> @@ -1227,6 +1227,99 @@ static void uffd_move_pmd_test(uffd_global_test_opts_t *gopts, uffd_test_args_t
>  			      uffd_move_pmd_handle_fault);
>  }
>  
> +static void uffd_move_pmd_huge_zeropage_test(uffd_global_test_opts_t *gopts,
> +					     uffd_test_args_t *targs)
> +{
> +	unsigned long pmd_size = read_pmd_pagesize();
> +	unsigned long pmd_pages;
> +	unsigned long bytes = gopts->nr_pages * gopts->page_size;
> +	char *orig_area_src = gopts->area_src, *orig_area_dst = gopts->area_dst;
> +	char *aligned_src, *aligned_dst;
> +	unsigned long src_offs, dst_offs, max_offs;
> +	pthread_t uffd_mon;
> +	struct uffd_args args = { 0 };
> +	char c = '\0';
> +	int pagemap_fd;
> +
> +	if (pmd_size <= gopts->page_size) {
> +		uffd_test_skip("huge page size is 0, feature missing?");
> +		return;
> +	}
> +	if (!detect_huge_zeropage()) {
> +		uffd_test_skip("transparent huge zeropage disabled");
> +		return;
> +	}
> +
> +	pmd_pages = pmd_size / gopts->page_size;
> +	if (bytes < pmd_size) {
> +		uffd_test_skip("not enough pages for one PMD-sized move");
> +		return;
> +	}
> +
> +	aligned_src = ALIGN_UP(orig_area_src, pmd_size);
> +	aligned_dst = ALIGN_UP(orig_area_dst, pmd_size);
> +	src_offs = (aligned_src - orig_area_src) / gopts->page_size;
> +	dst_offs = (aligned_dst - orig_area_dst) / gopts->page_size;
> +	max_offs = src_offs > dst_offs ? src_offs : dst_offs;
> +	if (max_offs + pmd_pages > gopts->nr_pages) {
> +		uffd_test_skip("could not find aligned PMD-sized src/dst window");
> +		return;
> +	}
> +
> +	if (madvise(orig_area_dst, bytes, MADV_HUGEPAGE))
> +		err("madvise(MADV_HUGEPAGE) failure");
> +	if (madvise(orig_area_src, bytes, MADV_DONTFORK))
> +		err("madvise(MADV_DONTFORK) failure");
> +	if (madvise(aligned_src, pmd_size, MADV_DONTNEED))
> +		err("madvise(MADV_DONTNEED) failure");
> +
> +	/* Fault in a PMD-sized huge zeropage mapping in the source. */
> +	force_read_pages(aligned_src, pmd_pages, gopts->page_size);
> +
> +	pagemap_fd = pagemap_open();
> +	if (!pagemap_is_huge_zero(pagemap_fd, aligned_src)) {
> +		close(pagemap_fd);
> +		uffd_test_skip("could not fault in the huge zeropage");
> +		return;
> +	}
> +	gopts->area_src = aligned_src;
> +	gopts->area_dst = aligned_dst;
> +
> +	if (uffd_register(gopts->uffd, gopts->area_dst, pmd_size, true, false, false))
> +		err("register failure");
> +
> +	args.gopts = gopts;
> +	args.handle_fault = uffd_move_pmd_handle_fault;
> +	if (pthread_create(&uffd_mon, NULL, uffd_poll_thread, &args))
> +		err("uffd_poll_thread create");
> +
> +	/*
> +	 * One fault on dst should trigger a single PMD-sized UFFDIO_MOVE from
> +	 * the huge zeropage PMD we populated in the source.
> +	 */
> +	force_read_pages(gopts->area_dst, pmd_pages, gopts->page_size);
> +
> +	if (write(gopts->pipefd[1], &c, sizeof(c)) != sizeof(c))
> +		err("pipe write");
> +	if (pthread_join(uffd_mon, NULL))
> +		err("join() failed");
> +
> +	if (args.missing_faults != 1 || args.minor_faults != 0) {
> +		uffd_test_fail("stats check error");
> +	} else if (!pagemap_is_huge_zero(pagemap_fd, gopts->area_dst)) {
> +		uffd_test_fail("moved destination is not a huge zeropage PMD");
> +	} else if (!check_huge_anon(gopts->area_dst, 0, pmd_size)) {
> +		/* vm_normal_page_pmd() must continue to treat the moved PMD as special. */
> +		uffd_test_fail("moved huge zeropage PMD counted as AnonHugePages");
> +	} else {
> +		uffd_test_pass();
> +	}
> +
> +	gopts->area_src = orig_area_src;
> +	gopts->area_dst = orig_area_dst;
> +	close(pagemap_fd);
> +}
> +
>  static void uffd_move_pmd_split_test(uffd_global_test_opts_t *gopts, uffd_test_args_t *targs)
>  {
>  	if (madvise(gopts->area_dst, gopts->nr_pages * gopts->page_size, MADV_NOHUGEPAGE))
> @@ -1550,6 +1643,13 @@ uffd_test_case_t uffd_tests[] = {
>  		.uffd_feature_required = UFFD_FEATURE_MOVE,
>  		.test_case_ops = &uffd_move_test_pmd_case_ops,
>  	},
> +	{
> +		.name = "move-pmd-huge-zeropage",
> +		.uffd_fn = uffd_move_pmd_huge_zeropage_test,
> +		.mem_targets = MEM_ANON,
> +		.uffd_feature_required = UFFD_FEATURE_MOVE,
> +		.test_case_ops = &uffd_move_test_pmd_case_ops,
> +	},
>  	{
>  		.name = "move-pmd-split",
>  		.uffd_fn = uffd_move_pmd_split_test,
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index a6d4ff7dfdc0..55cc4cc058a2 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -120,6 +120,18 @@ bool pagemap_is_populated(int fd, char *start)
>  				PAGE_IS_PRESENT | PAGE_IS_SWAPPED);
>  }
>  
> +bool pagemap_is_huge_zero(int fd, char *start)
> +{
> +	uint64_t categories;
> +
> +	if (!pagemap_scan_supported(fd, start))
> +		return false;
> +
> +	categories = pagemap_scan_get_categories(fd, start);
> +	return (categories & (PAGE_IS_PRESENT | PAGE_IS_PFNZERO | PAGE_IS_HUGE)) ==
> +		(PAGE_IS_PRESENT | PAGE_IS_PFNZERO | PAGE_IS_HUGE);
> +}
> +
>  unsigned long pagemap_get_pfn(int fd, char *start)
>  {
>  	uint64_t entry = pagemap_get_entry(fd, start);
> diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
> index e9c4e24769c1..e0b6ae1b12f5 100644
> --- a/tools/testing/selftests/mm/vm_util.h
> +++ b/tools/testing/selftests/mm/vm_util.h
> @@ -85,6 +85,7 @@ uint64_t pagemap_get_entry(int fd, char *start);
>  bool pagemap_is_softdirty(int fd, char *start);
>  bool pagemap_is_swapped(int fd, char *start);
>  bool pagemap_is_populated(int fd, char *start);
> +bool pagemap_is_huge_zero(int fd, char *start);
>  unsigned long pagemap_get_pfn(int fd, char *start);
>  void clear_softdirty(void);
>  bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len);
> 
> base-commit: f0caa1d49cc07b30a7e2f104d3853ec6dc1c3cad
> -- 
> 2.53.0
> 

-- 
Sincerely yours,
Mike.
