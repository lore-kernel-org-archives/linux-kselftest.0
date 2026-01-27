Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E622836F;
	Tue, 27 Jan 2026 03:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769482895; cv=none; b=iNXyhgD03xoIRgQCehpxvemIAtbuLZi68ngB2liVyO7ErRhxbPnh1Q3BELSDqa+ai2DFWHT0zC2Lq8k5Qd8FQdt3EdBTJ4LD6t4219Y4vxMSGglbU7QfwTx+UjPuozq59gx6F9tpjue8k05neW8H59fR6FeSD0tBxlpN6x65cIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769482895; c=relaxed/simple;
	bh=3WVIWiGh6YtGfjqPzCIhZT0UtM+Rcd+5WipHDVihDqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZSlRSpmjZBBrfGewpv5k/mWxLlXO52w71+ZBPOMSk7zbM9j3/a6+UcI6n3cZm/U83xidIT8AaY3/I2PxEvXMO6lwdiNj3NyZ7BYY0eHAx3LNJA8PhmO0wMQ6+R0xtxpv9lAuCLm7cId50g2IG9n1798/pF7j4P+ycK9H3/kb2a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=U9UeUm0Z; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="U9UeUm0Z"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LECAear6oZ7wAC861/+kjDghiRGgmPGN0pG+1RSutYI=;
	b=U9UeUm0ZfuMBkWsdJBQ66gsKFmQ8yMAxWC/2wnbT/jj7tMyVpuy1U2Hkv5iDrl2zP71o1d+2V
	HgwXSkD0T35iH+Ire1hJJIcW5axr80jQ4k/B6gBeRMxhLvmxjCEgFqrqiG9h6Y0UIuYrluHOHMg
	byOerm1ChfV/bgwWY7TmE9k=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4f0VSy4kQyz1prR2;
	Tue, 27 Jan 2026 10:57:54 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DB91C4056A;
	Tue, 27 Jan 2026 11:01:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 27 Jan 2026 11:01:17 +0800
Message-ID: <4f07254d-b158-a1ce-69a7-4fa4b0f339c1@huawei.com>
Date: Tue, 27 Jan 2026 11:01:16 +0800
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
To: Will Deacon <will@kernel.org>
CC: <catalin.marinas@arm.com>, <oleg@redhat.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <kevin.brodsky@arm.com>,
	<macro@orcam.me.uk>, <charlie@rivosinc.com>, <akpm@linux-foundation.org>,
	<ldv@strace.io>, <anshuman.khandual@arm.com>, <mark.rutland@arm.com>,
	<thuth@redhat.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<ada.coupriediaz@arm.com>, <broonie@kernel.org>, <liqiang01@kylinos.cn>,
	<pengcan@kylinos.cn>, <kmal@cock.li>, <dvyukov@google.com>,
	<richard.weiyang@gmail.com>, <reddybalavignesh9979@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-5-ruanjinjie@huawei.com>
 <aXeZdh3CtznU8u6L@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aXeZdh3CtznU8u6L@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/1/27 0:42, Will Deacon wrote:
> On Mon, Dec 22, 2025 at 07:47:25PM +0800, Jinjie Ruan wrote:
>> The generic syscall entry code has the following form, which use
>> the input syscall work flag and syscall number:
>>
>> | syscall_trace_enter(struct pt_regs *regs, long syscall,
>> |		      unsigned long work)
>> |
>> | syscall_exit_work(struct pt_regs *regs, unsigned long work)
>>
>> In preparation for moving arm64 over to the generic entry code,
>> refactor syscall_trace_enter/exit() to also pass thread flags, and
>> get syscall number by syscall_get_nr() helper.
>>
>> No functional changes.
>>
>> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/include/asm/syscall.h |  4 ++--
>>  arch/arm64/kernel/ptrace.c       | 25 ++++++++++++++++---------
>>  arch/arm64/kernel/syscall.c      |  5 +++--
>>  3 files changed, 21 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
>> index 5e4c7fc44f73..cef1d9ce6e1b 100644
>> --- a/arch/arm64/include/asm/syscall.h
>> +++ b/arch/arm64/include/asm/syscall.h
>> @@ -120,7 +120,7 @@ static inline int syscall_get_arch(struct task_struct *task)
>>  	return AUDIT_ARCH_AARCH64;
>>  }
>>  
>> -int syscall_trace_enter(struct pt_regs *regs);
>> -void syscall_trace_exit(struct pt_regs *regs);
>> +int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags);
>> +void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
>>  
>>  #endif	/* __ASM_SYSCALL_H */
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index f333791ffba6..79762ff33945 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -2407,9 +2407,8 @@ static void report_syscall_exit(struct pt_regs *regs)
>>  	}
>>  }
>>  
>> -int syscall_trace_enter(struct pt_regs *regs)
>> +int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags)
>>  {
>> -	unsigned long flags = read_thread_flags();
>>  	int ret;
>>  
>>  	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
>> @@ -2422,19 +2421,27 @@ int syscall_trace_enter(struct pt_regs *regs)
>>  	if (secure_computing() == -1)
>>  		return NO_SYSCALL;
>>  
>> -	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
>> -		trace_sys_enter(regs, regs->syscallno);
>> +	/* Either of the above might have changed the syscall number */
>> +	syscall = syscall_get_nr(current, regs);
> 
> I understand that you're gradually making the arch code more similar to
> the core code so that we can switch over to it, but I'm struggling to
> understand why syscall_trace_enter() takes the 'syscall' argument.
> 
> Even the core code just seems to use it as a local variable, which it
> overrides before it ever uses it. What am I missing?

Hi,

You're absolutely right. The 'syscall' parameter is indeed treated as a
local variable and gets overridden before any real use. Should we
refactor to remove the parameter entirely in generic entry?

Regards,
Jinjie

> 
> Will
> 
