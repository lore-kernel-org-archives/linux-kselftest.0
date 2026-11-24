Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522548;
	b=K2ILYboddXwa2NG0Y1XbNPclfqPSfXQqytScnOkd+qV5sUe6/8cHd7vI5tbvMz9WWk9z
	 Hb9bkwnyVzBw00DlwGOINN/mh7NrYYTb6RchEI4DU4Dq9+hT330sGpBcyu+n2WXN85noA
	 BKa8rFCsk4cxOirp2vZfrBiKgxlpxFVcgZfZcjTpqQW3dyKlAKihgDp0d+9THq8O9fwi/
	 zL+TEFLIufMZVqWNpi+kk2vTRAPDzs3IIOHJG747PSvPdKoojbqzE+WVOBwNlxhfXnxH2
	 gYNgX8rXLjkhxwjn1ZcfnPlU3XFbQdn5freNXmnmFLdyeUzfdW1q9CoL4MGtahFmOoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522548;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Fqs42eOJWhI+GEsKcjOUzPIq0cOL4hI6K+mz16U0pw0=;
	b=eQJsY0ycT9vhZneh3oVsh3VKm+LCWMNEdruhLalnsmPAoK56aR0RXPC6iDr22q6KM6UG
	 D2/jBs+e0HRYdm4kvMm+IJovvbrqwYkqC9zSaP7657StnXNsz87JRDeTVY0MbHoAccnVI
	 DymuMiDxDtJYseLmTMGBO1XCjk2NAb9LZO+liGpBd9MbP8syq4yF18Z2MPC7+Gz+wZLxA
	 cVWxhuliq9hGS5jfZLmoctk7Barh4MsdxI4wENjTsOLQuwmO257i/3+/sa3wnQZcng//o
	 4TVWbtOUOREtgSFogMYr0s0FtJQIDtx44sj/lCrTjI2WQQKcFpC5qC8P1HVyPA7H5Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qU0Z0Zdk;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C9C606A321;
	Tue, 24 Nov 2026 12:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C9C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qU0Z0Zdk
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25051339;
	Tue, 24 Nov 2026 04:15:44 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C32513F632;
	Tue, 24 Nov 2026 04:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795522547; bh=K1W3F7Nfa2+2LcR8xwPu9zRom8pKoX57P29aM2TWaVQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qU0Z0ZdkstWz4sZHzsIBXEhzT7NM1se6btA/yAGf28pcP//cu3E0AP1MxlfeCDN4V
	 wQpu3Fg3wRiX+mnKZtFl2Gr3u/cpTbN04lws+/7C9yTaT4MRQI3qUCQYxWd0NGTx20
	 Ccdm9Pcxz3yK6Ug89bOSAHh31ZvDbVohvwLJk50Q=
Message-ID: <61f15f41-49c4-435c-9ce1-26f1986f7547@arm.com>
Date: Tue, 24 Nov 2026 12:15:43 +0000
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
Cc: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 x86@kernel.org, shuah@kernel.org, fenghuay@nvidia.com, Dave.Martin@arm.com,
 james.morse@arm.com, babu.moger@amd.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kaihengf@nvidia.com, kobak@nvidia.com,
 newtonl@nvidia.com, kristinc@nvidia.com
References: <aurOz7iGKInyjddW@MWDK4CY14F>
 <b94aa5e5-a4ab-4b61-a864-d10ff1ff2b63@arm.com> <auxM9hVAgp61Qbgv@MWDK4CY14F>
 <c58c397e-26e4-4866-be80-59d9bd861654@arm.com>
 <808923a4-0a6e-4d8f-8ace-d3573aa125e8@intel.com>
 <89549a38-4764-466b-b66e-98bab801fefc@arm.com>
 <0583dad3-f761-48d5-a9a2-f2ad39567a6b@intel.com>
 <7501303c-d304-47d4-8150-b1efc8554d36@arm.com> <avhZnuz2caJWIfLo@MWDK4CY14F>
 <f609e8a4-00bc-471f-90b2-1b6ef3154adf@arm.com> <awATfnP93NxROsJa@MWDK4CY14F>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <awATfnP93NxROsJa@MWDK4CY14F>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Richard,

