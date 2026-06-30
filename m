Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4AB4071EF
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817341; cv=none; b=I/vGVSWuq2n5OOIEIrDy5aVfPt6aJUt6oAIakh2vX+faSPAYwOVEmPilZEXcaD91u9qUafalT/ZvzDO0LlbOEGT+StKqBnYaUpe3U6u/g3sa3hQkJxzSZMfIgX7mwmzlOB1XXk/P+E1Kf//Qj1seaO7Iphp2SXwBt+5dhQT0a+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817341; c=relaxed/simple;
	bh=znty9fKu1I3j6mk8GJ7YhBLBxJh2skExwhcdv1n8kQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WztS6b0TW5VPekgfPa3ij2xGpg9iRySYcHeOqX0kTQqLlPgb9w4KZLbGuih8spxC2y/7W1WdoQmITxoInrcOsPY8R79YVhBk5UnaM5BGNsqeCYhe5IaXo3dQZ9hf75GXtPAQ/gBTSbCAfOJ+q91dKeE7fza/b62v47jJmzbS+CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKXC4K1R; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKXC4K1R"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so3334955ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 04:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782817340; x=1783422140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6UKdS5fC0734haXSHmcnGsohuQh5WonZmb4ruRSjAQ=;
        b=ZKXC4K1RH7mdCysAGO3lDzrX8qgA5GRpPPIHODtDiU7eaEmC/zwaEh8uM8b8nYTfdZ
         9eVkn0Iq8fVH7U6izyyP1vRLL6jvV2d35bXkoHYnHQT9Ym6B71gQ8Me49WsmJuzMrHHH
         tx3dXeLJMdT+TCNURK8/pp/zNgd3PuGSn+uBWZGbsTTPN/jikPTVESKkroevNWMY/M3c
         eZ62RmyhaVfuaan4hu2fTlx8q04iiY0gPhl/TF7tyLqOuwqDyGVWMcKK2hRo7X/ojViA
         3138KhqJfmuq7b1cr7Z1J+oKkYc442WuMAolXSmgbA764XNH0p5B6uIAYMgtUdc2Y4xW
         gF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817340; x=1783422140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s6UKdS5fC0734haXSHmcnGsohuQh5WonZmb4ruRSjAQ=;
        b=Rl8Kd48kFcZRysrI/rYZIncDQ0RKPOevtA2lS2IqKdAYsYZUN3UXLSIMTYjkJiJSua
         l4iIOtKY/ZsJa26P+VVLRKbyavhcZNTiECU13IjJ0J33t2qTd5HuDSvDVXriSpLDKJVk
         v2bPlfXWjCjD7ZbEoin5ZQEh0vitO77cQZp0OQQMaGCO6z3E6UXOxMACeTgK9M6DIDKx
         1aPZY4m1p8nywbOclA4u2aQ50xBHa5sY0TG7TL+mlxsOjve6FCHmP0D6pXVlZcaH9bDy
         xJY4MgM240hQZjbCIA7xUwyPf9vESwR+1vMVjxQAF72/HBu/dawaL1d118eW0tDCNFGD
         bPtQ==
X-Forwarded-Encrypted: i=1; AHgh+RplV45EW9+aF+gfor3aWMEhwlJrQCFgAF36+8hvvLS6pUJYwqBaLtxFZaeVD6J2fad50RjbSly6biJGgeAGmR4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzny6c3NLAy6GASm6BLs301cZ5hV2Eau2GUmdxGNYnuVKZc/oTQ
	Muty2t03Wj39GS1V4WK717P6w9vBCjXvNfqxhfPE9XlriSpib+kvMvnW
