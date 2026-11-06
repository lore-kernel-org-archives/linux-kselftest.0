Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980438;
	b=H878eAOVTvAk0OQ/njeoD0cryl2usZ9+rowy+tqnbNu41kZA0PNM4blA8xuJgc+RWinS
	 VSqTelKCmtI0ORP+Wk30WTmXBNLsBWo6Pm1rC12zFsN8e+TSUPQRWouvx4ZwVN/yQOoOz
	 Kvw8een5Un9KwVlOsSpcgUl0MoD0lMkUjDkZMxRW5lDc9vnC28xIJDPczxKB3S73rd4Cj
	 U16qzEB3hci3MdBbKLcO4AhPdMddSwlY2iZTF0iyRg/7yoNc49EhlWI8G8LKJpwZTU6RT
	 ifH+7WIJuMaGCXg2fnN/b6FksNuxkK5HTkx2R0GXnn588LzK+zg2dGsYuf4T2vtmzAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980438;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DPOMwTSvbAo1LAqVB4mAhcsurb7daK3VuegSC4h7gt0=;
	b=QM3xGw4Ujmj2sHyYYxduG8S1hLvZFkO2U6Snv5A1iO+cdLoGd5kydpfGqRBbzZ5pxZa1
	 slVDXn/rlPIabGBA1V7C5qqYSDXyk9l5cK5jUsf9u7lLO++J3SbqR2R9DGC5fO7g9aatk
	 /3UWg5nPA+H22lrpNhr1wgBNEy6En8o9yjJvL83ze85zbI3GkQXFcAMAFZfLoxrL2bTwC
	 23u75jOkRHvgYTiG24eYJnQdlAE/1ELGNYN76DbrRey/Ey5H3z8VR75HCKnQPt3Jj28h6
	 /GTNTo5RxbOuYU1IevmIDHqTn02Q0LMLv0kyfAVZWildg2rFkv6Hj2XwhCrtViOnmpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LRz9Rsg+;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B56B606A326;
	Fri,  6 Nov 2026 15:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B56B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LRz9Rsg+
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 263AA1650;
	Fri,  6 Nov 2026 07:53:53 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA1663F632;
	Fri,  6 Nov 2026 07:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793980436; bh=lcGq0yAuWCPdJWtJp7e7QzyKs8GOrg+9krik9Z5TWOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LRz9Rsg+CClLDbSj9N8YmKiWl+6uCwcSHo5pYgvqa4rKxcABe9yCflvMIm03x7c4e
	 sUwPlUg1GJaCWiNFHkT3tH5Qg3q5SI+N7gBKW+kOkRAUGJnNQjOQWnViVANh8qJ/tv
	 gelAftaYfM6xV4Gc0Q2YUmz5Ao3eu9ecMzWq5VFI=
Message-ID: <c58c397e-26e4-4866-be80-59d9bd861654@arm.com>
Date: Fri, 6 Nov 2026 15:53:52 +0000
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
 <b94aa5e5-a4ab-4b61-a864-d10ff1ff2b63@arm.com> <auxM9hVAgp61Qbgv@MWDK4CY14F>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <auxM9hVAgp61Qbgv@MWDK4CY14F>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Richard,

