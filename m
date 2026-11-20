Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170752;
	b=yR2J2mVV8pi3ifevQUu9oO92LVFFV9SIiLl9g4oEKzrhVKbaTbI1OdFwR7VHXe5GSpzl
	 jSAhgLv3RvB6LIzKyqno799hJJ6n7jqhfD8kydJ8x8wbKEVDPkkYiakWzr9GnGHNPAQE2
	 K0QUSBpg12/XEs6BzTdf2rANhVMp+XMEDBsJ7GNe4wdDlLwbilViFFY0ZlxzU8/9dgqdE
	 W72H/jkhseft0bz7SCR388g4IKi+ravPjF0ZvsLimtvD65JFTA4ODbwpTWEw0v2m8NWXw
	 p829GP4EMwdjvt5hVXSAphO4ryi++eAjdBjOGuOhGasbzbRz1uZfM6Uq8AYK8HJzWLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170752;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=e6hDYPQhaY8CoMDDeLmCdNx7Wja3y+/nUyU+mS5UbXo=;
	b=XNl9V3l7SdldX0QlEzFs3W1z0kgGETJQY4cnEoi0noCf2QLDo6RyIkNXpLtpSakEOOhX
	 sS1qAkJQmAVfpTEiF+pVuDxQNjKkhlDSycEJywB6JO326YGrnr/zJBFg2Z0XBZoUznFPT
	 BBqGFnvoDErJtDl4FiITKdlKdp/w/V5OzIdjvt+QOjcGtZPqAaA3NshLcjOTB9GEgu/w+
	 TfHjLNeBKQd/QNpXTZnJ+ixGJpSIXvOxIgEF/HI1aY6hl7YCY6HuaCQSTP8GZ8m2j32FV
	 32wDmcP/REchxm3qHbkdyC2GzJgh44RrJXKagQ2vbtEIY51wNiQF8mr0cRKIHSc5gow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNIyLLyh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBC4606A337;
	Fri, 20 Nov 2026 10:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNIyLLyh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E391C1F000CF;
	Fri, 20 Nov 2026 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170751;
	bh=e6hDYPQhaY8CoMDDeLmCdNx7Wja3y+/nUyU+mS5UbXo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hNIyLLyheQ75viP3v0AcpR3vFZ039HFBJ21gZ14pKuiQFvvDi9F0JB1g2OuUXx3YA
	 B+7EFFschpESmsJTqrHjTzUTzgaq/rztImX2q88IwMLAqCzUnlKQELj4IQEOaJpXjY
	 3q0bWr8ssPPg2pO+YyM88rQxUYbx7e8EeyfZ/+6Rf5lWxFCb2egrHFvKJ5LXQlyxbj
	 3ejWhhtR9bakRay69ihAz3WkhEKMjt2hXEixBys7Xc7Vz2FQGlKoHEPtN1EnMjky1E
	 uJJWzS0RzcZxG/RML5BrhmTQ/6vbUxlVW9ByhekbrykgAd2aMG12HaF2a26bjHvduH
	 MZXhUDqKaXycw==
Subject: Re: [PATCH net-next v4 2/3] ipv6: Cache pmtu for all paths of a
 multipath route
From: netdev-bot+sashiko@kernel.org
To: deliran@verdict.gg
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 20 Nov 2026 10:32:30 +0000
Message-ID: <179517075051.3136.16687841105573859548@kernel.org>
In-Reply-To: <20261117193141.27004-3-deliran@verdict.gg>
References: <20261117193141.27004-3-deliran@verdict.gg>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In __ip6_rt_update_pmtu() (net/ipv6/route.c), the from_lookup
  branch is meant to skip a blackhole nexthop.

--

ipv6: Cache pmtu for all paths of a multipath route

This commit makes ip6_update_pmtu() cache a Packet Too Big pmtu on every
path of a multipath route, the same way commit 7d3f3b4367f3 does for IPv4.
It walks the fib6_nh entries of a nexthop object or the siblings of the
fib6_info, and it skips siblings that are not in the tree and nexthops
replaced by a blackhole.

Link: https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 04098cf32eabe..a835abc698d25 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c

[ ... ]

