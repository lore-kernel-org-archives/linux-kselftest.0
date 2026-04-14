Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EA22BEC34
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 23:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776209272; cv=none; b=bMmKeaJGG8W5Nuieg1H5EMEyBGvFUdjSoJoEye2aS3KthYDqdlzu7xsEmuOZ/RRIJoMg72hxhriFo3Wu9RR0FqwA+z3bAua0gXXR1qHvBPJtVQJw0P6eZuvRjg5hvXjvcxRonIXMpYsR6SZFIa00eoB7TVzWNmG9UCK8Sxu18Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776209272; c=relaxed/simple;
	bh=4ojetKFw+N+gPNsqHUboQU6M2VnP9rLu3/qxtKKWjrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lrZ4RnfHNk0xjbvtGfsBdvmOn+QMewpVSeOU57wiD/ZSXhByYo6dFL+c3gKRAxKmXM1jpY5sV+P797ps+bpLvWPl0W7znai/SwtcN682XvfC144GQDkOoydiBenddA5cMtCTwdztbAIaONbm8FrxF5XlFAweltP2qWuXSGkhtFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4Dm09PD; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4Dm09PD"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66d65646c65so3611764a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 16:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776209269; x=1776814069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AE9p9L2vInBswuWEO3djotwwSehMW4lANL0Mw7wd5Cg=;
        b=I4Dm09PDqa9oxwotRt/yiV1LWg6uJogNAs9l5/SQhdDJxWImr7MQ1DcwrJRMg6t8ZY
         oyrzAxw4mhgR3drQzixbi971DojRlDDVPhYkPL8ZzT/RaepLWfOyWs6sKLbdFi2jSuon
         rQK/Iz89zxFJAIUfTyEgSsOJa8vqhOBh44L7R+xTa4OEgiKE9S0RfaxGh+8r6jQP/AhC
         16TsOcGS3pT2KNokMavdT5B0bzf6twtzr/50MmYPFkjx+/L9kXEqYcuQ/ZeK/ISTo72t
         cUC9DA9+1HJLk+MPdewfk0pzU3CXh8PEa2WP2XF+1B8zoIquJKdluf/F//0lrG2gJAVf
         JJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776209269; x=1776814069;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AE9p9L2vInBswuWEO3djotwwSehMW4lANL0Mw7wd5Cg=;
        b=tSXm38ZIZ9jhjXSv9Gp/ek1QyU/xl2MexK09Sl5h/BiCtf+dmn2f7AWRrgcKx+8LH1
         0kvwh+ttwYQkkbUvoWUcqanSlZh22Rdj6Ui3STjcpF8CT49jnM0toy7jxAkSWck88XDO
         eMpWy5L0KhsGOCuqTGx4I16q67F0dZqbbs3uJjc54hmvCDpzCA3h9daad6CEeH4k3H00
         XKfWsT0IKV+rrhJ1HQ8L4sWqrSvQdutqFUq+jwC+ww85i4tbnJzU7ae4EEpWC3zhOADi
         5IVTJDvtb40UPXN5Cx9wV847Yx7wBX/cpN7xOhI7ffJZLxzbBuyNjB7Tz22c8CswswTh
         Ll/A==
X-Forwarded-Encrypted: i=1; AFNElJ+EieWpe+QdJfFK0LXT80Z2kYBg5W59xlYO93Yj1Q6x0xHzSk5Y1JpomlI3MpqhJWmIQ65Ci9CQjQEe8RhjnB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ9kJQvMSNXAeM9LBl2nkX3xlbVSTa9wANpOjvkJ1eI4uPUM7A
	wM3imo997S6JREs7DzOhF6HouoiX11jICf4iBqY2q0esLFPGL7S6Dv2W
X-Gm-Gg: AeBDievLkH9IOxOaHt8M5jlbQnem1HgFH1kk5L44DS8rVTEeIZ7D5C2jtO+DCoDJgt5
	pDjEPU0wgUmP5tya+Ayj5rMCMqwisbpakAei0n2yaX7n27IPYwzlGDmFJQzidi6TJzbIcvuAh2V
	8FmwVIIFvSWTv6QlqETRK5Rn/KkLlScWbyg9jR9xCQv32umWoFz4qUKQCLcyetjQBf8WUI3VoQB
	BNcsdp6n0vPWDv5U+4/gu0vKE+zpp4waPKVtG3zzFwustwi0ABTkDwS5rD5QEU5zAkoc4LedDMj
	Iu4nW3TobQ75oHJPP8pHsc81xS6kH8/hHDmyAjpUxwALP8DASyv3bfd/JDkTq2e84KeeVf87Lzn
	3DLFooObHoqcXYUxBCONF6MSco/YqEcjUQQf7dBAix5jD+Z26bwMwgiUoh1QrWwfqbmCAaQTNbF
	GCbt3rYtwYbaTAgEbmvlJCiFxL8nb7U2MRXPO3uu6khufSfRXnxxsv2kq9UxjqJh1BlAYicxGoX
	3S0
