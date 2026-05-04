Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49610239562
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 03:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777867198; cv=none; b=u/wN74ZJgwDng3wex5Xcs3LZh34dJy52I6VcyRnb9IRn/PhQbyRaGewXBamxjKVaeYU9SkYPu/ZvATPlfJYjbZ4OaxFtx01VlP2JlCF8NBmYfDH162FTdPZ9x/Ald9WYxPSOkOiqGqhYwp4oyxARZSism8i6O1SLdRVFvwe19sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777867198; c=relaxed/simple;
	bh=E1h4p817VtPn+CV69Oc70SUo0D6XUAe9s6BOL/QKsf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BziJNPvqK2pYGOYslPyChVl1bUfFhIPfuXtPzuV6V92+5DZxLOryY/VzicWkz/tdb75UahaH2o8YGwgRwAfHB1ne1kBcJVb8HDyrYcutvZ/BvzWAmN3MzH2LkEIO/Ba2py9KGSj+okCGvbPAw/m/qxcxUXEgrmqcnpJZ2p+YuWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xgf2isDA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mTTsuKnA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xgf2isDA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mTTsuKnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777867196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aH3LgVMXf6Uuymix/+Ipek/Oiudb0lrDKNRk954dQLM=;
	b=Xgf2isDAUSZGjkAmvpOVoPXBO3jl72ja4XmM2RGEZUViZ41F8A0pnfBuYEvipyJI5FgChR
	9VHg72oxaR1hehMi4GQAeHx+NyzPPlF9wxQ/uc9E7/BEUuzx3ulA79VC0zHdxnyzuwfmp7
	7GhNsrYiCxxUwr+qAdiMKt56cf68TZo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-QcUtmBGHPJG5lk1JpQ1aTw-1; Sun, 03 May 2026 23:59:55 -0400
X-MC-Unique: QcUtmBGHPJG5lk1JpQ1aTw-1
X-Mimecast-MFC-AGG-ID: QcUtmBGHPJG5lk1JpQ1aTw_1777867195
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bd5c9e2e4aso61253057b3.2
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 20:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777867194; x=1778471994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aH3LgVMXf6Uuymix/+Ipek/Oiudb0lrDKNRk954dQLM=;
        b=mTTsuKnA/pfpxc1X5pXPHCBsp+7dfXAOgYA0Na6QdaPAlfAomwS90yNM6xoh0PNKq3
         35VV1ILT3a9ZYcECAvVulQodub4mAKttEcfqbn6qD8KsckfBoWOsRI25cHJqV++7QQM2
         u+Mz6nicSUpcK7r91CBzkENimMy02YCNmuTPPxNZAg+e+/j8jZLPFtjxY3ijM0wwjuSA
         PfWkzc5gZXPJmr8UN2CvUqX+9mDTTgq4m49Ix6WYEkw9ZKUMN/XfgV9VMdZntkGK882m
         3sF+aLlCuAWenkdqjTcIsEjdRAXe30Kk5k3eRlUOCTiurmcDxUZ6UYKjRNkPfaXYkPNs
         HK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777867194; x=1778471994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aH3LgVMXf6Uuymix/+Ipek/Oiudb0lrDKNRk954dQLM=;
        b=YG4kmQPju+N5myZrGSV1tE1tDtaUM+W4cAZJWuOaceg8DLa1rwe9VJ8TzOugX2tnKf
         gnDgvaBKOkqAcMlY7RXvcgzTud9oDrVFz3Cda36XKBWmk+huHz8nnHGkBsnWTU3Yc7CY
         BbeWG9Wn1JP0ScQT4XewEqs+lcpggOcwtX+90AJpw1DX3aBcuj5tn3JweTZVNpOnen+P
         rRkFyjtGi6IlghPHLvOTK4vpgpf+JGFnGWGTWN1n3d8kdb55AdZtURUEmLMkqPvqsqwU
         pLAcapjjh7kok3JJUmJG+N3bE20uWUJi5E9hnHjs+/WKzi1cKOjnP/a2aynarof2W4O/
         VIHg==
X-Forwarded-Encrypted: i=1; AFNElJ84p9xm+bCl2/oZF7Kt/ms37ELlsxBBxPuFqqv9vwT2+1TIArDpIIWA6tPRUULZSFr954At4+7NEhHhn8sfE8U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt7nhMrJPt6AJymnTGSQkcH9nPxFS7C2c1i3gtYt+c/24VizsK
	f3/GsPy8jJuG06OIoNqV1FI/gFeQGsmF3w7z25KF6YgpHOEHJ0AkwZ3I6W27rlmdveLZamRjw1j
	popykwOLK3PuE4pQHN5sp+6q7c14KLaEuPlQbNRN3/8orEd5tOXXk7IyDgq2Nht8nCz/BQQ==
