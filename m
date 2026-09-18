Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95FE332EA0
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 00:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789691928; cv=none; b=oOk1a2sDVkd8uPeZCmI6BZ3VJYbINoetl3gbq96ZWjiccrDE6m3hq2eU13AP4faDg8wdX8SxcInGoIp8JFeoxIVCKb8ZSk/bL88tUuPGEbdLm0lvsp6n7pqQkXPuyMrGaYeCIyBlgH3q3xCUBFGn0p7/Kyiu2JBotPld1a/MZRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789691928; c=relaxed/simple;
	bh=E6fPwDdzy5LiQlZlar/Y+mL5JhfsBh0GO85CGQeu/vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=En2g+2pIve2S3UAMwwrvlEbTgfVuiNPwvx94HBIMWI/aY4ZNEPpzYyh+/hKN8RPxglegGpIFBnlg5GVQlCy2xMrTvR/O9ot5V9nXDIRtYl8Bmv00dDsIIR94r+C2T85VY1d0Qvz8hbTikoOpw4u5bzpzyk9ElvVpH1yc2vasu8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=UiWJ64jp; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="UiWJ64jp"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-4693691fc81so157812fac.3
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 17:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789691924; x=1790296724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GhJozD00AthdOkRnEqQ3NsR2mVTBAHP+/jT0CI2Cd9Q=;
        b=UiWJ64jpGkGphARJEsNagOaQfmO5BKCaKyiGtXzplXf/vXZQmf2KuEEHTCgX+V4PCk
         NCmRwATSKiwhsHWUDtQJqWQsik9ag3hJKypMbbXYNq1mNucJn/Wm/5YrsjlR1tY1Z1UK
         d4yn5+jRA/TBKsGsmanM721FgkUXQWRoyH+jG/UJVmfGiGQ3U5gNpX0H1EyEEH2CYqfA
         BdL4berwnkKkoeqhLVOmyKX4dcG225jfXgt4aGcsNYE+jYl5jmrGVKMgco8Ygu9o3Xy3
         1nLK0/JQe3ejuVKIjMlAyN6fVv8DwA8gcbCJMF2+vLHKd/hKzXpB0FSrJyCpddAn3jQv
         9SsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789691924; x=1790296724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GhJozD00AthdOkRnEqQ3NsR2mVTBAHP+/jT0CI2Cd9Q=;
        b=Q445cLVXsZ8D79jEYQxv9d9vehxoLYZaSl6a4VODg4tU8Dyq3vniQ18l4jc5Tk+EOU
         /XnakqOLInz86PJiU8lse2QNZcGjKM6TDe7x2iM+tlC26Z6wP0sMFZORpGGmPgsl6Xsz
         LC0an9Auo75xVMuQ2f1IpEWtgeGWMcQemlhbi4X1XLlNBkveLVIau1+XRDAR5yiLEhFj
         kE3oahYCF+Qv9mf0n74ZVsDM0Si9aXsVVEKrJav3Hvh469mhr8ikPAhAklwJh6+foz9y
         ZdsL2jfay5i3dk0KZ8b2nu7xALQ9xP7Nir46rQc5cW6JD2+qQPymnbfvOXHjMombLuGz
         HgsQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4jDnENGcsNyJjbnicGZX52dLYNcyJolf8Bp9ZASjv6JeqTOe0qjRgxZufQqCoAWWUDNmPJi8ZOvqtJUdSz/I=@vger.kernel.org
X-Gm-Message-State: AFuF++mp85+QIlEdMk0Ld+nWNedL/9Rcip2YYilPEsvnozBB0Wnw71Oj
	2vzpUw2M/mWJRmfuyuVV0Ed9QVnJpt0KgWc5QumjgLskCR0FJUWLfqq2ppf7w3Qrrn4=
