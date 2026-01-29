Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4048A3876D0;
	Thu, 29 Jan 2026 12:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688425; cv=none; b=Oh4YAmZbC6Jd9HERvt/smhsYmGKx0v7pDrsWo1Rd7QWBLB+pL6ExLXwf8UqfUTznAPDHzpjWClS06yty1jo8ltwdCzq1DfIvxYrwwyWoZUSsHot3hwwQ6p3UZSt8NE7PKl6ER4tz4igjYHvVo/ZEPGXEgmjYFe24ngEzLjb/IhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688425; c=relaxed/simple;
	bh=NW1i4Q/lhiEcr3j1PkBLfg4MobaArKH0tH7WCgL9Suw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Fl9dzyGXz3PblCNIqNpdroj7oKuw5fd6+SUmXs7aa6c1n04eAZ5lBiIRGUowcG7cdmBST+33eZVvq3sB709/I1ByMNWIXxM8QkYCeMkBBOPKogUMeqlA/oye7VQ3HNV7NYjBVZSwY6vcJ5IOvKFXh0j7gBYpe5JRRXCDImu7Ib8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97929153B;
	Thu, 29 Jan 2026 04:06:51 -0800 (PST)
Received: from [10.44.160.76] (e126510-lin.lund.arm.com [10.44.160.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89C2E3F632;
	Thu, 29 Jan 2026 04:06:52 -0800 (PST)
Message-ID: <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
Date: Thu, 29 Jan 2026 13:06:49 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/14] entry: Rework syscall_exit_to_user_mode_work()
 for arch reuse
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
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260128031934.3906955-10-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/01/2026 04:19, Jinjie Ruan wrote:
> In the generic entry code, the beginning of
> syscall_exit_to_user_mode_work() can be reused on arm64 so it makes
> sense to rework it.
>
> In preparation for moving arm64 over to the generic entry
> code, as nothing calls syscall_exit_to_user_mode_work() except for
> syscall_exit_to_user_mode(), move local_irq_disable_exit_to_user() and
> syscall_exit_to_user_mode_prepare() out from
> syscall_exit_to_user_mode_work() to the only one caller.
>
> Also update the comment and no functional changes.
>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  include/linux/entry-common.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index e4a8287af822..c4fea642d931 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -125,14 +125,14 @@ void syscall_exit_work(struct pt_regs *regs, unsigned long work);
>   * syscall_exit_to_user_mode_work - Handle work before returning to user mode
>   * @regs:	Pointer to currents pt_regs
>   *
> - * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
> + * Same as step 1 of syscall_exit_to_user_mode() but without calling
> + * local_irq_disable(), syscall_exit_to_user_mode_prepare() and
>   * exit_to_user_mode() to perform the final transition to user mode.
>   *
> - * Calling convention is the same as for syscall_exit_to_user_mode() and it
> - * returns with all work handled and interrupts disabled. The caller must
> - * invoke exit_to_user_mode() before actually switching to user mode to
> - * make the final state transitions. Interrupts must stay disabled between
> - * return from this function and the invocation of exit_to_user_mode().
> + * Calling convention is the same as for syscall_exit_to_user_mode(). The
> + * caller must invoke local_irq_disable(), __exit_to_user_mode_prepare() and

Shouldn't it be syscall_exit_to_user_mode_prepare() rather than
__exit_to_user_mode_prepare()? The former has extra calls (e.g. rseq).

- Kevin

> + * exit_to_user_mode() before actually switching to user mode to
> + * make the final state transitions.
>   */
>  static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
>  {
> @@ -155,8 +155,6 @@ static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
>  	 */
>  	if (unlikely(work & SYSCALL_WORK_EXIT))
>  		syscall_exit_work(regs, work);
> -	local_irq_disable_exit_to_user();
> -	syscall_exit_to_user_mode_prepare(regs);
>  }
>  
>  /**
> @@ -192,6 +190,8 @@ static __always_inline void syscall_exit_to_user_mode(struct pt_regs *regs)
>  {
>  	instrumentation_begin();
>  	syscall_exit_to_user_mode_work(regs);
> +	local_irq_disable_exit_to_user();
> +	syscall_exit_to_user_mode_prepare(regs);
>  	instrumentation_end();
>  	exit_to_user_mode();
>  }
