Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF691248896;
	Sat, 19 Sep 2026 02:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786136; cv=none; b=qe7Pu2qkud7gJonGnS8nR57kFVuzcmO0qMuQ6jM1ucq0kMRJ4J7OXdquIb5P442ihvQrI4HpyP3QxVn4VmvRY+3rqQ1PLvQkqiWppQ0oeTk9mHRg92G3H0RZyEdZwrHap622nCqsA+Ng8Yu9GTlVf/l4KizxDsu7UIZs8Hpahdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786136; c=relaxed/simple;
	bh=qz+NsUa5lXt/i2LNRAapsVttDKE/gTx6LOu0gERrM5g=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BIsuHGyFQZj4UWaRS+nQt0UEdSvRdIE/FZjXcMiKAof+kJDTR7bubX/GJ6JAOcxzPH7DTxaJexfC/QHxAZTNlyomIggqf18jjTMJLdgZb316ssQChut0mpKkkqeCUzM4Qs9qa2be4ssyviEVUl7hnGemTvnhjBaxq0jAnE2PJGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOhvb8u1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOhvb8u1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A891F00898;
	Sat, 19 Sep 2026 02:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789786134;
	bh=ievwpJsrj4/rXPuR988T9wuBXxdFL1CuhpO72vj7BSA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZOhvb8u14K2RjsmfMj2nJJDklMIPDB8hRNASnet4ThiPT1n1/vY+wi5WJCorwCIQ7
	 JvbtJWHis7DOPXkXc4ReKcf8ND0E4I7JqzJmy+ZKoH94WBu7sE/VMX9HgDdzyAlMpN
	 8NjuyQjqao27YLxbOuGbLhqprFgZeeqTlat2iblhgm//oqaOg16oXDiv7BfMqniEsp
	 tnv9lEW+Ov+76MZhW7hxHUl+9iqow1GSJpQo2dlXIN7bPbK5J//ngmbbr8Kn6bMeGD
	 nhmJl4RZ/KGzcDY4IoFQqyo+eRGjbx9CnbfhNbqJnla6cbbxWaHZqV1N1Ifh4o9CB1
	 aZPxtN/N0scfQ==
Subject: Re: [PATCH net-next v2 2/3] ipv6: hash uncached routes by device
From: netdev-bot+sashiko@kernel.org
To: carges@cloudflare.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com
Date: Sat, 19 Sep 2026 02:48:53 +0000
Message-ID: <178978613343.22033.13619712358346014012@kernel.org>
In-Reply-To:
 <20260914-hash-bucket-route-lists-v2-2-29f6297d8a5a@cloudflare.com>
References:
 <20260914-hash-bucket-route-lists-v2-2-29f6297d8a5a@cloudflare.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 (1) · Medium: 0 · Low: 1

- [Low] Changelog/code mismatch: the commit message states "Hash uncached
  routes by their inet6 device", but rt6_uncached_list_add()…

Pre-existing issues:
- [High] rt6_uncached_list_flush() (net/ipv6/route.c:177-207) unlinks a
  route from its uncached list as soon as EITHER of its two device…

--

ipv6: hash uncached routes by device

This replaces the single per-CPU uncached route list with a per-CPU hash
table plus a separate "mismatch" list, so that device teardown only has to
walk the bucket belonging to the device being removed. A new
CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS controls the bucket count.

Two questions below, one about the changelog wording and one about the
flush path.

    Hash uncached routes by their inet6
    device so ordinary device teardown only visits the matching bucket on each
    CPU.

[Severity: Low]
Is this description accurate?  In rt6_uncached_list_add() the bucket key is
the dst device, not the inet6 device:

	struct net_device *rt_dev = dst_dev(&rt->dst);
	...
		ul = &table->buckets[hash_ptr(rt_dev,
					      CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)];

rt6i_idev is only used as a discriminator to divert a route onto the
mismatch list, and rt6_uncached_list_flush_dev() likewise computes
hash_ptr(dev) for the device being unregistered.

Since ip6_rt_get_dev_rcu() can make dst.dev and rt6i_idev->dev refer to
different devices, which of the two is the key matters when auditing which
routes a given flush pass can reach.  Could the changelog say "hash uncached
routes by their dst device" instead?

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 7535b09068a06..080dce3291682 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c

[ ... ]

