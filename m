Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812172;
	b=sTlzIkLm9a6jhCvShorOwbp3TO4urJJ6STXuBP4Z/mUB5J6GLR45YjF2tRAMPgWDIcV0
	 AmDJY+cxnj/k8wCu6b+zb8e533WwLypzOjHWvgmjY90YKIzSKFw6nGf95paq4yCBRAQBk
	 ltnSYzYQ5l2WtSjGNU46vD8aKJoKipRLiUpClSHcuARjb52F+Ch3u/+Qfz0bvcrcBK1lh
	 wiTpNdusP8qIyGPIERq7pQ7ZBB7UZ4MwhVdyZ0NLorKPAwoMa+NZHrZrEcEs94BxN5r2n
	 qebcnvOrPpNueOqnsEBxM5f+wvYuEq4kkwaz0zmbIsFSLLzgMyK0+jejvZIaJqBUWyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812172;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=w6j/ofOeuk31Oj1ML+7lFGAIrAFbRvVDC3r8vSxWcPM=;
	b=IlsIg7r3Th/ZO5yhR6BY9RqXuMmPq3LRb7SM1cd1HOEazPYBBg9rfeDiPpzRo3GoVKX2
	 svszEs2c1HOc3ZaLQ56AEB9kMockgwQ16WFTcqWK2+oaeYsQ2yumHAyPZmvc4/0dupz9J
	 kChSbix1umpNsOa6dnPIey5dWQ3Jlt4jCRY9gyr6QEunsm1DuJFvQKK1kBl4zCMvvvwZq
	 MoxhqhYOqpc0Bk2M7VU2YieiC2kRbxj0gWAI/QdSWAhTHzo3pQDYEEkiPwdYfzLsiVMHa
	 FXr/KsOvrd1TwvbtDooTJQUEtvTGFEgFToDt1JJXd54K60ir7tnYxTafAaAF2+DN0Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rvxD7NHz;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CF8606A31B;
	Wed,  4 Nov 2026 17:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24CF8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rvxD7NHz
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 782F21BB2;
	Wed,  4 Nov 2026 09:09:28 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7D7D3F673;
	Wed,  4 Nov 2026 09:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793812171; bh=kF89wKeD7kZ/O+6Dyki9XICH0urGPiXkcSyqCzbI8Po=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rvxD7NHzAOCz8jOJZ6FLg6gSC+ni1/PJaxeOI5/h5oadEWYXrNMhF4KkeXbXdPIDg
	 l2fIZz3J/aPh1MMZCEaBxELio4vNNrzft8C9dEgDZd9rM+8/oX/G2DAzms4TPevrzw
	 MBP8TziYfCkcqXcpVysDANR4LsPfMnht+Sz0vuUo=
Message-ID: <b94aa5e5-a4ab-4b61-a864-d10ff1ff2b63@arm.com>
Date: Wed, 4 Nov 2026 17:09:28 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
To: Richard Cheng <icheng@nvidia.com>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, x86@kernel.org,
 shuah@kernel.org, fenghuay@nvidia.com, Dave.Martin@arm.com,
 james.morse@arm.com, babu.moger@amd.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kaihengf@nvidia.com, kobak@nvidia.com,
 newtonl@nvidia.com, kristinc@nvidia.com
References: <20261012074729.40042-1-icheng@nvidia.com>
 <20261012074729.40042-2-icheng@nvidia.com>
 <847af89d-7b79-44b4-8273-243dfb51ef5e@arm.com>
 <9cccea63-397c-4913-95bc-eed38f0ebd66@arm.com> <aurOz7iGKInyjddW@MWDK4CY14F>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <aurOz7iGKInyjddW@MWDK4CY14F>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Richard,

