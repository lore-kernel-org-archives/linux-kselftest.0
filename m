Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1F84BEE3E;
	Sat, 12 Sep 2026 00:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171595; cv=none; b=DPLczFEd+PA6iekTPuRPFay/cO4K4dyxqYy8/DJUZhDZbBImlAJfqIkeOY57UQM1XtpHB7AN/XunI+dXND0/ODLDiU1ThqCVkihKzcVu5ss4+TCiAMrxhvnW4zXRKF5Exw3daewKIIyaQl6v5M5nZkFZNn41gaQmrGxr8l1s4vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171595; c=relaxed/simple;
	bh=keZxP/D8IgJJnR6TnRD7lh5vqhLtmRamurmBz4YQccs=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JC0p6+bm6FtNU/AR7bKgnPFDsjeETX5uHaQw6grY+pUanbD/bY4WJ6+ReQu2VUs8TxBxciQ+RPT3+0077V/ejEoK65citiT0JCto+IuuhcOj+EYI36a1WikZYhKuT+2ndHY/7dcgUMXKy9btsWTV1so4DzJAXUW1urneoJljqgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6ujCH0m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6ujCH0m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02661F000FF;
	Sat, 12 Sep 2026 00:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789171593;
	bh=dPrvIZhhQ5aXmo6tNNfKlwb6lA0WtD1EQiIp+7CTDO8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=N6ujCH0mVo8k8B6NUPwD0CGn8JIavVj8t2G8hhV0d3KSVGpSeIb17jUaJtDPL1z6k
	 14s2UzGEU5NS5wEeKMsM8ozqCiJ/cCc9sYZo6p7/gaZkLk969F0ONISPqU0/7PvQ97
	 XzU+7Keyoogp5avmU5KAvKAVix0uNvXGj9QFKeYmbJyOu7y7U6peIrQx67AWbBKl8t
	 iKJrve1+gljP73VlQxsm7oZaFTxv5Zwafz38T1t8EPVIYC3SKwOSBB2tmFA7MFT5E+
	 clEAzrL9ENQduEMBnRuiCRInQd0y22tePw+QJLXCxlFPlULVhKltG4ttTORS5HN5/0
	 6k/g3zRHxTmkg==
Subject:
 Re: [PATCH net-next v2 1/4] netconsole: add a per-target message rate limit
From: netdev-bot+sashiko@kernel.org
To: leitao@debian.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, shuah@kernel.org, rdunlap@infradead.org,
 paulmck@kernel.org, gustavold@gmail.com, asantostc@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@meta.com
Date: Sat, 12 Sep 2026 00:06:32 +0000
Message-ID: <178917159246.219967.9750702498539140287@kernel.org>
In-Reply-To: <20260910-netcons_ratelimit-v2-1-ebf0dd91e26e@debian.org>
References: <20260910-netcons_ratelimit-v2-1-ebf0dd91e26e@debian.org>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 0 · Low: 1

- [High] The oops_in_progress bypass in netconsole_ratelimited()
  (drivers/net/netconsole.c:299-306) does not deliver the guarantee its…
- [Low] In netconsole_write() (drivers/net/netconsole.c:2518-2534) the
  rate-limit token is consumed by netconsole_ratelimited() ->…

--

netconsole: add a per-target message rate limit

This adds a struct ratelimit_state token bucket to each netconsole target
and consults it once per message in netconsole_write(). The bucket is
initialised with a zero interval (unlimited) and the check is skipped while
oops_in_progress is set.

> diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
> index b358e5c367351..13292c3f818e9 100644
> --- a/drivers/net/netconsole.c
> +++ b/drivers/net/netconsole.c

[ ... ]

> @@ -282,6 +285,26 @@ static void dynamic_netconsole_mutex_unlock(void)
>  	mutex_unlock(&dynamic_netconsole_mutex);
>  }
>  
> +static void netconsole_ratelimit_init(struct netconsole_target *nt)
> +{
> +	ratelimit_state_init(&nt->ratelimit, 0, DEFAULT_RATELIMIT_BURST);
> +	/* The flag keeps ___ratelimit() from reporting the suppressed count
> +	 * itself, which would printk() from inside the console being
> +	 * serviced. Nothing calls ratelimit_state_exit(), so the count is
> +	 * never reported on release either.
> +	 */
> +	ratelimit_set_flags(&nt->ratelimit, RATELIMIT_MSG_ON_RELEASE);
> +}
> +
> +static bool netconsole_ratelimited(struct netconsole_target *nt)
> +{
> +	/* A limit meant for steady-state logging must not eat a crash dump. */
> +	if (oops_in_progress)
> +		return false;
> +
> +	return !__ratelimit(&nt->ratelimit);
> +}