X-Gm-Gg: AYBFou0bRC8tydcqBg4F+WiKKwHQZtQMUqx7QKY9gJPTtd4iz9iTMRYH3vYu1KSGniM
	fXtlLDehWAktlNhhfRzxztVYPr1CcVNwyeOOVSYA3FSZoUSK8J6HYcqFdE67l+YiTOngXQ3Twql
	lduN2tZVS1Mr84F5ysB/ZpY7vHsb0kNsQgZe+4g0Ng+X0Z5fKix/kNT4oEr0blvUVdU6Kerp3Dq
	RkYsnywqP0LdUbk4nBi5xwb5+/rfYMIvYIbcvF+Cj1vfN0IPVsnXLoa7pFSgu69r4b0nX1+f/9Y
	mgFYQf/0+j2UjodLJcTpWDUOHkAIcSbpWsN9TWiMklb74ysh37oJ7fdxvofQJYYPi2xk6B726Qw
	w3XFuPJowOO1ftLqbngAnjDFfwPiUD3Aj8yVl9qg7rqwBy6ahvx9WsszrPJIPbOWYOkMb0Td4Ei
	9DTFDIS24U2xRhgmahP2+f7GEZAxydJhyJ6VyyZAf8jLdOBTOKKmeKvWw=
X-Received: by 2002:a05:6808:13d6:b0:4b9:a829:f01c with SMTP id 5614622812f47-4ccf7debfcbmr1187229b6e.40.1789691924404;
        Thu, 17 Sep 2026 17:38:44 -0700 (PDT)
