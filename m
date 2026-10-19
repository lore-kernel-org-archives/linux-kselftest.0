Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E993B49502D;
	Mon, 19 Oct 2026 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397620; cv=none; b=Q52caBBvuMFSjwG1ZLcKkIEEZrpXb0ek6V4SGK3gts4QFeNzGl5pfSUagF1/Ds3yvKPpw3o6U1mg1QbqBAxINxmH0bt6pngXrBJCyvZbqIB8Ciu8g3xuitnixwAhxDqr8d8xlCPIE01EKSAtB4xZYJGw0Amt2B8XviVoeUADjxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397620; c=relaxed/simple;
	bh=971PbG8MZVADyvBX7JdS6zdx5hQ7TWByVHrGqhguIII=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vCDG3uotUZu3i+eun2fQxy/tq5G39VYKEEGJXWss7zx20DZwSVyhBJL1WdIwNyIVS4iDOQoVaeoAphBX9snIyUWlH3IbaP1O/mBwrGhP/N0S6kZ4Cg27woCPVegKWcX1DKbJI77aCGN7hSi+7e0taga3jkgx6DQK8nbMwLimaEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P61RH9xR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P61RH9xR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA471F000C7;
	Mon, 19 Oct 2026 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792397618;
	bh=9A3BtJaASQr/mF5gQgnbWtiVz/25gWSAbamYzmllBMU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P61RH9xRTdsaUIOH90aE+w2LdVG6bSYNQmVf1Ty/yMVfghKJzJe/APS9qJSmS+MpE
	 Zfr/Ud3zk6jPGT1WLhG+a+do8ZB2ub8QP3BgL7oXHW4FS8zUGNEUIXqUGIy/GFqs9x
	 oivpg48CmxbcN0YqEVtA6RsW/8v/kOxYXS6D3Pth7+xV+Ih7/c6PJAjRg0m59axxxC
	 IEZTgKC7XPM8HjurrjLCuT0c/EMCBEGU3GpEiR3k0DZN8MHsZ9kJhA4WaTGiuT2/Jx
	 /c/f/LSMaRoHyDSTj5OWMVMsIW4uTVmqufJguvZAi1gyDmpIwhEiO970jRTD4Q6A2a
	 DjMLs/ZPfnuTg==
Subject: Re: [PATCH net 2/2] selftests: net: packetdrill: add test for
 negative sk_forward_alloc in tcp_wmem_schedule()
From: netdev-bot+sashiko@kernel.org
To: tavip@google.com
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, willemb@google.com, soheil@google.com, weiwan@google.com,
 shakeel.butt@linux.dev, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 19 Oct 2026 08:13:37 +0000
Message-ID: <179239761721.3135.11128694654168419892@kernel.org>
In-Reply-To: <20261015073736.2944215-3-tavip@google.com>
References: <20261015073736.2944215-3-tavip@google.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When cgroup2 or memcg is missing, the new test reports FAIL
  instead of SKIP.
- [Medium] The test relies on SO_SNDBUF=2097152 (line 38) and
  SO_RCVBUF=145536 (line 39) taking effect exactly.
- [Medium] The memcg cap at step 4 is racy, and the comment at line 32
  ('so only the sockets remain charged to pkt_${PPID}') is wrong.
- [Low] tools/testing/selftests/net/packetdrill/config adds
  `CONFIG_MEMCG=y` but not `CONFIG_CGROUPS=y`.
