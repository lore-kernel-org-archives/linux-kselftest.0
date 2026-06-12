Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1303612F3
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781259330; cv=none; b=ULXLBNo8QQrIApBMPOOODJ0ClEs9swXTKnASJBPuW6WbLVCq3JfZA09zkkuO9bwiPKqQeVpEYJ734Eu5g91Dgt6H/4SfbpxG8BVuZ/3QtbUx1LW0IQklHRbpnJ3KUPNQTSSlb8sHqI/4DA6sbMd9YpmQ0lfxpOKmzpEbjBOUSIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781259330; c=relaxed/simple;
	bh=zcX1aAxr/ZTWzIfTjR8wiXQ00X3Sx1r+aXFuIKjszBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRU86/OnF7i0Eum0Pz6UqVLvjdOkXcjsswu/K++NiPfmTCWPEFzBWdHqxrpwSruuoRIT3/CUnO84Xht+psZChraCrZ88ReYpMg0pbQl9DgQV7uzaTYhO6CZBQFv7PtBVI5HwynFk6gVZdUaONBmHkEnVX26QlPFcpopWhVWBV1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=REpdeJ1W; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jUigHNSI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="REpdeJ1W";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jUigHNSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781259328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i9oL9t7aTdvBdwHJhOiFeypombt3sG9Uz8AxyHsXUhg=;
	b=REpdeJ1WnECOjsQxYxaxfsW3mZKHydE6jE+LMHZeryNUEzISMkbs5A/UunsFvriQ0FP6b7
	Ct/1QrlRp+hPm2CWtcYv9JNBYR3N+XLWYkh+Ek8WgJUuP0fuH3Y7uZZzb4Jvin5KI0yPTQ
	dh33GSrnEoXVuswyP+eOTY/i6Ze6dY0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-AmIyUw0cOQ2V8VjM6PZnkg-1; Fri, 12 Jun 2026 06:15:27 -0400
X-MC-Unique: AmIyUw0cOQ2V8VjM6PZnkg-1
X-Mimecast-MFC-AGG-ID: AmIyUw0cOQ2V8VjM6PZnkg_1781259326
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490cc1ae292so6739865e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 03:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781259326; x=1781864126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9oL9t7aTdvBdwHJhOiFeypombt3sG9Uz8AxyHsXUhg=;
        b=jUigHNSIZLP6Vdz4P50tptRDx3heegzf5SNhT7A51TeKusjWBO/Mzryl/lUYwb8BIX
         vZOWCBEBO8bJUOranPGe3TScOIOfaS2gN8epmo1gqbcsR5LjtAaEqvleMUwTQah6qiEl
         Ls0aXBrawU5PQB3No06Ws8K8C/hQphRF4Ik2UBfiuAoFlER8YcnFogZ84UV57PLgRZXt
         XsTt2mcZZ3NLs8sSBvVaqye5OVdAcRtoqddxzzVpzuzW2Iny4jYVZ+G6LFceAAq4dzJw
         8Iessik2pv5KZrcZL/fhkSJdkNGXeL6j9gRUe87jgFSD/iOUz4zy6gtUknjuux4Zc81c
         VIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781259326; x=1781864126;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9oL9t7aTdvBdwHJhOiFeypombt3sG9Uz8AxyHsXUhg=;
        b=pAWek5Az9aXq3opscUvYxwjK5cc68xpo0tZQBSD22zaqJ150qmGhbs5qjlBJ+XHxy8
         CA6ICrDpZcyUcQ/IHHTyEbgMlUFfg8IAQnNncEW6XJQbhUjsP4ewk6KAFBHpRKh0WIAo
         3L6kvY6iDIpQcEuUn9WQWiz4myGEYxHTTnWoh+ZAZWtcJLBtANNQkA+brEZ8Qn/VdJtM
         gKGTSeLzExnPcrSjQb6eYUt34cXUCA2RCA0AO+UOGKMi0+DmB4BxEq/L2xWjQ6ixV640
         KfZAQANfQixWXr1vLrbN0b0J8OYCPtHT0sE/GA93OcF6oszE6vYvNktUppkvP7ztdYKQ
         DW5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/+NqRXNFT78jFpc/ioLRA6exZmE94S9DGrB12/pW2dsUCUiFCYWnDdbNxNul7bG+GxKNUAZLRRnExMH1ZeXkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW508n6nX2t81kdIswC5cr2XQPLURuwNt++P9QQSSiawTCmmZ0
	gUb488iHaOfsnEchXlHAAjp5+ZQnFfVyZn4d4/BjvtKw2CaxYdv52OB/s+wuRhuYHIku5sjYMrp
	GEX0uwEVVptheUvL8M1ryFcRUkV7xX32N4qcmXYCX5x4jjNv4TgnkQLP1mgBGFSPhiqPdoA==
