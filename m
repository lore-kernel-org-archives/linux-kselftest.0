Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7BF449ED6;
	Tue, 18 Aug 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048106; cv=none; b=hTxjtNg5NHUf9fiQiM5weSz422T+MNiqbSPjfliSckqenhPt+w1wplMniieqs8Kz1Yd8f4CSu3su7QLEEyMUPlCBhzHgf+NVSZFAuVcqHjJhGXafbW06MEpCvsaEm7ZKrRDih+7AYq5q1YdgVkIJfCDAjKdW33nch9gxBWWJkjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048106; c=relaxed/simple;
	bh=vDSDj+j7b0j1KLuBxSRs3bTsRls+Dbwmq8irlb2HCkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkRr5RXqxdeQM8Zd7vgmR3aBz47knN7WcYVqauaeOGYswCPsHO4SSQQP+4Kfj5llcb58qR9QmCF3ijNAkm5YDdzR46BfZQBdQmbxLNYhBkWCVjpVn3g3UFvShzlaGnnWqoWmboNSDvc9y5efH+I8+5cXbiYvLo/C0atcYa38+Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4PSJVx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4PSJVx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAF91F00A3A;
	Tue, 18 Aug 2026 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787048104;
	bh=cluiy09pOghvUJ1vr/fx9GIpCaOWrEgz3nZIxDTE4ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a4PSJVx4vl8tYRySMA+6J/08GytwKborNSuTp6TDaVIRau6QTZIdtYC/vUGQkyXIu
	 ynwocxOnPYhxD+mBQSvBNsvicS0XWwneX0X5P5TWAk4gO3zEvpu3UVFY1kva+bmXOF
	 RnsntiBbiD/1/Qth8yBSr+fQMXNPF/sCeKCsrIOWlvtMtrPenLxpbtGYAyAwXesCW9
	 wx65S+WoiRh6P/rerqzY35ttG/674QmuJ4twR5QwWgbBizJi/eSla44GOl/WoPOGEx
	 G+chOo9tcwD0EPpvnwjp6AsIajBhu0yNK1XZfa8bb1nBoHdkr73dn3TCr65AIw9bhJ
	 eIHIeoazZsOBg==
Date: Tue, 18 Aug 2026 11:14:42 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, nico.pache@linux.dev, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
	vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kas@kernel.org
Subject: Re: [PATCH v4 07/19] selftests/mm: move is_backed_by_folio() into
 vm_util
Message-ID: <aoQwizWbYM7_T72f@lucifer>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-8-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815015901.1236937-8-kirill@shutemov.name>

On Sat, Aug 15, 2026 at 02:58:49AM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> Checking that an address range is backed by a folio of a given order is
> useful to any test that builds or collapses large folios.  mTHP collapse
> coverage in the khugepaged selftest needs exactly that.
>
> split_huge_page_test.c already has the building block:
> is_backed_by_folio() reads the compound head and tail flags from
> /proc/kpageflags to classify the folio behind a page.
>
> Move it into vm_util so other tests can use it.  No functional change.
>
> Assisted-by: Claude-Code:claude-opus-5
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

