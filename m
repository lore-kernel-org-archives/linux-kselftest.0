Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804957;
	b=hnhiu1KPBJx5AzPBBIHEBFub4HCYXDyQhDobQEOCcCO1DUsNk1sC+x4mvvdiCUPSgHXs
	 bytgIKzGlaM22tDzH8wCOgHh0EM9Z0oLZ607Wdrbl426ekEffVe+sajl1Ygsf9iJaCYpj
	 iZslmYgg0FFWBYyO5RnYC0ojgzrHMTGwNN1VEHq1hSiWOtRTMuVDHxeJzUBlw6NOGyOSG
	 ApaFA5bYhw8p5EkwiGPjwTFY2kOW/3g7IfQhmBsR6suM0CwlrfgLzuTVbMXHS6cwIkX3c
	 x6k8OUyOh59ewtASYZwR9a/a8bB4xo2U0st/0cGCeLdGKGHXRyQO1HwJD6TUBU9JsRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804957;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1E04WpE/uHSxRFpGuSOUxK7Io7ppqVPoRkDHsReaGXs=;
	b=ZTbXqaKvHtf66GDPd71JqdgmG86ju3LUfVY/mrA5laxwSc/6/0iU5FOvpzNTfRhWNgFL
	 i7gii/Dz61a0EjO1F40q32fUNiNrlEp0rFzrdN2h+0u9d9Zg0kmOfIN1FUqm61Jukp+MC
	 qLOCRtI6U9l6pAtcfb7lkL2lzTDAeITJUos1BZ4yOWtO5Zn/IBZE1pAGW5PN6beyvHndr
	 JqhPqU39rrmPZ3av2WkhTZf4iBlO2dFZUvdO6Fq4d+jDJjMtDD45UNVXh3BMy1urE8QoM
	 P/SX8tyf9QJNp5tyLkxcnLq/lpa+Imq40sdR8zxRqmQQ99RqY/bnwzXsgmEJQk6YGAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fsxVusuJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C4C606A332;
	Mon, 16 Nov 2026 04:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fsxVusuJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF971F000C5;
	Mon, 16 Nov 2026 04:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794804956;
	bh=1E04WpE/uHSxRFpGuSOUxK7Io7ppqVPoRkDHsReaGXs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fsxVusuJAnDIRSAWmE2T4380ELuBpZ6n2i3q3e5VCRXR2xeC0nlIIG2BJQVbp55jO
	 WEMFKAGOohdy76MrMSqKZbvWm7LDCLDJUeJM6dwXTYrGEgQSL952WOK2NBDZkfYIgN
	 E+7Djv6erIhv733nXijvNXT1zYJFCexju/3thGEjjzSbWMRXFwNprukI84GdVoC+YK
	 H7IgCBxOAbBl8+krom+j1dtVlHbLiqS3HhYjGvdAcZroEEoLMFw7at8OHwl2YI+38y
	 x8DfNdH96TJIqcNDCfmP2S4kG2KmNUaIlPD6Zll9EM0fbrQevsZDvX2PkTwEDhyYoP
	 Cuv5D4D0nfYhA==
Subject: Re: [PATCH net v5 2/2] selftests: net: add a test for vxlan snooping
 moving a MAC
From: netdev-bot+sashiko@kernel.org
To: ilskdw@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 kuniyu@google.com, mschiffer@universe-factory.net, nicolas.dichtel@6wind.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 16 Nov 2026 04:55:55 +0000
Message-ID: <179480495572.3136.4564700549616411928@kernel.org>
In-Reply-To: <20261115040609.61134-3-ilskdw@gmail.com>
References: <20261115040609.61134-3-ilskdw@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] ping_from_cpu0() in
  tools/testing/selftests/net/test_vxlan_snoop_move.sh always pins to…
- [Low] test_move_to_link_local() pins its pings to CPU 0.
- [Low] test_move_behind_router (line 48), test_move_to_link_local (line
  105) and test_same_remote_keeps_via (line 159) ignore the return value…

--

selftests: net: add a test for vxlan snooping moving a MAC

This adds test_vxlan_snoop_move.sh, with three cases for a learning VXLAN
device that snoops a known MAC. The first moves the MAC from an IPv4 remote
to one behind a router. The second moves it from a global IPv6 remote to a
link-local one. The third checks that a dynamic entry keeps its "via"
device. The first two cases pin their pings to CPU 0 because the route
cache is per CPU.

> diff --git a/tools/testing/selftests/net/test_vxlan_snoop_move.sh b/tools/testing/selftests/net/test_vxlan_snoop_move.sh
> new file mode 100755
> index 0000000000000..5b78310439d3a
> --- /dev/null
> +++ b/tools/testing/selftests/net/test_vxlan_snoop_move.sh
> @@ -0,0 +1,199 @@

[ ... ]

