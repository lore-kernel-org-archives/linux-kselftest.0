Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170750;
	b=JVeCs7nHjlTON54mcN+R9O3ZVwPnq6GVG2PrkFYYH3RPhQJ7rlOSxmnNf1cbt05CoTyZ
	 YHttXVNGLNEHmMJvcszhvjgNyh4ECVV1SL8ADmGvboRlpaRQlnTyRYYEntZ33Uyq5QsEs
	 Fv4xlLa1lQyOK+gC2bTpGOaoQPMcrZ3BQATrs3HRqEzK18h4lLX7MHpZAc7FkaiFLOCAk
	 /C8c2WRb/HxwbjH4fwhmxP7gi89z6EhIGnPeh0p13BLGqrGLggPFChYJmmch7o9IOuxvr
	 71hKdcffSVpmTe6Zs0MPyXYWbBvgSpMfzoPO7M7u+VeyOw9Tx0Aj/rgUEcVUayYd5qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170750;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SnAqAg381veESmVUGrbbBgkSnsyfEytJcfyGHNrIA2Q=;
	b=5IKwMeGbP8sxviKYxjCdD7YRGY35xe0YvPvTN39c7+usWSIxA4h7w2ClYvZMyVD7gZB9
	 YPidHfxQ438zfk3TBazUWIdeOvnuffybxC1jCfsjBR4HUbk0sxwy4Z11QiyzHGD0G8A8T
	 tLPH+K3xzuzIZTM8H/PCjCfTYIMhq6KtuCggqaMnJqxEN6N4/xllbkotbtARzHb9qGhIh
	 RpQjPFFxqj+au7DMRVRglfOTblOXcRvHwhE2Pl2Aa3+cWhlOBd9lEruVx0kX70p9sJ764
	 2h+54siFtHnHv744AZzKYHz92dmkFEp6omQ/3VK1JaiSJh0f39j1LX9OinnsPqbADvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cgQ7xvOM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAFC606A320;
	Fri, 20 Nov 2026 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cgQ7xvOM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610A31F000C4;
	Fri, 20 Nov 2026 10:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170750;
	bh=SnAqAg381veESmVUGrbbBgkSnsyfEytJcfyGHNrIA2Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cgQ7xvOMY1CUiX0aYkbIQvGng8ZlUuGeFzZrfjUbTaFNa9DN6kgoTbyvXMWxe6Ljl
	 CEec0denXCUf8fkH7k6AhvvSJGL+/F5tM2hbgbIcpxQAm1+zf0ha7900xL6zC3crrb
	 Qtp3ODAO47xlsrDeTFJ44S/aFm8cnO/yYp2P8gqndS/3Wh8lzOWrul9KpCkcfrS5ql
	 6ndE/zg8mjWAQ9UZvHKdfnDubebQe3tYHDDVX7YlhhXyj5mOb/B2uKfhU4pJQqM/6c
	 gCeRiU+8qgwrycImQB5N5T8syCYIndrRKwCkKqxJuPYb6lLt+gFPtYrHysuoz8IXJK
	 BeikglWnY4ZEA==
Subject: Re: [PATCH net-next v4 1/3] ipv4: Check a Fragmentation Needed
 against each path of a multipath route
From: netdev-bot+sashiko@kernel.org
To: deliran@verdict.gg
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 20 Nov 2026 10:32:28 +0000
Message-ID: <179517074893.3136.1226707623351287544@kernel.org>
In-Reply-To: <20261117193141.27004-2-deliran@verdict.gg>
References: <20261117193141.27004-2-deliran@verdict.gg>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In net/ipv4/route.c, fib_nhc_pmtu() does not measure a path
  the way its comment and the commit message say.
- [Medium] ipv4: premature mtu clamping in __ip_rt_update_pmtu() locks
  narrower paths
- [Low] The fib_nhc_pmtu() comment (net/ipv4/route.c:1051-1055) says the
  function returns 0, leaving the path alone, when what the path uses…

--

ipv4: Check a Fragmentation Needed against each path of a multipath route

This patch adds fib_nhc_pmtu() and calls it from __ip_rt_update_pmtu().
Before the mtu of a Fragmentation Needed is cached in a nexthop exception,
it is now checked against each path of a multipath route. The early
returns based on the looked-up dst are kept only for callers whose dst is
the path of their flow (from_lookup == false).

> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index d0a5f6d77094c..b90eed715fb5a 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c

[ ... ]

