Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA16F37F744;
	Mon, 11 May 2026 20:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530352; cv=none; b=HCr/7yLDwoXPOcOkMijySaqunByiJZfgMEU5iGFzTLJUuW3P8q/RKMkSwwfaOILHTJ9RZgxu1QX2FLI30kJuIDPxASbir99sDF8NwCluDr0QhWc2ug3itUEDbWoRkVmeFaxWcQ9B9Xe8yjcqKW/hr33WVMmL+fA2BgANwgX8ndU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530352; c=relaxed/simple;
	bh=7xmR3Oo6zJp0RpoQm/v+WdlUTzXkks+QvhatNJQCp6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5HFJTqqMEPGQoqSHboueh5TZ47DbE/AjRRO6Q8+//V3OhJt/8fg9nm4MPx1Qzr1SZRIC4BopMN6xx1HXxAhLidH9owGcNaLejhCVstz5FwfwLnScD/PnEbfJgmKDIXkCA3SHhtv4adIcj258GjcYUyrYLwL17ORtlZ0cSckVS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IR5bzBJ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IR5bzBJ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55003C2BCB0;
	Mon, 11 May 2026 20:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778530352;
	bh=7xmR3Oo6zJp0RpoQm/v+WdlUTzXkks+QvhatNJQCp6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IR5bzBJ/YxjULJTo/YqMhy36k64zo9tLGyXYm5/qTUOe/6t8yaUPQLAe0aN8WHquc
	 CQugBenAShdg1x3TTu20jPld6S19KS26zcozsMF5llCOaoEtr9gNZTioKW8dQcHDXl
	 qHuF7tZBcGY/SKLa3vZ9uX2SE01Yr/4GDd02afrldroD87FJV5HowJ/KqGSiURdn89
	 ECVo7rNXFt89O19KYY2+2aMxRX/J3pd5FWcLF4JUPDkKP8AYi8EWfSMFvzuUGHeJ+s
	 0aAy3/JsmU9flb7mobE49t1KZ1ll8FKuUReRoZtE8eIndhmRuZqVuYYT/5VJeUE1B8
	 pCsEpZcBWVVnw==
Date: Mon, 11 May 2026 16:12:30 -0400
From: Sasha Levin <sashal@kernel.org>
To: Anthony Iliopoulos <ailiop@suse.com>
Cc: Florian Weimer <fw@deneb.enyo.de>, corbet@lwn.net,
	akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agI4Lrr58QpN_ukz@laps>
References: <20260508195749.1885522-1-sashal@kernel.org>
 <87ecjku6y7.fsf@mid.deneb.enyo.de>
 <af8pw54Y-Q18kSR0@laps>
 <agGweC12aloH8DBq@foo>
 <agG6PnVAFMsb3iiz@laps>
 <agIQjd78N_6NMN2U@technoir>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <agIQjd78N_6NMN2U@technoir>

On Mon, May 11, 2026 at 07:23:25PM +0200, Anthony Iliopoulos wrote:
>On Mon, May 11, 2026 at 07:15:10AM -0400, Sasha Levin wrote:
>> The mechanism is the same, but I don't think reusing fail_function works for
>> what killswitch is trying to do.
>
>How so? The kprobe handler is essentially the same. Setting the
>whitelisting aside, it is currently possible to do:
>
>echo af_alg_sendmsg > /sys/kernel/debug/fail_function/inject
>echo 0xffffffffffffffff > /sys/kernel/debug/fail_function/af_alg_sendmsg/retval
>echo 100 > /sys/kernel/debug/fail_function/probability
>echo -1 > /sys/kernel/debug/fail_function/times
>
>and that will return -EPERM, taint the kernel, and log the stacktrace on
>dmesg on every rejected call.

Sure, the kprobe mechanism is the same under the hood. The differences are in
the policy layer.

>> > Given that this achieves the exact same result, then why don't we consider
>> > simply removing the whitelisting restriction from fail_function altogether
>> > and use that instead? The only thing missing then would be the boot param
>> > parsing and setup.
>>
>> fail_function lives in debugfs, and on a typical Secure Boot distro debugfs is
>> itself blocked by LOCKDOWN_DEBUGFS at integrity level. Dropping the whitelist
>> doesn't help when the operator can't write to the file in the first place.
>
>Agreed, for this to work fail_function would also need to parse boot
>params similarly.
>
>> Killswitch is in securityfs so that engaging it can be its own lockdown
>> decision rather than being lumped in with everything debugfs exposes.
>
>Sure but it makes no difference when a kernel is locked at integrity it
>will anyway block either solution, this makes no practical difference.

