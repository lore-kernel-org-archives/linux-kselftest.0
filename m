Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2EE4D8D97;
	Thu,  2 Jul 2026 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001735; cv=none; b=O5EKKZnlcOjH+baCfjdMlgd2zayhwMxBia2GrufzJRfD1eAm1Nv6PUP3XDQaAJB9dwPJQ6sDlLFomoZC7r8LV+r/9whBlMoJ9YioEjiuc0/7YPMb9NCrqZdRufJHI3oujJcofOfj0K4B+WH5w0POx8LG64VIoRNYZrrpdM4dkGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001735; c=relaxed/simple;
	bh=+jqmcz4dQg2McKrkCnB4wL8sHU2hdn4Ky//Fba73KFQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=an4OP1VRHcKVzN+eQFJrDLrSqWY06O76CRUfBMpOZLXZOJMiZs4VvS1ISDnW+4dkiV5HlJ3uTgLOd+zVux1iAqOZUNheIq3NjB/6121uTsTqcNtSeN3+OOOU2wmNqyFdxDyY6sJWJSgq7apHDYr4nL3vwDXfAa2lEpsbtx9bsXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nKmiFIhn; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nKmiFIhn"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3760D359D;
	Thu,  2 Jul 2026 07:15:26 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C3933F673;
	Thu,  2 Jul 2026 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783001730; bh=+jqmcz4dQg2McKrkCnB4wL8sHU2hdn4Ky//Fba73KFQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=nKmiFIhn+PJIC/XUW3qjGycSkxbO5LvEEyugS9AF+Ck1yTm1ZMqc3yt6OmofkIE/J
	 LHPF1E06JG8ONiXgaQ4Qc5WA3keb2CD2YE9lJ3Tor6os22TtK3uY/uCH2/Xl2zS5le
	 U5I7UZbkcxqoPtkQSQZgKwpJlabn1gbkQ/rUNWVw=
Message-ID: <04921da3-665c-41e8-ae6b-36fbafd1874d@arm.com>
Date: Thu, 2 Jul 2026 15:15:27 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v3 2/3] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
From: Ben Horgan <ben.horgan@arm.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
 Richard Cheng <icheng@nvidia.com>, tony.luck@intel.com, shuah@kernel.org
Cc: Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 yu.c.chen@intel.com, fenghuay@nvidia.com, newtonl@nvidia.com,
 kristinc@nvidia.com, kaihengf@nvidia.com, kobak@nvidia.com
References: <20260529022352.8308-1-icheng@nvidia.com>
 <20260529022352.8308-3-icheng@nvidia.com>
 <8d5a7235-f75c-4266-9deb-44465ff3fe42@intel.com>
 <f66fcb15-b33d-4bdd-b772-6109a213853a@arm.com>
Content-Language: en-US
In-Reply-To: <f66fcb15-b33d-4bdd-b772-6109a213853a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette, Richard,

On 6/26/26 14:58, Ben Horgan wrote:
> Hi Reinette, Richard,
> 
> On 6/26/26 04:26, Reinette Chatre wrote:
>> +Ben
>>
>> Hi Richard,
>>
>> On 5/28/26 7:23 PM, Richard Cheng wrote:
>>> cl_flush() and sb() in fill_buf.c only have implementations for i386
>>> and x86_64, so on aarch64 both compile to empty functions. mem_flush()
>>> then walks the buffer calling a no-op cl_flush() per cache line and
>>> finishes with a no-op sb(), leaving any caller that expects a flushed
>>> buffer (e.g. CMT, L3_CAT) operating on unflushed state with no warning.
>>>
>>> Add an aarch64 code block using the ARM equivalents:
>>> * "dc civac, %0" for cl_flush()
>>> * "dsb sy"       for sb()
>>
>> Calling on Arm experts here since my superficial check found sfence to
>> be used for __wmb() on x86 and the Arm equivalent per
>> arch/arm64/include/asm/barrier.h appears to be "dsb st"?
> 
> Referring to the arm reference manual (DDI0487 version M.a.a):
> D7.5.9.15 Ordering and completion of data and instruction cache
> instructions
> This talks about using dsb for the synchronization and also states:
> "In all cases, where the text in this section refers to a DMB or a DSB,
> this means a DMB or DSB whose required access type is both loads and
> stores."
> 
> Hence, in this case a "dsb st" is insufficient as the required access
> type is loads but not stores. A full "dsb sy" would work to synchronize
> the "dc civac".
> 
> However, I don't think "dc civac" fulfills the role of what is expected
> of cl_flush().
> 
>>
>> Even so, it looks like the changes below were considered by Ben during
>> a previous submission but I am not able to tell if his feedback was taken
>> into account here.
>> Please see:
>> https://lore.kernel.org/lkml/4449219d-186f-4b5e-9f72-958d1af80f58@arm.com/
>> https://lore.kernel.org/lkml/5aea412c-9c7f-4692-af3e-79937956ef8c@arm.com/
> 
> My understanding is that the resctrl selftests want to use cl_flush(),
> to invalidate entries in a system level cache for testing the cache
> portion bitmaps. However, the mechanism to invalidate the system level
> cache is generally implementation defined.
> 


I have also found out that cache maintenance operations on arm64 need
only do the necessary work to maintain coherency and no performance
effects can be implied. On platforms that are known to be coherent then
they may be a NOP. Perhaps you can just do some stores to fill the cache
with junk data.

Thanks,

Ben