LGTM so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  .../selftests/mm/split_huge_page_test.c       | 62 -------------------
>  tools/testing/selftests/mm/vm_util.c          | 62 +++++++++++++++++++
>  tools/testing/selftests/mm/vm_util.h          |  2 +
>  3 files changed, 64 insertions(+), 62 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> index 86a603692826..0adfe7dde7e5 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -42,68 +42,6 @@ const char *kpageflags_proc = "/proc/kpageflags";
>  int pagemap_fd;
>  int kpageflags_fd;
>
> -static bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
> -		int kpageflags_fd)
> -{
> -	const uint64_t folio_head_flags = KPF_THP | KPF_COMPOUND_HEAD;
> -	const uint64_t folio_tail_flags = KPF_THP | KPF_COMPOUND_TAIL;
> -	const unsigned long nr_pages = 1UL << order;
> -	unsigned long pfn_head;
> -	uint64_t pfn_flags;
> -	unsigned long pfn;
> -	unsigned long i;
> -
> -	pfn = pagemap_get_pfn(pagemap_fd, vaddr);
> -
> -	/* non present page */
> -	if (pfn == -1UL)
> -		return false;
> -
> -	if (pageflags_get(pfn, kpageflags_fd, &pfn_flags))
> -		goto fail;
> -
> -	/* check for order-0 pages */
> -	if (!order) {
> -		if (pfn_flags & (folio_head_flags | folio_tail_flags))
> -			return false;
> -		return true;
> -	}
> -
> -	/* non THP folio */
> -	if (!(pfn_flags & KPF_THP))
> -		return false;
> -
> -	pfn_head = pfn & ~(nr_pages - 1);
> -
> -	if (pageflags_get(pfn_head, kpageflags_fd, &pfn_flags))
> -		goto fail;
> -
> -	/* head PFN has no compound_head flag set */
> -	if ((pfn_flags & folio_head_flags) != folio_head_flags)
> -		return false;
> -
> -	/* check all tail PFN flags */
> -	for (i = 1; i < nr_pages; i++) {
> -		if (pageflags_get(pfn_head + i, kpageflags_fd, &pfn_flags))
> -			goto fail;
> -		if ((pfn_flags & folio_tail_flags) != folio_tail_flags)
> -			return false;
> -	}
> -
> -	/*
> -	 * check the PFN after this folio, but if its flags cannot be obtained,
> -	 * assume this folio has the expected order
> -	 */
> -	if (pageflags_get(pfn_head + nr_pages, kpageflags_fd, &pfn_flags))
> -		return true;
> -
> -	/* If we find another tail page, then the folio is larger. */
> -	return (pfn_flags & folio_tail_flags) != folio_tail_flags;
> -fail:
> -	ksft_exit_fail_msg("Failed to get folio info\n");
> -	return false;
> -}
> -
>  static int check_after_split_folio_orders(char *vaddr_start, size_t len,
>  		int pagemap_fd, int kpageflags_fd, int orders[], int nr_orders)
>  {
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index 80bc9f597b52..5db1a7774f49 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -494,6 +494,68 @@ int pageflags_get(unsigned long pfn, int kpageflags_fd, uint64_t *flags)
>  	return 0;
>  }
>
> +bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
> +			int kpageflags_fd)
> +{
> +	const uint64_t folio_head_flags = KPF_THP | KPF_COMPOUND_HEAD;
> +	const uint64_t folio_tail_flags = KPF_THP | KPF_COMPOUND_TAIL;
> +	const unsigned long nr_pages = 1UL << order;
> +	unsigned long pfn_head;
> +	uint64_t pfn_flags;
> +	unsigned long pfn;
> +	unsigned long i;
> +
> +	pfn = pagemap_get_pfn(pagemap_fd, vaddr);
> +
> +	/* non present page */
> +	if (pfn == -1UL)
> +		return false;
> +
> +	if (pageflags_get(pfn, kpageflags_fd, &pfn_flags))
> +		goto fail;
> +
> +	/* check for order-0 pages */
> +	if (!order) {
> +		if (pfn_flags & (folio_head_flags | folio_tail_flags))
> +			return false;
> +		return true;
> +	}
> +
> +	/* non THP folio */
> +	if (!(pfn_flags & KPF_THP))
> +		return false;
> +
> +	pfn_head = pfn & ~(nr_pages - 1);
> +
> +	if (pageflags_get(pfn_head, kpageflags_fd, &pfn_flags))
> +		goto fail;
> +
> +	/* head PFN has no compound_head flag set */
> +	if ((pfn_flags & folio_head_flags) != folio_head_flags)
> +		return false;
> +
> +	/* check all tail PFN flags */
> +	for (i = 1; i < nr_pages; i++) {
> +		if (pageflags_get(pfn_head + i, kpageflags_fd, &pfn_flags))
> +			goto fail;
> +		if ((pfn_flags & folio_tail_flags) != folio_tail_flags)
> +			return false;
> +	}
> +
> +	/*
> +	 * check the PFN after this folio, but if its flags cannot be obtained,
> +	 * assume this folio has the expected order
> +	 */
> +	if (pageflags_get(pfn_head + nr_pages, kpageflags_fd, &pfn_flags))
> +		return true;
> +
> +	/* If we find another tail page, then the folio is larger. */
> +	return (pfn_flags & folio_tail_flags) != folio_tail_flags;
> +fail:
> +	ksft_exit_fail_msg("Failed to get folio info\n");
> +	return false;
> +}
> +
>  /* If `ioctls' non-NULL, the allowed ioctls will be returned into the var */
>  int uffd_register_with_ioctls(int uffd, void *addr, uint64_t len,
>  			      bool miss, bool wp, bool minor, uint64_t *ioctls)
> diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
> index 9a49af88702e..56a28ce7d029 100644
> --- a/tools/testing/selftests/mm/vm_util.h
> +++ b/tools/testing/selftests/mm/vm_util.h
> @@ -97,6 +97,8 @@ int64_t allocate_transhuge(void *ptr, int pagemap_fd);
>  int pageflags_get(unsigned long pfn, int kpageflags_fd, uint64_t *flags);
>  int gather_folio_orders(char *vaddr_start, size_t len,
>  		int pagemap_fd, int kpageflags_fd, int orders[], int nr_orders);
> +bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
> +			int kpageflags_fd);
>
>  int uffd_register(int uffd, void *addr, uint64_t len,
>  		  bool miss, bool wp, bool minor);
> --
> 2.54.0
>

--
Cheers, Lorenzo