On 20/11/2026 09:39, Richard Cheng wrote:
> On Mon, Nov 16, 2026 at 04:53:03PM +0800, Ben Horgan wrote:
>> Hi Richard,
>>
>> On 14/11/2026 12:59, Richard Cheng wrote:
>>> On Tue, Nov 10, 2026 at 12:35:48PM +0800, Ben Horgan wrote:
>>>> Hi Reinette, Richard,
>>>>
>>>> On 09/11/2026 17:01, Reinette Chatre wrote:
>>>>> Hi Ben,
>>>>>
>>>>> On 11/13/26 7:16 PM, Ben Horgan wrote:
>>>>>> On 07/11/2026 00:29, Reinette Chatre wrote:
>>>>>
>>>>> ... 
>>>>>>>
>>>>>>> If you do end up using a benchmark I'd suggest to make the checks as forgiving as
>>>>>>> possible. For example, instead of checking something like "LLC occupancy needs to be
>>>>>>> X when bitmap is Y" it should check something like "LLC occupancy when bitmap is all ones
>>>>>>> is larger than LLC occupancy when only half of bitmap is ones".
>>>>>>
>>>>>> Do you think it's too strong to say that a bitmap with n + 1 bits set
>>>>>> has higher occupancy than one with n bits set? I think it has slightly
>>>>>> more utility in that all bits of the bitmap are plumbed down to a
>>>>>> working control but I'm ok with a weaker check if a stronger check will
>>>>>> just be problematic and maintenance heavy.
>>>>>
>>>>> My comment was motivated by the recent change I needed to make to the CAT test
>>>>> that uses cache misses measured via perf instead of cache occupancy. Originally
>>>>> this test incremented the bitmap with one at each cycle but incrementing it with
>>>>> two proved to be more robust.
>>>>>
>>>>> What you are proposing sounds more like an enhancement to the CMT test that
>>>>> uses cache occupancy as measurement while following the same methodology as the
>>>>> CAT test. 
>>>>
>>>
>>> Hi Ben, Reinette,
>>>
>>>> Ok, then perhaps it's best just to enhance the CMT test to also check that the cache allocation
>>>> bitmap has some measureable effect rather than a new test. In the spirit of making the checks as
>>>> weak as possible we could just check that the measured llc_occupancy is lowest for the minimum
>>>> number of cache allocation bits set, higher when half the bits set and highest when all the bits are
>>>> set.
>>>>
>>>
>>> Agreed. I'll enhance the CMT test instead of adding a new one.
>>> Please forget my "must not exceed" idea, as you said there's still an
>>> absolute number with the same accuarcy problem.
>>>
>>>  
>>>> This brings us back to the initial subject of this patch. For MPAM we need a new implementation for
>>>> memflush() as cl_flush() doesn't have a direct equivalent on arm64. There is an smmcc based option
>>>> but the kernel support isn't upstream yet [1] and I don't know how widely it is supported in
>>>> firmware. As such, we need to use the writing of a buffer from a different control group. This
>>>> should be distinct from the default control group and have all cache portion bits set, as the CMT
>>>> test uses the inverse of the testing mask for the default group. The llc_occupancy of the testing
>>>> group can be used to check the group is clean enough, i.e. the memflush() had the desired effect.
>>>> All this does have the disadvantage of using the same features we are checking to to help with the
>>>> testing interface but there seems no easy way out of that while staying generic across even MPAM
>>>> platforms.
>>>>
>>>
>>> I think we can avoid the flush completely if the bitmpas are measured
>>> from narrow to wide while the same benchmark keeps running.
>>>
>>> Two reason I can think of to backed it up.
>>>
>>> - Everything the test group has in the cache after the narrow step was
>>>   allocate using the narrow bitmap, and the wide bitmap covers those portions
>>>   as well. Nothing is left in a portion the group may not use any more, so
>>>   there's nothing to flush before the wide step. Only going from wide to
>>>   narrow can leave such lines behind.
>>>
>>> - The first step doesn't need a flush either. resctrl_val() moves the task
>>>   to the test group and writes the schemata before the buffer is allocate
>>>   and init, so the buffer never wasa in the cache under another bitmap.
>>
>> I'm not so sure. If there are cache lines in the cache portions that the benchmark will use that are
>> currently in use by the default tasks then they may continue to be used by the default tasks unless
>> we cause those lines to be evicted. The cache portion bitmap, at least on MPAM, only affects new
>> cache allocations.
>>
>> Thanks,
>>
>> Ben
>>
> 
> Hi Ben,
> 
> I agree with your opinion, espeically hot foreign lines can stay there
> and we have no control over it.
> 
> But I think in v6's implementation, the benchmark removes most of it,
> the buffer is twice the size of the tested portions, so the benchmark
> keeps allocating in them and evicts what it finds.
> 
> With 2, 4, 5 and 8 bits, my machine pass the test, occupancy is within
> 15% of the expected value. With 1 bit it's 35% below, which may be the
> effect you describe.
> 
> An explicit eviction step from a separate group would help if we wanted
> an accurate absolute number, but as Reinette said we shouldn't depend
> on that ?

Yeah, as much as possible we shouldn't rely on precise performance effects.
> 
> I think keeping v6's patch 2 as-is if there's no other concern ? I can add
> reasoning in the patch message in v7 if that would do.

I think that the flush might help the accuracy of the test in general and so mentioning in the
commit message would be useful so that we already have an idea to consider if the test doesn't prove
as reliable as expected.

Thanks,

Ben

> 
> Best regards,
> Richard Cheng.
>  
>>>
>>> I'll work on v6 with patch 1 of this series, and patch 2 does not depend
>>> on this so I'll send it as a standalone patch.
>>>
>>> Best regards,
>>> Richard Cheng.
>>>
>>>
>>>> [1] https://lore.kernel.org/linux-arm-kernel/20261021224557.1827361-1-smadhavan@nvidia.com/
>>>>
>>>> At the moment the CMT test just uses a single cycle of a hardcoded
>>>>> (unless user provides something else) bitmap with five bits set. Even with this
>>>>> I needed add enhancements to make it more robust:
>>>>>
>>>>>  commit ca0ea39288c9 ("selftests/resctrl: Reduce interference from L2 occupancy during cache occupancy test")
>>>>>  commit 7a214b4ec1c9 ("selftests/resctrl: Improve accuracy of cache occupancy test")
>>>>>
>>>>> As one enhancement highlights the accuracy can be managed better on a system that
>>>>> supports L2 as well as L3 allocation. Not all systems able to run such test will have such
>>>>> capability. Also, looks like CMT does not require there to not be interference as the CAT
>>>>> test does but with MPAM systems having each cache portion as shareable this may also be
>>>>> a big influence on accuracy.
>>>>>
>>>>> I am not able to judge if a test that uses LLC occupancy and relies on single bit increments
>>>>> will be robust across all platforms of all architectures. Even so, I do see several risks
>>>>> for such test to be reliable while I do not see how such fine grained increment provides
>>>>> insight into resctrl kernel subsystem health.
>>>>
>>>> Thanks for sharing your experience on the testing robustness. I now see that being as permissive as
>>>> possible with our testing is the way to go.
>>>>
>>>> Ben
>>>>
>>>>>
>>>>> Reinette
>>>>>
>>>>>
>>>>
>>

