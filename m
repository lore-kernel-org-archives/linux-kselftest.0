Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672523264E9;
	Tue,  3 Mar 2026 17:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557822; cv=none; b=d88gtJ7MmhkOpEZAOrNrdztZAmdXfhumj8Hc6HmpXYjzMZjVeo7x+ewiF+0yq1RfajfsfANQAUXARu4r6nEeGQ3tzJ2/RHDwF8eQYeKkrlHSJ0+3KGku/rwngX/jXORhM/dNFuQC8NhG1cIK0MxWyixdxe+7l98HkB4NoGWDD4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557822; c=relaxed/simple;
	bh=A9iXfbukEYSm7oOGpsIj10Mq3UJmyrTuQYFdomPEYY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G/7M2pl18Qn7vsQDltW1BshQ6QCvR2mYDMtk7yyvmPjbTJYYYUV+oLmsskksBrybxqoU6lbC2BHl9h3K91VuOJeZr9H4stfKKT9HN9a8c25pUaw743jroZnzAa0zmxVEyyT1zt9hWzFT6kdNwaVFrfqJoQcDVvsRPoKSrKLp3oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 428AB339;
	Tue,  3 Mar 2026 09:10:13 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B2A73F73B;
	Tue,  3 Mar 2026 09:10:18 -0800 (PST)
Message-ID: <4449219d-186f-4b5e-9f72-958d1af80f58@arm.com>
Date: Tue, 3 Mar 2026 17:10:16 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] kselftest/resctrl: Enable CAT and NONCONT_CAT
 tests on ARM
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "shuah@kernel.org" <shuah@kernel.org>
Cc: "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
 <a3428306-9fae-4add-890e-ed7b82bea0b8@arm.com>
 <TYWPR01MB9923C04ECCCA9EF4FB49328C8B7EA@TYWPR01MB9923.jpnprd01.prod.outlook.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <TYWPR01MB9923C04ECCCA9EF4FB49328C8B7EA@TYWPR01MB9923.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shaopeng,

On 3/2/26 07:26, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
> Thank you for your reply. 
>  
> I've made the fixes and re-run the tests on Grace, as you advised.
> I appreciate your feedback.
> 
>> This is only guaranteed to clean and invalidate to the point of
>> coherence, PoC. On Grace I expect this is L3/slc and so the cache line
>> there in L3/slc is likely not invalidated or pushed to DRAM.
>> The dsb() for synchronization is missing for aarch64 in sb().
> 
> I added dsb() for synchronization for aarch64 as shown below.
>  
> @@ -27,6 +30,8 @@ static void sb(void)
>  #if defined(__i386) || defined(__x86_64)
>         asm volatile("sfence\n\t"
>                      : : : "memory");
> +#elif defined(__aarch64__)
> +       __asm__ __volatile__("dsb sy\n\t" ::: "memory");
>  #endif
>  }

Sorry, if I wasn't clear. The dsb() is required for the synchronization
of the clean and invalidate operation but the clean and invalidate
operation has no requirement to clean and invalidate the L3/slc and as
that's the PoC and so probably just does the clean and invalidate up
to L2.

>  
>> IIUC the L3 cache is in the nvidia interconnect and so changing the
>> cache portion bitmap would correlate with events from the nvidia
>> interconnect pmu. However, I don't think you are using events from the
>> interconnect.
> 
> I used the NVIDIA event  "nvidia_scf_pmu/scf_cache_refill/".
>  
> After the above fixes, the running results are as follows: 
> $ sudo ./resctrl_tests -t cat
> TAP version 13
> # Pass: Check kernel supports resctrl filesystem
> # Pass: Check resctrl mountpoint "/sys/fs/resctrl" exists
> # resctrl filesystem not mounted
> 1..3
> # Starting L3_CAT test ...
> # Mounting resctrl to "/sys/fs/resctrl"
> # Cache size :119537664
> # Writing benchmark parameters to resctrl FS
> # Write schema "L3:1=fc0" to resctrl FS
> # Write schema "L3:1=3f" to resctrl FS
> # Write schema "L3:1=fe0" to resctrl FS
> # Write schema "L3:1=1f" to resctrl FS
> # Write schema "L3:1=ff0" to resctrl FS
> # Write schema "L3:1=f" to resctrl FS
> # Write schema "L3:1=ff8" to resctrl FS
> # Write schema "L3:1=7" to resctrl FS
> # Write schema "L3:1=ffc" to resctrl FS
> # Write schema "L3:1=3" to resctrl FS
> # Write schema "L3:1=ffe" to resctrl FS
> # Write schema "L3:1=1" to resctrl FS
> # Checking for pass/fail
> # Number of bits: 6
> # Average LLC val: 0
> # Cache span (lines): 933888
> # Number of bits: 5
> # Average LLC val: 0
> # Cache span (lines): 778240
> # Number of bits: 4
> # Average LLC val: 0
> # Cache span (lines): 622592
> # Number of bits: 3
> # Average LLC val: 0
> # Cache span (lines): 466944
> # Number of bits: 2
> # Average LLC val: 0
> # Cache span (lines): 311296
> # Number of bits: 1
> # Average LLC val: 0
> # Cache span (lines): 155648
> ok 1 L3_CAT: test
> 
> The result of the nvidia_scf_pmu/scf_cache_refill event is 0. 
> I have tried various changes to the perf_event_open() parameters, such as type, read_format, PID etc.. 
> Although non-zero results were obtained for some parameter combinations, the expected results were not achieved in any scenario. 

Could this be because the clean and invalidate doesn't affect the slc/L3?

> Are there any special specifications needed for the perf_event_open() parameters for Grace or Arm architecture?

I'm not sure.

> 
> The perf_event_open() parameters used when collecting the above results are as follows:
> perf_event_open({type=PERF_TYPE_RAW, size=0x88 /* PERF_ATTR_SIZE_??? */, config=0xf1, sample_period=0, sample_type=PERF_SAMPLE_IDENTIFIER, read_format=PERF_FORMAT_GROUP, disabled=1, inherit=1, exclude_kernel=1, exclude_hv=1, precise_ip=0 /* arbitrary skid */, exclude_guest=1, exclude_callchain_kernel=1, ...}, 68508, 1, -1, PERF_FLAG_FD_CLOEXEC) = 3
> Could you please give us your opinion?
>  
> Also, since this kselftest is for all Arm chips, we need an event common to all chips.
> Do you have any ideas on what event we should collect?

I don't think there is any common event. Perhaps you could make the
event to test against an input to the test?

> 
> Best regards,
> Shaopeng TAN

Thanks,

Ben

