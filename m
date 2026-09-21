Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315A7420469;
	Mon, 21 Sep 2026 20:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022057; cv=none; b=gRw8TwCJjie4bdznhdBamZpqTRT3tDM9x3B3Q3p5ef4bSnOYgvpDg3l+1Hms0JXTbRgX0Orf94s+GiQyZ3iievckNb8iIVrts+EJ2avDqS+2Azt8bXrfbZzO11mD3lrcLh0PkEfOH0LVbQ3EMW/HwU6o5Vo/9adDbKQME3HhFCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022057; c=relaxed/simple;
	bh=jsn0KYYcUFSX/zLtAhCofj3I3hDDKWzGlhr77Cq99R8=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ijmS9HjFodsUkn4beSznRLu3wk+6+K+fBsqclNiK8IBR3OzU2hNl7q//34WBamZBqXrvboctwI5ro1SJ895Xqih6TA21qfEkYVSOWltVtXdVR4cxWxErnCkV1n/K7bx2xOrSMiCJidyd2dcIMNXzj2rJL9bl6PtWIYFB/C4pIpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICD7z+Qt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICD7z+Qt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142F11F000FF;
	Mon, 21 Sep 2026 20:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790022055;
	bh=QunYojctZ+szEyHVQdVhvEh897Lad55JuI/OqN7Em88=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ICD7z+Qtp6seb/1IJJ+BA948xq+wbNuj2lRnG/fcc2ZiHYgGTrAjhtSfiQsZmK7eE
	 G1f9WOeyYs3NTDgsiPJ8jf1mgtPYJloUk2JH8r9NlOo6tiFkG9dCYLAMiWhPLHMguq
	 nJNY7qjGpjUoMonDuBT/pLzz67QpTbQh8M/3aOuK/9bEGdmO1bmyPYF43+bOxgJ6ep
	 LsXE2JWfdC3A6gnN0t0EQVGFzeFSPCK+CumZ0idOU2WPXOT/Okqx/hmGdWO4eYnvsq
	 CP+SvialN+dywPMvKELRzIeq0GS0Du5YkH4dAYeXEf548xMVqpu/pphD2iIlk25aLS
	 oeQfQRvONycWw==
Subject: Re: [PATCH net-next v3 2/3] ipv6: hash uncached routes by device
From: netdev-bot+sashiko@kernel.org
To: carges@cloudflare.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com
Date: Mon, 21 Sep 2026 20:20:54 +0000
Message-ID: <179002205450.2160803.790221993139730686@kernel.org>
In-Reply-To:
 <20260917-hash-bucket-route-lists-v3-2-30493a37b6eb@cloudflare.com>
References:
 <20260917-hash-bucket-route-lists-v3-2-30493a37b6eb@cloudflare.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Partially-repaired uncached routes are unlinked from the list,
  permanently pinning the second device.

Pre-existing issues:
- [Low] `rt6_uncached_list_flush()` tests `list_empty(&ul->head)` before
  acquiring `ul->lock` (net/ipv6/route.c:178-181) and returns on the…

--

ipv6: hash uncached routes by device

The patch replaces the single per-CPU uncached route list with a 64 bucket
per-CPU hash table keyed on rt6i_idev->dev (falling back to dst_dev()), so
ordinary device teardown only visits one bucket per CPU.  Loopback and L3
master devices scan all buckets because they can be referenced through
dst_dev() instead.  The flush loop itself is moved into a new helper,
rt6_uncached_list_flush().

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 7535b09068a06..cda81e91be652 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c

[ ... ]

