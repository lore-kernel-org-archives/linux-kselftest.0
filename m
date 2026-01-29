Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39F9387596;
	Thu, 29 Jan 2026 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688410; cv=none; b=g+mQf3EuzbM4jnh6anRqJvZZRDA8trJCRFa9uFGn7kJESokGnbnZJkz65zwNfrUbSx89Ivn/aQFEr/EQQP3liVrda1n9fOMO8MsEGgmc7YHSio1zDFYuaJnpnBQE+yG+XMkt15oEszs6RwKB3gdt81xMfkzMcXIpdagFbmzP+hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688410; c=relaxed/simple;
	bh=se/nkZCzYwUyy0kjHKW5ki7m1wLwwKcAV9hweoq/S4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JvPY8/GPb01+CcSswaQzEPe+9Odk+Ba0OFlwXq0n6OyPkfLz5QxLP9R04o044xfsfCnPODGDu6yw3kfi/Tb1CBL9ctijqmgAUOq2MG+ut+FQyEiNtOPNB9wYWNjDsYgKutMobJ0MG+C9M9R57b07/wJVdlb3T48yeEONv2C8xl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3EF2153B;
	Thu, 29 Jan 2026 04:06:31 -0800 (PST)
Received: from [10.44.160.76] (e126510-lin.lund.arm.com [10.44.160.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F04AB3F632;
	Thu, 29 Jan 2026 04:06:31 -0800 (PST)
Message-ID: <c70d3fd6-0b62-464b-8e99-e74f07c20846@arm.com>
Date: Thu, 29 Jan 2026 13:06:29 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/14] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 deller@gmx.de, akpm@linux-foundation.org, charlie@rivosinc.com,
 mark.rutland@arm.com, anshuman.khandual@arm.com, song@kernel.org,
 ryan.roberts@arm.com, thuth@redhat.com, ada.coupriediaz@arm.com,
 broonie@kernel.org, pengcan@kylinos.cn, liqiang01@kylinos.cn, kmal@cock.li,
 dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-4-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260128031934.3906955-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/01/2026 04:19, Jinjie Ruan wrote:
> commit a9f3a74a29af ("entry: Provide generic syscall exit function")
> introduce generic syscall exit function and call rseq_syscall()
> before audit_syscall_exit() and arch_syscall_exit_tracehook().
>
> And commit b74406f37737 ("arm: Add syscall detection for restartable
> sequences") add rseq support for arm32, which also call rseq_syscall()
> before audit_syscall_exit() and tracehook_report_syscall().
>
> However, commit 409d5db49867c ("arm64: rseq: Implement backend rseq
> calls and select HAVE_RSEQ") implement arm64 rseq and call
> rseq_syscall() after audit_syscall_exit() and tracehook_report_syscall().
> So compared to the generic entry and arm32 code, arm64 calls
> rseq_syscall() a bit later.
>
> But as commit b74406f37737 ("arm: Add syscall detection for restartable
> sequences") said, syscalls are not allowed inside restartable sequences,
> so should call rseq_syscall() at the very beginning of system call
> exiting path for CONFIG_DEBUG_RSEQ=y kernel. This could help us to detect
> whether there is a syscall issued inside restartable sequences.
>
> As for the impact of raising SIGSEGV via rseq_syscall(), it makes no
> practical difference to signal delivery because signals are processed
> in arm64_exit_to_user_mode() at the very end.
>
> As for the "regs", rseq_syscall() only checks and update
> instruction_pointer(regs), ptrace can not modify the "pc" on syscall exit
> path but 'only changes the return value', so calling rseq_syscall()
> before or after ptrace_report_syscall_exit() makes no difference.

Let's update this as discussed on v10 - PC can be modified when
ptrace_report_syscall_exit() is called.

> And audit_syscall_exit() only checks the return value (x0 for arm64),
> so calling rseq_syscall() before or after audit syscall exit makes
> no difference. trace_sys_exit() only uses syscallno and the return value,
> so calling rseq_syscall() before or after trace_sys_exit() also makes
> no difference.
>
> In preparation for moving arm64 over to the generic entry code, move
> rseq_syscall() ahead before audit_syscall_exit().
>
> No functional changes.

And naturally this is not the case.

- Kevin

> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/ptrace.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 9f9aa3087c09..785280c76317 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2443,6 +2443,8 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
>  
>  void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
>  {
> +	rseq_syscall(regs);
> +
>  	audit_syscall_exit(regs);
>  
>  	if (flags & _TIF_SYSCALL_TRACEPOINT)
> @@ -2450,8 +2452,6 @@ void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
>  
>  	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
>  		report_syscall_exit(regs);
> -
> -	rseq_syscall(regs);
>  }
>  
>  /*
