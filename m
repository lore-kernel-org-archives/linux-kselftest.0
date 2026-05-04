Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DBD1E834B
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 03:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777866494; cv=none; b=vCr1lWJNBND3/7dC19rBz3RI8Pe4YHXUQcuEc0/iAajfteAITZx7O0b6jN3iX3ixRo+ywbfpYDA0VGNrkQ5DpoHrzjFpQFqHm9gE1StWxur6Qp3kIKE0eJnNAl+62mVrv5vvnrVSnYajRxgln8CS7f60rvLRnWtyonPaHY8UH1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777866494; c=relaxed/simple;
	bh=NE39VbSeyS1U/zfpUsibSgLVZCbZAEvdVZTuONAkhUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VoXdOFNUIY+gma72AxMn6JLzVoNrmdHqefwXpOu+1PM73yACmW4AQYUU9sPSNbMSY/NrMudXf5tqEPlgzIfbWsZku6ZIsyjRlW0MklBl5YDvOTs+GQMyKgMN/afDLL8WtcG7UnD4KxRoRoKD2DtATSZHkeTtXJWuXJ9audWTOFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OZggEc9d; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nT7WkBeP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OZggEc9d";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nT7WkBeP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777866491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0d34gXFxHlvZ/8OcBwFmPS8KNdBuUnK/1QEoQcHntzY=;
	b=OZggEc9doR79XCcBLnTnSnAFsvaprK4Unx28P+hE5wSjG41VjpoBUy00eWzk9DIM8DQ0nA
	gWCmQxKe9wENxtbhxbF2OBB/tNM1JzTMbHpjVpMXZhDhJo9UiKqgzKb8Sj3fr6CfsYa83E
	Pfq7G4If6EQemi7FV+5bSKxdXd11lMA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-sDWnWaaEPDi774rpzZ7s6w-1; Sun, 03 May 2026 23:48:10 -0400
X-MC-Unique: sDWnWaaEPDi774rpzZ7s6w-1
X-Mimecast-MFC-AGG-ID: sDWnWaaEPDi774rpzZ7s6w_1777866489
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bd5c42192aso16105477b3.0
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 20:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777866489; x=1778471289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0d34gXFxHlvZ/8OcBwFmPS8KNdBuUnK/1QEoQcHntzY=;
        b=nT7WkBePnnBrQEXZAoRuepP1UEtpCwnef2J8+OQ/i9ln+IDV/Wg0ISr7yzEKeBXRRC
         PF0R/XSNj9fbP0w95a6wKRyltXrcMgpTjHV4XQYPDsDayILT4zi7gWzgq5oQMDfob4jW
         4mjn1O4KKYm2NScFwrTtqvvVjHw2QVaCKO3TnNYpKpCdwvWMyaP4K2Qsrkr2FABSbsPt
         OmZkvk3qMifuD/oCPL3mGDzvtx63DDC5I+j8G0o3aouEd9qlZQ3exwe/kJnxhA1LjYmx
         RFZiva/p2BT7KZk9tjHDs3popMQHmSOC8MlKxQfe4hQMRBh5o45n15JDM97wP7phzdia
         bHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777866489; x=1778471289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0d34gXFxHlvZ/8OcBwFmPS8KNdBuUnK/1QEoQcHntzY=;
        b=tHExhxpqrbgCLCzBfeuanyFmFlqxQR4LCa1KaEPbh7yYhUnTnShAiwMT7Nhcg0H0FT
         Me6WbaonVVKK07byP4X9JAsp06SlPAUxT8ejJ3JhHn0vgp++wB+X+uVeq9jOqh8SQYV4
         4bFrYtJULCSnUP7wxO2Mc5NaR7mEG4m8u4xq3qrloh/dXklhaRK/abfZu5dHZ5Hx0Mfd
         d5OOCwAPKUfFXYRF9n8S3qF4X/4TRDwIP3+Gy12xASFkmmdY1oi+u7o6IwY/6kShyT6l
         mErS/9WzfnHycq9HrAHpQxM/kAQcPv07ME8w17sl177bnH2yTQpAAZf0NsGOkDLozPap
         wv2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/nz3SUeE9aIO7cTPZGjIzrZ7KNIwWojo2O+kkDoupO6ZFBddbHfTfpPKiYONvir4Ioj/Tm9ShfljjbAQlAfVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF2cd/nV05lm9vOYFfw3VT+n52QCj2XPNH/opBXINLVxZmZZ1e
	8kt8oXOfUU2JL5HSYlTNigXGaPGCBB9n7Giv3pj+o9Pu6Hvbv+px1LYDtYivHKcbDj+mJ7XkzB7
	C+cjmyqO25NZKuLIrZes7+1gWPP340YBY35R90ggm8Wd4EziAklCLJP1q9fSTPvp5MaSNjg==
