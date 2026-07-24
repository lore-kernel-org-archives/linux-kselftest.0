Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2C4412C03;
	Fri, 24 Jul 2026 12:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784894758; cv=none; b=ZqCUHk4Z3lMV9EDWR5cDwVnw4wTc5TGfYk2iZW6RJajmGK/ofaAGru7Wxdkbbe6r2EDBQ+6HbYG3deNcwXuupIQ0kKwmT71RzoSm0djdpMKrbimnyMbLGz4rxpI32K1d9VezBNWESVAfHnauXfZbxzdLvv/Bw8tfi8PJcjFu900=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784894758; c=relaxed/simple;
	bh=H5Q6O3f+4VsLMRu0BEb0Tqa+RIlw9y6bFNPPqXhmkJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5+76Y67JO3hU0/XJGkBl/c8vu8tJBoAHfoFAocpiwT+Du2CMZWZl93SxZg3w+sVPf8oyQIvnC9PGfv5HQSGZvZJEjTUMrbD+h1+mfDNVBpVzS9ob0+UY3JPOHtGwA4kmfK7YGBEpbG3fZ5Uu09J0p+3MM1MubPdVLFExiK9gKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PUQLs5JT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PUQLs5JT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 383361476;
	Fri, 24 Jul 2026 05:05:50 -0700 (PDT)
Received: from [10.164.19.44] (unknown [10.164.19.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 584453F66F;
	Fri, 24 Jul 2026 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784894754; bh=H5Q6O3f+4VsLMRu0BEb0Tqa+RIlw9y6bFNPPqXhmkJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PUQLs5JTDwtG4lUIcvJ1bkbL105LXczgPsxaMjjS2Ymbk3kkkkZIjBzs/XZPt+cnI
	 fBquC+M7+yOr2KGWvreF0z9TayqdV1x3mBRT52lDxro1OxBwvLDz8Qbnp1opXxAQV3
	 rmdf44dOQKdDUJNK6DUl8Me/jT2gehKOiIBEqPFs=
Message-ID: <75259d8f-1cdf-43e4-9fa4-9a2954435a96@arm.com>
Date: Fri, 24 Jul 2026 17:35:44 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] tools/mm: add a standalone GUP microbenchmark
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Sarthak Sharma <sarthak.sharma@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 Leon Romanovsky <leon@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Mark Brown <broonie@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260716123226.197736-1-sarthak.sharma@arm.com>
 <20260716123226.197736-5-sarthak.sharma@arm.com>
 <4665dd2d-99c8-492c-a4cf-b72028317d0b@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <4665dd2d-99c8-492c-a4cf-b72028317d0b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21/07/26 7:22 pm, David Hildenbrand (Arm) wrote:
> On 7/16/26 14:32, Sarthak Sharma wrote:
>> Add a command-line tool for benchmarking get_user_pages fast-path
>> (GUP_FAST), pin_user_pages fast-path (PIN_FAST), and pin_user_pages
>> longterm (PIN_LONGTERM) via the CONFIG_GUP_TEST debugfs interface.
>>
>> When invoked without arguments, gup_bench runs the benchmark subset
>> of configurations covered by run_gup_matrix() in run_vmtests.sh: all
> 
> To we really need the matrix in there? The matrix was good for selftests, but
> not when using it as a benchmarking tool, no?
> 
>> three GUP commands across read/write, private/shared mappings, and a
>> range of page counts, with THP on/off for regular mappings and hugetlb
>> for huge page mappings. Restore HugeTLB settings after each hugetlb
>> benchmark run. Validate numeric command-line arguments instead of
>> relying on atoi().
>>
>> This tool is a mix of reused and new logic. The mapping/setup path comes
>> from selftests/mm/gup_test.c, while the default benchmark matrix matches
>> the benchmark subset of run_gup_matrix() in run_vmtests.sh. The standalone
>> CLI and tools/mm integration are added here and the HugeTLB setup code is
>> shared via tools/lib/mm.
>>
>> Add gup_bench to BUILD_TARGETS and INSTALL_TARGETS in tools/mm/Makefile,
>> link it against the shared tools/lib/mm hugepage helpers, and ignore the
>> resulting binary in tools/mm/.gitignore. While here, also add the
>> missing thp_swap_allocator_test entry to .gitignore.
>>
>> Add tools/mm/gup_bench.c to the GUP entry in MAINTAINERS.
>>
>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>> ---
>>  MAINTAINERS          |   1 +
>>  tools/mm/.gitignore  |   2 +
>>  tools/mm/Makefile    |  10 +-
>>  tools/mm/gup_bench.c | 482 +++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 492 insertions(+), 3 deletions(-)
>>  create mode 100644 tools/mm/gup_bench.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 26b06d80ab45..7d121dee9f0f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -17024,6 +17024,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>>  F:	mm/gup.c
>>  F:	mm/gup_test.c
>>  F:	mm/gup_test.h
>> +F:	tools/mm/gup_bench.c
>>  F:	tools/testing/selftests/mm/gup_longterm.c
>>  F:	tools/testing/selftests/mm/gup_test.c
>>  
>> diff --git a/tools/mm/.gitignore b/tools/mm/.gitignore
>> index 922879f93fc8..154d740be02e 100644
>> --- a/tools/mm/.gitignore
>> +++ b/tools/mm/.gitignore
>> @@ -2,3 +2,5 @@
>>  slabinfo
>>  page-types
>>  page_owner_sort
>> +thp_swap_allocator_test
> 
> ^ Does that belong into this patch?
> 
>> +gup_bench
> 
> I wonder if it makes sense to "git mv" the existing tool (only slightly fixing
> header inclusion to make it compile), essentially removing the old benchmark.
> 
> So it would be
> 
> 1) Move tools, fixing up includes and removing the gup testing logic+matrix to
>    make it compile

I like your idea, it would reduce churn. But is it okay that there will be an
intermediate state in which gup_test is not there? Wouldn't we call this a
"regression"?


> 
> 2) Extend tool by XYZ
> 
> 3) Add completely new selftest
> 
> Because looking at patch #5, there is not really any code reuse there, but I
> suspect there should be some in this patch here when moving instead of copying.
> 
> That would make this a lot easier to review.
> 

