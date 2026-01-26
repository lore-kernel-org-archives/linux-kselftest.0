Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B581620B810;
	Mon, 26 Jan 2026 19:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454180; cv=none; b=ihy9scCNlTYPgoG2RU+tgf9ACR32jywH2nbjRX6QoiT6gUdcEwDqWYxWOSgaAiz4R6ID3YjnSlovTezA7UXc8JOQnlfvcqiDtLxo2m38z7twomdkVNQMfCzzCsUiwScOqn/DtIG5YK7vWu4Yx94I/ycXwhWlLjaqharkwIwAbGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454180; c=relaxed/simple;
	bh=NMpmmo676tzOTXBkbWzjq51xX+ZDtptvSmw/dCizBnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eM3clFcU7HU76rurj+bUl+yzfFwWbdRsNQbbZgWM6ATQHfZyHbTuyVftn5JC6DL5Bj77lfmh3SxrcW79WD7IE5S580VYaXHyzfgoHULZ13XX/UV24R+tWBkWdaptXiHKvs6QiVfdsJuQ/VOgzfRvTQ3F8a2LJPQRwKg5Jnt5CTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7R8O7DQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7R8O7DQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F40C116C6;
	Mon, 26 Jan 2026 19:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769454180;
	bh=NMpmmo676tzOTXBkbWzjq51xX+ZDtptvSmw/dCizBnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7R8O7DQde8PBTJMl4lJAtJCbCkYvd2dlGK++9bhHIE2+Sh3CaBlVA3eM6xctJ6Fi
	 1FUvByfXUDgMmEohYC1qb4XpTDfrfTtuZ1a8OWFF6yDtLB/5B0SQzCCQR/LpDwg9E1
	 mdjJLPbQi54dGnDtLQxgvYHQYvb09MScWJGuhIXUQyxoctKo4MMRu0mb6hjcV6IFU4
	 FKp69LSbUISJj3iKEhDv3AgHba8o5R9F9q2/CGYhEkmnrHsZ/PH+8hzT4tE/3cwzvH
	 jaCMhGEY5qDwTlwCKeZStYXrr6VXLblmYa9jTMgw4UpS5Nbi8KxHATgJtOW0BvG+rl
	 T80bpLVqbP4dw==
Date: Mon, 26 Jan 2026 19:02:51 +0000
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
Subject: Re: [PATCH v10 05/16] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
Message-ID: <aXe6W69Esd1NLEU8@willie-the-truck>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-6-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222114737.1334364-6-ruanjinjie@huawei.com>

On Mon, Dec 22, 2025 at 07:47:26PM +0800, Jinjie Ruan wrote:
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
> 
> So compared to the generic entry and arm32 code, arm64 terminates
> the process a bit later if the syscall is issued within
> a restartable sequence.

Given that signals are processed until later, is this actually true?

> But as commit b74406f37737 ("arm: Add syscall detection for restartable
> sequences") said, syscalls are not allowed inside restartable sequences,
> so should call rseq_syscall() at the very beginning of system call
> exiting path for CONFIG_DEBUG_RSEQ=y kernel. This could help us to detect
> whether there is a syscall issued inside restartable sequences.
> 
> It makes sense to raise SIGSEGV via rseq_syscall() before auditing
> and ptrace syscall exit, because this guarantees that the process is
> already in an error state with SIGSEGV pending when those later steps
> run. Although it makes no practical difference to signal delivery (signals
> are processed at the very end in arm64_exit_to_user_mode()), the ordering
> is more logical: detect and flag the error first, then proceed with
> the remaining work.
> 
> To make it more reasonable and in preparation for moving arm64 over to
> the generic entry code, move rseq_syscall() ahead before
> audit_syscall_exit().

I've been struggling a bit to see how this helps to align with the
generic code. I'm also concerned that rseq_debug_update_user_cs()
operates on instruction_pointer(regs) which is something that can be
chaned by ptrace.

So, I'm not saying this is wrong, but it feels like a user-visible
change that needs better justification.

Will
