Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADF81509AB;
	Wed,  4 Feb 2026 01:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770168527; cv=none; b=VSMSjx6pCBFQZ35Q2d9GPkHnP6cKkp5osQm3UDKV/2uBVOpnc5Jqc00a49vcYFqKoXB0bCJt24EEwI7CExyyoIV9RE7/FtwMITj8j6AwcJsTD1SrBxe2CT3uLAB37PIMSUQ19I3iplc9x1wJd9J/AsCyBoIt0akSyfQj5sIMSIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770168527; c=relaxed/simple;
	bh=zuXHPHrmnipfBcKaPWh8E1J7pTJeHGrJVGetj5dq+ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fUruBu/sngx2a1VnV8ANsOtjAvuSDBAJdX/nh/KMQq1895KErXqffWY2UdwHIGL5CegiXzA84FTesfAI9ZbOYlrVq/g+QSHh7oIIbry2al/2WUY9nSW9nB77Tkt/P3FZEGhInYK/jjLI/nAV2w342zMn1gExZYIp2yEvpZIsCjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=zpUsv6Z5; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="zpUsv6Z5"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=L+0hqhwwEEcFoOBs1tRRgPrd1kMmn8Imhm5OGfDiaX8=;
	b=zpUsv6Z5Y8Lo53Zlj04UUtA46/PV3thl93doCgX194Q7eZyh0HmebxnRFUajgX1o5/q3btODi
	ek88WT3o7pvrEB2dTiOuq3PuG/qz27cnuVfJ6Ko/7BEGuUev5OQRCD3I3EoqKqGIwGNB3PIDPMj
	ZN1eBcP//+5yOU2Fe4SmtUs=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f5N135NR4zLlSB;
	Wed,  4 Feb 2026 09:24:07 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 852DD40363;
	Wed,  4 Feb 2026 09:28:41 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Feb 2026 09:28:39 +0800
Message-ID: <2699bcdc-8d56-7fe9-fa9a-a3d61476e806@huawei.com>
Date: Wed, 4 Feb 2026 09:28:26 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v12 00/13] arm64: entry: Convert to Generic Entry
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <kevin.brodsky@arm.com>,
	<akpm@linux-foundation.org>, <charlie@rivosinc.com>, <ldv@strace.io>,
	<anshuman.khandual@arm.com>, <mark.rutland@arm.com>, <ryan.roberts@arm.com>,
	<thuth@redhat.com>, <song@kernel.org>, <ada.coupriediaz@arm.com>,
	<broonie@kernel.org>, <pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<kmal@cock.li>, <dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
 <87bji552uk.ffs@tglx>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87bji552uk.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/2/3 22:16, Thomas Gleixner wrote:
> On Tue, Feb 03 2026 at 21:37, Jinjie Ruan wrote:
>> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
>> maintainers' work easier and codes more elegant. arm64 has already
>> successfully switched to the Generic IRQ Entry in commit
>> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
>> time to completely convert arm64 to Generic Entry.
>>
>> The goal is to bring arm64 in line with other architectures that already
>> use the generic entry infrastructure, reducing duplicated code and
>> making it easier to share future changes in entry/exit paths, such as
>> "Syscall User Dispatch".
>>
>> This patch set is rebased on "sched/core". And the performance
> 
> Why are you using sched/core, which contains a lot of unrelated
> changes. core/entry is the one which has the prerequisites and nothing
> else....

By the way，it looks like core/entry and arm64 for-next/entry have
diverged: the first three patches of this series are already in arm64
for-next/entry but missing from core/entry.
Perhaps the two branches should be reconciled so that both contain the
same baseline.

> 
> 
