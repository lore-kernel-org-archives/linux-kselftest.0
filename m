Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FAE35BDD5
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 17:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770140709; cv=none; b=OqKxutz2E85cwaoUGVaJqoKE5Po03mj7F6FIFy9qsQmI1KdtwayPVXw7m5qycvrNOUMGofW4ibGDKqS1AQHf1uaGrrWvd6d08FgZyt6E/ib32r4i1VVVWm3L+UKrf/LotFYMgWuO5k+cWNskVBGyTpkcwabXhcLXkgKQf+ugwEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770140709; c=relaxed/simple;
	bh=9t1fUsY8nDNXTD2RVVJumI8FxVBqWXScBzfMykEVp8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C05iUChmhfGwI9Fz590p9SV3qhf+WR3lb/pvvk9AifVH9rTv+PiauncbhmVrzcAfXIkIYyseEyMS68Zes1bbkISOhadsMrAXZfz8SgI2Vzd4pigmdYCD9Gp9W6S6Zd38fGW2lBkVV8P6WlmIbFgY+QHKM8I8WR0V6OL3j2sW60U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FY9s5nF7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PqcnK/Y+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FY9s5nF7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PqcnK/Y+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770140707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tlFrmjhVpayg8OBXKv6tROkmIHF/xjSd9Muscu3Dpsk=;
	b=FY9s5nF7qrQQ/SpoSiAXwucg4M13UD90jHocFZj5mswY4pGFRBXGrg1GnAO2GSRLsuyqkJ
	kTtEmHKd8u0aiiN8c/g9KoTNpoz/YQ4rCkLbgVgzFsxNIoG+DnfLZGOdDi3Sz0T00h9S7i
	3IPoeAJKD4e/hqVqsYBMWnBLLiCrhV4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-uku_stk3Os-CY3T3UievaA-1; Tue, 03 Feb 2026 12:45:06 -0500
X-MC-Unique: uku_stk3Os-CY3T3UievaA-1
X-Mimecast-MFC-AGG-ID: uku_stk3Os-CY3T3UievaA_1770140706
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5014c9ee70bso56810011cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 09:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770140706; x=1770745506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tlFrmjhVpayg8OBXKv6tROkmIHF/xjSd9Muscu3Dpsk=;
        b=PqcnK/Y+P5srIVqAQL7NO12bhlJArUFo761gJdPAvEMeFT1OIlkBEBFQhZEyeWRd1U
         niEe6xS/8u9v6c1GNBP7aTffvDSl4ChTot+Hi7NCKKV3vNCGFqWoNYahCQK4rq13GlgV
         nBe06UBjkDeyPnO38jwUbMRZB1CfWOyRhpUrVZv9LDG/1MNawhLIo4Fg/Wnq+FFus/+L
         DVELzX+u6Y8YMgd7YA2ve77CaTx9RLX6dbCg9OHF8HUSXerWSi+gq+MWHz8U1ymXtTlP
         jIDGvo7VKa7U6HKu5C5mxxfIQ3cATWJ486uuJq8BN3ctiWY5tQWSTZD4KIN0OwxqWOFP
         HUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770140706; x=1770745506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlFrmjhVpayg8OBXKv6tROkmIHF/xjSd9Muscu3Dpsk=;
        b=hLPYdsxhVi+3/HMIloBqsKzTHs5ycl6FmaYlLtR0zRmEiogoSQatIlYOK6SwVISPZj
         QI7F3F3mF4vYF1+4pKGEcBlZlRGwohgokKTm2X71s6Z0amH8p/8Wviwrt9LIg6JFY4gV
         d9uUGgO4qfnatWxe1jDj26nXeNxx3anL5sEhzGHLH/lDbgoPGfV2q/LCWRYY2V8jD/WR
         OU53hT+JgoWftMLv5E7b/DtAankRM58GzN2gLfVu2hpxz+w2Kd1XCoz8g+gHrh6urqlh
         lom8aqJWydW2/nX+JhpE9U4PR8zQKWfTxyD3xPEWwwaVY06N5k93Z9UMKpbd4IHLOVL6
         jaqg==
