Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305128;
	b=qfzwGt/WHxGUOXV3rG15Q2aCmYmQnb+yfiAGJx4mqc28CpyyKB5BRYwZ01pqfgJoJbk2
	 9zp8W7u6dMeKpS0XDTOq1pUNu7XNYy7+RPJoICuSamCBPK7f9V92YQmwDpGG9VBZeF4t0
	 UF/FuTTFDZbHzBPrI9ws/3juruXD+sWiV53u5eKcRMYrZ4QcTFS+OTgGjkBITu46KgdEL
	 /iQ0ZjdvKR1lBMR4FUNk3cvdK9I6g/DSrSsYyxmSNCXIOuDnY62j3ZQXEyDQniInqJXwR
	 qbkCFgg0PZLn2ya7gp2LRmy4yobdbe0ETrv//5oWyw/DEORbAmNsADOuBMp+GYLVDsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305128;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=n7JHToNvmvovrxsCT+NsYxHL5scA7i94JGOHZjSN1bs=;
	b=CO1fHrHDqlVOv8bctm7n1qABBv9X8Ld9r8JS/Q0RjLKARtZ2hME6v+PqNpYEpo3VX6OZ
	 +akMEChCTFJYW/ku09bVv90a9yBg35or1Ae0y3lhCx4yPNw0ZgfhutoNZ3tlVvGNqtbUc
	 uhiKDM/UaliCbV9auENIytpXNRAc4dFovnIgIsIgG7qxwxAtOK0CVidtQKptc7BlUxjiv
	 Km5pNodEw7w/3iHVEmrr/0Sa7SD+UyJTM1GfTQWVYjhpF7URcyneKBCcfBnJwGJF88ih/
	 m2frblpYXKPYJnfw/JISYj3x2i/35Uo0Jk6NDNh01EalirCh3TFbR+Cm4euDSvi0akA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkxRLQKe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F9D60A2603;
	Tue, 10 Nov 2026 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkxRLQKe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD241F008A4;
	Tue, 10 Nov 2026 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305128;
	bh=n7JHToNvmvovrxsCT+NsYxHL5scA7i94JGOHZjSN1bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FkxRLQKe2exp2p0YBuRQCorQW8fK+JO16bZr31sSfbbg66nXkxqHsgponQcdBK0jX
	 DavDBSPy277+yZXKBuTxwIBFw44WRdpUQ63FuWtJJLKGi7WUV5STiwvF1mgjz+D+s9
	 2R3Zw5dfR3kp3fgXtxCypQsKsIjuRwRiI2Q5KT525LpWnU9ICcu+uzDOiLYFpvxkAU
	 vtn+DgLDVhMLMXx3dM1BGJ6IVMrSmMzlUlOag0e4HVtvDX8dhJHzkpfejT26Pf9LSJ
	 odI8MM+xQgHW8NPsi+f9yRInvQzSygij6hL4uFUzd9HXeq1XBPygQHUrwSKyNM524Q
	 LhEEWntTWrKqw==
Date: Tue, 10 Nov 2026 10:05:20 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: akpm@linux-foundation.org, chengming.zhou@linux.dev, corbet@lwn.net, 
	david@kernel.org, link@vivo.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	odys.yuan@gmail.com, rppt@kernel.org, surenb@google.com, tujinjiang@huawei.com, 
	vbabka@kernel.org, xiao.wang@vivo.com
Subject: Re: [PATCH 2/4] ksm: skip rmap_item allocation for non-zero pages
 under only_merge_zero_pages
Message-ID: <avLrHrnpP3tuXXPZ@gremlin>
References: <20261110074312.219847-1-xu.xin@linux.dev>
 <20261110074451.220524-1-xu.xin@linux.dev>
 <20261110074451.220524-2-xu.xin@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110074451.220524-2-xu.xin@linux.dev>

On Tue, Nov 10, 2026 at 03:44:49PM +0800, Xu Xin (vivo) wrote:
> When only_merge_zero_pages is enabled, ksmd only ever merges empty
> (zeroed) anonymous pages with the kernel zero page. A page that carries
> data can never be merged, yet the current code still allocates an
> rmap_item for it in scan_get_next_rmap_item() before cmp_and_merge_page()
> decides to skip it.
>
> On workloads with a large amount of non-mergeable anonymous memory this
> is a real cost: every scanned non-zero page pays for an rmap_item
> allocation, and the rmap_items accumulate in the per-mm pending list.
> For example, a MySQL instance with hundreds of gigabytes of anonymous
> memory (mostly buffer pool pages that cannot be merged) ends up with
> ksmd creating rmap_item metadata for each candidate page; the metadata
> overhead can wipe out any gain from the zero-page merging and even turn
> the net benefit negative.
>
> Add should_skip_non_zero_page(), called in scan_get_next_rmap_item() before
> get_next_rmap_item(), which, when only_merge_zero_pages is enabled,
> checks whether the candidate page is all zeros. A non-zero page is
> skipped entirely: no rmap_item is allocated for it, and any stale
> pending rmap_items below it are freed (as get_next_rmap_item() would).
> The page is reported back to ksm_do_scan() as ERR_PTR(-EAGAIN), which
> counts it as scanned and continues, so the pages_to_scan budget is
> preserved.
>
> The all-zero check (pages_identical() against the kernel zero page) reads
> the whole page. For a non-zero page this is a net win: the extra page read
> is cheaper than the rmap_item allocation and the stable/unstable tree
> operations it would otherwise trigger.
>
> A page that is zero now but is written before cmp_and_merge_page() runs
> is still handled correctly, because the checksum-based decision in
> cmp_and_merge_page() (added by the previous patch) is the authoritative
> one.
>