- [Low] The init command enables the memory controller for all children
  of the cgroup2 root (`echo +memory >…
- [Low] Teardown depends on packetdrill exiting normally.

--

selftests: net: packetdrill: add test for negative sk_forward_alloc in tcp_wmem_schedule()

This adds a packetdrill test that drives sk_forward_alloc negative via
tcp_collapse() while sk_wmem_queued exceeds tcp_wmem[0]. It then caps the
socket's memcg and checks that a non-blocking write() fails with EAGAIN
rather than EFAULT. CONFIG_MEMCG=y is also added to the packetdrill config
fragment.

> diff --git a/tools/testing/selftests/net/packetdrill/config b/tools/testing/selftests/net/packetdrill/config
> index b7df8bf30920..dc3cd72a8da8 100644
> --- a/tools/testing/selftests/net/packetdrill/config
> +++ b/tools/testing/selftests/net/packetdrill/config
> @@ -1,6 +1,7 @@
>  CONFIG_HZ=1000
>  CONFIG_HZ_1000=y
>  CONFIG_IPV6=y
> +CONFIG_MEMCG=y

[Severity: Low]
Should this fragment also add CONFIG_CGROUPS=y?

In init/Kconfig, MEMCG sits inside the CGROUPS block:

menuconfig CGROUPS
...
if CGROUPS
...
config MEMCG
	bool "Memory controller"

If this fragment is merged onto a base config with CGROUPS=n,
merge_config only prints a warning and MEMCG is dropped. The new test
then has no memory controller to use.

Other fragments that need memcg, such as
tools/testing/selftests/cgroup/config, list both CONFIG_CGROUPS=y and
CONFIG_MEMCG=y.

[ ... ]

> diff --git a/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
> new file mode 100644
> index 000000000000..db232b54c554
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
> @@ -0,0 +1,116 @@

[ ... ]

> +`set -e
> +./defaults.sh
> +ip link set dev tun0 mtu 65535
> +sysctl -q net.ipv4.tcp_rmem="4096 131072 6291456"
> +sysctl -q net.ipv4.tcp_wmem="4096 16384 4194304"
> +cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
> +[ -n "$cgroot" ]

[Severity: Medium]
What happens on systems where this check or the cgroup writes below
fail?

The init command runs under set -e. Any of these makes it exit non-zero
and abort packetdrill:

- no cgroup2 mount (hybrid v1 setups, minimal VMs), so the
  [ -n "$cgroot" ] check fails
- the memory controller is bound to cgroup v1, so the +memory write
  gets ENOENT
- the test runs in a container whose cgroup namespace root holds
  processes, so the +memory write gets EBUSY
- cgroupfs is read-only, so the writes and the mkdir fail

ksft_runner.sh treats any non-zero packetdrill exit as a failure:

	&& ktap_test_pass $ip_version || $failfunc $ip_version

Here failfunc=ktap_test_fail. A missing optional feature is therefore
reported as three failures (ipv4, ipv6, ipv4-mapped-ipv6) instead of a
skip. No other packetdrill test depends on cgroups.

Could these prerequisites be detected and reported as a skip?

> +echo +memory > "${cgroot}/cgroup.subtree_control"

[Severity: Low]
Does anything turn the memory controller off at the root again?

The cleanup command at the end of the script moves tasks back and runs
rmdir "${cgroot}/pkt_${PPID}". It never writes -memory. On hosts where
memory was not already enabled in the root cgroup.subtree_control, memcg
accounting stays on for every existing and future top-level cgroup after
the test finishes.

Everything else the test changes is either per-netns or removed
explicitly. This looks like the only setup step with no matching
teardown.

Could the previous state be saved here and restored in cleanup?

> +mkdir -p "${cgroot}/pkt_${PPID}"
> +echo $PPID > "${cgroot}/pkt_${PPID}/cgroup.procs"
> +`

[Severity: Low]
Can a cgroup left over from an earlier run get reused here?

Packetdrill runs the cleanup command itself. If packetdrill is killed by
a signal (a kselftest timeout or SIGKILL), pkt_<pid> stays behind with
the limits set in step 4:

	echo 0 > "${cgroot}/pkt_${PPID}/memory.high"
	cat "${cgroot}/pkt_${PPID}/memory.current" > "${cgroot}/pkt_${PPID}/memory.max"

mkdir -p succeeds on an existing directory, and nothing resets
memory.high or memory.max before packetdrill is moved in. unshare -n
does not create a PID namespace. A later run that gets the same PID
would then do its socket setup and page faults under a near-zero cap.

Would a plain mkdir avoid this? Resetting memory.high and memory.max to
max after creating the directory would also work.

[ ... ]

> ++0.000 setsockopt(4, SOL_SOCKET, SO_SNDBUF, [2097152], 4) = 0
> ++0.000 setsockopt(4, SOL_SOCKET, SO_RCVBUF, [145536], 4) = 0

[Severity: Medium]
Does the test rely on these sizes being granted exactly?

sk_setsockopt() in net/core/sock.c clamps both values without reporting
it, and still returns 0:

		val = min_t(u32, val, READ_ONCE(sysctl_wmem_max));
	...
		__sock_set_rcvbuf(sk, min_t(u32, val, READ_ONCE(sysctl_rmem_max)));

net.core.wmem_max and net.core.rmem_max are global and read-only inside
a child netns. The test cannot raise them from its unshare -n
environment.

Suppose the host has lowered net.core.wmem_max, for example to 212992,
which gives an sk_sndbuf of 425984. The blocking
write(4, ..., 500000) in step 2 would then sit in
sk_stream_wait_memory(). Every injected segment carries ack 1, so no
send space is ever freed, and the script never reaches step 4.

Even if it did reach step 4, __sk_mem_raise_allocated() force charges
in this case:

		if (sk->sk_wmem_queued + size >= sk->sk_sndbuf) {
			/* Force charge with __GFP_NOFAIL */

The final write would then succeed instead of returning EAGAIN. A
lowered rmem_max would likewise change the 291072 byte sk_rcvbuf that
the collapse step depends on.

Packetdrill runs privileged. Would SO_SNDBUFFORCE and SO_RCVBUFFORCE, or
a getsockopt() check, make this deterministic?

[ ... ]

> +// 4. Cap the socket memcg at its current usage and expect -EAGAIN on non-blocking write.
> ++0.010 `cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
> +echo 0 > "${cgroot}/pkt_${PPID}/memory.high"
> +cat "${cgroot}/pkt_${PPID}/memory.current" > "${cgroot}/pkt_${PPID}/memory.max"`
> ++0.000 fcntl(4, F_SETFL, O_RDWR|O_NONBLOCK) = 0
> ++0.000 write(4, ..., 16384) = -1 EAGAIN (Resource temporarily unavailable)

[Severity: Medium]
Is this cap reliable enough for the EAGAIN check?

An earlier comment in the script says:

  // Move packetdrill back to its original cgroup so only the sockets remain charged to pkt_${PPID}

Cgroup v2 does not move existing charges when a task migrates. Whatever
packetdrill allocated while in pkt_${PPID} stays charged there. The same
goes for the sh, awk and sed helpers it forked. Any of those charges can
be released at a later point.

In mm/memcontrol.c, memory_high_write() calls drain_all_stock() once.
drain_all_stock() can skip the drain entirely, and for remote CPUs it
only queues work:

	if (!mutex_trylock(&percpu_charge_mutex))
		return;
	...
			else
				schedule_drain_work(cpu, &memcg_st->work);

memory_max_write() returns straight away, because max equals the
current usage:

		if (nr_pages <= max)
			break;

try_charge_memcg() uses the per-CPU stock before checking any limit:

	if (consume_stock(memcg, nr_pages))
		return 0;

Stock left for pkt_${PPID} on packetdrill's CPU could satisfy the
16384 byte charge. So could a remote drain or an uncharge that completes
after memory.current is read. Either way the charge in
tcp_wmem_schedule()->sk_wmem_schedule()->__sk_mem_raise_allocated()
would succeed and write() would return data. The test would then fail
intermittently with no kernel bug involved.

On systems with swap, can memory.high=0 also swap out packetdrill's own
anon pages that are charged to pkt_${PPID}? Swapping them back in would
charge the capped memcg, which has no task that can be killed.
Packetdrill could then stall in repeated page fault OOM retries.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261015073736.2944215-1-tavip%40google.com
