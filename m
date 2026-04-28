Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE0F37419A
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377427; cv=none; b=RTdB5992Ig1YY7kcGM4P00HbSfuDEb3KZby/oYJSG0GzTLJNd8065uxlVKZHS6Z3mm1bOVuocaZZUaydBxgnbvmsDzTbiWKw5q9npdFrWwgsJNvOgAv+tvQqKtTGg/XLoXnjegYczxBSiYgsrU0iAe25ABHZh94JLFS2OQfoyPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377427; c=relaxed/simple;
	bh=x01fyI9hSlHUiPCaC8zQGcP2vLXq4qwF7JHLG0WKnek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/01LutGRZRS0rHmus9NPJVGJG7MycurG/lEz7uE04gWkrM3H+w8GFgT6cv1qqTidvBOyAPiLtRGt1t9MocamOJMuus3kyOVmxhqUm+DgWRW8v2CcJE8d/G0Fr6vp719wRzIJSlfxxi7IMfQqLx9zyq3IOMXiGAUNK9b3p6Chew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RvD9bT6w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RvD9bT6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777377425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AgBBjKG/PS5Dz1DwpETM5k/BFvsOUmL0XkfBNTKeCf4=;
	b=RvD9bT6wn8/5HU6Dc1sIYgs5dZLPywAa50NumtznAJxKJTxIX08FiD24owOxyhmILjK8ZJ
	Dd+evUe9ffLENjtrSR7KHTHasFBY7AhahX2S6jmQIyrTYpo6WbSmzcWbXVR91XipSlKBs4
	tACxAya7qvhW3yPHRe7exZxcQOiaGVo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-a4IX42CWOaOMC-YcJdOd6A-1; Tue, 28 Apr 2026 07:57:04 -0400
X-MC-Unique: a4IX42CWOaOMC-YcJdOd6A-1
X-Mimecast-MFC-AGG-ID: a4IX42CWOaOMC-YcJdOd6A_1777377424
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b1f39c5827so137577896d6.1
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 04:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777377424; x=1777982224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgBBjKG/PS5Dz1DwpETM5k/BFvsOUmL0XkfBNTKeCf4=;
        b=aELKvp5VcoccXb0wzgET1cfvWFAFBw/zeqRStCsZa8uB/taHt2I0LaE909NLL+tLJ2
         yJNWSe6ArNVYe7qVKXwY13l5bBy/5X4pfZV02Qw3+JzjphaKmBwkPo+eyzCkfeB8HiyL
         svz6d5rKLk0CQiAaNqNPfbXhTJWdDyW64GDCuxZXserNEeGBJZsm5VYuVfw7VSHRRAf5
         E2TJl/ePzbVHYuOmqihZEBNWLzlq0BdqaAijTZftBclBEGh+/PLz3An77KOOT9q9ynNe
         vVECHk0WMIQ8C9f3CxbjMz6mu4SuIyvThrZWG80iFMiwh4SIbnfUT7L/UNsDGbp9HRz0
         Jw8A==
X-Forwarded-Encrypted: i=1; AFNElJ8Y4YU7NVSDGxku7GSu9iBm+tbUdKocP72lm0RtmqN0t/aoYKU7gMGdUjwXaitkETu/MSA7fYIXMQ9oAD9E7EA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZwh6V3cVdynGpj0h2eUqcVWlQ+cP2PNhvQyEp0120Y/3j3mDp
	de+RtV/m1mq2zi7VpLNmw2WZD7qDShmBb414ZdfxT909yP5JEVTJLL1ZwPvp4Xm/S+txhzVcepy
	aIwqZJEiNYfrhosjxke7ZFren7h9E0gzXB5u7umP1kPQEdBYwb2CByzvr0B6hEWTP7R+V+Q==
X-Gm-Gg: AeBDiet5OP63psiixT+1tQ0js3ZBKAsEw3QkC7S4EUwOBubryDCLO3mDQMRSgzndrhU
	Qz1YIfsfURmP5/pIO0tg7bKTpRILvO8vb/KCTHxbY9zUZ/uf28hNw1yoZuFryY+CyWPYsnVLSxJ
	ktLsPKC2ka6ZeZadOHtwUG7LgkgCuN/Fxq8D4JVLB6fgP+lKQXYIumauSIgcRvLcOe04aIj0cFA
	id3WxJHGTOolXyxA3yuALolLnWp7MkUycQEpVAtKp41DbO1BZ+rMs4RCWI99bmwLXXlBfQl9cG7
	vYE3Rbo4/cpfEAynGjylPMqL1nm5WKihaFtFBNa+l7r4xDPD7IH+Yo3mjY3r0BznkMxL8czlj6m
	ReXJ0acElJc85w3DQ/0nP3e7sqZpZUkQESYf6sd4EHmfsJVtnw8oYbRPaeoSfgwFPKtv63/aPR7
	zSpOCjU6n7gHblf9i+0MaOdow=
X-Received: by 2002:a05:6214:311b:b0:8ac:ab31:0 with SMTP id 6a1803df08f44-8b3e31fb96dmr42763926d6.40.1777377423710;
        Tue, 28 Apr 2026 04:57:03 -0700 (PDT)
X-Received: by 2002:a05:6214:311b:b0:8ac:ab31:0 with SMTP id 6a1803df08f44-8b3e31fb96dmr42763486d6.40.1777377423235;
        Tue, 28 Apr 2026 04:57:03 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-22-70-53-202-134.dsl.bell.ca. [70.53.202.134])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3e2956a8bsm18295396d6.31.2026.04.28.04.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 04:57:02 -0700 (PDT)
Message-ID: <09847e2f-0397-44cc-b517-75bffa7124e2@redhat.com>
Date: Tue, 28 Apr 2026 07:57:01 -0400
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
 <0e2ef2c0-d74e-4aff-bba0-6dd91dbd4e41@redhat.com>
 <afBKJn_EjaTAe4A-@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <afBKJn_EjaTAe4A-@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-28 01:48, Mike Rapoport wrote:
> On Mon, Apr 27, 2026 at 01:19:07PM -0400, Luiz Capitulino wrote:
>> On 2026-04-27 12:51, Mike Rapoport wrote:
>>> On Mon, Apr 27, 2026 at 08:56:27AM -0400, Luiz Capitulino wrote:
>>>> On 2026-04-26 06:58, Mike Rapoport wrote:
>>>>>> And there's another issue: when running the migration test individually,
>>>>>> private_anon_htlb gets skipped. I guess it's because the previous test
>>>>>> is restoring the HugeTLB state:
>>>>>
>>>>> It could be.
>>>>>
>>>>> I pushed the updated version that has the fixes for both zombie and
>>>>> signal issues:
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=mm-selftest/v3
>>>>>
>>>>> Would be great if you can test it in your setup.
>>>>
>>>> This works! Both issues are fixed: the migration test completes w/o
>>>> hanging and when I run it individually all tests run.
>>>
>>> Thanks for confirming!
>>>> One last question: should we munmap() the mappings in this test? Though
>>>> I understand this goes beyond your series goal.
>>>
>>> We could, but the tests _exit() anyway as a part of kselftest_harness, so
>>> it does not really matter.
>>
>> OK. Just to clarify that I meant exercising the munmap() path, not that
>> we're not freeing resources. But if we know that _exit() is sufficient
>> for this, then it's fine.
> 
> exit tears down all the mappings, but the code path is slightly different
> than calling munmap().
> 
> We can add munmap() calls there, but let's do it separately from this
> series.

Agreed.

