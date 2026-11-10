Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314154;
	b=lH2dXnkNMaje0yQARiybN6ncC7pMTJbkzTelSo0SwZvZi/LMzJqPhwLO4aNAOjW0tj9b
	 vD3phA0QLUFS8WIrXl2TVEKmyzvMUy4EnimKGQXIhIM6LnK3ElXrKNjdjWmw6eNNHd1xN
	 ZD1BiUs7fqfEu9q6/aU8ZHWniZxJCj8p1jGcTlT64Hk0VEOxYCo5wbo8il2whH3OaZxhD
	 F5pWC0JFp2OSyyUB3a7YO2tetqYY2z9ZWlqV2GX//x+/QK8dTPbhSmQsjtoEhRS6AaQOn
	 yEuQg+s8V3Pf+9oAKT5SlsvudcytMbbGtX1i1mcDozDIjnY2v9naozZNWAGLKWW2ksg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314154;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=YA5rNu2BzW/QAy+a5mabvrFLdF57vndPQ/8VU/cRJU0=;
	b=d5S0eEz18+HJgx2rxedDQgDPwnxNGB2xZVVAGHe2/awfF4T1LVxfxhVZfKTBEx+s9Z/D
	 +ly14AkIywTq6qDPO6vH6pP9rTg+9AyUZt6c6cxD9pMZg4SHyUC/AtmZZuuJT9ZJc6qCM
	 FFFZF0xrStdt5HS3eU1NcMnCStt+T1WoM5rrz3LU9bSDcQxH6sk76Iy0ZFERQS706rqSc
	 xX5iwveY11Fmy6s73Ds2yM/qdAP7zC5WYMzAc5mESlqnwNbhfaXJgLzredPReCtoW/Zlw
	 wRf7UDogKLi7Ob+9b/hOVC2KUIMn80gODEBLmoEtJ3D3EACB7v7ar8XJ9WUPjCWf0EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YcZLbqVQ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35026606A31C;
	Tue, 10 Nov 2026 12:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35026606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YcZLbqVQ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D8E714BF;
	Tue, 10 Nov 2026 04:35:48 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C61D3F85F;
	Tue, 10 Nov 2026 04:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794314151; bh=KJo+O6meRJ64eXWfSvjvKyxDMLbRUtZe2z0IV3/AgGI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YcZLbqVQpjB6mr7/orLKx/0gwSTeowRihr7AYOwrqxiYJq5Z8w6oKYrSIe526uKQ7
	 laC+C7ThnZc0COUaBovYZHoZWiLfVgRifbRnyL7uIgtPq+6atNFn2rzNl/PigHlIur
	 WIgQe2rNpuO7V1ljXPWOmu4v6WlGZGROiP7jbzLQ=
Message-ID: <7501303c-d304-47d4-8150-b1efc8554d36@arm.com>
Date: Tue, 10 Nov 2026 12:35:48 +0000
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
 <89549a38-4764-466b-b66e-98bab801fefc@arm.com>
 <0583dad3-f761-48d5-a9a2-f2ad39567a6b@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <0583dad3-f761-48d5-a9a2-f2ad39567a6b@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette, Richard,

On 09/11/2026 17:01, Reinette Chatre wrote:
> Hi Ben,
> 
> On 11/13/26 7:16 PM, Ben Horgan wrote:
>> On 07/11/2026 00:29, Reinette Chatre wrote:
> 
> ... 
>>>
>>> If you do end up using a benchmark I'd suggest to make the checks as forgiving as
>>> possible. For example, instead of checking something like "LLC occupancy needs to be
>>> X when bitmap is Y" it should check something like "LLC occupancy when bitmap is all ones
>>> is larger than LLC occupancy when only half of bitmap is ones".
>>
>> Do you think it's too strong to say that a bitmap with n + 1 bits set
>> has higher occupancy than one with n bits set? I think it has slightly
>> more utility in that all bits of the bitmap are plumbed down to a
>> working control but I'm ok with a weaker check if a stronger check will
>> just be problematic and maintenance heavy.
> 
> My comment was motivated by the recent change I needed to make to the CAT test
> that uses cache misses measured via perf instead of cache occupancy. Originally
> this test incremented the bitmap with one at each cycle but incrementing it with
> two proved to be more robust.
> 
> What you are proposing sounds more like an enhancement to the CMT test that
> uses cache occupancy as measurement while following the same methodology as the
> CAT test. 

Ok, then perhaps it's best just to enhance the CMT test to also check that the cache allocation
bitmap has some measureable effect rather than a new test. In the spirit of making the checks as
weak as possible we could just check that the measured llc_occupancy is lowest for the minimum
number of cache allocation bits set, higher when half the bits set and highest when all the bits are
set.

This brings us back to the initial subject of this patch. For MPAM we need a new implementation for
memflush() as cl_flush() doesn't have a direct equivalent on arm64. There is an smmcc based option
but the kernel support isn't upstream yet [1] and I don't know how widely it is supported in
firmware. As such, we need to use the writing of a buffer from a different control group. This
should be distinct from the default control group and have all cache portion bits set, as the CMT
test uses the inverse of the testing mask for the default group. The llc_occupancy of the testing
group can be used to check the group is clean enough, i.e. the memflush() had the desired effect.
All this does have the disadvantage of using the same features we are checking to to help with the
testing interface but there seems no easy way out of that while staying generic across even MPAM
platforms.

[1] https://lore.kernel.org/linux-arm-kernel/20261021224557.1827361-1-smadhavan@nvidia.com/

At the moment the CMT test just uses a single cycle of a hardcoded
> (unless user provides something else) bitmap with five bits set. Even with this
> I needed add enhancements to make it more robust:
> 
>  commit ca0ea39288c9 ("selftests/resctrl: Reduce interference from L2 occupancy during cache occupancy test")
>  commit 7a214b4ec1c9 ("selftests/resctrl: Improve accuracy of cache occupancy test")
> 
> As one enhancement highlights the accuracy can be managed better on a system that
> supports L2 as well as L3 allocation. Not all systems able to run such test will have such
> capability. Also, looks like CMT does not require there to not be interference as the CAT
> test does but with MPAM systems having each cache portion as shareable this may also be
> a big influence on accuracy.
> 
> I am not able to judge if a test that uses LLC occupancy and relies on single bit increments
> will be robust across all platforms of all architectures. Even so, I do see several risks
> for such test to be reliable while I do not see how such fine grained increment provides
> insight into resctrl kernel subsystem health.

Thanks for sharing your experience on the testing robustness. I now see that being as permissive as
possible with our testing is the way to go.

Ben

> 
> Reinette
> 
> 

