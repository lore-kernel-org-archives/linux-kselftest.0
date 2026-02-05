Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBAE70809;
	Thu,  5 Feb 2026 01:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770254426; cv=none; b=sZS5+XgPdLwTbzYutt94Q9hQG6KAJA8HN3dAswjBRbNopAJKSw9RFY7NEjSaWFVOLrVmUru7j21ouqsyNEY/l0gqp6IfdH2RV5AeBPNgyzeXjdmHk2HdzMT+QDsf18HmgktrGF8hBPFWYKSA9BxsSSuh9KdUxK0KVeCSkWso84A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770254426; c=relaxed/simple;
	bh=2fc4KV1/PRiJ0ZzHuhfqhfHyGKLgVSWVYKW+JGKSuL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PEa3gN2OVFMbApzBuv775zd43NsPOeFs59ZFD3D6m6GJtSFu9jE6QZbXg1SZhr/oQ18IPpDVTeq2mja9HD/UMfRI897VYcG/mYcz287i0cAXjK3GiAFF/ifcTt7R8OjIgnuHvaeDqezD+2NFWI50z2Q2X3KySxBbL8PgFkcb+BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=af1PnjGv; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="af1PnjGv"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MJFRYStTa8t+Xo+rPSmdjbnHA08UchzozX/e9R3wx4M=;
	b=af1PnjGvwLCSHKqGiYSKqriAiaGFhXGRJgp8eUJg9qDUsgchwrSGftPg1P/82+nasjFFMy0hp
	nNuLG4/+Rc96K+z/Ad4VgSJVb4pat+yNFwbvkrWC++HPY2LTl/AO/CF89iYhkeniifjJw+c6DNm
	E44m7kmfl78RiH6atEqQtT4=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4f5zmt3CYPzmV71;
	Thu,  5 Feb 2026 09:15:42 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DF10840565;
	Thu,  5 Feb 2026 09:20:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 5 Feb 2026 09:20:16 +0800
Message-ID: <704d4e92-b1b7-5506-568a-92605086f376@huawei.com>
Date: Thu, 5 Feb 2026 09:20:15 +0800
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
To: Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>
CC: <catalin.marinas@arm.com>, <oleg@redhat.com>, <shuah@kernel.org>,
	<kees@kernel.org>, <luto@amacapital.net>, <wad@chromium.org>,
	<kevin.brodsky@arm.com>, <akpm@linux-foundation.org>, <charlie@rivosinc.com>,
	<ldv@strace.io>, <anshuman.khandual@arm.com>, <mark.rutland@arm.com>,
	<ryan.roberts@arm.com>, <thuth@redhat.com>, <song@kernel.org>,
	<ada.coupriediaz@arm.com>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<liqiang01@kylinos.cn>, <kmal@cock.li>, <dvyukov@google.com>,
	<reddybalavignesh9979@gmail.com>, <richard.weiyang@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
 <87bji552uk.ffs@tglx> <2699bcdc-8d56-7fe9-fa9a-a3d61476e806@huawei.com>
 <87y0l823o9.ffs@tglx> <aYM2jM5BMRGdjnt4@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aYM2jM5BMRGdjnt4@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/2/4 20:07, Will Deacon wrote:
> On Wed, Feb 04, 2026 at 11:39:34AM +0100, Thomas Gleixner wrote:
>> On Wed, Feb 04 2026 at 09:28, Jinjie Ruan wrote:
>>> On 2026/2/3 22:16, Thomas Gleixner wrote:
>>>> On Tue, Feb 03 2026 at 21:37, Jinjie Ruan wrote:
>>>>> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
>>>>> maintainers' work easier and codes more elegant. arm64 has already
>>>>> successfully switched to the Generic IRQ Entry in commit
>>>>> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
>>>>> time to completely convert arm64 to Generic Entry.
>>>>>
>>>>> The goal is to bring arm64 in line with other architectures that already
>>>>> use the generic entry infrastructure, reducing duplicated code and
>>>>> making it easier to share future changes in entry/exit paths, such as
>>>>> "Syscall User Dispatch".
>>>>>
>>>>> This patch set is rebased on "sched/core". And the performance
>>>>
>>>> Why are you using sched/core, which contains a lot of unrelated
>>>> changes. core/entry is the one which has the prerequisites and nothing
>>>> else....
>>>
>>> By the way，it looks like core/entry and arm64 for-next/entry have
>>> diverged: the first three patches of this series are already in arm64
>>> for-next/entry but missing from core/entry.
>>> Perhaps the two branches should be reconciled so that both contain the
>>> same baseline.
>>
>> The first three patches of this series are ARM specific and have nothing
>> to do with the queued core/entry changes in tip. They are independent of
>> each other and these three ARM64 changes have no business in my tree.
>>
>> If the ARM64 folks want to apply the rest of your series then they have
>> to pull the core/entry branch into their for-next/core branch first so
>> the whole thing builds.
>>
>> But given that the merge window opens on sunday, this is probably moot
>> anyway and the rest of this series can go on top of rc1 in the ARM64
>> tree w/o any further complications.
> 
> Yup, the rest of the series (beyond what we've both queued) also needs
> some more review so this is all post -rc1 material.

Sounds good; I’m looking forward to more expert eyes on the remaining
patches once -rc1 is out.

> 
> In the meantime, thanks for picking up the generic bits.
> 
> Cheers,
> 
> Will
> 