> @@ -133,11 +134,27 @@ struct uncached_list {
>  	struct list_head	head;
>  };
>  
> -static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt6_uncached_list);
> +#define RT6_UNCACHED_HASH_SIZE	BIT(CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)
> +
> +struct rt6_uncached_table {
> +	struct uncached_list buckets[RT6_UNCACHED_HASH_SIZE];
> +	/* Routes that must be discoverable through two different devices. */
> +	struct uncached_list mismatch;
> +};
> +
> +static DEFINE_PER_CPU_ALIGNED(struct rt6_uncached_table, rt6_uncached_table);
>  
>  void rt6_uncached_list_add(struct rt6_info *rt)
>  {
> -	struct uncached_list *ul = raw_cpu_ptr(&rt6_uncached_list);
> +	struct rt6_uncached_table *table = raw_cpu_ptr(&rt6_uncached_table);
> +	struct net_device *rt_dev = dst_dev(&rt->dst);
> +	struct uncached_list *ul;
> +
> +	if (rt->rt6i_idev && rt->rt6i_idev->dev != rt_dev)
> +		ul = &table->mismatch;
> +	else
> +		ul = &table->buckets[hash_ptr(rt_dev,
> +					      CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)];
>  
>  	rt->dst.rt_uncached_list = ul;
>  
> @@ -157,40 +174,51 @@ void rt6_uncached_list_del(struct rt6_info *rt)
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
> +	list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
> +		struct inet6_dev *rt_idev = rt->rt6i_idev;
> +		struct net_device *rt_dev = dst_dev(&rt->dst);
> +		bool handled = false;
> +
> +		if (rt_idev && rt_idev->dev == dev) {
> +			rt->rt6i_idev = in6_dev_get(blackhole_netdev);
> +			in6_dev_put(rt_idev);
> +			handled = true;
> +		}
> +
> +		if (rt_dev == dev) {
> +			rt->dst.dev = blackhole_netdev;
> +			netdev_ref_replace(rt_dev, blackhole_netdev,
> +					   &rt->dst.dev_tracker, GFP_ATOMIC);
> +			handled = true;
> +		}
> +		if (handled)
> +			list_del_init(&rt->dst.rt_uncached);

[Severity: High]
This isn't a bug introduced by this patch, the handled/list_del_init()
sequence is textually identical to the pre-patch loop in
rt6_uncached_list_flush_dev().  But does the new mismatch list turn it into
a net_device reference leak?

handled is set independently by the rt6i_idev branch and the dst.dev branch,
and the route is then unlinked even when only one of the two matched.

For a route on table->mismatch the two fields point at two different real
devices by construction:

	if (rt->rt6i_idev && rt->rt6i_idev->dev != rt_dev)
		ul = &table->mismatch;

Such routes are produced by ordinary local traffic through an enslaved
interface.  ip6_rt_cache_alloc() takes dst.dev from ip6_rt_get_dev_rcu():

	if (res->fib6_flags & (RTF_LOCAL | RTF_ANYCAST)) {
		if (netif_is_l3_slave(dev) && !rt6_need_strict(...))
			dev = l3mdev_master_dev_rcu(dev) ? :
			      dev_net(dev)->loopback_dev;

while ip6_rt_copy_init() sets the inet6 device from the nexthop:

	rt->rt6i_idev = dev ? in6_dev_get(dev) : NULL;

So deleting eth0 first retargets only rt6i_idev to blackhole_netdev, sets
handled and calls list_del_init(), leaving dst.dev still holding the VRF
master or loopback device together with its dst.dev_tracker reference.

After the unlink, rt6_uncached_list_flush_dev() can no longer find that
route:

	ul = &table->buckets[hash_ptr(dev,
				      CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)];
	rt6_uncached_list_flush(ul, dev);
	rt6_uncached_list_flush(&table->mismatch, dev);

the route is on neither the keyed bucket nor mismatch, so a later teardown
of the VRF master or loopback never runs netdev_ref_replace() on it.  If the
dst is pinned past that point by sk_dst_cache or a queued skb, does
unregister_netdevice() then loop in netdev_wait_allrefs() printing
"unregister_netdevice: waiting for <dev> to become free", blocking the
netdev todo queue and netns teardown?

The reverse order looks symmetric: deleting the VRF master or loopback first
leaves the eth0 inet6_dev reference in place, which pins eth0 through
idev->dev_tracker.

This also matches the comment added just above:

	/* Routes that must be discoverable through two different devices. */
	struct uncached_list mismatch;

Would it be better to keep the route linked (or relink it into the surviving
device's bucket) until both device references captured at insertion time
have been retargeted, rather than unlinking on the first match?

The accompanying selftest only deletes eth0 and checks that the delete
completes promptly, so it would not observe the surviving reference on the
VRF master or loopback.

>  	}
> +	spin_unlock_bh(&ul->lock);
> +}
> +
>  static void rt6_uncached_list_flush_dev(struct net_device *dev)
>  {
>  	int cpu;
>  
>  	for_each_possible_cpu(cpu) {
> -		struct uncached_list *ul = per_cpu_ptr(&rt6_uncached_list, cpu);
> -		struct rt6_info *rt, *safe;
> +		struct rt6_uncached_table *table;
> +		struct uncached_list *ul;
>  
> +		table = per_cpu_ptr(&rt6_uncached_table, cpu);
> +		ul = &table->buckets[hash_ptr(dev,
> +					      CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)];
> +		rt6_uncached_list_flush(ul, dev);
> +		rt6_uncached_list_flush(&table->mismatch, dev);
>  	}
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260914-hash-bucket-route-lists-v2-0-29f6297d8a5a%40cloudflare.com
