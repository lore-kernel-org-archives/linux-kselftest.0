Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792958056;
	b=Ts1U137HiHcBmTvCUyxJk2lxGKsUuL+Z9r1XgvX3/swrJxiB+Zcz+w20qAdmCEJpgVyx
	 j4HI+O8c7N8n+WBTkpE4gchLiDcOQg9MlFSrFbAXNOoN9zmIYelZYZqz3pfEUQ9eItK1q
	 jRtpTaJJrczOw8in59L5o4oW1+S7BPqGIrhrMO+IqWFU/Kmx73EBEJBYoV9XZD/DVAH9z
	 8piWacoBIy2dMIFhPdX2PbyXLZ6o9qpfA3CmHb7JDFem8voveqSLAFSt0a3eg+xX0eTuQ
	 7sRySulcMKlaexg7ytj+Ns+ay1+EXeKdTfJJSQ3ZbLYWl3+4ONGAj+C8cvPQFQU5tYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958056;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=A2fbBd3lncypSd1BgVJOsxD8tOiD3nHL4ZH2qWAz2rc=;
	b=tsqj/HgXZhhUp2JVveFuFSwkf29NmYLG4Hks+tn2iT9ME4Z0NgH48xRuLfIs57S8t/FQ
	 lW1r+OCwL/aLtuETnLbFnQUn6BHWAasnYK1FyDD/6+eaDqzgVqMNrHxiL8hZibfUOau20
	 doUDWbQoLh9l99R1/WDTqun5ZPISN9c3f9rn+6q7+DMhE53hJyYGldi631/+bB8phyJu4
	 YBGXiqSkElUxQzysS502FufsRyEYSornlGnS1Dl+H1JNiuHwn8F0r+vqtXwCmScwe0vzf
	 YMirhhlooMASaR/n2SRN/4v2kbRxIYe7VZGxluL1oPuWmO04Ukab6u796M4KaoueqGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dqREGDgl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B23606A31A;
	Sun, 25 Oct 2026 19:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dqREGDgl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC6B1F01825;
	Sun, 25 Oct 2026 19:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792958055;
	bh=A2fbBd3lncypSd1BgVJOsxD8tOiD3nHL4ZH2qWAz2rc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dqREGDglrzhvFyVnFV9r6bTJ2N87po4Fliq8CLL4x8S+ci5LJMl9DfOVjEKfcEuQX
	 6tcglt18vOavCpjWMmiH74aK5x0CJ75LYDF6TBQf1lb1WzmNyJw7hIAHLTCpbwwbd8
	 7zzWe62bcWqDecwGmTzV9GgoCf/KOcr9CCxFKDODo1C22sPfCkDn26I63gB4+IT4Fs
	 Ia363p7XP7qe3U4MQT6fuzG1NM8BptophIK0NTBDFlaCfKzhMHcT4W+oLd34AVWHY4
	 UChJxdaVH+2NNVe7yZJnVMpN6Wb/k97kKw68SaJaIlRxUKVUTbql+jjeSKKwJpH8Rp
	 mYFAiK11KBLIA==
Subject: Re: [PATCH v3 2/2] selftests: net: packetdrill: add test for negative
 sk_forward_alloc in tcp_wmem_schedule()
From: netdev-bot+sashiko@kernel.org
To: tavip@google.com
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, willemb@google.com, weiwan@google.com,
 shakeel.butt@linux.dev, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 25 Oct 2026 19:54:13 +0000
Message-ID: <179295805393.3134.356638042840285869@kernel.org>
In-Reply-To: <20261021185447.2914274-3-tavip@google.com>
References: <20261021185447.2914274-3-tavip@google.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When cgroup v2 or a usable memory controller is missing,
  tcp_wmem_schedule_negative_fwd_alloc.pkt reports FAIL instead of SKIP.
- [Medium] Step 4 only gets EAGAIN if the per-CPU memcg_stock holds no
  leftover charge for pkt_${PPID} when write(4, ..., 16384) charges…
- [Medium] Between the init command (line 23, `echo $PPID >
  pkt_${PPID}/cgroup.procs`) and the move-back command (lines 38-41),…
- [Low] Test teardown does not mirror setup.

--

