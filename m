Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921274;
	b=WFuy9YqV1YSr+4M3Vq/LXKoQBCn0yhfBzly+IIcCNHva+STHM0+y0Gi5KcBAiOgIgMYE
	 zYQeqAZA+qkqnrA9B2b7dL26GPnqoA4Rak7EdQiuibX7sa7J5matx5hoemXqYWQbdCRp8
	 +4BcglERJjqBYZCpTPMi4Xcww4sJO1q6pMMMgF3d5YSIwNNPXDyw+OwC+oQ/e99kORrit
	 wWju/Imjw5k+IWxFJLguOgLCAtfB9Mh5hyVDvd4NHRqUzb8d5gk81OPzVU2B3jYJMeAhN
	 itu104pYspIYKjT/drB0wxb8vOYUU1QzMYJuFq69foiEBkY76acG0Cw1yxBGwvoFTZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921274;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3uWPkHRwz6uNDJDqOMybgJpEYIBF/Ondl07GR8Rfzcs=;
	b=plPTLIivaML8bzO3HAlm8FCufCkm29VxK151OeHUlPYcnCLTFnD/ABtanKPVn/POnqBk
	 J0Xt6aH3QCQGskeZ0vBJKzqZOvIePzh+dmF6MNCv50pjN24x80mlUF71Lt84V/V7bzO0y
	 34tzoI+MmUixHwFNel3Lks6GGB/oefL3tT+Cex76wDoAq2lsvN6tBrRlQzGizGeAuzUZ5
	 MxYclqlcLeqgJ0F9+fjL1Rwu/jNEybwlWmOARj9BHTtOkBEOkA7LM7m5CX04prwfJ/S01
	 kbPQPfVBS6FAaolF8iZQhCjjoIR9ClhST900lEHsx6vSev367PZJ2twBO844PT4G2Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eiLkhsPf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B8D606A335;
	Tue, 17 Nov 2026 13:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eiLkhsPf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7481F000C5;
	Tue, 17 Nov 2026 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921274;
	bh=3uWPkHRwz6uNDJDqOMybgJpEYIBF/Ondl07GR8Rfzcs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eiLkhsPfv11SnCvs7X2ZrRqK6hhe1sK3pBnmfFVgUNciYD4HYffn8mIcquTDZ0f5v
	 a1MsZWBat/61IxDvpGvKiIMHuESTcnxeiWKxy1t/3kZLvRiq2Qe+vSLzbXb7qlct8R
	 4IsgP77RwaKEJ2jaQhEtSF56g39P10o9xmWwW7VPEbC8WPCmCmh9/Z1nQNj4+CZYNo
	 DyOx2V0wDsyhaIrhVsofqI79tgFPsjjVFsmxiSTHydxuDb9BKvczWjVImjsNoqwaXU
	 WXrqNKNKPCPiPBk5URGquRVmp3YWc43BS7FISAlkvRCzycc/XOlGvdYZ+L2PKtiMBZ
	 uP0bj2CD9mbQw==
Subject: Re: [PATCH net-next v3 2/3] ipv6: Cache pmtu for all paths of a
 multipath route
From: netdev-bot+sashiko@kernel.org
To: deliran@verdict.gg
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Tue, 17 Nov 2026 13:14:33 +0000
Message-ID: <179492127339.3136.11891469572330385935@kernel.org>
In-Reply-To: <20261113122237.88990-3-deliran@verdict.gg>
References: <20261113122237.88990-3-deliran@verdict.gg>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch removes the early `if (mtu >= dst6_mtu(dst))
  return;` from __ip6_rt_update_pmtu() (net/ipv6/route.c).
- [Medium] The new legacy-sibling walk in __ip6_rt_update_pmtu() can
  create a PMTU exception on a fib6_info that fib6_add_rt2node() has put…
- [Medium] One unauthenticated ICMPv6 Packet Too Big now costs up to N
  exception allocations and inserts, where N is the number of paths of…
- [Medium] ipv6: blackhole bypass in __ip6_rt_update_pmtu() on nexthop
  replace
- [Low] rt6_nh_update_pmtu() checks for an existing exception with
  rt6_find_cached_rt() under RCU only.

--

ipv6: Cache pmtu for all paths of a multipath route

With this patch, __ip6_rt_update_pmtu() caches a PMTU exception on every
path of a multipath IPv6 route. It walks all fib6_nh of a nexthop object,
or all siblings of a legacy multipath route. The mtu >= dst6_mtu(dst)
check moves from the looked-up dst into each path, and an existing
exception is lowered in place, mirroring commit 7d3f3b4367f3 for IPv4.

