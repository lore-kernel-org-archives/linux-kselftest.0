Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24671472F8D
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 20:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775618; cv=none; b=OTixof1dsweJICFw5HZDkyp6aYn/9oM3BgL8fKiHu1p2W9aKwKti4BFMENUNdr16KNeWhy3jf4vU/iQFTYewhjz7RA2IoN5ad1Rp68I1UQjySi7FkV4u6Z48PsrwaKGg3S7q8yNnaRMzxQA7vNSohN3pbkEjictgGfr8Ovb7XGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775618; c=relaxed/simple;
	bh=Ut/PjvIImnY64JnqnynvMuxcOBqH+zLzueSVJw4Qbq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c9YvD36AhOAVf33iV9M0tmLt/Os2mMJVrQX0ua8HKyysTFXEfneXWCM4Ya9YFCZ7sNvCJFqQED4fPcFxnNbekTXni7OP98pfvLXIbHP2ibweOy8pZImgmJ8mrun5iXL/o9q7uiBFzSVxqZZ+O5vVigpKdP95lWBIm6vv5/oWCzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=bg8ptw4z; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="bg8ptw4z"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-448b89f700fso1502785fac.2
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 13:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1787775616; x=1788380416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ADL2kWhxZtGy4zWAARuC/jsldPk9uJ7GZCsaK5GLJ8=;
        b=bg8ptw4zdV307CDaKRqryOfIqZ27JF6bnNWT1D/BbOBJYxQKnq/oRLgZWZoazyY5rl
         USlRCLkyO1snPzGq2kjbKwVGJmX8kK0HAeWbcN4J/2P+04t0zgyE0tvJjy1jMVrN6/Ss
         qEb0WHkDlCx2/6C3Ish4/iC9z51clWvHVRNKOxaIZpkJJIyMxmUwOVZq5fy/yvLeU5ft
         Rp19Ryp5HVRwddGj+8YgMO4aOSL4YvN5GZGE04UVo4/g7Q6+vnCuuM/s4beMWgNYmPAd
         iur9wAM/0iacivIoyT3tKkKEbJpxSVVSSuPyGynvYyraQXp4zOemgw4vlZQIq15El9jF
         Xsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787775616; x=1788380416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ADL2kWhxZtGy4zWAARuC/jsldPk9uJ7GZCsaK5GLJ8=;
        b=Tww9Lg9gjLRK1K9cu2v1gLF8ALuNu013qZXjgIlkTl2sB5Q4TBRN4tfyq7zlF5BeRf
         UEKv/f+DGjCht5fMbjmD3NvrqZ7RG5j0DNJ1l3UeskAukpe4iCaFFq7oeXiOY3VBXctj
         XPlRjm3YT8GreGgVq4UQBCNyhwjRNH4jdiIa9eIHMiZ1a66CbnYOBiHTlI+UkqfOMEwS
         4dOL7GSepmIuCpWrmtHp5yYrJzyQa6wFY3cJdoAvNV2AhuCQdeH4p1x9LyXShsz0zqlj
         uUAzR8fciZVS7JKngTn4bHQX8jB2wybOfADzF+/tYAsIb8ubkWr8dbhjlVCcZgZKLPzl
         ubcw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1R/8+yn1bV7isfoUCmIcboZj2aLcxufD6/W8u4BHQ9pGdCCLpiZxHXFiPVeXXEbML//3YLvj4bZ1NYHKwSmc=@vger.kernel.org
X-Gm-Message-State: AFuF++njW1EAT/h2vFpHk9W5srF1MZAGOQRzBadMK3verVByIVbb+tkS
	gAixfH/8TnLqpSxAsPBR8YcHx6y9y7ovzK/8yakZ+Pa8NoxVIBTbZk719a60lhBm440=
X-Gm-Gg: AR+sD10VhOad8sgoUdtU+3smjl4W/r85vgjA2aD1hNKnS6fJVLyKMoRVbJpasd3x9OM
	BUDToBZrshimpek62SRz/fs1sQWm4Op7dbmG8w/hvLHjNCP8g4jjv59eQm7I4/FTiL/FTAUpbIc
	y8ik+qxJ6O1GHvLyYHpwqlLemcZpFd175e+tAhle2ZTVahzm8yieLugF6xtUag2QXJNTSe3QGJ+
	u70VtFvZpgghahzfJKT2mk7zTmhkS8hS/k2zhL9FIbhKi6BzuZqzxhyAEPJiLKdC67gLSvCs/Br
	oANrZDeEiCz0CEhGdTpOyJu2s9/Yz9xz0ehjsCDCMhzkl7Dm8KKwiCnLnbxwLS0GTdEhPX8cimp
	GTwld1wz0Qj84HUH3dpCzq9JH+R7XTg6vXpr0/YbMeji/tAfZXxf0YeqIMR1KyUlhMz48+WRuax
	RIKOxbz8ZTr5adubN1h7whnQFXwM8kAVh4G3/9vlQv0cxl6BINBN8=
