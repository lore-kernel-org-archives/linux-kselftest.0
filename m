Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E66C26FDAC
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 21:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770067405; cv=none; b=B1kaZsn/v+dY4UO3Sf4gHy89ysBjAOLVV5vrG3xCrAv/NxGIIe9rHgFy3EOkXVxmsRcFrdwoDkBQaSmOnjdsuLvwyE1mw5W5+hO/CDNf/1xEzU2DEzAVTrrRIRf7QPURzd8UhwGIyhK9qrXRgQRlb1n/Smi1Wg+8fhZDk9xT+oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770067405; c=relaxed/simple;
	bh=lOs0xccYEQWyLRuzUgVsgIemarRJDZYE7WIRrqIMQgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYD1V71uLK9dgFO+90zKcjkKuuIwCn5P3yfpAKMEdfu7yNZCRlTJw5dNkKkBM6r4zdmGkV0ZolATJAtPNgurieAXwA0uAHFF0dAGDrAE/dzfuXTa+Eweyjdtx7boVFQrzia+RzzAdweoyZFVHyLWMsu6h2KUcrByxATKiXHFB5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MIDUg233; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fJ90rynq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MIDUg233";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fJ90rynq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770067403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TAkCddEGgJt8HRpnmblWaVWehXrqOQRfOa3v8YeWJbE=;
	b=MIDUg233Jox8hSC9XwCr43H3D2mUCg0bTp3qhs4HVu/EzGtdG7+SwrqLZ6Uzphz8I7rRmD
	9Yd018UsP+et6wmQrkxg6Lqb5UZgWjzO+v2Ljtsop/5XwIrZubiab4dsAhZJFlr3iwlu5A
	qTmlC4o2InHfwaD0X4t24pPJRStGJUE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-cZKa3OadN6ikpxWByDXNPw-1; Mon, 02 Feb 2026 16:23:22 -0500
X-MC-Unique: cZKa3OadN6ikpxWByDXNPw-1
X-Mimecast-MFC-AGG-ID: cZKa3OadN6ikpxWByDXNPw_1770067401
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-501473ee94fso248411581cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 13:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770067401; x=1770672201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TAkCddEGgJt8HRpnmblWaVWehXrqOQRfOa3v8YeWJbE=;
        b=fJ90rynqHQiBCr/Yh8cLBRvzGpRh+KTbVV1vyb7C7INvlMoxcWrSBidpvjvmN/zd2z
         5YKCfrOTOqevJqrluFImTPKZ4YvsJNHK8bvnH0qsEPcCavmtj8C5lyrWB1ILw36QkO2S
         7uJhDUmGTVFKgqmVVmw+yH/lG8xIKr897vI74BMHWRWWh6Y1BJIizil4dH7P5VlOc0yz
         TI4SyfjTKuV5UrG2pdOC6UUPZohdr4+jHlPRagGPvjZAsd39Ww0KAXTSNb2rMcJqRnSl
         Fu278Ev+EknjdiGOr4zPd/fT1AmTXdX/OD8/SinfA6ZZ1OkNoVq7mcGy69adEKteXWc5
         g02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770067401; x=1770672201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAkCddEGgJt8HRpnmblWaVWehXrqOQRfOa3v8YeWJbE=;
        b=Ax4GZfvCjEd6LKuMGWXutB4QECm3pIMpR+sifgza4JCWBQXchT+afvawFPvzhoUfbs
         VBxkEnL1O5bvp6+Jhp9UznbzzgvRJ04XfUjmanh8lZC/jFCpGo55auD9oteZlnp5WVYD
         kPe3bOTvlRqWC2sjQDk2NsuZDeCxAUTUOru2TBLs6+Ek5To1QPYs6jJX++zueGnDc1fm
         KK4bllKWgviYrL2wE4sZuPw7CRX8zqdryzaFwwqvUyif8SBuOmAq1OKOczky5XC9GAwJ
         9p+Y9TWwve89SRZj0R9ve8C10PaeOMamlR0bj6subI/i9sWojJUNayvBI08xA2xNJ8nF
         4/mg==
