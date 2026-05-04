Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B232A72627
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 04:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777867324; cv=none; b=cgclxTWjbvs1V/prLbohWQhZXDLhXKWhYC8N2ny1WUSHWwEmj1NQEBhXi+vRofMStKnqyeS9GBNIOCD19XIR1sghcbIQ58FNdtMq56P8O8Ur3CJ4OUUGQkPeY/6hQw2pfZGN2TCAovLXyc/0+2+7yXAh7pL0wnS3Oglde/tQe3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777867324; c=relaxed/simple;
	bh=3P9PTGXQEqceejzlt4oB6hCgg6/9NoHPJVWEt1XjDfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iuMcRBzq2WKr8K031oJgkTfSSO1nQCsXoFuHH32aS+Huzadj/LiDqxhwojXNIJH05thRObLqhcDJbe69kNu53zysW/Ut4kCsOx19GlBqhgJblfZzP9MwMmqHOjdscAD/KqT0MmDVg/oxh7kx8geVhczVxhoE/zuD85N/X39kGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FA2GdEA7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ahR74mpf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FA2GdEA7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ahR74mpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777867320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m+5Um6TFBnBOiuOAmXBNCCA71a07CLbH3rgRCp2jTGs=;
	b=FA2GdEA7AU/UDp2rn9uFbP+1jdZL+jIkHxnneE4Ae/dhkbGW2E2utdJTGuJMihjCQD7ahv
	3mr2Vw2erEkskoAWTTsZo5Cn/69S1zQ2v23cBsuRIdtAbQ/dWONr3hYFOZ+0HpbrOKk3L7
	eQHBm87lIUZ+bTxAp8tsWVi9OdDs7W8=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-pF_OT3b7NLyCbFjV_2WLrA-1; Mon, 04 May 2026 00:01:59 -0400
X-MC-Unique: pF_OT3b7NLyCbFjV_2WLrA-1
X-Mimecast-MFC-AGG-ID: pF_OT3b7NLyCbFjV_2WLrA_1777867319
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7bd5c42192aso16176287b3.0
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 21:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777867319; x=1778472119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m+5Um6TFBnBOiuOAmXBNCCA71a07CLbH3rgRCp2jTGs=;
        b=ahR74mpfjikES/sgx6xLa/BlnQXifJ4h6HXe6qLXrKtEC+bL/gABxFJjjNfMC+/5/+
         nLzFjIYylBjQS6n19zZio8rwBbMNlVLjdJCyUuOPC4QnmMrzjdclBu7n1gQoAspU1ceb
         tTrQOPRRr5ZBbRvkiy1c4gyyh7HMuhVAfJf0cW2ewvvT5HWPyI2ucfpBcTGTJW4YoYrK
         Ciqn3wQbO6iQaR3BbY74WB2sf/sIWETkuMl5SDK/HhynLdPK4WMSldCyOr6+DnDEiSc1
         mOAI6eEsXjYjx5x+CEPn1RhuLqLNo52XiK2DxOB3sebtOzUgUWZeEpLkszuiyy+lDtF2
         lDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777867319; x=1778472119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+5Um6TFBnBOiuOAmXBNCCA71a07CLbH3rgRCp2jTGs=;
        b=d8LRrtcwSqWAUtORHaki6IC9hmlP6Z5PB85lg6YWwQ2hpY7P7WrWuCm19cJKpmHK14
         M/8yIMO+o6m4KdcvC20G6hq2T/Z3oQilEGEr3QDDNJTsEgeNAteP0aTMxnYi60P4x3vr
         lTxvy6Kj0NguewJc2gOuPuslaRfALABY2E5hBKObuuYbwZnk+lox6ov9YFzmDOjWbkWl
         c0KDBkbahtF+LC2+9B5ZoPNXOQ0OcMmBcKtX5LbrHVCkXBkmwCc2Skg68D0Ugyz/tTIl
         VQ2Suem/RQjbwkkN29Ca6vHTXucQdsUXnPdogafWUpmDS43Y2S3/pG31RRiOucLNXWaw
         yMwA==
