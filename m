Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793255045;
	b=N88YINdu2L6Pzz2AYAnMrdK6UmvM36Flxb4C80WGaSxdZL3orDuT7h1ET3EPJ29jjZaN
	 TowRu6eHq30dLlQ+dSEOEWLEe+HKwo6kNTIuE55mDRd0iBZG4PahsaxzYfsVkee5N3E2n
	 CcGLa/DERbH6Q0P7i/QVidxIp7XMA/pBqL6sLFOVPingl8VGDPm3eI6n3uEt0LUZ4zdYN
	 V5Ruq6HQRGQzmCL16DVQyVwuyAFMe80J6Kz9GcGHpIOnErCaVxAhmGee+LvGB9r17Nym/
	 6YEuqh1CpCHbC2MOxahR9j4qIZP6Wt0BkZSU38ntE7z7kZrYxzBC7ImnnqtmkyelJXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255045;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=62zl3zv2d5JAkHiUi8pE4KR/NfZKfMMIyW7AuqAQ65k=;
	b=t2MHKLw1tHkj/G5E6NpwEYXr/dzSP4Iee2V5DXGixGN0hFfQUO+pgoUuEXV0Sud9CbWS
	 XTE9di4kn3MebTWceVfXClC+6kPJMKkv4cQ6ncd1+H4AKhtpQX0F3KDLqoM5EvbNpeHuJ
	 nsNyVk7s9SDDmmfP4COppXlumVwV9KhlQK/gRuebc6D3bMRIZ86/zXlwZL9L31TRQ7DD1
	 aZ7M00XBEOCzeAQy2Dhn1cizLIB/cSgYixJoUe7wn78B+957mv9Yg4a3HlymueFYXxGLF
	 kTYG2JEXPq3SFjhHpT/yArzuHtZ2vKfRGpOzQ2FEQXiURWQmUK5VUBIBwdhOVtEQUaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mF4lIu+t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2261606A31A;
	Thu, 29 Oct 2026 06:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mF4lIu+t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6791F01825;
	Thu, 29 Oct 2026 06:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793255044;
	bh=62zl3zv2d5JAkHiUi8pE4KR/NfZKfMMIyW7AuqAQ65k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mF4lIu+tGM8htzhrd/5kvMqyF65tQpiuQ34e53o2G3K+UxilPphvpRhQKhkmmvDVe
	 Jl+qu25/UYtV9GTQTv1wotIBgRz82g0V0f9HhEsV34eFNUdUyvpLWY8KoKee39i4S0
	 n3HQ07ZfPw9QIQkTzL1wDesaN99GqcDdyr3qsjsq958Jc1PNVHTWswPol0SeLF+BUc
	 lSc63C1OiCFLs1J+WEVtNaXNnPdMtCvOZb6qkIGQYrkM5dK9P5kLEWmPeXKFuDKeyO
	 LW0OnaUSn3ebNL8qmx9v2HOyHNEhbNS/PA8oQOleDuwqf3c2A2MQVrm67B43+15jif
	 1kxvd4LyJWDQA==
Subject: Re: [PATCH net v4 2/2] selftests: net: packetdrill: add test for
 negative sk_forward_alloc in tcp_wmem_schedule()
From: netdev-bot+sashiko@kernel.org
To: tavip@google.com
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 shuah@kernel.org, horms@kernel.org, willemb@google.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 29 Oct 2026 06:24:03 +0000
Message-ID: <179325504311.3134.4521422682926617403@kernel.org>
In-Reply-To: <20261026032216.1145201-3-tavip@google.com>
References: <20261026032216.1145201-3-tavip@google.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The REQUIRES_MEMCG check in ksft_runner.sh (lines 61-72) only
  confirms that `+memory` can be written to the cgroup2 root…
- [Medium] cleanup_memcg() in
  tools/testing/selftests/net/packetdrill/ksft_runner.sh (lines 73-80)…
- [Medium] Step 4 of tcp_wmem_schedule_negative_fwd_alloc.pkt (lines
  98-101) depends on the two `echo 0 > memory.high` writes having…

