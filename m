Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACCD4DD3CE;
	Sun, 18 Oct 2026 22:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792361194; cv=none; b=jVc5Dw6rVOlldfEgT1hZ9DqZa1OpqEf4gFOknOLAoemYSyAnqv1POk3idypmzYj9ad4ZSMYv1n5GWnExkdDCE4hY+ZXo9lmVKsa31scI5X313hifRYqIMsX/4uAyqglB8f3TAlqsoJNQeGXllO21l2NDDhreOFokFDFa72nPoTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792361194; c=relaxed/simple;
	bh=Crg0rmgfn9NWJpaXgfh7zCVSfd15q4YomrX21kd0R/g=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AA5OfzYNMjRUOW4SN0EwC4gUDyrPldF9HRTDulHjeCnRhwKN/gY9NJo76St1mIzJnQggbcqdiERR+nIFeKeDynGTDvPqulY/f4Tfr+dKlM7v05ihcC+NoWOHU25ZoNtQazCCIVfKUsu3sEZ9lYl502pttPdtbOBxtgy61IVbzQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjU2COaR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjU2COaR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2F81F000C4;
	Sun, 18 Oct 2026 22:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792361191;
	bh=AAAyu+jGgZIiP3HCAcNISjqP4mN1Kt9+rgucMFaMgBE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TjU2COaRbc7tlCGExMQ057yx1kjU7FfwKIR+GO89Z7aLY5LPDTJQs4MLlN6ulQBbo
	 SzzPwZ9QdF/b1jYHiowx5e+C45t/TZ15cSQCwWGh829dQdQtCSc4Ryd9dbQTWqktk/
	 uSSWA6yqUj8LU3l9MmKmSwW9p/sg26GaL1vuUMbuxnEpWJwoGoSg4+EsCHF/PF4y9e
	 eeH399X8BgU8Ffvo6OAo5t9x9y67jtK+p7E9EdCSvWnhkD/+RWKWEkqPFRRYRyQSFV
	 OQFci3JJOW/dRQgT5WZN054yfIskZQKk9Eyb2bTpEowNUukU7PLHnTTFvdOpwmeIuO
	 SOts8T7y/ZxWg==
Subject:
 Re: [PATCH net-next 1/2] ipv6: Cache pmtu for all paths of a multipath route
From: netdev-bot+sashiko@kernel.org
To: deliran@verdict.gg
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 18 Oct 2026 22:06:30 +0000
Message-ID: <179236119085.3135.2701233313088371263@kernel.org>
In-Reply-To: <20261017210508.71849-2-deliran@verdict.gg>
References: <20261017210508.71849-2-deliran@verdict.gg>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch fans out to all paths only on the first Packet Too
  Big.
- [Medium] A PTB on one path now replaces whatever exception the other
  paths already hold for the same daddr, even when that exception has a…
- [Medium] The new legacy-sibling walk in __ip6_rt_update_pmtu()
  (route.c:2984-2998) relies only on f6i->fib6_nsiblings to decide…
- [Low] The new comment in __ip6_rt_update_pmtu() (route.c:2970-2974)
  says 'A Packet Too Big only ever arrives through the path the…
- [Low] The commit message has no Fixes: tag and does not say which tree
  it targets.

--

ipv6: Cache pmtu for all paths of a multipath route

This patch makes __ip6_rt_update_pmtu() create a PMTU exception on every
path of a multipath route, not only on the selected one. For nexthop
objects it walks all fib6_nh entries. For legacy multipath routes it walks
the fib6_siblings list of the selected fib6_info, mirroring IPv4 commit
7d3f3b4367f3.

Link: https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/

> Link: https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/
> Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>

[Severity: Low]
This isn't a bug, but there is no Fixes: tag. The IPv4 counterpart
7d3f3b4367f3 was also applied without one, so this may be fine for netdev.
It is only worth adding if a stable backport is intended. The target tree
would go in the subject prefix.

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 34ab7f330540c..d870c20f27281 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -2888,6 +2888,30 @@ static bool rt6_cache_allowed_for_pmtu(const struct rt6_info *rt)
>  		(rt->rt6i_flags & RTF_PCPU || rcu_access_pointer(rt->from));
>  }
>  

[ ... ]