It does for observability. Even when the engage path is blocked by integrity
lockdown, the user still has to be able to inspect the killswitch state: which
engagements were applied from the boot cmdline, how many times each has fired,
whether the kernel is tainted by killswitch. /sys/kernel/security/ stays
readable under integrity lockdown while /sys/kernel/debug is restricted by
LOCKDOWN_DEBUGFS as a whole tree.

>> Fault injection in general isn't enabled on production kernels - having to
>> enable CONFIG_FUNCTION_ERROR_INJECTION will drag in that entire infra into
>> kernels that don't need it.
>
>There's very little code that CONFIG_FUNCTION_ERROR_INJECTION brings in
>apart from the override_function_with_return trampoline and
>lib/error-inject.c which becomes obsolete without the need to whitelist.
>
>Your proposal also depends on FUNCTION_ERROR_INJECTION necessarily.

To be precise about what's being dragged in: killswitch does select
FUNCTION_ERROR_INJECTION, but it does *not* select CONFIG_FAULT_INJECTION (the
broader probability/interval framework that distros stay away from).

>The only thing that would be missing and not usually compiled in is
>CONFIG_FAIL_FUNCTION that just implements the debugfs ops interface
>which you are exposing via securityfs instead.

This understates what "use fail_function instead" actually requires in a distro
Kconfig. CONFIG_FAIL_FUNCTION depends on FAULT_INJECTION_DEBUG_FS, which
depends on FAULT_INJECTION, which is the broader framework that doesn't get
built into production kernels. So a "rebuild fail_function for production" path
is three configs prod users say no to today (FAULT_INJECTION +
FAULT_INJECTION_DEBUG_FS + FAIL_FUNCTION).

>> > This way we'll be removing a few hundred lines of code instead of adding
>> > more duplication, while enabling the same functionality.
>>
>> I'm not even sure there would be hundreds of lines saved here...
>
>I'm talking specifically about whitelisting which would essentially be
>useless:
>
>wc -l lib/error-inject.c include/asm-generic/error-injection.h include/linux/error-injection.h
> 246 lib/error-inject.c
>  43 include/asm-generic/error-injection.h
>  28 include/linux/error-injection.h
> 317 total
>
>plus a hundred or so annotations of ALLOW_ERROR_INJECT and a tiny bit of
>image space savings from dropping that whitelist section from the binary.

Whether the whitelist is "useless" depends on the framing of what it
was for. In the context of fail_functiom, it isn't a security feature, and
never has been. It's a debugging guardrail in lib/error-inject.c that stops
developers from fault-injecting on functions that don't expect failure
injection during testing. Any kernel that has FAULT_INJECTION compiled in has
already opted out of treating security as the primary concern in that build.

Killswitch doesn't change the whitelist role: kernel/killswitch.c doesn't go
through within_error_injection_list, fail_function still gets to keep its
developer guardrail for testing, BPF's bpf_override_return still uses it too.

In production kernels (where FAULT_INJECTION=n) the whitelist isn't
running anyway. In debug/test kernels (where it is on) it remains useful for
exactly the testing purpose it was added for.

>> The pieces that make killswitch what it is (cmdline parser,
>> LOCKDOWN_KILLSWITCH, TAINT_KILLSWITCH, audit on engage and disengage, the
>> module-unload notifier, etc) add up to roughly 200 lines that would move into
>> fail_function unchanged. I really don't think we'd end up with much of a line
>> delta.
>
>All of that apart from the cmdline parser is already present in the
>fault/error injection code, directly or indirectly. I can see though the
>appeal of having killswitch cleanly separated from anything else, but
>perhaps changing the existing code is more approachable.

Mostly, sure. Things that are missing are the module handling, for example.


Concretely to merge killswitch and fail_function we need:

   1. Boot cmdline parser (agreed).
   2. A new lockdown reason in the integrity class plus its lockdown_reasons[]
      string.
   3. Moving from debugfs to securityfs (or standing up a parallel securityfs
      interface).
   4. Module-unload notifier.
   5. Taint flag.
   6. Audit logging on engage and disengage.
   7. Fixing up fail_function's API (probability, interval, times) with the
      engage/disengage model.
   8. Production users enabling FAULT_INJECTION + FAULT_INJECTION_DEBUG_FS +
      FAIL_FUNCTION, none of which they do today.

>- fail_function would become somewhat redundant since the same
>  functionality would be achieved via the securityfs (or just bpf, which
>  is already the case).

There are already several ways to override a function at runtime: livepatch,
fail_function, BPF kprobe override, an out-of-tree kprobe module. The
underlying machinery is largely the same across all of them. We keep them as
separate facilities because they serve different audiences and different policy
needs, not because each one uses a different underlying technology.

By the "same capability, therefore redundant" logic, fail_function should
already be redundant with livepatch or BPF since both can replace a function's
body with whatever you want.

-- 
Thanks,
Sasha
