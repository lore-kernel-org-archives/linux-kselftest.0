Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3D05540A9;
	Wed, 23 Sep 2026 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181861; cv=none; b=PKyRQ0PUP7UHFsu6KVnDEDmSnVG+f40W8S/4WPtMK8QCVk/GqxildwWGh3E5uWeD4UrfEU3O0xJB2Eee6hFCpM3KEER1xoNHFlZ8YItDhrAWE/BhJQDQGuRC149ivz+4mIoCGO1IJQvtQ1rAmy0v9P5yIstlrIlpufrOxzMNo8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181861; c=relaxed/simple;
	bh=Nuf0x5Che1kW9MXRNKV1O0+PL473KETLCmpr2hKdS4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/MJeKpEheH8xxdNpZqDSAGaPipXlC8s6K/1hH6DrbedsLyNhvvZ0j7tWWXBWcXzLRQG5YLtvAsQVOKLsKAdMZQ+/f3DYsjlFQuELF/PES//lCO/iNod+zKF/mhMkFVeEHuGeP0+KP88tX1F6u4NExi76LbbizYCHsmkbZgnSlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVfroUQH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVfroUQH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B491F000FF;
	Wed, 23 Sep 2026 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790181846;
	bh=OoOOTxuoQ6EZdspGU37DbBh74bllbiSJrPb5SoDh0CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aVfroUQHOic+0dG0LtM4us94aUGmqKHasYKAZgcYJrcxPjPbj5PP5puWmbXv5Lm42
	 bS+BGz9yKlGjxIJm0id71spz1+rpkhp+PxPuCNaCeDAgzf87xT/KSjJJVcSfAE/pUI
	 HjV76sMIkOY63g05fjx/v73QViQR19pqGlwq981+F+TLl4u7fuB/C0Vw5Nt7oH1Ase
	 GPvWMA44C1MyxkRN3nfJs3XI6FKVEErJZ3j+029Wf68CH3vAWVIxFQwos99gUm5fHi
	 xf/StU/KeKQnZWOAwI0SycRR/t4do0Umk9NjI775dI42NX7pgIw6wG/i5hPFMhcqIq
	 d2mGoCF1AbkZA==
Date: Wed, 23 Sep 2026 17:43:59 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, david@kernel.org, vbabka@kernel.org, jannh@google.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 05/10] mm/madvise: factor huge-PMD folio processing
Message-ID: <arP4Igew3iL9qVKW@gremlin>
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-6-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922235830.2350770-6-gourry@gourry.net>

On Tue, Sep 22, 2026 at 07:58:25PM -0400, Gregory Price wrote:
> The huge-PMD branch combines PMD validation and lock ownership with folio
> filtering, splitting, aging and isolation.
>
> Move the folio-specific work into a helper called with the PMD lock held.
> Return a locked and referenced folio only when the caller must drop the PMD
> lock and split it.
>
> No functional change intended.
>
> Assisted-by: LLM
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  mm/madvise.c | 70 ++++++++++++++++++++++++++++++++++------------------
>  1 file changed, 46 insertions(+), 24 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index b31b877c2c130..6b518f7f73651 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -394,6 +394,49 @@ static bool madvise_lru_folio_is_filtered(struct folio *folio,
>  	       (pageout_anon_only && !folio_test_anon(folio));
>  }
>
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +static void madvise_cold_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
> +		pmd_t *pmd, unsigned long addr, pmd_t orig_pmd)
> +{
> +	if (!pmd_young(orig_pmd))
> +		return;
> +
> +	pmdp_invalidate(vma, addr, pmd);
> +	orig_pmd = pmd_mkold(orig_pmd);
> +	set_pmd_at(tlb->mm, addr, pmd, orig_pmd);
> +	tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
> +}
> +
> +/* Return a locked, referenced folio only when it must be split. */

I find it really weird that when it:

a. succeeds
b. mapped folio is missing/invalid/filtered

In both cases it returns NULL.

And it's also weirdly returning a folio in a kind of failure case, or it's
more like a defer-to-the-rest-of-the-code case I suppose.

I wonder if the split could be done as part of the function?

Then maybe have it return bool and document that true means it's fully
processed (invalid folio cases, success case), false means that it's been
split and the rest of the code should continue.

Awkward one actually.

> +static struct folio *
> +madvise_lru_huge_pmd_locked(pmd_t *pmd, pmd_t orig_pmd,
> +		unsigned long addr, unsigned long next, struct mm_walk *walk,
> +		struct list_head *folio_list, bool pageout_anon_only)
> +{
> +	const struct madvise_walk_private *private = walk->private;
> +	struct vm_area_struct *vma = walk->vma;
> +	struct folio *folio;
> +
> +	folio = vm_normal_folio_pmd(vma, addr, orig_pmd);
> +	if (!folio || folio_is_zone_device(folio))
> +		return NULL;
> +	if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
> +		return NULL;
> +
> +	if (next - addr != HPAGE_PMD_SIZE) {

NIT: Maybe could define above as:

	const bool spans_pmd = next - addr == HPAGE_PMD_SIZE;

And then make this:

	if (!spans_pmd)

?

> +		if (!folio_trylock(folio))
> +			return NULL;
> +		folio_get(folio);
> +		return folio;
> +	}
> +
> +	if (!private->pageout)
> +		madvise_cold_pmd(private->tlb, vma, pmd, addr, orig_pmd);
> +	madvise_lru_folio(folio, private->pageout, folio_list);
> +	return NULL;
> +}
> +#endif
> +
>  static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
>  		unsigned long end, struct mm_walk *walk)
>  {
> @@ -431,22 +474,11 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
>  			goto huge_unlock;
>  		}
>
> -		folio = vm_normal_folio_pmd(vma, addr, orig_pmd);
> -		if (!folio)
> -			goto huge_unlock;
> -
> -		if (folio_is_zone_device(folio))
> -			goto huge_unlock;
> -
> -		if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
> -			goto huge_unlock;
> -
> -		if (next - addr != HPAGE_PMD_SIZE) {
> +		folio = madvise_lru_huge_pmd_locked(pmd, orig_pmd, addr, next,
> +				walk, &folio_list, pageout_anon_only);
> +		if (folio) {
>  			int err;
>
> -			if (!folio_trylock(folio))
> -				goto huge_unlock;
> -			folio_get(folio);
>  			spin_unlock(ptl);
>  			err = split_folio(folio);
>  			folio_unlock(folio);
> @@ -455,16 +487,6 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
>  				goto regular_folio;
>  			return 0;
>  		}
> -
> -		if (!pageout && pmd_young(orig_pmd)) {
> -			pmdp_invalidate(vma, addr, pmd);
> -			orig_pmd = pmd_mkold(orig_pmd);
> -
> -			set_pmd_at(mm, addr, pmd, orig_pmd);
> -			tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
> -		}
> -
> -		madvise_lru_folio(folio, pageout, &folio_list);
>  huge_unlock:
>  		spin_unlock(ptl);
>  		if (pageout)
> --
> 2.53.0-Meta
>

--
Cheers, Lorenzo
