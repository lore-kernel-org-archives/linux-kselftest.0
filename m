Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56C01F5842;
	Sat, 19 Sep 2026 02:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786135; cv=none; b=CNslOps6Govn7QKJF5gdDRrho7GX4gGp5iTS0Ckm5jSvucTqN2wWDtb4ZvD5EbC6mq75h4zqlqQa8YEzptG/GRDw0FVPXwe1+vH4PNW562CnlWBCG99xq6bszPcOhJ6t1I3ivjsbIka7bY3hHiKyXpgyfV/SQdS9YEOgzD3Xthg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786135; c=relaxed/simple;
	bh=e+fKUdStNDlVUr1AkKCbqcymZihuh49EDouecr8mpps=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V5+BxobvxSJBwyA/oY7sZTNWiegyFvZV1Suft3coWVnUSWDpU/6St5ePuvihpHV2A1BprFj+apQIM3lo4U9+b+Hx0LAhZQuWS6mYY3W2YXBGQFNW3OQ6o9T7UQ9i2onyDCGbydaLhgHXWId43le6FGp68JZ18sNsrijnhiHTOV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OROA7NmM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OROA7NmM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CA41F000FF;
	Sat, 19 Sep 2026 02:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789786133;
	bh=Sg3hkjaSEJduiZ/Scn0ZyJUoGBGD+r0DK/nqgxMbMbs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OROA7NmMo1WVWfjYpFybGN6QC30Q2ARZAdB3gBqvs/2UBJOqLYiPx4l2BnxHhbAQR
	 WcKSoEi/eVP1l+5tM9HRq8PcGrboMUI+m3vq/NLnsxDr5ury6FYnRb5q2S+chIPUPC
	 FcVOBK1rwikmOTwehDX+pCu9xE4A0gdgjEpfUVZ88zYWI66B4pDUWG1VpUbw8kW1Hv
	 JW7KfO6YO84P25hnh1EMcWVdEpEGDyzz3PWB2S9vKQbp1vbWFYsjgFbnxHvofy8DGD
	 9yHHVaumDvaXggbu6R+RO9EHmDqqBsWxJIdzqAZghsOJq1BW4LzFEZYz8a7uVLrc6K
	 yM/MiXXF3ZqAA==
Subject: Re: [PATCH net-next v2 1/3] ipv4: hash uncached routes by device
From: netdev-bot+sashiko@kernel.org
To: carges@cloudflare.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com
Date: Sat, 19 Sep 2026 02:48:52 +0000
Message-ID: <178978613205.22033.14339626208083556786@kernel.org>
In-Reply-To:
 <20260914-hash-bucket-route-lists-v2-1-29f6297d8a5a@cloudflare.com>
References:
 <20260914-hash-bucket-route-lists-v2-1-29f6297d8a5a@cloudflare.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 3

- [Low] Performance-only change submitted with no measurement of the
  benefit it claims.
- [Low] Concern that the identical full per-CPU walk remains for IPv6 in
  rt6_uncached_list_flush_dev(), so on dual-stack hosts the scaling…
- [Low] The patch introduces a prompted (user-visible) Kconfig integer,
  IP_UNCACHED_ROUTE_HASH_BITS (net/ipv4/Kconfig:106-117), which becomes…

--

ipv4: hash uncached routes by device

This replaces the per-CPU uncached route list in net/ipv4/route.c with a
per-CPU hash table keyed on the route's netdevice, so rt_flush_dev() only
walks the bucket matching the device being removed.  The bucket count is a
new build-time Kconfig value, IP_UNCACHED_ROUTE_HASH_BITS, defaulting to 6.

> diff --git a/net/ipv4/Kconfig b/net/ipv4/Kconfig
> index 301b47660305b..7d40ca22d2b21 100644
> --- a/net/ipv4/Kconfig
> +++ b/net/ipv4/Kconfig
> @@ -103,6 +103,19 @@ config IP_ROUTE_VERBOSE
>  config IP_ROUTE_CLASSID
>  	bool
>  
> +config IP_UNCACHED_ROUTE_HASH_BITS
> +	int "IPv4 uncached route hash bits"
> +	range 1 10
> +	default 6
> +	help
> +	  This option sets the number of buckets used in the IPv4 uncached
> +	  route hash table to 2^IP_UNCACHED_ROUTE_HASH_BITS buckets. The
> +	  allowed values select between 2 and 1024 buckets. Larger values
> +	  reduce collisions, but each additional bit doubles the per-CPU
> +	  memory used by the table.
> +
> +	  If unsure, use the default of 6 bits (64 buckets).
> +

[Severity: Low]
Could the reasoning for making the bucket count a prompted Kconfig value be
spelled out?  The bucket count is baked in at build time:

	#define RT_UNCACHED_HASH_SIZE	BIT(CONFIG_IP_UNCACHED_ROUTE_HASH_BITS)

	struct uncached_table {
		struct uncached_list buckets[RT_UNCACHED_HASH_SIZE];
	};