X-Gm-Gg: AeBDiesp2T2Qr62g5BDWGu8jpHxzqJBm944/DypXzYPFjm7n5+mcFM7XVk7+cV2iz8T
	Li7RkBWbjHPGy5WrXV58GcRjdFmvOoZ5uO5WItroAx+gz0jo+qmtVYt0DaI2GkykiGHSsC5PJ0Z
	aCNnpVz7HBnIRh76FiiRN8YpZ6Q3B8ER7lc07R81D8AIfJms4RGL6Vf79mZeBdY7x7iWYmIuxPh
	f/YKez7NVEBYzooBFoDRpjopJ5QidxCabHY5EUu8WN3qz9xwGaj1qdi91Emo4pDGpwx++5WVDC1
	kZNdTTfnjExThAmToh0mWX9OpGuDnB4mHb+N/QLhzZ5GHDIXp/S6z/P6yStr5wAEeSqA0tVHCZ/
	/TufotbLAtbZfQPcv8ZI9uchlAh8QicOMsXkQdOQ9JS1YaNZzeUiUh3y4MJvJdXj2mE0=
X-Received: by 2002:a05:690c:6989:b0:7bd:7d69:7658 with SMTP id 00721157ae682-7bd7d697b07mr63166857b3.47.1777867194352;
        Sun, 03 May 2026 20:59:54 -0700 (PDT)
X-Received: by 2002:a05:690c:6989:b0:7bd:7d69:7658 with SMTP id 00721157ae682-7bd7d697b07mr63166547b3.47.1777867193900;
        Sun, 03 May 2026 20:59:53 -0700 (PDT)
Received: from [192.168.178.105] (78-0-206-107.adsl.net.t-com.hr. [78.0.206.107])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66888cc7sm43753377b3.44.2026.05.03.20.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 20:59:53 -0700 (PDT)
Message-ID: <78324cb0-fe12-4f45-85d8-557e2a7649cf@redhat.com>
Date: Sun, 3 May 2026 22:00:25 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/14] mm/khugepaged: remove READ_ONLY_THP_FOR_FS check
 in hugepage_enabled()
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
 <20260429152924.727124-5-ziy@nvidia.com>
Content-Language: en-US
From: Nico Pache <npache@redhat.com>
In-Reply-To: <20260429152924.727124-5-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/29/26 9:29 AM, Zi Yan wrote:
> Remove the READ_ONLY_THP_FOR_FS gate and khugepaged for file-backed
> pmd-sized hugepages are enabled by the global transparent hugepage control.
> khugepaged can still be enabled by per-size control for anon and shmem when
> the global control is off.
> 
> Add shmem_hpage_pmd_enabled() stub for !CONFIG_SHMEM to remove
> IS_ENABLED(SHMEM) in hugepage_enabled().
> 
> Clean up hugepage_enabled() by moving anon code to anon_hpage_enabled().

Thank you for cleaning that up!

Reviewed-by: Nico Pache <npache@redhat.com>

> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>   include/linux/shmem_fs.h |  2 +-
>   mm/khugepaged.c          | 26 ++++++++++++++++----------
>   2 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> index 93a0ba872ebe0..acb8dd961b45c 100644
> --- a/include/linux/shmem_fs.h
> +++ b/include/linux/shmem_fs.h
> @@ -127,7 +127,7 @@ int shmem_writeout(struct folio *folio, struct swap_iocb **plug,
>   void shmem_truncate_range(struct inode *inode, loff_t start, uoff_t end);
>   int shmem_unuse(unsigned int type);
>   
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && defined(CONFIG_SHMEM)
>   unsigned long shmem_allowable_huge_orders(struct inode *inode,
>   				struct vm_area_struct *vma, pgoff_t index,
>   				loff_t write_end, bool shmem_huge_force);
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 71209a72195ab..d6971ada8f199 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -524,26 +524,32 @@ static inline int collapse_test_exit_or_disable(struct mm_struct *mm)
>   		mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm);
>   }
>   
> +static inline bool anon_hpage_enabled(void)
> +{
> +	if (READ_ONCE(huge_anon_orders_always))
> +		return true;
> +	if (READ_ONCE(huge_anon_orders_madvise))
> +		return true;
> +	if (READ_ONCE(huge_anon_orders_inherit) &&
> +	    hugepage_global_enabled())
> +		return true;
> +	return false;
> +}
> +
>   static bool hugepage_enabled(void)
>   {
>   	/*
>   	 * We cover the anon, shmem and the file-backed case here; file-backed
> -	 * hugepages, when configured in, are determined by the global control.
> +	 * hugepages are determined by the global control.
>   	 * Anon hugepages are determined by its per-size mTHP control.
>   	 * Shmem pmd-sized hugepages are also determined by its pmd-size control,
>   	 * except when the global shmem_huge is set to SHMEM_HUGE_DENY.
>   	 */
> -	if (IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) &&
> -	    hugepage_global_enabled())
> -		return true;
> -	if (READ_ONCE(huge_anon_orders_always))
> +	if (hugepage_global_enabled())
>   		return true;
> -	if (READ_ONCE(huge_anon_orders_madvise))
> -		return true;
> -	if (READ_ONCE(huge_anon_orders_inherit) &&
> -	    hugepage_global_enabled())
> +	if (anon_hpage_enabled())
>   		return true;
> -	if (IS_ENABLED(CONFIG_SHMEM) && shmem_hpage_pmd_enabled())
> +	if (shmem_hpage_pmd_enabled())
>   		return true;
>   	return false;
>   }