X-Forwarded-Encrypted: i=1; AJvYcCXTtYEBxKzM931hBDDY7kXjBRKs3ZvV9VVreBUbJOOCHdCWJLdn1MW9+IAxVl/Vl1+RLA6ccVI6O457WLnWK4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/dX91KtaP8ZSRHatepHF3Vov0DNK+RQ6T4KP8BSC1N2PVu2rB
	E+D837Qn9x4wR8Su0VBLtAdQVmVBn2WH7OT3t7tK2AYAn6zhM6CqdHZRFS/7l++apAun0b27z6/
	Vg1gj10FToQl49Y7MJaFG/V2CydEoEU1UBiUUHluuZtw0GpjQ81VlqmBwjcR6mc5Qwhbung==
X-Gm-Gg: AZuq6aL/AR7C37iZNI1PDlVf3eoswaqiNyaYfiSK1BG7cQ36EYdD1EJVHQfhZGAK3xy
	+9SZ1FguMx66bmjs1jeqhQMm3p6koNVxlvRUt+p7X3rpEfv/bFmyVQBq9t489xY4cWSaHd/9GuX
	YmdHYotkRvzuknQvTu6B1sHQ+IeY61vMthy6BAlT34jzBfE4HjOpdnXFAON10BbdxQ/cRoPVtKx
	WDP073P0GOcxYW10MvWeauX/Gl9xrl9UEXSdiYJpMbwaahXDWRjaqzFyO41yvv34cWbnKQDNLc7
	9+/Vpa7bnQf0l+xIemD5rqPhcMDjHov8n5tLWxaI35ZBjAGExhX0LTCfKmna3Qkcp8iJBQ3FhOo
	9GJI=
X-Received: by 2002:ac8:7e8f:0:b0:501:49f9:7488 with SMTP id d75a77b69052e-505d228ac65mr175015051cf.49.1770067400563;
        Mon, 02 Feb 2026 13:23:20 -0800 (PST)
X-Received: by 2002:ac8:7e8f:0:b0:501:49f9:7488 with SMTP id d75a77b69052e-505d228ac65mr175014571cf.49.1770067399931;
        Mon, 02 Feb 2026 13:23:19 -0800 (PST)
