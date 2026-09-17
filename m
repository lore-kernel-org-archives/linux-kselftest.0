Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2AD3A453A
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 19:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789674120; cv=none; b=DJ5XJch5ga5eDF6+PnwU9phMTETX75xQbV/JdmOdguO196wSpVDzic9Hyair78JDWkLQdQD+mcjucq0m7EBx6gJp7RMQVB8RggAcCrC7zX0H8lpdzZ8g9FLUmr0+EpgM0dJFlXUFPQhfqS0wFBHQRW/a/NEgWzbimni4MYATdJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789674120; c=relaxed/simple;
	bh=1Hld9TTJWtGYH7lz5zyhGISa5kNpgl8anUJ7rsyBj7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVwbM4B7G5O6Us4A7rJQgiJku00+6XLtmH0oNrwg2esTZhycG+lsxj2ykdbCDKPqZ5Se5p114rU+vPHhNpJDTsr0RzmoZzkjfhE/vJ8gnTjwkJTA2eaVRl5ZfkHpYQ3Hp60pQ0F31h8mvDoPPRmMTvIoC0gB9F6LjkpKB0N43dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=J12JDEDt; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="J12JDEDt"
Received: by mail-oi2-f13.google.com with SMTP id 46e09a7af769-80a71781323so638950a34.1
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 12:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789674117; x=1790278917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ba0alAdQ5OcFzYxRU0k2u0VIIUxrq/p04mYsfJo2yyk=;
        b=J12JDEDtajYVcOGLiHdrJi9ZVTza7E2ZTtXZ/f5B6tqpGsm/uxSFwkDVFMYCF+mzEN
         T8ORxoj3f3DLanB1L/KNDYSV9a0PbC3z0g4TgrCbm3HxRDZz4gdyFSon4bZ4zgB+ff+F
         4RXMEc3lJbm52U5HbxyVF2lp9wPnDo4GUxCUGTeHCXdV+7wskzx4MxD12QulQ/1SQrNV
         tQ7hK1nSU3bsB8QGQLDI7j0xaj7t5SdNMWdWN6iqMT72L7+owM/lsXcWUWzTHylb1WQR
         ka065q8ZDTTwp/UaqfMBnNZGVtxieGaUOD9KKRaumSL9nHXJb+O9zQo6M18oDoCRBWh5
         J4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789674117; x=1790278917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ba0alAdQ5OcFzYxRU0k2u0VIIUxrq/p04mYsfJo2yyk=;
        b=Oz/I2OxvDm/KctCcFnyiXsVtuGP80jmVWxQbq9qGKeC8Pd1ZJnabezfFiQT0CimuWX
         Dk4UyCMk8rdDZQR4/bELQGjX3ktv+xGFs35Xj0tJQzm5BxU1q/HH4126ZjD4M7w9qs3M
         i1tf//raiDVF47J1YYZ+RjeQBxW61soRvqUIr8ulOBasJyThyCF0bp3ad1UOkNs9IKR8
         Y/VGb8k9Sh3NHivskODLZr1ZSwrlPxd9dBzw8kVzZhEt6Swar5H54Z+6MCQdtBi+nZWf
         icLX1UFJHlX7gE1zBHmjq8sJMNbqwKIyqLQG7EMm2PavgU83Ow1JNre6fGxv30XcUPoX
         kF9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmRZqm+zilTvjcDVSDHqjZ4WyfoTh/9VHMcxtHC8bZQyjPJ5dNO4EYKSEC/NisCo2NhBGaes2SzekBcLxkYHc=@vger.kernel.org
X-Gm-Message-State: AFuF++k/ckhBDbwDZVL3/92P7GsFEf3cIwKJRVgPg1xecLXgPpsu5ux8
	cklsA8jhBwOUAmefFmocXs0+VfnzJFp5pvUd/Yp5hTNlo8nNy/7tmBjIu24+/wKSSfk=
X-Gm-Gg: AYBFou2fGMbgyb8qs4Zad3kZNWxJS0L7q+xtT0KDbZxTe0357Tdwlmf4Dd/bER3MTZG
	S+yRaMzXzotrqLPliT5rOJqs6PiNlr97Er6e/7fZlGqLXiVaUhTByehoznQ8ThQB9sf3fm+J03M
	pILBcPqEhj8mIkLfa+XP+BQRvmBaGHwO8mmvh7pOzg8QIAD0kKmf7FhEgoIgNjl8AR2nLSwP5dj
	ZRtaDRrA3ymMhyptZIEq7D82mQlUdsiaKmimTkeoSch9WMlbdukEVkaZjH/WdSN6anKLxo6ks5T
	GNbLAlpP8uZcgD0cPx8r+NeI0+t7xizdortlv3Ux8kZvl9CkqyKYXakngC66AXhcSI6EcJNp1oW
	d2hsZjnLRSxF5tztnxmGQI2F2zLMi9ngXePyluO33A+6jgs//aYjoMmFvwf/aw2JTnOaNiHttJe
	2c3C7dUM2Sjb+FaLZhzmT6D2aIp+D7Q8QRvKqV4Z6eb7jYWlrv/Y+bAg==