X-Gm-Gg: AfdE7cmnYBU/HKtEn1yr6vzrlKioqq4Zp1/8YBPjlP9mheZO6lSRcbJtvnP4ydhYc12
	Pf3cL9Jf9JVAEtYPKh0A0tw19c5GypU3g+1H76NEzf7zpN58xfnXxX0faDDOrbvdToop/Q+fX69
	NnGuk0wa8p4/d1T3ORDEy4xLRTjJT9ndbHCwgM/Ax0U5En3rTsyCcxWFUD3k1pgyX6d3n9r5IYm
	3iOHWZ6stAyxAScwis96bWuk4Bbba+CxUCG77Zfco5XVK6nYJtC7a7VprrpgQgUvBbB6PAcIJID
	sPbcBV3QikBf5tICqppQaJ0NZKbG3NpW0zf9Nsh9QI7ubY+GLStbMaPA1tLdn/9nGQtWIn7HhBR
	oRAcAM+gmvUxGIQ5UP2gcU57bvWeXp0SRuTfx8qq4aX8d6Nr64fuyQs7k3YkXFEmNCy7xuYuK7V
	6ntc7UYlVyWnHC86enHjE5z6isC9swNMs9XDZNPXA4
X-Received: by 2002:a17:902:f70f:b0:2ca:1114:3ac8 with SMTP id d9443c01a7336-2ca449ab595mr9725845ad.11.1782817339786;
        Tue, 30 Jun 2026 04:02:19 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:ae0d:35d1:dac9:a0e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a701b5sm11455265ad.17.2026.06.30.04.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:02:19 -0700 (PDT)
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
Subject: [PATCH net-next 1/3] net: ipv4: report multicast group user count
Date: Tue, 30 Jun 2026 20:02:05 +0900
Message-ID: <20260630110207.37841-2-sigefriedhyy@gmail.com>
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

RTM_GETMULTICAST has been part of the rtnetlink ABI for a long time
and already reports IPv4 multicast group membership through
IFA_MULTICAST and IFA_CACHEINFO. It does not report how many consumers
hold each membership, so userspace still has to parse /proc/net/igmp to
get the Users column.

Add IFA_MC_USERS as a u32 attribute carrying ip_mc_list::users in
RTM_GETMULTICAST replies and entry-lifecycle notifications.

This gives iproute2 enough information to migrate the IPv4 part of
"ip maddr show" from procfs parsing to rtnetlink.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 4 ++++
 include/uapi/linux/if_addr.h             | 1 +
 net/ipv4/igmp.c                          | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 163a106c41bb..0ecbd24c890c 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -123,6 +123,9 @@ attribute-sets:
       -
         name: proto
         type: u8
+      -
+        name: mc-users
+        type: u32
 
 
 operations:
@@ -176,6 +179,7 @@ operations:
           value: 58
           attributes: &mcaddr-attrs
             - multicast
+            - mc-users
             - cacheinfo
       dump:
         request:
diff --git a/include/uapi/linux/if_addr.h b/include/uapi/linux/if_addr.h
index aa7958b4e41d..7fb630b7fe31 100644
--- a/include/uapi/linux/if_addr.h
+++ b/include/uapi/linux/if_addr.h
@@ -36,6 +36,7 @@ enum {
 	IFA_RT_PRIORITY,	/* u32, priority/metric for prefix route */
 	IFA_TARGET_NETNSID,
 	IFA_PROTO,		/* u8, address protocol */
+	IFA_MC_USERS,		/* u32, multicast group users */
 	__IFA_MAX,
 };
 
diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
index b6337a47c141..116ce7cec80e 100644
--- a/net/ipv4/igmp.c
+++ b/net/ipv4/igmp.c
@@ -1473,6 +1473,7 @@ int inet_fill_ifmcaddr(struct sk_buff *skb, struct net_device *dev,
 	ci.ifa_valid = INFINITY_LIFE_TIME;
 
 	if (nla_put_in_addr(skb, IFA_MULTICAST, im->multiaddr) < 0 ||
+	    nla_put_u32(skb, IFA_MC_USERS, READ_ONCE(im->users)) < 0 ||
 	    nla_put(skb, IFA_CACHEINFO, sizeof(ci), &ci) < 0) {
 		nlmsg_cancel(skb, nlh);
 		return -EMSGSIZE;
@@ -1494,6 +1495,7 @@ static void inet_ifmcaddr_notify(struct net_device *dev,
 
 	skb = nlmsg_new(NLMSG_ALIGN(sizeof(struct ifaddrmsg)) +
 			nla_total_size(sizeof(__be32)) +
+			nla_total_size(sizeof(u32)) +
 			nla_total_size(sizeof(struct ifa_cacheinfo)),
 			GFP_KERNEL);
 	if (!skb)
-- 
2.43.0

