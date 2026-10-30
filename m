Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360831;
	b=V33pXeb35kM39bGKr77+NqO3U3hbbRxeV0yIQ58XWt/aR31u4IDJ6Lch60KH6VgSnkEe
	 p9AuKZbLxkjt2nsTm6NJEAL/mLBNWy/1t6yoUOkJeWVSLoJEHiX7pY2nalHQVPLcQ4uax
	 OQSZGgqfILFdA5R8IPJjRpz/FFx9mf5j2C8V5vugvtar5Ph1CJW1/6kQtrw0tWFyWxJe4
	 KB/5YDiaCcAZrwc2VRSIllCUKaPssFmx92P9cupZRWyxdIPzD6LjzzLfKBZPFaLV5CQzO
	 xAnZp/PFA59WaGeAutuRW9/tlFbK4dk49CivnbETJFnS8prFc1tC52yT5fdMIMEUAKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360831;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZHnthCPj5A6KgOWJmAMgtWXYoYKIGFyJsExFrwrVca4=;
	b=30rjNceowBQXxiq6p48vEZ1HDvOKebiu7Zon291M1nSyW9P1YQ1yom3V91hAXcySmlK1
	 SD0UTQfJboKsIxPvruQ+F3olCGTKIvSLkTvH2t3M7pPGBVigs1dP6Susc65+hVhCGWQWH
	 KxZgMTEkXX/quXbbk3DfPr+AbAdEMRmESsolF252dA8u5s8T9qlyuzJ5P/9nzSPzVgUcN
	 MlaguCMJC3BqI2Rx7qUMfJqomIy9W63k7VV/o6psQ61KTT9LjCGZqpaT0CyvCyV6bHmlI
	 UzoDsXUayn761xvyoWT69dv3ItvY9W3Egen4zrHcVH8sgc/eGAhuOwmsp0ujQmoZFPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2WTb1m5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E88606A31C;
	Fri, 30 Oct 2026 11:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2WTb1m5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7B81F0093A;
	Fri, 30 Oct 2026 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793360830;
	bh=ZHnthCPj5A6KgOWJmAMgtWXYoYKIGFyJsExFrwrVca4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T2WTb1m5MkLrfB9+44eh/42hi2IX9gXdgu1uxKd3v6Lb1zaOMP0VTYVYUh9wSeSri
	 9LzOLUTxzkt9JJwU5/UZRq4KcgcQXwn4ZYw0FkxcnY7p2/Dyn82ow6oHrYYuLtsVIo
	 3AblVupXhu5/7LukPGMeiTNfRtwTVkCPQ5BUOrLnWqFO8T9jOB7ofQPUcpGOQCIiG5
	 qdWIsHWl63LslyYg/lYIkfp5nn23zYXh448NRj1nxo+qeJQ6P4ZeVd2w2zhYxOTuWK
	 JWpgFrZe8r97iImXmQ2vZb4eSieJMWoSKQJugyxaiEJzB0UENAFFGLVjV/+hg6jJ9e
	 OU+CFMq9s5ESQ==
