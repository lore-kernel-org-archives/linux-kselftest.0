Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85623ECBE7
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 17:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777310355; cv=none; b=Z16g3bkRTJTK993uwaLeAHET4f+wSPn1SJ1HlguH8iXzsXv0aH2pWi4KDFhGAn9XjzE+rd7dHV4MUKZvqBH+yOr0SoxAKWiusz67y8aYHkiHulqTscO++RBF1FE0J0hOKvGQr5mJyMP85X3Cg32+kRcOwyiujWzp8kz0tZLrmzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777310355; c=relaxed/simple;
	bh=In2l17YmJ6Ep0rNa5XbUBPBdP7sHw1ZcXq7yKBqwD98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmI3sEglxGmfKM1pWxbnodRJpa9ZrIDVR2vaRtrMiYR80RChEUIJHIRo6IFarMtg2mLeBwAm5wUyqA96lwDi6HjLvw9MMTFg7tFVoQ8UQEw6of1q7/1jMKlM/ns+RBTMwLiPRFBm9pOzT5Jb8gkNfgQKvxsDPAq2lXfK6IDBIwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O+t1K31G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O+t1K31G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777310352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SkL75I88AklWMnxS4Gn8bySfx4E22i3sGhBT824tKPk=;
	b=O+t1K31Gq18dPfFXnt5v6R5Nhh/eFbZcpwj7amMeCK/Bv1DF/6HwZT9O7/rVET7GgVBHxe
	JfzQPHDd28tl8SiSbiHMpVh31NnIR97fPcCIMV951SuaEeyVFcIq3CX5DnK4cpV9NupEj+
	TWAx5kBh+JDPHnxoWoh6zGlOOe2edYM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-br0fJiFsMkqTjLTS2-W2xA-1; Mon, 27 Apr 2026 13:19:11 -0400
X-MC-Unique: br0fJiFsMkqTjLTS2-W2xA-1
X-Mimecast-MFC-AGG-ID: br0fJiFsMkqTjLTS2-W2xA_1777310350
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f13da9684so100480761cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 10:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777310350; x=1777915150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkL75I88AklWMnxS4Gn8bySfx4E22i3sGhBT824tKPk=;
        b=krHgfaDu/nGauBUSAcrQ9d/daUOq7NmzNbmUvuzrJzohiThappZk9yn5UrlX5gsAqz
         gLoerj0S3B8/0JIW4S2tZXJ4BI4Ih6nSs2WkbF0OGP9ayQ3sCPHU6pKi5BHwikg+MDdg
         3khfpq8OHn1oD8dY0pnDPPjOUbXDuTLqLVpadydAjoPiSOjidKodNgz7hDrNolAdu0E5
         V+LkXUY0m4slx18eIZ55D6ICC2yJX0torhmNDznGB0eClqH3Mw6YWpF5scRYDwfYs4z7
         J9rsE3QIb6ia8rv0ChuRTTP2SRPuagu+FKHYo3C1o0zbgSd8utEPvcz+6dPp3oLk0M1R
         4rKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rrdXL1JeZBTcndwtR5YpP/KrXBdC1ycswHjofQS3Hz0KKhB1r5TCW+xyELH+J62uUaquxDq84PXhV5VPlAbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWHyZOfCgK2PoCzl3DEl1UWYPbaITZag4gFEkWm4md5NxKlBqI
	WLR8aM9iKB0SvLbjFeyLzmgXPZFEdvFcEt8N9RAanB6nfOzs/tDiRR2oG38PRYZL0DruwLGSL9R
	zPNf8djfQtwEEh4UnzZIGtNINBVQSJTEcLf1xEZU0rRy96ftQisHozs6UE1VadPi7sym37A==
X-Gm-Gg: AeBDietfOUpV6UBWn7QERdxdTMfOqLM7PX4eK26kmF3vDumqFhZblX4kNBiz4zKwZio
	1xONaXUmfYvNm0BtTVyk2O2i+G7PQnfjbuVRnmK5MYH46fIP+v4gMpf7uzu4wL/1N5/tVoyLTir
	PpdDyK97/3flRTn7FoyG/AH3Z2tdizVhlLaN1FvGU0eAD1VrTdCIDOs+cKG0gdiw/licqFnmD20
	IQDQ10AMjrnQdtkENvAsQ7K0unt8gnCQgt4C91dkM2AismlddHuc+Y0QjLWYbxct13VHhsXtgk+
	VQM8mXLVniXn0Jkkne2KTATY3Nk9syMPiUcgiw9GqAlvYs03Prd7WLiD39yE/yuQDHE9R2SSXby
	JYOTyskdQr8EFHj2vi7wRlx1jTQFGwNlZ/L85+3/2YhIMoO2vrajhqd0jdsYXDcsIsUCqQbxsmx
	D/TsvzCQ7ptbOxr9AlfVmWzUjfdQ==
X-Received: by 2002:ac8:5a13:0:b0:50d:aa29:2b64 with SMTP id d75a77b69052e-5100c944df7mr2438741cf.33.1777310350408;
        Mon, 27 Apr 2026 10:19:10 -0700 (PDT)
X-Received: by 2002:ac8:5a13:0:b0:50d:aa29:2b64 with SMTP id d75a77b69052e-5100c944df7mr2437961cf.33.1777310349853;
        Mon, 27 Apr 2026 10:19:09 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-53-69-159-169-238.dsl.bell.ca. [69.159.169.238])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fc91de051sm130914531cf.2.2026.04.27.10.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 10:19:08 -0700 (PDT)
Message-ID: <0e2ef2c0-d74e-4aff-bba0-6dd91dbd4e41@redhat.com>
Date: Mon, 27 Apr 2026 13:19:07 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 43/53] selftests/mm: migration: add setup of HugeTLB
 pages
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
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-44-rppt@kernel.org>
 <a8510cbd-4a30-460c-b870-a250ceb8a522@redhat.com>
 <ae3v1cyMLbcvJtYW@kernel.org>
 <67d7b067-97a8-4600-a9a6-46f3e797ffed@redhat.com>
 <ae-UCVba16jg3-gR@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <ae-UCVba16jg3-gR@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-27 12:51, Mike Rapoport wrote:
> On Mon, Apr 27, 2026 at 08:56:27AM -0400, Luiz Capitulino wrote:
>> On 2026-04-26 06:58, Mike Rapoport wrote:
>>>> And there's another issue: when running the migration test individually,
>>>> private_anon_htlb gets skipped. I guess it's because the previous test
>>>> is restoring the HugeTLB state:
>>>
>>> It could be.
>>>
>>> I pushed the updated version that has the fixes for both zombie and
>>> signal issues:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=mm-selftest/v3
>>>
>>> Would be great if you can test it in your setup.
>>
>> This works! Both issues are fixed: the migration test completes w/o
>> hanging and when I run it individually all tests run.
> 
> Thanks for confirming!
>   
>> One last question: should we munmap() the mappings in this test? Though
>> I understand this goes beyond your series goal.
> 
> We could, but the tests _exit() anyway as a part of kselftest_harness, so
> it does not really matter.

OK. Just to clarify that I meant exercising the munmap() path, not that
we're not freeing resources. But if we know that _exit() is sufficient
for this, then it's fine.