X-Forwarded-Encrypted: i=1; AFNElJ+erzmG5WZnJMj+1+pawktvWXZkua1bAH6I8Gus8JO9WpkdPhOenSrVrn64nMrMVor28eTGfUv4UbMsOxojcqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjqGkVMffihQA3bVwG+67obn1itou5NVwSO0lAdOozW6FI51Bq
	Il8Ph4XdfgEOHbHZvxRzJul91srOBLbl3VDgkTvYhuBaKxMpEYLaUEsAL7NBQxPIH/ZCKFHdwD/
	M3c+oRDhkAvNhPKCT3aJEfhLbGmoOi2P5gNabpkTvNt8b+zrUJnyo7ztlAAipYkw5xXyaqw==
X-Gm-Gg: AeBDiesP5dEc+aFzvj3Q5GREFPrVqRuEg2floFE4Tujy/SzKxkniGI1veZrLyG5zWD4
	i5zn6z/phfIqz3eEq5vpcYSSS++Ftt+i14umDnGsj49M7YRSmJ49YJwjCAqXHK+kFih+ZZmaM0m
	SlQsCVGHqsj7QXGTHbzOR1dEKtt7R9LT9Y9wE+NEda1njLsGLItOoRWGDoEkhxh9xRIyJOL59Jj
	BJqcZn7fgD240F4dGu5Ldswkv9B+aq+syDzy4LgQNmg5JY3SqU6Ab2VPTHp0N3wGvuu2TN3BsBM
	XNSWsxKoLzr4Uh1AJqPf3+6zXdgnjnlCLveM+/U9wzG7Kkq3q5nU3tUPXCcYv9rYJC/Co2j2rH9
	uSYGGLSq3fTiqopixQoaqmbxYFPcfITURRCb154Y9fRE3BuNDbvU7hrLWAEc4DGMh6Tw=
X-Received: by 2002:a05:690c:289:b0:79a:b440:5c8d with SMTP id 00721157ae682-7bd76928ceamr64734337b3.11.1777867318933;
        Sun, 03 May 2026 21:01:58 -0700 (PDT)
X-Received: by 2002:a05:690c:289:b0:79a:b440:5c8d with SMTP id 00721157ae682-7bd76928ceamr64734087b3.11.1777867318535;
        Sun, 03 May 2026 21:01:58 -0700 (PDT)
Received: from [192.168.178.105] (78-0-206-107.adsl.net.t-com.hr. [78.0.206.107])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6654e464sm44456777b3.14.2026.05.03.21.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 21:01:58 -0700 (PDT)
Message-ID: <0c385b67-035a-4f66-8f3a-febd68a9318b@redhat.com>
Date: Sun, 3 May 2026 22:02:30 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/14] mm: remove READ_ONLY_THP_FOR_FS Kconfig option
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
 <20260429153538.727855-1-ziy@nvidia.com>
Content-Language: en-US
From: Nico Pache <npache@redhat.com>
In-Reply-To: <20260429153538.727855-1-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/29/26 9:35 AM, Zi Yan wrote:
> After removing READ_ONLY_THP_FOR_FS check in file_thp_enabled(),
> khugepaged and MADV_COLLAPSE can run on FSes with PMD THP pagecache
> support even without READ_ONLY_THP_FOR_FS enabled. Remove the Kconfig first
> so that no one can use READ_ONLY_THP_FOR_FS as upcoming commits remove
> mapping->nr_thps, which its safe guard mechanism relies on.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   mm/Kconfig | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index e221fa1dc54d0..27dc5b0139ba6 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -936,17 +936,6 @@ config THP_SWAP
>   
>   	  For selection by architectures with reasonable THP sizes.
>   
> -config READ_ONLY_THP_FOR_FS

Yay its gone! Thanks for working on this :)

Reviewed-by: Nico Pache <npache@redhat.com>

> -	bool "Read-only THP for filesystems (EXPERIMENTAL)"
> -	depends on TRANSPARENT_HUGEPAGE
> -
> -	help
> -	  Allow khugepaged to put read-only file-backed pages in THP.
> -
> -	  This is marked experimental because it is a new feature. Write
> -	  support of file THPs will be developed in the next few release
> -	  cycles.
> -
>   config NO_PAGE_MAPCOUNT
>   	bool "No per-page mapcount (EXPERIMENTAL)"
>   	help

