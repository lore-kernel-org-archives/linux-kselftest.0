Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F703DDB17
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673915; cv=none; b=DUWVsJqTwYjkwWae1CaoCmfrBk7hD9BAA3/dDAsNJn9gTBxaMh9gDSWy52pLx0lG/TQ7CfhsCPgDp+62iFXJTajPOm1viDbwoKRdQ7wL0lm1IxAKK8LGtnnpzYkwgThez6qSPwGxweXPhKh0w4y9aCTXbH+Q1dZN1sdHDvO5G58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673915; c=relaxed/simple;
	bh=VpMMQFtE0irAVVja4em612tK+k3J5NR1F8chlumvxas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6+v2qMfCFnGoz5SqR3LiVTiFofDeTMnZcNknhLVIaHNZfWUIuQIrXNhFD2lUw2sd6pTs+WTt7k2dL1K4XGI1zWdP7QyW+00cIOK34W8lmDbAH/sqew2oAceJ4HntTf3ATZtkjTr09yyfmE/M+srgzRkks+2kcSlZbmbODjsxGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=UvA100iB; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="UvA100iB"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4c4bf3dedf3so25835b6e.3
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 12:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789673912; x=1790278712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zDN4PsZdWLOQV5bbiD9QzTK6IwoPKXQKegMYDTNvdY=;
        b=UvA100iBYWDObnB8518MeQusvO83Gr0JyUyb/yR81zyibi4zILk6e0ia2LDaN85TH3
         iYpz/z0YtQZx45+1KMQD3+7hdGzNb1XrG193ZeHApFLJk4VP/ObpSFcW2D9bVtNFKn6N
         rfP+3FzZmZHldGg8GBu3MNUMwE7th328OVmfJtCRZMyhOQF7KXMOzLNbwoXhppF+xUnw
         fYUCt8o6yKY3BCFBujQ4FyOL3QYND2jWu4+wvJMBPN6rC0BPILQTuGCvPZVLAVo8TTYD
         NrvuIotrdUgSePNuKDplfACFeZ0IGZphPCf5Bw4S0E65E8/79/DlX2hMzKxiDfw/0AQf
         qCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673912; x=1790278712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zDN4PsZdWLOQV5bbiD9QzTK6IwoPKXQKegMYDTNvdY=;
        b=HYaEPTQoVx3eg5X/ASoqZGMNocxlHXSLhm4Kj9oV0g61UgXJNGEww3wB9KfIlU73+5
         4wyeLe0LkiW8PNJwBsGisk2rfySPXxQkZFVAK1Sqi4M2FsyJInw/B8iwK801HoRvojjF
         TTLuMDnMOokCCy7yQorDDrSTaKxiwgvn8q4dPspnp5bvC37N+qU3QOIfEl4SzQCVN7xN
         FV3c+B7WTDs/YEC9UhsPFHeJUkPwQbMkw846mUDuwVFGGbUE67Z7lc0I3YR4HdnhL2HI
         v85xFZN+oWh8k+Uot5/VbUBoSakXA1HcSb9AA4DpKN98X7YwAJXilnGm0NJWi8x9A3I9
         Yftg==
X-Forwarded-Encrypted: i=1; AKwUvBwOLzO3McY6ekY2czjXxFyGcqosU1J5qTQA+VatfouXb/6CMmBOBUsiq4Ble1k08qFI9mrmnWLs/NK9rUyHcek=@vger.kernel.org
X-Gm-Message-State: AFuF++mofCXTD+MYie8wqE3QLvs/CJZ/rL3mMbYkB0TwO+9Ti32hpHN+
	AKvb49e3bbN2fRqp9w3WRp97cTuNQep+8HmUAe7VXPUF1eV+7Jcq4cY494+8Qy1WEgE=
X-Gm-Gg: AYBFou2inbvXvHIdisgH/wxwHu6A+1WoE+cgXa2mQqN/YKPm7dtzpuwRKBrbKGtyy9M
	0cR+jTp8lYvJwg6ODkq4vbpSHFQp5E2aYbMExREXTTaN9wjJ/uJrAGl6A+z8B3VBdd99XR1SzY5
	0OCR+F2LNoAUD8clM20DbZboelqGude8jyG799w9ngCWqDOsle0Gzd6TWvNpP4Fl77w07WKv9QP
	KTKPKSAlhWvEJXN2dlWw3weBDmSQmSoT3IvpU5s2S0dQG8KPNtov6MAAUsmjTnXKDBEDX4rZheR
	T0rcr8gC1kyvLrw8MEmWdAAp6s054SGOSyFamrvI6DHUOWcKGKztNGiVhhGx1O6nvVmNpsR5cae
	wOcSJ8y8bM88hJsR8GMpTO058xyo/ZLDskB6BIFQmatR8KFHUXwBQyWt3T/0evx+AIVpFlH7eE0
	nirkHw+cy//x3TclV+ye/TMXskMdvT90gr1+E/E5wQKSz6EP4EWsYyVeCM7Nk=
X-Received: by 2002:a05:6808:508e:b0:4c1:3047:9d23 with SMTP id 5614622812f47-4ccf8c496ccmr270320b6e.23.1789673912503;
        Thu, 17 Sep 2026 12:38:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:bf21:2632::3ce:23])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6d267495sm3576435b6e.12.2026.09.17.12.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:38:31 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
Date: Thu, 17 Sep 2026 14:38:22 -0500
Subject: [PATCH net-next v3 1/3] ipv4: hash uncached routes by device
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-hash-bucket-route-lists-v3-1-30493a37b6eb@cloudflare.com>
References: <20260917-hash-bucket-route-lists-v3-0-30493a37b6eb@cloudflare.com>
In-Reply-To: <20260917-hash-bucket-route-lists-v3-0-30493a37b6eb@cloudflare.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789673908; l=3315;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=VpMMQFtE0irAVVja4em612tK+k3J5NR1F8chlumvxas=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLL4JZ1UCIcP9np2SFBYtXutgzYaWKx6FR3rXAgvEIAC5fRPVrK+nhDB49SIEqYqEkjGfR+A3rn
 h3c3NWCw8+Ag=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M

rt_flush_dev() currently walks every per-CPU uncached route list for each
device being removed. This repeatedly examines unrelated routes and makes
teardown increasingly expensive as the number of devices grows.

Replace each per-CPU list with a hash table keyed by the route's netdevice.
Keep the owning-list pointer in dst_entry so route removal remains
unchanged, while device teardown only walks the matching bucket on each
CPU. Hash collisions are filtered by the existing device comparison.

The table has 64 buckets and costs approximately 1.5 KiB per possible CPU
on x86-64.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
 net/ipv4/route.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index d7da2f1acbb5..e5539eda4307 100644
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

