Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE673603C2
	for <linux-kselftest@vger.kernel.org>; Sun, 21 Jun 2026 19:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782068693; cv=none; b=KgNnifsipc9dWoL/2fT2h+5VV4TcQwKSYPIkrqWPfP+F7bl92ryojjDL5ewPTH8osyYUM9N1N5NfwYYPViKJltVNiX6U81W/dgPr3xklGvRyRAmCAuu6hft6KPg3l3g7h+jn55REbMWfmDKh8eShQxbUHhbzKUjz0c+D6ISujBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782068693; c=relaxed/simple;
	bh=RNftdiDjwqzdh+NAMe9OxTG27PbgiCUbdaHBnBAZPrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBs5ZMVEOB/yfAF4W9WkI8HzeWnqzRDLxqQpR+QqRzrS8KbpJDMhJ7goIJfjr4Db5E4OUN5STTn4bLxVbU4+7DWzaQikGWGgPcLBGobLg5MNtcZPYX/th1DigIyW+czTbJDrzPOCAmEnHrgWsmznSPQT7chCuWc8TS2IoLOhFi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYLlikqG; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYLlikqG"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bed2195323cso559056566b.1
        for <linux-kselftest@vger.kernel.org>; Sun, 21 Jun 2026 12:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782068691; x=1782673491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeezDZnqwxLLrYeZKbc2Tddo56pKPGHDghVq8T+N11M=;
        b=fYLlikqGcBY37kjTv31EGjwORdhZKgrhRLa8lNpKCklWpcUlHF75UpVk1VWClGsNbO
         IsX9+2WgP7W3uO1CN9ukSXcLxAw1Nm6sU0vTKIWtgqdIn33fRPAFoFSxsBxbjq1I/SV8
         3NW6Iapn4mwhH5/HZTzL2gqMgBj6v0QJPRoVMgjH+c7fPAD9WReT4vG+sFNnivtJq//+
         LnR6s2bKgMJo6R1VXgDUNjM5t2U/obqM9eIXc61BV6ZsqOk8/mgkFQhpGI687n8Z5Pn7
         CDqUdZyCzbmXGgksOpvKgG11E025Qogzjs44fwALO1CEIaCzoFOIdWKAiumbeygH2P46
         oXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782068691; x=1782673491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qeezDZnqwxLLrYeZKbc2Tddo56pKPGHDghVq8T+N11M=;
        b=m0k/GoQ/z0JwuZKEQip9JUhwJnlisGV/sHCEPYCjdfk/W7lYUQkim0Kx2sy/gwEE/d
         wKTtXLBoL1sogV4OOSd/LiGNKN20SWVr3qPlnVZIqLYCSUBwgZRvwEkQYMBzwObyeMwv
         CaLc94jApLFbq1J0z5h056MBhUebRa5nwCApnVtodj6VOButm9vYE+1fbKsP1/Fx+ZiX
         Ilgvng/8GIiLHVou8JZUW//HjCIgwWIDb3RNR8IiRO6Y95jBEDa2fa5n4/SAGfstCR/a
         Z7T2bOXm2WuTRtzqn382SLEiOGuv7rjJqV1upbLKiIaz7kgmXY37M5dPNLH7i3yWwpWO
         Qbww==
X-Forwarded-Encrypted: i=1; AFNElJ86OvT0ELS+AAU1GCJutuL4o5irrY9khpqI2YkK85n07+Zddpe8t4/GXObFv1ajD3FQezp0MAH2Uo5rX3X/Sww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy33BheJsdUvJYtJCyemVWrpYBuYe9mOPbtK6SpHzi18ebFBd66
	RGXIFAGMBFG5xK5tu6QdEi2+/ZwMYBmVabkzBNoePdbsWA4FuIDoiXBM