[Severity: High]
Does the oops_in_progress test in netconsole_ratelimited() actually cover
oops and BUG() output on netconsole?  The changelog says:

    Skip the bucket while oops_in_progress is set, so a limit configured
    for steady-state logging never truncates an oops, BUG() or panic().

and the documentation patch later in the series repeats it ("Crash output
bypasses the bucket. While an oops, BUG() or panic() is in progress every
message is sent").

Both consoles are registered with CON_NBCON_ATOMIC_UNSAFE:

drivers/net/netconsole.c
    static struct console netconsole = {
        .name = "netcon",
        .flags = CON_ENABLED | CON_NBCON | CON_NBCON_ATOMIC_UNSAFE,

and console_is_usable() refuses such a write_atomic() callback unless
unsafe takeovers are allowed:

include/linux/console.h:console_is_usable() {
    ...
            if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !nbcon_allow_unsafe_takeover())
                    return false;
    ...
}

kernel/printk/nbcon.c
    bool nbcon_allow_unsafe_takeover(void)
    {
            return panic_on_this_cpu() && panic_nbcon_allow_unsafe_takeover;
    }

So during a non-panic oops the atomic flush skips netconsole entirely.  In
the emergency context that oops_enter() establishes, only nbcon_atomic is
selected, not nbcon_offload:

kernel/printk/internal.h:printk_get_console_flush_type() {
    ...
    case NBCON_PRIO_EMERGENCY:
            if (have_nbcon_console && !have_boot_console)
                    ft->nbcon_atomic = true;
    ...
}

which means the netconsole kthread is not woken while the backtrace is
being emitted.  The wake happens later, from
nbcon_cpu_emergency_exit() -> nbcon_kthreads_wake(), reached via
oops_exit(), and on x86 oops_end() runs bust_spinlocks(0) (which drops
oops_in_progress back to 0) before oops_exit().

Doesn't that mean every record of an oops or BUG() backtrace reaches
netconsole_write() with oops_in_progress == 0 and is charged against the
bucket?  With the configfs interval knob from the following patch set to a
nonzero value, a backtrace is many more records than
DEFAULT_RATELIMIT_BURST (10), so would it be silently truncated?  panic()
looks protected because it does bust_spinlocks(1) before the panic-CPU
unsafe atomic flush, but oops/BUG do not appear to be.

Would keying the bypass off the nbcon record/context priority, or the nbcon
emergency nesting count, work better here than the global oops_in_progress
flag?

[ ... ]

> @@ -2482,6 +2515,9 @@ static void netconsole_write(struct nbcon_write_context *wctxt, bool extended)
>  		    !netif_running(nt->np.dev))
>  			continue;
>  
> +		if (netconsole_ratelimited(nt))
> +			continue;
> +
>  		/* If nbcon_enter_unsafe() fails, just return given netconsole
>  		 * lost the ownership, and iterating over the targets will not
>  		 * be able to re-acquire.

[Severity: Low]
This isn't much of a bug, but is the token spent a bit early here?
netconsole_ratelimited() -> __ratelimit() decrements rs->rs_n_left:

lib/ratelimit.c:___ratelimit() {
    ...
	if (atomic_read(&rs->rs_n_left) > 0 && atomic_dec_return(&rs->rs_n_left) >= 0)
		ret = 1;
    ...
}

and only afterwards does netconsole_write() check ownership:

drivers/net/netconsole.c:netconsole_write() {
    ...
	if (!nbcon_enter_unsafe(wctxt))
		return;
    ...
}

If nbcon_enter_unsafe() returns false the message is never transmitted, yet
the token is gone and there is no way to give it back.  The return value of
nbcon_exit_unsafe() is also ignored, so a further loop iteration can spend
another target's token before lost ownership is noticed.

In practice this only shows up on the panic-CPU unsafe takeover path, since
console_is_usable() rejects netconsole's write_atomic() for every other
context, and there the re-emitted record hits the oops_in_progress bypass
anyway.  Would consuming the token only after the write context is acquired
(or only on a successful send) be cleaner?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260910-netcons_ratelimit-v2-0-ebf0dd91e26e%40debian.org