> @@ -133,11 +134,23 @@ struct uncached_list {
>  	struct list_head	head;
>  };
>  
> -static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt6_uncached_list);
> +#define RT6_UNCACHED_HASH_BITS	6
> +#define RT6_UNCACHED_HASH_SIZE	BIT(RT6_UNCACHED_HASH_BITS)
> +
> +struct rt6_uncached_table {
> +	struct uncached_list buckets[RT6_UNCACHED_HASH_SIZE];
> +};
> +
> +static DEFINE_PER_CPU_ALIGNED(struct rt6_uncached_table, rt6_uncached_table);
>  
>  void rt6_uncached_list_add(struct rt6_info *rt)
>  {
> -	struct uncached_list *ul = raw_cpu_ptr(&rt6_uncached_list);
> +	struct rt6_uncached_table *table = raw_cpu_ptr(&rt6_uncached_table);
> +	struct uncached_list *ul;
> +	struct net_device *dev;
> +
> +	dev = rt->rt6i_idev ? rt->rt6i_idev->dev : dst_dev(&rt->dst);
> +	ul = &table->buckets[hash_ptr(dev, RT6_UNCACHED_HASH_BITS)];
>  
>  	rt->dst.rt_uncached_list = ul;
>  
> @@ -157,40 +170,58 @@ void rt6_uncached_list_del(struct rt6_info *rt)
>  	}
>  }
>  
> +static void rt6_uncached_list_flush(struct uncached_list *ul,
> +				    struct net_device *dev)
> +{
> +	struct rt6_info *rt, *safe;
> +
> +	if (list_empty(&ul->head))
> +		return;
> +
> +	spin_lock_bh(&ul->lock);

[Severity: Low]
This isn't a bug introduced by this patch, the same unlocked list_empty()
test existed in rt6_uncached_list_flush_dev() before (with continue instead
of return), and net/ipv4/route.c uses the same idiom.

Still, the test reads ul->head outside ul->lock while
rt6_uncached_list_add() mutates the same head under the lock from softirq
context:

net/ipv6/route.c:rt6_uncached_list_add() {
	spin_lock_bh(&ul->lock);
	list_add_tail(&rt->dst.rt_uncached, &ul->head);
	spin_unlock_bh(&ul->lock);
}

Can the flush skip a bucket that an adder has just populated, so a route
still referencing the device being torn down is left on the list for that
pass?

As far as I can tell such a route is picked up again, because
netdev_wait_allrefs_any() rebroadcasts NETDEV_UNREGISTER roughly once per
second while references remain, and addrconf_ifdown() calls
rt6_disable_ip(dev, event) before its "idev = __in6_dev_get(dev); if (!idev)
return -ENODEV;" early return, so the flush re-runs.  Would it still be
worth moving the list_empty() check under the lock, since the fast path is
already per-bucket now?

> +	list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
> +		struct net_device *rt_dev = dst_dev(&rt->dst);
> +		struct inet6_dev *rt_idev = rt->rt6i_idev;
> +		bool handled = false;
> +
> +		if (rt_idev && rt_idev->dev == dev) {
> +			rt->rt6i_idev = in6_dev_get(blackhole_netdev);
> +			in6_dev_put(rt_idev);
> +			handled = true;
> +		}
> +
> +		if (rt_dev == dev) {
> +			rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
> +			netdev_ref_replace(rt_dev, blackhole_netdev,
> +					   &rt->dst.dev_tracker, GFP_ATOMIC);
> +			handled = true;
> +		}
> +		if (handled)
> +			list_del_init(&rt->dst.rt_uncached);
> +	}
> +	spin_unlock_bh(&ul->lock);
> +}

[Severity: High]
The single handled flag unlinks the route as soon as either of its two
device references matched, even when the other one still points at a
different live device.  Does that break the scan_all fallback this patch
relies on?

The divergent case is the one the changelog describes.  For
RTF_LOCAL/RTF_ANYCAST routes ip6_rt_get_dev_rcu() returns the netns
loopback or the L3 master:

net/ipv6/route.c:ip6_rt_get_dev_rcu() {
	if (res->fib6_flags & (RTF_LOCAL | RTF_ANYCAST)) {
		if (netif_is_l3_slave(dev) && !rt6_need_strict(...))
			dev = l3mdev_master_dev_rcu(dev) ? : dev_net(dev)->loopback_dev;
		else if (!netif_is_l3_master(dev))
			dev = dev_net(dev)->loopback_dev;
	...
}

while ip6_rt_copy_init() keeps the original interface's inet6_dev via
rt->rt6i_idev = in6_dev_get(nh->fib_nh_dev), so dst_dev(&rt->dst) is vrf0 or
lo and rt6i_idev->dev is eth0.  Such a clone reaches the uncached list from
the FLOWI_FLAG_KNOWN_NH branch of ip6_pol_route():

net/ipv6/route.c:ip6_pol_route() {
	rt = ip6_rt_cache_alloc(&res, &fl6->daddr, NULL);

	if (rt) {
		...
		rt6_uncached_list_add(rt);
}

Removing eth0 then takes only the first branch, sets handled = true and
unlinks the entry, while rt->dst.dev_rcu / dst.dev_tracker still hold a
reference on vrf0.

Deleting vrf0 afterwards walks all 64 buckets, but the entry is no longer on
any list, so scan_all cannot repair it.  The per-second NETDEV_UNREGISTER
rebroadcast from netdev_wait_allrefs_any() has the same problem.  Since the
flush does not set dst->obsolete, a dst parked in sk_dst_cache or in a
delayed qdisc can hold that reference for an unbounded time, so
unregister_netdevice keeps waiting for vrf0 to become free and the deleting
task stays in netdev_run_todo; when the pinned device is a netns loopback,
cleanup_net() is stuck too.

The reverse order has the mirror problem: deleting the VRF or loopback first
unlinks on the dst_dev() match while rt6i_idev still pins eth0 through
inet6_dev->dev_tracker.

Would it be better to unlink only when no device reference remains, for
example:

		if (handled && dst_dev(&rt->dst) != dev &&
		    (!rt->rt6i_idev || rt->rt6i_idev->dev != dev))
			list_del_init(&rt->dst.rt_uncached);

or more directly, only delist once both rt6i_idev->dev and dst_dev() have
been repointed at blackhole_netdev?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917-hash-bucket-route-lists-v3-0-30493a37b6eb%40cloudflare.com
