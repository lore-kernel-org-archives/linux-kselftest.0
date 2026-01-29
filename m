Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D6A2D8DA6;
	Thu, 29 Jan 2026 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688372; cv=none; b=QTrlc94EfnR3VBJwJFx67DerNrrHegvqBE99Pq7rg9bhTrTjLO72iOXo8MaOMtuwAICo8qeLYFFGCwW+C9/mARFQktZbbL38l1J9DMUNHmZbgNWhtkxK9EYO89YezHTBBafepJP/hmiELBfwkU4GbxxbFMmfVG1ro6zPE6rd+/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688372; c=relaxed/simple;
	bh=ehNh9wLK/wAbmm+xqVI6XeVRknYE/K/r6868qYWs0as=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mc1rq4jva9ZBwkXTPINLJBoWhGRD2FAvwWIe+0oOhWmjcjU872sCW8n+e8Nzer+QER2kUQXxQ8Tqt06EcSjcPGyfAEPpWQvBDeYZjkhhJDnV5Xrb4ol6wf7V6UGaRqfqRCtkKQ5PoRXPSwdEWG+jrUsCIzO7a5SiEr89i728zvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08B4F1516;
	Thu, 29 Jan 2026 04:06:03 -0800 (PST)
Received: from [10.44.160.76] (e126510-lin.lund.arm.com [10.44.160.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0126B3F632;
	Thu, 29 Jan 2026 04:06:02 -0800 (PST)
Message-ID: <6e3f5e61-a7d2-4d14-85fa-904cde856f34@arm.com>
Date: Thu, 29 Jan 2026 13:06:00 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/14] entry: Remove unused syscall in
 syscall_trace_enter()
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 deller@gmx.de, akpm@linux-foundation.org, charlie@rivosinc.com,
 ldv@strace.io, mark.rutland@arm.com, anshuman.khandual@arm.com,
 song@kernel.org, ryan.roberts@arm.com, thuth@redhat.com,
 ada.coupriediaz@arm.com, broonie@kernel.org, pengcan@kylinos.cn,
 liqiang01@kylinos.cn, kmal@cock.li, dvyukov@google.com,
 reddybalavignesh9979@gmail.com, richard.weiyang@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-2-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260128031934.3906955-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/01/2026 04:19, Jinjie Ruan wrote:
> The 'syscall' argument in syscall_trace_enter() is immediately overwritten
> before any real use and serves only as a local variable, so drop
> the parameter.
>
> No functional change intended.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

In commit title: s/syscall/parameter/ (very confusing otherwise!)

With that fixed:

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> ---
>  include/linux/entry-common.h  | 4 ++--
>  kernel/entry/syscall-common.c | 5 ++---
>  2 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index 87efb38b7081..e4a8287af822 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -45,7 +45,7 @@
>  				 SYSCALL_WORK_SYSCALL_EXIT_TRAP	|	\
>  				 ARCH_SYSCALL_WORK_EXIT)
>  
> -long syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long work);
> +long syscall_trace_enter(struct pt_regs *regs, unsigned long work);
>  
>  /**
>   * syscall_enter_from_user_mode_work - Check and handle work before invoking
> @@ -75,7 +75,7 @@ static __always_inline long syscall_enter_from_user_mode_work(struct pt_regs *re
>  	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
>  
>  	if (work & SYSCALL_WORK_ENTER)
> -		syscall = syscall_trace_enter(regs, syscall, work);
> +		syscall = syscall_trace_enter(regs, work);
>  
>  	return syscall;
>  }
> diff --git a/kernel/entry/syscall-common.c b/kernel/entry/syscall-common.c
> index 940a597ded40..e6237b536d8b 100644
> --- a/kernel/entry/syscall-common.c
> +++ b/kernel/entry/syscall-common.c
> @@ -17,10 +17,9 @@ static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
>  	}
>  }
>  
> -long syscall_trace_enter(struct pt_regs *regs, long syscall,
> -				unsigned long work)
> +long syscall_trace_enter(struct pt_regs *regs, unsigned long work)
>  {
> -	long ret = 0;
> +	long syscall, ret = 0;
>  
>  	/*
>  	 * Handle Syscall User Dispatch.  This must comes first, since
