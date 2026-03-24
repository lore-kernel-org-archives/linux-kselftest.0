Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561A837BE64;
	Tue, 24 Mar 2026 01:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317160; cv=none; b=UZAZP6uk1I2xuyKNm1MVnHK+DIkEQp4oRLdk2ngwiJwP8I+xEMu4UVQcwEYEwCe9cB5XGpHMET2wjqdPjJPIBQUwrtd7xTcG4TQ9sinf32Xf7EuFDGoEO5gPLFSL1F+qRrNgC1i0zh4rhw9/4SUHGHsadt+2R+JWQ7NjA22YtgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317160; c=relaxed/simple;
	bh=5/roqlaxdiFnJGWNHZnkt15qiKJnl2bsx2ss6szTsrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HfbhtAIE3KY4v4Mgrfmc59d1Qt5Fjgx1xATSvMTPNwWzPFz7rHUmlAYwEIgTGCDWmhZNR1FtzK5stx0PPc1Vs3lJMcvjzWor2im6pmYxo50nJRMYAWoQNlFJTmlNPeQgbgefWtpcDY9Osey3GwsyMrGyPzEAY+hFl39NMie3+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=uD8lDVgT; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="uD8lDVgT"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5/roqlaxdiFnJGWNHZnkt15qiKJnl2bsx2ss6szTsrY=;
	b=uD8lDVgTvzVReoD0EYD3G6BcGUCdQoytjSExmxjAF40Bi2Q89TSdr6jAwqzCCe04+NWnlTpHK
	F3kXoEpup5dn9dycnblIIi3NI//7OOzBjPPIOEpl9AfYkwRC41ApKu0H1FlWczMuf4X6dCqNlQq
	eQ+lS2Gl0MufGCRbq7WdOtc=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fftFP6xLNz12LDY;
	Tue, 24 Mar 2026 09:47:05 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 11C654056B;
	Tue, 24 Mar 2026 09:52:34 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Mar 2026 09:52:33 +0800
Message-ID: <64f498fe-a109-482b-bb49-339a4bc6210d@huawei.com>
Date: Tue, 24 Mar 2026 09:52:32 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 8/9] selftests/resctrl: Add support for HiSilicon
 MBM/MBA test
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
 <20260304040334.765860-9-wuyifan50@huawei.com>
 <c0bf5728-55b5-46e5-aced-4f856144f746@intel.com>
 <76186614-aa16-4a73-8fa9-059bb0a70486@huawei.com>
 <27737fa5-0f32-48df-b9e4-cce8e7cdd18e@intel.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <27737fa5-0f32-48df-b9e4-cce8e7cdd18e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)

Hi Reinette,

On 3/23/2026 11:52 PM, Reinette Chatre wrote:
> Hi Yifan,
>
> On 3/23/26 2:19 AM, wuyifan wrote:
>> Hi Reinette,
>>
>> On 3/13/2026 5:01 AM, Reinette Chatre wrote:
>>> Which baseline exposes MB_MON in resctrl?
>>>
>>> Reinette
>> In the MPAM architecture reference manual, the memory-system component
>> includes the cache and memory channel controller, among others. The memory
>> channel controller can implement a memory bandwidth usage monitor.
>> I noticed that arm_mpam maps other classes to l3 in the resctrl glue code,
>> so I will fix this in the next version.
> Were these tests written against a spec as opposed to the actual MPAM enabling
> code? How could it have been tested?
>
> Reinette
Oh, I should add that the current Linux arm_mpam resctrl glue code is
still under review and has not been merged. Therefore, this RFC is based
on the Linux distribution OS test, so please ignore this issue. I will
remove this in the next version.

Regards,
Yifan Wu