> @@ -2939,55 +2982,80 @@ static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,

[ ... ]

> -		res.fib6_flags = res.f6i->fib6_flags;
> -		res.fib6_type = res.f6i->fib6_type;
> +	arg.daddr = daddr;
> +	arg.saddr = saddr;
> +	arg.res.f6i = f6i;
> +	arg.res.fib6_flags = f6i->fib6_flags;
> +	arg.res.fib6_type = f6i->fib6_type;
>  
> -		if (res.f6i->nh) {
> -			struct fib6_nh_match_arg arg = {
> +	if (f6i->nh) {
> +		if (!from_lookup) {

[ ... ]

> +			if (match.match)
> +				rt6_nh_update_pmtu(match.match, &arg);
> +		} else if (!nexthop_is_blackhole(f6i->nh)) {
> +			/* A blackhole nexthop, swapped in by a replace since
> +			 * the lookup, must not get a usable exception.
> +			 */
> +			nexthop_for_each_fib6_nh(f6i->nh, rt6_nh_update_pmtu,
> +						 &arg);

[Severity: Medium]
Can a concurrent nexthop replace put a usable exception on a blackhole
fib6_nh here?

nexthop_is_blackhole() and nexthop_for_each_fib6_nh() each read
f6i->nh->nh_info (or nh_grp) separately, using rcu_dereference_rtnl().
replace_nexthop_single() in net/ipv4/nexthop.c holds only RTNL when it
swaps the pointers:

    rcu_assign_pointer(old->nh_info, newi);
    rcu_assign_pointer(new->nh_info, oldi);

Say "ip nexthop replace id N blackhole" runs between the two reads. The
check then sees the old non-reject nh_info. The walk then passes the
blackhole nh_info's fib6_nh to rt6_nh_update_pmtu().

That fib6_nh has fib_nh_dev set to loopback_dev, so fib6_mtu() returns the
mtu6 of lo. Any Packet Too Big mtu from IPV6_MIN_MTU up to that value gets
through.

ip6_rt_cache_alloc() builds the dst from arg.res.fib6_flags and
arg.res.fib6_type. Those were copied from f6i (RTN_UNICAST), not
RTF_REJECT/RTN_BLACKHOLE. rt6_insert_exception() has no reject_nh check,
so a usable dst on lo goes into the exception bucket of the blackhole
fib6_nh.

For a single nexthop replace, nh_rt_cache_flush() returns early:

net/ipv4/nexthop.c:nh_rt_cache_flush() {
    ...
	if (!replaced_nh->is_group)
		return;
    ...
}

So the exception is not flushed.

Later lookups take the blackhole branch of __find_rr_leaf():

	if (nexthop_is_blackhole(f6i->nh)) {
		res->fib6_flags = RTF_REJECT;
		res->fib6_type = RTN_BLACKHOLE;
		res->f6i = f6i;
		res->nh = nexthop_fib6_nh(f6i->nh);
		return;
	}

res->nh is the same fib6_nh. ip6_pol_route() then finds the exception
through rt6_find_cached_rt() and returns it instead of the discard dst.

Would this override the configured blackhole for that daddr until the
exception expires (ip6_rt_mtu_expires)?

Locally sent packets would go out lo instead of failing with -EINVAL.
With forwarding enabled, forwarded packets would loop through
ip6_forward() on lo until the hop limit runs out.

Before this patch, the nexthop path only used fib6_nh_find_match() with
the dev and gateway of the looked-up dst. That could never match the
loopback fib6_nh of a blackhole, which has no gateway.

The commit message says:

    - siblings not in the tree and a nexthop replaced by a blackhole are
      skipped.

That only holds when the replace does not happen between the two reads.
The later selftest patch in the series does not touch net/, so this race
is still there at the end of the series.

Could reject_nh be checked for each fib6_nh during the nexthop walk? One
way is a small wrapper callback that tests
container_of(nh, struct nh_info, fib6_nh)->reject_nh before calling
rt6_nh_update_pmtu(). Another is to dereference nh_info once and use that
snapshot for both the check and the walk.

>  		}
> +		goto out;
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117193141.27004-1-deliran%40verdict.gg
