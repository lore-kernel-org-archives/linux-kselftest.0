Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218909;
	b=slYHjwAPDAI8BFiaV8kH6o7GXtVk2PBfKoU0so29hd2ZZo/wDWetZiMMylCFkgwF1TnU
	 qF6lV/SBa/dG89nuPwtsr8URFC4D5+Qk+hPL15WWScy1nIbLgePYgMNt0AQe6lNNMPZm7
	 miC5/WtwZrqeTk+aI1F1Y+HLsxkz+u4VHvEX7WTFdO3tBgdx/ZqFjTVjQ+7b9tuHvKsv/
	 tXu+MV+dvXp6lcTsgPWZml0FGqS9QO32KRuRmg9di9nmd5ERn+JfRxq+I2FbKEnijQ5Pr
	 plq36dx55lfL/t1DrTelnAURXE7PulYR2kR4fl2/TRSAM6drphgMegaCPFYWXtHwZ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218909;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5/Dm3qRWDiPBxquv22fVqd+GI59HmXvVzoE7bjCSxF0=;
	b=kn4xnodHxGYnGjeHxwqGCS40nBS7/NnxBe9rYtKSeURriVoQNNlrRO23y/WZg5XMKvFK
	 4/rvxChEFm/FXMssfV+8MYcXfMJl3sV9x1iqaD2j3n3bcuZgCYVO5f64v4ZzrjQO71PMT
	 rD7rMjl4TVhEk8l2Z0SNwndWGYKwj1CoeNJ3JyiIVqYwoLzS5oJB5T1+hv7bAyQVOEzUb
	 MXv+k9l09iETRjbl1Qn+2vEOT5uVjpgV1Rn+NV2IGC/IL/CGqMLVEYfmCi+UzPQHPUmR9
	 qhTdbhQo/LOJN1WAxXfuVVFdiFTY44NRuNML7YkMnzLm68HhTx7jYbZKUWYJy3PJAqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A7v3yNUM;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A52606EEA5;
	Mon,  9 Nov 2026 10:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A52606EEA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A7v3yNUM
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81A961516;
	Mon,  9 Nov 2026 02:08:24 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F3C23F632;
	Mon,  9 Nov 2026 02:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794218907; bh=I4gIQb80IPtOlJ8Yp58WzNljIdvuCAt5yMM2ezIQYkE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A7v3yNUMQ5f86KrzeekZ3BcViwJxX2PY1I5ioJrpKAP6qY6rwiUix5PVH9Cea9sgk
	 Ej/PqdoEHfp2YoLv4raERcNJU/mNtUBw05wnDyQ2JAI+0rE+PSK9u3NiMAF3lCmbhc
	 BnjC8oJPPXLna/A2kQBdXpLdLVxlrskISanWHq+A=
Message-ID: <89549a38-4764-466b-b66e-98bab801fefc@arm.com>
Date: Sat, 14 Nov 2026 03:16:37 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 1/2] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
To: Reinette Chatre <reinette.chatre@intel.com>,
 Richard Cheng <icheng@nvidia.com>
Cc: tony.luck@intel.com, x86@kernel.org, shuah@kernel.org,
 fenghuay@nvidia.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kaihengf@nvidia.com, kobak@nvidia.com,
 newtonl@nvidia.com, kristinc@nvidia.com
References: <20261012074729.40042-1-icheng@nvidia.com>
 <20261012074729.40042-2-icheng@nvidia.com>
 <847af89d-7b79-44b4-8273-243dfb51ef5e@arm.com>
 <9cccea63-397c-4913-95bc-eed38f0ebd66@arm.com> <aurOz7iGKInyjddW@MWDK4CY14F>
 <b94aa5e5-a4ab-4b61-a864-d10ff1ff2b63@arm.com> <auxM9hVAgp61Qbgv@MWDK4CY14F>
 <c58c397e-26e4-4866-be80-59d9bd861654@arm.com>
 <808923a4-0a6e-4d8f-8ace-d3573aa125e8@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <808923a4-0a6e-4d8f-8ace-d3573aa125e8@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette and Richard,