X-Gm-Gg: Acq92OFnV+tiv7W2TwjKDTN5KCVBVV/Bb2p7gAz+pwPo8vyeNbjFn7J54AFKAUfo3KG
	yuFYCGXQrLPO8q39l1pfp8LV8I3SdfxWMyK2jlcuhUU1Tj4iq1d64i83s+g3+dDRpeaPaCb4+xV
	3uEBhp1pKV8d4AJuKCmU57qsnsp1oFXIffSY5N2CTMFpYEsHXgjUOLJKJ7VIqhxhaUqbh5YmquS
	i3pajhkOFuhoXCKxx+TOkEOb+89beYY5guGOgxPSPEevC85BL+AIULIISfs0o5+RLpLarLwykd3
	FUwmhYBS6LdXLo1XdbZgtVSThgIdieV2hHq1vrfGBp6MkJiKLZ9F6vaj1KGw6vOIMm/XO6M4V4H
	nqYMJAi+b2YCFQCl9ikNgmwwm+xylndtkgH/4hQnoyr2B9kHUzJEDno7hygsnyHUC
X-Received: by 2002:a05:600c:5954:b0:490:3d3d:805a with SMTP id 5b1f17b1804b1-490ea9dbeacmr20508595e9.12.1781259325665;
        Fri, 12 Jun 2026 03:15:25 -0700 (PDT)
X-Received: by 2002:a05:600c:5954:b0:490:3d3d:805a with SMTP id 5b1f17b1804b1-490ea9dbeacmr20508265e9.12.1781259325147;
        Fri, 12 Jun 2026 03:15:25 -0700 (PDT)