Received: from x1.local ([142.188.210.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d2847asm1309038885a.34.2026.02.02.13.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:23:19 -0800 (PST)
Date: Mon, 2 Feb 2026 16:23:16 -0500
From: Peter Xu <peterx@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	James Houghton <jthoughton@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Oscar Salvador <osalvador@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 05/17] userfaultfd: retry copying with locks dropped
 in mfill_atomic_pte_copy()
Message-ID: <aYEVxD_vY-qimMNL@x1.local>
References: <20260127192936.1250096-1-rppt@kernel.org>
 <20260127192936.1250096-6-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127192936.1250096-6-rppt@kernel.org>

Hi, Mike,

On Tue, Jan 27, 2026 at 09:29:24PM +0200, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Implementation of UFFDIO_COPY for anonymous memory might fail to copy
> data data from userspace buffer when the destination VMA is locked
> (either with mm_lock or with per-VMA lock).
> 
> In that case, mfill_atomic() releases the locks, retries copying the
> data with locks dropped and then re-locks the destination VMA and
> re-establishes PMD.
> 
> Since this retry-reget dance is only relevant for UFFDIO_COPY and it
> never happens for other UFFDIO_ operations, make it a part of
> mfill_atomic_pte_copy() that actually implements UFFDIO_COPY for
> anonymous memory.
> 
> shmem implementation will be updated later and the loop in
> mfill_atomic() will be adjusted afterwards.

Thanks for the refactoring.  Looks good to me in general, only some
nitpicks inline.

> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  mm/userfaultfd.c | 70 +++++++++++++++++++++++++++++++-----------------
>  1 file changed, 46 insertions(+), 24 deletions(-)
> 
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 45d8f04aaf4f..01a2b898fa40 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -404,35 +404,57 @@ static int mfill_copy_folio_locked(struct folio *folio, unsigned long src_addr)
>  	return ret;
>  }
>  
> +static int mfill_copy_folio_retry(struct mfill_state *state, struct folio *folio)
> +{
> +	unsigned long src_addr = state->src_addr;
> +	void *kaddr;
> +	int err;
> +
> +	/* retry copying with mm_lock dropped */
> +	mfill_put_vma(state);
> +
> +	kaddr = kmap_local_folio(folio, 0);
> +	err = copy_from_user(kaddr, (const void __user *) src_addr, PAGE_SIZE);
> +	kunmap_local(kaddr);
> +	if (unlikely(err))
> +		return -EFAULT;
> +
> +	flush_dcache_folio(folio);
> +
> +	/* reget VMA and PMD, they could change underneath us */
> +	err = mfill_get_vma(state);
> +	if (err)
> +		return err;
> +
> +	err = mfill_get_pmd(state);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
>  static int mfill_atomic_pte_copy(struct mfill_state *state)
>  {
> -	struct vm_area_struct *dst_vma = state->vma;
>  	unsigned long dst_addr = state->dst_addr;
>  	unsigned long src_addr = state->src_addr;
>  	uffd_flags_t flags = state->flags;
> -	pmd_t *dst_pmd = state->pmd;
>  	struct folio *folio;
>  	int ret;
>  
> -	if (!state->folio) {
> -		ret = -ENOMEM;
> -		folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, dst_vma,
> -					dst_addr);
> -		if (!folio)
> -			goto out;
> +	folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, state->vma, dst_addr);
> +	if (!folio)
> +		return -ENOMEM;
>  
> -		ret = mfill_copy_folio_locked(folio, src_addr);
> +	ret = -ENOMEM;
> +	if (mem_cgroup_charge(folio, state->vma->vm_mm, GFP_KERNEL))
> +		goto out_release;
>  
> +	ret = mfill_copy_folio_locked(folio, src_addr);
> +	if (unlikely(ret)) {
>  		/* fallback to copy_from_user outside mmap_lock */
> -		if (unlikely(ret)) {
> -			ret = -ENOENT;
> -			state->folio = folio;
> -			/* don't free the page */
> -			goto out;
> -		}
> -	} else {
> -		folio = state->folio;
> -		state->folio = NULL;
> +		ret = mfill_copy_folio_retry(state, folio);

Yes, I agree this should work and should avoid the previous ENOENT
processing that might be hard to follow.  It'll move the complexity into
mfill_state though (e.g., now it's unknown on the vma lock state after this
function returns..), but I guess it's fine.

> +		if (ret)
> +			goto out_release;
>  	}
>  
>  	/*
> @@ -442,17 +464,16 @@ static int mfill_atomic_pte_copy(struct mfill_state *state)
>  	 */
>  	__folio_mark_uptodate(folio);

Since success path should make sure vma lock held when reaching here, but
now with mfill_copy_folio_retry()'s presence it's not as clear as before,
maybe we add an assertion for that here before installing ptes?  No strong
feelings.

>  
> -	ret = -ENOMEM;
> -	if (mem_cgroup_charge(folio, dst_vma->vm_mm, GFP_KERNEL))
> -		goto out_release;
> -
> -	ret = mfill_atomic_install_pte(dst_pmd, dst_vma, dst_addr,
> +	ret = mfill_atomic_install_pte(state->pmd, state->vma, dst_addr,
>  				       &folio->page, true, flags);
>  	if (ret)
>  		goto out_release;
>  out:
>  	return ret;
>  out_release:
> +	/* Don't return -ENOENT so that our caller won't retry */
> +	if (ret == -ENOENT)
> +		ret = -EFAULT;

I recall the code removed is the only path that can return ENOENT?  Then
maybe this line isn't needed?

>  	folio_put(folio);
>  	goto out;
>  }
> @@ -907,7 +928,8 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
>  			break;
>  	}
>  
> -	mfill_put_vma(&state);
> +	if (state.vma)

I wonder if we should move this check into mfill_put_vma() directly, it
might be overlooked if we'll put_vma in other paths otherwise.

> +		mfill_put_vma(&state);
>  out:
>  	if (state.folio)
>  		folio_put(state.folio);
> -- 
> 2.51.0
> 

-- 
Peter Xu

