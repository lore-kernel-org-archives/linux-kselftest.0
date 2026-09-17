Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E31B3A4523
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 22:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683126; cv=none; b=SPq9s2VrEH4xL1jgBUkNq6q9rW0b/y/y8bVhtb1U7uMBqYnex/Q//7/rva67ant8sva+v36BjV8Zf2fxNcX9T8AkhKafScoSkWY5oL4N7cPf+3vqTLp9VxtGeHj9o/6VuMch8wsdXLC0CAc9NRzY9IOgp4oKtjfD3Yk0lQXhcgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683126; c=relaxed/simple;
	bh=HIQv8brNzmzp6oSH9RiU8HsN+vHnBSGXSN47a34QNM0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UVUSSRtNwcN29zHrmDljg0a2vsuGNR8quik0t6TzCjlpnAqTAwcrFln03THJJyhePcgO3oHaGQaVCQYhfyKdV0aR5BkWTijyeQd7jBHmAG3Bizkct0J02BhxrSp9od2j5aR1n0UD4NRon7cwQkxdqhWyI44+DKopT9E5/dKKdIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ngs1+vCU; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ngs1+vCU"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so33231a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 15:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789683124; x=1790287924; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UYG2SrtB6EM+yhFk5h2ElEYvfaND8nBdx6rM334GIk=;
        b=ngs1+vCUWAaSiKuqwx09P1mHvPmabxs6PXwmUIfC41QNA234bkxVrswHB8SqQ7pR+C
         NNQXUEcKJrVPKwj/0pHTbO0HJ14RJFcx1+hsPzbpmzwEq6Dg+gQ29LNLamhdEMRScVD6
         cmxO1TsEK7Gno9flHvUjy0yWhGAt+CPErwHB4wW19BYV3lRyS2G/vUSnnFl3lBn/Nb2q
         fp7/AJ3uvFWz5wTtnHWTORr/a9vXYn8VoX2DDi7hDCgDUxXYiP7v3tC5a9T2XTeD2phX
         3ama0780iQY6ZpDdALFHFuLYsg+AtwUMKkR0/NjLr5fMzTnCptZRiw9NMsD1zcvJ1eFj
         XrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683124; x=1790287924;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UYG2SrtB6EM+yhFk5h2ElEYvfaND8nBdx6rM334GIk=;
        b=jw4lKoH+oac9MZgN4zLXLyDgvvlUKcM8Awcv9PeHP7B2A+IZHXB4/odtiLhFNjqwlA
         TNNCe4Z+KFUxNFTeiwRZz8WWdYZOUqg6EC5aXyY0ARpy4O9AWpBJC2jXDvXg3SlkkOm6
         xEtA3ci2S9ufMKYTxX/qpAHKe1eOUnwWikJ2vhtNWNTbj+tx5qmMVaCH4obQwPPTORdr
         rTF11kjsSGgnu0zTrb6kwhtikjmkKLPDCy9EwwG1MZNuCrXBOXiduwgLA/z43qq1NPtF
         wX5iG9DUkXQ8E+eusrMyRNnd8IrUNwwD5SOzEyueA041fcWGfRinZoz1ZSjLXx7fVko4
         s8Kg==
X-Forwarded-Encrypted: i=1; AKwUvBxJBA55UnsgOIdU+R3FwRFbHfyHriRf3uNg0mggTtzFDSkMxEJDpUu/EjS54r41NEd3/8lNzKvMocUtyzvFhPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lY23PiEcxTzUNodNbpI/wPVY2cXwvDqbJusfBWnu/oXde/n7eN
	pL4Pd4o+CB35e/2TV/2rDtc8pTpbC+Gq21rt15dmnf4Ciw6Bp5vdnTfokboIT6eiedomtVSz6mF
	dozOP1A==
X-Received: from pgbj4-n1.prod.google.com ([2002:a05:6a02:61c4:10b0:cc4:c4f7:5c56])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:b8b:b0:3d3:adbf:7780
 with SMTP id adf61e73a8af0-3dd8c41a009mr673980637.21.1789683123594; Thu, 17
 Sep 2026 15:12:03 -0700 (PDT)
