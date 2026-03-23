Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58E3387566;
	Mon, 23 Mar 2026 09:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257555; cv=none; b=h3KwPK/UhDkx+3KqKBRjxo0Fu+I9kdRNOobmlQ0QpGCn78d1Y2SlwN4vPjUQ0Gv9L70VoXAFC6d6lUtmzxwzZgDdYBV59B7c00bh8wFMOVndvPKF4hviDc/9Bcfh5i4AvQbBZyj8JlDtLgA5qVS1Au2HkEDtvkDzEu72Ccf1Yzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257555; c=relaxed/simple;
	bh=1CBitt41aOPgXc609m1BX5pROPHBEKPBN470I8eWNog=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XqInhh0QZQcOkBWTfDdQweiIX2KwSJFLAAVVEWx9t0V5t2maTJLEQJTVdSDt40//x6aUTw7GEsh89HJ7+huEdAy7GONgNk6fVI32AudMhGdNfgwtwn95RKyxjF3ct3DL2KgA8eAJZYf6H+SfCg8kLdntFkVF8YWfN6GTGqA5NHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=gRfp1lFH; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=gRfp1lFH; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="gRfp1lFH";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="gRfp1lFH"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1CBitt41aOPgXc609m1BX5pROPHBEKPBN470I8eWNog=;
	b=gRfp1lFHfqlIXOiVL12M6sd6Otkn5CAtDcB1hCVnozxdfyhHTvEv7109iyR4PqquNMC8kSHiU
	eo2yluK6FSYiK/ZZ2+QHzEz5n02jYnGw7CSS8dNqoiPd7X1fepmGvLFRsSXdsAliSWppmfNDQ9B
	s8bp40eTCkXPktGmnpt669E=
Received: from canpmsgout10.his.huawei.com (unknown [172.19.92.130])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4ffSKT3r5nz1BGFG;
	Mon, 23 Mar 2026 17:19:09 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1CBitt41aOPgXc609m1BX5pROPHBEKPBN470I8eWNog=;
	b=gRfp1lFHfqlIXOiVL12M6sd6Otkn5CAtDcB1hCVnozxdfyhHTvEv7109iyR4PqquNMC8kSHiU
	eo2yluK6FSYiK/ZZ2+QHzEz5n02jYnGw7CSS8dNqoiPd7X1fepmGvLFRsSXdsAliSWppmfNDQ9B
	s8bp40eTCkXPktGmnpt669E=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4ffSBN6f9zz1K96D;
	Mon, 23 Mar 2026 17:13:00 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id EEB7040565;
	Mon, 23 Mar 2026 17:19:02 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 23 Mar 2026 17:19:02 +0800
Message-ID: <76186614-aa16-4a73-8fa9-059bb0a70486@huawei.com>
Date: Mon, 23 Mar 2026 17:19:01 +0800
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
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <c0bf5728-55b5-46e5-aced-4f856144f746@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500005.china.huawei.com (7.202.194.90)

Hi Reinette,

On 3/13/2026 5:01 AM, Reinette Chatre wrote:
> Which baseline exposes MB_MON in resctrl?
>
> Reinette
In the MPAM architecture reference manual, the memory-system component
includes the cache and memory channel controller, among others. The memory
channel controller can implement a memory bandwidth usage monitor.
I noticed that arm_mpam maps other classes to l3 in the resctrl glue code,
so I will fix this in the next version.

Regards,
Yifan Wu

