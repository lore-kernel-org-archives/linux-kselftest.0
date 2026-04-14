Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231CD224AF7;
	Tue, 14 Apr 2026 05:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776143375; cv=none; b=UOL0iyLnGCaoF32a5zxgh1u5AOhs9UGb6QDPmcZTDBYN1HXe5xqVCnem7KU3DUlTVRLTXXOCPeeVLwPGngXzhFUvfe/Gm9Z9+RwOQ98GmWIlGTnd6EM1h65djxzJXtxIWr4RG84LEfe7ITQtUk/n9/tiHvHRLNg+jVDhofptSLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776143375; c=relaxed/simple;
	bh=bMLXuh2nFkKLo/z+idXyRjTafBVLLyWtKePx463V+gE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdzofOlj7I0IGqppc8h+FAzysmT+Q/P/GEKzBu55HM99djkP8/ZlOjc6yHlCPIc4hIzM1eQl0/B5HIPmyhkfti01x1fQm9iIzj8yQUOWCKlBQOuMeE6dKY+OrKvkfG5lLP9G0u1zN1TvLOxadaOCs2ASI+4CuPjWRxyzvy93Zcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=h+zMivZa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="h+zMivZa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 586194EE2;
	Mon, 13 Apr 2026 22:09:25 -0700 (PDT)
Received: from [10.164.148.48] (MacBook-Pro.blr.arm.com [10.164.148.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B9E93F7B4;
	Mon, 13 Apr 2026 22:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776143371; bh=bMLXuh2nFkKLo/z+idXyRjTafBVLLyWtKePx463V+gE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h+zMivZaaKvGn9QCaP2IWTEEDcneKP3DW5Vaq7DlEi38jyaZAxvN9sORQZx+VuClo
	 J6XITjJLgPF77FcNi1VGrtbkinX3ZFcbDfDhbD3uabIwhtO6EcrjkrceIJBlEDpZ48
	 t9m6Ii6td49dDnzBwpcTzMkqXgFCHRfs9Y3jV3WY=
Message-ID: <8b5544eb-5ec0-4c85-a2da-7a454fa606dc@arm.com>
Date: Tue, 14 Apr 2026 10:39:16 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Simplify byte pattern checking in
 mremap_test
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 shuah@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 ryan.roberts@arm.com, anshuman.khandual@arm.com,
 Sarthak Sharma <sarthak.sharma@arm.com>
References: <20260410143031.148173-1-dev.jain@arm.com>
 <5297e0da-d8ec-49df-9b32-0d9f907588d6@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <5297e0da-d8ec-49df-9b32-0d9f907588d6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/04/26 12:57 am, David Hildenbrand (Arm) wrote:
> On 4/10/26 16:30, Dev Jain wrote:
>> The original version of mremap_test (7df666253f26: "kselftests: vm: add
>> mremap tests") validated remapped contents byte-by-byte and printed a
>> mismatch index in case the bytes streams are not equal. That made
>> validation expensive in both cases: for "no mismatch" (the common case when
>> mremap is not buggy), it still walked all bytes in C; for "mismatch", it
>> broke out of the loop after printing the mismatch index.
>>
>> Later, my commit 7033c6cc9620 ("selftests/mm: mremap_test: optimize
>> execution time from minutes to seconds using chunkwise memcmp") tried to
>> optimize both cases by using chunk-wise memcmp() and only scanning bytes
>> within a range which has been determined by memcmp as mismatching.
>>
>> But get_sqrt() in that commit is buggy: `high = mid - 1` is applied
>> unconditionally. This makes the speed of checking the mismatch index
>> suboptimal.
> 
> So is that the only problem with 7033c6cc9620: the speed?

Yes.

I'll explain the algorithm in 7033c6cc9620.

The problem statement is: given two buffers of equal length n, find the
first mismatch index.

Algorithm: Divide the buffers into sqrt(n) chunks. Do a memcmp() over
each chunk. If all of them succeed, the buffers are equal, giving the
result in O(sqrt(n)) * t, where t = time taken by memcmp().

Otherwise, worst case is that we find the mismatch in the last chunk.
Now brute-force iterate this chunk to find the mismatch. Since chunk
size is sqrt(n), complexity is again
sqrt(n) * t + sqrt(n) = O(sqrt(n)) * t.

So if get_sqrt() computes a wrong square root, we lose this time
complexity.

Maybe there is an optimal value of x = #number of chunks of the buffer,
which may not be sqrt(n).

But given the information we have, a CS course on algorithms will
say this is one of the optimal ways to do it.

> 
>>
>> The mismatch index does not provide useful debugging value here: if
>> validation fails, we know mremap behavior is wrong, and the specific byte
>> offset does not make root-causing easier.
> 
> Fully agreed.
> 
>>
>> So instead of fixing get_sqrt(), bite the bullet, drop mismatch index
>> scanning and just compare the two byte streams with memcmp().
> 
> How does this affect the execution time of the test?

I just checked with ./mremap_test -t 0, the variance is very high on my
system.

In the common case of the test passing:

before patch, there are multiple sub-length calls to memcmp.
after patch, there is a single full-length call to memcmp.

So the time should reduce but may not be very distinguishable.

> 
>>
>> Reported-by: Sarthak Sharma <sarthak.sharma@arm.com>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> 
> Fixes: 7033c6cc9620 ("selftests/mm: mremap_test: optimize execution time
> from minutes to seconds using chunkwise memcmp")
> 
> ?

Not needed. 7033c6cc9620 does not create any incorrectness in the checking
of mismatch index.

> 
>> ---
>> Sorry for sending two patchsets the same day - the problem was made known
>> to me today, and I couldn't help myself but fix it immediately, imagine
>> my embarrassment when I found out that I made a typo in the binary search
>> code which I had been writing consistently throughout college :)
> 
> :)
> 
>>
>> Applies on mm-unstable.
>>
>>  tools/testing/selftests/mm/mremap_test.c | 109 +++--------------------
>>  1 file changed, 10 insertions(+), 99 deletions(-)
> 
> I mean, it certainly looks like a nice cleanup.
> 

