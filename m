Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C86375AB2;
	Tue, 21 Jul 2026 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641850; cv=none; b=EWZp0qDOsfNySLb45E+ejv2KIxCbc+6QE5bUmG6zCsF4vqxkvEoOHoNlOOe7QQPQAYXocqSJ6jIp89i6mwGyzkP/S++/BsshUDvlsVYK6G2fkcSuw5KCp1IfwIWUGoQWM8Tof9oMGcCYEJS0DAcYcbXP4Xw3fHGGpWKYbCui5k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641850; c=relaxed/simple;
	bh=2Ek+8d21Sf4inO33yGWc5e7bnu0grNkJ+VHDB77MWt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHbaFe1mnkNKxr+nRV91GYfKCO/0vDd/T9CQYYr8tMOBaSl1YZgDKqd/5Q20oVMD9Zrc3VGe36yuwN5OAEbcua25hqs1t5cz/LKHynyPR9b5xtv7PSXwWlb/9ZYpoqdKC5gHksAAzwSpzerjbcG61ddsmPdkewz2q1ZLNkMltx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYFsM9kh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYFsM9kh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584311F000E9;
	Tue, 21 Jul 2026 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641849;
	bh=rhQ8RcgHMLdI8PmD9uiVmRPwyKbS+B4Dq9UWq6orHaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cYFsM9khrBwZnHb0tShOnh5Z0LqPI5hcMlgvcJUwCwYySjAIP+BkBonzaNBAvL7y3
	 IMBevg5HY4q/d8zJjy0lf/FD/eVN1a3HWRh4rCqXD7GvKCWvjeFUO+I17/19Cd049w
	 FJ7CtKm/eWViR2PQzT4euHsW4fPcxsb8r/1XtvlPH7nlqJUGUAHAL+ftKHOQ5z1828
	 AxHbbCNWHDS7r4ATKX+wgIO0lW+1KBomedfGbpqXIIjIzsi2aU4esBibn0iNED7tVb
	 4TCdnq+Tb0KhUqoKsk3LZR4lxV9TxxXn5dwkgCqss65zJ0324GC0XTCusBiqyWBg0i
	 xfecGPl2M6Deg==
From: Simon Horman <horms@kernel.org>
To: equinox@diac24.net
Cc: Simon Horman <horms@kernel.org>,
	pabeni@redhat.com,
	kuba@kernel.org,
	idosch@nvidia.com,
	dsahern@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	fmancera@suse.de,
	lorenzo@google.com,
	maze@google.com,
	prohr@google.com,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	furry13@gmail.com
Subject: Re: [PATCH net-next 7/9] net/ipv6: support RFC6724 rule 5.5 via subtrees
Date: Tue, 21 Jul 2026 14:50:14 +0100
Message-ID: <20260721135013.387122-2-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714094030.136317-8-equinox@diac24.net>
References: <20260714094030.136317-8-equinox@diac24.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
https://sashiko.dev/#/patchset/20260714094030.136317-2-equinox@diac24.net?part=7
---
--- Patch [7]: [PATCH net-next 7/9] net/ipv6: support RFC6724 rule 5.5 via subtrees ---
commit 8c6cdd876548668f6d35fa2db4feb39f16c09a62
Author: David 'equinox' Lamparter <equinox@diac24.net>

net/ipv6: support RFC6724 rule 5.5 via subtrees

This commit implements RFC6724 rule 5.5 for IPv6 source address selection.
It introduces subtrees logic to prefer source addresses in a prefix advertised
by the chosen next-hop.

> diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
> index 0ba46ed518a9a..f5c04928aa142 100644
> --- a/net/ipv6/addrconf.c
> +++ b/net/ipv6/addrconf.c
[ ... ]
> @@ -1593,6 +1595,80 @@ static bool ipv6_allow_optimistic_dad(const struct net *net,
>  #endif
>  }
>  
> +/* "source address is preferable if the chosen nexthop advertised it as a PIO"
> + * => consider 'advertised as a PIO' to be 'the routes for the source's subtree
> + *    include one with the same nexthop'
> + *
> + * NB: there is no backtracking in the subtree here, this is intentional -
> + * each prefix seen (and accepted) in PIOs creates essentially a "zone" which
> + * is our search scope.
> + */
> +static int ipv6_saddr_rule5p5(struct ipv6_saddr_score *score,
> +			      struct ipv6_saddr_dst *saddr_dst)
> +{
> +	const struct rt6_info *rt, *cmp_rt;
> +	struct dst_entry *cmp_dst;
> +	struct fib6_info *f6i;
> +	int ret = 0;
> +
> +	rt = container_of(saddr_dst->dst, struct rt6_info, dst);
> +
> +	/* fl6->saddr is ::, cf. check at the top of ipv6_common_get_saddr() */
> +	saddr_dst->fl6->saddr = score->ifa->addr;
> +	cmp_dst = ip6_route_output(saddr_dst->net, saddr_dst->sk,
> +				   saddr_dst->fl6);

[Severity: High]
When ipv6_saddr_rule5p5() passes the caller-provided saddr_dst->fl6 pointer
into ip6_route_output(), does this permanently alter the flow state?

ip6_route_output() calls ip6_route_output_flags_noref(), which
unconditionally mutates fields in the flow struct, such as setting
flowi6_iif to LOOPBACK_IFINDEX. It can also call l3mdev_update_flow()
to alter flowi6_oif.

Since the code only clears the injected saddr via memset() below, could this
cause silent corruption of the network flow state for subsequent lookups,
potentially breaking policy routing or VRF logic?

> +	memset(&saddr_dst->fl6->saddr, 0, sizeof(saddr_dst->fl6->saddr));
> +
> +	if (cmp_dst->error)
> +		goto out_release_dst;
> +
> +	cmp_rt = container_of(cmp_dst, struct rt6_info, dst);
> +
> +	/* this must work if _any_ nexthop matches; the non-subtree best may
> +	 * not be in same order as subtree best
> +	 */
> +	for (f6i = rcu_dereference(cmp_rt->from); f6i;
> +	     f6i = rcu_dereference(f6i->fib6_next)) {
> +		struct fib6_nh *f6n = f6i->fib6_nh;

[Severity: High]
Can this cause a slab-out-of-bounds read if the route uses an external
nexthop?

When an IPv6 route is configured with an external nexthop, fib6_info_alloc()
allocates the fib6_info object without space for the inline fib6_nh flexible
array, and instead sets f6i->nh.

Is it safe to unconditionally dereference f6i->fib6_nh without checking if
f6i->nh is in use?

> +		struct fib6_info *sibling;
> +
> +		/* non-subtree route: says nothing about router advertising this source */
> +		if (f6i->fib6_src.plen == 0)
> +			continue;
> +
> +		if (f6n->nh_common.nhc_dev != saddr_dst->dst->dev ||
> +		    f6n->nh_common.nhc_gw_family != AF_INET6)
> +			continue;
> +
> +		if (ipv6_addr_equal(&f6n->nh_common.nhc_gw.ipv6,
> +				    &rt->rt6i_gateway)) {
> +			ret = 1;
> +			goto out_release_dst;
> +		}
> +
> +		if (!f6i->fib6_nsiblings)
> +			continue;
> +
> +		list_for_each_entry(sibling, &f6i->fib6_siblings, fib6_siblings) {

[Severity: High]
Is this list traversal safe to perform without RCU primitives?

The fib6_siblings list is actively mutated by the routing subsystem using RCU
list primitives like list_add_tail_rcu() and list_del_rcu().

Since ipv6_saddr_rule5p5() is executed locklessly under the rcu_read_lock()
held by its caller, should this be using list_for_each_entry_rcu() to avoid
reading torn or uninitialized pointers on weakly ordered architectures?

> +			f6n = sibling->fib6_nh;

[Severity: High]
Similar to the issue above, can this unconditionally access an unallocated
fib6_nh array if the sibling route uses an external nexthop?

> +
> +			if (f6n->nh_common.nhc_dev != saddr_dst->dst->dev ||
> +			    f6n->nh_common.nhc_gw_family != AF_INET6)
> +				continue;
> +
> +			if (ipv6_addr_equal(&f6n->nh_common.nhc_gw.ipv6,
> +					    &rt->rt6i_gateway)) {
> +				ret = 1;
> +				goto out_release_dst;
> +			}
> +		}
> +	}
> +
> +out_release_dst:
> +	dst_release(cmp_dst);
> +	return ret;
> +}
[ ... ]