Received: from [172.31.99.182] (91.red-83-48-118.staticip.rima-tde.net. [83.48.118.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f309sm4952894f8f.14.2026.06.12.03.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 03:15:24 -0700 (PDT)
Message-ID: <5eba8380-6fbc-4c0d-b267-cd39c24ffeea@redhat.com>
Date: Fri, 12 Jun 2026 04:16:39 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/11] mm: khugepaged: generalize collapse_file()
 for shmem mTHP support
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, hughd@google.com
Cc: willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
 <1274846e121e74f8db53950bec64f8f1938f2ec9.1781083630.git.baolin.wang@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Content-Language: en-US
In-Reply-To: <1274846e121e74f8db53950bec64f8f1938f2ec9.1781083630.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/10/26 4:29 AM, Baolin Wang wrote:
> Generalize the order of the collapse_file() function to support future
> shmem mTHP collapse.
> 
> No functional changes in this patch.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  mm/khugepaged.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 631459172e19..4adc8c6de062 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2214,6 +2214,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
>   * @file: file that collapse on
>   * @start: collapse start address
>   * @cc: collapse context and scratchpad
> + * @order: folio order being collapsed to
>   *
>   * Basic scheme is simple, details are more complex:
>   *  - allocate and lock a new huge page;
> @@ -2232,15 +2233,17 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
>   *    + unlock and free huge page;
>   */
>  static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
> -		struct file *file, pgoff_t start, struct collapse_control *cc)
> +		struct file *file, pgoff_t start, struct collapse_control *cc,
> +		int order)
>  {
> -	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, HPAGE_PMD_ORDER);
> +	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, order);
>  	struct address_space *mapping = file->f_mapping;
> +	const unsigned long nr_pages = 1UL << order;
>  	struct page *dst;
>  	struct folio *folio, *tmp, *new_folio;
> -	pgoff_t index = 0, end = start + HPAGE_PMD_NR;
> +	pgoff_t index = 0, end = start + nr_pages;
>  	LIST_HEAD(pagelist);
> -	XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
> +	XA_STATE_ORDER(xas, &mapping->i_pages, start, order);
>  	enum scan_result result = SCAN_SUCCEED;
>  	int nr_none = 0;
>  	bool is_shmem = shmem_file(file);
> @@ -2252,9 +2255,9 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>  	 * mapping, the shmem check can be removed.
>  	 */
>  	VM_WARN_ON_ONCE(!is_shmem && !mapping_pmd_folio_support(mapping));
> -	VM_WARN_ON_ONCE(start & (HPAGE_PMD_NR - 1));
> +	VM_WARN_ON_ONCE(start & (nr_pages - 1));
>  
> -	result = alloc_charge_folio(&new_folio, mm, cc, HPAGE_PMD_ORDER);
> +	result = alloc_charge_folio(&new_folio, mm, cc, order);
>  	if (result != SCAN_SUCCEED)
>  		goto out;
>  
> @@ -2591,12 +2594,12 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>  	}
>  
>  	if (is_shmem) {
> -		lruvec_stat_mod_folio(new_folio, NR_SHMEM, HPAGE_PMD_NR);
> +		lruvec_stat_mod_folio(new_folio, NR_SHMEM, nr_pages);
>  		lruvec_stat_mod_folio(new_folio, NR_SHMEM_THPS, HPAGE_PMD_NR);

Is this a accounting bug? (not your changes) but

lruvec_stat_mod_folio(new_folio, NR_SHMEM_THPS, HPAGE_PMD_NR);

If this stat is in THPs why are we iterating it by 512? shouldnt it just be +- 1


>  	} else {
>  		lruvec_stat_mod_folio(new_folio, NR_FILE_THPS, HPAGE_PMD_NR);

Same here.

>  	}
> -	lruvec_stat_mod_folio(new_folio, NR_FILE_PAGES, HPAGE_PMD_NR);
> +	lruvec_stat_mod_folio(new_folio, NR_FILE_PAGES, nr_pages);
>  
>  	/*
>  	 * Mark new_folio as uptodate before inserting it into the
> @@ -2604,14 +2607,14 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>  	 * unwritten page.
>  	 */
>  	folio_mark_uptodate(new_folio);
> -	folio_ref_add(new_folio, HPAGE_PMD_NR - 1);
> +	folio_ref_add(new_folio, nr_pages - 1);
>  
>  	if (is_shmem)
>  		folio_mark_dirty(new_folio);
>  	folio_add_lru(new_folio);
>  
>  	/* Join all the small entries into a single multi-index entry. */
> -	xas_set_order(&xas, start, HPAGE_PMD_ORDER);
> +	xas_set_order(&xas, start, order);
>  	xas_store(&xas, new_folio);
>  	WARN_ON_ONCE(xas_error(&xas));
>  	xas_unlock_irq(&xas);
> @@ -2666,7 +2669,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>  	folio_put(new_folio);
>  out:
>  	VM_BUG_ON(!list_empty(&pagelist));
> -	trace_mm_khugepaged_collapse_file(mm, new_folio, index, addr, is_shmem, file, HPAGE_PMD_NR, result);
> +	trace_mm_khugepaged_collapse_file(mm, new_folio, index, addr, is_shmem, file, nr_pages, result);

Although the tracepoint has nr_pages, order may be nice too like I did with the
anon tracing.

Once I refactor, and understand file collapse a little better ill be able to
comment on if youre missing anything in this function, but nothing sticks out at
the moment.

>  	return result;
>  }
>  
> @@ -2769,7 +2772,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
>  			result = SCAN_EXCEED_NONE_PTE;
>  			count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
>  		} else {
> -			result = collapse_file(mm, addr, file, start, cc);
> +			result = collapse_file(mm, addr, file, start, cc, HPAGE_PMD_ORDER);
>  		}
>  	}
>  