Link: https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 04098cf32eabe..ccb11a4655287 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -2911,12 +2911,55 @@ static bool rt6_cache_allowed_for_pmtu(const struct rt6_info *rt)

[ ... ]

> +static int rt6_nh_update_pmtu(struct fib6_nh *nh, void *_arg)
> +{
> +	struct rt6_pmtu_arg *arg = _arg;
> +	struct fib6_result *res = &arg->res;
> +	struct rt6_info *rt;
> +
> +	res->nh = nh;
> +	rt = rt6_find_cached_rt(res, arg->daddr, arg->saddr);
> +	if (rt) {
> +		if (arg->mtu < dst6_mtu(&rt->dst)) {
> +			rt6_do_update_pmtu(rt, arg->mtu);
> +			fib6_nh_update_exception(nh, res->f6i->fib6_src.plen,
> +						 rt);
> +		}
> +		return 0;
> +	}
> +
> +	if (arg->mtu >= fib6_mtu(res))
> +		return 0;
> +
> +	rt = ip6_rt_cache_alloc(res, arg->daddr, arg->saddr);
> +	if (rt) {
> +		rt6_do_update_pmtu(rt, arg->mtu);
> +		if (rt6_insert_exception(rt, res))
> +			dst_release_immediate(&rt->dst);
> +	}

[Severity: Low]
Does the "never raising what the path uses for daddr" guarantee in the
comment above rt6_nh_update_pmtu() still hold when two CPUs race here?

The rt6_find_cached_rt() check runs under RCU only. On a miss,
rt6_insert_exception() takes rt6_exception_lock and replaces any
exception it finds for the same key:

net/ipv6/route.c:rt6_insert_exception() {
    ...
	rt6_ex = __rt6_find_exception_spinlock(&bucket, &nrt->rt6i_dst.addr,
					       src_key);
	if (rt6_ex)
		rt6_remove_exception(bucket, rt6_ex);
    ...
}

Under the lock, the new mtu is only compared with fib6_mtu(res). It is
not compared with the mtu or gateway of the exception being replaced.

Suppose two Packet Too Bigs for the same daddr (say 1300 and 1400) are
handled on different CPUs and both miss in rt6_find_cached_rt(). Could
the later 1400 insert replace the 1300 exception and raise the path's
pmtu again?

The same question applies if rt6_do_redirect() inserts a redirect
exception between the lookup and the insert. Would the redirect gateway
be lost then?

The old code had the same find-then-replace window, but only on the
looked-up path. With the walk, two PTBs for different flows to the same
daddr now race on every sibling.

Would re-checking for an existing exception under rt6_exception_lock,
and lowering it in place, make the guarantee in the commit message hold?

> +
> +	return 0;
> +}

[ ... ]

> @@ -2939,55 +2982,55 @@ static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
>  
>  	if (mtu < IPV6_MIN_MTU)
>  		return;
> -	if (mtu >= dst6_mtu(dst))
> -		return;

[Severity: Medium]
Does dropping this early return affect callers other than
ip6_update_pmtu()?

__ip6_rt_update_pmtu() is dst_ops->update_pmtu for every IPv6 dst.
Several tunnel xmit paths call it on every packet, with an mtu equal to
or above the inner dst's mtu. One example is tnl_update_pmtu() in
net/ipv4/ip_tunnel.c when DF is not set:

		mtu = skb_valid_dst(skb) ? dst_mtu(skb_dst(skb)) : dev->mtu;
	}

	if (skb_valid_dst(skb))
		skb_dst_update_pmtu_no_confirm(skb, mtu);

ip6_tnl_xmit() in net/ipv6/ip6_tunnel.c always calls
skb_dst_update_pmtu_no_confirm() with the outer mtu minus overhead, which
normally equals the ip6tnl device mtu. ipip6_tunnel_xmit() in
net/ipv6/sit.c does the same when DF is set.

Before this patch these calls returned here. Now every such packet takes
rcu_read_lock() and walks every fib6_nh of the inner route, running
rt6_find_cached_rt() and fib6_mtu() on each path.

Take an inner route that is multipath with a wider sibling, for example
ECMP over a GRE/sit/ip6tnl leg at 1476/1480/1452 and a native 1500 byte
leg. On the wide leg, rt6_nh_update_pmtu() sees arg->mtu < fib6_mtu(res).

