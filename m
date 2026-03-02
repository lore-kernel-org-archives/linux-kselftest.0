Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC50430BB9
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 03:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772423449; cv=none; b=DBuZzGDBXpkymRkmZQmds63AAoa3O3UWXy+Ihv4iu5xL6/VF8lMlbYwBjxqcXQkNkMUqmW5ViT4VRyxGHPDO9e8/91J0u0Y9Ee3Ve+U4n0KNyVO0uVmsum8UdkHMkqCIzYaxzuzm6IODbLirdffOmNVFymEkdR6O3rbKXDp+ENY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772423449; c=relaxed/simple;
	bh=oBs0/VOAE10caFYlBjetKO2BmpZjrM1KYrAYDiDCdeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nmFk5vJIXb/JtNnA9P8sLSVfyENR5Gcr3SsR2kkvX7dcOrBbcM3zQTiKBA6FMNHkJcelFmw9TjDL58wHrSnu9/4t5OU1++Cr0n78ybqeHM14THIzU9WYz9EiogphGj5ekfbRlnr5zv6gxgVMltyGVgKYwpF85rcsOpYOAeQJ7zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=doUGLJfX; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="doUGLJfX"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ebc2xyrRyErhkT8LzvrdxHoB7dac5yeu5XdhGFduWAM=;
	b=doUGLJfXUykL5SCzxoXi8i0ghUoqhoUOUz1xbYrq8TewnsQ/smWtiFkvjRR5gaA81FbnreBFB
	RUSVavbSKPVFfU00b/KLNnEQ3zB6fgu8ts8J324gp2KsSp7vDqZmQ9FQjUDMHMVDBMc4dqnN5Ns
	Zpcr7KPXJYVTqTpaRxbx9n8=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fPPwG4JnczcZxn;
	Mon,  2 Mar 2026 11:45:34 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A6DC4036C;
	Mon,  2 Mar 2026 11:50:44 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 2 Mar 2026 11:50:43 +0800
Message-ID: <3400c77a-8af2-4c06-8d8a-e718b6f72cfb@huawei.com>
Date: Mon, 2 Mar 2026 11:50:43 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests/arm64: Implement cmpbr_sigill() to hwcap
 test
To: Mark Brown <broonie@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<yeoreum.yun@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>, <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260227031933.4103333-1-wuyifan50@huawei.com>
 <20260227031933.4103333-2-wuyifan50@huawei.com>
 <aaLsU2sBQh3nW9c6@sirena.co.uk>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <aaLsU2sBQh3nW9c6@sirena.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)

Hi Mark,

On 2/28/2026 9:23 PM, Mark Brown wrote:
> On Fri, Feb 27, 2026 at 11:19:32AM +0800, Yifan Wu wrote:
>
>>   static void cmpbr_sigill(void)
>>   {
>> -	/* Not implemented, too complicated and unreliable anyway */
>> +	/* CBEQ x0, x0, +8 */
>> +	asm volatile(".inst 0x74C00040" : : : "x0");
>> +	/* UDF #0 */
>> +	asm volatile("udf #0" : : : );
>>   }
> I don't expect it to make a difference but it'd be nice if these were a
> single asm volatile statement, just to make it absolutely clear that no
> instrumentation or anything is supposed to go between the two.
Thanks for the review. That's a good point, I'll combine them in v2.

Regards,
Yifan Wu
