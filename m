Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FA053F69E;
	Wed, 23 Sep 2026 14:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174666; cv=none; b=WMLVnVNHs8aMymRZDuH5oAH/5W9kBZIp0gPfQzvGK29a+IMvQn5quFSr4RNXoBVnUFGEhBea8xk7+lfEsKYOqGUV6d4es9t/ceTeFAT/C5qUfNm+h9z2C4D3DMCv7OiQr+RnOt1yrUEGZVvCcIoklTty8fycM6fTJRaCScEnAko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174666; c=relaxed/simple;
	bh=spzqg+D0/Yknlb6DHMK3lL2F+z4tzSux7hWWKiYp+MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfyXqustO1VdOdgh9phUOk0+juNYfZu09pwptOgud0iz3hz/gekxpR/ToIfDF4uNBPwecLy1xzfRie8mGGNPbJ8asLxe7JaF9vJ3/uC3dmMV4mYP7wm9YkG2CnwoEAMRcn3luaAx3kXlrj+yH/lQpotfSGDjLrnXGbqwpMhKAz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbBUI4ka; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbBUI4ka"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399D31F00893;
	Wed, 23 Sep 2026 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790174664;
	bh=k3Gj1KoHBPW+MMBGRDviu/+7CrZBzX4/UWALlX64Nu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jbBUI4kagBJZFjXRhOfX2EXFsjw6WlIu8M3clwVpeBlyETtojNU73lDbB/VV878zs
	 2g/G9k/FSrL9yY0Mn3B7sK/Ll6LmbePnofTrehDk0gh2YzTH0vle0QA0Br2s5EG9OR
	 x+PWdZ4yVVX6ZYG66Tb5Z9OOt90KtC1mcf9kgi1GXDNzN+1RN0d9VqqQRObW5ACWx4
	 yfpjcFj3EoC4DcmwK7/xQxmtoe7VLZ7gDxNqcZ+9p0b7wjoA2l5ZcVnRTQgn6w2Mki
	 vmHxeI+MPs72HMzARGJGlcC6mVY6BXTjVjPw70A8Ug6rqrwMylmOhesyAg49/+1ftH
	 bbLOpVODsaErw==
Date: Wed, 23 Sep 2026 15:44:18 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, david@kernel.org, vbabka@kernel.org, jannh@google.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 02/10] mm/madvise: name the shared LRU PMD callback
Message-ID: <arPhlePckOPx1r6c@gremlin>
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-3-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922235830.2350770-3-gourry@gourry.net>

On Tue, Sep 22, 2026 at 07:58:22PM -0400, Gregory Price wrote:
> The MADV_COLD and MADV_PAGEOUT page-walk callback is named after its PTE
> implementation even though it is registered as a PMD callback and serves
> both LRU operations.
>
> Rename it to madvise_lru_pmd_entry() before separating the PMD and PTE
> paths.
>
> No functional change intended.
>
> Assisted-by: LLM
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>

Oh yeah wow I was thinking 'reasonable in that it is the PTE range which the PMD
entry spans' but err, no, it does handle THP PMDs too so :)

And LRU is a resonable name, it does seem to me that these are the only madvise
operations that qualify so all makes sense.

So:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/madvise.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 00b1be655a8b5..83d54ab385da8 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -361,9 +361,8 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
>  				     FPB_MERGE_YOUNG_DIRTY);
>  }
>
> -static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
> -				unsigned long addr, unsigned long end,
> -				struct mm_walk *walk)
> +static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
> +		unsigned long end, struct mm_walk *walk)
>  {
>  	struct madvise_walk_private *private = walk->private;
>  	struct mmu_gather *tlb = private->tlb;
> @@ -581,7 +580,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  }
>
>  static const struct mm_walk_ops cold_walk_ops = {
> -	.pmd_entry = madvise_cold_or_pageout_pte_range,
> +	.pmd_entry = madvise_lru_pmd_entry,
>  	.walk_lock = PGWALK_RDLOCK,
>  };
>
> --
> 2.53.0-Meta
>

--
Cheers, Lorenzo