X-Forwarded-Encrypted: i=1; AJvYcCXadOEwq9s5NYZKk1G582Yfw/pLRut95kP34u0X0VtpnOHTVQUmUyNKhQl5sGCosw+CywO6eXmXG89ozmgrXxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFaTV3IzJeZaEHqGqjkj29+QSUtD8ikJg1CCbbeD3mF3LLOMvy
	Iy65JOM9opVjehrJ0RDF8oHvX9RZrUHDdaUt44OxrmqECJO52x21YHF6/+20aFPhXG+zl007gIh
	deRq7XjgQixL5DK+Nxo1oQGHNWJEmPIXkCtDyN+N7IYHiSeE+pz1aRE30tEDkSn9y+l8fog==
X-Gm-Gg: AZuq6aLS/908byp2SngozUdBBx5QSeAxkI0sQ2omeVzu+870WeOAr1v5qqwMCI7v5te
	xLqwuCcd2yBVF7D93VrEKyUVDzbJnNfWxSTBX4BMBgsfsSqlemgN9o3DMxvkMJNd7yRuDyFRUCY
	KWZzP/LUBn0C98Poc3xq15tkPiIX+0r3sCUvV2lpQec0TedG4fxaibqcsQK0Aw38p0C4iUAuQAC
	M4qXQi+zKjyehjw07L0gpr7asrJYfvs5aA4E1EU/YNfRMS0tQ6UO1iUFIsfC/41DHFbfo3jQbU5
	3ouc5chsVvEmKvk5+MonE0qieYlhoRYDCxZkHJVlJP/EQEMcBwySLUNG29A7/4ZUHqLPGrEoIqU
	VbdI=
X-Received: by 2002:a05:622a:1ba3:b0:501:181d:f71e with SMTP id d75a77b69052e-5061c18ec18mr1176601cf.38.1770140705460;
        Tue, 03 Feb 2026 09:45:05 -0800 (PST)
X-Received: by 2002:a05:622a:1ba3:b0:501:181d:f71e with SMTP id d75a77b69052e-5061c18ec18mr1175931cf.38.1770140704851;
        Tue, 03 Feb 2026 09:45:04 -0800 (PST)
