Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792600315;
	b=RwmkTVYo0dD31T+DZ2Gv6yizsYQpAJoLjrMZI4EevcSLjjkiVe/UFtQSR8Z1VTSom7EZ
	 jRJS0VX6m8GItGo0+NKGCZ01yrcKth87aM66uxOVcBbX6NOnL1qksc0at7bgorgWd3u5k
	 46wdp6GNW64/preMrvBJlrLxFia4O46CamQKoRS/DOhBMxyCsBVr+EPkZoRGbrymB+VmX
	 R89X0G0qWJrkPTmMsTYl4Tn1DaqwJuAHeKiUTzVxT0vkiAdi2aLu1Dy/tiTy9MHn0Imnx
	 kl4sP9F0aEKr0xoJql+E4oX5yBH0HmXPZg/Mt6bhhPglMR03SVREjkzpPFfknHKlEUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600315;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=3Bc76Zyj7fjJAs6twP2BXgV+vjnIbg8KFD0gadMNdtU=;
	b=adP2NXKEAVrB7CawwoOeZcRSysLB93lGaSze/GPoxE7+Y1fEg8noaA2SozJDvh7XJcl7
	 XicJi/NL5Mti8rOSRj4jo3ZmqTEzMnASCRuCAsSaG7D6sI0yFkOj0EJMnO6cfTW9Uk/FZ
	 rqRgH1e1492FOmkhFBpcI/QvsHq4c7sYhei2iXe5SxqRLsgnMtDEVMwwOrzRDyAqUJoz5
	 nFruCe8t7c2F5UHaCY85igzBBKZZz4+/8v0TUaIrlKic9TqXoIr8hRKIzvVGCNutvqKIt
	 y7SYY0j45DgzV67gJZTLlUMysRf9y9DUTfn8ue8pC5WqoU2YYbP/hQa9aPic4JotUgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qaX1G4g6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E00606A31A;
	Wed, 21 Oct 2026 16:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E00606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qaX1G4g6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31A521595;
	Wed, 21 Oct 2026 09:31:45 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8077D3F7D8;
	Wed, 21 Oct 2026 09:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792600308; bh=wjg8va0dwrFjEhHJbzt9fHvFZWhxWkaPeVPa02AKIW4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qaX1G4g6y/zAemw/PIi92bhfww5ZlXN1TDVUH9CcPgoBWZ7C/6l+X2AwwlacBeEfP
	 32LenG75QQInJL0AvexSWb/aWT/1W96gwPKH8mPm0Nb688mEzj6BLmZT6C+S3n80ch
	 JR9bqGALMM5PQvDpxI3VTbMoegyxtFdMMq1qr4Hk=
Message-ID: <a718389c-5c0d-4e4a-988d-6d3a61e667f9@arm.com>
Date: Wed, 21 Oct 2026 17:31:45 +0100
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
Subject: Re: [PATCH v5 2/2] selftests/resctrl: Recognise aarch64 as a vendor
 for L3_NONCONT_CAT
To: Reinette Chatre <reinette.chatre@intel.com>,
 Richard Cheng <icheng@nvidia.com>, tony.luck@intel.com, x86@kernel.org,
 shuah@kernel.org, fenghuay@nvidia.com
Cc: Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kaihengf@nvidia.com, kobak@nvidia.com, newtonl@nvidia.com,
 kristinc@nvidia.com, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
References: <20261012074729.40042-1-icheng@nvidia.com>
 <20261012074729.40042-3-icheng@nvidia.com>
 <415d1bf3-342d-45b5-b31e-ddc654510d85@arm.com>
 <801eeed4-6c31-40e7-8cfa-279d0740aa98@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <801eeed4-6c31-40e7-8cfa-279d0740aa98@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette, Richard,

On 21/10/2026 15:56, Reinette Chatre wrote:
> Hi Ben,
> 
> On 10/20/26 9:18 AM, Ben Horgan wrote:
>> On 12/10/2026 08:47, Richard Cheng wrote:
> 
>>> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
>>> index 0a417267dd74..f4b02b3eedd7 100644
>>> --- a/tools/testing/selftests/resctrl/cat_test.c
>>> +++ b/tools/testing/selftests/resctrl/cat_test.c
>>> @@ -271,8 +271,13 @@ static bool arch_supports_noncont_cat(const struct resctrl_test *test)
>>>  {
>>>  	unsigned int vendor_id = get_vendor();
>>>  
>>> -	/* AMD and Hygon always support non-contiguous CBM. */
>>> -	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON)
>>> +	/*
>>> +	 * AMD and Hygon always support non-contiguous CBM. ARM/MPAM defines
>>> +	 * MPAMCFG_CPBM as a bitmap with no contiguity constraint per ARM
>>> +	 * DDI 0598.

Nit: DDI 0598 is retired. The new spec version is IHI0099.

>>> +	 */
>>> +	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON ||
>>> +	    vendor_id == ARCH_ARM)
>>>  		return true;
>>
>> Would it be better not to just to use the information resctrl advertises?
>> /sys/fs/resctrl/info/L3/sparse_masks
> 
> The result of this architecture specific test is used to validate that 
> /sys/fs/resctrl/info/L3/sparse_masks provides accurate information.
> 
> This test was originally developed on Intel where support for
> sparse masks need to be discovered from the hardware. 

Ah ok, thanks for putting me straight.  The defined(__aarch64__) check looks to be the common way of
checking in the selftests. This looks fine to me.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

> 
>>
>> Is there any reason this test doesn't use that other than being written before its introduction?
> Reinette