On 05/11/2026 09:41, Richard Cheng wrote:
> On Wed, Nov 04, 2026 at 05:09:28PM +0800, Ben Horgan wrote:
>> Hi Richard,
>>
>> On 04/11/2026 06:43, Richard Cheng wrote:
>>> On Wed, Oct 21, 2026 at 10:55:35AM +0800, Ben Horgan wrote:
>>>> Hi Richard,
>>>>
>>>> On 20/10/2026 17:30, Ben Horgan wrote:
>>>>> Hi Richard,
>>>>>
>>>>> Thanks for having a look at the arm64 side of the resctrl selftests. That hasn't had much love but
>>>>> it would be good to have them working properly.
>>>>>
>>>>> On 12/10/2026 08:47, Richard Cheng wrote:
>>>>>> cl_flush() and sb() compile to empty functions on aarch64, making
>>>>>> mem_flush() a silent no-op and leaving CMT/CAT tests operating on
>>>>>> unflushed state.
>>>>>>
>>>>>> Add "dsb sy" for sb(), ARM requires a DSB whose access type covers both
>>>>>> loads and stores.
>>>>>
>>>>> I guess this is referring to the synchronization required for the cache maintenance instruction but
>>>>> that's not what you are using in this patch.
>>>>>
>>>>>>
>>>>>> For cl_flush(), "dc civac" only reaches the Point of Coherency, on
>>>>>> ARM MPAM systems the SLC lies past the PoC and may be a NOP on coherent
>>>>>> platforms. Instead, dirty each cacheline with a store so that
>>>>>> mem_flush's full-buffer sweep evicts lines from the SLC via LRU
>>>>>> pressure.
>>>>>>
>>>>>> Signed-off-by: Richard Cheng <icheng@nvidia.com>
>>>>>> ---
>>>>>>  tools/testing/selftests/resctrl/fill_buf.c | 11 +++++++++++
>>>>>>  1 file changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
>>>>>> index b9fa7968cd6e..eae0262fe265 100644
>>>>>> --- a/tools/testing/selftests/resctrl/fill_buf.c
>>>>>> +++ b/tools/testing/selftests/resctrl/fill_buf.c
>>>>>> @@ -27,6 +27,9 @@ static void sb(void)
>>>>>>  #if defined(__i386) || defined(__x86_64)
>>>>>>  	asm volatile("sfence\n\t"
>>>>>>  		     : : : "memory");
>>>>>> +#elif defined(__aarch64__)
>>>>>> +	asm volatile("dsb sy\n\t"
>>>>>> +		     : : : "memory");
>>>>>>  #endif
>>>>>>  }
>>>>>>  
>>>>>> @@ -35,6 +38,14 @@ static void cl_flush(void *p)
>>>>>>  #if defined(__i386) || defined(__x86_64)
>>>>>>  	asm volatile("clflush (%0)\n\t"
>>>>>>  		     : : "r"(p) : "memory");
>>>>>> +#elif defined(__aarch64__)
>>>>>> +	/*
>>>>>> +	 * Dirty the cache line with a store. As mem_flush() sweeps
>>>>>> +	 * the full test buffer (sized larger than the SLC), cache pressure
>>>>>> +	 * evicts lines from the SLC via LRU replacement.
>>>>>> +	 */
>>>>>> +	asm volatile("strb wzr, [%0]\n\t"
>>>>>> +		     : : "r"(p) : "memory");
>>>>>>  #endif
>>>>
>>>> One more thing that occurred to me is that if this is intended to evict all existing data in the
>>>> cache then it would require that the cache portions bitmap for the control group (PARTID) in use is
>>>> set to all 1s. E.g. 'L3:0=0xffff'. Otherwise, you may not affect the whole cache. This likely means
>>>> that the cl_flush() function isn't the right abstraction for MPAM and the test needs a bit of
>>>> restructuring to get this to fit in elegantly. Similarly, to the limbo handler in resctrl you could
>>>> then check the llc_occupancy() to check it's under a "low enough" threshold.
>>>>
>>>> Thanks,
>>>>
>>>> Ben
>>>>
>>>
>>> Hi Ben,
>>>
>>> Thanks for the feedback. I checked the code and ran some tests.
>>> You're right, my implementation writes into the benchmark's own buffer using
>>> the same PARRID/PMG, and the buffer isn't always larger than the SLC.
>>>
>>> I can't claim that it produces an eviction sweep 100%.
>>>
>>> I think what are want to do is to check whether reducing a group's cache
>>> allocation causes more cache misses, thus the data left in cache from the
>>> previous allocation must not affect the next measurement. That is also
>>> why I want to reuse the concept of Intel's test with CLFLUSH before
>>> warming the buffer under the new allocation.
>>>
>>> I'm thinking maybe the assumption can't be achieve on ARM, I ran tests to
>>> measure occupancy before and after each preparation method.
>>>
>>> I tried this patch's implement, and "DC CIVAC" since I think it can affectively
>>> invalidate cacheline without throwing old data away, which should left
>>> occupancy almost unchanged.
>>> And one more method with a separate large buffer in another group.
>>>
>>> The result turns out like the following
>>>
>>> Preparation                     Before (MiB)   After (MiB)
>>> DC CIVAC + DSB SY                     51.19         50.47
>>> zero-byte stores + DSB SY          53.12         56.43
>>> Separate-buffer pressure             53.25          7.14
>>>
>>>
>>> The current method increased the benchmark group's occupancy instead of
>>> reducing it. "DC CIVAC" left occupancy almost unchanged.
>>> The separate buffer method reduced occupancy very much, but still left data
>>> behind.
>>>
>>> It makes me think we should reconsider the test method. I think the goal is
>>> to check whether the MPAM allocation limit works, clearing the cache is only
>>> how the Intel RDT test prepares for that check.
>>>
>>> How about we set a group's mask before its worker initialize the buffer and
>>
>> We'll still need to make sure that the PARTID used for the test hasn't got high occupancy in the
>> cache before running the benchmark.
>>
>>> then run sustained cache traffic and measure occupancy after it settles?
>>
>> I assume the occupancy is measured via resctrl, llc_occupancy.
>>
>>> Maybe compare full, half and quarter masks to see whether the allocation limits take effect.
>>>
>>> Does that sound like a useful direction for MPAM test for you ?
>>
>> Yes, I think so.
>>
>> Would it end up like this?
>>
>> 1. Choose a test control group and ensure that it doesn't have high cache occupancy using llc_occupancy
>> (If it does have high cache occupancy then clean it. Probably by using separate buffer with a
>> separate control group)
>> 2. Configure the L3 cache bitmap for the test control group
>> 3. Run a benchmark
>> 4. Check that the llc_occupancy is as expected
>> 5. Repeat 1-4 with different cache bitmaps.
>>
>> However, it doesn't sound specific to MPAM but more like a general test for the cache portion
>> bitmap. Possibly it can be a separate cross-architecture resctrl selftest that compliments the
>> (somewhat) intel specific cat_test. (There isn't a platform independent way of measuring slc cache
>> misses on arm64.) This depends of the resctrl selftest maintainers view.
>>
>> Thanks,
>>
>> Ben
>>
> 
> Hi Ben,
> I like the idea to make it a general test for cache on different arch,
> but yeah let's leave it for resctrl's maintainers to decide, I do not know other
> arch's cache topology and such so what I'm designing is very likely to overfit on ARM64.
> 
> Anyway, per your suggestion, I tried a few experiment and came up with the approach
> like the following, and still have some points needs to discuss with you if you don't mind.
> 
> We'll reuse one test group and buffer across tests for different bitmaps,
> and a separate group and buffer for sweeping.
> 
> 1. Set up. Create the test and sweep group, assign workers, init buffer, give the sweep group the full cache mask.
> 2. Prepare before each mask. Keep the test worker stopped. Run the sweep worker and check "llc_occupancy" repeately,
> until it stays below a starting threshold, I set it as 4KB on my testing machine, we can discuss about it

