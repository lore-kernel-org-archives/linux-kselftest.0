Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654902;
	b=18EFAIZ0j0prhX+LXzdBM3CWmvbtBA8SCgbc0Xugam6j9YwZ9/lxRCkpBFyfIzO+49uD
	 BjMdKVgc/X7TmFiUR42fnHxmeANTHJbmpSwYDSvUTUstoja3nmUaNjzzsIFCaBMfK7ugT
	 LVCriJiqW8MPVWcWVHlXBl4r8L9cJrvXO871gzBMbBM8zBWwVFzL6KAlPaGbhDghMhBp7
	 Tfe6l4z+y7Q4xR/JMnwFcuNcbNZpkul5TWuBKYxYPCnnkpvPyx1281rptQQV7ApV54E48
	 TVSDhthZK1vYa0C3o+Li3UxWLbP0SW4envBUe9M7yQn5HJg9T3W/cZ/8pblVE+Dhjyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654902;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=M8E4COdP9INl7vmnYtyvsXubhK56y6QtsdjvRy8Qv1w=;
	b=3+u42Wsk5gZ+G6MNVH/kaqv+gFM9uRSqaPHsixqxhLYjUiSfKUNtRVp8aE9kLSeqm75q
	 fV4aoCdpxxDOHWLs0NTe6xJLPmKc6I61/4r4q67bRcmk9vzXAcz/ei2bmPW0ACx5ON1ic
	 os2vnTwVIQ0+uT6m6w+c3hjSZtHv7flT8kTBJQluqa8OyLwADczOYp4Ec7JdXvG2r2NbY
	 zFKkmuKmEjonbayDsUHLLxlgY+6LAgC/SKWcOlzvclk3g0seYplse5XwM4+PVNK8wryvL
	 wzD9aQBhLuDhZoeMlGJCCWFZKDWUEBNFehdyH2L/lSl0triWzQ5V2EZPBQKNCVX3QNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=w3XIudYz;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EB7606A31E;
	Thu, 26 Nov 2026 01:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54EB7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=w3XIudYz
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=M8E4COdP9INl7vmnYtyvsXubhK56y6QtsdjvRy8Qv1w=;
	b=w3XIudYzKLMxvl6wulZ5AFHEGNjNrQS+4Zguu6WHNK7MEE4CDenB7hUE9Tg0FDF2IAZS5I73C
	tya9Cbu+mW95Gd1hpJug4ew9ooSGdhlEPLTdtRZCSEhy32Xlu+Kv4Jq3hP0FAnPj3OkffL+6G59
	5wPpCxUUTIDN+dIw6FTnKSQ=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jZdWf05wVzcbRn;
	Thu, 26 Nov 2026 09:00:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A08644057F;
	Thu, 26 Nov 2026 09:01:36 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 09:01:35 +0800
Message-ID: <99b0b1ef-7044-4ce8-977a-ddd1b03037b4@huawei.com>
Date: Thu, 26 Nov 2026 09:01:34 +0800
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
Subject: Re: [PATCH v21 01/15] arm64: ptrace: Fix spurious pseudo-single-step
 for PTRACE_SYSEMU_SINGLESTEP
To: Linus Walleij <linusw@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <kevin.brodsky@arm.com>,
	<anshuman.khandual@arm.com>, <thuth@redhat.com>, <james.morse@arm.com>,
	<yeoreum.yun@arm.com>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<mathieu.desnoyers@efficios.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20261111114225.3977243-1-ruanjinjie@huawei.com>
 <20261111114225.3977243-2-ruanjinjie@huawei.com>
 <CAD++jL=mQ8h=6zGUBcc3F9mrafft7V0_tx=jTuv6U7y0ivqNqw@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAD++jL=mQ8h=6zGUBcc3F9mrafft7V0_tx=jTuv6U7y0ivqNqw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Hi,Linus,

在 2026/11/26 2:08, Linus Walleij 写道:
> On Wed, Nov 11, 2026 at 12:43 PM Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
>> PTRACE_SYSEMU_SINGLESTEP sets both _TIF_SYSCALL_EMU and _TIF_SINGLESTEP.
>> Since commit ac2081cdc4d99 ("arm64: ptrace: Consistently use
>> pseudo-singlestep exceptions"), syscall_trace_exit() injects a
>> pseudo-single-step SIGTRAP (si_code SI_USER) whenever _TIF_SINGLESTEP is
>> set, including for an emulated system call.
>>
>> That pseudo-step was added for PTRACE_SINGLESTEP: the system call runs,
>> and the tracer must get a stop at the return address to inspect the
>> result. An emulated system call does not run, and its syscall-enter-stop
>> already reports the SVC, as the x86 implementation and generic entry
>> (report_single_step()) both say. The extra stop is wrong:
>>
>> 1) Stepping armed before the SVC (the normal case). The SVC exception
>>    leaves the step pending (SPSR_EL1.SS is 0, Arm ARM D2.11.5.1), so the
>>    hardware step is taken at the return address anyway, and the tracer
>>    now stops there twice without the tracee executing anything:
>>
>>         syscall-enter-stop  pc=L
>>         pseudo-step         pc=L    si_code=SI_USER  <- added by that commit
>>         hardware step       pc=L    si_code=TRAP_TRACE
>>         hardware step       pc=L+4
>>
>> 2) Stepping armed after the SVC, e.g. a tracer resuming a
>>    PTRACE_EVENT_SECCOMP stop with PTRACE_SYSEMU_SINGLESTEP. The first
>>    stop is the pseudo-step at L, so the instruction at L is not
>>    executed before the step is reported. Before that commit, and on
>>    x86, the first stop follows the instruction at L.
>>
>> Skip the pseudo-step when _TIF_SYSCALL_EMU is set, as generic entry
>> does. The behaviour of PTRACE_SYSEMU_SINGLESTEP goes back to what it was
>> before that commit. PTRACE_SINGLESTEP is unaffected and still gets the
>> pseudo-step, so both problems fixed by that commit stay fixed.
>>
>> Only tracers using PTRACE_SYSEMU_SINGLESTEP see the difference. Measured
>> in QEMU, L is the instruction after the SVC:
>>
>>   case          before that commit   v7.4-rc1      this patch
>>   normal        L, L+4               L, L, L+4     L, L+4
>>   after seccomp L+4                  L             L+4
>>
>> Fixes: ac2081cdc4d99 ("arm64: ptrace: Consistently use pseudo-singlestep exceptions")
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Oleg Nesterov <oleg@redhat.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> This patch looks like something that should be sent separately and
> even considered
> for stable.
> 
> Can you please send this patch separately to the arm64 maintainers as
> a fix?

The second one is also a bugfix.

I would be happy to send these two patches and the related test cases
separately.

Thanks,
Jinjie

> 
> Yours,
> Linus Walleij

