Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752004;
	b=RmF+ex4guTBt1rom7UqxK3zPvfbJh7a9iVv4y146ttIwazHrKCyB3XNzVnlqzWS2saEI
	 hFFwCN2sILsDumeKm6aynLnLJHJ+b3C64PkBCuQya6Cz0RqBMRUq3iD2XFOta3fmPpD6F
	 wPwyDXoVpP67iY8h0NIiuW7IMGtv/zJmaV1ME8M/vpi76cg2oUk3X9Pn5/pOnzvmqY/n9
	 Tg7M1RHB6EiYMJfgpDt/nLi25uVifu7uvutj4rVVFrBKOJgn+rPSx9si6G2qtUvZ3n3dG
	 8+98L71dXQTmK5e/nV4Zu8HWVa+eNISrrSjh2jT4ZSSVuMk3D0AJEGMRSHW05pKmIYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752004;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=EyHN7bZEc4KnHTHbjA7noUFJQlM8pFHIuba01Jbwrdg=;
	b=Cpkp1PbjeW6svs0aEJEv6R/lnelgOiw6sXKJ50m5wNAPa7lS53Fm5N8GyNWwfWZ3WY3M
	 6on43Q+aA4qEK0jRisbwa6IQVYqqka3Cbe7ULrwusSAAAkJskRjDzhaV+OkC8IaNBp+IS
	 t0eYp20kBO7mn0/fjjwhx1jgDRfugrH1ZOivwPnnMbVzEDEQpn8Dg8gNd2vTW4Ssgws3T
	 6UyqSHDtzqWcxCHdfupy78+YfUQDfowAj1hxWp+NN8YXDg0F8WItKVNfBnP2rrBUbfA4w
	 dUBInxVmOCdMI07kMsGVcE5X2B1KDj09j5r/Og1YEuhjsV3OWjjXF8d/9Q3/bpLaQug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DM0eF15C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C368A606A31D;
	Fri, 23 Oct 2026 10:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DM0eF15C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783F71F01825;
	Fri, 23 Oct 2026 10:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792752003;
	bh=EyHN7bZEc4KnHTHbjA7noUFJQlM8pFHIuba01Jbwrdg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DM0eF15CrEP/oO3KgrGIQoUN5mKMGnFPUgIQ5b6bcyt3nVP/dT+P6wIWGqer9CbBr
	 ZcryR5e6QZYqJqdUJutmhomt1Jz0IaHTNCwvvJcQhR8HfaA8rsn0o7Dmd+99HXaY0W
	 WrFyzOsy22FCpZNmGVyq4kPukOC/FwiPcgwYLKuDNxuR/jm0hNOw3pTyUXZSFkkJeb
	 Z3OvYv20Phhux2NEqm8R/1UK+O5kwW4KzGGr63wEEB84i0+CPZyG914ui9A62ls4rH
	 0/DjIAm4uZfaaxwnUH9TMDNY6x7AqKmeaRPJq09B/nBR4Qx7IxNHxJa4gbiZP8sLrO
	 z88Yr+8jEKcVA==
Subject: Re: [PATCH net v2 2/2] selftests: net: packetdrill: add test for
 negative sk_forward_alloc in tcp_wmem_schedule()
From: netdev-bot+sashiko@kernel.org
To: tavip@google.com
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, willemb@google.com, weiwan@google.com,
 shakeel.butt@linux.dev, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 23 Oct 2026 10:40:01 +0000
Message-ID: <179275200199.3134.7814025017986694129@kernel.org>
In-Reply-To: <20261020163835.4076594-3-tavip@google.com>
References: <20261020163835.4076594-3-tavip@google.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_n
  egative_fwd_alloc.pkt, the new test reports FAIL instead of SKIP when…
- [Low] The packetdrill config fragment
  (tools/testing/selftests/net/packetdrill/config line 4) adds…
- [Low] The init command writes `echo +memory >
  "${cgroot}/cgroup.subtree_control"` (line 17) on the root of the…

--

selftests: net: packetdrill: add test for negative sk_forward_alloc in tcp_wmem_schedule()

This patch adds a packetdrill test. The test drives sk->sk_forward_alloc
negative through tcp_collapse() while sk_wmem_queued is above tcp_wmem[0].
It then checks that a non-blocking write() under memcg pressure fails with
EAGAIN, not EFAULT. The runner can now also skip any test whose
REQUIRES_PAGESIZE does not match the host.

