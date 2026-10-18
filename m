Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53025357CED;
	Sun, 18 Oct 2026 04:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792298127; cv=none; b=QIVUyHFALMi1YoltJqr9wBWD67BMGGGmI0IgZ7W1AoOxWqe2Y1fegEDRjqvE1GqxGVfOGcLDnBRmyMH7mPYen3C/lO9mzZa1M0z5UOcWDiSRBZXKN1ZQKGPp9lD3aRIIkQP4WuWisvhNZGYRCR31VtfMLK8Bydp6eQHi+/pEBFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792298127; c=relaxed/simple;
	bh=fIIzO3YeQ89hHkR10kQq/oT7VhSRWJgqIhFbWPKhPV4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AVhW05Rc6KcLKTcNnlXCagQNbgo+d0dbnVpQES/NpKGl6A04t3rDid7SWRF6UtFXFe0+NV39gKZvQlp5hvBTBsEx9a4QRaNk0KY5EKgGe9nJiAotqHp1O4xCLk47T4mbyOym2749jV4OzjeQ0rxSqRHVFotdIB6ykKnIsAlLQb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXtI6rEf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXtI6rEf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5678F1F000C4;
	Sun, 18 Oct 2026 04:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792298125;
	bh=PRpTZJSpbXXgxWwOLofA5Y6mVk1ATVD63mzOc94TFVM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZXtI6rEfp1QOABC3VVWMBFS+Pg0XYpu2vUbXchMn+UZlgj3JuZaaXefIcbtrqnF1B
	 WPU7ghCLPECMB9AkykZZQa6k5BdDi93ZjwR0+Rz5nUqFhrY0EFfNbuE5BV5LZih9T3
	 x9e0tcBgYUjyfF7aSY6wLYocQjuGnUPJeft+1inG8IPM5T1uf1pAzdT0waOooSZPNQ
	 X+Zd3+LzAXT6JVLDfpY86ttM6ZwtW03R5gATQ4vkCCzyJAQ6BGjxooPj/AwPFmJ2ke
	 ltI54e53Se8cb0ARS25wAbQ6qx8kfcFCAvDAkO+wWiqvHMtRhddYoEOoUvC0TtuHSh
	 L2YTVRvLXMxww==
Subject: Re: [PATCH net v2] selftests/net: test network sysctl extremes
From: netdev-bot+sashiko@kernel.org
To: sahaj123.sc@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 18 Oct 2026 04:35:24 +0000
Message-ID: <179229812489.3135.14817248906900099268@kernel.org>
In-Reply-To: <20261014041446.2821085-1-sahaj123.sc@gmail.com>
References: <20261014041446.2821085-1-sahaj123.sc@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] selftests/net: unhandled EPIPE when reading /dev/kmsg causes
  spurious test failures
- [Low] main() in tools/testing/selftests/net/sysctl_net_test.c uses the
  kselftest.h API against its documented contract.
- [Low] The UDP part of the test cannot exercise the documented effect of
  the UDP sysctls it selects, so its 'UDP 16/16' result says nothing…
- [Low] v2 adds a facility filter to check_kernel_log() (`prefix =
  strtoul(record, NULL, 10); if (prefix >> 3 != 0) continue;`, lines…

--

selftests/net: test network sysctl extremes

This adds a new net selftest, sysctl_net_test. It finds the accepted lower
and upper bounds of four per-netns sysctls (tcp_rmem, tcp_wmem,
udp_rmem_min, udp_wmem_min) and runs TCP and UDP loopback traffic at each
bound. While it runs, it watches /dev/kmsg for kernel splats, and it
restores the original values after each probe.

Link: https://lore.kernel.org/r/20261007054508.1059927-1-sahaj123.sc@gmail.com

> diff --git a/tools/testing/selftests/net/sysctl_net_test.c b/tools/testing/selftests/net/sysctl_net_test.c
> new file mode 100644
> index 0000000000000..6360616132c41
> --- /dev/null
> +++ b/tools/testing/selftests/net/sysctl_net_test.c
> @@ -0,0 +1,925 @@

[ ... ]

> +static bool check_kernel_log(void)
> +{

[ ... ]

> +		record[n] = '\0';
> +		message = strchr(record, ';');
> +		if (!message)
> +			continue;
> +		/* Ignore messages that userspace wrote to /dev/kmsg. */
> +		prefix = strtoul(record, NULL, 10);
> +		if (prefix >> 3 != 0)
> +			continue;
> +		message++;
> +		for (i = 0; i < ARRAY_SIZE(splats); i++) {
> +			if (!strstr(message, splats[i]))
> +				continue;
> +			set_failure("kernel splat detected: %.180s", message);
> +			return false;
> +		}
> +	}
> +}

[Severity: Medium]
What happens in check_kernel_log() when the printk ring buffer wraps
past this reader between two calls?

devkmsg_read() reports that case once as -EPIPE. It then moves the
reader forward to the oldest record that is still available:

kernel/printk/printk.c:devkmsg_read() {
    ...
	if (pmsg.dropped) {
		/* our last seen message is gone, return error and reset */
		atomic64_set(&user->seq, pmsg.seq);
		ret = -EPIPE;
		goto out;
	}
    ...
}

The loop here handles EINTR and EAGAIN/EWOULDBLOCK. Any other errno
goes to set_failure() and returns false.

So on a busy machine where something else logs heavily during the run,
the test fails with "cannot read /dev/kmsg: Broken pipe". Nothing in
the network stack went wrong in that case. probe_value(),
prepare_sysctl() and exercise_value() all turn this into a failure.
main() then stops testing the remaining sysctls. That makes the test
flaky on noisy CI hosts.