X-Gm-Gg: AfdE7cnF62D2ENZ5T/sEu3JVMwCrqSkUKPPXxnsDt5LuEV/GFfI0pppeNg4zWjwPuA8
	RhW5ZJXGozD/Vg56LpUSTyvxkol8w0ExLrqCIk8ar3MhxjHat8WYXjhLNnSHR4hy9Gu7uNIAz8Q
	HfX/ohroZo7DMEsQ7enBrdOJLB0LGWgHkcczCAbX79EFg84aLsVv+VvoSlLdTVw0gkwQnm7Djgz
	YTK/obcN39fbHx366MrU+FJDC5kW1ZIxMDHtng1YP08ynYHpDk0+J7ClaN5lEkEp7JuwxxRLK70
	e4aEVwFmi27XtH0wLVgMcX7lGpfYHqv9jUqaeb3JwbvGSa71rdGjgsUQTHGi1uX9RWQDsJqq9V3
	4Yx0QRwV/zjZ5TpnrVEfhCut69zkO3Y0HrZdWZqficyZhdeR9YIfUbLglJppv2Y2tDRxhkSrMKQ
	rCy07QQ5kTfD+m55px2poNGocW0otRSqXiB7uLMA09GU5lq6z+ZocE8N64jGF9IiABwRyDPjjPu
	F95Yg==
X-Received: by 2002:a17:907:3f89:b0:c05:a926:c2aa with SMTP id a640c23a62f3a-c0b74c782dfmr486206466b.37.1782068690765;
        Sun, 21 Jun 2026 12:04:50 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.164.115.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99977fsm230558266b.20.2026.06.21.12.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 12:04:50 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>,
	davem@davemloft.net,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next RESEND v3 1/2] udp: fix encapsulation packet resubmit in multicast deliver
Date: Sun, 21 Jun 2026 22:04:11 +0300
Message-ID: <8c6961b0e8e394669963fab9edf61bd019fcdc88.1782067871.git.littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782067871.git.littlesmilingcloud@gmail.com>
References: <cover.1782067871.git.littlesmilingcloud@gmail.com> <cover.1777934869.git.littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a UDP encapsulation socket (e.g., FOU) receives a multicast
packet, __udp4_lib_mcast_deliver() and __udp6_lib_mcast_deliver()
call consume_skb() when udp_queue_rcv_skb() returns a positive value.
A positive return value from udp_queue_rcv_skb() indicates that the
encap_rcv handler (e.g., fou_udp_recv) has consumed the UDP header
and wants the packet to be resubmitted to the IP protocol handler
for further processing (e.g., as a GRE packet).

The unicast path in udp_unicast_rcv_skb() handles this correctly by
returning -ret, which propagates up to ip_protocol_deliver_rcu() for
resubmission. However, the multicast path destroys the packet via
consume_skb() instead of resubmitting it, causing silent packet loss.

This affects any UDP encapsulation (FOU, GUE) combined with multicast
destination addresses.

Fix this by returning -ret instead of calling consume_skb() when the
return value is positive, matching the behavior of the unicast path.
This avoids growing the call stack compared to calling
ip_protocol_deliver_rcu() directly.

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
Assisted-by: Claude:claude-opus-4-6
---
 net/ipv4/udp.c | 6 ++++--
 net/ipv6/udp.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 70f6cbd4ef73..b0910659391e 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -2475,6 +2475,7 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
 	struct udp_hslot *hslot;
 	struct sk_buff *nskb;
 	bool use_hash2;
+	int ret;
 
 	hash2_any = 0;
 	hash2 = 0;
@@ -2519,8 +2520,9 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
 	}
 
 	if (first) {
-		if (udp_queue_rcv_skb(first, skb) > 0)
-			consume_skb(skb);
+		ret = udp_queue_rcv_skb(first, skb);
+		if (ret > 0)
+			return -ret;
 	} else {
 		kfree_skb(skb);
 		__UDP_INC_STATS(net, UDP_MIB_IGNOREDMULTI);
diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index 15e032194ecc..ff2e389e286b 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -949,6 +949,7 @@ static int __udp6_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
 	struct udp_hslot *hslot;
 	struct sk_buff *nskb;
 	bool use_hash2;
+	int ret;
 
 	hash2_any = 0;
 	hash2 = 0;
@@ -998,8 +999,9 @@ static int __udp6_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
 	}
 
 	if (first) {
-		if (udpv6_queue_rcv_skb(first, skb) > 0)
-			consume_skb(skb);
+		ret = udpv6_queue_rcv_skb(first, skb);
+		if (ret > 0)
+			return -ret;
 	} else {
 		kfree_skb(skb);
 		__UDP6_INC_STATS(net, UDP_MIB_IGNOREDMULTI);
-- 
2.47.3