> diff --git a/tools/testing/selftests/net/packetdrill/config b/tools/testing/selftests/net/packetdrill/config
> index b7df8bf309200..dc3cd72a8da8c 100644
> --- a/tools/testing/selftests/net/packetdrill/config
> +++ b/tools/testing/selftests/net/packetdrill/config
> @@ -1,6 +1,7 @@
>  CONFIG_HZ=1000
>  CONFIG_HZ_1000=y
>  CONFIG_IPV6=y
> +CONFIG_MEMCG=y

[Severity: Low]
Should this fragment also add CONFIG_CGROUPS=y?

In init/Kconfig, config MEMCG sits inside the "if CGROUPS" block, and
menuconfig CGROUPS has no default. If this fragment is merged onto a base
config with CGROUPS=n, merge_config only prints a warning and MEMCG stays
off.

In that case the new test fails in its init command and never gets to
run. For comparison, tools/testing/selftests/cgroup/config lists
CONFIG_CGROUPS=y next to CONFIG_MEMCG=y.

>  CONFIG_NET_NS=y
>  CONFIG_NET_SCH_FIFO=y
>  CONFIG_NET_SCH_FQ=y

[ ... ]

> diff --git a/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
> new file mode 100644
> index 0000000000000..96a5d60a52cb1
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
> @@ -0,0 +1,117 @@

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
Will this give a failure instead of a skip when cgroup v2 or the memory
controller can't be used?

The init command runs under set -e. It aborts, and packetdrill exits
non-zero, in any of these cases:

  - there is no cgroup2 mount
  - on hybrid v1/v2 hosts, the first cgroup2 mount is the
    controller-less /sys/fs/cgroup/unified
  - the kernel was booted with cgroup_disable=memory
  - the cgroupfs is read-only or delegated inside a container
  - the cgroup namespace root already holds processes (EBUSY)

ksft_runner.sh only looks at packetdrill's exit status:

	unshare -n packetdrill ${ip_args[$ip_version]} ${optargs[@]} $script > /dev/null \
		&& ktap_test_pass $ip_version || $failfunc $ip_version

So any of these cases gives three FAIL results, one for each default IP
version.

The same patch adds a skip gate for REQUIRES_PAGESIZE. The cleanup
command already handles a missing mount with:

  [ -n "$cgroot" ] || exit 0

There is no equivalent check for the cgroup prerequisite, though.
Documentation/dev-tools/kselftest.rst says a test should not make the
top-level "make run_tests" fail when its feature is unconfigured.

This is also the first .pkt in this directory to use cgroups, so none of
the other packetdrill tests had this requirement before.

Could the runner or the test detect this case and skip instead?

> +mkdir -p "${cgroot}/pkt_${PPID}"
> +echo $PPID > "${cgroot}/pkt_${PPID}/cgroup.procs"
> +`

[ ... ]

> +// Untimed cleanup command executed by packetdrill on both pass and early failure.
> +`cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
> +[ -n "$cgroot" ] || exit 0
> +runner_pid=$(awk '/^PPid:/ {print $2}' /proc/$PPID/status)
> +orig_cg=$(sed -n 's/^0:://p' /proc/$runner_pid/cgroup)
> +echo $PPID > "${cgroot}${orig_cg}/cgroup.procs" 2>/dev/null || true
> +echo $$ > "${cgroot}${orig_cg}/cgroup.procs" 2>/dev/null || true
> +rmdir "${cgroot}/pkt_${PPID}"`

[Severity: Low]
Does this leave the memory controller enabled in the host's root
cgroup.subtree_control?

The init command does:

  echo +memory > "${cgroot}/cgroup.subtree_control"

ksft_runner.sh runs the test under "unshare -n" only. That creates a new
network namespace, but not a new cgroup or mount namespace, so cgroot
points at the host's real cgroup2 root.

The tcp_rmem and tcp_wmem sysctls are per-netns and go away with the
netns. The subtree_control change applies to the whole host.

The cleanup moves the processes back and removes pkt_${PPID}. It never
writes -memory or restores the earlier state.

On systems where memory was not already enabled at the root, such as
minimal virtme-ng or CI VMs without systemd, memcg would stay enabled for
all child cgroups after the test exits.

Should the previous subtree_control state be saved and restored here?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261020163835.4076594-1-tavip%40google.com
