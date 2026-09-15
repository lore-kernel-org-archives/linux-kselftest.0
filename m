Received: from mail-oo2-f16.google.com (mail-oo2-f16.google.com [74.125.231.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470223D4107
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 02:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437840; cv=none; b=lDeZnWNcfy7689wEgtK30P2rg1Otk6x7aUoEKou3yNxuz0at7VTEsYW3xBF+U6jYydEMknYwMB3f6wbZrdBt6SvixMj0VOxiXBL60TQThGe4x68VyGcg+e2Fua3L1yFBFGD27rQVd73Ht27D2f3Rf3rfD7a2Tu5c0PxCTVti9zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437840; c=relaxed/simple;
	bh=ujawG8SxKb6jFUdKWZQvD9jJs2Uc4neq7Xq9fXpMjTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MtZT4YMwB9iZvgT5r+uI/jJCt+HyMoiEzpZOg+dKdVDoTf2ZTEdPrv9oaeHR46bGx3pRO1Zusq1MK6wtlR7GlUl0wrDH6viRJjYH4KY/ZsaPqvn+6WHlFVEd3V1mvv0rbfqRwWz23YQqz+30tAR2YIA2ABZ97CaFezFKIaSValo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=BeipdoP2; arc=none smtp.client-ip=74.125.231.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="BeipdoP2"
Received: by mail-oo2-f16.google.com with SMTP id 46e09a7af769-805bf8c2661so1825892a34.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 19:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789437837; x=1790042637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gC8oQEQoLs54N5KYcANahGyWqaEmEB/cMaxCtlcefw=;
        b=BeipdoP23Oimdl5L4N6lT4grG9LA5YRqY2WYhO689wsx2ElUSYyFhCYo6wK7lc2aQI
         BkZMEfpvEHfly4MYoWtJnF7gbzxtZLWhuqIfV7RdXpMNMO7o5e4k/+WwVe9gOCIULIFG
         2ZZP6lmUDrrahG/dcKfh2VuQR2ev+wy7oGc3c2/QCUeVx4yXO6PwdedTV1IEyDYpzUFD
         W/TlCDCGMeuxw8LRbIy6WL+tvrNtuPabu48cXMo7wPwFPw6q0+7UJH6PhZmklvpSp/uY
         32y03OyX/xLLIgiyh3Qo8KaOYigYI3fWYcAvF/iWkGAUNTqWEVWT3Qf2nUTRpnHrBX/N
         kLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437837; x=1790042637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gC8oQEQoLs54N5KYcANahGyWqaEmEB/cMaxCtlcefw=;
        b=n+umXr5sAjNqqnZdKMvxmC0lbyCvT5Gs0PLE7u8j9SGJVk/PdgItS6JOvkMm+i1+G+
         Wd5WE8leXC3EJ62SfMTuDCU4k02AofUNA0HbmVgxDp7YDFgDQlvs4/yHHKiuKF2mLf3U
         NJqgxyUdXp4FiuJS7ndybX1aegt/mz/xCxoJRcyam6jVhBbLtPdfYuZ43wSLelWZG7lt
         2Pbaq6tD2uUPheF+4zY3fvpQT+a66dWU41snsPi7G7EBF1Z13nsfpfm32uoVPgwwbAV/
         xoPS/klL96hejeiVN0DjHTS+1kzTdmF6m3ZHQtAaubnc7+a9SUxfwEZMgnqtGEhyoasR
         GsMA==
X-Forwarded-Encrypted: i=1; AKwUvBywgl93ARba5J2fppXrchJZ67nw7ZfqlaiEDsjK2OrOOhqVzWefSbaXfTU7cjQ6eRvlBB3b1PlvH8heHXu3RLM=@vger.kernel.org
X-Gm-Message-State: AFuF++kVsLqo1zTGFxWBor3T5tUwtU4Tqysm28xhsOJv104kpniXzLJP
	KqlMiFjORN7s4RJ//4DeuT5EvvFAhrTV0prsVlfalC0lZRm8qIpZpsenF7b/ouKvLLQ=
X-Gm-Gg: AYBFou0DktLc7eO5zyX1vTDTxpm9piyVKZZ5B+GNwi7Bco7wE7gpFq5Gw6ahPldRmYo
	nkH3/LLt6ig+Yt5k4NHF/aRoLW9btybF6j2ggED9nmytp4cmxvM2Gsi9HB57HdpRIiBeBuA+W+c
	+BBq5LExuMVyq0UdEH8IEfr1EcZtn4V4CNPtQkUllFO3AYDwLvlLLYH3Pb8QOCjrgG+XyWh9zQb
	msboxMF11PFhGTxKdw9+QrB4/rEfqRiQRZ/sOTSveUiJof0FJK3gFPTg+GXOXGA5u3MnCuCOg1c
	94F83IokXW2/xPLkxi8VEMH1w/I7YYNhjNv4DhoyU/RXM+qetcZtGfTZShPHcPZg9vb4LvZeS2+
	czcLcR16PjV0o5tiYCs1xJX4N2m8ubzpHrorZJF4/n05wOLyXdAY3B3o6gzute2ce6rkqLOx9us
	hgB58E8U2hGNvJuieR1FQAI2PH9asNPI2L3WpQoJrugWTRdgGs+YxOzvMdCLIZfQ==
X-Received: by 2002:a05:6830:4c07:b0:7f4:bae7:b00d with SMTP id 46e09a7af769-808945f12efmr3412972a34.0.1789437836931;
        Mon, 14 Sep 2026 19:03:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:bf21:2e46::49c:4c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-804de582afcsm10795696a34.16.2026.09.14.19.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:03:55 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
Date: Mon, 14 Sep 2026 21:03:36 -0500
Subject: [PATCH net-next v2 2/3] ipv6: hash uncached routes by device
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-hash-bucket-route-lists-v2-2-29f6297d8a5a@cloudflare.com>
References: <20260914-hash-bucket-route-lists-v2-0-29f6297d8a5a@cloudflare.com>
In-Reply-To: <20260914-hash-bucket-route-lists-v2-0-29f6297d8a5a@cloudflare.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789437828; l=6072;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=ujawG8SxKb6jFUdKWZQvD9jJs2Uc4neq7Xq9fXpMjTk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBIPZmYi/sxYsGJ+GBEi9RpcnUOfNENWfcAEBRI0yRIK/m6M0T0P9ATIIgs0dNBlC15gOaDi206
 nXVi/+P749Q8=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M

rt6_uncached_list_flush_dev() currently walks every per-CPU uncached route
list for each device being removed. Hash uncached routes by their inet6
device so ordinary device teardown only visits the matching bucket on each
CPU.

ip6_rt_get_dev_rcu() can return loopback or an L3 master while rt6i_idev
still refers to the original interface, so such a route must be reachable
from either device. Place those routes on a separate per-CPU list that is
always visited in addition to the keyed bucket.

This avoids growing struct rt6_info while filtering most unrelated routes
from ordinary device teardown.

The table has 2^CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS buckets and defaults
to 64. Larger values shorten each bucket, but every additional bit doubles
the per-CPU memory used by the table. The default costs approximately
1.5 KiB per possible CPU on x86-64.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
 net/ipv6/Kconfig |  13 +++++++
 net/ipv6/route.c | 102 +++++++++++++++++++++++++++++++++++++------------------
 2 files changed, 82 insertions(+), 33 deletions(-)

diff --git a/net/ipv6/Kconfig b/net/ipv6/Kconfig
index c3806c6ac96f..0253178668bd 100644
--- a/net/ipv6/Kconfig
+++ b/net/ipv6/Kconfig
@@ -18,6 +18,19 @@ menuconfig IPV6
 
 if IPV6
 
+config IPV6_UNCACHED_ROUTE_HASH_BITS
+	int "IPv6 uncached route hash bits"
+	range 1 10
+	default 6
+	help
+	  This option sets the number of buckets used in the IPv6 uncached
+	  route hash table to 2^IPV6_UNCACHED_ROUTE_HASH_BITS buckets. The
+	  allowed values select between 2 and 1024 buckets. Larger values
+	  reduce collisions, but each additional bit doubles the per-CPU
+	  memory used by the table.
+
+	  If unsure, use the default of 6 bits (64 buckets).
+
 config IPV6_ROUTER_PREF
 	bool "IPv6: Router Preference (RFC 4191) support"
 	help
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 7535b09068a0..080dce329168 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -40,6 +40,7 @@
 #include <linux/seq_file.h>
 #include <linux/nsproxy.h>
 #include <linux/slab.h>
+#include <linux/hash.h>
 #include <linux/jhash.h>
 #include <linux/siphash.h>
 #include <net/net_namespace.h>
@@ -133,11 +134,27 @@ struct uncached_list {
 	struct list_head	head;
 };
 
-static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt6_uncached_list);
+#define RT6_UNCACHED_HASH_SIZE	BIT(CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)
+
+struct rt6_uncached_table {
+	struct uncached_list buckets[RT6_UNCACHED_HASH_SIZE];
+	/* Routes that must be discoverable through two different devices. */
+	struct uncached_list mismatch;
+};
+
+static DEFINE_PER_CPU_ALIGNED(struct rt6_uncached_table, rt6_uncached_table);
 
 void rt6_uncached_list_add(struct rt6_info *rt)
 {
-	struct uncached_list *ul = raw_cpu_ptr(&rt6_uncached_list);
+	struct rt6_uncached_table *table = raw_cpu_ptr(&rt6_uncached_table);
+	struct net_device *rt_dev = dst_dev(&rt->dst);
+	struct uncached_list *ul;
+
+	if (rt->rt6i_idev && rt->rt6i_idev->dev != rt_dev)
+		ul = &table->mismatch;
+	else
+		ul = &table->buckets[hash_ptr(rt_dev,
+					      CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)];
 
 	rt->dst.rt_uncached_list = ul;
 
@@ -157,40 +174,51 @@ void rt6_uncached_list_del(struct rt6_info *rt)
 	}
 }
 
