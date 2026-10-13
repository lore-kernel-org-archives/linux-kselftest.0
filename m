Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E1A51EDE8;
	Tue, 13 Oct 2026 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907117; cv=none; b=PxVMoVGXun8MJBRh587/zJY4wBLB3dLLEyU/3zT/LKJglamiEO3j/qX+2tlxkzLqN1GNG3435UUvI+0stJ4yvNMKvRDnBL+DJ6RueuKLUaSU2akxweL6jtVlu814aL9rR0VmH24m+IgsFKk61N9zQhrBIXmchU0zY/B+yF4ZmpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907117; c=relaxed/simple;
	bh=Y7EncIMUSTySrBPk4RqucPJdwWlEgsmdExjE7vMiLdg=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=osjssdp0Nm3sYM7iK1zqmQ9tzfe0rkJFR+h2NQS0dHRU4su+TLndlhuFIJklFFK5VosArsYlV07Qy8ZswarqhOx0T/iPvZkypaV096ktG1a2n1KohZi8z3ZWrFyJBumtfbpKpkGKzFne0ga6WgDSDuxzhiiEBozWdfyet5tYTnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYvzKQu4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYvzKQu4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7AC1F000FF;
	Tue, 13 Oct 2026 15:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907116;
	bh=0VNs4HApYeC01U0LfNLNU6pJe7CJ+9PmEpmDyV1+gmM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UYvzKQu4zjoEnEc8vrl1HngiYrPgtUalZbjMJfgne4RexhfOSryhz+MmROqZF/l7N
	 4D/f+TskGFbfnyeRlrO4+vqRSX9C+mRdmK9+mbSsgJmAhWK0DgV+bU5bJSDLuryyba
	 rgmko6AtsVmZjYA7bklpEo+ib60UJbEgXFXz0+PFCVXLPkhkKziFloG8eIm5MlfvqV
	 hwfVCobCbZI99i2huJqQdG1oeAtShsDaZ7s+zc6jcvNr7Woil2g5X9mkI8ZB8vlKE7
	 XzGay1l+DNJAcRNY6PhmwS82DmlhS0fy6UmggnynkVaiOd5m53Gi4JW5S1Q3VqCAud
	 escMFRl87WOrg==
Subject: Re: [PATCH net] selftests/net: test network sysctl extremes
From: netdev-bot+sashiko@kernel.org
To: sahaj123.sc@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Tue, 13 Oct 2026 15:58:35 +0000
Message-ID: <179190711505.434549.1991031349414256009@kernel.org>
In-Reply-To: <20261012155339.3799130-1-sahaj123.sc@gmail.com>
References: <20261012155339.3799130-1-sahaj123.sc@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] find_bound() assumes every integer inside the accepted range
  reads back unchanged, and treats the first candidate that does not…
- [Medium] In --all mode, the bound search assumes that if a sysctl
  accepts a write, writing the original value back will also succeed.
- [Low] check_kernel_log() throws away the '<pri/facility>,seq,...;'
  record prefix (`message = strchr(record, ';')`, line 307) and searches…

--

selftests/net: test network sysctl extremes

This adds a selftest that probes the lower and upper bounds accepted by
writable network sysctls inside a private network namespace. It then runs
TCP and UDP loopback traffic at each bound. By default it covers four
representative TCP/UDP sysctls. The -s option selects from that set, and
--all scans every writable numeric sysctl under /proc/sys/net.

Link: https://lore.kernel.org/r/20261007054508.1059927-1-sahaj123.sc@gmail.com

> diff --git a/tools/testing/selftests/net/sysctl_net_test.c b/tools/testing/selftests/net/sysctl_net_test.c
> new file mode 100644
> index 0000000000000..cb2f0570d3372
> --- /dev/null
> +++ b/tools/testing/selftests/net/sysctl_net_test.c
> @@ -0,0 +1,947 @@

[ ... ]

> +static bool check_kernel_log(void)
> +{
> +	static const char * const splats[] = {
> +		"WARNING:",
> +		"BUG:",

[ ... ]

> +		record[n] = '\0';
> +		message = strchr(record, ';');
> +		message = message ? message + 1 : record;
> +		for (i = 0; i < ARRAY_SIZE(splats); i++) {
> +			if (!strstr(message, splats[i]))
> +				continue;
> +			set_failure("kernel splat detected: %.180s", message);
> +			return false;
> +		}
> +	}
> +}

[Severity: Low]
Could check_kernel_log() report a userspace message as a kernel splat?

