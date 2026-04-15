Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D512222D0
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776279062; cv=none; b=f4U8sSrY5eZKASsYehZSETXBWUQgGBNIj5/9r7RtbrvcmzWaxqMC826wLYudl/T96AG6NAYc8nlN45jtCIki7eJNNV5yYwsDHL4yUEuys9g/EhjW0Mmt4zib00qy35rylV4NVTkHHhPvox93Owo1SzKlN3b2pX5y+sPwzuQPP1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776279062; c=relaxed/simple;
	bh=GPQJkivEkwF0HUbahudHs4/b40DCkewhO8M1G0dxZGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Ul7nzKKPyKwrTFqh07Cw0GiqlETsqqRGV7QAO+BX3J91NORqUV7BryLb3UaE3+khq82LBIQk46PG3Yj1N1Tfcv0WdLkI4Wrr43lQ37izcgpVaEBvfTk+ATpsOWnUaeOntdp0YNZOM3JWXtHrUdqXIq4Jl5dZmN/tcvFdnQDThUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nt5nA4Wx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nt5nA4Wx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so51442935e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776279059; x=1776883859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pWPTdAO8MCBweTcbWU1oKhIQP/ALhI5YLbC4nFtxE20=;
        b=Nt5nA4WxDQKXAAgy3uArvipxboa3iWaAeBcJPXBCYk6OBSyyP5v4cuHcUDkMA2S8hG
         d8ZuwCmaB5oCtw3tQJURjphUrFABOT1ZlHZRx6y0dQIx17nXkD1sPHdjaoYJn70l99T0
         7IgURC6eY21/UUHmoSrR0jhovRxP+/UJO4K9+8nKj+JwOpcw/BVHlO+Sc7SD9yR+pst4
         bjky0TqUmnP6+oKKBBWjDGfh68sPks3Nm67PZPIABInIIhzndhnx+m0+yEjcVmd0pYRx
         J8kS2I2eA5CeiRFl+VJzwZ5Anlz4gt3hD9IuD7cp1NbzCTdwjwWAY3AxspztouORbd8L
         Lh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776279059; x=1776883859;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWPTdAO8MCBweTcbWU1oKhIQP/ALhI5YLbC4nFtxE20=;
        b=pfRjHuy1nHwrltIt7I05armyHKJztDeQokjBGnIFUiQ8Yb+48Jv3SA4+fuk8AW+gI6
         hsGk8y/Jtw6FkGGZ2BEryryEWaviM0Gpohl6wMGiiTZ3gWJ4rusSrVAZCXSO1sAL0Fke
         aDdKbe2ORZA0lopuml8RBkd45i32QK9DUANYIIhp+C6dKPrTOr2jXZ+d3O3znTyjxwA/
         1yVDGgiTMU9MjhcsVuXUrXsViSDowNckODZOvwrdi9Ibc/Ui2bsqhc0MzH5xHwOBvI3m
         /N+yYTeoh6M5EdRpRafWdKbEEAhh1xvjwogq4Oy9XPa516lsE/EO7D0NrcT8RydcUFuk
         Rkbg==
X-Forwarded-Encrypted: i=1; AFNElJ+GYY9rvY31DnilyGOhTiVWu59cRvBGuefvSZWdNToShKgIHfkBPIN/V6pCSmRKBpq31dz+K66POC0iEYlmJb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YySwhl2jYcK4hE2XrGUMo2jtj36ZV3dn3wKVvYVDhd+d6i8wAQj
	nI+FNMXfccnvmXUWotAMN63h5EXCZcjM6r6MVS05r03gAtnEBYKo9jKZ
X-Gm-Gg: AeBDiet0L8Vv4DrIgT1CfZMBMK3j/jAVCcuUcglxZrWdY66dQPjUhfhzmoqliLXmtYt
	KcnpnUlqMYYcKI6Y0pnIcJawyVFv5Uu7pOVxwNRgQSymKk8Kw6CzsgqTXtW14izipXI35cfhup1
	Y8WgGDf+r4jWvrF6TJ6VjDc3iW8YtH8bDXy67Ylh87fyjsxsAwS1UZf7FEOSNPnvwOGYP9p8gND
	oIJsnoQpeOBa004+uhd6iQENVKD6hL+qqeJylxDLNvfFscWYp0rAl6LtjWd6rv1Pn+YzOCFkqdZ
	6leFu4v0D7kcDXs+DkfLuDep4pvQMWQrmqp9crOhSkXX1WpvxlP0QU5tBgwZRMxVIOvFbOb5eeO
	BjKwmycKK5J1Z9YmUtznLd2BW3tmzQ0E2P3G7PZ1ieBfJkYksGMWl6uhNlg730ygzPgbM3KfX8G
	6l27hRna2kKi9iT182hmhqQxuOraV8MGLKu+VhUgcfscdH54QjsBl4wsuc427yCkJFJwq7qm0iO
	r4=
X-Received: by 2002:a05:6000:2386:b0:43d:77a8:3baf with SMTP id ffacd0b85a97d-43d77a83e04mr21924539f8f.32.1776279058798;
        Wed, 15 Apr 2026 11:50:58 -0700 (PDT)
Received: from dau-home-pc ([89.222.123.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5f06sm7543057f8f.17.2026.04.15.11.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:50:58 -0700 (PDT)
Date: Wed, 15 Apr 2026 21:50:55 +0300
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com, davem@davemloft.net,
	dsahern@kernel.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH net-next v2 1/2] udp: fix encapsulation packet resubmit
 in multicast deliver
Message-ID: <ad_eD6CjMOBSXQVm@dau-home-pc>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad_dal164gVmImWl@dau-home-pc>

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

This affects any UDP encapsulation (FOU, GUE) combined with multicast
destination addresses. In practice, it causes ~50% packet loss on
FOU/GRETAP tunnels configured with multicast remote addresses, with
the exact ratio depending on the early demux cache hit rate (packets
that hit early demux take the unicast path and are handled correctly).

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

