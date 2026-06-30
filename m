Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA346408622
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817345; cv=none; b=iqVe/s0cKG6HA4Bd7NolGCm4gkgfA6NHHTezsBdhSaT9mElv8unZT2wLbJqveykkx20UoT57UJKlL00V9lsK2Pmk2nwZlW0hwoWWzeGue71GAalaeYXsZakx7IxbFAsoR7MY78qRKHWIu3BJwUlzLq0rrmcAVcZJIBjWnZQzr7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817345; c=relaxed/simple;
	bh=l4DTzAgHPxhvW2gusDgE+0UeVs6H4ewTxAuzQ0FO/jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIuRrRJtp/zV6uzlrbGBUnMjmrtkR/pIl9Z5/vidBLWe0oy1+7rPM0fDA0tdI9ODYkfOFzrl8Z41PU9uKyhyHsKei+X26hnm1UB2hZ+0dMD92bGDeYRuvSEBqQzvLCsvMsutK8i1cKx4Rlwa5J21Jt0alnVW0QhtFRKl+fzZWGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rT48Z0NJ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rT48Z0NJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c9f44ddf26so8538325ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782817344; x=1783422144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3R/tR4ScCUpju7FMZyh8+yuGH4uE1rv2T5rn90jmRLM=;
        b=rT48Z0NJCpyqbw5HWpb89HcGw7SfX2P2GjtHFe++aRT1XLRfJaTcc/3QvDiMswDNhJ
         73uLAX9qkbcJCOfLx4wCjepoOGOeQo1UKmixSLjORHXSju1j3OzQfMGo7luFxWuLqrNQ
         mYaRdpPr2TIIrolHtLcNn6kc8V5UWWmQvkZroTyr9lQ35Y94x8LpagD5Wzj7sh+hkr8+
         KlLBqp0AG8S9/jQ7YnXIhX5+yEcVttfIYlhVlw0TF6EttJDWavJHbfp6tRAT/JkqAkal
         dZV3hsbDXyh+96mOJI7LRomVp3zcvtTHuQGPtqN2zbS0BrQRKM5RCjGiETKJGqD7RYDX
         8oGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817344; x=1783422144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3R/tR4ScCUpju7FMZyh8+yuGH4uE1rv2T5rn90jmRLM=;
        b=SkGBttKFsihWlTh+ZJ3a/RTTCQNzT31eI4KYEl3oiL9zLzcJmuCtfO2fTXLlWpxCUF
         LZxBHr2pyHqo79zjog4AfdCAGWtLVH5b4OGsIQaKYrgIpQTkErGHb6hvNhmv0IEwv/F1
         U4brG5n/lj0jqIWw+ZybztPzugR3h+/YR6qtZjDgWpa0c1fq4cVAtqU2ZkF+A9YcjHu8
         HNSvgpYGlFm9GeWBnm6eL98VcAlztbHGOJYvOAy8x4+EREes7TMU5FnXqVg0k+EWxUxo
         WANAPujW6EZV0Ra7bgMrIgwJ90vVJmkrGV+sqVMavtweCI+N/CYOo5Uvu2F8Sc/Watdw
         zhWA==
X-Forwarded-Encrypted: i=1; AHgh+RpIMIrBKVB3wt1tmtaU+BAM0f3Hp1RGD/KYuDMbVNGpmNUYC+dupu935WLPnhWMOoqpRZCV/PjM1Xu9Pe/VAhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMXE/bJoVN9odRRDKtTgayvgsh7pph6PT+dIxQg8ySmIGd11r8
	S8vsAZAVMd8PCx4O3+fQfy6RvQhxCu2+HAQTwtklzQy8i53bHWFie9Te
X-Gm-Gg: AfdE7cnbDL7J6evC/fBlofOUgp51+647amfiMMTnkJya6/fHybokmfOOWLditQEa+BT
	52FoQNf4YmZe9qp7CBxK08472yy3Q9bgHDzJJa7QgaIC1Kb0iLdGdQ4aFIi59KR/zOXN6buCzxF
	AlNQBmpbVFVYyQLR3zAwmwSxmmUNZQ10CeyUib6C1Ougu9G7Yx9j5B6jELX3+J2tWwid9gi/eNW
	dlSdOJr4k45dISdvGsuHqN2qxFex+UKYsZgNUGsox7K910uo9LOjqC53IUCpqBUbm+0ss5SNi45
	BNdWzAQiB+kl67JaWPQQnG5uia37BmRx3C8lMY3aPcqpStu/WUvOloO5hm4oHdKjsitBELWQHTS
	RVVyoWd23t4nB4pHujTTOgddn8Czmdvt/fZZa07C1G+0itDYppHEdoDO/bFsneWH2Hb/p7bsZWn
	Hg7TZpI5HXEgRjWAwNDUhgouWTjPoAdw==
X-Received: by 2002:a17:903:46d0:b0:2c9:97a7:b1ec with SMTP id d9443c01a7336-2ca5a623ff8mr129935ad.43.1782817343702;
        Tue, 30 Jun 2026 04:02:23 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:ae0d:35d1:dac9:a0e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a701b5sm11455265ad.17.2026.06.30.04.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:02:22 -0700 (PDT)
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next 2/3] net: ipv6: report multicast group user count
Date: Tue, 30 Jun 2026 20:02:06 +0900
Message-ID: <20260630110207.37841-3-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630110207.37841-1-sigefriedhyy@gmail.com>
References: <20260630110207.37841-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous patch added IFA_MC_USERS and emits it for IPv4 multicast
groups. Add the same snapshot attribute to IPv6 RTM_GETMULTICAST
replies and entry-lifecycle notifications, carrying
ifmcaddr6::mca_users.

This makes the multicast rtnetlink ABI symmetric across IPv4 and IPv6
and gives userspace the same user count that /proc/net/igmp6 exposes.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 net/ipv6/addrconf.c | 1 +
 net/ipv6/mcast.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index cbe681de3818..f1fe9ede1edb 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -5264,6 +5264,7 @@ int inet6_fill_ifmcaddr(struct sk_buff *skb,
 
 	put_ifaddrmsg(nlh, 128, IFA_F_PERMANENT, scope, ifindex);
 	if (nla_put_in6_addr(skb, IFA_MULTICAST, &ifmca->mca_addr) < 0 ||
+	    nla_put_u32(skb, IFA_MC_USERS, READ_ONCE(ifmca->mca_users)) < 0 ||
 	    put_cacheinfo(skb, ifmca->mca_cstamp, READ_ONCE(ifmca->mca_tstamp),
 			  INFINITY_LIFE_TIME, INFINITY_LIFE_TIME) < 0) {
 		nlmsg_cancel(skb, nlh);
diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
index 04b811b3be97..774f4c72a6fa 100644
--- a/net/ipv6/mcast.c
+++ b/net/ipv6/mcast.c
@@ -908,6 +908,7 @@ static void inet6_ifmcaddr_notify(struct net_device *dev,
 
 	skb = nlmsg_new(NLMSG_ALIGN(sizeof(struct ifaddrmsg)) +
 			nla_total_size(sizeof(struct in6_addr)) +
+			nla_total_size(sizeof(u32)) +
 			nla_total_size(sizeof(struct ifa_cacheinfo)),
 			GFP_KERNEL);
 	if (!skb)
-- 
2.43.0