Date: Thu, 17 Sep 2026 22:10:22 +0000
In-Reply-To: <20260917-hash-bucket-route-lists-v3-0-30493a37b6eb@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917-hash-bucket-route-lists-v3-0-30493a37b6eb@cloudflare.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917221203.1811779-1-kuniyu@google.com>
Subject: Re: [PATCH net-next v3 0/3] net: hash uncached route lists by device
From: Kuniyuki Iwashima <kuniyu@google.com>
To: carges@cloudflare.com
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, idosch@nvidia.com, kernel-team@cloudflare.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Chris J Arges <carges@cloudflare.com>
Date: Thu, 17 Sep 2026 14:38:21 -0500
> We have observed hung tasks blocked on rtnl_mutex while network namespaces
> were being removed. The namespaces contained many network devices, and the
> host had accumulated a large population of entries on the global per-CPU
> uncached route lists. A perf profile collected during one incident
> attributed most of the cleanup worker's samples to rt_flush_dev():
> 
> ```
> 99.92% kworker/u384:3-  worker_thread
>   `-88.71% process_one_work
>       `-81.02% cleanup_net
>           `-81.00% unregister_netdevice_many_notify
>               `-79.42% notifier_call_chain
>                   `-78.05% fib_netdev_event
>                       `-77.92% rt_flush_dev
> ```
> 
> For each device, rt_flush_dev() visits every possible CPU and scans the
> global uncached route population while its caller holds rtnl_mutex. If N is
> the number of devices, C the number of possible CPUs, and R the number of
> uncached routes, the cost is O(N * (C + R)).
> 
> During namespace cleanup, other processes that issue RTNETLINK operations
> requiring the RTNL lock can stall until cleanup releases the lock.
> 
> A minimal reproducer is available here:
> https://github.com/arges/linux-reproducers/tree/main/rtnl-flush-storm
> 
> This series replaces each per-CPU uncached route list with a hash table
> using the network device as its key. Each table uses 64 buckets.

This sounds a bit overkill.  Also, this series still leaves
O(N * C) loops.

Given unregistering a single device is less common than
destroying netns, I think the right approach should be to
make the route flush once in cleanup_net() + outside RTNL.

Could you try this change ? (only compile-tested)

---8<---
diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
index 46b4c67e2966..d8ce7dc0fbdc 100644
--- a/include/net/net_namespace.h
+++ b/include/net/net_namespace.h
@@ -489,6 +489,7 @@ struct pernet_operations {
 	 */
 	int (*init)(struct net *net);
 	void (*pre_exit)(struct net *net);
+	void (*pre_exit_batch)(struct list_head *net_exit_list);
 	void (*exit)(struct net *net);
 	void (*exit_batch)(struct list_head *net_exit_list);
 	/* Following method is called with RTNL held. */
diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index da5f881fbd3b..7fc9bf45f3b6 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -160,6 +160,9 @@ static void ops_pre_exit_list(const struct pernet_operations *ops,
 		list_for_each_entry(net, net_exit_list, exit_list)
 			ops->pre_exit(net);
 	}
+
+	if (ops->pre_exit_batch)
+		ops->pre_exit_batch(net_exit_list);
 }
 
 static void ops_exit_rtnl_list(const struct list_head *ops_list,
diff --git a/net/ipv4/fib_frontend.c b/net/ipv4/fib_frontend.c
index 8a3dc04e8cac..b8d76b6279e1 100644
--- a/net/ipv4/fib_frontend.c
+++ b/net/ipv4/fib_frontend.c
@@ -1685,6 +1685,11 @@ static void __net_exit fib_net_pre_exit(struct net *net)
 	nl_fib_lookup_exit(net);
 }
 
