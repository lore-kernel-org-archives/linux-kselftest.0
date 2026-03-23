Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE5533F588;
	Mon, 23 Mar 2026 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257530; cv=none; b=I4NHeHvstXJewLiVqviZpNBc50SGHpfGRmx/veHAaVZZDqCkM7KairXHaQdjb7xfxjvQ8mRkYeujrJewsk9z15YL//xAbAzNRtiPYZqBJ4wGTej4O+W7F32x3ielk5XuRA7qvoLN7tCZm8VIHDSSFEEyRIf7VW5u0aO/0+VzSkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257530; c=relaxed/simple;
	bh=IbjhUmOpNQ2inHltxbQacpZ86e06iDC/CQPgMKt4Gfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FRz4pFVcfBFOf0W6r9U+3lz33qFLgtIsOKmNtxlXDHmG3Z80Uovn0gE/D21d28cx60e94Wr8XroCdXp3QHjkZoVZVZJxgFMcxt5bex7wZO6EH79CUqfoVnnBgS41o/ylzhv5btKICqnMjxSkZrjL8tRcWA8CGat3P+ZodhF04E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=aPM2gjUK; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="aPM2gjUK"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YvPpRtGSHmPh2ch5WXgT4YRox0U7e/Twf6WZDwufkuc=;
	b=aPM2gjUKW8ZRKxNj9JBqNXqrPaoQIgaGXP4M9ZVW0m2ARYbnTtOAqrUeGn8M7eKAAMXYPQ8Ac
	5at1w/uRAI1nDa2yiHhuhQV5vUt152rLWZDOR/vnFRVnat1m5vAoGTJrbehZKTEqY+RX6C/yLMe
	Ekan0/hvZj+1pPYzS1SErIA=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4ffSBK2sTSzcb34;
	Mon, 23 Mar 2026 17:12:57 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F3B7404AD;
	Mon, 23 Mar 2026 17:18:45 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 23 Mar 2026 17:18:44 +0800
Message-ID: <bf53579d-93c4-4d7a-b23e-2e0a37fc3803@huawei.com>
Date: Mon, 23 Mar 2026 17:18:44 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 5/9] selftests/resctrl: Refactor CPU vendor detection
 to use lookup table
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
 <20260304040334.765860-6-wuyifan50@huawei.com>
 <e72e0719-615a-470c-821e-dc02c81ef77f@intel.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <e72e0719-615a-470c-821e-dc02c81ef77f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500005.china.huawei.com (7.202.194.90)

Hi Reinette,

On 3/13/2026 4:59 AM, Reinette Chatre wrote:
> Hi Yifan,
>
> On 3/3/26 8:03 PM, Yifan Wu wrote:
> ...
> This is very complex why not just https://lore.kernel.org/lkml/20260123044034.141247-2-tan.shaopeng@fujitsu.com/ ?
>
> Reinette
>
Fine, I will add support for ARM vendors based on the current 
implementation in the next version.

Regards,
Yifan Wu