X-Received: by 2002:a05:6820:220d:b0:6aa:e70f:301e with SMTP id 006d021491bc7-6b1a03af4aamr8729903eaf.8.1787775615783;
        Wed, 26 Aug 2026 13:20:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:bf21:2e46::49c:30])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4c83d09d1sm2474928a34.14.2026.08.26.13.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 13:20:15 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
Date: Wed, 26 Aug 2026 15:20:07 -0500
Subject: [PATCH RFC net-next 1/3] ipv4: hash uncached routes by device
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-hash-bucket-route-lists-v1-1-fa9b9f30eb74@cloudflare.com>
References: <20260826-hash-bucket-route-lists-v1-0-fa9b9f30eb74@cloudflare.com>
In-Reply-To: <20260826-hash-bucket-route-lists-v1-0-fa9b9f30eb74@cloudflare.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1787775612; l=3229;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=Ut/PjvIImnY64JnqnynvMuxcOBqH+zLzueSVJw4Qbq0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGKtMglFWb2eF4aZn13tPCiD5edLWKEp4C+U9eq3qkK/bBhhmXCdy3tyUWdIV1sw9yi0PuzZCl3
 jMELPC0GRkwU=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M

rt_flush_dev() currently walks every per-CPU uncached route list for each
device being removed. This repeatedly examines unrelated routes and makes
teardown increasingly expensive as the number of devices grows.

Replace each per-CPU list with 64 hash buckets keyed by the route's
netdevice. Keep the owning-list pointer in dst_entry so route removal
remains unchanged, while device teardown only walks the matching bucket on
each CPU. Hash collisions are filtered by the existing device comparison.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
 net/ipv4/route.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 604cc51dfd9b..3f9bc1ec72cc 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -74,6 +74,7 @@
 #include <linux/init.h>
 #include <linux/skbuff.h>
 #include <linux/inetdevice.h>
+#include <linux/hash.h>
 #include <linux/igmp.h>
 #include <linux/pkt_sched.h>
 #include <linux/mroute.h>
@@ -1552,11 +1553,22 @@ struct uncached_list {
 	struct list_head	head;
 };
 
-static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt_uncached_list);
+#define RT_UNCACHED_HASH_BITS	6
+#define RT_UNCACHED_HASH_SIZE	BIT(RT_UNCACHED_HASH_BITS)
+
+struct uncached_table {
+	struct uncached_list buckets[RT_UNCACHED_HASH_SIZE];
+};
+
+static DEFINE_PER_CPU_ALIGNED(struct uncached_table, rt_uncached_table);
 
 void rt_add_uncached_list(struct rtable *rt)
 {
-	struct uncached_list *ul = raw_cpu_ptr(&rt_uncached_list);
+	struct uncached_table *table = raw_cpu_ptr(&rt_uncached_table);
+	struct uncached_list *ul;
+
+	ul = &table->buckets[hash_ptr(dst_dev(&rt->dst),
+				      RT_UNCACHED_HASH_BITS)];
 
 	rt->dst.rt_uncached_list = ul;
 
@@ -1588,14 +1600,18 @@ void rt_flush_dev(struct net_device *dev)
 	int cpu;
 
 	for_each_possible_cpu(cpu) {
-		struct uncached_list *ul = &per_cpu(rt_uncached_list, cpu);
+		struct uncached_table *table;
+		struct uncached_list *ul;
+
+		table = per_cpu_ptr(&rt_uncached_table, cpu);
+		ul = &table->buckets[hash_ptr(dev, RT_UNCACHED_HASH_BITS)];
 
 		if (list_empty(&ul->head))
 			continue;
 
 		spin_lock_bh(&ul->lock);
 		list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
-			if (rt->dst.dev != dev)
+			if (dst_dev(&rt->dst) != dev)
 				continue;
 			rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
 			netdev_ref_replace(dev, blackhole_netdev,
@@ -3771,10 +3787,16 @@ int __init ip_rt_init(void)
 	ip_tstamps = idents_hash + (ip_idents_mask + 1) * sizeof(*ip_idents);
 
 	for_each_possible_cpu(cpu) {
-		struct uncached_list *ul = &per_cpu(rt_uncached_list, cpu);
+		struct uncached_table *table;
+		int bucket;
+
+		table = per_cpu_ptr(&rt_uncached_table, cpu);
+		for (bucket = 0; bucket < RT_UNCACHED_HASH_SIZE; bucket++) {
+			struct uncached_list *ul = &table->buckets[bucket];
 
-		INIT_LIST_HEAD(&ul->head);
-		spin_lock_init(&ul->lock);
+			INIT_LIST_HEAD(&ul->head);
+			spin_lock_init(&ul->lock);
+		}
 	}
 #ifdef CONFIG_IP_ROUTE_CLASSID
 	ip_rt_acct = __alloc_percpu(256 * sizeof(struct ip_rt_acct), __alignof__(struct ip_rt_acct));

-- 
2.43.0

