Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576541;
	b=vaQc/p5L/cNvN28q5CAKJkCxkyn7d5OYebjC9GZj2G6uvBQ7L72I7zbdzA5Ds8y9sTnr
	 DP5YelTx9ceWYK3M15QIHT5uRC+9u6s21dq/Nw/adTBSIs26PLe4ZqL/5zIGwvVWbc0Yr
	 pNq48pRbRAm3Enb5NECcxbqT1NEG8DDuWdzD/2WO3SBBGLy7NSEvLW4+8HxZuSTt2Ovkl
	 NXp9lCb0Aa4peCooFed3ovk3I94kCK6mIEn4uYqC9cT6tdAATtxNZ5j9x0/LFyKj+ydTo
	 0rUmy2WHkqPmPRPOGu2uAYQH0bYgdOWSTF8USi62qESRCW4UtoHSFWz9eQ6d7RKfomg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576541;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4Mli0UH0SB8rO3o4eqV3Cy0WqV8a6zJJQW200aYwx/8=;
	b=Tdliid6791vlTb1AOsTBXXYbYTGz86X0VZdVDQlq74VhsSrNsG9bZ2HmTiJEPy0amT6a
	 dY4llUPRhEyOrXZAHNLcVb7k1avWCX2TrZtxOS7gfTFI3+maPKxSPaFl39WSqgEMdpdBu
	 UPAsF0JBWYsw5JBvyi8hrVDkuNvdTlqYQHRDUpvm5NaHuusKbO/0+4MdhEl/3tJNqXgQ0
	 VWMNBdK06Vy63M/MdLyPe45V03Q/1P9TfBgPwQx7p1YQgVTkEdt1icjvx8VhcvKgPo2/w
	 5OdQdWhjfe106tMOP1ptVgliKgQtobn62zsP06BfzkEY0wgmQTdkzMn4G8OC1RDmkQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=blEYdzpN;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C2B606A320;
	Wed, 21 Oct 2026 09:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C2B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=blEYdzpN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7726616F8;
	Wed, 21 Oct 2026 02:55:35 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2B633F7D8;
	Wed, 21 Oct 2026 02:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792576538; bh=wbnN4z5LNLrXS3cpKqUEOH8EhmtbipCX/3WFSWcg/eI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=blEYdzpNY/DCLg+JmsLk7UU9P/IoJk8TwJBbGj8+hcBj8NHsZVPGLnZ3zumi2Yjfs
	 ndja7HIRn9f/zywVGuKlvIKamJOZvU8XoO/+E2yld6CSkF3bQEy+JktND2Htq8qHIL
	 iuwH3+zyCPWbTaeXRBKkvRKlzSfj28DSkiGQ3ZmY=
Message-ID: <9cccea63-397c-4913-95bc-eed38f0ebd66@arm.com>
Date: Wed, 21 Oct 2026 10:55:35 +0100
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
From: Ben Horgan <ben.horgan@arm.com>
To: Richard Cheng <icheng@nvidia.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, x86@kernel.org, shuah@kernel.org,
 fenghuay@nvidia.com
Cc: Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kaihengf@nvidia.com, kobak@nvidia.com, newtonl@nvidia.com,
 kristinc@nvidia.com
References: <20261012074729.40042-1-icheng@nvidia.com>
 <20261012074729.40042-2-icheng@nvidia.com>
 <847af89d-7b79-44b4-8273-243dfb51ef5e@arm.com>
Content-Language: en-US
In-Reply-To: <847af89d-7b79-44b4-8273-243dfb51ef5e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Richard,

On 20/10/2026 17:30, Ben Horgan wrote:
> Hi Richard,
> 
> Thanks for having a look at the arm64 side of the resctrl selftests. That hasn't had much love but
> it would be good to have them working properly.
> 
> On 12/10/2026 08:47, Richard Cheng wrote:
>> cl_flush() and sb() compile to empty functions on aarch64, making
>> mem_flush() a silent no-op and leaving CMT/CAT tests operating on
>> unflushed state.
>>
>> Add "dsb sy" for sb(), ARM requires a DSB whose access type covers both
>> loads and stores.
> 
> I guess this is referring to the synchronization required for the cache maintenance instruction but
> that's not what you are using in this patch.
> 
>>
>> For cl_flush(), "dc civac" only reaches the Point of Coherency, on
>> ARM MPAM systems the SLC lies past the PoC and may be a NOP on coherent
>> platforms. Instead, dirty each cacheline with a store so that
>> mem_flush's full-buffer sweep evicts lines from the SLC via LRU
>> pressure.
>>
>> Signed-off-by: Richard Cheng <icheng@nvidia.com>
>> ---
>>  tools/testing/selftests/resctrl/fill_buf.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
>> index b9fa7968cd6e..eae0262fe265 100644
>> --- a/tools/testing/selftests/resctrl/fill_buf.c
>> +++ b/tools/testing/selftests/resctrl/fill_buf.c
>> @@ -27,6 +27,9 @@ static void sb(void)
>>  #if defined(__i386) || defined(__x86_64)
>>  	asm volatile("sfence\n\t"
>>  		     : : : "memory");
>> +#elif defined(__aarch64__)
>> +	asm volatile("dsb sy\n\t"
>> +		     : : : "memory");
>>  #endif
>>  }
>>  
>> @@ -35,6 +38,14 @@ static void cl_flush(void *p)
>>  #if defined(__i386) || defined(__x86_64)
>>  	asm volatile("clflush (%0)\n\t"
>>  		     : : "r"(p) : "memory");
>> +#elif defined(__aarch64__)
>> +	/*
>> +	 * Dirty the cache line with a store. As mem_flush() sweeps
>> +	 * the full test buffer (sized larger than the SLC), cache pressure
>> +	 * evicts lines from the SLC via LRU replacement.
>> +	 */
>> +	asm volatile("strb wzr, [%0]\n\t"
>> +		     : : "r"(p) : "memory");
>>  #endif

One more thing that occurred to me is that if this is intended to evict all existing data in the
cache then it would require that the cache portions bitmap for the control group (PARTID) in use is
set to all 1s. E.g. 'L3:0=0xffff'. Otherwise, you may not affect the whole cache. This likely means
that the cl_flush() function isn't the right abstraction for MPAM and the test needs a bit of
restructuring to get this to fit in elegantly. Similarly, to the limbo handler in resctrl you could
then check the llc_occupancy() to check it's under a "low enough" threshold.

Thanks,

Ben

> 
> Isn't this cl_flush() used without changing the resctrl control and monitor group (PARTID/PMG)?
> Hence, I expect you are ending up making the cache full of data associated with the identifiers that
> the benchmark runs with. Is that the case?
> 
> I'm also unclear how this the cat_test will detect any performance differences on arm/MPAM as the
> perf events would need to specific to the system level cache implementation.
> 
> Thanks,
> 
> Ben
> 
> 
> 
>>  }
>>  
> 

