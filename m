Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B1D23D2AB;
	Fri, 27 Mar 2026 05:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774591177; cv=none; b=c3LHuaJXlDN8tJ0dcVD0mSE1fjI63XXaal6aLLBC3bnA2ApUNXG3qItHBcvV/Cx+i9pBHMkNCov4836znWVZRZ9hOImFaiLSt4EBCs90gmy6Tt8h2srJCVgh0eKI3O88LuA4hahVn5TofM6sqB+R+IfbTLV2ICthhlmtNLSPhVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774591177; c=relaxed/simple;
	bh=qN+XGd+aWZC44MrJ2njG2OhFIOijEHlX++1QQYyP5uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AKHL8qsXcHve8lQ9AYimZMA2nL/8ozEBpXyosCJaE1sBCWctuv+P8Kh2Bx0LERobnC78yqWCq9K6SDUpoUFuUSUPrbM8sC+1S+ehHFlhkxqHyjS5DERvURoLUh+VqiPZ7p/FuhR1+W3tYbWVdfJ7UlXvWtagU+CrRss+t5PGZyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=UptJYoNQ; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="UptJYoNQ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NRXLsnkWHpLD2U3HVcRv86U8YDyR3CzfpMUGFNv4ORU=;
	b=UptJYoNQr/0I2Jzqdawje9po4fVSAQ3+f1ZKH3VqOUw9CsQotr2848QswnNfBwsXkk1Oj90hO
	JiYZNM93J6xvCGx5cOcZOLFqe83AlDuFtN7MmfegoCSM+hO1PnVzz1HZ/AtbHi8AQOTqHq7Itn6
	LB260z1Rh6ezAUM+h3O3b7s=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fhqZs2wL9z1T4FZ;
	Fri, 27 Mar 2026 13:53:57 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 151F84056D;
	Fri, 27 Mar 2026 13:59:31 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Mar 2026 13:59:30 +0800
Message-ID: <92799aa5-9959-43e0-b993-2cbe29dff584@huawei.com>
Date: Fri, 27 Mar 2026 13:59:29 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] selftests/arm64: Fix sve2p1_sigill() and add
 cmpbr_sigill() for hwcap test
To: Will Deacon <will@kernel.org>, <catalin.marinas@arm.com>,
	<shuah@kernel.org>, <broonie@kernel.org>, <yeoreum.yun@arm.com>,
	<jonathan.cameron@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <kernel-team@android.com>, <xiaqinxin@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangyushan12@huawei.com>, <xuwei5@huawei.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>
References: <20260305013638.992301-1-wuyifan50@huawei.com>
 <177279809096.1376203.6124931515335372340.b4-ty@kernel.org>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <177279809096.1376203.6124931515335372340.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)

HiWill,

Gentle ping on patch 2/2. I have received a Reviewed-by from Mark Brown

and there have been no further review comments so far.

Could you please consider applying it if everything looks good?

On 3/6/2026 8:26 PM, Will Deacon wrote:
> On Thu, 05 Mar 2026 09:36:36 +0800, Yifan Wu wrote:
>> This patch series fixes and adds two selftests in the arm64 hwcap
>> test suite.
>>
>> Patch 1/2 fixes the sve2p1_sigill() test to correctly detect the
>> FEAT_SVE2p1 feature. Previously, the test incorrectly assumed that
>> the presence of FEAT_SVE2.1 implied support for the BFADD
>> instruction, which actually depends on the FEAT_SVE_B16B16 feature.
>> The test is updated to use the LD1Q instruction, which is
>> unambiguously implied by FEAT_SVE2p1.
>>
>> [...]
> Applied first patch to arm64 (for-next/fixes), thanks!
>
> [1/2] selftest/arm64: Fix sve2p1_sigill() to hwcap test
>        https://git.kernel.org/arm64/c/d87c828daa7e
>
> Cheers,

Thanks,

Yifan