selftests: net: packetdrill: add test for negative sk_forward_alloc in tcp_wmem_schedule()

This adds a packetdrill test that pushes sk->sk_forward_alloc negative
through tcp_collapse() while sk_wmem_queued is above sysctl_tcp_wmem[0].
It then checks that a non-blocking write() under memcg pressure fails
with EAGAIN rather than EFAULT. It also adds CONFIG_CGROUPS and
CONFIG_MEMCG to the packetdrill config, and a PAGE_SIZE based skip to
ksft_runner.sh.

> diff --git a/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
> new file mode 100644
> index 0000000000000..f8b7386fe77e2
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
> @@ -0,0 +1,108 @@

[ ... ]

> +`set -e
> +./defaults.sh
> +ip link set dev tun0 mtu 65535
> +sysctl -q net.ipv4.tcp_rmem="4096 131072 6291456"
> +sysctl -q net.ipv4.tcp_wmem="4096 16384 4194304"
> +cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
> +[ -n "$cgroot" ]
> +echo +memory > "${cgroot}/cgroup.subtree_control"

[Severity: Medium]
What happens with this init command on a system where cgroup2 is not
mounted, or where the memory controller can't be enabled here? Because of
set -e, the init command aborts if any of these steps fails:

  - no cgroup2 mount, so [ -n "$cgroot" ] fails
  - memory is bound to cgroup v1 in a hybrid setup, CONFIG_MEMCG=n, or
    cgroup_disable=memory, so the cgroup.subtree_control write fails
  - the first cgroup2 mount is a non-root cgroup that holds tasks, which
    is common in containers, so enabling +memory fails with EBUSY

packetdrill then exits non-zero, and ksft_runner.sh counts that as a
failure:

	unshare -n packetdrill ${ip_args[$ip_version]} ${optargs[@]} $script > /dev/null \
		&& ktap_test_pass $ip_version || $failfunc $ip_version

The result is three failures (ipv4, ipv6, ipv4-mapped-ipv6) instead of a
skip. The only new prerequisite check in ksft_runner.sh is for PAGE_SIZE.

Could a matching skip be added for a missing cgroup2 memory controller?

> +rmdir "${cgroot}/pkt_${PPID}" 2>/dev/null || true
> +mkdir "${cgroot}/pkt_${PPID}"
> +echo $PPID > "${cgroot}/pkt_${PPID}/cgroup.procs"
> +`

[ ... ]

> +// Move packetdrill back to its original cgroup so subsequent packetdrill allocations are not charged to pkt_${PPID}
> ++0.000 `cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
> +runner_pid=$(awk '/^PPid:/ {print $2}' /proc/$PPID/status)
> +orig_cg=$(sed -n 's/^0:://p' /proc/$runner_pid/cgroup)
> +echo $PPID > "${cgroot}${orig_cg}/cgroup.procs"`

[Severity: Medium]
Does moving packetdrill back also move the memory charged while it ran in
pkt_${PPID}?

Between the init command's cgroup.procs write and this move-back, any
anonymous pages packetdrill touches for the first time (heap growth for
injected or sniffed packets, or stack) are charged to pkt_${PPID}. Cgroup
v2 does not move charges when a task migrates, so those pages stay
charged to pkt_${PPID}.

In step 4 the memory.high write is a blocking echo, so memory_high_write()
keeps calling:

		reclaimed = try_to_free_mem_cgroup_pages(memcg, nr_pages - high,
					GFP_KERNEL, MEMCG_RECLAIM_MAY_SWAP, NULL);

Socket memory can't be reclaimed, so the memcg never gets under high=0,
and reclaim continues until it stops making progress. If swap or zswap is
available, packetdrill's leftover anon pages can be swapped out at this
point.

memory.max is then set to 0. When packetdrill touches one of those pages
again, mem_cgroup_swapin_charge_folio() charges the memcg recorded in the
swap entry, as long as that memcg is still online:

	memcg = mem_cgroup_from_private_id(id);
	if (!memcg || !css_tryget_online(&memcg->css))
		memcg = get_mem_cgroup_from_mm(mm);

pkt_${PPID} stays online until the final rmdir. try_charge_memcg() can't
reclaim the socket memory, and the memcg OOM killer finds no tasks in
pkt_${PPID}. The fault would return VM_FAULT_OOM and be retried forever.

