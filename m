Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C22222599
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 03:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777866810; cv=none; b=JcrtrbhuTPJKsDXIW4PRxu2xKPCVYRV9iaSFtI9khFed6NLBABYE1IyESiyqCM7CIs35fpE6Va8zlcnlTemL/6opxfUbdwdfwjFqABwykAz9loAbn3MMtzUN75W8TVpQ/ACFLp5bsuKSrCBkNei2rhVXHoWjidvm+wXIM471l2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777866810; c=relaxed/simple;
	bh=R0AUDzSWQxPWg+a126fEPwXl/Ajgx4AVi7lR7GVW0QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpsCV3ky70BfeqrvkW0cPTVwTtaOMuuIdJPiAUI3gFRb/CGrbWEKF6M6jkEHstXJLWg68YVH7m9I2K0Kifcbozd349YrCKQYlXgA8vSzM/vW6+nI73tkWP7wycFdy4Um7bX889/eI5kPgZxtX0UABy+rOm0lhADWTQKtTLK/9Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DggAExdJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Iw+mjYYN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DggAExdJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Iw+mjYYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777866808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nuwaC1QCoVaWPCWlh6YJVeUyAviJpTjgkGZ69+fjPic=;
	b=DggAExdJ9t/QzWWM4gwTcQqK9557AFouNO/DfqYftcycfZ4Dp6gVThzaghN1hK+YAVPRD0
	unu/NQAO80gPQi9wTUBhzaH9nuhL5Tx/dQ5jMk/EqfR2n47uZEvyagTJPo+vCxzO8tmX+J
	pAo1YZBQ714pb1pXxTg5S+H6Ah5fJek=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-y_ZWAvdLPViXC5XTLeIE2g-1; Sun, 03 May 2026 23:53:27 -0400
X-MC-Unique: y_ZWAvdLPViXC5XTLeIE2g-1
X-Mimecast-MFC-AGG-ID: y_ZWAvdLPViXC5XTLeIE2g_1777866807
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-651b8f743aaso6562830d50.3
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 20:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777866807; x=1778471607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nuwaC1QCoVaWPCWlh6YJVeUyAviJpTjgkGZ69+fjPic=;
        b=Iw+mjYYN5BC8xxMjjX1BgJXn2asgCReostFQ1D9G9cwoCWp4a8fu6FdWM6t3MqsVAk
         +koDhi6A+0OdY+mHv0rP/K9zf84JLJL0qv1w/1Kk/AqqMDA6vB1TZF1kyYNbFZeXBk+F
         97AeuEaUHJdX9qJIpmMTKUPa0evbDIdWZLL9JKEPO2eMhBqok92LLsl7Xc408aGKkNSp
         CV/Hzm0NV/WgJOBU25+0yvnvjIPbn9fA4kh4pnHj7b4pC+4cKvkRoLxWA57IoLSv2gYl
         ipjcdRzvZpLtg8uW01GPEiai86ntrnGyEECZbCKEpDSuNKX+FFdSbosXRptWaUrtNQTO
         GU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777866807; x=1778471607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuwaC1QCoVaWPCWlh6YJVeUyAviJpTjgkGZ69+fjPic=;
        b=D1bNJM5V++vnohTRguIjxkUYktj6ROrPG9VNL2Yim5cgiJDPKLPdS/QKMjNLQzu38n
         LNdhSngZEBGirApDQaEOeA3Fe7XGVEMECijG+iH58LY8Bc/KgOXWJriC4ooYV8Qjmem6
         jcpT8unynJES2XhhHTi3J/o+MOzPXSFcOdf+Nz0ONSv8PyB8rNUUtam7cElBhhQVU+Q9
         uRq+yEq6OlDxCpcOJ2uiYoIecWOVsvW+oYyLr/hHSkK9aN2TT3RH8VVq8V2DirfaMbuj
         Z2TSEGoq4qqU2DkH3jukkKzhRbX/uiYXpo2Sguk5fTXHXbLYl1Yh3T1LxjQkENAul61e
         ZLNw==
X-Forwarded-Encrypted: i=1; AFNElJ+wxz8Y8+VfscMF4c8CBNhMIvAHGVRfhSa9/RJ65qqyB3IJGnaNa2/yvXbql9jN6uMyPCun2WqUMhXzlpAroxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHBpnGMIuHA/FHg5my1AGdo+1BztFmGVkxjLAfTzUk0A1cfQX0
	g1Ce7ej+v2LO8pfO1t8O2MxuWXnU5g+pv0WO1cFA8Y4yh+THlVPXyAspgAW80tbKJHvjh7TAAW4
	gGSMnwtb97uAJBV2Vkw4brOQlOaH27BTZvdowEdbrfLDQtFKveVNECTpXwuvSAUuen3w2ug==
