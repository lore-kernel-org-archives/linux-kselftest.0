Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0883B3CB560;
	Wed, 23 Sep 2026 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179250; cv=none; b=Ywn6p3G1JiNuQmZmSPAFOeEA2f0L7g192UkgZOOqFbIrR33cbTW8mJIUYgkXH9ZdcVZKXBUwD1MpiKvmWtrblNTaM99TCWK+DWvBiT+9dzOAkWQxyRcvi8Gi3pPY4NntPLr9yFnckQkrNQecDY5t21Ad1n6bZOlqKnqaBZEvt6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179250; c=relaxed/simple;
	bh=XeB5Dbjdt/a+fJkU7UZVQy9rEZwcJsdYpiAIRXmA+ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cch+j6bQoFVH+Sc+soPUSJiNrHf9GAeh4R9jWahoSSB+CnVlIHnE6c2ZtwDXwO+AbitPtelO34VtP9Mu1Rbbe7KHzX+RLP75uhzJ0sP8V4X0e7PmGQpsm4zWNoRD/oTOXXra586NVXfh+tkgZX1I8RrS7cdEE3pTbBpFjfd6MYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlegRbPy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlegRbPy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31DF1F0089C;
	Wed, 23 Sep 2026 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790179247;
	bh=AHP9yMNw4O4Y55aivDsZcXi1ygfma9rl6UXHfkVvyUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YlegRbPyfJSaVVQWD97w0tpENa8G1akqMLmPiaL64UEUdemubV5zjP+0EfGoV456w
	 Uifzj7cb+vqbQ9XV9k0NZuiHdjgq2bbtktteEEZCqU+RyfE8Vdzs14C6QjTn3dk6ex
	 QG9bT67uVMzA8K/x0tiPCTdfiCFFlBRhlNL9GZTklh54hroAlXxqi4bnRFWMbo4R6R
	 /EkSIQ99nHp7NsW3bNj1lcbStY08CYCKLK3E/QiLT/9dA1F/p/qi+HC4F9ZCa+i/hK
	 GMYVXvajUrnN01mEg2OK5Ej+gpXbBw0EoN3rLbOAA1buCrlaLRELjpJxcKrpZI/XcI
	 0K2+nD7J24Zuw==
Date: Wed, 23 Sep 2026 17:00:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, david@kernel.org, vbabka@kernel.org, jannh@google.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 03/10] mm/madvise: factor shared LRU folio handling
Message-ID: <arP2k_07Mxp6AYYU@gremlin>
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-4-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922235830.2350770-4-gourry@gourry.net>

On Tue, Sep 22, 2026 at 07:58:23PM -0400, Gregory Price wrote:
> The huge-PMD and PTE paths duplicate folio filtering, reference clearing,
> deactivation and pageout isolation. Keeping both copies synchronized
> obscures the page-table-specific control flow.
>
> Factor the common filtering and LRU operation into helpers. Keep the
> lock-before-reference sequence visible at each split site because an early
> reference can prevent split_folio() from succeeding.
>
> No functional change intended.
>
> Assisted-by: LLM
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>