Please re-write this in your own words.

It's rambling on and never gets to the point of _what this patch does and
why_.

I'm not interested in reading a novel to understand the code :)

It seems very LLM generated, LLMs are _terrible_ at writing commit messages
and commits, please re-write all of that.

> Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
> Co-developed-by: Jinjiang Tu <tujinjiang@huawei.com>
> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>

Why are this and the other patches in-reply-to 1/4? That's not how you send
a series in mm.

> ---
>  mm/ksm.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 49f3728a3d03..e641c37ee096 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -2535,6 +2535,69 @@ static bool should_skip_rmap_item(struct folio *folio,
>  	return true;
>  }
>
> +/*
> + * Determines whether a candidate page should be skipped entirely when
> + * only_merge_zero_pages is enabled, before an rmap_item is allocated for
> + * it.
> + *
> + * A page that is not all zeros carries data and can never be merged with
> + * the kernel zero page, so there is no point in allocating an rmap_item
> + * for it. Skipping it here avoids the rmap_item metadata cost that full
> + * KSM would otherwise pay for every non-mergeable page.
> + *
> + * @rmap_list: head of the per-mm pending rmap_item list
> + * @addr:      address of the candidate page
> + * @folio:     folio containing the candidate page
> + * @page:      the candidate page
> + *
> + * Returns true if the page should be skipped (and any stale pending
> + * rmap_items below @addr are freed), false if it should be processed.
> + */

This is a really weird mix of kdoc style + not kdoc style while not being a
kdoc, for a static function?

> +static bool should_skip_non_zero_page(struct ksm_rmap_item **rmap_list,
> +			     unsigned long addr, struct folio *folio,
> +			     struct page *page)
> +{
> +	struct ksm_rmap_item *rmap_item;
> +
> +	if (!ksm_only_merge_zero_pages)
> +		return false;
> +
> +	/*
> +	 * Pages already merged by KSM are handled by cmp_and_merge_page();
> +	 * do not skip them here.
> +	 */
> +	if (folio_test_ksm(folio))
> +		return false;
> +
> +	/*
> +	 * An all-zero page is exactly what we want to merge with the kernel
> +	 * zero page; process it.
> +	 */
> +	if (pages_identical(page, ZERO_PAGE(0)))
> +		return false;
> +
> +	/*
> +	 * The page carries data: free any pending rmap_items that are below
> +	 * it (they are stale, as get_next_rmap_item() would), and skip it so
> +	 * no rmap_item is allocated for it.
> +	 *
> +	 * Compare the masked address, unlike get_next_rmap_item() which
> +	 * compares the raw rmap_item->address (which may carry the
> +	 * UNSTABLE/STABLE_FLAG bits). That is intentional: a pending
> +	 * rmap_item at the same address as a non-zero page is stale and must
> +	 * be freed here, not returned for processing.
> +	 */

We don't need a prose version of the code, and it reads like AI slop, we
don't want AI slop comments, thanks.

> +	while (*rmap_list) {
> +		rmap_item = *rmap_list;

Why is rmap_item function-scoped when it could be block-scoped here...

> +		if ((rmap_item->address & PAGE_MASK) > addr)
> +			break;
> +		*rmap_list = rmap_item->rmap_list;
> +		remove_rmap_item_from_tree(rmap_item);
> +		free_rmap_item(rmap_item);
> +	}

This code is very ugly.

Newline...

> +	return true;


> +}
> +
>  struct ksm_next_page_arg {
>  	struct folio *folio;
>  	struct page *page;
> @@ -2737,6 +2800,16 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
>  			if (tmp_page) {
>  				flush_anon_page(vma, tmp_page, ksm_scan.address);
>  				flush_dcache_page(tmp_page);
> +
> +				if (should_skip_non_zero_page(ksm_scan.rmap_list,
> +						     ksm_scan.address, folio,
> +						     tmp_page)) {
> +					folio_put(folio);
> +					ksm_scan.address += PAGE_SIZE;
> +					mmap_read_unlock(mm);
> +					return ERR_PTR(-EAGAIN);
> +				}
> +

I don't love just shoving more logic into an already massive function. No
to this.

At some point technical debt has to be paid, clean up this code first please.

>  				rmap_item = get_next_rmap_item(mm_slot,
>  					ksm_scan.rmap_list, ksm_scan.address);
>  				if (rmap_item) {
> @@ -2839,6 +2912,15 @@ static void ksm_do_scan(unsigned int scan_npages)
>  		rmap_item = scan_get_next_rmap_item(&page);
>  		if (!rmap_item)
>  			return;
> +		if (rmap_item == ERR_PTR(-EAGAIN)) {
> +			/*
> +			 * A non-zero page was skipped under
> +			 * only_merge_zero_pages: it was examined but not
> +			 * merged, so count it as scanned and keep going.
> +			 */

Similarly schloppy.

> +			ksm_pages_scanned++;
> +			continue;
> +		}
>  		cmp_and_merge_page(page, rmap_item);
>  		put_page(page);
>  		ksm_pages_scanned++;
> --
> 2.34.1
>

All in all adding far too much complexity in a cycle which is
fix-focused...

--
Cheers, Lorenzo
