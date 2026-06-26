Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D714315F;
	Fri, 26 Jun 2026 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466916; cv=none; b=o+CneGc6iGt0qJYE1xJW4YspmpoV80098KKSFqv/D1ptJS1ICas6HQt62qDd/VRtMvST3GQqIkfJM5lrGZdh3+4lFcyPQTIyjAN+27eGE6jSXChtSz5KWfb0Dy45yVXd4bt19rytJXqolB14AX75vV11FTcw24I49fMoShHDSHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466916; c=relaxed/simple;
	bh=q3NRlpjaljZg3JkikV1IT37K7EEGx39SkorpH29rnhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rh780GcEz9IZCHoUl3zc6JNfTIbxPQSJzGs3wBC/bsDMl7HMpnhu47WNzBNm0800RQDEEcnEsZ6rXz30GaDH346SLOBvhvdXB5vrFgSBzArE/GNtiQzxRgUP1cuJD48s2HUfHWDEbphO0M0D2EL2WHIhkVZeKVJHC/5tdAEWla4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=NAg6GSVV; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="NAg6GSVV"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aU+ZVJWUFbXJl/s6q7mAYCg+DXSgYj0pnTTXwIBetJ4=;
	b=NAg6GSVVtYzuc0YRohXjHv7ZSKuSZqNCdXTDdce47xjtxRXyvyJhoLsHokEIPz+LoJluboskT
	YdVnVSSngJeTGiSGzR4LEhhB2j9S2b5krVQnGkH0P5UbMrvArAu0e0pBox2m+zUEqQuENg79hvL
	OYstE5ltzgBdFJX2CBarUp8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gmr7F12k7z1prLC;
	Fri, 26 Jun 2026 17:32:41 +0800 (CST)
Received: from kwepemo100012.china.huawei.com (unknown [7.202.195.139])
	by mail.maildlp.com (Postfix) with ESMTPS id B02B840571;
	Fri, 26 Jun 2026 17:41:49 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemo100012.china.huawei.com (7.202.195.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 26 Jun 2026 17:41:48 +0800
Message-ID: <593b5631-01ef-46ef-ba95-8ff8842bae4f@huawei.com>
Date: Fri, 26 Jun 2026 17:41:48 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] selftests/resctrl: Replace counter index
 references with pointers
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
 <20260522090540.444554-3-wuyifan50@huawei.com>
 <77d30d2d-91db-456e-bf41-2cc31165bd2d@intel.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <77d30d2d-91db-456e-bf41-2cc31165bd2d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo100012.china.huawei.com (7.202.195.139)

Hi Reinette,

Thanks for the review.

On 6/26/2026 6:14 AM, Reinette Chatre wrote:
> On 5/22/26 2:05 AM, Yifan Wu wrote:
>> Replace direct counter number references with pointers to remove the
>> dependency on fixed array indexing and enable the use of different
>> data structures for counter management.
>>
>> Signed-off-by: Yifan Wu<wuyifan50@huawei.com>
>> ---
> Please improve readibility here by moving the above two lines up while ensuring alignment with
> open parenthesis. Specifically:
> 	imc_counter->fd = perf_event_open(&imc_counter->pe, -1, cpu_no, -1,
> 					  PERF_FLAG_FD_CLOEXEC);
> ...
>
> With the style fixups:
> | Reviewed-by: Reinette Chatre<reinette.chatre@intel.com>
>
> Reinette

I will fix that.

Thanks,
Yifan

