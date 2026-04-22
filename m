Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF7819D065;
	Wed, 22 Apr 2026 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860402; cv=none; b=ezCfuPhl4YN9nLm+F5pZvBgEErTN3eUFnIJtxKGUV4G1SJSh+N5YvwaMPQDheaIvbu4LSo49JifTDglrJP8X4VeS5K09+U/kBl1pZcHMn8ui+h6POvO3cXVPizhHVS9z2MfonuzEvB8Jc/5OkjG8/PdRQGJ6eSeohtoJuH9dt9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860402; c=relaxed/simple;
	bh=ALXoxZVZZ5+WlujCK1wXEZLq1RrFZRBfQDbAZQCsVOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiMWx3+7YvKevYCNYA5Z5ilK9IgmH6mWGZaxkfwRNadigCOG4vqSMIFI1DtcnOlRwFUu/qukhpXzys3r44aZiAPgg3/LjRwDcN8qo/WWBxnqoDaIB8DFlFwK4p6JQBxdqwbrUl4DRQdZkQamy6KAF7AC3KvGrQarToRWuPNxOUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiSfihMQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiSfihMQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FBEC19425;
	Wed, 22 Apr 2026 12:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776860402;
	bh=ALXoxZVZZ5+WlujCK1wXEZLq1RrFZRBfQDbAZQCsVOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EiSfihMQywwJiWxFO3XgVVt/YpWTZo5BO4zO0yLCYEyJ9FeVOu/rgz/KL7vNrXN3O
	 WnA4MUkhP5DrYZl5IcT4Zku4uDR5zDb9zc/fhjl6N5toXIOV5oR4XTUDuYtUi4ouh5
	 /iIXJzxEpSePSDfBb5ocyZGWZHlJ3MkS7NcSIwWQlkkrzaxQUrRr7jl6iNN+xbdBoc
	 3bbnNf90QlWSXo8fHUHiEyA8M47qmv6zhbyyFWWH7d2iCsCkDsXCZabrgWoNzmV1p+
	 TfHfEkL1gKWmnL8u+8d2hg/6uBsmp19ODw/zK3/BDUyCldF3WJnzLOK3nwPiMk+XSt
	 hxDNbryPaTh5w==
Date: Wed, 22 Apr 2026 13:19:56 +0100
From: Will Deacon <will@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: signal: Preserve POR_EL0 if poe_context is
 missing
Message-ID: <aei87MmXaEdg8YOf@willie-the-truck>
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
 <20260421144252.1440365-2-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421144252.1440365-2-kevin.brodsky@arm.com>

Hey Kevin,

On Tue, Apr 21, 2026 at 03:42:49PM +0100, Kevin Brodsky wrote:
> Commit 2e8a1acea859 ("arm64: signal: Improve POR_EL0 handling to
> avoid uaccess failures") delayed the write to POR_EL0 in
> rt_sigreturn to avoid spurious uaccess failures. This change however
> relies on the poe_context frame record being present: on a system
> supporting POE, calling sigreturn without a poe_context record now
> results in writing arbitrary data from the kernel stack into POR_EL0.
> 
> Fix this by adding a valid_fields member to struct
> user_access_state, and zeroing the struct on allocation.
> restore_poe_context() then indicates that the por_el0 field is valid
> by setting the corresponding bit in valid_fields, and
> restore_user_access_state() only touches POR_EL0 if there is a valid
> value to set it to. This is in line with how POR_EL0 was originally
> handled; all frame records are currently optional, except
> fpsimd_context.
> 
> restore_user_access_state() is also called if setting up the signal
> frame fails, so we also initialise valid_fields in that case. For
> consistency, setup_sigframe() now also checks valid_fields to decide
> whether to write a poe_context record, avoiding another call to
> system_supports_poe().
> 
> Fixes: 2e8a1acea859 ("arm64: signal: Improve POR_EL0 handling to avoid uaccess failures")
> Reported-by: Will Deacon <will@kernel.org>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

Thanks for fixing this. I think your patch is correct, but I have a
couple of comments inline. Please let me know what you think.

> ---
>  arch/arm64/kernel/signal.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index 08ffc5a5aea4..3f17aed5b4f0 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -67,6 +67,8 @@ struct rt_sigframe_user_layout {
>  	unsigned long end_offset;
>  };
>  
> +#define UA_STATE_HAS_POR_EL0	BIT(0)
> +
>  /*
>   * Holds any EL0-controlled state that influences unprivileged memory accesses.
>   * This includes both accesses done in userspace and uaccess done in the kernel.
> @@ -74,8 +76,12 @@ struct rt_sigframe_user_layout {
>   * This state needs to be carefully managed to ensure that it doesn't cause
>   * uaccess to fail when setting up the signal frame, and the signal handler
>   * itself also expects a well-defined state when entered.
> + *
> + * The valid_fields member is a bitfield (see UA_STATE_HAS_*), specifying which
> + * of the remaining fields is valid (has been set to a value).
>   */
>  struct user_access_state {
> +	unsigned int valid_fields;
>  	u64 por_el0;
>  };

Do you think it would be worth adding some accessors to make it easier
to keep the flags in sync? For example:

/* Stores por_el0 into uas->por_el0 and sets UA_STATE_HAS_POR_EL0 */
void set_ua_state_por_el0(struct user_access_state *uas, u64 por_el0);

/*
 * If UA_STATE_HAS_POR_EL0, *por_el0 = uas->por_el0 and return 0.
 * Otherwise, return -ENOENT.
 */
int get_ua_state_por_el0(struct user_access_state *uas, u64 *por_el0);

WDYT?

> @@ -1095,7 +1104,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  {
>  	struct pt_regs *regs = current_pt_regs();
>  	struct rt_sigframe __user *frame;
> -	struct user_access_state ua_state;
> +	struct user_access_state ua_state = {0};

nit: {} should do (no need for the '0'). Same in setup_rt_frame().

Will
