Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D101D5AD4
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 17:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777052525; cv=none; b=B39vOIugVJbGlvBjH0HntdwrL602PpPbtKpDpEK17VVmqzFOljNzhBLKsrisjQPxCeQSylXFSz27ns+fM1qKEHmtAUc/3bFSeDx3sblckgIEFxnn5nLdFCO8z0hZvuqwTt2X8bI5cfsYUa+WsfN6l9sF4GSU6fEREzCF0S+V9HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777052525; c=relaxed/simple;
	bh=JASir0Muwb1AUQDLeT9WM3gstCgrr0RrUCmqwRJy1fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ccLkDOvVDkG5gyE2VzFQW7l3MXQXJQwY13Df+kPn0jLqZwVGRWyFG+bZdZi5FSH+dYXjDOx7NLu5W0jCZ2/XeQUX/fbtkmnZkSbdicq+be6qcsrxggtqvTUDAa9aTsJw9sXTCEsob9Whve0XYuukIDYOpPxgUnBesRZNDewPEiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AbYkbuTB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AbYkbuTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777052523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NuWtjF+Wyc1hGTB7jedMSCQYvS6gqCcPJkY5z5BlujE=;
	b=AbYkbuTBVCpLhTXa/VJS12ozX7De6kXmf37pkB/0DLjXZpREwZEIsZeUn8n26XkLRGOMW7
	lOix7FE586hIYE/hdlhEb6bR9cw1fo2K550sFnnar0fCUWk1rSRYet1wDFCj92gjmUgy5w
	3GBJm+062HypkTatQfppuUXPmHdatiM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-T4KnVwi5NBOHBfRUN3m8kA-1; Fri, 24 Apr 2026 13:42:02 -0400
X-MC-Unique: T4KnVwi5NBOHBfRUN3m8kA-1
X-Mimecast-MFC-AGG-ID: T4KnVwi5NBOHBfRUN3m8kA_1777052521
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9a6a853bso97374371cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 10:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777052521; x=1777657321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuWtjF+Wyc1hGTB7jedMSCQYvS6gqCcPJkY5z5BlujE=;
        b=tBUsSmO6xYw20h9F5t7kiHSacmxvVSVgq7aw9SI1oLUvzkJLKtT2uSMLeC2SPeqPP8
         7nay8QQM8pZzpVr6UWFl2cS7lRvErakGVwejyU55lBkwid16IyM9YCjYc0A4P5ZG0w+h
         CUZjYiVaPA3kw/CatMg7lj/SDpianUwnlCOO5rQA7S6+oqccOtGicsEUFLtlAAfBdWuv
         dMbiA7R0QYg/KyeKO0yisWhXL+3KfFbb2pERPKD3glZozqLasHHytSWr5Q7IvMpgNdtG
         AdG+rb9/Zl2zjNDrVS2x71bJFRPJqWcKgh84pJOsMtB7h5t9te0Xom8O99It663u29Zc
         38Ew==
X-Forwarded-Encrypted: i=1; AFNElJ/XMUw8i69iFLbzXE+HMv6OZOUNGoPpajCJXTLPIhfHzALduzZRE043/o3+VciIV4lXZXjuyhOetbyadgtdryY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmOJL+Gr1pegSczDZ4WY0d8lRlpJLEqZRZjNMnEncGp+cekbTf
	XS2Yds91XRHRjGb4eKGzZJjKAQ72tE3Hf49Ac7GSX40N7vWPynaDSZRWG8nWCPAWocE+4Lg6ixm
	pZYLMwpNnEp0giIuT9J+yEroiC1SYaD0ElFKTKRzUT76w1MUhcMfDFw3K+YuV2qTSwBhpSQ==
X-Gm-Gg: AeBDievmuY8HwIFyc4I9vKa2KSM1jXVUqswVyV9Wr+117PcH8skOb4+1FSEN2NIzie3
	W6lbVYPDI3iz+EoGB3lJ7Sx+GcOExgs0M73Nag4K+gBjTPkGH6DDo/SUNR0m0Dqe2FGH69hI4tr
	LFGUGVKQqtXZD1ZDrxFLdd50o2W3ExHCCn6QUoijRyyHhj/ZsjoRbxvQ+kpQVFSSqmZXVWps0zY
	nBP7ZvLJrGDSBogai13Ah82k4h8Ey2I0XL60Ez90WT3DhvODnWYiL7Z93zzj5rnJJo2621l8DF0
	yuTihAsl0U+zYCApZCV7XUji3mnQm5qgEOHCGxJz2I9SnfX0cUURhFq/vMw3C+Sq0SOFtDWpqyZ
	nTAy/ksR8K1DVsd3OULVU0vxilRE9NtYnuoLV9fNSB1c9apWzYn/r1GGQdZIrx/c4hPbAFoevpU
	oX5JuuJ3CVN26cOL6x2OaDF5GVNA==
X-Received: by 2002:a05:622a:429b:b0:50b:4337:179a with SMTP id d75a77b69052e-50e36b86637mr456868531cf.3.1777052521459;
        Fri, 24 Apr 2026 10:42:01 -0700 (PDT)
X-Received: by 2002:a05:622a:429b:b0:50b:4337:179a with SMTP id d75a77b69052e-50e36b86637mr456868011cf.3.1777052520974;
        Fri, 24 Apr 2026 10:42:00 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-53-69-159-169-238.dsl.bell.ca. [69.159.169.238])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fafe9674csm151451681cf.3.2026.04.24.10.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 10:42:00 -0700 (PDT)
Message-ID: <6732af42-fe43-489f-8561-9e6e4870e15f@redhat.com>
Date: Fri, 24 Apr 2026 13:41:59 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/53] selftests/mm: rename hugepage-* tests to
 hugetlb-*
To: Mark Brown <broonie@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Donet Tom <donettom@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lance Yang <lance.yang@linux.dev>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sarthak Sharma
 <sarthak.sharma@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-7-rppt@kernel.org>
 <4d2fb0ec-91e4-4902-9d7f-68d782ee98c7@redhat.com>
 <30bb8071-06df-4953-b189-ab6a0520739d@sirena.org.uk>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <30bb8071-06df-4953-b189-ab6a0520739d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-24 13:36, Mark Brown wrote:
> On Fri, Apr 24, 2026 at 01:20:02PM -0400, Luiz Capitulino wrote:
>> On 2026-04-18 06:54, Mike Rapoport wrote:
> 
>>> --- a/tools/testing/selftests/mm/.gitignore
>>> +++ b/tools/testing/selftests/mm/.gitignore
>>> @@ -4,6 +4,10 @@ hugepage-mmap
>>>    hugepage-mremap
>>>    hugepage-shm
>>>    hugepage-vmemmap
> 
>> Shouldn't we remove these? Also, there's a reference to hugepage-mmap in
>> Documentation/admin-guide/mm/hugetlbpage.rst.
> 
> Linus complained at some point about removing things from .gitignore
> causing issues with old binaries left around in the working directory.

Oh, that makes sense. Thanks for the clarification.

