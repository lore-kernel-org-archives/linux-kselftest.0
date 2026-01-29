Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C45C3358CE;
	Thu, 29 Jan 2026 13:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769691996; cv=none; b=lSlAIXPptC8e+oFdYL44h+7fV50F6RouHuN888wsJUjV0+DBf4K/6CKOaPsub/TbNEUiS/+OC+69X8UslpTGrYuTakzmEKev68w869ki0oMEe9hVdo7BK06xEk5ZOycJhj9V6xKNJdCgfJN6RQf7ZsMFkBdXM2bynhipKwS3aG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769691996; c=relaxed/simple;
	bh=fDnRJ2yTV8Z95TcGaNprZrAHsp6BPXxO2333kqZhoZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r7zK4eN6CPD2DiljR/I7ApXhHu5uuBWSr2RQJ51vEkxcy0FoLvrsmkdROvTBAtRcsLjsh8UA++qJ/YLoUnrLsqYxsC24IpeHPCFMrS6WkooM7txNLyjm8E+euuXWzwjaEViYMEpvwL//Gvn+eJcA4L3MY0IyjVd6QOsODgk7yhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=3Y6xyqMw; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="3Y6xyqMw"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GTnuhB/pVO7aMJD3sAaOMEUxG7l97PIRuZ4UqDZOeik=;
	b=3Y6xyqMwnKDy5yc69pn0nYunYWkYMy0SUmue71GjH6RxwjkxPpo2dSeKqIABPbIsVeKHfH8Ju
	H3avJCzPQ4w+59FyUopowm9ZxvmjP5zwZ0O1b1J8gALtMdDSPBqoGna8k2Up+xXD+keNhIBPYXQ
	xZbCDOoBEazSyaljePt4ARg=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4f1znf0RTszpTJy;
	Thu, 29 Jan 2026 21:02:30 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 58C3B4056D;
	Thu, 29 Jan 2026 21:06:30 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 Jan 2026 21:06:28 +0800
Message-ID: <0a650379-e4b4-0a30-e4b0-e8d131ae1dbb@huawei.com>
Date: Thu, 29 Jan 2026 21:06:27 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v11 03/14] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
To: Kevin Brodsky <kevin.brodsky@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <deller@gmx.de>,
	<akpm@linux-foundation.org>, <charlie@rivosinc.com>, <mark.rutland@arm.com>,
	<anshuman.khandual@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<thuth@redhat.com>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-4-ruanjinjie@huawei.com>
 <c70d3fd6-0b62-464b-8e99-e74f07c20846@arm.com>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <c70d3fd6-0b62-464b-8e99-e74f07c20846@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/1/29 20:06, Kevin Brodsky wrote:
> On 28/01/2026 04:19, Jinjie Ruan wrote:
>> commit a9f3a74a29af ("entry: Provide generic syscall exit function")
>> introduce generic syscall exit function and call rseq_syscall()
>> before audit_syscall_exit() and arch_syscall_exit_tracehook().
>>
>> And commit b74406f37737 ("arm: Add syscall detection for restartable
>> sequences") add rseq support for arm32, which also call rseq_syscall()
>> before audit_syscall_exit() and tracehook_report_syscall().
>>
>> However, commit 409d5db49867c ("arm64: rseq: Implement backend rseq
>> calls and select HAVE_RSEQ") implement arm64 rseq and call
>> rseq_syscall() after audit_syscall_exit() and tracehook_report_syscall().
>> So compared to the generic entry and arm32 code, arm64 calls
>> rseq_syscall() a bit later.
>>
>> But as commit b74406f37737 ("arm: Add syscall detection for restartable
>> sequences") said, syscalls are not allowed inside restartable sequences,
>> so should call rseq_syscall() at the very beginning of system call
>> exiting path for CONFIG_DEBUG_RSEQ=y kernel. This could help us to detect
>> whether there is a syscall issued inside restartable sequences.
>>
>> As for the impact of raising SIGSEGV via rseq_syscall(), it makes no
>> practical difference to signal delivery because signals are processed
>> in arm64_exit_to_user_mode() at the very end.
>>
>> As for the "regs", rseq_syscall() only checks and update
>> instruction_pointer(regs), ptrace can not modify the "pc" on syscall exit
>> path but 'only changes the return value', so calling rseq_syscall()
>> before or after ptrace_report_syscall_exit() makes no difference.
> 
> Let's update this as discussed on v10 - PC can be modified when
> ptrace_report_syscall_exit() is called.

Should rseq see the PC modified by ptrace on the syscall exit path?
If the PC modified by ptrace happens to fall inside the user-space rseq
critical section, is that reasonable? If so, doesn't that make the order
of rseq and ptrace syscall exit in generic entry incorrect?

Could we have an rseq expert join the discussion — Thomas, what is your
opinion?

> 
>> And audit_syscall_exit() only checks the return value (x0 for arm64),
>> so calling rseq_syscall() before or after audit syscall exit makes
>> no difference. trace_sys_exit() only uses syscallno and the return value,
>> so calling rseq_syscall() before or after trace_sys_exit() also makes
>> no difference.
>>
>> In preparation for moving arm64 over to the generic entry code, move
>> rseq_syscall() ahead before audit_syscall_exit().
>>
>> No functional changes.
> 
> And naturally this is not the case.
> 
> - Kevin
> 
>> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/kernel/ptrace.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index 9f9aa3087c09..785280c76317 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -2443,6 +2443,8 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
>>  
>>  void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
>>  {
>> +	rseq_syscall(regs);
>> +
>>  	audit_syscall_exit(regs);
>>  
>>  	if (flags & _TIF_SYSCALL_TRACEPOINT)
>> @@ -2450,8 +2452,6 @@ void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
>>  
>>  	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
>>  		report_syscall_exit(regs);
>> -
>> -	rseq_syscall(regs);
>>  }
>>  
>>  /*
> 
