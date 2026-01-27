Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF2E3090C5;
	Tue, 27 Jan 2026 11:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769511776; cv=none; b=FaJLv6n5vqi3xQZoV8dFTimB7713nfqSo+F6QnYlAjN+xENhOQExnaWWSfY2mxg7Q8+2R0o+1nkZ9hR6pWo/Zn/9YrsX5a+D23orlxin9Bb/knNlHegWKxvvNZxsb/L1+bRvSH0T2l3wM2pWKH8z7jmBSPtWerNDyOqbRklXIIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769511776; c=relaxed/simple;
	bh=6mU8gN17wNZ17oWhk45n4KUCppYMxqfdcAE1bqDheSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tWz/mGxRXcYzXCCRU1hYYXSGugl8zD7QjsENoNIese8sQjleYBbnbvrgCwPQoyH485Bty8acT7Y074EGAlUmRuLyyU9eTtXPpsGp2F5QGjGPrfeGsYAd9NWgXLaqQ2PGUMoirHTEdgSZoHJA3MqzgYlV2bWpUlNOmBqAO35u3C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=QwPX77kT; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="QwPX77kT"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=N1lvjaqhQkj8mEhgS24AJuAb84AsUGZxYBbZPk8F7T0=;
	b=QwPX77kTAsPwEGUrVO4XKyg2YdoWDEWGAFhgbz7Ies+eHt/UsfIeyjihwTY4t4E0HZjIXkQ/a
	spYLNzK4fiuuiJACK7ymK7g6u2GjAMSV5316vf9LN8VKUFu2VSitTuDGq5ZCkBKGM1EZIqDAc4+
	KczS/IDtVMrt0z5qDVCO/w0=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4f0j7t5Z0Zz12LD7;
	Tue, 27 Jan 2026 18:58:50 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 92A6D40567;
	Tue, 27 Jan 2026 19:02:45 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 27 Jan 2026 19:02:41 +0800
Message-ID: <a1f8a28e-84c3-dcf1-26d6-edbb37a5b750@huawei.com>
Date: Tue, 27 Jan 2026 19:02:39 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v10 04/16] arm64/ptrace: Refactor
 syscall_trace_enter/exit()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, Will Deacon <will@kernel.org>
CC: <catalin.marinas@arm.com>, <oleg@redhat.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <macro@orcam.me.uk>,
	<charlie@rivosinc.com>, <akpm@linux-foundation.org>, <ldv@strace.io>,
	<anshuman.khandual@arm.com>, <mark.rutland@arm.com>, <thuth@redhat.com>,
	<song@kernel.org>, <ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<broonie@kernel.org>, <liqiang01@kylinos.cn>, <pengcan@kylinos.cn>,
	<kmal@cock.li>, <dvyukov@google.com>, <richard.weiyang@gmail.com>,
	<reddybalavignesh9979@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-5-ruanjinjie@huawei.com>
 <aXeZdh3CtznU8u6L@willie-the-truck>
 <4f07254d-b158-a1ce-69a7-4fa4b0f339c1@huawei.com>
 <532b42e2-3417-4e0f-af59-8c79521c34a3@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <532b42e2-3417-4e0f-af59-8c79521c34a3@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/1/27 17:43, Kevin Brodsky wrote:
> On 27/01/2026 04:01, Jinjie Ruan wrote:
>>> I understand that you're gradually making the arch code more similar to
>>> the core code so that we can switch over to it, but I'm struggling to
>>> understand why syscall_trace_enter() takes the 'syscall' argument.
>>>
>>> Even the core code just seems to use it as a local variable, which it
>>> overrides before it ever uses it. What am I missing?
>> Hi,
>>
>> You're absolutely right. The 'syscall' parameter is indeed treated as a
>> local variable and gets overridden before any real use. Should we
>> refactor to remove the parameter entirely in generic entry?
> 
> I noticed this as well, removing it from the generic function would make
> sense. AFAICT that removal could be propagated quite far in fact:
> syscall_enter_from_user_mode_work(), syscall_enter_from_user_mode(),
> even arch implementation (do_syscall_64() on x86).

Not really, it is the default return value of
syscall_enter_from_user_mode_work() as below, so we only need to remove
the parameter in syscall_trace_enter().

static __always_inline long syscall_enter_from_user_mode_work(struct
pt_regs *regs, long syscall)
{
	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);

       if (work & SYSCALL_WORK_ENTER)
            syscall = syscall_trace_enter(regs, work);

      return syscall;
}


> 
> - Kevin
> 