It drops the record prefix before the ';' without checking the facility.
Any record that contains "WARNING:" or "BUG:" will match. That includes
records that init or a logging daemon writes to /dev/kmsg while the test
is running.

Documentation/ABI/testing/dev-kmsg says:

    If no prefix is given, the priority number is the default kernel
    log priority and the facility number is set to LOG_USER (1). It
    is not possible to inject messages from userspace with the
    facility number LOG_KERN (0)

Should the leading priority value be parsed, and records skipped when
their facility is not LOG_KERN?

> +static int probe_value(const char *path, const struct sysctl_values *original,
> +		       size_t index, struct sysctl_number candidate,
> +		       bool *accepted)
> +{
> +	struct sysctl_values expected = *original;
> +	struct sysctl_values current;
> +	char text[32];
> +
> +	expected.value[index] = candidate;
> +	*accepted = false;
> +
> +	if (write_values(path, &expected) &&
> +	    read_values(path, &current) &&
> +	    values_equal(&expected, &current))
> +		*accepted = true;
> +
> +	if (!restore_values(path, original)) {
> +		format_number(candidate, text, sizeof(text));
> +		set_failure("failed to restore %s after probing %s", path, text);
> +		return -1;
> +	}

[Severity: Medium]
Is it safe to assume that writing the original value back will undo any
value the kernel accepts?

In --all mode this is not true for /proc/sys/net/netfilter/nf_hooks_lwtunnel.
nf_lwtunnel_net_init() registers it with mode 0644 in every netns, so the
test's private netns can write it. Its handler sets a global static key
that can only be turned on:

net/netfilter/nf_hooks_lwtunnel.c:nf_hooks_lwtunnel_set() {
	if (static_branch_unlikely(&nf_hooks_lwtunnel_enabled)) {
		if (!enable)
			return -EBUSY;
	} else if (enable) {
		static_branch_enable(&nf_hooks_lwtunnel_enabled);
	}
    ...
}

With CONFIG_LWTUNNEL=y and the key off at the start, the sequence would
be:

main()->nftw()->scan_sysctl()->test_sysctl()
    find_lower_bound()   probes -1, rejected by extra1 = SYSCTL_ZERO
    find_upper_bound()->find_bound()->probe_value()
        write 1           succeeds, calls static_branch_enable()
        restore_values()  write 0 fails with -EBUSY
        set_failure("failed to restore %s after probing %s", ...)

The run then stops with a FAIL. The netns does not isolate the static
key. Does this also leave netfilter hooks enabled on the lwtunnel/seg6
input and output paths in every namespace, including init_net, until
reboot?

Should the --all scan skip sysctls like this one?

[ ... ]

> +static int find_bound(const char *path,
> +		      const struct sysctl_values *original, size_t index,
> +		      bool lower, bool unsigned_domain,
> +		      struct sysctl_number *bound)
> +{

[ ... ]

> +		if (accepted) {
> +			valid = candidate;
> +			step = next_step(step);
> +			continue;
> +		}
> +
> +		invalid = candidate;
> +		while (lower ? valid - invalid > 1 : invalid - valid > 1) {

[Severity: Medium]
Does this search handle sysctls that accept a value but round it?

probe_value() sets *accepted only when the value read back is exactly
the value written. A rounded value is therefore treated like a rejected
one.

For example, the neighbour sysctls retrans_time_ms and
base_reachable_time_ms are defined with
NEIGH_SYSCTL_MS_JIFFIES_REUSED_ENTRY in net/core/neighbour.c. They use
proc_dointvec_ms_jiffies(), which converts through msecs_to_jiffies()
and jiffies_to_msecs(). With HZ=250 and base_reachable_time_ms=30000:

    probe 29999 -> reads back 30000 -> not accepted
    probe 30001 -> reads back 30004 -> not accepted

Each rejected candidate is one unit from valid, so this loop never runs.
find_bound() then returns 30000 as both the lower and the upper bound.
But 29996 and 30004 both read back unchanged, so 30000 is not a bound.

test_sysctl() then sees that lower equals upper:

		if (exercise_value(path, original, i, lower) ||
		    (!numbers_equal(upper, lower) &&
		     exercise_value(path, original, i, upper)))
			return -1;
		tested_values++;

exercise_value() runs once at the original value. restore is false
there, so nothing is written, but tested_values is still incremented.

In --all mode on a kernel with HZ != 1000, would these sysctls be counted
as bound-tested even though no bound was actually exercised?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261012155339.3799130-1-sahaj123.sc%40gmail.com