+static void rt6_uncached_list_flush(struct uncached_list *ul,
+				    struct net_device *dev)
+{
+	struct rt6_info *rt, *safe;
+
+	if (list_empty(&ul->head))
+		return;
+
+	spin_lock_bh(&ul->lock);
+	list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
+		struct inet6_dev *rt_idev = rt->rt6i_idev;
+		struct net_device *rt_dev = dst_dev(&rt->dst);
+		bool handled = false;
+
+		if (rt_idev && rt_idev->dev == dev) {
+			rt->rt6i_idev = in6_dev_get(blackhole_netdev);
+			in6_dev_put(rt_idev);
+			handled = true;
+		}
+
+		if (rt_dev == dev) {
+			rt->dst.dev = blackhole_netdev;
+			netdev_ref_replace(rt_dev, blackhole_netdev,
+					   &rt->dst.dev_tracker, GFP_ATOMIC);
+			handled = true;
+		}
+		if (handled)
+			list_del_init(&rt->dst.rt_uncached);
+	}
+	spin_unlock_bh(&ul->lock);
+}
+
 static void rt6_uncached_list_flush_dev(struct net_device *dev)
 {
 	int cpu;
 
 	for_each_possible_cpu(cpu) {
-		struct uncached_list *ul = per_cpu_ptr(&rt6_uncached_list, cpu);
-		struct rt6_info *rt, *safe;
+		struct rt6_uncached_table *table;
+		struct uncached_list *ul;
 
-		if (list_empty(&ul->head))
-			continue;
-
-		spin_lock_bh(&ul->lock);
-		list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
-			struct inet6_dev *rt_idev = rt->rt6i_idev;
-			struct net_device *rt_dev = rt->dst.dev;
-			bool handled = false;
-
-			if (rt_idev && rt_idev->dev == dev) {
-				rt->rt6i_idev = in6_dev_get(blackhole_netdev);
-				in6_dev_put(rt_idev);
-				handled = true;
-			}
-
-			if (rt_dev == dev) {
-				rt->dst.dev = blackhole_netdev;
-				netdev_ref_replace(rt_dev, blackhole_netdev,
-						   &rt->dst.dev_tracker,
-						   GFP_ATOMIC);
-				handled = true;
-			}
-			if (handled)
-				list_del_init(&rt->dst.rt_uncached);
-		}
-		spin_unlock_bh(&ul->lock);
+		table = per_cpu_ptr(&rt6_uncached_table, cpu);
+		ul = &table->buckets[hash_ptr(dev,
+					      CONFIG_IPV6_UNCACHED_ROUTE_HASH_BITS)];
+		rt6_uncached_list_flush(ul, dev);
+		rt6_uncached_list_flush(&table->mismatch, dev);
 	}
 }
 
@@ -6987,10 +7015,18 @@ int __init ip6_route_init(void)
 #endif
 
 	for_each_possible_cpu(cpu) {
-		struct uncached_list *ul = per_cpu_ptr(&rt6_uncached_list, cpu);
+		struct rt6_uncached_table *table;
+		int bucket;
+
+		table = per_cpu_ptr(&rt6_uncached_table, cpu);
+		for (bucket = 0; bucket < RT6_UNCACHED_HASH_SIZE; bucket++) {
+			struct uncached_list *ul = &table->buckets[bucket];
 
-		INIT_LIST_HEAD(&ul->head);
-		spin_lock_init(&ul->lock);
+			INIT_LIST_HEAD(&ul->head);
+			spin_lock_init(&ul->lock);
+		}
+		INIT_LIST_HEAD(&table->mismatch.head);
+		spin_lock_init(&table->mismatch.lock);
 	}
 
 out:

-- 
2.43.0