On 04/11/2026 06:43, Richard Cheng wrote:
> On Wed, Oct 21, 2026 at 10:55:35AM +0800, Ben Horgan wrote:
>> Hi Richard,
>>
>> On 20/10/2026 17:30, Ben Horgan wrote:
>>> Hi Richard,
>>>
>>> Thanks for having a look at the arm64 side of the resctrl selftests. That hasn't had much love but
>>> it would be good to have them working properly.
>>>
>>> On 12/10/2026 08:47, Richard Cheng wrote:
>>>> cl_flush() and sb() compile to empty functions on aarch64, making
>>>> mem_flush() a silent no-op and leaving CMT/CAT tests operating on
>>>> unflushed state.
>>>>
>>>> Add "dsb sy" for sb(), ARM requires a DSB whose access type covers both
>>>> loads and stores.
>>>
>>> I guess this is referring to the synchronization required for the cache maintenance instruction but
>>> that's not what you are using in this patch.
>>>
>>>>
>>>> For cl_flush(), "dc civac" only reaches the Point of Coherency, on
>>>> ARM MPAM systems the SLC lies past the PoC and may be a NOP on coherent
>>>> platforms. Instead, dirty each cacheline with a store so that
>>>> mem_flush's full-buffer sweep evicts lines from the SLC via LRU
>>>> pressure.
>>>>
>>>> Signed-off-by: Richard Cheng <icheng@nvidia.com>
>>>> ---
>>>>  tools/testing/selftests/resctrl/fill_buf.c | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
>>>> index b9fa7968cd6e..eae0262fe265 100644
>>>> --- a/tools/testing/selftests/resctrl/fill_buf.c
>>>> +++ b/tools/testing/selftests/resctrl/fill_buf.c
>>>> @@ -27,6 +27,9 @@ static void sb(void)
>>>>  #if defined(__i386) || defined(__x86_64)
>>>>  	asm volatile("sfence\n\t"
>>>>  		     : : : "memory");
>>>> +#elif defined(__aarch64__)
>>>> +	asm volatile("dsb sy\n\t"
>>>> +		     : : : "memory");
>>>>  #endif
>>>>  }
>>>>  
>>>> @@ -35,6 +38,14 @@ static void cl_flush(void *p)
>>>>  #if defined(__i386) || defined(__x86_64)
>>>>  	asm volatile("clflush (%0)\n\t"
>>>>  		     : : "r"(p) : "memory");
>>>> +#elif defined(__aarch64__)
>>>> +	/*
>>>> +	 * Dirty the cache line with a store. As mem_flush() sweeps
>>>> +	 * the full test buffer (sized larger than the SLC), cache pressure
>>>> +	 * evicts lines from the SLC via LRU replacement.
>>>> +	 */
>>>> +	asm volatile("strb wzr, [%0]\n\t"
>>>> +		     : : "r"(p) : "memory");
>>>>  #endif
>>
>> One more thing that occurred to me is that if this is intended to evict all existing data in the
>> cache then it would require that the cache portions bitmap for the control group (PARTID) in use is
>> set to all 1s. E.g. 'L3:0=0xffff'. Otherwise, you may not affect the whole cache. This likely means
>> that the cl_flush() function isn't the right abstraction for MPAM and the test needs a bit of
>> restructuring to get this to fit in elegantly. Similarly, to the limbo handler in resctrl you could
>> then check the llc_occupancy() to check it's under a "low enough" threshold.
>>
>> Thanks,
>>
>> Ben
>>
> 
> Hi Ben,
> 
> Thanks for the feedback. I checked the code and ran some tests.
> You're right, my implementation writes into the benchmark's own buffer using
> the same PARRID/PMG, and the buffer isn't always larger than the SLC.
> 
> I can't claim that it produces an eviction sweep 100%.
> 
> I think what are want to do is to check whether reducing a group's cache
> allocation causes more cache misses, thus the data left in cache from the
> previous allocation must not affect the next measurement. That is also
> why I want to reuse the concept of Intel's test with CLFLUSH before
> warming the buffer under the new allocation.
> 
> I'm thinking maybe the assumption can't be achieve on ARM, I ran tests to
> measure occupancy before and after each preparation method.
> 
> I tried this patch's implement, and "DC CIVAC" since I think it can affectively
> invalidate cacheline without throwing old data away, which should left
> occupancy almost unchanged.
> And one more method with a separate large buffer in another group.
> 
> The result turns out like the following
> 
> Preparation                     Before (MiB)   After (MiB)
> DC CIVAC + DSB SY                     51.19         50.47
> zero-byte stores + DSB SY          53.12         56.43
> Separate-buffer pressure             53.25          7.14
> 
> 
> The current method increased the benchmark group's occupancy instead of
> reducing it. "DC CIVAC" left occupancy almost unchanged.
> The separate buffer method reduced occupancy very much, but still left data
> behind.
> 
> It makes me think we should reconsider the test method. I think the goal is
> to check whether the MPAM allocation limit works, clearing the cache is only
> how the Intel RDT test prepares for that check.
> 
> How about we set a group's mask before its worker initialize the buffer and

We'll still need to make sure that the PARTID used for the test hasn't got high occupancy in the
cache before running the benchmark.

> then run sustained cache traffic and measure occupancy after it settles?

I assume the occupancy is measured via resctrl, llc_occupancy.

> Maybe compare full, half and quarter masks to see whether the allocation limits take effect.
> 
> Does that sound like a useful direction for MPAM test for you ?

Yes, I think so.

Would it end up like this?

1. Choose a test control group and ensure that it doesn't have high cache occupancy using llc_occupancy
(If it does have high cache occupancy then clean it. Probably by using separate buffer with a
separate control group)
2. Configure the L3 cache bitmap for the test control group
3. Run a benchmark
4. Check that the llc_occupancy is as expected
5. Repeat 1-4 with different cache bitmaps.

However, it doesn't sound specific to MPAM but more like a general test for the cache portion
bitmap. Possibly it can be a separate cross-architecture resctrl selftest that compliments the
(somewhat) intel specific cat_test. (There isn't a platform independent way of measuring slc cache
misses on arm64.) This depends of the resctrl selftest maintainers view.

Thanks,

Ben

> 
> Best regards,
> Richard Cheng.
> 
> 
>  
>>>
>>> Isn't this cl_flush() used without changing the resctrl control and monitor group (PARTID/PMG)?
>>> Hence, I expect you are ending up making the cache full of data associated with the identifiers that
>>> the benchmark runs with. Is that the case?
>>>
>>> I'm also unclear how this the cat_test will detect any performance differences on arm/MPAM as the
>>> perf events would need to specific to the system level cache implementation.
>>>
>>> Thanks,
>>>
>>> Ben
>>>
>>>
>>>
>>>>  }
>>>>  
>>>
>>

