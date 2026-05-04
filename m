Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E053D523C
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899906; cv=none; b=Odz/85soZq3Exm7kx0TaTU/zcK3d8QvcHHvGvGGL/qcFqYK3aqcdfCUZhxO3z7fJqv57acwai8yP3aYCtFZaX2tjF0JvJdzplcpWT6x0DcbFtwjXbu1PAvidwFVSk6MAjfW9J9WOSDGFKAVkb/hZQ2KZ1nCCsi5HTvI+GTS+BK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899906; c=relaxed/simple;
	bh=8/qYV9GNS+6nij6A5YaKpMRHxcuDhEeiDUgJC3C0OvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4GhVfjivf6pmGbKOx0yIhyBSb5/fwls+rA/sle+7pBXJS142UtDuxbqggP9YZ31q7iv2oZYMMv+ectvS+ir549Vr53dj5hXYSOW91lwrn8cf2KrhrRI9OCOwgr1uoyerQlEQL//UZfMpbpsSOhrPprLo+xFLoWBOw/DkoeKS3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uk4MfaOc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uk4MfaOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777899904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lCpIucwug7LQBxR+zBCSrNGWbfwlTlZlRpoANQyu5ws=;
	b=Uk4MfaOc6YGOaHUHKnl3JLlKxZIElpEQRjv+wt84fkbcc2KXJDJqFxI/NscXiG8IX3weyj
	yVWHg6VaGoTwgEiNDLnCU94kYcz+TL7KR5D6ZIza3YDirzPi831KmTfAH4Ipi6R8eCVpba
	NuZUHNUtH2kIeJSL6MORsLB8ub0+2SA=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-bzqcn5adNn-GCE1uF0z9gw-1; Mon, 04 May 2026 09:05:03 -0400
X-MC-Unique: bzqcn5adNn-GCE1uF0z9gw-1
X-Mimecast-MFC-AGG-ID: bzqcn5adNn-GCE1uF0z9gw_1777899903
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-415e1e9aa5dso6244914fac.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 06:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899902; x=1778504702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCpIucwug7LQBxR+zBCSrNGWbfwlTlZlRpoANQyu5ws=;
        b=OMdXUdkQLbE0qruI0/Gpll+jucd0eJEZ3+KHgObhLnhuLpo7oQnIBDY9Nwh5+pcrwG
         4MXXVbpgxWDapAX7GESZHqXn9Yj921Sc2Xd/cw9eDzG/hVwr7y4JP1yFtO3izOCACSlR
         P6qIG36sm7fhSTFGzOXO6ltlHH0vsPQEnqESccEhynIKibbJJwEVrZi9N2z414IRCgLN
         FZXESFnEusQZ67IwJ8fvm0oPho3HUemuwkVd4IER+4R0lRNCa5lCroA1x2R12JuoCOrh
         5kXb+1HjZ+F8+WeHZfzVseY5IEMlUUCcM0bwJ1s7nVD1LBhvlP/dVtMmqniWJ6aTnk7U
         /1hA==
X-Forwarded-Encrypted: i=1; AFNElJ9sfgYLvKBY/V3tcB2cCpc0MTSrK2FYel+okxH97scCDZxMKbtGCdDBBh1+I7+ybhdLwpo3LNRK9uFEi9c1SR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmnLnGb90uhJxdTfm3oaso+bP9hCXus3SzhMmeX8OSMlQ1R8GO
	CXxJioMJbB/sFgSSwuV9r6ylQ14xmA52syrQUJlH5d1RecQPC+fbk950WDKu7lt9yPe/JgxyuTi
	A+j2pqF1eWXTIGs7U9+VHJGeNmfqHcYILp8pYDMdTTERd/idhy6c9nnDhLBgUIhs/QkP3qg==
X-Gm-Gg: AeBDievrCRdFijm67D4KCpyPgctFCyMFXbAMCjm0V0UObZgPGa9iGfq+bT5k5h4yKk7
	uUcxYKIitLlrkAEEXvfoxTJN0Sh1GQwguNX9ehLFwqGchoakaG3cikMBRNhDKioqUeYBfTfIbsD
	dCl4iRIwzxa8ZuqxOdTnJ3OcpIOkFiEBPHFnylenlFtznQpYgM/7FHUMVnS9bJZbqbx8gKsrG0o
	J/2SA1w8L3+ev9G87HcCRJONfDb+rGZ1BXd+ge9x8ELFEnz0PqnE/wrIdO5J1Bri0PEwFYK/iuo
	+iqYHNZTklA7dDLnmHXhbxgWvOK/UcniflrLD9vPbt7yRn0WJ2WSo/WzcgEQtNnio4dp0mIUCL4
	9yqc/7aQDxa1ewRW1zbzwatExb8bZr1p56+A=
X-Received: by 2002:a05:6870:1687:b0:42c:259c:6c8a with SMTP id 586e51a60fabf-43475f95c61mr4835378fac.6.1777899901347;
        Mon, 04 May 2026 06:05:01 -0700 (PDT)
