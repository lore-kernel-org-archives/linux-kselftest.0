Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B584457A6;
	Fri, 11 Sep 2026 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124942; cv=none; b=M72w70EUNZw8r95TzgQktt7PC+x5fBemV0rGuJc+TRUQN5wPbLPx2mYgXPVfLGtaVVrE+II3dnpGQf4IML2FQSgV9ibHbfpy1N1zPxOKJEpKc2tIVlTsdjPpLqkjaDYQ8zpQvczYm20guFlMkyB223f01XsckeS/1pRis11Ej4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124942; c=relaxed/simple;
	bh=9EuvcvyokWIr5lp8zE4aZ/qzfPErdBcMkQga6O6vQJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SdJITV4qyMU0rsve48zuZt45XSuFq17F5gWHO7CKPM0djdReyqrJTAN/wLkSCyvt5u2DvKnfHcRX+FOE54jC5swqxWqdWbINcuQ5lqn+7nr7FCl9F4m5P2lsrlW/Ul5OWnSMClMe4NWkbajT+AB5wiSpfDRxyKBaE0ymCowjqBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gC3880N7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gC3880N7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF1A1F000FF;
	Fri, 11 Sep 2026 11:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789124940;
	bh=6ygcdnQ69In0ilSwlGhITt/klmABXMlT7Ds7dNoRszA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gC3880N7e8W3doV9TCZFw9rw0iMCANVgDewTgiorw4xFJbxopkGieOb+PwS6w6yEK
	 EFU7ECwpxoK0Jtx9uaK54xOQfl4Phf+XW94wQs0nC5Zw6HY4ZOVT8asix/QraMPSKN
	 WVDnjjQx+csPiMXjB/7icM71AG/X4QHkgijLXNbSDPz9L7/fwcycRtbdnzJA5Ivnxb
	 B8ShR1utBRL5LNy0mak9ADaHCaDPJF91fFlwh0ttZ1zHngwvT7zIg8u8RUx06A3yKL
	 dZO/rPPRh/uep9AtUDw6QGnMFRshPc1wvDHKu3DblMSvoNb5F1Wwl2mFp4FGv6EiPY
	 2OWGFZaucJcLg==
Message-ID: <ea283a7f-0dc6-4a98-8fc2-dbba51f7a3a2@kernel.org>
Date: Fri, 11 Sep 2026 13:08:51 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] selftests/mm: add a GUP selftest
To: Sarthak Sharma <sarthak.sharma@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Mark Brown <broonie@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260904123631.198697-1-sarthak.sharma@arm.com>
 <20260904123631.198697-7-sarthak.sharma@arm.com>
 <b0400430-c3b6-40d5-b476-49189b1cc292@kernel.org>
 <5e0b9365-cbac-4f2d-b915-85edf3093508@arm.com>
 <fadb8870-37f8-46f4-aefb-c21bc3a31e5b@kernel.org>
 <f7416ebc-f897-4c9b-8266-6aa7c9fd5473@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <f7416ebc-f897-4c9b-8266-6aa7c9fd5473@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 06:32, Sarthak Sharma wrote:
> Hi David!
> 
> On 9/9/26 10:33 PM, David Hildenbrand (Arm) wrote:
>>>
>>> This is an interesting change. We can keep this open for discussion
>>> here. If required, I can work on this in the future.
>>
>> Yes, we should in general try moving all test modules out of the core.
>>
>>>
>>> This is a pre requisite check. Every test opens and closes /dev/zero and
>>> /sys/kernel/debug/gup_test of its own. So I wanted to check before
>>> running the harness if these two are available, so that we don't have
>>> setup failures for 60 test cases.
>>
>> But why /dev/zero? We should understand why that would possibly be required.
> 
> This was carried over from the old test, where /dev/zero was the default
> backing for mmap unless the user selected another file to back the
> mapping. Now since we don't support file backed mappings, we can
> directly use MAP_ANONYMOUS here. Thanks for pointing it out, I'll remove
> it from this patch.
> 
>>
>>>
>>>
>>> mm selftests normally skip if the test is not run as root. So I tried
>>> keeping the same thing here. Do you think I should change it to fail?
>>
>> If other tests do that, it's fine!
>>
>> [...]
>>
>>>
>>> HUGETLB_TARGET_SIZE is the target mapping size and
>>> default_huge_page_size() gives the size of a single hugetlb page.
>>>
>>> Using default_huge_page_size() would reduce coverage for 2MB hugetlb
>>> pages. The old test set self->size to be 256 MB for the hugetlb case.
>>>
>>> Now it was discussed in a previous version of this patchset that we can
>>> derive the self->size for hugetlb case by fixing the nr_hugepages and
>>> multiplying by hugetlb size, and thought 128 would be a good number for
>>> nr_hugepages [1].
>>>
>>> But in case the hugetlb pages are very large, eg we can have 1 GB
>>> hugepages as well, reserving 128 GB is not a good idea. So I tried to
>>> keep the target size of the mapping as 256 MB, as it was before in the
>>> old gup test. If the hugetlb pages are larger than this, we'll reserve
>>> only one of them. Else, we'll reserve (256 MB /
>>> default_huge_page_size()) hugetlb pages, which comes out to be 128 for
>>> the case of 2MB hugetlb pages.
>> It's odd that 2M gets better test coverage than 512M or 1G.
>>
>> Is there really a lot of value in testing 128 2M pages? Would, like, 2 already
>> be good enough?
> 
> Yup, seems like keeping 128 pages is not adding an extra value. I'll go
> with 2 hugetlb pages to test both pinning within a hugetlb page and
> across the hugetlb boundary. This would make things a lot simpler.

Thanks!

-- 
Cheers,

David
