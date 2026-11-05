Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864980;
	b=5E9hcmQ7384qqDJOVAEdL4Oc0ZbTMMG3btBO4MAYH//UMqBzHpr2P5IiGM3jfvWsEDFn
	 hOJV4zSt1RcxMnzrDIx+x35DbZ5pWXxros+65W3HWOE5GyiuPgsqPRKnFq0wabgDVoVXg
	 jiFMWZEt7xzVMpPedGFaQrK3/YBL2GQz+UyvFO63z7Jej+mUkvbkbRJ+EPAitx7DybLxp
	 WfKiUCnZ32KRJR/5ITsbsKHsKmdltrJj2z22wlkBNDkx9eTTNWNkZ0RLG8V7LiyvsBhiZ
	 tFDbuDs/NkOsYI8JEEOY7kch03dUXkMAd4qlLifsGOGb+1kbrwAyTYeNNk2qAGG67lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864980;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=e+3EkuIwBIYa/pzYl4lmmZvtc2fUKvaNoTpHxcQ8xL0=;
	b=13wmToZQ+EDlA3ioS4yzK2rSgQz/mlzNFdSD6IxZKGnp1tj1fB2qqZiB7abBIBWtJTui
	 odYbLTdo5uZ/MTcnd6o68KuV0DViKXRM7cLCwgUSjAEIOWttfUdx60YVt3XEiu81FOZuJ
	 q+JIqIcIhGuy2HuOOJ5fXfljNCd4Er9pc8wAn2J2vBKm2KHqxocR3CdHY7wm74khEb1j2
	 ygHitTHvx5Dczi7w/ZX4wPFP2EnPclOUWnFfiMU5ZGSj6ZnhUU4IgxyIxV6oWHWuDGIDN
	 DVGdif8uTxmoayzOjux1F07b0pSYtOO05UUbKvbQgdWbFwPAkjgZQ/MXAMNuwpyn1vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=VVZcxHIM;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED2D606A329;
	Thu,  5 Nov 2026 07:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED2D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=VVZcxHIM
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=e+3EkuIwBIYa/pzYl4lmmZvtc2fUKvaNoTpHxcQ8xL0=;
	b=VVZcxHIM9PhL67RrigzJjiiTvnlifhcQKpZh2ZIYjbvoILjNOMHnpknk30+AUjRhECxp10Tl7
	OuNuCy8gYf2I5pyKB7WQ9O/k2zDT3SQAW8WCnBASqCopILpkVXXglmR+xtyHcor/vILUfQPO4hi
	W+bWnlp0mQxMXGmEWUeqBCo=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jKvbG10qhznTVh;
	Thu,  5 Nov 2026 15:49:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F30B40572;
	Thu,  5 Nov 2026 15:49:28 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:49:27 +0800
Message-ID: <4831fb24-85f2-4273-9cf8-9ac60dd6555f@huawei.com>
Date: Thu, 5 Nov 2026 15:49:26 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 00/15] arm64: entry: Convert to Generic Entry
To: Linus Walleij <linusw@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <kevin.brodsky@arm.com>, <yeoreum.yun@arm.com>,
	<james.morse@arm.com>, <thuth@redhat.com>, <tglx@kernel.org>,
	<vladimir.murzin@arm.com>, <broonie@kernel.org>, <ryan.roberts@arm.com>,
	<liqiang01@kylinos.cn>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260930101805.1770358-1-ruanjinjie@huawei.com>
 <88c40977-28f1-4f01-aa5c-6dedac822d21@huawei.com>
 <CAD++jLnX2ptZnOHWvU6QR+4VKeM+kPfjShkB0DQZpr3hnG0DOQ@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAD++jLnX2ptZnOHWvU6QR+4VKeM+kPfjShkB0DQZpr3hnG0DOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/4 21:38, Linus Walleij 写道:
> On Mon, Oct 26, 2026 at 9:52 AM Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
>> Hi Mark and all,
>>
>> Ping.
>>
>> Are there any further review comments or new suggestions for changes?
>> I’m happy to address anything that comes up.
> 
> You're pinging in the middle of the merge window, people are busy!

Hi Linus,

Sorry for pinging during the merge window.

> 
> Now that v7.4-rc1 is out, rebase on v7.4-rc1 and resend please.

No problem. Will rebase on v7.4-rc1, retest and resend. Thank you!

> 
> Sorry that this requires constant rebasing and resending, generic
> entry is so intrusive that we need to take baby steps... maybe we

System calls path seem to be more deterministic than the interrupt path.
However, considering that arm64 is widely used and this is in a critical
system path, it is indeed necessary to think twice before proceeding.

> can merge some of the patches and not yet all? I.e. a trickle-in
> method?
Ensure there are no functional changes, a trickle-in works for me.
And it may give me more confidence to move forward 😂

> 
> Yours,
> Linus Walleij

-- 
Best regards,
Jinjie

