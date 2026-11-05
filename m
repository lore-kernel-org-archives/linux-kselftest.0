Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881358;
	b=IL0AlQPpMGiLro0NghOc8f0Ikde7kr0AJ8hUzI7infpP7VThxuLbM4/Oz1NuHHrncTtf
	 MupMHxHQ1TeZpWC3mIIG7Ox6oxQ26/T1F3xzdr6+FPsTiBCQoP4xp0HfGwbcxC0DpRQ18
	 pZ6GdxQJF4dbPrqZGNVwzZm1iefzcPqGWiEzQiN8f+66kJbi2LaV6w4PEW6fx7a/8gK1c
	 NQg4CKvCgP9QCIn2eGuz3YjodL2fgJgu1jSdFINmnfcJZAoqHJukKOVNufiieGp41LtCg
	 aaHdDB/NKudw3q9S/BXPz/CoYjmz0fzm6qGYmjqvgpsKilwjPpG0XReWIOCJ55UOq2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881358;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1EU7UaZlGv3MYPyW1OJGQPqiReGZO/NDUPkcBrKmkuM=;
	b=tY0WoYp/vk3Q7c5dSk2WolOq3aAYxZKXB6ljvi6Za4iHJajddCGmGWUQjO+cxrHJKxN6
	 C9rdqT9evv9IB3NXihtsMEWgurPzaHRY5nNcovsjlLQpSnKntyN7LT4hTuJASIhpYR7GI
	 j6Sm7HtKIXYb1EsExP4jevEpH01vgXBOz7gtGWIiAZsSkyhDtylqfn2Dti4us6XWzhFpC
	 Ap0ylcXxz+LJJMyDRuO/VZI//Eq60xRGPA8GwpYV7Oy45M07yHLGuYqkjWAK9Vx9YoQqi
	 3+dNhWQrYNn4x4CzhIV4eX3hs97WvrMhv6go7UM6yrbCC37q06Zs5eJmI3i8TFWD+LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="g2Mz9/0T";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E0A606D80C;
	Thu,  5 Nov 2026 12:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g2Mz9/0T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E201F00A02;
	Thu,  5 Nov 2026 12:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881357;
	bh=1EU7UaZlGv3MYPyW1OJGQPqiReGZO/NDUPkcBrKmkuM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=g2Mz9/0TtXe1zBF1uxpxNKmwbjIeT+8WUB/2nmEDfPQlSFa1bmX01qkd3cgKoR/d6
	 SPOvmUbAqHy5Y/k0uaujNjJHfK7+RtTKf1rtRNBRUpR/Day9UZM+5bB6KEhR3+sgGN
	 b5/SbL2sDtPHSHFqedyrmAGkL7vXBrIPtIVBBL0EJHnCj47hV7xvpO2VN3vZlfZu5m
	 9rSy83XyBMpv4K+6IuVLRfi2PLv1nerSo21Uc6gAnxRWd/7t3MLCMjc/4SLp2ntV4V
	 3uMRtqKY4R/KWSmAElM1hzHUIEs/GMU08+nlT/INtP7JErxq3uoY9mI/XNyVGrmT0r
	 ofeIJoU7xbAwA==
Subject:
 Re: [PATCH net v2 3/3] selftests: net: add ioam6 ECMP test (RFC 9486 C2)
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 justin.iurman@gmail.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 liuhangbin@kylinos.cn
Date: Thu, 05 Nov 2026 12:22:36 +0000
Message-ID: <179388135633.488856.7838660673411502138@kernel.org>
In-Reply-To: <20261103-ipv6_ioam_ecmp-v2-3-6ef0318bdb5e@kylinos.cn>
References: <20261103-ipv6_ioam_ecmp-v2-3-6ef0318bdb5e@kylinos.cn>
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