--

selftests: net: packetdrill: add test for negative sk_forward_alloc in tcp_wmem_schedule()

This adds a packetdrill test that pushes sk_forward_alloc negative through
tcp_collapse() while sk_wmem_queued is above tcp_wmem[0]. It then checks
that a non-blocking write() under memcg pressure fails with EAGAIN. It also
adds REQUIRES_PAGESIZE and REQUIRES_MEMCG directives to ksft_runner.sh. The
REQUIRES_MEMCG directive enables the cgroup2 memory controller and installs
an exit cleanup handler.

> diff --git a/tools/testing/selftests/net/packetdrill/ksft_runner.sh b/tools/testing/selftests/net/packetdrill/ksft_runner.sh
> index 0a97d5ae34699..ba62f3840eb57 100755
> --- a/tools/testing/selftests/net/packetdrill/ksft_runner.sh
> +++ b/tools/testing/selftests/net/packetdrill/ksft_runner.sh
> @@ -52,6 +52,34 @@ if [[ -n "${KSFT_MACHINE_SLOW}" ]]; then

[ ... ]

> +if grep -q -E '^--define=REQUIRES_MEMCG=' $script; then
> +	cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
> +	memcg_was_enabled=0
> +	if [[ -n "$cgroot" ]] &&
> +	   grep -qw memory "${cgroot}/cgroup.subtree_control" 2>/dev/null; then
> +		memcg_was_enabled=1
> +	fi
> +	if [[ -z "$cgroot" ]] ||
> +	   ! echo +memory > "${cgroot}/cgroup.subtree_control" 2>/dev/null; then
> +		ktap_skip_all "requires cgroup2 memory controller"
> +		exit "$KSFT_SKIP"
> +	fi

[Severity: Medium]
Is this check enough to decide that the test can run? It confirms that the
memory controller can be enabled at the root. It does not confirm that
socket memory is charged to the memcg.

If the kernel boots with cgroup.memory=nosocket, cgroup_memory_nosocket is
set. In that case mem_cgroup_css_online() never increments
memcg_sockets_enabled_key:

mm/memcontrol.c:mem_cgroup_css_online() {
    ...
    if (memcg_on_dfl && !cgroup_memory_nosocket)
        static_branch_inc(&memcg_sockets_enabled_key);
    ...
}

mem_cgroup_sk_alloc() then returns early:

    if (!mem_cgroup_sockets_enabled)
        return;

So the accepted socket gets no sk_memcg. The memory.high and memory.max
writes in step 4 of tcp_wmem_schedule_negative_fwd_alloc.pkt then have no
effect on it.

On such a kernel, wouldn't the final write(4, ..., 16384) succeed, so the
test reports FAIL instead of SKIP?

> +	cleanup_memcg() {
> +		rmdir "${cgroot}"/pkt_* 2>/dev/null || true
> +		if [[ "$memcg_was_enabled" -eq 0 ]]; then
> +			echo -memory > "${cgroot}/cgroup.subtree_control" \
> +				2>/dev/null || true
> +		fi
> +	}
> +	trap cleanup_memcg EXIT
> +fi

[Severity: Medium]
Can this rmdir remove cgroups that this runner did not create? The glob
matches every empty cgroup named pkt_* at the cgroup2 root. That root is
shared with the host, because the runner only does unshare -n.

Even a single run would delete an existing empty pkt_* cgroup on the host,
along with its configured limits.

When runners overlap, one runner's EXIT trap can also remove another test's
pkt_${PPID}. One example is kselftest's run_many() starting tests with
run_in_netns &. That cgroup is empty, and so removable, in two windows:

  - between the mkdir and the cgroup.procs write in the .pkt init command
  - after packetdrill moves itself back to its original cgroup following
    accept()

In either case, the step 4 writes to memory.high and memory.max would fail.

Could the cleanup be limited to the pkt_<pid> cgroups created by this
runner's children? The .pkt cleanup command already removes its own
"${cgroot}/pkt_${PPID}".