> +ping_from_cpu0()
> +{
> +	local ns=$1; shift
> +
> +	taskset -c 0 ip netns exec "$ns" ping -c 3 -W 1 -i 0.2 "$@" &> /dev/null
> +}

[Severity: Low]
What happens here when CPU 0 is not in the allowed CPU set? That can
happen under a cpuset cgroup that excludes CPU 0, or when CPU 0 is
offline.

In that case sched_setaffinity() fails with EINVAL, taskset exits non-zero
and ping never runs. That status goes straight to check_err in
test_move_behind_router() and test_move_to_link_local(). Both cases then
report "ping before the move failed" on a working kernel instead of
skipping.

The require_command taskset near the end of the script only checks that
the binary is installed. It doesn't check that CPU 0 is usable.

The pinning only needs one CPU to fill the per-CPU dst_cache and then hit
it. Could this pick any CPU from the current affinity mask, or skip when
CPU 0 can't be used? srv6_iptunnel_cache.sh hard-codes taskset -c 0 the
same way.

[ ... ]

> +test_move_behind_router()
> +{
> +	RET=0
> +
> +	setup_ns sw ex a r b
> +	defer cleanup_ns "$sw" "$ex" "$a" "$r" "$b"

[Severity: Low]
Should the return value of setup_ns be checked here?

In lib.sh, setup_ns() returns $ksft_skip when ip netns add fails. This
test keeps going anyway, so every later ip -n and bridge -n command fails.
The case then reports "ping before the move failed" instead of SKIP.

The setup_ns calls in test_move_to_link_local() and
test_same_remote_keeps_via() have the same problem. The second one reports
"ping from the remote failed".

Most net selftests don't check setup_ns either, though bareudp.sh,
fou_gre_gro.sh and nsh_gso.sh do. So this matches common practice, but the
result is still reported wrongly.

[ ... ]

> +test_move_to_link_local()
> +{

[ ... ]

> +	ip -n "$ex" addr add 2001:db8:1::1/64 dev e0 nodad
> +	ip -n "$ex" addr add fe80::1/64 dev e0 nodad
> +	ip -n "$a" addr add 2001:db8:1::2/64 dev a0 nodad
> +	ip -n "$b" addr add fe80::b/64 dev b0 nodad
> +
> +	ip -n "$ex" link add vx0 type vxlan id 42 dstport 4789 \
> +		local 2001:db8:1::1 learning
> +	bridge -n "$ex" fdb append 00:00:00:00:00:00 dev vx0 dst 2001:db8:1::2
> +	bridge -n "$ex" fdb append 00:00:00:00:00:00 dev vx0 dst fe80::b via e0

[ ... ]

> +	ping_from_cpu0 "$ex" 192.168.0.10
> +	check_err $? "ping before the move failed"
> +
> +	ip -n "$a" link set vx0 down
> +	ip -n "$b" link set vx0 up
> +	ip netns exec "$b" ping -c 1 -W 1 192.168.0.1 &> /dev/null
> +
> +	bridge -n "$ex" fdb show dev vx0 | grep -q "$MAC dst fe80::b via e0 "
> +	check_err $? "fdb entry did not move to the new remote and interface"
> +
> +	ping_from_cpu0 "$ex" 192.168.0.10
> +	check_err $? "ping after the move failed"

[Severity: Low]
Can this post-move ping tell a stale IPv6 dst_cache from a reset one?

The commit message says:

    The first two cases ping from CPU 0. The route cache is per CPU, and
    only the CPU that filled it hits the stale entry.

In this topology the old remote (2001:db8:1::2) and the new remote
(fe80::b) are both on-link through e0 in $ex. The pre-move ping fills
CPU 0's rdst->dst_cache with a non-gateway on-link route on e0. Nothing
changes the routes in $ex between the two pings.

udp_tunnel6_dst_lookup() returns the cached dst without checking oif or
daddr:

net/ipv6/ip6_udp_tunnel.c:udp_tunnel6_dst_lookup() {
    ...
		dst = dst_cache_get_ip6(dst_cache, saddr);
		if (dst)
			return dst;
    ...
}

On an on-link route the next hop is the packet's own daddr. So the stale
dst would deliver to fe80::b just as a fresh lookup would.

Suppose the dst_cache_reset(&rdst->dst_cache) call in vxlan_snoop() were
removed but the remote_ifindex update were kept. Wouldn't this case still
pass? It looks like only the "via e0" grep tests anything here, and the
CPU 0 pinning has no effect.

The IPv4 case still covers dst_cache_reset() itself. Would giving the old
and new IPv6 remotes different egress paths cover the IPv6 cache path? One
option is to put one of them behind a router, as in the first case.
Otherwise, could the commit message be reworded so it doesn't suggest the
second case covers stale routes?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115040609.61134-1-ilskdw%40gmail.com