so this becomes a permanent user-visible interface.  Would a fixed constant,
or a size derived at ip_rt_init() time from nr_cpu_ids, work instead?

The help text says only "Larger values reduce collisions", which gives no
observable criterion for choosing a value, so is there anything a
distribution could measure to pick something other than the default?

Also, "range 1 10" allows 1 bit, i.e. two buckets.  Is that configuration
useful?  With two buckets the behaviour is essentially the pre-patch single
list plus a hash_ptr() call and one extra indirection in both
rt_add_uncached_list() and rt_flush_dev().  Should the low end of the range
start higher?

> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index d7da2f1acbb59..e28e2140cf621 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c

[ ... ]

> @@ -1552,11 +1553,21 @@ struct uncached_list {
>  	struct list_head	head;
>  };
>  
> -static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt_uncached_list);
> +#define RT_UNCACHED_HASH_SIZE	BIT(CONFIG_IP_UNCACHED_ROUTE_HASH_BITS)
> +
> +struct uncached_table {
> +	struct uncached_list buckets[RT_UNCACHED_HASH_SIZE];
> +};
> +
> +static DEFINE_PER_CPU_ALIGNED(struct uncached_table, rt_uncached_table);
>  
>  void rt_add_uncached_list(struct rtable *rt)
>  {
> -	struct uncached_list *ul = raw_cpu_ptr(&rt_uncached_list);
> +	struct uncached_table *table = raw_cpu_ptr(&rt_uncached_table);
> +	struct uncached_list *ul;
> +
> +	ul = &table->buckets[hash_ptr(dst_dev(&rt->dst),
> +				      CONFIG_IP_UNCACHED_ROUTE_HASH_BITS)];
>  
>  	rt->dst.rt_uncached_list = ul;

[Severity: Low]
Can before/after numbers be added for this?  The changelog motivates the
change entirely with "makes teardown increasingly expensive as the number of
devices grows", but there is no device count, no uncached route count, no
workload and no timing, so it is hard to tell at what scale the win appears.

The route insertion side also gets slightly more expensive and that is not
mentioned.  rt_add_uncached_list() now computes hash_ptr() and dereferences a
hash-selected bucket inside the per-CPU table instead of using a single
cacheline-aligned list head, and it is reached per uncached route creation
from rt_set_nexthop(), rt_cache_route(), ip_route_input_slow() and
xfrm4_fill_dst().  Was any effect measurable on those paths?

On the memory side, the changelog quantifies only the default in a
non-debug build ("approximately 1.5 KiB per possible CPU on x86-64"; 64
buckets x 24 bytes for struct uncached_list).  At the maximum allowed 10 bits
that is roughly 24 KiB per possible CPU, and with CONFIG_DEBUG_SPINLOCK or
CONFIG_DEBUG_LOCK_ALLOC struct uncached_list grows, multiplying both figures.
Could the changelog and the Kconfig help text state those cases too?

> @@ -1588,14 +1599,19 @@ void rt_flush_dev(struct net_device *dev)
>  	int cpu;
>  
>  	for_each_possible_cpu(cpu) {
> -		struct uncached_list *ul = &per_cpu(rt_uncached_list, cpu);
> +		struct uncached_table *table;
> +		struct uncached_list *ul;
> +
> +		table = per_cpu_ptr(&rt_uncached_table, cpu);
> +		ul = &table->buckets[hash_ptr(dev,
> +					      CONFIG_IP_UNCACHED_ROUTE_HASH_BITS)];
>  
>  		if (list_empty(&ul->head))
>  			continue;
>  
>  		spin_lock_bh(&ul->lock);
>  		list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
> -			if (rt->dst.dev != dev)
> +			if (dst_dev(&rt->dst) != dev)
>  				continue;

[Severity: Low]
On a dual-stack host, is the same walk still paid for IPv6 after this patch?
fib_netdev_event() calls rt_flush_dev() on NETDEV_UNREGISTER, and the same
device removal also drives rt6_uncached_list_flush_dev(), which still does
the full per-CPU list walk:

	for_each_possible_cpu(cpu) {
		struct uncached_list *ul = per_cpu_ptr(&rt6_uncached_list, cpu);

The IPv6 flush also matches on two keys, rt->rt6i_idev->dev and
rt->dst.dev, so it cannot be converted the same way without handling the
case where those differ.

Checking the rest of the series, the following patch "ipv6: hash uncached
routes by device" does convert rt6_uncached_list_flush_dev() to the same
per-CPU bucket scheme and handles the two-key case with a dedicated
"mismatch" list that rt6_uncached_list_add() uses when rt6i_idev->dev differs
from dst_dev(), and the third patch adds selftest coverage for the VRF case.
So this is addressed within the series; would it be worth a sentence in this
changelog noting that the IPv6 counterpart follows?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260914-hash-bucket-route-lists-v2-0-29f6297d8a5a%40cloudflare.com