There is a similar question about memcg_was_enabled. It is sampled once,
before +memory is written. If another runner or another user starts using
the root memory controller while this test runs, the exit trap still writes
-memory to the root cgroup.subtree_control.

Is it intended to disable a shared controller based on that earlier
snapshot? Any EBUSY from that write is also silently dropped by the
|| true.

> +
>  ip_versions=$(grep -E '^--ip_version=' $script | cut -d '=' -f 2)
>  if [[ -z $ip_versions ]]; then
>  	ip_versions="ipv4 ipv6 ipv4-mapped-ipv6"
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
> new file mode 100644
> index 0000000000000..e4d8d13144f0a
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
> @@ -0,0 +1,116 @@

[ ... ]

> +`set -e
> +./defaults.sh
> +ip link set dev tun0 mtu 65535
> +sysctl -q net.ipv4.tcp_rmem="4096 131072 6291456"
> +sysctl -q net.ipv4.tcp_wmem="4096 16384 4194304"
> +taskset -cp 0 $PPID >/dev/null 2>&1 || true
> +cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
> +[ -n "$cgroot" ]
> +echo +memory > "${cgroot}/cgroup.subtree_control"
> +rmdir "${cgroot}/pkt_${PPID}" 2>/dev/null || true
> +mkdir "${cgroot}/pkt_${PPID}"
> +echo 0 > "${cgroot}/pkt_${PPID}/memory.swap.max" 2>/dev/null || true
> +echo $PPID > "${cgroot}/pkt_${PPID}/cgroup.procs"
> +`

[ ... ]

> +// 4. Drain per-CPU memcg stock via memory.high=0, cap memory.max=0 (O_NONBLOCK
> +//    avoids synchronous reclaim/OOM), and expect -EAGAIN on a 16 KB non-blocking
> +//    write. Because copy (16 KB) minus sk_forward_alloc (<= -16.4 KB) exceeds
> +//    PAGE_ALLOC_COSTLY_ORDER (32 KB), try_charge_memcg() fails without invoking
> +//    the memcg OOM killer.
> ++0.010 `cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
> +echo 0 > "${cgroot}/pkt_${PPID}/memory.high"
> +echo 0 > "${cgroot}/pkt_${PPID}/memory.high"
> +printf 0 | dd of="${cgroot}/pkt_${PPID}/memory.max" oflag=nonblock status=none`
> ++0.000 fcntl(4, F_SETFL, O_RDWR|O_NONBLOCK) = 0
> ++0.000 write(4, ..., 16384) = -1 EAGAIN (Resource temporarily unavailable)

[Severity: Medium]
How reliably does this empty the memcg's per-CPU stock before the final
write()?

If any stock for this memcg is left on the CPU running write(),
try_charge_memcg()->consume_stock() can cover the charge (about 9 pages)
without checking memory.max:

    if (nr_pages > MEMCG_CHARGE_BATCH ||
        !local_trylock(&memcg_stock.lock))
        return ret;

Each memory.high write calls drain_all_stock() once. drain_all_stock()
returns early if percpu_charge_mutex is contended. It also skips CPUs that
already have FLUSHING_CACHED_CHARGE set, and it drains only the current CPU
synchronously:

    if (!mutex_trylock(&percpu_charge_mutex))
        return;
    ...
            if (cpu == curcpu)
                drain_local_memcg_stock(&memcg_st->work);
            else
                schedule_drain_work(cpu, &memcg_st->work);

Remote CPUs are drained asynchronously, and nothing waits for them.

The memory.max write uses oflag=nonblock. That makes memory_max_write()
take the O_NONBLOCK path, which skips draining entirely:

    if (of->file->f_flags & O_NONBLOCK)
        goto out;

The synchronous local drain only reaches the right CPU if the earlier
taskset -cp 0 $PPID succeeded. A failure there is hidden by || true, for
example when CPU 0 is not in the runner's cpuset.

In those cases, could write() be served from leftover stock and succeed,
making the test flaky?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261026032216.1145201-1-tavip%40google.com