Would that create an RTF_CACHE exception on the wide leg with the
tunnel's own mtu, for every new inner daddr, without any Packet Too Big
being received? Each insert also runs fib6_update_sernum() and
fib6_force_start_gc().

Nothing is cached on the tunnel leg, since its mtu is equal rather than
lower. The skb dst stays the pcpu route, so the walk repeats on every
packet.

In the ip6_tnl_xmit() case where the skb dst is an RTF_CACHE exception
narrower than the tunnel mtu (mtu > dst mtu), wouldn't the larger tunnel
mtu also be copied onto the wider siblings?

IPv4 also continues on an equal mtu, since its gate is old_mtu < mtu.
But it caches on its own path and returns early on rt->rt_pmtu == mtu,
so the repeated per-packet walk looks specific to IPv6. The caller in
nf_flow_table_ip.c is not affected, because skb_scrub_packet() drops the
dst first.

The commit message explains moving the check per path by the PTB lookup
landing on the wrong path. For these local callers the dst is already
the flow's own path. Was the change in behaviour for them intended?

>  
> -	if (!rt6_cache_allowed_for_pmtu(rt6)) {
> +	rcu_read_lock();

[ ... ]

> +	/* The lookup in ip6_update_pmtu() doesn't hash on the protocol and
> +	 * ports, dst may be another path than the too big packet took:
> +	 * cache the pmtu on every path it lowers.
> +	 */
> +	if (f6i->nh) {
> +		nexthop_for_each_fib6_nh(f6i->nh, rt6_nh_update_pmtu, &arg);
> +		goto out;
> +	}

[Severity: Medium]
Can this walk insert a usable exception into the fib6_nh of a
blackhole nexthop?

For a route using a nexthop object, the blackhole state lives in
nhi->reject_nh, not in the fib6_info. f6i->fib6_flags has no
RTF_REJECT, and f6i->fib6_type is RTN_UNICAST. The route lookup only
puts RTF_REJECT and RTN_BLACKHOLE into the fib6_result when it sees
nexthop_is_blackhole(). Here, arg.res.fib6_flags and
arg.res.fib6_type are copied straight from f6i, and f6i->nh is walked
without that check.

Suppose replace_nexthop() swaps the nh_info under f6i->nh to a
blackhole one after ip6_update_pmtu() looked up its dst, but before
this walk. The walk then reaches the blackhole fib6_nh, whose
fib_nh_dev is loopback_dev.

rt6_find_cached_rt() misses, and arg->mtu is below fib6_mtu() for
loopback_dev, so ip6_rt_cache_alloc() is called. Without RTF_REJECT
in res->fib6_flags, ip6_rt_init_dst() sets up a normal unicast dst on
loopback_dev. It has error 0, output ip6_output and input
ip6_forward. rt6_insert_exception() then adds it to the blackhole
fib6_nh's exception bucket.

ip6_pol_route() checks the exception table before the reject dst is
ever built:

net/ipv6/route.c:ip6_pol_route() {
    ...
	rt = rt6_find_cached_rt(&res, &fl6->daddr, &fl6->saddr);
	if (rt) {
		goto out;
    ...
}

So lookups for that daddr bypass the blackhole. Packets go out
loopback_dev, come back in and are forwarded to loopback_dev again
until hop_limit runs out. This lasts for ip6_rt_mtu_expires.

The old code did not reach this. fib6_nh_find_match() matched on the
dst's device and rt6i_gateway. A blackhole fib6_nh on loopback_dev
without a gateway never matches, so nothing was inserted.

Triggering this needs CAP_NET_ADMIN to replace a nexthop, used
directly or in a single path group, with a blackhole. This has to
happen while PMTU discovery is running on the route. The window is
small, but the exception outlives it.

Would returning early when nexthop_is_blackhole(f6i->nh) be enough
here? Or should arg.res.fib6_flags and arg.res.fib6_type be set the
same way the lookup sets them for a blackhole nexthop?

[Severity: Medium]
Can one unauthenticated Packet Too Big now cost up to N exception
allocations and inserts instead of at most one, where N is the number
of paths of the route?

icmpv6_err() calls ip6_update_pmtu() for every ICMPV6_PKT_TOOBIG that
carries an inner ICMPv6 header, without a socket lookup:

	if (type == ICMPV6_PKT_TOOBIG)
		ip6_update_pmtu(skb, net, info, skb->dev->ifindex, 0, sock_net_uid(net, NULL));

ip6_update_pmtu() routes on the inner daddr, saddr and flowlabel, which
the sender chooses. That means any multipath route, such as an ECMP
default route, can be targeted.

With the mtu >= dst6_mtu(dst) return gone, every path whose fib6_mtu()
is above the advertised mtu (which can be just over 1280) goes through:

icmpv6_err()->ip6_update_pmtu()->__ip6_rt_update_pmtu()
  ->rt6_nh_update_pmtu()
    ->ip6_rt_cache_alloc()
    ->rt6_insert_exception()
        global rt6_exception_lock, GFP_ATOMIC allocation,
        possible eviction of the oldest entry
        on success: tb6_lock, fib6_update_sernum(),
        fib6_force_start_gc()

With random inner daddrs, each PTB does N such inserts in softirq
context, all serialized on one global spinlock. Each sernum bump also
invalidates cached dsts on that fib6_node. Memory stays bounded by the
per-bucket max depth, but CPU work and lock hold time per received
packet grow with N.

IPv4 accepted the same trade-off in commit 7d3f3b4367f3. Lowering the
pmtu on other paths was already possible by choosing flowlabels, so
what's new is the per-packet amplification. The IPv6 version also does a
sernum bump and a GC kick on every insert.

Could the commit message mention this cost?

[ ... ]

> +	/* fib6_del_route() zeroes fib6_nsiblings before unlinking f6i, stop
> +	 * then as the walk would never get back to its head.
> +	 */
> +	list_for_each_entry_rcu(sibling, &f6i->fib6_siblings, fib6_siblings) {
> +		arg.res.f6i = sibling;
> +		arg.res.fib6_flags = sibling->fib6_flags;
> +		arg.res.fib6_type = sibling->fib6_type;
> +		rt6_nh_update_pmtu(sibling->fib6_nh, &arg);
> +		if (!READ_ONCE(f6i->fib6_nsiblings))
> +			break;
>  	}

[Severity: Medium]
Can this walk create an exception on a sibling that is in the ring but
not yet in the tree? If a FIB notifier then vetoes that route, the
exception would leak.

Only f6i->fib6_node is checked before the walk. fib6_add_rt2node() links
the new route into the sibling list before the notifiers run and before
rt->fib6_node is set:

net/ipv6/ip6_fib.c:fib6_add_rt2node() {
    ...
				list_add_tail_rcu(&rt->fib6_siblings,
						  &sibling->fib6_siblings);
    ...
			err = call_fib6_entry_notifiers(info->nl_net,
							fib_event, rt,
							extack);
			if (err) {
    ...
				WRITE_ONCE(rt->fib6_nsiblings, 0);
				list_del_rcu(&rt->fib6_siblings);
				rt6_multipath_rebalance(next_sibling);
				return err;
			}
    ...
		rcu_assign_pointer(rt->fib6_node, fn);
    ...
}

A PTB handled on another CPU can start from an in-tree sibling, reach rt
in the ring, and call rt6_nh_update_pmtu(rt->fib6_nh).

ip6_rt_cache_alloc() then takes a reference on rt with
fib6_info_hold_safe(). rt6_insert_exception() only checks
f6i->fib6_destroying, which is 0 here, so the exception is added to
rt->fib6_nh->rt6i_exception_bucket.

If the notifier then fails, the error path above only unlinks rt.
fib6_add() fails without calling fib6_purge_rt(), so the exceptions are
never flushed. fib6_add_gc_list() returns early for a route without a
fib6_node, so the exception never ages out either.

The only flush left is fib6_nh_release() from fib6_info_destroy_rcu().
That needs rt's refcount to reach zero, but the exception's
rt6_info->from holds a reference on rt.

Would this leak the fib6_info, the exception rt6_info and their netdev
references, so that unregistering the device waits forever?

Triggering this needs a CAP_NET_ADMIN append (RTM_NEWROUTE with
NLM_F_APPEND) that an in-kernel notifier rejects, for example netdevsim
limits or an offload driver. It also has to race with a Packet Too Big
for a destination the route covers.

The same lifetime hole already exists through
fib6_select_path()->rt6_make_pcpu_route(). The old PTB code, though, only
inserted on rt6->from, which came from a tree lookup.

Would skipping siblings with !rcu_access_pointer(sibling->fib6_node) in
this walk close the new case?

> +out:
> +	rcu_read_unlock();
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113122237.88990-1-deliran%40verdict.gg