Can packetdrill livelock here? If the kselftest timeout then kills the
runner, the packetdrill child could be left spinning. Its cleanup command
would never run, and pkt_${PPID} would be left behind.

This depends on packetdrill touching new anonymous pages during that
window, and on swap or zswap being present.

[ ... ]

> +// 4. Drain per-CPU memcg stock via memory.high=0, cap memory.max=0 (O_NONBLOCK
> +//    avoids synchronous reclaim/OOM), and expect -EAGAIN on a 16 KB non-blocking
> +//    write. Because copy (16 KB) minus sk_forward_alloc (<= -16.4 KB) exceeds
> +//    PAGE_ALLOC_COSTLY_ORDER (32 KB), try_charge_memcg() fails without invoking
> +//    the memcg OOM killer.
> ++0.010 `cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
> +echo 0 > "${cgroot}/pkt_${PPID}/memory.high"
> +printf 0 | dd of="${cgroot}/pkt_${PPID}/memory.max" oflag=nonblock status=none`
> ++0.000 fcntl(4, F_SETFL, O_RDWR|O_NONBLOCK) = 0
> ++0.000 write(4, ..., 16384) = -1 EAGAIN (Resource temporarily unavailable)

[Severity: Medium]
Can this write() succeed because of leftover per-CPU memcg stock?

The comment relies on memory.high=0 to drain the stock, but
drain_all_stock() is best-effort. It returns right away if another drain
is running anywhere on the system:

mm/memcontrol.c:drain_all_stock() {
    ...
	/* If someone's already draining, avoid adding running more workers. */
	if (!mutex_trylock(&percpu_charge_mutex))
		return;
    ...
}

For remote CPUs it only queues the drain work and does not wait for it.

The memory.max write uses oflag=nonblock, so memory_max_write() takes the
early exit and never drains:

	if (of->file->f_flags & O_NONBLOCK)
		goto out;

The receive-side charges from step 3 go through try_charge_memcg() with a
MEMCG_CHARGE_BATCH batch, and refill_stock() leaves the surplus on the
charging CPU.

When write() charges memory through
tcp_wmem_schedule()->sk_wmem_schedule()->__sk_mem_raise_allocated()->
mem_cgroup_sk_charge()->try_charge_memcg(), the stock is consumed before
memory.max is checked:

retry:
	if (consume_stock(memcg, nr_pages))
		return 0;

consume_stock() accepts any nr_pages up to MEMCG_CHARGE_BATCH, and the
charge here is about 9 pages.

If the stock was not fully drained, the charge would succeed even with
memory.max=0, and write() would return 16384 instead of -1 EAGAIN. Could
this make the test flaky when other memcg activity is running on the
system?

> +
> ++0.000 close(4) = 0
> ++0.000 close(3) = 0
> +
> +// Untimed cleanup command executed by packetdrill on both pass and early failure.
> +`cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
> +[ -n "$cgroot" ] || exit 0
> +runner_pid=$(awk '/^PPid:/ {print $2}' /proc/$PPID/status)
> +orig_cg=$(sed -n 's/^0:://p' /proc/$runner_pid/cgroup)
> +echo $PPID > "${cgroot}${orig_cg}/cgroup.procs" 2>/dev/null || true
> +echo $$ > "${cgroot}${orig_cg}/cgroup.procs" 2>/dev/null || true
> +rmdir "${cgroot}/pkt_${PPID}"`

[Severity: Low]
The init command writes +memory to the root cgroup.subtree_control, but
this cleanup never restores the previous state. Is it intended that this
system-wide change stays in place after the test, whether it passes or
fails?

pkt_${PPID} is also removed only by this cleanup command, which never runs
if packetdrill is killed from outside, for example by the kselftest
timeout. The rmdir at the start of the init command only removes a
directory left by the same PID:

	rmdir "${cgroot}/pkt_${PPID}" 2>/dev/null || true

ksft_runner.sh starts a new unshare -n packetdrill for each of the three
IP versions, and each one gets a new PID. Can stale pkt_* cgroups pile up
across killed runs?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261021185447.2914274-1-tavip%40google.com
