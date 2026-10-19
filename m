Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253493B2FD9;
	Mon, 19 Oct 2026 04:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792385511; cv=none; b=ZihRQJchFinMaXtFk4enX5K3nNzFk+TJWlazmBQTvPtuSdNZcKEJXIyrWS73tHmy0fMid4UhSecqsA2a80dEresTzG2ZkZCFuRy7ph4xiGFBWEufw7uN6LWHQLzkfzre39fd3wLRupFaPEsuqQUqnYP2wWSQvLEpLHrLYjPVmxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792385511; c=relaxed/simple;
	bh=5WEYiF0irBJpRs6F1IhKzRhrLDDCuuESsN66/V4Jl08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4Tb/5aFvbLL3sMK3aif3052VLWhTuPEH1J01VkmLY1ZGqlNsSr4HRba5CfwkK0IZ8P3gXvqmOIBuoAG1AD5k+q6/hjWLEItq+S5IOpCStKjBfOy0oBidOFZDcszbZ6p8kiQ80lRmH+65gw5vJynyv2vUbqx/z7CFjKs2ECZ12Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iG9JOxw4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iG9JOxw4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 082BC1476;
	Sun, 18 Oct 2026 21:51:42 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FF973F673;
	Sun, 18 Oct 2026 21:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792385505; bh=5WEYiF0irBJpRs6F1IhKzRhrLDDCuuESsN66/V4Jl08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iG9JOxw4rscU6r/UL82N8mypUm+ghnV4mG+JArN39f2sj4gp6w0JICTrXUnkJUUj7
	 88zLUmGtHEFeyM5Ki14JCXsPA+zOXuv7FY5DjyvGsesvrDrfNjbHLVgP6Lpc7HEQLY
	 YP+OUOlHmUsQ5qt6fgLmaB1/DJhAGbIRKi2XN3TA=
Message-ID: <db446de6-bd87-44b6-b9db-c4533ee047fa@arm.com>
Date: Mon, 19 Oct 2026 10:21:38 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] selftests/mm: check MADV_PAGEOUT file permissions
To: Gregory Price <gourry@gourry.net>
Cc: linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-8-gourry@gourry.net>
 <cba2a01d-630c-42d3-b6e4-b498f10c4b45@arm.com>
 <atImwW1ONQQ9Hv7p@gourry-fedora-PF4VCD3F>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <atImwW1ONQQ9Hv7p@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/16/26 7:18 PM, Gregory Price wrote:
> On Fri, Oct 16, 2026 at 05:48:11PM +0530, Sarthak Sharma wrote:
>>> +/*
>>> + * The owner of a file may page out its clean page-cache pages. Run as an
>>> + * unprivileged owner, so that capabilities cannot stand in for ownership.
>>> + */
>>> +TEST_F(madvise, pageout_evicts_owned_file_page)
>>> +{
>>> +   char *mapping, *control;
>>> +
>>> +   if (!geteuid() && !drop_privileges())
>>> +      SKIP(return, "could not drop privileges");
>>> +   pin_to_current_cpu(_metadata);
>>
>> Is there a reason why we are pinning to the current CPU here and not in
>> the next two tests?
> 
> Oversight on my part.  I added it where i got a failure, but didn't
> carry it forward to the other tests.
> 
>>> +   ASSERT_EQ(mapping[0], 0);
>>> +   ASSERT_EQ(mapping[page_size], 0);
>>> +   mapping[0] = 1;
>>
>> If both pages are on CPU 1's per CPU LRU batch here and then hte task
>> migrates to CPU 2 here
>>
>>> +
>>> +   ASSERT_EQ(madvise(mapping, 2 * page_size, MADV_PAGEOUT), 0);
>>
>> Then this can cause lru_add_drain() on CPU 2, and therefore both pages
>> do not reach the main LRU list. Thus they won't be reclaimed and the
>> test can skip here since the CoW page wasn't swapped.
> 
> I think there are other corner cases here as well. So yes i'll set up
> thei pinning - probably worth it to just pin the entire suite of tests.

Yup, that would be better.

> 
> My original set had a bunch of this tested more explicitly, but this is
> really implementation details that are not worth the additional test
> complexity.  I think we can just rid ourselves of that and just pin
> every test and make sure it does what we expect in that case.
> 
>>
>>> +   ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd,
>>> +                mapping + page_size));
>>> +   swapped = pagemap_is_swapped(self->pagemap_fd, mapping);
>>> +   ASSERT_EQ(mapping[0], 1);
>>> +   ASSERT_EQ(mapping[page_size], 0);
>>> +   if (!swapped)
>>> +      SKIP(return, "MADV_PAGEOUT did not swap the COW page");
>>
>> Also, here we skip if we couldn't swap out the CoW page. Won't it make
>> more sense to check with pageout_until_swapped() first if pages can be
>> skipped, and then fail here if the CoW page wasn't skipped after all the
>> retries, similar to how some other tests implement it?
>>
> 
> Ah yeah good catch.  I'll adjust like this:
> 
>    /* Ensure pageout-swap actually works first with a control page */
>    control[0] = 1;
>    if (!pageout_until_swapped(_metadata, control, page_size,
>                               self->pagemap_fd))
>       SKIP(return, "MADV_PAGEOUT did not swap the control page");
> 
>    /* Run the actual test */
>    ASSERT_EQ(mapping[0], 0);  
>    ASSERT_EQ(mapping[page_size], 0);
>    mapping[0] = 1;
> 
>    ASSERT_TRUE(pageout_until_swapped(_metadata, mapping, 2 * page_size,
>                                      self->pagemap_fd));
>    ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd,
>                                     mapping + page_size));
>    ASSERT_EQ(mapping[0], 1);         
>    ASSERT_EQ(mapping[page_size], 0);

Yes, that looks good. Thanks!