X-Gm-Gg: AeBDiespbluNIF3KWPuvkVXSKfBMkMExh1JeJlh9/LHfsEHP44zZ5r5xEGtGlyZxge2
	j5zCxBOmDpb8/w2715O4JtFY6u3GXzD7c5nq2hp0MUuYH9KJ44krkA6fOQVOl45b9TFSsC/7ayB
	0BLvseAjf5ksup3b6KK/n2XLSH1DO2JfVXG1eYxc8jl7Q0wZb8S2FYOYozeJPwnRklnymcg4fGn
	ojd1vHxx36G+Hpb44SD86hZzwAoUKa5uukFU8cnUVtSpbzpZePtuFyYVmn1SERR3+zv+dHRhJyF
	ZWxuVqjxTB552M3puQ12dShBIVK+uAJWuwf72ZLk/d8MBmoVD1LDv5ad6dIr4W9PZK2wh4w6cuK
	kagfnQGqnCamfTtM+nlXjP843e8yf5UhWwYp0uXTZ5XwH8pnEBbjBaUyVx09zlXi+mOs=
X-Received: by 2002:a05:690e:13cb:b0:651:be50:af09 with SMTP id 956f58d0204a3-65c3d96ca98mr7541965d50.3.1777866806616;
        Sun, 03 May 2026 20:53:26 -0700 (PDT)
X-Received: by 2002:a05:690e:13cb:b0:651:be50:af09 with SMTP id 956f58d0204a3-65c3d96ca98mr7541955d50.3.1777866806149;
        Sun, 03 May 2026 20:53:26 -0700 (PDT)
Received: from [192.168.178.105] (78-0-206-107.adsl.net.t-com.hr. [78.0.206.107])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65c2e8b2e55sm4980740d50.20.2026.05.03.20.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 20:53:25 -0700 (PDT)
Message-ID: <b3b5cfc6-e61f-4904-ad2a-dc1f53f04838@redhat.com>
Date: Sun, 3 May 2026 21:53:57 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] mm/khugepaged: add folio dirty check after
 try_to_unmap()
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
 <20260429152924.727124-3-ziy@nvidia.com>
Content-Language: en-US
From: Nico Pache <npache@redhat.com>
In-Reply-To: <20260429152924.727124-3-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/29/26 9:29 AM, Zi Yan wrote:
> This check ensures the correctness of read-only PMD folio collapse
> after it is enabled for all FSes supporting PMD pagecache folios and
> replaces READ_ONLY_THP_FOR_FS.
> 
> READ_ONLY_THP_FOR_FS only supports read-only fd and uses mapping->nr_thps
> and inode->i_writecount to prevent any write to read-only to-be-collapsed
> folios. In upcoming commits, READ_ONLY_THP_FOR_FS will be removed and the
> aforementioned mechanism will go away too. To ensure khugepaged functions
> as expected after the changes, skip if any folio is dirty after
> try_to_unmap(), since a dirty folio at that point means this read-only
> folio can get writes between try_to_unmap() and try_to_unmap_flush() via
> cached TLB entries and khugepaged does not support writable pagecache folio
> collapse yet.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM

Reviewed-by: Nico Pache <npache@redhat.com>

> ---
>   mm/khugepaged.c | 28 ++++++++++++++++++++++++----
>   1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 6808f2b48d864..71209a72195ab 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2327,8 +2327,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>   				}
>   			} else if (folio_test_dirty(folio)) {
>   				/*
> -				 * khugepaged only works on read-only fd,
> -				 * so this page is dirty because it hasn't
> +				 * This page is dirty because it hasn't
>   				 * been flushed since first write. There
>   				 * won't be new dirty pages.
>   				 *
> @@ -2386,8 +2385,8 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>   		if (!is_shmem && (folio_test_dirty(folio) ||
>   				  folio_test_writeback(folio))) {
>   			/*
> -			 * khugepaged only works on read-only fd, so this
> -			 * folio is dirty because it hasn't been flushed
> +			 * khugepaged only works on clean file-backed folios,
> +			 * so this folio is dirty because it hasn't been flushed
>   			 * since first write.
>   			 */
>   			result = SCAN_PAGE_DIRTY_OR_WRITEBACK;
> @@ -2431,6 +2430,27 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>   			goto out_unlock;
>   		}
>   
> +		/*
> +		 * At this point, the folio is locked and unmapped. If the PTE
> +		 * was dirty, try_to_unmap() has transferred the dirty bit to
> +		 * the folio and we must not collapse it into a clean
> +		 * file-backed folio.
> +		 *
> +		 * If the folio is clean here, no one can write it until we
> +		 * drop the folio lock. A write through a stale TLB entry came
> +		 * from a clean PTE and must fault because the PTE has been
> +		 * cleared; the fault path has to take the folio lock before
> +		 * installing a writable mapping. Buffered write paths also
> +		 * have to take the folio lock before modifying file contents
> +		 * without a mapping, typically via write_begin_get_folio().
> +		 */
> +		if (!is_shmem && folio_test_dirty(folio)) {
> +			result = SCAN_PAGE_DIRTY_OR_WRITEBACK;
> +			xas_unlock_irq(&xas);
> +			folio_putback_lru(folio);
> +			goto out_unlock;
> +		}
> +
>   		/*
>   		 * Accumulate the folios that are being collapsed.
>   		 */

