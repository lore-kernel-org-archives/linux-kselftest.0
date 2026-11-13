Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531645;
	b=FRQpbg10vYPTCrf9gwtjOW7dxY2tRJqIlCl3vlhZl2sUlLha4rh1iCTLL+NRPriSGHyp
	 Sw1NsTqv8ZXyqaZs07EEZyfz1FbpTrl0CCwXuG25MhwWHOwEr2pTgPAlKYGE1UGtRMgwf
	 IxhLrrnT3emCRei36mX7C3oEqsTTGTxdgs8grDsTRyz0pYC+DBdTdAe1IUQVP26uIB1km
	 wajuiMZLbwURmB2kfiIsvFuVyg614jo6MuGTyjvZ9zHJQ3E2mdhJDn9R4LOLbSj6+NV88
	 uT8pOkeThDfl7nFCsDxq+GajOFbVXrlyD5Xr1tSkSvADiC55qumG4pcXiigFK0s6SIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531645;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pXxsymViJFogLQk0KTMdCVrFbvQ7l8M4VK4ILt91MNY=;
	b=L9seuLuCHqGrMbZk9tl0RbiH1UDM85f368/vPO8WbiYRTpHPXcppJuS4EU7C/FTzukHi
	 D47dzYf6S3PCgLm4g3WQCKIXdCSQIxSV63HUpm/Bc9X5WutbYzmVXDIorpMQwS8hTp+1z
	 s9Qlwr8pwESWnNDR6xn/utii9mAItNvYRfhIotuT7O096jn/bbd05LxQYzzufo+y1qpW0
	 rj8TzCLSFo6xmv4wvFFMUO9BnArD9nSyFoE+frPwOAdr2Cko1kNNNYKy/Eta/rf1dKyBh
	 jS3IjPASZp82QRscblp5YMK5a2Tdchw+fKKkN3MGL7pS9DuAyhJudt7AuygKEj330Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="j//Ss3FG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4970606A33E;
	Fri, 13 Nov 2026 01:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j//Ss3FG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233981F000C9;
	Fri, 13 Nov 2026 01:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794531644;
	bh=pXxsymViJFogLQk0KTMdCVrFbvQ7l8M4VK4ILt91MNY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j//Ss3FGwbv7FLxhXlUTXk2XzIXxl6HDETPS9N2aLTgiyHa+VYOrsrz4IDO0sv18t
	 bfk2wcNuZm7xYqIZxxtn2sy4rqOzsZAZJ2VIsAmXhbJKspHH/shgmdOLV78ApN4atv
	 fa55rPceRJCUNQcoY5M/BjZ9Y82G9ObNDuH2MWyxF8alflSdtXNtGmq3xn5dbBpI+W
	 JE9gQ91VoYhKK6S7FMhVqIJpZiUAQf11yc8NqHv7ovZDvBqflwQMxs34YxdAy4J8GA
	 WlIX3kmX00n8tk7M9sno846wQ8SkuCNcQ7elp1dUM5ozoXwYy//HvtQz0NJfBQxBrS
	 ASeQMDMXue5Tw==
Subject: Re: [PATCH net-next v2 2/3] ipv6: Cache pmtu for all paths of a
 multipath route
From: netdev-bot+sashiko@kernel.org
To: deliran@verdict.gg
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 01:00:43 +0000
Message-ID: <179453164369.2199510.16511705782114077416@kernel.org>
In-Reply-To: <20261110095903.84813-3-deliran@verdict.gg>
References: <20261110095903.84813-3-deliran@verdict.gg>
X-sashiko-severity: High
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

Critical: 0 · High: 2 · Medium: 1 · Low: 1 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The in-place update branch of rt6_nh_update_pmtu() can raise
  another path's effective PMTU above that path's link MTU.
- [High] The fix does not close the blackhole it describes.
- [Medium] A passed-in RTF_CACHE dst is no longer updated when the daddr
  used by the walk is not that dst's exception key.
- [Low] No Fixes: tag, even though the commit message presents the change
  as a fix for a user-visible blackhole.

Pre-existing issues:
- [Low] Reported concern: rt6_nh_update_pmtu() reads and then writes an
  exception's RTAX_MTU under only rcu_read_lock().

