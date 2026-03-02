Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165E319C553
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 03:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772422821; cv=none; b=gP/T27PzO1W0dgwqt79b/oD82sl/xKEkI/qmdj/HpygnQ2b//qZM8nczZ0E93xDFqqUSJuiOwMGZS5PRC8TarIYQpH6E+cH3d5YIOL323AGB9QRKQdk0Dnt739ZHh6UuZ56XD7pqOl6tGoGYr90YUT2NxXVqqhRRP/gaCGib6IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772422821; c=relaxed/simple;
	bh=cET+M7f3hsKa7F7aIjCdwibC0If/dSrIrjSgtFzmrj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CiOSSLWagmAM8fcmspzvxImbBdgDAigQ7qjGWj2wx2j75v5LZ9b1OdIb1B81Mwhnd+iy25QFnOuStyeTunnF73Au9A9CNDHEb0Or4e6A3Euf03TbdPK4Kwqn1141OE3CJZkwyMMNY4OQDYyELFBm/b7ttgculhAVeGxiOiGsZxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=JVS6HrRx; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="JVS6HrRx"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=z6qxHDNamani4Rg1V5azVGzGRjelNSeNo5w5yKlUqHQ=;
	b=JVS6HrRxQxci4t6bQUaAwzn3eLdmgzPn9moU1lQdLRPZmjcKXZyTq3nOdTP8GHP8Lwv03hF4D
	miWYwmvSxwLb9ZxiOXInxGM5291im/E47ssBnrAE/S0hticPBWXA0unJpK1rQ2zQLBEkZANOXMg
	q8ryAQvJO+tVd86EP9/pHKQ=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fPPhZ07tMzmV7B;
	Mon,  2 Mar 2026 11:35:26 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A924C4056D;
	Mon,  2 Mar 2026 11:40:16 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 2 Mar 2026 11:40:15 +0800
Message-ID: <f0caa8dc-86dd-49fb-a879-a6be6caac400@huawei.com>
Date: Mon, 2 Mar 2026 11:40:15 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftest/arm64: Fix sve2p1_sigill() to hwcap test
To: Mark Brown <broonie@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<yeoreum.yun@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>, <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260227031933.4103333-1-wuyifan50@huawei.com>
 <20260227031933.4103333-3-wuyifan50@huawei.com>
 <aaLv_X7SihBUX5c_@sirena.co.uk>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <aaLv_X7SihBUX5c_@sirena.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)

Hi Mark,

On 2/28/2026 9:39 PM, Mark Brown wrote:
> On Fri, Feb 27, 2026 at 11:19:33AM +0800, Yifan Wu wrote:
>> The FEAT_SVE2p1 is indicated by ID_AA64ZFR0_EL1.SVEver. However,
>> the BFADD requires the FEAT_SVE_B16B16, which is indicated by
>> ID_AA64ZFR0_EL1.B16B16. This could cause the test to incorrectly
>> fail on a CPU that supports FEAT_SVE2.1 but not FEAT_SVE_B16B16.
>>
>> LD1Q Gather load quadwords which is decoded from SVE encodings and
>> implied by FEAT_SVE2p1.
> Ah, good spot - I think my search for instructions to use got confused
> by them mention of SVE2 in the description of BFADD.  Since this is a
> fix it should really be patch 1.
>
>> -	/* BFADD Z0.H, Z0.H, Z0.H */
>> -	asm volatile(".inst 0x65000000" : : : "z0");
>> +	/* LD1Q Z0.Q, P0/Z, Z0.D, X0 */
> That should be:
>
> 	LD1Q {Z0.Q}, P0/Z, [Z0.D, X0]
>
> (the existing asm has some issues which we ought to get round fixing but
> may as well keep the new stuff good.)
>
>> +	asm volatile(".inst 0xC400A000" : : : "z0");
> Verified the decode with objdump.  With the above change to the comment:
>
> Reviewed-by: Mark Brown <broonie@kernel.org>
Thanks a lot for the review and the tag! I'll update the comment and re-
order the patches in v2.

Regards,
Yifan Wu
