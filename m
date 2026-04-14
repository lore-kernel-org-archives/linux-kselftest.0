Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0238A245008;
	Tue, 14 Apr 2026 12:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776168020; cv=none; b=iDNuiZtSLrsGe7IqIqSsfLlOG9hCcim1cWU/ykewpLZ3tGAvAXQwGdexOTkW3HkFUKTTmcO4uuCoxeOk5iICHftHYBxlO1R4axoN5L1g9IHfssOhCNMk6QHeZ/WXeZMOUSrfoXzX98Xq8HAR3dAZKLk3JC5w6+YBKMk9xG44a6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776168020; c=relaxed/simple;
	bh=n0FuSTRAL+hNCZiTzx44xxGhs7sDE7lq5mpQ894KpuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5FUcNXxi1scg8Xk9mWSTntr+L6gnH6XQ21RbA8gZsuBqVPW4cbk5BgsD3C7/p9H13ngafqvlkRrWZbuq60MwnDgV4HPnjtBxIcjkkx7dGc87+rA/6xBfui2MsffoUVrPuzBroi1vtKb/aSzk5iLlhqhu4owFrgvpN2BvFVpENA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EVmT2dzH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EVmT2dzH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAF404ECA;
	Tue, 14 Apr 2026 05:00:12 -0700 (PDT)