Received: from 20HS2G4 ([2a09:bac6:bf21:3064::4d2:22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e52361af9sm120381a34.26.2026.09.17.17.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 17:38:43 -0700 (PDT)
Date: Thu, 17 Sep 2026 19:38:40 -0500
From: Chris Arges <carges@cloudflare.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com,
	horms@kernel.org, idosch@nvidia.com, kernel-team@cloudflare.com,
	kuba@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, shuah@kernel.org
Subject: Re: [PATCH net-next v3 0/3] net: hash uncached route lists by device
Message-ID: <aqyIEE5bRoxRyrFZ@20HS2G4>
References: <20260917-hash-bucket-route-lists-v3-0-30493a37b6eb@cloudflare.com>
 <20260917221203.1811779-1-kuniyu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917221203.1811779-1-kuniyu@google.com>

On 2026-09-17 22:10:22, Kuniyuki Iwashima wrote:
> From: Chris J Arges <carges@cloudflare.com>
> Date: Thu, 17 Sep 2026 14:38:21 -0500
> > We have observed hung tasks blocked on rtnl_mutex while network namespaces
> > were being removed. The namespaces contained many network devices, and the
> > host had accumulated a large population of entries on the global per-CPU
> > uncached route lists. A perf profile collected during one incident
> > attributed most of the cleanup worker's samples to rt_flush_dev():
> > 
> > ```
> > 99.92% kworker/u384:3-  worker_thread
> >   `-88.71% process_one_work
> >       `-81.02% cleanup_net
> >           `-81.00% unregister_netdevice_many_notify
> >               `-79.42% notifier_call_chain
> >                   `-78.05% fib_netdev_event
> >                       `-77.92% rt_flush_dev
> > ```
> > 
> > For each device, rt_flush_dev() visits every possible CPU and scans the
> > global uncached route population while its caller holds rtnl_mutex. If N is
> > the number of devices, C the number of possible CPUs, and R the number of
> > uncached routes, the cost is O(N * (C + R)).
> > 
> > During namespace cleanup, other processes that issue RTNETLINK operations
> > requiring the RTNL lock can stall until cleanup releases the lock.
> > 
> > A minimal reproducer is available here:
> > https://github.com/arges/linux-reproducers/tree/main/rtnl-flush-storm
> > 
> > This series replaces each per-CPU uncached route list with a hash table
> > using the network device as its key. Each table uses 64 buckets.
> 
> This sounds a bit overkill.  Also, this series still leaves
> O(N * C) loops.
> 
> Given unregistering a single device is less common than
> destroying netns, I think the right approach should be to
> make the route flush once in cleanup_net() + outside RTNL.
> 
> Could you try this change ? (only compile-tested)
> 
Excellent, I'll test this and report back.
Thanks,
--chris


> ---8<---
> diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
> index 46b4c67e2966..d8ce7dc0fbdc 100644
> --- a/include/net/net_namespace.h
> +++ b/include/net/net_namespace.h
> @@ -489,6 +489,7 @@ struct pernet_operations {
>  	 */
>  	int (*init)(struct net *net);
>  	void (*pre_exit)(struct net *net);
> +	void (*pre_exit_batch)(struct list_head *net_exit_list);
>  	void (*exit)(struct net *net);
>  	void (*exit_batch)(struct list_head *net_exit_list);
>  	/* Following method is called with RTNL held. */
> diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
> index da5f881fbd3b..7fc9bf45f3b6 100644
> --- a/net/core/net_namespace.c
> +++ b/net/core/net_namespace.c
> @@ -160,6 +160,9 @@ static void ops_pre_exit_list(const struct pernet_operations *ops,
>  		list_for_each_entry(net, net_exit_list, exit_list)
>  			ops->pre_exit(net);
>  	}
> +
> +	if (ops->pre_exit_batch)
> +		ops->pre_exit_batch(net_exit_list);
>  }
>  
>  static void ops_exit_rtnl_list(const struct list_head *ops_list,
> diff --git a/net/ipv4/fib_frontend.c b/net/ipv4/fib_frontend.c
> index 8a3dc04e8cac..b8d76b6279e1 100644
> --- a/net/ipv4/fib_frontend.c
> +++ b/net/ipv4/fib_frontend.c
> @@ -1685,6 +1685,11 @@ static void __net_exit fib_net_pre_exit(struct net *net)
>  	nl_fib_lookup_exit(net);
>  }
>  
> +static void __net_exit fib_net_pre_exit_batch(struct list_head *net_exit_list)
> +{
> +	rt_flush_dev(NULL);
> +}
> +
>  static void __net_exit fib_net_exit_rtnl(struct net *net,
>  					 struct list_head *dev_kill_list)
>  {
> @@ -1704,6 +1709,7 @@ static void __net_exit fib_net_exit(struct net *net)
>  static struct pernet_operations fib_net_ops = {
>  	.init = fib_net_init,
>  	.pre_exit = fib_net_pre_exit,
> +	.pre_exit_batch = fib_net_pre_exit_batch,
>  	.exit_rtnl = fib_net_exit_rtnl,
>  	.exit = fib_net_exit,
>  };
> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index d7da2f1acbb5..d35b66b33bbc 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -1554,14 +1554,28 @@ struct uncached_list {
>  
>  static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt_uncached_list);
>  
> +static void rt_replace_uncached_list(struct rtable *rt)
> +{
> +	struct net_device *dev = dst_dev(&rt->dst);
> +
> +	rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
> +	netdev_ref_replace(dev, blackhole_netdev,
> +			   &rt->dst.dev_tracker, GFP_ATOMIC);
> +}
> +
>  void rt_add_uncached_list(struct rtable *rt)
>  {
>  	struct uncached_list *ul = raw_cpu_ptr(&rt_uncached_list);
>  
> -	rt->dst.rt_uncached_list = ul;
> -
>  	spin_lock_bh(&ul->lock);
> -	list_add_tail(&rt->dst.rt_uncached, &ul->head);
> +
> +	if (!check_net(dst_dev_net_rcu(&rt->dst))) {
> +		rt_replace_uncached_list(rt);
> +	} else {
> +		rt->dst.rt_uncached_list = ul;
> +		list_add_tail(&rt->dst.rt_uncached, &ul->head);
> +	}
> +
>  	spin_unlock_bh(&ul->lock);
>  }
>  
> @@ -1587,6 +1601,9 @@ void rt_flush_dev(struct net_device *dev)
>  	struct rtable *rt, *safe;
>  	int cpu;
>  
> +	if (dev && !check_net(dev_net(dev)))
> +		return;
> +
>  	for_each_possible_cpu(cpu) {
>  		struct uncached_list *ul = &per_cpu(rt_uncached_list, cpu);
>  
> @@ -1595,11 +1612,11 @@ void rt_flush_dev(struct net_device *dev)
>  
>  		spin_lock_bh(&ul->lock);
>  		list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
> -			if (rt->dst.dev != dev)
> +			if (rt->dst.dev != dev &&
> +			    (dev || check_net(dev_net(rt->dst.dev))))
>  				continue;
> -			rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
> -			netdev_ref_replace(dev, blackhole_netdev,
> -					   &rt->dst.dev_tracker, GFP_ATOMIC);
> +
> +			rt_replace_uncached_list(rt);
>  			list_del_init(&rt->dst.rt_uncached);
>  		}
>  		spin_unlock_bh(&ul->lock);
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 7535b09068a0..28233197e1e1 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -135,14 +135,35 @@ struct uncached_list {
>  
>  static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt6_uncached_list);
>  
> +static void rt6_uncached_list_replace(struct rt6_info *rt)
> +{
> +	struct net_device *dev = dst_dev(&rt->dst);
> +	struct inet6_dev *rt_idev = rt->rt6i_idev;
> +
> +	if (rt_idev) {
> +		rt->rt6i_idev = in6_dev_get(blackhole_netdev);
> +		in6_dev_put(rt_idev);
> +	}
> +
> +	rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
> +	netdev_ref_replace(dev, blackhole_netdev,
> +			   &rt->dst.dev_tracker,
> +			   GFP_ATOMIC);
> +}
> +
>  void rt6_uncached_list_add(struct rt6_info *rt)
>  {
>  	struct uncached_list *ul = raw_cpu_ptr(&rt6_uncached_list);
>  
> -	rt->dst.rt_uncached_list = ul;
> -
>  	spin_lock_bh(&ul->lock);
> -	list_add_tail(&rt->dst.rt_uncached, &ul->head);
> +
> +	if (!check_net(dst_dev_net_rcu(&rt->dst))) {
> +		rt6_uncached_list_replace(rt);
> +	} else {
> +		rt->dst.rt_uncached_list = ul;
> +		list_add_tail(&rt->dst.rt_uncached, &ul->head);
> +	}
> +
>  	spin_unlock_bh(&ul->lock);
>  }
>  
> @@ -161,6 +182,9 @@ static void rt6_uncached_list_flush_dev(struct net_device *dev)
>  {
>  	int cpu;
>  
> +	if (dev && !check_net(dev_net(dev)))
> +		return;
> +
>  	for_each_possible_cpu(cpu) {
>  		struct uncached_list *ul = per_cpu_ptr(&rt6_uncached_list, cpu);
>  		struct rt6_info *rt, *safe;
> @@ -172,23 +196,17 @@ static void rt6_uncached_list_flush_dev(struct net_device *dev)
>  		list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
>  			struct inet6_dev *rt_idev = rt->rt6i_idev;
>  			struct net_device *rt_dev = rt->dst.dev;
> -			bool handled = false;
>  
> -			if (rt_idev && rt_idev->dev == dev) {
> -				rt->rt6i_idev = in6_dev_get(blackhole_netdev);
> -				in6_dev_put(rt_idev);
> -				handled = true;
> +			if (dev) {
> +				if (rt_dev != dev &&
> +				    (!rt_idev || rt_idev->dev != dev))
> +					continue;
> +			} else if (check_net(dev_net(rt_dev))) {
> +				continue;
>  			}
>  
> -			if (rt_dev == dev) {
> -				rt->dst.dev = blackhole_netdev;
> -				netdev_ref_replace(rt_dev, blackhole_netdev,
> -						   &rt->dst.dev_tracker,
> -						   GFP_ATOMIC);
> -				handled = true;
> -			}
> -			if (handled)
> -				list_del_init(&rt->dst.rt_uncached);
> +			rt6_uncached_list_replace(rt);
> +			list_del_init(&rt->dst.rt_uncached);
>  		}
>  		spin_unlock_bh(&ul->lock);
>  	}
> @@ -6795,6 +6813,11 @@ static int __net_init ip6_route_net_init(struct net *net)
>  	goto out;
>  }
>  
> +static void __net_exit ip6_route_net_pre_exit_batch(struct list_head *net_exit_list)
> +{
> +	rt6_uncached_list_flush_dev(NULL);
> +}
> +
>  static void __net_exit ip6_route_net_exit(struct net *net)
>  {
>  	kfree(net->ipv6.fib6_null_entry);
> @@ -6833,6 +6856,7 @@ static void __net_exit ip6_route_net_exit_late(struct net *net)
>  
>  static struct pernet_operations ip6_route_net_ops = {
>  	.init = ip6_route_net_init,
> +	.pre_exit_batch = ip6_route_net_pre_exit_batch,
>  	.exit = ip6_route_net_exit,
>  };
>  
> ---8<---