X-Received: by 2002:a05:6870:1687:b0:42c:259c:6c8a with SMTP id 586e51a60fabf-43475f95c61mr4835140fac.6.1777899899273;
        Mon, 04 May 2026 06:04:59 -0700 (PDT)
Received: from [192.168.2.110] ([70.53.202.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b5e8b4sm106472551cf.23.2026.05.04.06.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:04:58 -0700 (PDT)
Message-ID: <a393e215-ea5e-4b84-9066-4afef36489a6@redhat.com>
Date: Mon, 4 May 2026 09:04:47 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/54] selftests/mm: hugepage_settings: add APIs for
 HugeTLB setup and teardown
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Donet Tom <donettom@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lance Yang <lance.yang@linux.dev>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
 Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Sarthak Sharma <sarthak.sharma@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-28-rppt@kernel.org>
 <2f443474-4448-462e-bc1e-55bc657d70ba@redhat.com>
 <afTF9RCy8eBoWYaj@kernel.org>
 <22b1cadc-4b0d-4e2a-987c-e7a7bc2265eb@redhat.com>
 <afV_WAK56lQKn_z1@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <afV_WAK56lQKn_z1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-05-02 00:36, Mike Rapoport wrote:
> On Fri, May 01, 2026 at 03:30:18PM -0400, Luiz Capitulino wrote:
>> On 2026-05-01 11:25, Mike Rapoport wrote:
>>>>>     	return mode == 1 || mode == 3;
>>>>>     }
>>>>> +#define HUGETLB_MAX_NR_PAGESIZES 10
>>>>> +struct hugetlb_settings {
>>>>> +	unsigned long free_hugepages[HUGETLB_MAX_NR_PAGESIZES];
>>>>
>>>> It looks like we don't actually use this in the API or maybe I'm missing
>>>> something?
>>>
>>> Yes, it's used only in later patches.
>>
>> I don't see it, the patch below builds fine (again, sorry in advance if
>> I'm missing something obvious):
> 
> You are right, I misunderstood you comment and I thought you referred to
> entire API being unused in this patch.
> 
> free_hugepages is not used and it should not be a part of the saved state.

Thanks, I'll try to be more specific next time.

>   
>> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
>> index 097ba085f423..a023cfeb69c5 100644
>> --- a/tools/testing/selftests/mm/hugepage_settings.c
>> +++ b/tools/testing/selftests/mm/hugepage_settings.c
>> @@ -341,7 +341,6 @@ bool thp_is_enabled(void)
>>   #define HUGETLB_MAX_NR_PAGESIZES 10
>>   struct hugetlb_settings {
>> -	unsigned long free_hugepages[HUGETLB_MAX_NR_PAGESIZES];
>>   	unsigned long nr_hugepages[HUGETLB_MAX_NR_PAGESIZES];
>>   	unsigned long sizes[HUGETLB_MAX_NR_PAGESIZES];
>>   	unsigned long default_size;
>> @@ -509,7 +508,6 @@ static void __hugetlb_save_settings(void)
>>   		if (!sz)
>>   			continue;
>> -		settings->free_hugepages[i] = hugetlb_free_pages(sz);
>>   		settings->nr_hugepages[i] = hugetlb_nr_pages(sz);
>>   	}
>>
>>> I felt it would be too churny to add users in this patch.
>>>> Otherwise, the API looks great to me. But if you allow me to bikeshed :)
>>>>
>>>> I think I'd do:
>>>>
>>>> struct hugetlb_state {
>>>> 	unsigned long nr_hugepages;
>>>> 	unsigned long size;
>>>> };
>>>>
>>>> struct hugetlb_settings {
>>>> 	struct hugetlb_state hstate[HUGETLB_MAX_PAGESIZES];
>>>> 	unsigned long default_size;
>>>> 	int nr_sizes;
>>>> };
>>>
>>> It might be slightly nicer abstraction but ...
>>>>> +static void __hugetlb_save_settings(void)
>>>>> +{
>>>>> +	struct hugetlb_settings *settings = &hugetlb_saved_settings;
>>>>> +	int nr_sizes;
>>>>> +
>>>>> +	settings->default_size = default_huge_page_size();
>>>>> +	if (!settings->default_size)
>>>>> +		return;
>>>>> +
>>>>> +	nr_sizes = detect_hugetlb_page_sizes(settings->sizes,
>>>>> +					     HUGETLB_MAX_NR_PAGESIZES);
>>>
>>> ... this immediately becomes more complex.
>>>
>>>>> +	if (!nr_sizes) {
>>>>> +		settings->default_size = 0;
>>>>> +		return;
>>>>> +	}
>>>>> +
>>>>> +	for (int i = 0; i < nr_sizes; i++) {
>>>>> +		unsigned long sz = settings->sizes[i];
>>>>> +
>>>>> +		if (!sz)
>>>>> +			continue;
>>>>> +
>>>>> +		settings->free_hugepages[i] = hugetlb_free_pages(sz);
>>>>> +		settings->nr_hugepages[i] = hugetlb_nr_pages(sz);
>>>
>>> And this as well.
>>
>> We'd need a little more code to handle those cases, may or may not be
>> worth it. But enough bikesheding from my side :) the series is great as
>> is.
>>
>>
> 

