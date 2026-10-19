Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4230483804;
	Mon, 19 Oct 2026 04:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792385353; cv=none; b=CXP10OhJywKtffaD251RhsLI0C82AQp5UwHPXqhKFtov9MIKJaQDNg52ysj1piYWOkzx0JlvIJVSwIwsKPxK9E/crmsr35KRet4SrCTjbB5LwjcCtgBhZ0e4Ova4NCLrnFUIJGI/2SRI1ZUpAgYHwUbrVdxILsJ1dTkXLqaLbyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792385353; c=relaxed/simple;
	bh=si7QsQnsH09mNJsPLKAXHcWxuGvdCBwgZF+8vn9kW/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbTNn0zJW3vXlbEBuhveNKccMH8c5OTn8Xd+ztEjHnEQMrzY7iU/rq7bp55SSFMY9WeCk1i7rq59ltjfu3VPJ88nkLmvBGSZi/mkcMLJTckcpkO/J4z+8c24RHlYuZH/Mee8dXhnVfssnYOnpHpWbEtHqMTDLXMfqQqwgITTuvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Mod5dmx4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Mod5dmx4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 480CA1476;
	Sun, 18 Oct 2026 21:49:02 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E4513F673;
	Sun, 18 Oct 2026 21:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792385345; bh=si7QsQnsH09mNJsPLKAXHcWxuGvdCBwgZF+8vn9kW/k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mod5dmx4zAhvQZJluv51WnM0iAhgYxZE3XO6/39Mp14IHn9gbJTDXu5FzUzpKMBPp
	 ShmIFc7VCfiJd5rhnBIp8bKandPFZpCAC+ULCS9WHgaNJsXcH7PHKahVPy3FcqHSvd
	 r0uvqM4bLS6LAz386V0ecFiIfMEJipEyq5fH7Zzw=
Message-ID: <f74f6e87-1a6e-4b45-934b-d13fdb0c6ddc@arm.com>
Date: Mon, 19 Oct 2026 10:18:58 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] selftests/mm: check MADV_COLD and MADV_PAGEOUT range
 handling
To: Gregory Price <gourry@gourry.net>
Cc: linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-4-gourry@gourry.net>
 <73c55ce6-67a5-471d-811c-facf712b2fe9@arm.com>
 <atIkDw9r6CVDJaG7@gourry-fedora-PF4VCD3F>
 <atIvbzEGUcyCqdC7@gourry-fedora-PF4VCD3F>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <atIvbzEGUcyCqdC7@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/16/26 7:37 PM, Gregory Price wrote:
> On Fri, Oct 16, 2026 at 09:22:54AM -0400, Gregory Price wrote:
>> On Fri, Oct 16, 2026 at 05:47:57PM +0530, Sarthak Sharma wrote:
>>>> +/*
>>>> + * An unmapped gap in the range makes either hint fail with ENOMEM, after
>>>> + * advising the mapped pages on both sides of the gap. Only MADV_PAGEOUT has
>>>> + * an effect on those pages that the test can observe.
>>>> + */
>>>> +TEST_F(madvise, unmapped_gap_fails_after_advising)
>>>> +{
>>>> +	char *mapping, *control;
>>>> +	bool swapped = false;
>>>> +	int retry;
>>>> +
>>>> +	pin_to_current_cpu(_metadata);
>>>> +
>>>> +	/* Make sure MADV_PAGEOUT can swap at all before relying on it. */
>>>> +	control = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
>>>> +		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>>> +	ASSERT_NE(control, MAP_FAILED);
>>>> +	control[0] = 1;
>>>> +	if (!pageout_until_swapped(_metadata, control, page_size,
>>>> +				   self->pagemap_fd))
>>>> +		SKIP(return, "MADV_PAGEOUT did not swap the page");
>>>
>>> This test is checking for both MADV_COLD and MADV_PAGEOUT. So if we skip
>>> here because we couldn't pageout, then we don't test for MADV_COLD
>>> behaviour at all. Do we want it this way, or should the tests for both
>>> of these be separate?
>>>
>>
>> If swap is off, the behavior of COLD and PAGEOUT look pretty much the
>> same, and we can't actually test them meaningfully.
>>
>> We check that madvise(COLD) returns -1, but that's also largely
>> meaningless if this initial pageout_until_swapped() call fails.
>>
>> At least that's my thought.  If you think I should split it, I can.
>>
> 
> on second look, i will just move the cold checks above the rest, since
> they're mostly checking failure paths.  those are mostly unchanging
> regardless of swap status.
> 
> so basically no need to split, just a mild reorder.

Yes that would cover MADV_COLD testing even when we can't swap.

Just thinking out here. Say if MADV_COLD fails, do we lose out on
MADV_PAGEOUT coverage in that case? Or is it meaningless to test for
pageout if MADV_COLD fails?

Also, say MADV_COLD passes, but we can't swap, then the test will report
a SKIP. We know that if it reaches a skip, then MADV_COLD must have
passed, but the ksft counters won't report that. So I would still prefer
separate tests from a test reporting POV, but I don't insist strongly,
it's upto you :)

> 
> ~Gregory