X-Received: by 2002:a05:6830:2992:b0:7d7:ea9f:c0f9 with SMTP id 46e09a7af769-80ddcbb6051mr246243a34.0.1789674117330;
        Thu, 17 Sep 2026 12:41:57 -0700 (PDT)
Received: from 20HS2G4 ([2a09:bac6:bf21:2632::3ce:23])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80c472b4907sm3876403a34.22.2026.09.17.12.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:41:56 -0700 (PDT)
Date: Thu, 17 Sep 2026 14:41:54 -0500
From: Chris Arges <carges@cloudflare.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net-next v2 2/3] ipv6: hash uncached routes by device
Message-ID: <aqxCgm7lV4FruQho@20HS2G4>
References: <20260914-hash-bucket-route-lists-v2-0-29f6297d8a5a@cloudflare.com>
 <20260914-hash-bucket-route-lists-v2-2-29f6297d8a5a@cloudflare.com>
 <20260917101405.GA1202580@shredder>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917101405.GA1202580@shredder>

On 2026-09-17 13:14:05, Ido Schimmel wrote:
> On Mon, Sep 14, 2026 at 09:03:36PM -0500, Chris J Arges wrote:
> > rt6_uncached_list_flush_dev() currently walks every per-CPU uncached route
> > list for each device being removed. Hash uncached routes by their inet6
> > device so ordinary device teardown only visits the matching bucket on each
> > CPU.
> 
> The code is doing something else and hashing using dst_dev():
> 
> 	struct net_device *rt_dev = dst_dev(&rt->dst);
> [...]
> 		ul = &table->buckets[hash_ptr(rt_dev,
> 					      CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)];
> 
> > 
> > ip6_rt_get_dev_rcu() can return loopback or an L3 master while rt6i_idev
> > still refers to the original interface, so such a route must be reachable
> > from either device. Place those routes on a separate per-CPU list that is
> > always visited in addition to the keyed bucket.
> > 
> > This avoids growing struct rt6_info while filtering most unrelated routes
> > from ordinary device teardown.
> > 
> > The table has 2^CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS buckets and defaults
> > to 64. Larger values shorten each bucket, but every additional bit doubles
> > the per-CPU memory used by the table. The default costs approximately
> > 1.5 KiB per possible CPU on x86-64.
> > 
> > Signed-off-by: Chris J Arges <carges@cloudflare.com>
> > ---
> >  net/ipv6/Kconfig |  13 +++++++
> 
> Same comment as in patch 1 about the Kconfig.
> 
> >  net/ipv6/route.c | 102 +++++++++++++++++++++++++++++++++++++------------------
> >  2 files changed, 82 insertions(+), 33 deletions(-)
> > 
> > diff --git a/net/ipv6/Kconfig b/net/ipv6/Kconfig
> > index c3806c6ac96f..0253178668bd 100644
> > --- a/net/ipv6/Kconfig
> > +++ b/net/ipv6/Kconfig
> > @@ -18,6 +18,19 @@ menuconfig IPV6
> >  
> >  if IPV6
> >  
> > +config IPV6_UNCACHED_ROUTE_HASH_BITS
> > +	int "IPv6 uncached route hash bits"
> > +	range 1 10
> > +	default 6
> > +	help
> > +	  This option sets the number of buckets used in the IPv6 uncached
> > +	  route hash table to 2^IPV6_UNCACHED_ROUTE_HASH_BITS buckets. The
> > +	  allowed values select between 2 and 1024 buckets. Larger values
> > +	  reduce collisions, but each additional bit doubles the per-CPU
> > +	  memory used by the table.
> > +
> > +	  If unsure, use the default of 6 bits (64 buckets).
> > +
> >  config IPV6_ROUTER_PREF
> >  	bool "IPv6: Router Preference (RFC 4191) support"
> >  	help
> > diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> > index 7535b09068a0..080dce329168 100644
> > --- a/net/ipv6/route.c
> > +++ b/net/ipv6/route.c
> > @@ -40,6 +40,7 @@
> >  #include <linux/seq_file.h>
> >  #include <linux/nsproxy.h>
> >  #include <linux/slab.h>
> > +#include <linux/hash.h>
> >  #include <linux/jhash.h>
> >  #include <linux/siphash.h>
> >  #include <net/net_namespace.h>
> > @@ -133,11 +134,27 @@ struct uncached_list {
> >  	struct list_head	head;
> >  };
> >  
> > -static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt6_uncached_list);
> > +#define RT6_UNCACHED_HASH_SIZE	BIT(CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)
> > +
> > +struct rt6_uncached_table {
> > +	struct uncached_list buckets[RT6_UNCACHED_HASH_SIZE];
> > +	/* Routes that must be discoverable through two different devices. */
> > +	struct uncached_list mismatch;
> > +};
> > +
> > +static DEFINE_PER_CPU_ALIGNED(struct rt6_uncached_table, rt6_uncached_table);
> >  
> >  void rt6_uncached_list_add(struct rt6_info *rt)
> >  {
> > -	struct uncached_list *ul = raw_cpu_ptr(&rt6_uncached_list);
> > +	struct rt6_uncached_table *table = raw_cpu_ptr(&rt6_uncached_table);
> > +	struct net_device *rt_dev = dst_dev(&rt->dst);
> > +	struct uncached_list *ul;
> > +
> > +	if (rt->rt6i_idev && rt->rt6i_idev->dev != rt_dev)
> > +		ul = &table->mismatch;
> > +	else
> > +		ul = &table->buckets[hash_ptr(rt_dev,
> > +					      CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)];
> >  
> >  	rt->dst.rt_uncached_list = ul;
> >  
> > @@ -157,40 +174,51 @@ void rt6_uncached_list_del(struct rt6_info *rt)
> >  	}
> >  }
> >  
> > +static void rt6_uncached_list_flush(struct uncached_list *ul,
> > +				    struct net_device *dev)
> > +{
> > +	struct rt6_info *rt, *safe;
> > +
> > +	if (list_empty(&ul->head))
> > +		return;
> > +
> > +	spin_lock_bh(&ul->lock);
> > +	list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
> > +		struct inet6_dev *rt_idev = rt->rt6i_idev;
> > +		struct net_device *rt_dev = dst_dev(&rt->dst);
> > +		bool handled = false;
> 
> https://docs.kernel.org/next/process/maintainer-netdev.html#local-variable-ordering-reverse-xmas-tree-rcs
> 
> > +
> > +		if (rt_idev && rt_idev->dev == dev) {
> > +			rt->rt6i_idev = in6_dev_get(blackhole_netdev);
> > +			in6_dev_put(rt_idev);
> > +			handled = true;
> > +		}
> > +
> > +		if (rt_dev == dev) {
> > +			rt->dst.dev = blackhole_netdev;
> 
> Please use:
> 
> rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
> 
> See commit 1469773b246a ("ipv4: use rcu_assign_pointer() in
> rt_flush_dev()")
> 
> > +			netdev_ref_replace(rt_dev, blackhole_netdev,
> > +					   &rt->dst.dev_tracker, GFP_ATOMIC);
> > +			handled = true;
> > +		}
> > +		if (handled)
> > +			list_del_init(&rt->dst.rt_uncached);
> > +	}
> > +	spin_unlock_bh(&ul->lock);
> > +}
> > +
> >  static void rt6_uncached_list_flush_dev(struct net_device *dev)
> >  {
> >  	int cpu;
> >  
> >  	for_each_possible_cpu(cpu) {
> > -		struct uncached_list *ul = per_cpu_ptr(&rt6_uncached_list, cpu);
> > -		struct rt6_info *rt, *safe;
> > +		struct rt6_uncached_table *table;
> > +		struct uncached_list *ul;
> >  
> > -		if (list_empty(&ul->head))
> > -			continue;
> > -
> > -		spin_lock_bh(&ul->lock);
> > -		list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
> > -			struct inet6_dev *rt_idev = rt->rt6i_idev;
> > -			struct net_device *rt_dev = rt->dst.dev;
> > -			bool handled = false;
> > -
> > -			if (rt_idev && rt_idev->dev == dev) {
> > -				rt->rt6i_idev = in6_dev_get(blackhole_netdev);
> > -				in6_dev_put(rt_idev);
> > -				handled = true;
> > -			}
> > -
> > -			if (rt_dev == dev) {
> > -				rt->dst.dev = blackhole_netdev;
> > -				netdev_ref_replace(rt_dev, blackhole_netdev,
> > -						   &rt->dst.dev_tracker,
> > -						   GFP_ATOMIC);
> > -				handled = true;
> > -			}
> > -			if (handled)
> > -				list_del_init(&rt->dst.rt_uncached);
> > -		}
> > -		spin_unlock_bh(&ul->lock);
> > +		table = per_cpu_ptr(&rt6_uncached_table, cpu);
> > +		ul = &table->buckets[hash_ptr(dev,
> > +					      CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)];
> > +		rt6_uncached_list_flush(ul, dev);
> > +		rt6_uncached_list_flush(&table->mismatch, dev);
> 
> The mismatch list can be quite long depending on the workload and every
> device needs to walk it for every CPU.
> 
> AFAICT, when there is a mismatch, dst_dev() is either loopback or a VRF
> device. Can you instead hash based on rt6i_idev->dev (fallback to
> dst_dev() when not available) and only iterate over all the buckets when
> the device that is going away is loopback / VRF?
> 
> That way, in the common case, you only need to walk one list per-CPU.

Ido,
Yea I like this approach much better. Thank you for the reviews.
I've re-tested and implemented your feedback into v3:
https://lore.kernel.org/all/20260917-hash-bucket-route-lists-v3-0-30493a37b6eb@cloudflare.com/
--chris
