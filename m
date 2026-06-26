Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CAE3BB118;
	Fri, 26 Jun 2026 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782482345; cv=none; b=VvTGRE308Z/hiEKUzFWEvrnUcwqznS/+qMU39qloEB27m3RcPH1kazTgzln/XUApF9O27TTN7cf34DMM++umDaL+BwNuZ+2JE7p5Hwuwj2C9Bkp2j8kPS9vg6T13ZqVK2dySYFXKC/rmbBjM6fcqQPbOND/kAx3ZEFqA9DtdWek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782482345; c=relaxed/simple;
	bh=VdLEWGecsKhQB/jEnJ084nlmiJhaw1qLKk9YkYhzqVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqRq9feL4/XsCvNcFzJCygp8Ext31VkLz5o9XDF5NKsXWVx4ZLbfgP5WQtZybEMuyKbuZBNUf8Rqa8eCWyIhStxdI+X0iYWzj4FtPacvSVuMKFpvjWZfOdvKV9i5mCZVI1cDP/Z9MUP68vxvVyvAbUFusYWEgMUP8TWT9G3U5N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=p/TfaK+r; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="p/TfaK+r"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0866C1F60;
	Fri, 26 Jun 2026 06:58:58 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86BC23F632;
	Fri, 26 Jun 2026 06:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782482342; bh=VdLEWGecsKhQB/jEnJ084nlmiJhaw1qLKk9YkYhzqVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p/TfaK+r1wlzM19sxhx49VZPV+iVe8oV5+TCSnXDW0qnix/4iMjjSpJTphprWDCm/
	 moQdZoiv7SvLu+v1njUQWNpdm4u45OGqHB1IOP2ZWKSDw8CiZ0Jru6BqtcrW4mdhu2
	 qDgsYuSeK91wax7G5IJCYpnbJr8haG8wLLgf4doc=
Message-ID: <f66fcb15-b33d-4bdd-b772-6109a213853a@arm.com>
Date: Fri, 26 Jun 2026 14:58:59 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v3 2/3] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
To: Reinette Chatre <reinette.chatre@intel.com>,
 Richard Cheng <icheng@nvidia.com>, tony.luck@intel.com, shuah@kernel.org
Cc: Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 yu.c.chen@intel.com, fenghuay@nvidia.com, newtonl@nvidia.com,
 kristinc@nvidia.com, kaihengf@nvidia.com, kobak@nvidia.com
References: <20260529022352.8308-1-icheng@nvidia.com>
 <20260529022352.8308-3-icheng@nvidia.com>
 <8d5a7235-f75c-4266-9deb-44465ff3fe42@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <8d5a7235-f75c-4266-9deb-44465ff3fe42@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette, Richard,

On 6/26/26 04:26, Reinette Chatre wrote:
> +Ben
> 
> Hi Richard,
> 
> On 5/28/26 7:23 PM, Richard Cheng wrote:
>> cl_flush() and sb() in fill_buf.c only have implementations for i386
>> and x86_64, so on aarch64 both compile to empty functions. mem_flush()
>> then walks the buffer calling a no-op cl_flush() per cache line and
>> finishes with a no-op sb(), leaving any caller that expects a flushed
>> buffer (e.g. CMT, L3_CAT) operating on unflushed state with no warning.
>>
>> Add an aarch64 code block using the ARM equivalents:
>> * "dc civac, %0" for cl_flush()
>> * "dsb sy"       for sb()
> 
> Calling on Arm experts here since my superficial check found sfence to
> be used for __wmb() on x86 and the Arm equivalent per
> arch/arm64/include/asm/barrier.h appears to be "dsb st"?

Referring to the arm reference manual (DDI0487 version M.a.a):
D7.5.9.15 Ordering and completion of data and instruction cache
instructions
This talks about using dsb for the synchronization and also states:
"In all cases, where the text in this section refers to a DMB or a DSB,
this means a DMB or DSB whose required access type is both loads and
stores."

Hence, in this case a "dsb st" is insufficient as the required access
type is loads but not stores. A full "dsb sy" would work to synchronize
the "dc civac".

However, I don't think "dc civac" fulfills the role of what is expected
of cl_flush().

> 
> Even so, it looks like the changes below were considered by Ben during
> a previous submission but I am not able to tell if his feedback was taken
> into account here.
> Please see:
> https://lore.kernel.org/lkml/4449219d-186f-4b5e-9f72-958d1af80f58@arm.com/
> https://lore.kernel.org/lkml/5aea412c-9c7f-4692-af3e-79937956ef8c@arm.com/

My understanding is that the resctrl selftests want to use cl_flush(),
to invalidate entries in a system level cache for testing the cache
portion bitmaps. However, the mechanism to invalidate the system level
cache is generally implementation defined.

> 
>>
>> Both instructions are EL0-accessible on Linux aarch64.
>>
>> Signed-off-by: Richard Cheng <icheng@nvidia.com>
>> ---
>>  tools/testing/selftests/resctrl/fill_buf.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
>> index 19a01a52dc1a..a41d21e5a64e 100644
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
>> @@ -35,6 +38,9 @@ static void cl_flush(void *p)
>>  #if defined(__i386) || defined(__x86_64)
>>  	asm volatile("clflush (%0)\n\t"
>>  		     : : "r"(p) : "memory");
>> +#elif defined(__aarch64__)
>> +	asm volatile("dc civac, %0\n\t"
>> +		     : : "r"(p) : "memory");


This will only clean to the Point of Coherency (PoC).

To quote the arm reference manual (DDI0487 version M.a.a):
D7.5.9.2 The data cache maintenance instruction (DC)

If there are caches after the Point of Coherency and FEAT_PoPS is not
implemented, then the DC CIVAC and DC CIGDVAC instructions are not
sufficient to remove all copies of a poisoned Location and it is
IMPLEMENTATION DEFINED whether any IMPLEMENTATION DEFINED mechanism
exists to remove poison from a Location.

In most systems the slc, where your MPAM cache portions are likely to
be, will be past the PoC and I'd not expect FEAT_PoPS to be implemented.

Thanks,

Ben


>>  #endif
>>  }
>>  
> 
> Reinette