LGTM and AFAICT all the code is the same as before just less horrifying so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/madvise.c | 90 +++++++++++++++++++++++++---------------------------
>  1 file changed, 43 insertions(+), 47 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 83d54ab385da8..c345fef23f15d 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -361,6 +361,39 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
>  				     FPB_MERGE_YOUNG_DIRTY);
>  }
>
> +static inline void
> +madvise_lru_folio(struct folio *folio, bool pageout,
> +		struct list_head *folio_list)
> +{
> +	/*
> +	 * Clear references before deactivating or reclaiming the folio. This can
> +	 * make idle-page tracking miss recent accesses.
> +	 */
> +	folio_clear_referenced(folio);
> +	folio_test_clear_young(folio);
> +	if (folio_test_active(folio))
> +		folio_set_workingset(folio);
> +
> +	if (!pageout) {
> +		folio_deactivate(folio);
> +		return;
> +	}
> +
> +	if (!folio_isolate_lru(folio))
> +		return;
> +	if (folio_test_unevictable(folio))
> +		folio_putback_lru(folio);
> +	else
> +		list_add(&folio->lru, folio_list);
> +}
> +
> +static bool madvise_lru_folio_is_filtered(struct folio *folio,
> +		bool pageout_anon_only)
> +{
> +	return folio_maybe_mapped_shared(folio) ||
> +	       (pageout_anon_only && !folio_test_anon(folio));
> +}
> +
>  static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
>  		unsigned long end, struct mm_walk *walk)
>  {
> @@ -373,15 +406,14 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
>  	spinlock_t *ptl;
>  	struct folio *folio = NULL;
>  	LIST_HEAD(folio_list);
> -	bool pageout_anon_only_filter;
>  	unsigned int batch_count = 0;
> +	bool pageout_anon_only;
>  	int nr;
>
>  	if (fatal_signal_pending(current))
>  		return -EINTR;
> -
> -	pageout_anon_only_filter = pageout && !vma_is_anonymous(vma) &&
> -					!can_do_file_pageout(vma);
> +	pageout_anon_only = pageout && !vma_is_anonymous(vma) &&
> +				       !can_do_file_pageout(vma);
>
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  	if (pmd_trans_huge(*pmd)) {
> @@ -407,11 +439,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
>  		if (folio_is_zone_device(folio))
>  			goto huge_unlock;
>
> -		/* Do not interfere with other mappings of this folio */
> -		if (folio_maybe_mapped_shared(folio))
> -			goto huge_unlock;
> -
> -		if (pageout_anon_only_filter && !folio_test_anon(folio))
> +		if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
>  			goto huge_unlock;
>
>  		if (next - addr != HPAGE_PMD_SIZE) {
> @@ -437,19 +465,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
>  			tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
>  		}
>
> -		folio_clear_referenced(folio);
> -		folio_test_clear_young(folio);
> -		if (folio_test_active(folio))
> -			folio_set_workingset(folio);
> -		if (pageout) {
> -			if (folio_isolate_lru(folio)) {
> -				if (folio_test_unevictable(folio))
> -					folio_putback_lru(folio);
> -				else
> -					list_add(&folio->lru, &folio_list);
> -			}
> -		} else
> -			folio_deactivate(folio);
> +		madvise_lru_folio(folio, pageout, &folio_list);
>  huge_unlock:
>  		spin_unlock(ptl);
>  		if (pageout)
> @@ -502,9 +518,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
>  			if (nr < folio_nr_pages(folio)) {
>  				int err;
>
> -				if (folio_maybe_mapped_shared(folio))
> -					continue;
> -				if (pageout_anon_only_filter && !folio_test_anon(folio))
> +				if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
>  					continue;
>  				if (!folio_trylock(folio))
>  					continue;
> @@ -537,7 +551,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
>  		    folio_mapcount(folio) != folio_nr_pages(folio))
>  			continue;
>
> -		if (pageout_anon_only_filter && !folio_test_anon(folio))
> +		if (pageout_anon_only && !folio_test_anon(folio))
>  			continue;
>
>  		if (!pageout && pte_young(ptent)) {
> @@ -546,25 +560,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
>  			tlb_remove_tlb_entries(tlb, pte, nr, addr);
>  		}
>
> -		/*
> -		 * We are deactivating a folio for accelerating reclaiming.
> -		 * VM couldn't reclaim the folio unless we clear PG_young.
> -		 * As a side effect, it makes confuse idle-page tracking
> -		 * because they will miss recent referenced history.
> -		 */
> -		folio_clear_referenced(folio);
> -		folio_test_clear_young(folio);
> -		if (folio_test_active(folio))
> -			folio_set_workingset(folio);
> -		if (pageout) {
> -			if (folio_isolate_lru(folio)) {
> -				if (folio_test_unevictable(folio))
> -					folio_putback_lru(folio);
> -				else
> -					list_add(&folio->lru, &folio_list);
> -			}
> -		} else
> -			folio_deactivate(folio);
> +		madvise_lru_folio(folio, pageout, &folio_list);
>  	}
>
>  out:
> @@ -651,8 +647,8 @@ static long madvise_pageout(struct madvise_behavior *madv_behavior)
>  	 * owner nor write capable of the file. We allow private file mappings
>  	 * further to pageout dirty anon pages.
>  	 */
> -	if (!vma_is_anonymous(vma) && (!can_do_file_pageout(vma) &&
> -				(vma->vm_flags & VM_MAYSHARE)))
> +	if (!vma_is_anonymous(vma) && !can_do_file_pageout(vma) &&
> +	    (vma->vm_flags & VM_MAYSHARE))
>  		return 0;
>
>  	lru_add_drain();
> --
> 2.53.0-Meta
>

--
Cheers, Lorenzo
