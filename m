Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B4B478E59
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 18:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777574651; cv=none; b=F+sVhDhtZYbByif5BrTscU3s+YVmwDd6n1gY/N7mpaO54PT7FXpojrWURpNXcFJyeEiaxugLziLRJu7kVTqMcbtMju5gfAdrQuDN6OJwfts3WxnPqtlDg32pH1CzE+AX2z4Qa2NMqJqDCk5Kvof+E4NRkJUs4TbDzEN27kK8Vag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777574651; c=relaxed/simple;
	bh=LJxIAlTLxHD6Nlh9zd5ihCqqMiLQnmbvdlUDMbklb+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=epHGR8oxXeH8KjGQJSZX7F8R1g8I6mY71WrpY5Z46CvWnNnAvRLgf8NW499NOpkmGN+yMFnS1jY7QmI3if7ppAl6BPOsYiUv9nb3hNmta/cnun8/Iz1AOJT5MdgdqDVZp5q2ATrYr5gs19Egs4FeAnEJ8rEBZPrWPIReywoyqmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K2hNzLzr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K2hNzLzr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777574646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l06I4xelml7EFeSQsTRAgMa6TIfSnLwPvqxz/YZ78Ik=;
	b=K2hNzLzrUpXAXe3ZmHcd7onJbrWycFvGmz6f5MRSGM/m0ru1DQc8gH8bU+LkczfAcBwnft
	OYrbRTY5JSZ5CJSClWojeq1l+8piukBuuWiyJddSWscwvxq/VDmbaHAlQguEM1cHVsuJ19
	QfHB3/O8N5l2JEbbnfWbyciktSA9cKY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-U5H0Da-nOde9jdIc8GXbug-1; Thu, 30 Apr 2026 14:44:04 -0400
X-MC-Unique: U5H0Da-nOde9jdIc8GXbug-1
X-Mimecast-MFC-AGG-ID: U5H0Da-nOde9jdIc8GXbug_1777574644
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a5f6110cadso33061656d6.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 11:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777574644; x=1778179444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l06I4xelml7EFeSQsTRAgMa6TIfSnLwPvqxz/YZ78Ik=;
        b=HWFrkgu0IMkvLCAmmU3UkgzumlGr+UT4u0vlV7xB4Dn0RmhGL5HbiNN6+z1eT9MM1W
         sBdWknAXeE3Xeeh/jKLfxveGjoX9Gh+kogMU1sRyxrkeuBXyMCUCSwHxHMLvDsWexNRu
         ex850COXuN8RFkRrOkE83rhK/KhIBdqgDTTki69jU9UtX9U8QfF/kA5tfclxRfDnrcHN
         31GeV2PSI6NSbA+Vi+seuqLoKHyWfwlFYWmrMmchaam9GloDx2/S2ov7N5It1gQguWCp
         0J47wPJ8xZzmAxy+GQSAJDjw0Kz+AWguqMfIIFKPRGZurjJIOso4oTmI+uC24aIjR0sV
         3R8g==
X-Forwarded-Encrypted: i=1; AFNElJ851tz3Y09RfA5g/vW1KhKQYBDJym54hhgjJOv6UjM4fSRUkxk8kCFZosISIENMTW6RannqQWBogDABtcAK7Y0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGt0nuiphDO7GsPYvvKMHXrfN8+UTxiFeUqt9xs8sNNdvp4qWR
	bPo/iPzEUUKBSg14dJY+j75zTAO0rGzHf9XK3e5AeX10kWy+SdNggtTKlGVnrpSurJweoXuMF32
	2y+GsWqYRR+PX6BkhNtoiEKVp9ubWv0ZI0jpILOaI1BXFqW2EPQJvQtweC0Vl+/FAUlxB6w==
X-Gm-Gg: AeBDievO0yEdYVu17GD3oc3xJn9u6h/eKSJT61p26C8zO0n03R3h6QJETx/LMspEB1H
	2ilt/71tSGVGr8gJHCchZTGobp0fiYN5bDTN+DBzy7DyclVb16ZW1MRGMUdfLtzJz7BxL9JbsYM
	l2AQ2ZGqQ6c6nUAUfHy5jVZtHDAJjKEhNnikvE9EI6FfZyvAgkwmZkBAV/fbCcrjIkD+qnVmIYg
	bf5MUUIK/k8ooSEiG2DvmNbnYP243N7SS9Y2VKtO745T++hYxn2R8x9L0GIBFEUOStZO8W6mNAG
	DQZb4nKMHuftPyZlLTtrKBJ0jcUPRfdu9UKvja8h8QSW9UiQjf7x6tqOH9pkqvjfRgTO/srfnSs
	cOSE9Nl/4n6/jyiLo9SEJ6r6dnbKhMZp04PzYXmv8aIz7ocmbXS1+/wFd4Okk7mdy5T2zP/qopq
	+e+OdUNAbFbqDJkwLBpN3ywpY=
X-Received: by 2002:a05:620a:c45:b0:8c9:f8e5:9f12 with SMTP id af79cd13be357-8fab223a83emr548578085a.57.1777574643948;
        Thu, 30 Apr 2026 11:44:03 -0700 (PDT)
X-Received: by 2002:a05:620a:c45:b0:8c9:f8e5:9f12 with SMTP id af79cd13be357-8fab223a83emr548567185a.57.1777574643249;
        Thu, 30 Apr 2026 11:44:03 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-22-70-53-202-134.dsl.bell.ca. [70.53.202.134])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fbb09fc9e7sm44487985a.1.2026.04.30.11.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 11:44:02 -0700 (PDT)
Message-ID: <e555a8d2-b319-43eb-a4ae-7c9b3ed995e0@redhat.com>
Date: Thu, 30 Apr 2026 14:44:01 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 51/54] selftests/mm: va_high_addr_switch: add setup of
 HugeTLB pages
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sarthak Sharma
 <sarthak.sharma@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-52-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260428204240.1924129-52-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-28 16:42, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> va_high_addr_switch skips HugeTLB tests if there are no free huge pages
> prepared by a wrapper script.
> 
> Add setup of HugeTLB pages to the test and make sure that the original
> settings are restored on the test exit.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>

> ---
>   tools/testing/selftests/mm/va_high_addr_switch.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/va_high_addr_switch.c b/tools/testing/selftests/mm/va_high_addr_switch.c
> index 0b69bd4b901d..e24d7ba00b44 100644
> --- a/tools/testing/selftests/mm/va_high_addr_switch.c
> +++ b/tools/testing/selftests/mm/va_high_addr_switch.c
> @@ -325,7 +325,7 @@ int main(int argc, char **argv)
>   	if (!supported_arch())
>   		ksft_exit_skip("Architecture not supported\n");
>   
> -	if (argc == 2 && !strcmp(argv[1], "--run-hugetlb"))
> +	if (hugetlb_setup_default(6))
>   		run_hugetlb = true;
>   
>   	testcases_init();