--

ipv6: Cache pmtu for all paths of a multipath route

This patch changes __ip6_rt_update_pmtu() so that a Packet Too Big pmtu is
cached on every path of a multipath route. It walks every fib6_nh of a
nexthop object, or the fib6_siblings of a legacy multipath route. A path
that already has an exception for the destination is updated in place by
the new rt6_nh_update_pmtu() helper; a path without one gets a new
exception.

Link: https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/

> The flow then keeps sending too big packets on its path, every Packet
> Too Big lands on the same wrong path, and the flow blackholes.

[Severity: Low]
This isn't a bug, but the change is described as fixing a user-visible
blackhole. Should it carry a Fixes: tag?

The IPv4 counterpart, commit 7d3f3b4367f3 ("net: ipv4: Cache pmtu for all
packet paths if multipath enabled"), went through net-next without one.
So treating this as a behaviour extension rather than a stable fix may be
intentional.

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 04098cf32eabe..dc982400fbab2 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -2911,12 +2911,52 @@ static bool rt6_cache_allowed_for_pmtu(const struct rt6_info *rt)

[ ... ]

> +/* Cache a pmtu on one path of a route: update the exception the path already
> + * has for daddr, keeping its gateway and never raising its pmtu, or create one.
> + */
> +static int rt6_nh_update_pmtu(struct fib6_nh *nh, void *_arg)
> +{
> +	struct rt6_pmtu_arg *arg = _arg;
> +	struct fib6_result *res = &arg->res;
> +	struct rt6_info *rt;
> +
> +	res->nh = nh;
> +	rt = rt6_find_cached_rt(res, arg->daddr, arg->saddr);
> +	if (rt) {
> +		u32 mtu = dst_metric_raw(&rt->dst, RTAX_MTU);
> +
> +		if (!mtu || arg->mtu < mtu) {
> +			rt6_do_update_pmtu(rt, arg->mtu);

[Severity: High]
Can this raise a path's effective pmtu above that path's own link MTU?

A redirect exception normally has a raw RTAX_MTU of 0, because
rt6_do_redirect()->ip6_rt_cache_alloc() inherits the route's metrics.
Raw 0 does not mean unlimited, though. ip6_dst_mtu_maybe_forward() falls
back to the device mtu6:

include/net/ip6_route.h:ip6_dst_mtu_maybe_forward() {
    ...
		mtu = dst_metric_raw(dst, RTAX_MTU);
		if (mtu)
			goto out;
    ...
		mtu = READ_ONCE(idev->cnf.mtu6);
    ...
}

The only upper bound on arg->mtu is this check in __ip6_rt_update_pmtu():

	if (mtu >= dst6_mtu(dst))
		return;

That check is made against the dst that was looked up, not against the
path being written here.

For example, path A is on a 9000 MTU device and path B is on a 1500 MTU
device, and B has a redirect exception for daddr. A Packet Too Big of 8000
that resolves to A passes the check, and the walk then sets RTAX_MTU to
8000 on B's exception. ip6_mtu() for B now returns 8000, so frames larger
than B's device MTU are dropped until ip6_rt_mtu_expires.

The create branch is protected by rt6_insert_exception():

	if (dst_metric_raw(&nrt->dst, RTAX_MTU) >= fib6_mtu(res)) {
		err = -EINVAL;
		goto out;
	}

The in-place branch has no equivalent check. This also seems to
contradict "its pmtu never goes up" in the commit message and in the
comment above.

Does this branch also need a bound such as arg->mtu < fib6_mtu(res)?

[Severity: Low]
This is a pre-existing issue, but the read of RTAX_MTU and the
rt6_do_update_pmtu() call here run under rcu_read_lock() only.

Two concurrent Packet Too Big messages (say 1300 and 1400) could leave
1400 behind. The update could also race with rt6_exceptions_update_pmtu(),
which holds rt6_exception_lock.

The old __ip6_rt_update_pmtu() already did the same unlocked
compare-then-set on RTF_CACHE dsts. A value left too high would also be
lowered by the next Packet Too Big, so the impact looks limited to one
extra round trip.

> +			fib6_nh_update_exception(nh, res->f6i->fib6_src.plen, rt);
> +		}
> +		return 0;
> +	}

[ ... ]

> @@ -2942,52 +2982,52 @@ static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
>  	if (mtu >= dst6_mtu(dst))
>  		return;

[Severity: High]
Does this early return still allow the blackhole the commit message
describes?

Here dst is whatever ip6_update_pmtu() found with a lookup that has no
protocol or ports. It can be path B while the flow is on path A. B may
have a lower MTU than the Packet Too Big value. That happens with a
smaller device MTU, a route mtu metric, or lwtunnel headroom. It also
happens when B has an exception that A lacks, for example because:

- A's GFP_ATOMIC insertion failed
- rt6_exception_remove_oldest() evicted A's entry
- a later redirect replaced A's exception
- A was added to the group afterwards

In any of these cases the function returns before the walk, and A never
gets an exception.

The flow-less hash depends only on saddr, daddr, flowlabel and proto 0.
Every later Packet Too Big for that flow therefore lands on B as well.

For example, A is Ethernet at 1500 and B is PPPoE at 1492. A UDP or tunnel
flow on A gets a Packet Too Big of 1496. The lookup returns B, 1496 >= 1492
is true, and nothing is cached on A.

This check predates the patch and mirrors the IPv4 old_mtu < mtu check.
However, the commit message says this patch fixes the case where "every
Packet Too Big lands on the same wrong path, and the flow blackholes".

Could the check be moved into rt6_nh_update_pmtu(), bounded against each
path's MTU, so the update is skipped only when no path would be lowered?

>  
> -	if (!rt6_cache_allowed_for_pmtu(rt6)) {
> -		rt6_do_update_pmtu(rt6, mtu);
> -		/* update rt6_ex->stamp for cache */
> -		if (rt6->rt6i_flags & RTF_CACHE)
> -			rt6_update_exception_stamp_rt(rt6);
> -	} else if (daddr) {

[ ... ]

> +	rcu_read_lock();
> +	f6i = rcu_dereference(rt6->from);
> +	/* fib6_del_route() and a NLM_F_REPLACE clear fib6_node before the
> +	 * route and its siblings are released, don't walk them then.
> +	 */
> +	if (!daddr || !f6i || !rcu_access_pointer(f6i->fib6_node)) {
> +		if (!rt6_cache_allowed_for_pmtu(rt6)) {
> +			rt6_do_update_pmtu(rt6, mtu);
> +			/* update rt6_ex->stamp for cache */
> +			if (rt6->rt6i_flags & RTF_CACHE)
> +				rt6_update_exception_stamp_rt(rt6);
> +		}
> +		goto out;
> +	}

[Severity: Medium]
What happens to a passed-in RTF_CACHE dst whose exception key is not
daddr?

Before this patch, any RTF_CACHE dst was lowered directly. Now, when
daddr, rt6->from and fib6_node are all set, the dst itself is updated only
if rt6_find_cached_rt(res, daddr, saddr) happens to return it.

Take a TCP socket with a routing header (IPV6_RTHDR or SRH).
inet6_csk_route_socket() looks up the first hop after fl6_update_dst(), so
dst can be a first-hop RTF_CACHE exception, for example one created by a
redirect. The call chain is then:

tcp_v6_mtu_reduced()
  inet6_csk_update_pmtu()
    dst->ops->update_pmtu(dst, sk, NULL, mtu, true)
      __ip6_rt_update_pmtu()    /* daddr = &sk->sk_v6_daddr */

The walk looks up the final destination and finds nothing. It then
inserts an unrelated exception, keyed by that destination, on the
first-hop route, and leaves the first-hop exception's MTU unchanged.

The second inet6_csk_route_socket() call in inet6_csk_update_pmtu()
returns the same exception with the old MTU. The icsk_pmtu_cookie >
dst_mtu(dst) test is then false, so the MSS is never reduced.

The same gap applies to the FLOWI_FLAG_KNOWN_NH clones from
ip6_pol_route(). rt6_uncached_list_add() puts them on the uncached list,
and they are never in an exception bucket.

The commit message says "that also covers a dst that is itself a cached
exception, which used to be updated alone". Is that only true when daddr
matches the exception's key?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110095903.84813-1-deliran%40verdict.gg