Subject: Re: [PATCH 3/3] selftests: net: add ioam6 ECMP test (RFC 9486 C2)
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 justin.iurman@gmail.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 liuhangbin@kylinos.cn
Date: Fri, 30 Oct 2026 11:47:09 +0000
Message-ID: <179336082983.3134.2219805582819533763@kernel.org>
In-Reply-To: <20261028-ipv6_ioam_ecmp-v1-3-9b6715b6f4c0@kylinos.cn>
References: <20261028-ipv6_ioam_ecmp-v1-3-9b6715b6f4c0@kylinos.cn>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 5

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The compatibility probe in MAIN (lines 308-315) only checks
  that an inline-mode IOAM trace can be attached (`encap ioam6 mode…
- [Medium] In MAIN, `setup_topology || { log_test_skip "Setup failed.";
  exit ...; }` (line 305) runs before `trap cleanup EXIT` (line 306).
- [Low] The commit message and the ioam6_ecmp.sh header comment describe
  scenario 2 differently from what the script does.
- [Low] ioam6_ecmp.sh skips the whole test when
  /proc/sys/net/ipv4/fib_multipath_hash_seed is missing (lines 300-303).
- [Low] The comment in set_beta_tnl() (lines 139-143) says "ip6_tnl
  caches the outer dst per CPU for a few seconds".
- [Low] setup_topology() does not check the return value of the multipath
  route install, which is the core of the test (`ip -netns $ns_beta -6…
- [Low] setup_tunnel() (lines 274-287) decides whether the test loaded
  ip6_tunnel only from `lsmod | grep -q ip6_tunnel`.

--

selftests: net: add ioam6 ECMP test (RFC 9486 C2)

This adds ioam6_ecmp.sh. The test checks that, with hash policy 0, the
ECMP nexthop chosen for a packet carrying IOAM options is the same as
for the packet without them. It covers a transit node forwarding
inline-inserted IOAM Hop-by-Hop packets, and an encapsulating node
doing the ioam6 encap re-lookup with a plain ip6ip6 tunnel as the
baseline.

> diff --git a/tools/testing/selftests/net/ioam6_ecmp.sh b/tools/testing/selftests/net/ioam6_ecmp.sh
> new file mode 100755
> index 0000000000000..c5c82884c7579
> --- /dev/null
> +++ b/tools/testing/selftests/net/ioam6_ecmp.sh
> @@ -0,0 +1,349 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0+

[ ... ]

> +# 2) encapsulating node: beta itself encapsulates (ioam6 encap mode,
> +#    tunnel dst = original dst, tunnel src pinned) over a multipath
> +#    route. The ioam6 re-lookup hashed NEXTHDR_HOP instead of the
> +#    transformed packet's real nexthdr (IPPROTO_IPV6). The baseline is
> +#    the same encapsulation without the IOAM option: a plain ip6ip6
> +#    tunnel over the same multipath route, with the same outer
> +#    addresses.

[Severity: Low]
Is "tunnel dst = original dst" accurate here? The commit message says
the same thing:

  - encapsulating node re-lookup: the forwarder itself encapsulates
    (ioam6 encap mode, tunnel dst equal to the original dst) over a
    multipath route, with a plain ip6ip6 tunnel as the
    identical-packet-without-IOAM baseline.

The script sends to 2001:db8:3::2, but set_beta_ioam_encap() installs
this route:

  2001:db8:3::2/128 encap ioam6 mode encap ... tundst 2001:db8:2:1::2

So the tunnel dst is not the original dst. The topology comment further
down describes this correctly.

If the tunnel dst really were the original dst, the re-lookup would
resolve back to the same ioam6 route:

net/ipv6/ioam6_iptunnel.c:ioam6_output() {
    ...
		if (orig_dst->lwtstate == dst->lwtstate)
			dst_cache_set_ip6(&ilwt->cache,
					  &ilwt->null_rt.dst, &fl6.saddr);
    ...
}

In that case orig_output would be used and the multipath route would
never be consulted.

The ip6ip6 baseline is also not an identical packet on the wire.
ip6_tnl_xmit() pushes an encap-limit Destination Options header when
encap_limit >= 0, and it sets the flow label with ip6_make_flowlabel()
after the route lookup. Only the hash inputs at beta's lookup match.

Could the commit message and this header comment be updated to match
what the test actually does?

[ ... ]

> +set_beta_tnl()
> +{
> +	# Recreate the tunnel: ip6_tnl caches the outer dst per CPU for a
> +	# few seconds, and neither the route change below nor the
> +	# fib_multipath_hash_seed write resets it. A stale cache would
> +	# resolve the outer sibling under a previous seed (or on another
> +	# CPU), making the baseline flip between attempts of one seed.

[Severity: Low]
This isn't a bug, but is "for a few seconds" accurate? ip6_tnl_xmit()
reads the cache with dst_cache_get(&t->dst_cache), and
dst_cache_per_cpu_get() only drops an entry in two cases:

net/core/dst_cache.c:dst_cache_per_cpu_get() {
    ...
	if (unlikely(!time_after(idst->refresh_ts,
				 READ_ONCE(dst_cache->reset_ts)) ||
		     (READ_ONCE(dst->obsolete) && !dst->ops->check(dst, idst->cookie)))) {
    ...
}

That means an explicit dst_cache_reset(), or an obsolete dst that fails
->check(). There is no time-based expiry, so a cached outer dst can
stay indefinitely.

Recreating the tunnel for every seed is still the right workaround. The
comment, though, could lead someone to replace the recreation with a
sleep.

[ ... ]

> +set_beta_ioam_encap()
> +{
> +	ip -netns "$ns_beta" -6 route replace 2001:db8:3::2/128 \
> +		encap ioam6 mode encap tunsrc 2001:db8:2:1::1 tundst 2001:db8:2:1::2 \
> +		trace prealloc type 0x800000 ns 0 size 12 dev veth1
> +}

[Severity: Medium]
What happens on a kernel or iproute2 that supports ioam6 inline and
encap modes but not the tunsrc attribute? The compat check in MAIN
only probes inline mode, so it passes, and setup_tunnel() succeeds.

This route install would then fail on every seed, and run_scenario()
takes this path:

		if ! $ioam; then
			RET=$ksft_fail
			log_test "$desc (ioam route setup failed, seed $seed)"

The result is 12 hard FAILs instead of a SKIP. ioam6.sh already treats
tunsrc as a feature under test.

Is the tunsrc pin needed at all? Without it, ioam6_do_encap() calls
ipv6_dev_get_saddr() on the original dst device (veth1), which should
pick 2001:db8:2:1::1 anyway.

[ ... ]

> +	# The ECMP route under test (scenario 1 hashes its selection at
> +	# beta's input; scenario 2 at the encapsulating re-lookup).
> +	ip -netns "$ns_beta" -6 route add 2001:db8:2:1::2/128 \
> +		nexthop via 2001:db8:2:1::2 dev veth1 \
> +		nexthop via 2001:db8:2:2::2 dev veth2

[Severity: Low]
Should this route add check its return value? If it fails, beta still
has the connected 2001:db8:2:1::/64 prefix on veth1, so all traffic to
2001:db8:2:1::2 leaves through veth1 and arrives on gamma's veth0.

measure_link() would then return "A" for both variants on every seed.
run_scenario() would report PASS even though no ECMP route exists.

Adding "|| return 1" here would catch this.

[ ... ]

> +setup_tunnel()
> +{
> +	if ! lsmod 2>/dev/null | grep -q "ip6_tunnel"; then
> +		modprobe ip6_tunnel &>/dev/null
> +		lsmod 2>/dev/null | grep -q "ip6_tunnel" || \
> +			ip a 2>/dev/null | grep -q "ip6tnl0" || return 1
> +		ip6tnl_loaded=1
> +	fi

[Severity: Low]
Can this unload an ip6_tunnel module the test did not load? Consider
lsmod being unavailable or failing while modprobe works, with
ip6_tunnel already loaded:

  - the first grep fails;
  - modprobe ip6_tunnel succeeds as a no-op;
  - grep ip6tnl0 matches the existing fallback device in the init
    netns;
  - ip6tnl_loaded=1 is set.

cleanup() then runs:

		modprobe -r ip6_tunnel &>/dev/null

This removes the module if nothing else is using it.

When ip6_tunnel is built in, lsmod does not list it either, so
ip6tnl_loaded=1 is set in that case too. The later modprobe -r then
fails harmlessly. ioam6.sh uses the same heuristic.

[ ... ]

> +if [ ! -e /proc/sys/net/ipv4/fib_multipath_hash_seed ]; then
> +	log_test_skip "Kernel without CONFIG_IP_ROUTE_MULTIPATH."
> +	exit "${EXIT_STATUS}"
> +fi

[Severity: Low]
Should tools/testing/selftests/net/config be updated for this test?
fib_multipath_hash_seed only exists with CONFIG_IP_ROUTE_MULTIPATH.
That option depends on CONFIG_IP_ADVANCED_ROUTER, neither has a
default, and neither is in the net selftests config fragment.

On a kernel built from a minimal base plus that fragment, this test
would always SKIP.

CONFIG_IPV6_TUNNEL, which scenario 2 needs, is not listed explicitly
either. It only gets enabled because CONFIG_IPV6_GRE=m selects it.

> +
> +setup_topology || { log_test_skip "Setup failed."; exit "${EXIT_STATUS}"; }
> +trap cleanup EXIT

[Severity: Medium]
Can this leak ns_alpha, ns_beta and ns_gamma? setup_ns has already
created them by the time setup_topology() returns failure. The trap is
installed only after this exit, so cleanup_all_ns never runs and the
namespaces and any veths stay on the host.

setup_topology() can fail after setup_ns through the veth "|| return 1"
paths. Its exit status is also that of its last command:

	tc -n "$ns_alpha" filter add dev veth0 ingress pref 1 \
                protocol ipv6 flower skip_hw ip_proto icmpv6 type 1 action drop

That command fails on a kernel without cls_flower or act_gact.
setup_ns only cleans up when ip netns add itself fails, and lib.sh
does not install an EXIT trap.

As a side effect, a missing flower is reported as "Setup failed.", and
the later "Cannot install tc flower measurement filters" skip is never
reached for that cause.

Would installing the trap before calling setup_topology() fix this?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261028-ipv6_ioam_ecmp-v1-0-9b6715b6f4c0%40kylinos.cn