The next read() after -EPIPE succeeds, so could this case simply
continue the loop? If you want the output to show that records were
missed, and a splat could therefore have been lost, a "# " diagnostic
line might be enough. Or do you prefer to treat lost records as a
failure?

[Severity: Low]
The commit message says the test passed "also while userspace wrote
WARNING:/BUG: lines to /dev/kmsg". This facility check covers that case,
because devkmsg_write() forces LOG_USER on those records.

Does it keep all user-controlled text out of the match, though? Records
that the kernel itself generates still carry facility 0 even when they
embed user strings. Also, strstr() matches anywhere in the message body.
For example, on x86 show_signal_msg() puts the task comm at the start of
the line:

arch/x86/mm/fault.c:show_signal_msg() {
    ...
	printk("%s%s[%d]: segfault at %lx ip %px sp %px error %lx",
		loglvl, tsk->comm, task_pid_nr(tsk), address,
    ...
}

Suppose an unprivileged process calls prctl(PR_SET_NAME, "BUG:") and then
segfaults while this test runs. The record "BUG:[1234]: segfault at ..."
passes the prefix >> 3 check and matches "BUG:". The test then reports a
kernel splat and fails.

Would it help to match the markers only at the start of the message
(for example "WARNING: CPU:", "------------[ cut here ]", or "BUG: " at
offset 0)?

[ ... ]

> +static int udp_loopback(void)
> +{

[ ... ]

> +	addr.sin_port = htons(server_port);
> +	n = sendto(client, &data, sizeof(data), 0, (struct sockaddr *)&addr,
> +		   sizeof(addr));

[Severity: Low]
How much does the "UDP 16/16" result say about udp_rmem_min and
udp_wmem_min?

udp_loopback() sends and receives a single byte, which normally stays
below the protocol memory limit. In that case __sk_mem_raise_allocated()
returns before it reads udp_rmem_min:

net/core/sock.c:__sk_mem_raise_allocated() {
    ...
	/* Under limit. */
	if (allocated <= sk_prot_mem_limits(sk, 0)) {
		sk_leave_memory_pressure(sk);
		return 1;
	}
    ...
	if (kind == SK_MEM_RECV) {
		if (atomic_read(&sk->sk_rmem_alloc) < sk_get_rmem0(sk, prot))
			return 1;
    ...
}

Documentation/networking/ip-sysctl.rst also says udp_rmem_min applies
"even if total pages of UDP sockets exceed udp_mem pressure". For
udp_wmem_min it says "this tunable has no effect".

The test never creates UDP memory pressure. Unless the system is already
under pressure, wouldn't both bounds of both UDP sysctls pass whether or
not the minimum buffer handling works?

> +	if (n != sizeof(data)) {
> +		if (n >= 0)
> +			errno = EIO;
> +		goto out;
> +	}

[ ... ]

> +int main(int argc, char **argv)
> +{

[ ... ]

> +	ksft_print_header();
> +	ksft_set_plan(1);
> +
> +	if (unshare(CLONE_NEWNET))
> +		ksft_exit_skip("cannot create network namespace: %s\n",
> +			       strerror(errno));
> +
> +	kmsg_fd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK | O_CLOEXEC);
> +	if (kmsg_fd < 0)
> +		ksft_exit_skip("cannot read /dev/kmsg: %s\n", strerror(errno));
> +	if (lseek(kmsg_fd, 0, SEEK_END) < 0)
> +		ksft_exit_skip("cannot seek /dev/kmsg: %s\n", strerror(errno));
> +	if (set_loopback_up())
> +		ksft_exit_skip("cannot bring loopback up: %s\n", strerror(errno));

[ ... ]

> +	if (!failure[0] && !tested_files)
> +		ksft_exit_skip("no selected writable numeric network sysctls found\n");

[ ... ]

> +	ksft_test_result_pass("TCP %zu/%zu, UDP %zu/%zu deliveries succeeded\n",
> +			      tcp_successes, tcp_attempts,
> +			      udp_successes, udp_attempts);
> +	ksft_finished();
> +	close(kmsg_fd);
> +	return KSFT_PASS;
> +
> +fail:
> +	ksft_test_result_fail("%s\n", failure);
> +	ksft_finished();
> +	close(kmsg_fd);
> +	return KSFT_FAIL;
> +}

[Severity: Low]
Can the close(kmsg_fd) and return statements after ksft_finished() ever
run? ksft_finished() expands to ksft_exit(), and that always calls either
ksft_exit_pass() or ksft_exit_fail(). Both are __noreturn.

So the exit status comes from the kselftest counters, not from the
KSFT_PASS or KSFT_FAIL returned here. The same applies to the fail: path.

Separately, ksft_exit_skip() is called after ksft_set_plan(1). This
happens on the unshare(), /dev/kmsg open and seek, loopback, and "no
selected writable numeric network sysctls" paths. kselftest.h calls this
pattern a misuse:

tools/testing/selftests/kselftest.h:ksft_exit_skip() {
    ...
	/*
	 * FIXME: several tests misuse ksft_exit_skip so produce
	 * something sensible if some tests have already been run
	 * or a plan has been printed.  Those tests should use
	 * ksft_test_result_skip or ksft_exit_fail_msg instead.
	 */
    ...
}

The header works around this today and prints "ok 1 # SKIP", so the TAP
output is still valid. Would ksft_test_result_skip() followed by
ksft_finished() be a better fit on these paths?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014041446.2821085-1-sahaj123.sc%40gmail.com