X-Received: by 2002:a17:906:99c2:b0:b94:231f:26ca with SMTP id a640c23a62f3a-b9d46228023mr1163681966b.20.1776209269053;
        Tue, 14 Apr 2026 16:27:49 -0700 (PDT)
Received: from dau-home-pc ([185.229.191.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e43sm461945266b.13.2026.04.14.16.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 16:27:48 -0700 (PDT)
Date: Wed, 15 Apr 2026 02:27:45 +0300
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com, davem@davemloft.net,
	dsahern@kernel.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH net-next 1/2] udp: fix encapsulation packet resubmit in
 multicast deliver
Message-ID: <ad7NcQvBWXdxOu8z@dau-home-pc>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad7MsSJOuUU6EGwS@dau-home-pc>

When a UDP encapsulation socket (e.g., FOU) receives a multicast
packet, __udp4_lib_mcast_deliver() and __udp6_lib_mcast_deliver()
incorrectly call consume_skb() when udp_queue_rcv_skb() returns a
positive value. A positive return value from udp_queue_rcv_skb()
indicates that the encap_rcv handler (e.g., fou_udp_recv) has
consumed the UDP header and wants the packet to be resubmitted to
the IP protocol handler for further processing (e.g., as a GRE
packet).

The unicast path in udp_unicast_rcv_skb() handles this correctly by
returning -ret, which propagates up to ip_protocol_deliver_rcu() for
resubmission. The GSO path in udp_queue_rcv_skb() also handles this
correctly by calling ip_protocol_deliver_rcu() directly. However, the
multicast path destroys the packet via consume_skb() instead of
resubmitting it, causing silent packet loss.

This bug affects any UDP encapsulation (FOU, GUE) combined with
multicast destination addresses. In practice, it causes ~50% packet
loss on FOU/GRETAP tunnels configured with multicast remote addresses,
with the exact ratio depending on the early demux cache hit rate
(packets that hit early demux take the unicast path and are handled
correctly).

Fix this by calling ip_protocol_deliver_rcu() (IPv4) or
ip6_protocol_deliver_rcu() (IPv6) instead of consume_skb() when the
return value is positive, matching the behavior of the GSO path.

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
Assisted-by: Claude:claude-opus-4-6
---
 net/ipv4/udp.c | 13 +++++++++----
 net/ipv6/udp.c | 13 +++++++++----
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index e9e2ce9522ef..8c2d4367cba2 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -2467,6 +2467,7 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
 	struct udp_hslot *hslot;
 	struct sk_buff *nskb;
 	bool use_hash2;
+	int ret;
 
 	hash2_any = 0;
 	hash2 = 0;
@@ -2500,8 +2501,10 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
 			__UDP_INC_STATS(net, UDP_MIB_INERRORS);
 			continue;
 		}
-		if (udp_queue_rcv_skb(sk, nskb) > 0)
-			consume_skb(nskb);
+		ret = udp_queue_rcv_skb(sk, nskb);
+		if (ret > 0)
+			ip_protocol_deliver_rcu(dev_net(nskb->dev), nskb,
+						ret);
 	}
 
 	/* Also lookup *:port if we are using hash2 and haven't done so yet. */
@@ -2511,8 +2514,10 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
 	}
 
 	if (first) {
-		if (udp_queue_rcv_skb(first, skb) > 0)
-			consume_skb(skb);
+		ret = udp_queue_rcv_skb(first, skb);
+		if (ret > 0)
+			ip_protocol_deliver_rcu(dev_net(skb->dev), skb,
+						ret);
 	} else {
 		kfree_skb(skb);
 		__UDP_INC_STATS(net, UDP_MIB_IGNOREDMULTI);
diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index 15e032194ecc..f74935d9f7d7 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -949,6 +949,7 @@ static int __udp6_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
 	struct udp_hslot *hslot;
 	struct sk_buff *nskb;
 	bool use_hash2;
+	int ret;
 
 	hash2_any = 0;
 	hash2 = 0;
@@ -987,8 +988,10 @@ static int __udp6_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
 			continue;
 		}
 
-		if (udpv6_queue_rcv_skb(sk, nskb) > 0)
-			consume_skb(nskb);
+		ret = udpv6_queue_rcv_skb(sk, nskb);
+		if (ret > 0)
+			ip6_protocol_deliver_rcu(dev_net(nskb->dev), nskb,
+						 ret, true);
 	}
 
 	/* Also lookup *:port if we are using hash2 and haven't done so yet. */
@@ -998,8 +1001,10 @@ static int __udp6_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
 	}
 
 	if (first) {
-		if (udpv6_queue_rcv_skb(first, skb) > 0)
-			consume_skb(skb);
+		ret = udpv6_queue_rcv_skb(first, skb);
+		if (ret > 0)
+			ip6_protocol_deliver_rcu(dev_net(skb->dev), skb,
+						 ret, true);
 	} else {
 		kfree_skb(skb);
 		__UDP6_INC_STATS(net, UDP_MIB_IGNOREDMULTI);
-- 
2.47.3