+static void __net_exit fib_net_pre_exit_batch(struct list_head *net_exit_list)
+{
+	rt_flush_dev(NULL);
+}
+
 static void __net_exit fib_net_exit_rtnl(struct net *net,
 					 struct list_head *dev_kill_list)
 {
@@ -1704,6 +1709,7 @@ static void __net_exit fib_net_exit(struct net *net)
 static struct pernet_operations fib_net_ops = {
 	.init = fib_net_init,
 	.pre_exit = fib_net_pre_exit,
+	.pre_exit_batch = fib_net_pre_exit_batch,
 	.exit_rtnl = fib_net_exit_rtnl,
 	.exit = fib_net_exit,
 };
diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index d7da2f1acbb5..d35b66b33bbc 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -1554,14 +1554,28 @@ struct uncached_list {
 
 static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt_uncached_list);
 
+static void rt_replace_uncached_list(struct rtable *rt)
+{
+	struct net_device *dev = dst_dev(&rt->dst);
+
+	rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
+	netdev_ref_replace(dev, blackhole_netdev,
+			   &rt->dst.dev_tracker, GFP_ATOMIC);
+}
+
 void rt_add_uncached_list(struct rtable *rt)
 {
 	struct uncached_list *ul = raw_cpu_ptr(&rt_uncached_list);
 
-	rt->dst.rt_uncached_list = ul;
-
 	spin_lock_bh(&ul->lock);
-	list_add_tail(&rt->dst.rt_uncached, &ul->head);
+
+	if (!check_net(dst_dev_net_rcu(&rt->dst))) {
+		rt_replace_uncached_list(rt);
+	} else {
+		rt->dst.rt_uncached_list = ul;
+		list_add_tail(&rt->dst.rt_uncached, &ul->head);
+	}
+
 	spin_unlock_bh(&ul->lock);
 }
 
@@ -1587,6 +1601,9 @@ void rt_flush_dev(struct net_device *dev)
 	struct rtable *rt, *safe;
 	int cpu;
 
+	if (dev && !check_net(dev_net(dev)))
+		return;
+
 	for_each_possible_cpu(cpu) {
 		struct uncached_list *ul = &per_cpu(rt_uncached_list, cpu);
 
@@ -1595,11 +1612,11 @@ void rt_flush_dev(struct net_device *dev)
 
 		spin_lock_bh(&ul->lock);
 		list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
-			if (rt->dst.dev != dev)
+			if (rt->dst.dev != dev &&
+			    (dev || check_net(dev_net(rt->dst.dev))))
 				continue;
-			rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
-			netdev_ref_replace(dev, blackhole_netdev,
-					   &rt->dst.dev_tracker, GFP_ATOMIC);
+
+			rt_replace_uncached_list(rt);
 			list_del_init(&rt->dst.rt_uncached);
 		}
 		spin_unlock_bh(&ul->lock);
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 7535b09068a0..28233197e1e1 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -135,14 +135,35 @@ struct uncached_list {
 
 static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt6_uncached_list);
 
+static void rt6_uncached_list_replace(struct rt6_info *rt)
+{
+	struct net_device *dev = dst_dev(&rt->dst);
+	struct inet6_dev *rt_idev = rt->rt6i_idev;
+
+	if (rt_idev) {
+		rt->rt6i_idev = in6_dev_get(blackhole_netdev);
+		in6_dev_put(rt_idev);
+	}
+
+	rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
+	netdev_ref_replace(dev, blackhole_netdev,
+			   &rt->dst.dev_tracker,
+			   GFP_ATOMIC);
+}
+
 void rt6_uncached_list_add(struct rt6_info *rt)
 {
 	struct uncached_list *ul = raw_cpu_ptr(&rt6_uncached_list);
 
-	rt->dst.rt_uncached_list = ul;
-
 	spin_lock_bh(&ul->lock);
-	list_add_tail(&rt->dst.rt_uncached, &ul->head);
+
+	if (!check_net(dst_dev_net_rcu(&rt->dst))) {
+		rt6_uncached_list_replace(rt);
+	} else {
+		rt->dst.rt_uncached_list = ul;
+		list_add_tail(&rt->dst.rt_uncached, &ul->head);
+	}
+
 	spin_unlock_bh(&ul->lock);
 }
 
@@ -161,6 +182,9 @@ static void rt6_uncached_list_flush_dev(struct net_device *dev)
 {
 	int cpu;
 
+	if (dev && !check_net(dev_net(dev)))
+		return;
+
 	for_each_possible_cpu(cpu) {
 		struct uncached_list *ul = per_cpu_ptr(&rt6_uncached_list, cpu);
 		struct rt6_info *rt, *safe;
@@ -172,23 +196,17 @@ static void rt6_uncached_list_flush_dev(struct net_device *dev)
 		list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
 			struct inet6_dev *rt_idev = rt->rt6i_idev;
 			struct net_device *rt_dev = rt->dst.dev;
-			bool handled = false;
 
-			if (rt_idev && rt_idev->dev == dev) {
-				rt->rt6i_idev = in6_dev_get(blackhole_netdev);
-				in6_dev_put(rt_idev);
-				handled = true;
+			if (dev) {
+				if (rt_dev != dev &&
+				    (!rt_idev || rt_idev->dev != dev))
+					continue;
+			} else if (check_net(dev_net(rt_dev))) {
+				continue;
 			}
 
-			if (rt_dev == dev) {
-				rt->dst.dev = blackhole_netdev;
-				netdev_ref_replace(rt_dev, blackhole_netdev,
-						   &rt->dst.dev_tracker,
-						   GFP_ATOMIC);
-				handled = true;
-			}
-			if (handled)
-				list_del_init(&rt->dst.rt_uncached);
+			rt6_uncached_list_replace(rt);
+			list_del_init(&rt->dst.rt_uncached);
 		}
 		spin_unlock_bh(&ul->lock);
 	}
@@ -6795,6 +6813,11 @@ static int __net_init ip6_route_net_init(struct net *net)
 	goto out;
 }
 
+static void __net_exit ip6_route_net_pre_exit_batch(struct list_head *net_exit_list)
+{
+	rt6_uncached_list_flush_dev(NULL);
+}
+
 static void __net_exit ip6_route_net_exit(struct net *net)
 {
 	kfree(net->ipv6.fib6_null_entry);
@@ -6833,6 +6856,7 @@ static void __net_exit ip6_route_net_exit_late(struct net *net)
 
 static struct pernet_operations ip6_route_net_ops = {
 	.init = ip6_route_net_init,
+	.pre_exit_batch = ip6_route_net_pre_exit_batch,
 	.exit = ip6_route_net_exit,
 };
 
---8<---
