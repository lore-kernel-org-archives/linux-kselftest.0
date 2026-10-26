Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033382;
	b=cTJ5+k9tm2am0BA2FJuBt0u5zqnZmlCM9zReP34G1yYgm5fj+0EnazWmTswr892QfSnN
	 8G0wngKrp0fWON25+pLS95zEHf7Vw6dtcarzsUS4ukuCcF5/O0ooiIXlf1VGBl9XTR/Sw
	 3yu+m/RL4UdhWW2zkoW6OyUeZfVMujVMO475afdv7D/LL3bpxh/F1cXOaWU4yE3gFT7b+
	 sfUKqMw/UagVEFkc7EXJqDl+GNgauu7wQj+xYa9tGieZhEop0Mh3A84uj+e3sUxvIPk/c
	 ggvHx3P6WcLz0jnD8r96edHUdqwl1mmHxK7FbUpJkBnWXsYo8giXVZlHVFo0XJ2BE8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033382;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=y23T2h2GqwoD/whugkXIP7aaex8iTjdAPLzd5mbQF8c=;
	b=ribm8DUxpGG0Baoye6cInDVa8FuL0pv8pS2tBHKW6LpOAMcAr1VhcuWAffwxa2j9q6oo
	 YLIEilpiQSsg3MSlV193Ol9B6byVY2CdPmIUXIVndzwBqpa90F1QBphNvqpTJACy+4Egz
	 O2OiF6hDfqVU0Vc0Y4NM7thFbvxypJ+hKQFcOsKkk3XWm+GqUbrKAPnsIE750+9UKWROW
	 HS899fzb+kInlw49H470K57BJKjynVl/fNVHz7wo5g+W1Xloxcs34Yu7KCdsx9UYS1EQG
	 irsjThfv/0rYOMC6+RVnJlLbFNpRlH3yTFT/ny0t53TRxMOUv2upwH1RNEjaEB1x/Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eSIUbj/f";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF2B606A325;
	Mon, 26 Oct 2026 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSIUbj/f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FFF1F01825;
	Mon, 26 Oct 2026 16:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793033381;
	bh=y23T2h2GqwoD/whugkXIP7aaex8iTjdAPLzd5mbQF8c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eSIUbj/fyojBq3HQRFxeIxkdrXfEVy5YRekWnqL35S2BnC5Bf/oiaHYfBdAH8oNEY
	 2i/i01wzlokhmE/3L1Ww4kgiNjWe/HwTf+CiwHVFdkI119DRPPpOXVrUEd0jxtrrnH
	 2H36+acnUxai2XOlTF5HfH3qMsgxsqQRzU9xgCEXkiDCL4Mt0ZXu97VRi7SpIjINtv
	 GmThBhfL8OuXuH2KAaOiOUlr+4Uy6+yrl7ReQPLBmdw6a5cixPqG9Ly8q/npqOvtks
	 BQ+lJzRetFSi0aPDJj6zFVtJ3N+L2XpF/MKrCmFzsU8lVGXYFgS7dB9/EAiUbV/NHU
	 cfchkEP8B0Tcg==
Subject: Re: [PATCH net v3] selftests/net: test network sysctl extremes
From: netdev-bot+sashiko@kernel.org
To: sahaj123.sc@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, hangbin.liu@linux.dev,
 netdev-bot+sashiko@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 26 Oct 2026 16:49:40 +0000
Message-ID: <179303338069.3134.8407087775481756454@kernel.org>
In-Reply-To: <20261025160927.3934600-1-sahaj123.sc@gmail.com>
References: <20261025160927.3934600-1-sahaj123.sc@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Several splat patterns in check_kernel_log()
  (tools/testing/selftests/net/sysctl_net_test.c) do not match what this…
- [Medium] The test says it exercises TCP and UDP loopback traffic at
  every accepted lower and upper bound of tcp_rmem/tcp_wmem, but its…
- [Medium] Every whole-test skip path in main() calls
  ksft_test_result_skip() and then ksft_finished().
- [Medium] check_kernel_log() can still be spoofed by text a task
  controls, even though the v3 notes claim "Match kernel splat…
- [Low] The permanent commit message mixes revision history into the
  change description, overstates scope, and leaves out behaviour that…
- [Low] The test's verdict depends on global kernel log activity that has
  nothing to do with the sysctls under test.
- [Low] The boundary search has no expected value to compare against.

--

selftests/net: test network sysctl extremes

This adds a new kselftest, sysctl_net_test. It unshares a network
namespace, searches for the accepted lower and upper bounds of each value
in ipv4/tcp_rmem and ipv4/tcp_wmem, and runs TCP and UDP loopback traffic
at each bound. While it runs, it also watches /dev/kmsg for kernel splats.

Link: https://lore.kernel.org/r/20261014041446.2821085-1-sahaj123.sc@gmail.com

> selftests/net: test network sysctl extremes
>
> Probe the accepted lower and upper bounds of per-network-namespace TCP
> receive and send memory sysctls, then exercise loopback traffic at each
> bound.
>
> Drop udp_rmem_min and udp_wmem_min: one-byte UDP traffic does not create
> the memory pressure needed to test them. Keep UDP loopback only as a
> transport smoke check.