Received: from x1.local ([142.188.210.156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5061c1f7764sm401081cf.23.2026.02.03.09.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 09:45:04 -0800 (PST)
Date: Tue, 3 Feb 2026 12:45:02 -0500
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
Subject: Re: [PATCH RFC 01/17] userfaultfd: introduce
 mfill_copy_folio_locked() helper
Message-ID: <aYI0HmP-XZNBI-gb@x1.local>
References: <20260127192936.1250096-1-rppt@kernel.org>
 <20260127192936.1250096-2-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127192936.1250096-2-rppt@kernel.org>

On Tue, Jan 27, 2026 at 09:29:20PM +0200, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Split copying of data when locks held from mfill_atomic_pte_copy() into
> a helper function mfill_copy_folio_locked().
> 
> This makes improves code readability and makes complex
> mfill_atomic_pte_copy() function easier to comprehend.
> 
> No functional change.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

The movement looks all fine,

Acked-by: Peter Xu <peterx@redhat.com>

Just one pure question to ask.

> ---
>  mm/userfaultfd.c | 59 ++++++++++++++++++++++++++++--------------------
>  1 file changed, 35 insertions(+), 24 deletions(-)
> 
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index e6dfd5f28acd..a0885d543f22 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -238,6 +238,40 @@ int mfill_atomic_install_pte(pmd_t *dst_pmd,
>  	return ret;
>  }
>  
> +static int mfill_copy_folio_locked(struct folio *folio, unsigned long src_addr)
> +{
> +	void *kaddr;
> +	int ret;
> +
> +	kaddr = kmap_local_folio(folio, 0);
> +	/*
> +	 * The read mmap_lock is held here.  Despite the
> +	 * mmap_lock being read recursive a deadlock is still
> +	 * possible if a writer has taken a lock.  For example:
> +	 *
> +	 * process A thread 1 takes read lock on own mmap_lock
> +	 * process A thread 2 calls mmap, blocks taking write lock
> +	 * process B thread 1 takes page fault, read lock on own mmap lock
> +	 * process B thread 2 calls mmap, blocks taking write lock
> +	 * process A thread 1 blocks taking read lock on process B
> +	 * process B thread 1 blocks taking read lock on process A

While moving, I wonder if we need this complex use case to describe the
deadlock.  Shouldn't this already happen with 1 process only?

  process A thread 1 takes read lock (e.g. reaching here but
                     before copy_from_user)
  process A thread 2 calls mmap, blocks taking write lock
  process A thread 1 goes on copy_from_user(), trigger page fault,
                     then tries to re-take the read lock

IIUC above should already cause deadlock when rwsem prioritize the write
lock here.

> +	 *
> +	 * Disable page faults to prevent potential deadlock
> +	 * and retry the copy outside the mmap_lock.
> +	 */
> +	pagefault_disable();
> +	ret = copy_from_user(kaddr, (const void __user *) src_addr,
> +			     PAGE_SIZE);
> +	pagefault_enable();
> +	kunmap_local(kaddr);
> +
> +	if (ret)
> +		return -EFAULT;
> +
> +	flush_dcache_folio(folio);
> +	return ret;
> +}
> +
>  static int mfill_atomic_pte_copy(pmd_t *dst_pmd,
>  				 struct vm_area_struct *dst_vma,
>  				 unsigned long dst_addr,
> @@ -245,7 +279,6 @@ static int mfill_atomic_pte_copy(pmd_t *dst_pmd,
>  				 uffd_flags_t flags,
>  				 struct folio **foliop)
>  {
> -	void *kaddr;
>  	int ret;
>  	struct folio *folio;
>  
> @@ -256,27 +289,7 @@ static int mfill_atomic_pte_copy(pmd_t *dst_pmd,
>  		if (!folio)
>  			goto out;
>  
> -		kaddr = kmap_local_folio(folio, 0);
> -		/*
> -		 * The read mmap_lock is held here.  Despite the
> -		 * mmap_lock being read recursive a deadlock is still
> -		 * possible if a writer has taken a lock.  For example:
> -		 *
> -		 * process A thread 1 takes read lock on own mmap_lock
> -		 * process A thread 2 calls mmap, blocks taking write lock
> -		 * process B thread 1 takes page fault, read lock on own mmap lock
> -		 * process B thread 2 calls mmap, blocks taking write lock
> -		 * process A thread 1 blocks taking read lock on process B
> -		 * process B thread 1 blocks taking read lock on process A
> -		 *
> -		 * Disable page faults to prevent potential deadlock
> -		 * and retry the copy outside the mmap_lock.
> -		 */
> -		pagefault_disable();
> -		ret = copy_from_user(kaddr, (const void __user *) src_addr,
> -				     PAGE_SIZE);
> -		pagefault_enable();
> -		kunmap_local(kaddr);
> +		ret = mfill_copy_folio_locked(folio, src_addr);
>  
>  		/* fallback to copy_from_user outside mmap_lock */
>  		if (unlikely(ret)) {
> @@ -285,8 +298,6 @@ static int mfill_atomic_pte_copy(pmd_t *dst_pmd,
>  			/* don't free the page */
>  			goto out;
>  		}
> -
> -		flush_dcache_folio(folio);
>  	} else {
>  		folio = *foliop;
>  		*foliop = NULL;
> -- 
> 2.51.0
> 

-- 
Peter Xu