A starting threshold of 4KB on a machine with 164MB cache seems lower than required. Assuming, the
maximum number of cache portions supported by resctrl, 32, then each portion is about 5MB, and so if
you are measuring occupancy to check if the cache portion bitmap has the desired effect then 4KB is
in the noise.

> since the value should fit on different machine. And we'll put a timeout for cleanup time.
> 3. Stop the sweep and apply cache maskWarmup test workload for 3 sec
> 4. Run the workloadRead llc_occupancy and see if it meets the expected value ( that's what we need to discuss )
> 
> So on my machine it has a 164 MB share cache, no matter what cache masks I use, the cache occupancy won't be 100%,
> even I use some mask like 0001, 8000. I'm not sure what kind of expectation should we apply on the test,
> just not exceeding the rule's enforcement is enough ? or should it exceed certain amount of usage ?


I'd say just sufficient precision to be able distinguish between a cache bitmap with n bit set and
one with n + 1 bits.

Does checking which of these intervals the occupancy in give you a reproducible way of determining
how many bits are set? Hopefully overshoot can be sized to make this reliable.

(0, size/num_bits + overshoot),
(size/num_bits + overshoot, 2*size/num_bits + overshoot),
(2*size/num_bits + overshoot, 3*size/num_bits + overshoot),
...
((num_bits - 1)*size/num_bits + overshoot, size)

As you mention above, making this reliable across architectures and even across arm platforms means
that you can't be just be looking for precise numbers or exactly repeatable behaviour.

Thanks,

Ben

> And for the sweep method, even sweep like 100 times with another buffer, we can't gaurantee to evict all of the old data from the cache,
> so I came up with another idea that everytime we make a new test, we use a new buffer and a new test group,
> leaving old data in the old group.
> 
> However, sometimes non-zero reading still occurs, and it might happen more frequently on smaller machine,
> so I think your proposed sweeping approach is better.
> 
> I hope this is getting closer to a desired design before I implement v6.
> 
> Best regards,
> Richard Cheng.
> 
> 
> 
> 
>  
>>>
>>> Best regards,
>>> Richard Cheng.
>>>
>>>
>>>  
>>>>>
>>>>> Isn't this cl_flush() used without changing the resctrl control and monitor group (PARTID/PMG)?
>>>>> Hence, I expect you are ending up making the cache full of data associated with the identifiers that
>>>>> the benchmark runs with. Is that the case?
>>>>>
>>>>> I'm also unclear how this the cat_test will detect any performance differences on arm/MPAM as the
>>>>> perf events would need to specific to the system level cache implementation.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Ben
>>>>>
>>>>>
>>>>>
>>>>>>  }
>>>>>>  
>>>>>
>>>>
>>