> @@ -1046,54 +1048,87 @@ out:	kfree_skb_reason(skb, reason);
>  	return 0;
>  }
>  
> -static void __ip_rt_update_pmtu(struct rtable *rt, struct flowi4 *fl4, u32 mtu)
> +/* The pmtu to cache on a path for the mtu of a Fragmentation Needed, 0 to
> + * leave the path alone: what it uses now, as ipv4_mtu() reports it, is not
> + * above the mtu, or its pmtu is locked. An exception about to expire is
> + * refreshed, a locked mtu is capped at what the path uses.
> + */
> +static u32 fib_nhc_pmtu(struct fib_nh_common *nhc, const struct fib_info *fi,
> +			__be32 daddr, u32 mtu, bool lock)
> +{
> +	struct fib_nh_exception *fnhe = find_exception(nhc, daddr);
> +	struct net *net = dev_net(nhc->nhc_dev);
> +	u32 path_mtu = 0;
> +
> +	if (fnhe && fnhe->fnhe_genid == fnhe_genid(net) &&
> +	    time_before(jiffies, fnhe->fnhe_expires)) {
> +		if (fnhe->fnhe_mtu_locked)
> +			return 0;
> +		if (!lock && fnhe->fnhe_pmtu == mtu &&
> +		    time_before(jiffies, fnhe->fnhe_expires -
> +					 net->ipv4.ip_rt_mtu_expires / 2))
> +			return 0;
> +		path_mtu = fnhe->fnhe_pmtu;
> +	}
> +	if (!path_mtu)
> +		path_mtu = fi->fib_mtu;
> +	if (!path_mtu)
> +		path_mtu = READ_ONCE(nhc->nhc_dev->mtu);
> +	path_mtu = min(path_mtu, IP_MAX_MTU);

[Severity: Medium]
Does path_mtu here match what ipv4_mtu() reports for the path? The comment
above and the commit message both say it does.

ipv4_mtu() goes through ip_dst_mtu_maybe_forward(), which ends with:

include/net/ip.h:ip_dst_mtu_maybe_forward() {
    ...
	res = mtu - lwtunnel_headroom(dst->lwtstate, mtu);
    ...
}

rt_set_nexthop() sets rt->dst.lwtstate from nhc->nhc_lwtstate. The
existing ip_mtu_from_fib_result() does the same subtraction:

	return mtu - lwtunnel_headroom(nhc->nhc_lwtstate, mtu);

fib_nhc_pmtu() takes fnhe_pmtu, fi->fib_mtu or nhc_dev->mtu and does not
subtract the nexthop's lwtunnel headroom.

For from_lookup == false, the check kept in __ip_rt_update_pmtu() still
uses ipv4_mtu(dst):

	if (!from_lookup && (rt->rt_mtu_locked || ipv4_mtu(dst) < mtu))
		return;

Take a nexthop with an lwtunnel encap of headroom H (MPLS, seg6, ...) and
an ICMP mtu M, where dev_mtu - H < M <= dev_mtu:

- ip_rt_update_pmtu() rejects M.
- ipv4_update_pmtu() and __ipv4_sk_update_pmtu() accept M and create an
  exception.
- After that, ipv4_mtu() reports M - H for that path.

The lock branch, min(mtu, path_mtu), also caps against the raw device or
metric value rather than the ipv4_mtu() value.

Should fib_nhc_pmtu() subtract lwtunnel_headroom(nhc->nhc_lwtstate, ...)
the way ip_mtu_from_fib_result() does? If not, should the comment and
commit message describe the raw value it actually compares against?

> +
> +	if (lock)
> +		return min(mtu, path_mtu);
> +	return mtu > path_mtu ? 0 : mtu;

[Severity: Medium]
When the Fragmentation Needed reports an mtu below ip_rt_min_pmtu,
__ip_rt_update_pmtu() sets lock and replaces mtu with ip_rt_min_pmtu.
This happens before any path has been compared against the reported
value. fib_nhc_pmtu() only ever sees the clamped mtu, and its lock
branch returns min(mtu, path_mtu), which is never 0.

Take a path where path_mtu < reported mtu < ip_rt_min_pmtu. That needs
either a device or route mtu below 552, or a raised
net.ipv4.route.min_pmtu.

The commit message's rule is to cache the mtu only where it is lower,
so this path should be left alone. Instead:

- fib_nhc_pmtu() returns path_mtu.
- update_or_create_fnhe() then creates or overwrites an exception with
  fnhe_pmtu = path_mtu and fnhe_mtu_locked = true, on a path that was
  already narrower than the reported bottleneck.

Before this patch, the old_mtu < mtu check ran ahead of the clamp. So
on a single path route this could not happen. Now it happens for every
path reached from ipv4_update_pmtu() and __ipv4_sk_update_pmtu(),
single path routes included. It also happens for the narrower legs of
a multipath route reached from ip_rt_update_pmtu() when the flow's dst
is a wider leg.

A locked exception there is not harmless:

- rt_mtu_locked makes ip_dont_fragment() return false for
  IP_PMTUDISC_WANT sockets. DF is cleared and traffic on that path
  gets fragmented.
- fib_nhc_update_mtu() does not raise a locked fnhe_pmtu when the
  device mtu grows, so the path stays at the old value.
- fib_nhc_pmtu() itself returns 0 for a locked exception. Every later
  Fragmentation Needed for that destination is ignored on that path
  until the exception expires.

Should fib_nhc_pmtu() also be passed the mtu as reported? It could then
leave the path alone when path_mtu is below that value, and only apply
the ip_rt_min_pmtu clamp and the lock to paths the report actually
narrows. Or is locking an already narrower path intended here?

[Severity: Low]
The comment says the path is left alone when what it uses now "is not
above the mtu". This line returns 0 only when path_mtu < mtu.

Take path_mtu == mtu with no valid exception, so path_mtu came from
fi->fib_mtu or nhc_dev->mtu. This returns mtu, and __ip_rt_update_pmtu()
calls update_or_create_fnhe() for that path. That call:

- allocates a new fnhe whose pmtu equals the mtu the path already uses
- may evict another fnhe through fnhe_remove_oldest()
- marks nhc_rth_input and every per-CPU nhc_pcpu_rth_output of the
  nexthop DST_OBSOLETE_KILL

This also seems to contradict two statements in the commit message:

  cache the mtu only where it is lower

and:

  A Fragmentation Needed that changes nothing costs the ICMP callers a
  fib lookup and a look at the exception of each path.

Should this return 0 at equality when path_mtu did not come from an
exception that needs refreshing?

> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117193141.27004-1-deliran%40verdict.gg