Received: from [10.164.148.48] (MacBook-Pro.blr.arm.com [10.164.148.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 205E33F7B4;
	Tue, 14 Apr 2026 05:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776168018; bh=n0FuSTRAL+hNCZiTzx44xxGhs7sDE7lq5mpQ894KpuE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EVmT2dzHsZucBiO1iVU5bKVRILDszlR629YATDHni3fQxwJeEmAEvzfmQQXjQuwXP
	 sVIr2+TDC8q/LHEjqJymV5mAr63YnSq3HLVqkPj7LjL7qDcgxsd5wfVOndGGOlOqKF
	 IrYdvk4t80VVypImjb3+Uwy20gJ/UeZ63u5dIC2g=
Message-ID: <f69cfdac-2718-4a1e-b00c-3c751716799a@arm.com>
Date: Tue, 14 Apr 2026 17:30:09 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Simplify byte pattern checking in
 mremap_test
To: David Laight <david.laight.linux@gmail.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, shuah@kernel.org, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 ryan.roberts@arm.com, anshuman.khandual@arm.com,
 Sarthak Sharma <sarthak.sharma@arm.com>
References: <20260410143031.148173-1-dev.jain@arm.com>
 <5297e0da-d8ec-49df-9b32-0d9f907588d6@kernel.org>
 <8b5544eb-5ec0-4c85-a2da-7a454fa606dc@arm.com>
 <134c372e-5c9e-493d-b954-d9954546beaf@kernel.org>
 <20260414104712.2b634741@pumpkin>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260414104712.2b634741@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/04/26 3:17 pm, David Laight wrote:
> On Tue, 14 Apr 2026 10:01:57 +0200
> "David Hildenbrand (Arm)" <david@kernel.org> wrote:
> 
>> On 4/14/26 07:09, Dev Jain wrote:
>>>
>>>
>>> On 14/04/26 12:57 am, David Hildenbrand (Arm) wrote:  
>>>> On 4/10/26 16:30, Dev Jain wrote:  
>>>>> The original version of mremap_test (7df666253f26: "kselftests: vm: add
>>>>> mremap tests") validated remapped contents byte-by-byte and printed a
>>>>> mismatch index in case the bytes streams are not equal. That made
>>>>> validation expensive in both cases: for "no mismatch" (the common case when
>>>>> mremap is not buggy), it still walked all bytes in C; for "mismatch", it
>>>>> broke out of the loop after printing the mismatch index.
>>>>>
>>>>> Later, my commit 7033c6cc9620 ("selftests/mm: mremap_test: optimize
>>>>> execution time from minutes to seconds using chunkwise memcmp") tried to
>>>>> optimize both cases by using chunk-wise memcmp() and only scanning bytes
>>>>> within a range which has been determined by memcmp as mismatching.
>>>>>
>>>>> But get_sqrt() in that commit is buggy: `high = mid - 1` is applied
>>>>> unconditionally. This makes the speed of checking the mismatch index
>>>>> suboptimal.  
>>>>
>>>> So is that the only problem with 7033c6cc9620: the speed?  
>>>
>>> Yes.
>>>
>>> I'll explain the algorithm in 7033c6cc9620.
>>>
>>> The problem statement is: given two buffers of equal length n, find the
>>> first mismatch index.
>>>
>>> Algorithm: Divide the buffers into sqrt(n) chunks. Do a memcmp() over
>>> each chunk. If all of them succeed, the buffers are equal, giving the
>>> result in O(sqrt(n)) * t, where t = time taken by memcmp().
>>>
>>> Otherwise, worst case is that we find the mismatch in the last chunk.
>>> Now brute-force iterate this chunk to find the mismatch. Since chunk
>>> size is sqrt(n), complexity is again
>>> sqrt(n) * t + sqrt(n) = O(sqrt(n)) * t.
>>>
>>> So if get_sqrt() computes a wrong square root, we lose this time
>>> complexity.  
>>
>> Ah, thanks for clarifying.
>>
>>>
>>> Maybe there is an optimal value of x = #number of chunks of the buffer,
>>> which may not be sqrt(n).
>>>
>>> But given the information we have, a CS course on algorithms will
>>> say this is one of the optimal ways to do it.
>>>   
>>>>  
>>>>>
>>>>> The mismatch index does not provide useful debugging value here: if
>>>>> validation fails, we know mremap behavior is wrong, and the specific byte
>>>>> offset does not make root-causing easier.  
>>>>
>>>> Fully agreed.
>>>>  
>>>>>
>>>>> So instead of fixing get_sqrt(), bite the bullet, drop mismatch index
>>>>> scanning and just compare the two byte streams with memcmp().  
>>>>
>>>> How does this affect the execution time of the test?  
>>>
>>> I just checked with ./mremap_test -t 0, the variance is very high on my
>>> system.
>>>
>>> In the common case of the test passing:
>>>
>>> before patch, there are multiple sub-length calls to memcmp.
>>> after patch, there is a single full-length call to memcmp.
>>>
>>> So the time should reduce but may not be very distinguishable.  
>>
>> Okay, so doesn't matter. I agree that we should simplify all that.
>>
>> The exact index is irrelevant. Whoever wants to debug the test failure
>> could modify the test to find that out. It's one of the tests we don't
>> really expect to fail (often).
>>
>>>   
>>>>  
>>>>>
>>>>> Reported-by: Sarthak Sharma <sarthak.sharma@arm.com>
>>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>  
>>>>
>>>> Fixes: 7033c6cc9620 ("selftests/mm: mremap_test: optimize execution time
>>>> from minutes to seconds using chunkwise memcmp")
>>>>
>>>> ?  
>>>
>>> Not needed. 7033c6cc9620 does not create any incorrectness in the checking
>>> of mismatch index.  
>>
>> Yes, agreed.
>>
>>
>> I would suggest to rewrite/simplify/clarify the patch description, not
>> talking about "buggy" etc, focusing on the simplification.
>>
>> "
>> The original version of mremap_test (7df666253f26: "kselftests: vm: add
>> mremap tests") validated remapped contents byte-by-byte and printed a
>> mismatch index in case the bytes streams didn't match. That was rather
>> inefficient, especially also if the test passed.
>>
>> Later, commit 7033c6cc9620 ("selftests/mm: mremap_test: optimize
>> execution time from minutes to seconds using chunkwise memcmp") used
>> memcmp() on bigger chunks, to fallback to byte-wise scanning to detect
>> the problematic index only if it discovered a problem.
>>
>> However, the implementation is overly complicated (e.g., get_sqrt() is
>> currently not optimal) and we don't really have to report the exact
>> index: whoever debugs the failing test can figure that out.
>>
>> Let's simplify by just comparing both byte streams with memcmp() and not
>> detecting the exact failed index.
>> "
> 
> ISTM that if you get a failure it doesn't really matter how long a
> second scan takes.
> So a simple byte loop that reports the offset and data of the first
> error and counts the number of errors is more than enough.

You are right in saying that it won't matter how long the second scan
takes, but it also doesn't matter what is the mismatch offset : ) so
let us remove some code while we can!

> 
> 	David
> 
> 

