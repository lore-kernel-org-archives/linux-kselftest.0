Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A8B3E7BB5;
	Fri, 26 Jun 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467037; cv=none; b=ZQ6wkVvtiwQPcIAjKJ6VcdueQBiUoJorFQbOSwtXlMAAHla69uP11VIsR8ye29wAH15ZR6dVgJuBSuxc6nKo886yZDbki9kgLyZeyYMcC+eK0gSoelDe1X3m5o4vSo1AMjoD5ef0NiYiP8+N/cPUXGW/MUr3cBMcBx5dihJxJ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467037; c=relaxed/simple;
	bh=v19RZ2lqJbWLkDDjnfTteiXlamzU232XokFC8+lyjHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JpMx6oqfofggzKdGOWTeuCumGP4KuF/Ci/AnDhRHU7XoNeqkRhyOq6GiI/0lg3EOe6ZajJrZkiEb4/ftYzNpiu0g9gemjD8onicPrY0utfu4bSRLCr+P39KIcpEU9fwpvT/CIYAKwr6lx+OW/Tl/WLT7EKGdWWlptVxE8I1GLzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=UEHM1jVN; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="UEHM1jVN"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=v19RZ2lqJbWLkDDjnfTteiXlamzU232XokFC8+lyjHg=;
	b=UEHM1jVNf7BP9u0yXkvP3oGBWyKHcXY8YT8KQke/s2C7r1sps6XGkJrccc/RsRKYFQhcjvEwV
	krutcXuKigZEEOo8RNUVI7pLINxnLvYxUV4tMm+YB9rkIdoEwzq+JTGIfUEIntEKfcHFEHC4+NP
	a7pF/zXkvCNTyxTKZF6DhuQ=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gmr9y3GGrz1T4Gb;
	Fri, 26 Jun 2026 17:35:02 +0800 (CST)
Received: from kwepemo100012.china.huawei.com (unknown [7.202.195.139])
	by mail.maildlp.com (Postfix) with ESMTPS id 224EB40571;
	Fri, 26 Jun 2026 17:43:46 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemo100012.china.huawei.com (7.202.195.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 26 Jun 2026 17:43:45 +0800
Message-ID: <e7c848ec-fd87-4b51-ac88-72e911023818@huawei.com>
Date: Fri, 26 Jun 2026 17:43:44 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] selftests/resctrl: Enable dynamic management of
 IMC counters via linked list
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <zengheng4@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260522090540.444554-1-wuyifan50@huawei.com>
 <20260522090540.444554-4-wuyifan50@huawei.com>
 <8b51dca5-d1fe-492d-8d54-7709aee4a6c5@intel.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <8b51dca5-d1fe-492d-8d54-7709aee4a6c5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo100012.china.huawei.com (7.202.195.139)

Hi Reinette,

On 6/26/2026 6:14 AM, Reinette Chatre wrote:
> With fixup applied and nit addressed:
> | Reviewed-by: Reinette Chatre<reinette.chatre@intel.com>
>
> Reinette
Thanks for the review. I will fix that.

Thanks,
Yifan