[ ... ]

> Tested: W=1 selftest build; x86_64 QEMU with CONFIG_NET_NS=y.

[Severity: Low]
This isn't a bug, but the "Drop udp_rmem_min and udp_wmem_min" paragraph
describes a change from an earlier posting. This commit creates
sysctl_net_test.c from scratch, so nothing is dropped in git history.
Should that text go below the --- line with the rest of the changelog?

The subject "test network sysctl extremes" also sounds broader than the
code. representative_sysctls[] only lists ipv4/tcp_rmem and
ipv4/tcp_wmem.

The body doesn't say that the test reads the global /dev/kmsg and fails
on any kernel splat. It also doesn't say that the test skips when
/dev/kmsg can't be opened or seeked, or when printk records are lost.
Could the commit message describe this?

Also, "Tested:" isn't a standard trailer.

> diff --git a/tools/testing/selftests/net/sysctl_net_test.c b/tools/testing/selftests/net/sysctl_net_test.c
> new file mode 100644
> index 0000000000000..81b9b32245f42
> --- /dev/null
> +++ b/tools/testing/selftests/net/sysctl_net_test.c
> @@ -0,0 +1,982 @@

[ ... ]

> +static bool check_kernel_log(void)
> +{
> +	static const char * const splats[] = {
> +		"WARNING: possible circular locking dependency",
> +		"BUG: unable to handle",
> +		"------------[ cut here ]",
> +		"Kernel panic - not syncing:",
> +		"BUG: KASAN:",
> +		"watchdog: BUG: soft lockup",
> +		"watchdog: BUG: hard LOCKUP",
> +	};
> +	static const char * const error_prefixes[] = {
> +		"Oops:",
> +		"divide error:",
> +		"general protection fault:",
> +		"invalid opcode:",
> +	};

[Severity: Medium]
Do these patterns match what the kernel prints today? Several of them
don't seem to line up with the current format strings.

For WARN, __warn() in kernel/panic.c prints:

	pr_warn("WARNING: %s:%d at %pS, CPU#%d: %s/%d\n", ...
	pr_warn("WARNING: at %pS, CPU#%d: %s/%d\n", ...

So the "WARNING: CPU: <n> PID: <n>" parser later in check_kernel_log()
can never match. WARNs are only caught by the "cut here" entry.

For x86 oopses, __die_header() in arch/x86/kernel/dumpstack.c prints:

	"Oops: %s: %04lx [#%d]%s%s%s%s\n", str, err & 0xffff,

page_fault_oops() passes "Oops" as str, so the record reads
"Oops: Oops: 0000 [#1] ...". The error_prefixes check:

	splat = *p == ' ' && isxdigit((unsigned char)p[1]);

rejects that record ('O' is not a hex digit). It also rejects
"Oops: general protection fault: ..." and "Oops: invalid opcode: ...".
No record starts with the bare "general protection fault:" or
"invalid opcode:" prefixes. Only "Oops: divide error" matches, and only
because 'd' happens to be a hex digit.

On x86, a kernel NULL dereference goes through show_fault_oops() in
arch/x86/mm/fault.c:

	pr_alert("BUG: kernel NULL pointer dereference, address: %px\n",

That string isn't in splats[], which only has the "BUG: unable to
handle" branch. The die() path prints no "cut here" line, so nothing
matches a NULL dereference.

On arm64, __die() in arch/arm64/kernel/traps.c prints
"Internal error: %s: %016lx [#%d] SMP", and die_kernel_fault() prints
"Unable to handle kernel %s at virtual address". Neither is matched,
even though the commit notes cite an arm64 run.

watchdog_hardlockup_check() in kernel/watchdog.c prints:

	pr_emerg("CPU%u: Watchdog detected hard LOCKUP on cpu %u\n", ...);

So the "watchdog: BUG: hard LOCKUP" entry never matches anything.

Lockdep also prints "WARNING: possible recursive locking detected",
"WARNING: inconsistent lock state", "WARNING: suspicious RCU usage",
"WARNING: bad unlock balance detected!" and others with no "cut here"
line. Only the circular dependency report is listed.

An oops can happen in softirq, a timer or a kworker, for example in TCP
timers or loopback RX at an extreme rmem/wmem value. If it does, the
test keeps running and reports a pass. Could these patterns be updated
to match the current format strings?

[ ... ]

> +		/* Ignore messages that userspace wrote to /dev/kmsg. */
> +		prefix = strtoul(record, NULL, 10);
> +		if (prefix >> 3 != 0)
> +			continue;

[Severity: Medium]
Can a task still fake a splat here? The v3 notes say the matcher no
longer matches task-controlled "BUG:" text. However, some facility 0
kernel records start with the task comm, and those get past this
filter.

On x86, show_signal_msg() in arch/x86/mm/fault.c does:

	printk("%s%s[%d]: segfault at %lx ip %px sp %px error %lx",
		loglvl, tsk->comm, task_pid_nr(tsk), address,

show_unhandled_signals defaults to 1. On arm64, arm64_show_signal()
does:

	pr_info("%s[%d]: unhandled exception: ", tsk->comm, ...);

TASK_COMM_LEN is 16, so a comm can be up to 15 characters. /dev/kmsg
isn't namespaced, so any unprivileged process on the host can do this:

	prctl(PR_SET_NAME, "BUG: KASAN:");
	/* then take an unhandled SIGSEGV */

The record "BUG: KASAN:[pid]: segfault at ..." matches the
"BUG: KASAN:" entry in splats[], so the test fails with "kernel splat
detected".

Other comms work the same way:

  "Oops: 0" matches the "Oops:" prefix, since a space and a hex digit
  follow it.

  "divide error: a" is exactly 15 characters.

  "UBSAN: x" passes the isalpha() check.

The validation in the notes only used the comm "BUG:", which is shorter
than every pattern, so it doesn't cover this case.

[ ... ]

> +static int find_bound(const char *path,
> +		      const struct sysctl_values *original, size_t index,
> +		      bool lower, bool unsigned_domain,
> +		      struct sysctl_number *bound)
> +{

[ ... ]

> +	*bound = unsigned_domain ? number_from_unsigned(valid) :
> +		 number_from_signed(unordered_value(valid));
> +	return 0;
> +}

[Severity: Low]
Should the bound found here be checked against an expected value?
find_bound() takes whatever value the kernel accepts as the correct
bound.

Documentation/networking/ip-sysctl.rst says each tcp_rmem value "cannot
be set below 4096". net/ipv4/sysctl_net_ipv4.c enforces this with:

	.extra1		= &tcp_min_rcvbuf,

Suppose that minimum regresses. The notes describe a vendor 6.12.57
kernel that accepted tcp_rmem[1]=1 and sent zero-window SYN/SYN-ACKs.
The test would just find the new bound and run traffic there.

The verdict in main() only needs one success, so the arm64 run with TCP
11/12 would still pass.

[ ... ]

> +int main(int argc, char **argv)
> +{

[ ... ]

> +	if (unshare(CLONE_NEWNET)) {
> +		ksft_test_result_skip("cannot create network namespace: %s\n",
> +				      strerror(errno));
> +		ksft_finished();
> +	}

[Severity: Medium]
Does this exit with KSFT_PASS instead of KSFT_SKIP?
ksft_test_result_skip() increments ksft_cnt.ksft_xskip, and
ksft_finished() is defined as:

	#define ksft_finished()			\
		ksft_exit(ksft_plan ==		\
			  ksft_cnt.ksft_pass +	\
			  ksft_cnt.ksft_xpass +	\
			  ksft_cnt.ksft_xfail +	\
			  ksft_cnt.ksft_xskip)

With a plan of 1 and one skip, the condition is true and
ksft_exit_pass() exits with 0. run_one() in kselftest/runner.sh tells
pass from skip only by the exit code, so the run is recorded as a pass.

main() uses the same pattern for the /dev/kmsg open and seek failures,
for the loopback failure, and for the "no selected writable numeric
network sysctls found" case. It also uses it for the
kernel_log_incomplete case, which v3 added so that an incomplete splat
check would not count as a pass.

Would ksft_exit_skip() be the right call for these whole-test skips?

> +
> +	kmsg_fd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK | O_CLOEXEC);

[Severity: Low]
Should the result of this test depend on the global kernel log?
unshare(CLONE_NEWNET) isolates the sysctls, but /dev/kmsg is
system-wide.

check_kernel_log() runs after every probe and traffic step. A WARN from
unrelated work running at the same time, such as other selftests,
drivers or kworkers, would fail this test with "kernel splat detected".

Also, a printk burst that causes EPIPE sets kernel_log_incomplete. The
whole run is then reported as a skip, even if every sysctl and traffic
check passed:

	if (kernel_log_incomplete) {
		...
		ksft_test_result_skip("cannot complete kernel splat check\n");

netdev CI already scans dmesg after each test. Is a separate check
needed here?

[ ... ]

> +	if (!failure[0] && (!tcp_successes || !udp_successes))
> +		set_failure("loopback delivery incomplete: TCP %zu/%zu, UDP %zu/%zu",
> +			    tcp_successes, tcp_attempts,
> +			    udp_successes, udp_attempts);

[Severity: Medium]
Is this check strict enough? When delivery fails,
run_loopback_traffic() only copies the first error into
tcp_delivery_failure or udp_delivery_failure. That string is printed as
a '#' comment, and set_failure() is never called.

So the test only fails here when every TCP attempt fails or every UDP
attempt fails. With TCP 1/12 or UDP 1/12, main() still reaches:

	ksft_test_result_pass("TCP/UDP loopback smoke: TCP %zu/%zu, UDP %zu/%zu\n",

The arm64 run in the notes had one TCP timeout in 12 attempts at
tcp_rmem[1]=1, and it would be reported as a pass.

Should a delivery failure at any bound fail the test?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261025160927.3934600-1-sahaj123.sc%40gmail.com