- [Medium] check_tunnel() (lines 276-281) decides whether ip6_tunnel is
  available from two checks: `lsmod | grep ip6_tunnel`, and `ip a | grep…
- [Low] The header of tools/testing/selftests/net/ioam6_ecmp.sh (lines
  8-9) says there are "Two scenarios, matching the two places where IOAM…
- [Low] The header (line 44) says "The filters match the exact
  measurement packets".

--

selftests: net: add ioam6 ECMP test (RFC 9486 C2)

This adds ioam6_ecmp.sh. Under hash policy 0, it checks that a packet
carrying IOAM options takes the same ECMP nexthop as the same packet
without them. It covers transit input hashing after inline IOAM
insertion, and the re-lookup on a node that encapsulates with IOAM over a
multipath route, with a plain ip6ip6 tunnel as the baseline.

> diff --git a/tools/testing/selftests/net/ioam6_ecmp.sh b/tools/testing/selftests/net/ioam6_ecmp.sh
> new file mode 100755
> index 0000000000000..35a11f94c4223
> --- /dev/null
> +++ b/tools/testing/selftests/net/ioam6_ecmp.sh
> @@ -0,0 +1,348 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# Verify RFC 9486 C2 for ECMP: with hash policy 0 (the default), the ECMP
> +# nexthop chosen for a packet carrying IOAM options must be the same as for
> +# the identical packet without them.
> +#
> +# Two scenarios, matching the two places where IOAM changed the hashed
> +# IPv6 nexthdr:

[Severity: Low]
Is "the two places" accurate here? The series patch "ipv6: ioam6: use
transformed packet nexthdr for ECMP re-lookup" changes a third place too:
the inline path (and the AUTO path with !skb->dev) of ioam6_output() on
the node that inserts the IOAM option.

net/ipv6/ioam6_iptunnel.c:ioam6_output() {
    ...
		if (ilwt->mode == IOAM6_IPTUNNEL_MODE_INLINE ||
		    (ilwt->mode == IOAM6_IPTUNNEL_MODE_AUTO && !skb->dev)) {
			dst = orig_dst;
    ...
}

Before that change, a dst cache miss re-ran ip6_route_output() with
fl6.flowi6_proto = hdr->nexthdr. After inline insertion that is
NEXTHDR_HOP, so the inserting node itself could pick a different ECMP
sibling.

In this test the inserting node is alpha (set_alpha_ioam()). Alpha only
gets single-path routes from setup_topology():

	ip -netns "$ns_alpha" -6 route add 2001:db8:2:1::/64 \
		via 2001:db8:1::1 dev veth0

Wouldn't this test still pass if the orig_dst reuse branch regressed?
Could a scenario with an ECMP route on the inserting node be added? If
not, could the comment be reworded so it doesn't suggest every affected
place is covered?

[ ... ]

> +check_tunnel()
> +{
> +	if ! lsmod 2>/dev/null | grep -q "ip6_tunnel" && \
> +		! ip a 2>/dev/null | grep -q "ip6tnl0"; then
> +		modprobe ip6_tunnel &>/dev/null
> +		lsmod 2>/dev/null | grep -q "ip6_tunnel" || \
> +			ip a 2>/dev/null | grep -q "ip6tnl0" || return 1

[Severity: Medium]
Can this heuristic skip scenario 2 even when ip6ip6 tunnels work?

With CONFIG_IPV6_TUNNEL=y, ip6_tunnel never appears in lsmod.

The ip6tnl0 fallback device is also missing from the runner's netns in
two cases: net.core.fb_tunnels_only_for_init_net=2, or the sysctl is 1
and the runner is not in init_net.

include/linux/netdevice.h:net_has_fallback_tunnels() {
    ...
	return !fb_tunnels_only_for_init_net ||
		(net_eq(net, &init_net) && fb_tunnels_only_for_init_net == 1);
    ...
}

In that setup modprobe ip6_tunnel does nothing and both greps fail again.
check_tunnel() then returns 1 before it reaches the ip link add probe
below, which would work (and would also autoload a modular ip6_tunnel).

Main then calls log_test_skip() for scenario 2. ksft_exit_status_merge()
ranks skip above pass, so the whole test exits with SKIP even after
scenario 1 passed.

Could check_tunnel() rely on the ip link add probe instead?

> +		ip6tnl_loaded=1
> +	fi
> +
> +	ip -netns "$ns_beta" link add name ip6tun0 type ip6tnl \
> +		mode ip6ip6 encaplimit none \
> +		local 2001:db8:2:1::1 remote 2001:db8:2:1::2 \
> +		2>/dev/null || return 1
> +	set_beta_ioam_encap || return 1
> +}

[ ... ]

> +if check_tunnel; then
> +	# Scenario 2 counts the outer ip6ip6 packets: the echo request is
> +	# not visible to flower (outer headers only), so match the pinned
> +	# tunnel addresses instead. No need to check return value again as
> +	# we have done it at scenario 1
> +	set_measure_filters "src_ip 2001:db8:2:1::1 dst_ip 2001:db8:2:1::2"

[Severity: Low]
The header comment says "The filters match the exact measurement
packets". Does this filter match only the ip6ip6 packets, though?

It matches any IPv6 packet from beta's veth1 address to gamma's veth0
address. Beta's unicast NUD probes use that same pair, because
ndisc_solicit() takes the source address from the queued skb:

net/ipv6/ndisc.c:ndisc_solicit() {
    ...
	if (skb && ipv6_chk_addr_and_flags(dev_net(dev), &ipv6_hdr(skb)->saddr,
					   dev, false, 1,
					   IFA_F_TENTATIVE|IFA_F_OPTIMISTIC))
		saddr = &ipv6_hdr(skb)->saddr;
    ...
		ndisc_send_ns(dev, target, target, saddr, 0);
    ...
}

Beta's Neighbor Advertisements to gamma also match. Gamma sends
solicitations when it has traffic for 2001:db8:2:1::1, for example
ICMPv6 errors for ip6ip6 packets it cannot decapsulate.

These packets add to the veth0 count in measure_link():

	if [ $((da + db)) -lt "$PKTS" ]; then
		echo "LOST:$da:$db"

With PKTS=3, two tunnel packets plus one ND packet already reach the
threshold, so a lost tunnel packet goes unreported. The stray packets
also count in the A/B majority vote.

Could the filter also match the encapsulated protocol, or otherwise
exclude ICMPv6/ND, so it is as exact as the comment says?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261103-ipv6_ioam_ecmp-v2-0-6ef0318bdb5e%40kylinos.cn