X-Gm-Gg: AeBDiesBlg9aEZSI4VT9Wnin+kc6jTVknVW2of/Z685OfDDOv1zFSF1/Ur3pbF3bt7h
	xjxb9vT26m0nN6FwCEuwjWpqkQBhW8puzzHb3kEiDlN0S1yuG0YpR9/ucaApwCL9rDZk4Ywufpk
	2eY+zRT3XVtERFYKbeQn+l/qOPaJSezQ3y0F9uSNW+t5uPrnMjaC5YDZ2QaxySDU5j/B+wziFE9
	bVVmn4AqKj7XE7ecLdoSqDAy1MKC/CzEk+1UA4v9zyzTl4g/sVQ/0ImOZZy4obsBJUvMz2P0fpM
	rCZ1KRN63zy97ix3KWRNkKpiDuOvhkDGnJXErIXDQWcPrdHNaHTDvQHrU2dt+MfwVUHXiNQa9Ax
	UZedCMkVzd/HtVtlSPsOosVpVr+FkuqPoFuWjcz+epOhTxoFGUgT9tbuA28SHDHQoVmk=
X-Received: by 2002:a05:690c:d85:b0:7b6:783f:2122 with SMTP id 00721157ae682-7bd768ef380mr66368857b3.9.1777866489485;
        Sun, 03 May 2026 20:48:09 -0700 (PDT)
X-Received: by 2002:a05:690c:d85:b0:7b6:783f:2122 with SMTP id 00721157ae682-7bd768ef380mr66368697b3.9.1777866489040;
        Sun, 03 May 2026 20:48:09 -0700 (PDT)
Received: from [192.168.178.105] (78-0-206-107.adsl.net.t-com.hr. [78.0.206.107])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66839f63sm44701847b3.31.2026.05.03.20.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 20:48:08 -0700 (PDT)
Message-ID: <aa778cfc-b7f8-4100-89bb-d2b2ef8e1138@redhat.com>
Date: Sun, 3 May 2026 21:48:40 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/14] mm/khugepaged: remove READ_ONLY_THP_FOR_FS check
To: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Song Liu <songliubraving@fb.com>
Cc: Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Lorenzo Stoakes <ljs@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
References: <20260429152924.727124-1-ziy@nvidia.com>
 <20260429152924.727124-2-ziy@nvidia.com>
Content-Language: en-US
From: Nico Pache <npache@redhat.com>
In-Reply-To: <20260429152924.727124-2-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/29/26 9:29 AM, Zi Yan wrote:
> collapse_file() requires FSes supporting large folio with at least
> PMD_ORDER, so replace the READ_ONLY_THP_FOR_FS check with that.
> MADV_COLLAPSE ignores shmem huge config, so exclude the check for shmem.
> 
> While at it, replace VM_BUG_ON with VM_WARN_ON_ONCE.
> 
> Add a helper function mapping_pmd_folio_support() for FSes supporting large
> folio with at least PMD_ORDER.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   include/linux/pagemap.h | 26 ++++++++++++++++++++++++++
>   mm/khugepaged.c         | 10 ++++++++--
>   2 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 1f50991b43e3b..1fed3414fe9b8 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -513,6 +513,32 @@ static inline bool mapping_large_folio_support(const struct address_space *mappi
>   	return mapping_max_folio_order(mapping) > 0;
>   }
>   
> +/**
> + * mapping_pmd_folio_support() - Check if a mapping support PMD-sized folio
> + * @mapping: The address_space
> + *
> + * Some file supports large folio but does not support as large as PMD order.
> + * If a PMD-sized pagecache folio is attempted to be created on a filesystem,
> + * this check needs to be performed first.
> + *
> + * Return: true - PMD-sized folio is supported, false - PMD-sized folio is not
> + * supported.
> + */
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +static inline bool mapping_pmd_folio_support(const struct address_space *mapping)
> +{
> +	/* AS_FOLIO_ORDER is only reasonable for pagecache folios */
> +	VM_WARN_ON_ONCE((unsigned long)mapping & FOLIO_MAPPING_ANON);
> +
> +	return mapping_max_folio_order(mapping) >= PMD_ORDER;

Probably a stupid question, but I dont know FS thats well.

Here we are checking that the max allowed folio order is greater than 
(or eq) to the PMD_ORDER. Yet the function asks if PMD specifically is 
supported. In the future could we have some FS that does not support PMD 
orders, but does support larger orders (eg. PUD)?

Other than that. LGTM

Reviewed-by: Nico Pache <npache@redhat.com>

> +}
> +#else
> +static inline bool mapping_pmd_folio_support(const struct address_space *mapping)
> +{
> +	return false;
> +}
> +#endif
> +
>   /* Return the maximum folio size for this pagecache mapping, in bytes. */
>   static inline size_t mapping_max_folio_size(const struct address_space *mapping)
>   {
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index e112525c4aa9c..6808f2b48d864 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2235,8 +2235,14 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>   	int nr_none = 0;
>   	bool is_shmem = shmem_file(file);
>   
> -	VM_BUG_ON(!IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) && !is_shmem);
> -	VM_BUG_ON(start & (HPAGE_PMD_NR - 1));
> +	/*
> +	 * MADV_COLLAPSE ignores shmem huge config, so do not check shmem
> +	 *
> +	 * TODO: once shmem always calls mapping_set_large_folios() on its
> +	 * mapping, the shmem check can be removed.
> +	 */
> +	VM_WARN_ON_ONCE(!is_shmem && !mapping_pmd_folio_support(mapping));
> +	VM_WARN_ON_ONCE(start & (HPAGE_PMD_NR - 1));
>   
>   	result = alloc_charge_folio(&new_folio, mm, cc, HPAGE_PMD_ORDER);
>   	if (result != SCAN_SUCCEED)