> +static int rt6_nh_insert_pmtu_exception(struct fib6_nh *nh, void *_arg)
> +{
> +	struct rt6_pmtu_exception_arg *arg = _arg;
> +	struct fib6_result *res = arg->res;
> +	struct rt6_info *nrt6;
> +
> +	res->nh = nh;
> +	nrt6 = ip6_rt_cache_alloc(res, arg->daddr, arg->saddr);
> +	if (nrt6) {
> +		rt6_do_update_pmtu(nrt6, arg->mtu);
> +		if (rt6_insert_exception(nrt6, res))
> +			dst_release_immediate(&nrt6->dst);

[Severity: Medium]
Can a PTB on one path now overwrite a lower PMTU or a redirect that
another path has already learned?

In __ip6_rt_update_pmtu() the only size check is mtu >= dst6_mtu(dst),
and it uses the current path's dst. rt6_insert_exception() then compares
the new clone only with fib6_mtu(res), and it removes any existing
exception for the same key:

	if (dst_metric_raw(&nrt->dst, RTAX_MTU) >= fib6_mtu(res)) {
		err = -EINVAL;
		goto out;
	}

	rt6_ex = __rt6_find_exception_spinlock(&bucket, &nrt->rt6i_dst.addr,
					       src_key);
	if (rt6_ex)
		rt6_remove_exception(bucket, rt6_ex);

So there are two cases.

Path B has learned PMTU 1280, and path A has no exception yet (or it
expired or was evicted). A PTB of 1400 on A replaces B's 1280 exception
with a 1400 one. B's flows then blackhole until B gets its own PTB.

Path B has a redirect exception from rt6_do_redirect(), with rt6i_gateway
set to the redirect target. A PTB on A replaces it with a PMTU-only clone
that uses B's original gateway, so the redirect is lost.

IPv4's update_or_create_fnhe() also overwrites fnhe_pmtu, but it keeps
fnhe_gw when only a pmtu is passed. Before this patch, a PTB on one path
never touched the exceptions of other paths.

Should rt6_nh_insert_pmtu_exception() leave an existing exception on that
nexthop alone if it already has a lower MTU or is a redirect?

> +	}
> +
> +	return 0;
> +}
> +
>  static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
>  				 const struct ipv6hdr *iph, u32 mtu,
>  				 bool confirm_neigh)
> @@ -2925,42 +2949,52 @@ static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
>  		if (rt6->rt6i_flags & RTF_CACHE)
>  			rt6_update_exception_stamp_rt(rt6);
>  	} else if (daddr) {

[Severity: High]
Does the fan-out to all paths only happen for the first Packet Too Big?

The new code is only in this else branch, which is reached only when
rt6_cache_allowed_for_pmtu() is true:

	return !(rt->rt6i_flags & RTF_CACHE) &&
		(rt->rt6i_flags & RTF_PCPU || rcu_access_pointer(rt->from));

Once the first PTB has created exceptions, the next lookup through
ip6_pol_route()->rt6_find_cached_rt() returns the RTF_CACHE exception for
the hashed path. This covers both the ip6_route_output() call in
ip6_update_pmtu() and TCP's re-route.

A second, lower PTB then takes the first branch, for example from a
further bottleneck or after a path change:

	if (!rt6_cache_allowed_for_pmtu(rt6)) {
		rt6_do_update_pmtu(rt6, mtu);
		/* update rt6_ex->stamp for cache */
		if (rt6->rt6i_flags & RTF_CACHE)
			rt6_update_exception_stamp_rt(rt6);

That branch updates only this one exception. Wouldn't the exceptions on
the other siblings or nexthop group members keep the older, higher MTU?
Flows hashed to them would then blackhole again.

The expiry times also drift apart. The lowered path's exception now
expires later than the others. When the others expire, those paths go
back to the link MTU. Meanwhile, PTBs looked up through the still-cached
path keep taking the single-path branch.

IPv4's __ip_rt_update_pmtu() doesn't have this split. Whenever
fib_info_num_path() > 1 it calls fib_lookup() and then
update_or_create_fnhe() on every nhsel, whether or not the current dst is
already a cached fnhe route.

Should the RTF_CACHE branch also update every path?

> +		struct fib6_info *f6i, *sibling;

[ ... ]

> +		/* A Packet Too Big only ever arrives through the path the
> +		 * offending packet took, so cache the pmtu on every path of a
> +		 * multipath route: the other paths will not get their own
> +		 * ICMP error and would keep sending with the link MTU.
> +		 */

[Severity: Low]
Is this comment accurate? The interface the ICMPv6 error arrives on isn't
used here. The exception goes on the nexthop of the dst passed to
->update_pmtu.

For TCP, that dst comes from inet6_csk_route_socket(), which sets the
protocol, ports and multipath hash:

	fl6->flowi6_proto = sk->sk_protocol;
	...
	if (sk->sk_protocol == IPPROTO_TCP)
		ip6_ecmp_set_mp_hash(sock_net(sk), fl6, sk->sk_txhash);
	...
	fl6->fl6_sport = inet->inet_sport;
	fl6->fl6_dport = inet->inet_dport;

So each TCP flow's PTB already lands on that flow's own transmit path.

The cross-path mismatch seems to come from ip6_update_pmtu(), which UDP,
raw, ping and tunnels use. Its flowi6 has no flowi6_proto and no ports:

	struct flowi6 fl6 = {
		.flowi6_oif = oif,
		.flowi6_mark = mark ? mark : IP6_REPLY_MARK(net, skb->mark),
		.daddr = iph->daddr,
		.saddr = iph->saddr,
		.flowlabel = ip6_flowinfo(iph),
		.flowi6_uid = uid,
	};

rt6_multipath_hash() uses fl6->flowi6_proto even with policy 0, so the
path chosen here can differ from the transmit path.

The comment also seems to contradict itself. If every PTB came back over
the offending packet's own path, every path would get its own PTB. The
rationale also differs from the one in IPv4 commit 7d3f3b4367f3.

The commit message uses the same wording:

  __ip6_rt_update_pmtu() creates the exception route only on the nexthop
  the Packet Too Big came in through.

Could the comment and changelog describe the actual mechanism? They could
also mention that TCP flows, which were already handled per path, now get
one path's PMTU applied to all paths.

> +		if (f6i->nh) {

[ ... ]

> +		/* fib6_del_route() zeroes fib6_nsiblings before unlinking
> +		 * f6i, stop then as its list_head may no longer be reached.
> +		 */
> +		list_for_each_entry_rcu(sibling, &f6i->fib6_siblings,
> +					fib6_siblings) {
> +			res.f6i = sibling;
> +			res.fib6_flags = sibling->fib6_flags;
> +			res.fib6_type = sibling->fib6_type;
> +			rt6_nh_insert_pmtu_exception(sibling->fib6_nh, &arg);
> +			if (!READ_ONCE(f6i->fib6_nsiblings))
> +				break;
>  		}

[Severity: Medium]
Is fib6_nsiblings enough to tell whether the fib6_siblings ring of f6i is
still safe to walk? Only fib6_del_route() clears it.

The ECMP NLM_F_REPLACE path in fib6_add_rt2node() unlinks the old leaf and
its siblings from the node chain and queues them on purge_list. It does
not call list_del_rcu() on their fib6_siblings or zero fib6_nsiblings:

		nsiblings = iter->fib6_nsiblings;
		iter->fib6_node = NULL;
		list_add(&iter->purge_link, purge_list);

fib6_add() then calls fib6_purge_rt() and fib6_info_release() on each
entry. list_add() puts the siblings ahead of the original leaf A, so the
siblings are released before fib6_purge_rt(A) clears from on A's per-CPU
dsts.

In that window, could a PTB handler do the following?

  rcu_read_lock()
  f6i = rcu_dereference(rt6->from)          /* still A */
  READ_ONCE(f6i->fib6_nsiblings)            /* still non-zero */
  list_for_each_entry_rcu(sibling, &f6i->fib6_siblings, ...)
      sibling->fib6_flags, sibling->fib6_nh /* B or C, already released */

If the reader's critical section started after call_rcu() on B or C, they
can be freed while it runs. That would be a use-after-free of the
fib6_info.

rt6_nh_insert_pmtu_exception() always returns 0, so the -ENOENT from the
fib6_destroying check in rt6_insert_exception() doesn't stop the walk
either.

The window is narrow: it needs an admin route replace to race with PTB
processing, and I didn't find a deterministic trigger. rt6_fill_node()
already has a similar sibling walk anchored on dst->from. This one,
though, can be reached from a remote ICMPv6 PTB.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261017210508.71849-1-deliran%40verdict.gg
