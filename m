Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A2F343D6D;
	Mon, 26 Jan 2026 16:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445759; cv=none; b=Bx/g9mNfSJuM3hI9RivQZAbm5J545UzWUEpsSB1PvnIDD2h5y2Zv6mOcANIBdNpOdSAfin8Q6o86fi4FkPCl+jdh+0ldGAo7O/9PugbRziF2lqI39Lnx08BpBuP3jGXjKXa4O4t5Hs1UGyxEQAWLQMpggbd4SKVFrnTkf9x51lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445759; c=relaxed/simple;
	bh=PJaTUfkdd4haptrZxquY4mIde87ex5by4Uui9ExW1qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqxkBc0rbHD6KukKgYiNZIAHvxECrfuHUMFK1nJmrO15+od0S0mm9zPWfJJN0qTZ9x7lI1x8Ia59f9QoArR8DEKpl7m15mIICKH3wuKFNak4/Lm1kl90QDvcP6zgBjwf6FLg0X4tVA138clUcUnD9ok2YPNngsoQsMAtz0zZZaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFG79mBi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFG79mBi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D924C116C6;
	Mon, 26 Jan 2026 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769445758;
	bh=PJaTUfkdd4haptrZxquY4mIde87ex5by4Uui9ExW1qA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFG79mBikd6dMwuEXIWR1hwu+xUuVP0S380vYBICICSY2TPaqeyiGkwiP2oEV5Yty
	 w+nIAJaECaAw4Gu/QlhL6zlTcMOdQoK70hKj7Wb4ppUc0kNm/j1EhePFDy7HDjiYZs
	 R5wcd1Tt8phjNKwSPUzkUAocVPmOk/jqjPPLUKFMBpBmi9wdWZnZp8oJ4O4k6nyssX
	 YRi1Z0dHndWol37MKCzp1Ugy0hKffbkNC0fgfQA1mVjFQH4lXP5s/LlE+KJNZxWu+c
	 FkAbH3OxCJJkGCCLFu7vFjXqeApvtSFaHGhPMKQ3dAUYk5++VZNPavVAYKbIHd09FT
	 9SLCze+1VCxHg==
Date: Mon, 26 Jan 2026 16:42:30 +0000
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, oleg@redhat.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, shuah@kernel.org,
	kees@kernel.org, wad@chromium.org, kevin.brodsky@arm.com,
	macro@orcam.me.uk, charlie@rivosinc.com, akpm@linux-foundation.org,
	ldv@strace.io, anshuman.khandual@arm.com, mark.rutland@arm.com,
	thuth@redhat.com, song@kernel.org, ryan.roberts@arm.com,
	ada.coupriediaz@arm.com, broonie@kernel.org, liqiang01@kylinos.cn,
	pengcan@kylinos.cn, kmal@cock.li, dvyukov@google.com,
	richard.weiyang@gmail.com, reddybalavignesh9979@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v10 04/16] arm64/ptrace: Refactor
 syscall_trace_enter/exit()
Message-ID: <aXeZdh3CtznU8u6L@willie-the-truck>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-5-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222114737.1334364-5-ruanjinjie@huawei.com>

On Mon, Dec 22, 2025 at 07:47:25PM +0800, Jinjie Ruan wrote:
> The generic syscall entry code has the following form, which use
> the input syscall work flag and syscall number:
> 
> | syscall_trace_enter(struct pt_regs *regs, long syscall,
> |		      unsigned long work)
> |
> | syscall_exit_work(struct pt_regs *regs, unsigned long work)
> 
> In preparation for moving arm64 over to the generic entry code,
> refactor syscall_trace_enter/exit() to also pass thread flags, and
> get syscall number by syscall_get_nr() helper.
> 
> No functional changes.
> 
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/syscall.h |  4 ++--
>  arch/arm64/kernel/ptrace.c       | 25 ++++++++++++++++---------
>  arch/arm64/kernel/syscall.c      |  5 +++--
>  3 files changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> index 5e4c7fc44f73..cef1d9ce6e1b 100644
> --- a/arch/arm64/include/asm/syscall.h
> +++ b/arch/arm64/include/asm/syscall.h
> @@ -120,7 +120,7 @@ static inline int syscall_get_arch(struct task_struct *task)
>  	return AUDIT_ARCH_AARCH64;
>  }
>  
> -int syscall_trace_enter(struct pt_regs *regs);
> -void syscall_trace_exit(struct pt_regs *regs);
> +int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags);
> +void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
>  
>  #endif	/* __ASM_SYSCALL_H */
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index f333791ffba6..79762ff33945 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2407,9 +2407,8 @@ static void report_syscall_exit(struct pt_regs *regs)
>  	}
>  }
>  
> -int syscall_trace_enter(struct pt_regs *regs)
> +int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags)
>  {
> -	unsigned long flags = read_thread_flags();
>  	int ret;
>  
>  	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
> @@ -2422,19 +2421,27 @@ int syscall_trace_enter(struct pt_regs *regs)
>  	if (secure_computing() == -1)
>  		return NO_SYSCALL;
>  
> -	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
> -		trace_sys_enter(regs, regs->syscallno);
> +	/* Either of the above might have changed the syscall number */
> +	syscall = syscall_get_nr(current, regs);

I understand that you're gradually making the arch code more similar to
the core code so that we can switch over to it, but I'm struggling to
understand why syscall_trace_enter() takes the 'syscall' argument.

Even the core code just seems to use it as a local variable, which it
overrides before it ever uses it. What am I missing?

Will
