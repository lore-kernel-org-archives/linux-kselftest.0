Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F3523AB8D;
	Wed,  4 Feb 2026 01:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770167680; cv=none; b=LKmvha3h2ftPwFTEzqKZuW+tlH56GmD/yX30qkg93++k1aKCiCrTZ/ph/Z2rotl0I6+HMWZpYlqLGWiJZN8mKlZ8GWJEtppk9UZSjpprT6juk5QqsPYDfMINLZDQNDiWhTm+bzOvFIj4ZCScmAdvFY9gddPrixQvQBm/dJDTi6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770167680; c=relaxed/simple;
	bh=00nfPGyTtc8tXm9bcLTfP0n/oJ3YOvF8pB/jtPDLcHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tmcLjmYERAjzfLh2ouxXXRUju0aEYp40J/73/uoRoIPTjGUVdPhILqZaPGXw0k0cljgkLOg6hnU6n2FJHMpaFi27fNmvqW6U50Xn6RmaeOrML0i4M05hZN2Qfwfw9eyLdmxAZnqKQzseaX3JhG3MxUWBoqhL9vuzFgikYN/J0QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=wZ7gQZbd; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="wZ7gQZbd"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Sab77aD3NRaoRo9PD9BOaCGAGHr4ZUPWfgWJALWIRPg=;
	b=wZ7gQZbdRK1+GZJS0jqOE3vl4vndzym+EBkMx/e87JCQYlMowNqiiWFcFFSOLsIodNDjDP7VH
	Pbf6sr2gRUP2LA39TVUIGDKMjf5xKd0XjR+qKjsbVrgUGRo0+8feiw2xtUjSeNAl8zXJCQVGVWv
	edQ7DVAwewg5jGt33bT1164=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4f5Mhn016vzRhXJ;
	Wed,  4 Feb 2026 09:10:01 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D26A4056A;
	Wed,  4 Feb 2026 09:14:34 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Feb 2026 09:14:32 +0800
Message-ID: <a22ccdb5-5449-5e48-790a-5c3dd0de7544@huawei.com>
Date: Wed, 4 Feb 2026 09:14:31 +0800
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
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

Sorry for misunderstanding your v11 reply—however, these patches can
still be applied directly to the core/entry branch.

Thanks,
Jinjie
> 
> 