On 07/11/2026 00:29, Reinette Chatre wrote:
> Hi Ben and Richard,
> 
> On 11/6/26 7:53 AM, Ben Horgan wrote:
>> Hi Richard,
>>
>> On 05/11/2026 09:41, Richard Cheng wrote:
>>> On Wed, Nov 04, 2026 at 05:09:28PM +0800, Ben Horgan wrote:
>>>> Hi Richard,
>>>>
>>>> On 04/11/2026 06:43, Richard Cheng wrote:
>>>>> On Wed, Oct 21, 2026 at 10:55:35AM +0800, Ben Horgan wrote:
>>>>>> Hi Richard,
>>>>>>
>>>>>> On 20/10/2026 17:30, Ben Horgan wrote:
>>>>>>> Hi Richard,
>>>>>>>
>>>>>>> Thanks for having a look at the arm64 side of the resctrl selftests. That hasn't had much love but
>>>>>>> it would be good to have them working properly.
>>>>>>>
>>>>>>> On 12/10/2026 08:47, Richard Cheng wrote:
>>>>>>>> cl_flush() and sb() compile to empty functions on aarch64, making
>>>>>>>> mem_flush() a silent no-op and leaving CMT/CAT tests operating on
>>>>>>>> unflushed state.
>>>>>>>>
>>>>>>>> Add "dsb sy" for sb(), ARM requires a DSB whose access type covers both
>>>>>>>> loads and stores.
>>>>>>>
>>>>>>> I guess this is referring to the synchronization required for the cache maintenance instruction but
>>>>>>> that's not what you are using in this patch.
>>>>>>>
>>>>>>>>
>>>>>>>> For cl_flush(), "dc civac" only reaches the Point of Coherency, on
>>>>>>>> ARM MPAM systems the SLC lies past the PoC and may be a NOP on coherent
>>>>>>>> platforms. Instead, dirty each cacheline with a store so that
>>>>>>>> mem_flush's full-buffer sweep evicts lines from the SLC via LRU
>>>>>>>> pressure.
>>>>>>>>
>>>>>>>> Signed-off-by: Richard Cheng <icheng@nvidia.com>
>>>>>>>> ---
>>>>>>>>  tools/testing/selftests/resctrl/fill_buf.c | 11 +++++++++++
>>>>>>>>  1 file changed, 11 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
>>>>>>>> index b9fa7968cd6e..eae0262fe265 100644
>>>>>>>> --- a/tools/testing/selftests/resctrl/fill_buf.c
>>>>>>>> +++ b/tools/testing/selftests/resctrl/fill_buf.c
>>>>>>>> @@ -27,6 +27,9 @@ static void sb(void)
>>>>>>>>  #if defined(__i386) || defined(__x86_64)
>>>>>>>>  	asm volatile("sfence\n\t"
>>>>>>>>  		     : : : "memory");
>>>>>>>> +#elif defined(__aarch64__)
>>>>>>>> +	asm volatile("dsb sy\n\t"
>>>>>>>> +		     : : : "memory");
>>>>>>>>  #endif
>>>>>>>>  }
>>>>>>>>  
>>>>>>>> @@ -35,6 +38,14 @@ static void cl_flush(void *p)
>>>>>>>>  #if defined(__i386) || defined(__x86_64)
>>>>>>>>  	asm volatile("clflush (%0)\n\t"
>>>>>>>>  		     : : "r"(p) : "memory");
>>>>>>>> +#elif defined(__aarch64__)
>>>>>>>> +	/*
>>>>>>>> +	 * Dirty the cache line with a store. As mem_flush() sweeps
>>>>>>>> +	 * the full test buffer (sized larger than the SLC), cache pressure
>>>>>>>> +	 * evicts lines from the SLC via LRU replacement.
>>>>>>>> +	 */
>>>>>>>> +	asm volatile("strb wzr, [%0]\n\t"
>>>>>>>> +		     : : "r"(p) : "memory");
>>>>>>>>  #endif
>>>>>>
>>>>>> One more thing that occurred to me is that if this is intended to evict all existing data in the
>>>>>> cache then it would require that the cache portions bitmap for the control group (PARTID) in use is
>>>>>> set to all 1s. E.g. 'L3:0=0xffff'. Otherwise, you may not affect the whole cache. This likely means
>>>>>> that the cl_flush() function isn't the right abstraction for MPAM and the test needs a bit of
>>>>>> restructuring to get this to fit in elegantly. Similarly, to the limbo handler in resctrl you could
>>>>>> then check the llc_occupancy() to check it's under a "low enough" threshold.
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Ben
>>>>>>
>>>>>
>>>>> Hi Ben,
>>>>>
>>>>> Thanks for the feedback. I checked the code and ran some tests.
>>>>> You're right, my implementation writes into the benchmark's own buffer using
>>>>> the same PARRID/PMG, and the buffer isn't always larger than the SLC.
>>>>>
>>>>> I can't claim that it produces an eviction sweep 100%.
>>>>>
>>>>> I think what are want to do is to check whether reducing a group's cache
>>>>> allocation causes more cache misses, thus the data left in cache from the
>>>>> previous allocation must not affect the next measurement. That is also
>>>>> why I want to reuse the concept of Intel's test with CLFLUSH before
>>>>> warming the buffer under the new allocation.
>>>>>
>>>>> I'm thinking maybe the assumption can't be achieve on ARM, I ran tests to
>>>>> measure occupancy before and after each preparation method.
>>>>>
>>>>> I tried this patch's implement, and "DC CIVAC" since I think it can affectively
>>>>> invalidate cacheline without throwing old data away, which should left
>>>>> occupancy almost unchanged.
>>>>> And one more method with a separate large buffer in another group.
>>>>>
>>>>> The result turns out like the following
>>>>>
>>>>> Preparation                     Before (MiB)   After (MiB)
>>>>> DC CIVAC + DSB SY                     51.19         50.47
>>>>> zero-byte stores + DSB SY          53.12         56.43
>>>>> Separate-buffer pressure             53.25          7.14
>>>>>
>>>>>
>>>>> The current method increased the benchmark group's occupancy instead of
>>>>> reducing it. "DC CIVAC" left occupancy almost unchanged.
>>>>> The separate buffer method reduced occupancy very much, but still left data
>>>>> behind.
>>>>>
>>>>> It makes me think we should reconsider the test method. I think the goal is
>>>>> to check whether the MPAM allocation limit works, clearing the cache is only
>>>>> how the Intel RDT test prepares for that check.
>>>>>
>>>>> How about we set a group's mask before its worker initialize the buffer and
>>>>
>>>> We'll still need to make sure that the PARTID used for the test hasn't got high occupancy in the
>>>> cache before running the benchmark.
>>>>
>>>>> then run sustained cache traffic and measure occupancy after it settles?
>>>>
>>>> I assume the occupancy is measured via resctrl, llc_occupancy.
>>>>
>>>>> Maybe compare full, half and quarter masks to see whether the allocation limits take effect.
>>>>>
>>>>> Does that sound like a useful direction for MPAM test for you ?
>>>>
>>>> Yes, I think so.
>>>>
>>>> Would it end up like this?
>>>>
>>>> 1. Choose a test control group and ensure that it doesn't have high cache occupancy using llc_occupancy
>>>> (If it does have high cache occupancy then clean it. Probably by using separate buffer with a
>>>> separate control group)
>>>> 2. Configure the L3 cache bitmap for the test control group
>>>> 3. Run a benchmark
>>>> 4. Check that the llc_occupancy is as expected
>>>> 5. Repeat 1-4 with different cache bitmaps.
>>>>
>>>> However, it doesn't sound specific to MPAM but more like a general test for the cache portion
>>>> bitmap. Possibly it can be a separate cross-architecture resctrl selftest that compliments the
>>>> (somewhat) intel specific cat_test. (There isn't a platform independent way of measuring slc cache
>>>> misses on arm64.) This depends of the resctrl selftest maintainers view.
>>>>
>>>> Thanks,
>>>>
>>>> Ben
>>>>
>>>
>>> Hi Ben,
>>> I like the idea to make it a general test for cache on different arch,
>>> but yeah let's leave it for resctrl's maintainers to decide, I do not know other
>>> arch's cache topology and such so what I'm designing is very likely to overfit on ARM64.
>>>
>>> Anyway, per your suggestion, I tried a few experiment and came up with the approach
>>> like the following, and still have some points needs to discuss with you if you don't mind.
>>>
>>> We'll reuse one test group and buffer across tests for different bitmaps,
>>> and a separate group and buffer for sweeping.
>>>
>>> 1. Set up. Create the test and sweep group, assign workers, init buffer, give the sweep group the full cache mask.
>>> 2. Prepare before each mask. Keep the test worker stopped. Run the sweep worker and check "llc_occupancy" repeately,
>>> until it stays below a starting threshold, I set it as 4KB on my testing machine, we can discuss about it
>>
>> A starting threshold of 4KB on a machine with 164MB cache seems lower than required. Assuming, the
>> maximum number of cache portions supported by resctrl, 32, then each portion is about 5MB, and so if
>> you are measuring occupancy to check if the cache portion bitmap has the desired effect then 4KB is
>> in the noise.
>>
>>> since the value should fit on different machine. And we'll put a timeout for cleanup time.
>>> 3. Stop the sweep and apply cache maskWarmup test workload for 3 sec
>>> 4. Run the workloadRead llc_occupancy and see if it meets the expected value ( that's what we need to discuss )
>>>
>>> So on my machine it has a 164 MB share cache, no matter what cache masks I use, the cache occupancy won't be 100%,
>>> even I use some mask like 0001, 8000. I'm not sure what kind of expectation should we apply on the test,
>>> just not exceeding the rule's enforcement is enough ? or should it exceed certain amount of usage ?
>>
>>
>> I'd say just sufficient precision to be able distinguish between a cache bitmap with n bit set and
>> one with n + 1 bits.
>>
>> Does checking which of these intervals the occupancy in give you a reproducible way of determining
>> how many bits are set? Hopefully overshoot can be sized to make this reliable.
>>
>> (0, size/num_bits + overshoot),
>> (size/num_bits + overshoot, 2*size/num_bits + overshoot),
>> (2*size/num_bits + overshoot, 3*size/num_bits + overshoot),
>> ...
>> ((num_bits - 1)*size/num_bits + overshoot, size)
>>
>> As you mention above, making this reliable across architectures and even across arm platforms means
>> that you can't be just be looking for precise numbers or exactly repeatable behaviour.
>>
> Using benchmarks as a measure of resctrl health keeps giving problems due to the differences
> between systems. I cannot recall these tests failing because of an issue in resctrl self, which
> they are intended to test, yet they do fail and then need to be "tweaked" to accommodate some
> new architectural nuance that has nothing to do with the resctrl subsystem. For example,
> 
> 	https://lore.kernel.org/all/6de4da5486354c0f25fef0d194956470cb744041.1775266384.git.reinette.chatre@intel.com/
> 
> Please take a moment and consider what you want to achieve with these tests: what is this
> intended to test? In a way the benchmarks seem to be testing the hardware capabilities and useful
> to hardware validation folks more so than testing resctrl subsystem in a useful way to
> kernel development. 
> 
> More specifically, if this test "fails" - is there *anything* we can do about
> it that does not involve "fixing" the test? 
> 
> In the end I find these performance tests valuable in how they interact with the
> resctrl filesystem in different ways, not the actual performance values returned by the tests.

I think the actual performance testing can be left to those testing and
evaluating particular platforms.

> > Of course it is up to you, I am just concerned that you may end up
(as I have) spending a lot
> of effort on work that does not end up being a deterministic measurement of resctrl health yet
> is used to produce a "pass" or "fail" verdict about resctrl subsystem health.

Indeed, I don't think any of us have the time to chase tuning parameters
for a test. Especially, one that runs on multiple architectures.

> 
> If you do end up using a benchmark I'd suggest to make the checks as forgiving as
> possible. For example, instead of checking something like "LLC occupancy needs to be
> X when bitmap is Y" it should check something like "LLC occupancy when bitmap is all ones
> is larger than LLC occupancy when only half of bitmap is ones".

Do you think it's too strong to say that a bitmap with n + 1 bits set
has higher occupancy than one with n bits set? I think it has slightly
more utility in that all bits of the bitmap are plumbed down to a
working control but I'm ok with a weaker check if a stronger check will
just be problematic and maintenance heavy.

> 
> I find work like
> 
> 	https://lore.kernel.org/all/20260810095124.32244-1-icheng@nvidia.com/
> 
> to be valuable as deterministic measurements of resctrl health.

Yes, they do look useful.

Thanks,

Ben

> 
> Reinette

