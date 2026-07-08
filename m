Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87830345725
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 00:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783470924; cv=none; b=UWAN/cI8S3gqArsWJllOgXihIHoww0M78NQ+SKK8ROSIfYWOBqyh5cR9RG1LBz1/+mIoJdipOYwpw0n/8C6gqNjiZn024OG50j1z3eLnchnARK9I84keNqqtSrIbb8fcbZoj8p+pOvJChiv46lgKuPrdhaWPRicyIjcecAu50ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783470924; c=relaxed/simple;
	bh=kpQ7K618WEDQIaw+8rgkuKiLsx6rUKb4VMi31896/HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPHDuWoDh9ptMZUqP7y0/3tynjBp1o8oeRSlLQCqo6mfTcBZusoyeRdj6VbejzKl5dMNTjhDraJBgmbkQabSvtXAzTtQxvQGGGNe0gwb5oqhzF70Z6oxMVQIWlcE2jlXUMWOBXdes7pMNtxaJkCiRUhyL3G64V4fn1QlEOeNZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9ivoAUG; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9ivoAUG"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aec201b582so120513e87.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 17:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783470918; x=1784075718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gt8g1rhydfsnfi2/drmvhXiESWtFs9rzFECjecYmKDc=;
        b=F9ivoAUGbUlXnjJFjNDR3nPKDPwkFYAeo+x1O7FFpJK9iUlQ+MfrDsH9RX8/n6FyLd
         ahSadjFp9U//rHdqY8HSbSAjqv7BSLZyIjeKcxoUVkljvdwMBVhJpLJomONnFJohY1BF
         ESAaYVI8heMqJb6UHcAUkd6I00XhnvKBF4t/ZCbJl530Yf7S/WIbqShG0gfhZafqSK29
         gOq1Rgg81uXhs1BOqnvG73hfI1w6fMS+M607/8ObyIXujEferL8inLaW0XdSyz1Yj5x4
         TZGEJ2uzfBQeqLaghXy2K+rdaDqsKsLiy7yR4DUmd4B+j/9XP71ehnlGA8sjQsNRzreL
         53Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783470918; x=1784075718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gt8g1rhydfsnfi2/drmvhXiESWtFs9rzFECjecYmKDc=;
        b=Qh4Ja+jnK9zLV6n+ttbqnBuSh8tQqVw7JAnCJVHRJcg8+rxaQV0MXAer5k/2ImYBqi
         MlmZUmIJ+dLvJrj9RqNNir659VGTHFVJV1zoZ+2QVfqBKwmv/WlD6+hycpIzD13y7s1t
         CLt1t+hu7O5VhOlBJmVa2feD+3BU1AqdlEj1KLeyn8QYlfDH+0ZIGn5Gyn0VtBaj8+1W
         7QZDURq7GU6PXCTEfn90DPHNkUkAG1qgvtwjTt57BV/Va/VVuuVpp7Q2un21/duqwWkF
         iPQ9QXIsXyW4zkcyEUYH8ScZ7TnNpHFUHJqSeLQv6g8322GnhSuNfwvKVPhYraVUmG5K
         Gf3g==
X-Forwarded-Encrypted: i=1; AHgh+Rq3FsHu7v8k/kDwLrqVxAGOjOfHrWqxYCMV80pWFzK1ePzd1nP0S6jN8giPj0XJP5xS7u8Ca1mVofzeF3Yc1Ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbEB35Z+h9yf+U3SNhlaSDSYEuRdjAGZz5V5crf9lCiOmYDNdL
	fGtNNTlCHlI9PKnQzYUQ+wMog2ejXlRATpOrh1fk+CwfPEXvMwDjygP9
X-Gm-Gg: AfdE7cnXUfljjhoyUhy9c1mEcXT4USyi3a/MdU1m2/VTIWKyfypbVOK587I3utbpSjJ
	0tV1dDEMg04eWO8A5NsdA2Yfz3QrohgNLbaNu0+R/izpwalJEMRRVtr/7gDCXs/9JZhnvcOGFn5
	JBAmpN4F5jQgm/Rw72hlkPLj45tl5eZeQoulbW00thGyDvSLQnbpIHxX+CxUd1F2oesPERr/0Nb
	K6IzjJfiSPihaLSAo+MHTJ5qgll5Mt+gw7C0EhMaIzK74EM3bmtomB5weK9y4rxleAmj6q+Y6Th
	EkT2e5DcHmoYYkuHkqumJ1pSRLIJhbiUdjfxd8AL7prcosHQqvLcRR1w+vZtf656GZC+N1pvMY8
	ZkJ77BF3dIUf2yWsZeQcJSA03v95Mtroly7KPhaGtHpysFX3zc2zRxRX5oi3j+44gmPVN/iuyl4
	wQesuh5PyObZkY5ZpG4Ua8j7e9mS76DMumT+QQVN6A97+k+Z+d6iA7/5QkRPMciEjdUWNuo7ikN
	XjW
X-Received: by 2002:a05:6512:4604:b0:5ae:b952:6c with SMTP id 2adb3069b0e04-5b01141c3a9mr78738e87.13.1783470917699;
        Tue, 07 Jul 2026 17:35:17 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.139.182.77])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8dcsm4083867e87.11.2026.07.07.17.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:35:15 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v6 1/2] udp: fix encapsulation packet resubmit in multicast deliver
Date: Wed,  8 Jul 2026 03:35:03 +0300
Message-ID: <5372ccac062193147e02b991d5328a5c3fa3a85a.1783372173.git.littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783372173.git.littlesmilingcloud@gmail.com>
References: <cover.1783372173.git.littlesmilingcloud@gmail.com>
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

The unicast paths handle this correctly by propagating the return
value up to ip_protocol_deliver_rcu() / ip6_protocol_deliver_rcu()
for resubmission. However, the multicast paths destroy the packet
via consume_skb() instead of resubmitting it, causing silent packet
loss.

This affects any UDP encapsulation (FOU, GUE) combined with multicast
destination addresses.

Fix this by returning the value from udp_queue_rcv_skb() when it is
positive, matching the behavior of the corresponding unicast paths.
Note the sign difference between IPv4 and IPv6:

  - IPv4: udp_unicast_rcv_skb() returns -ret, and
    ip_protocol_deliver_rcu() resubmits when ret < 0
    (using -ret as the protocol number).
  - IPv6: udp6_unicast_rcv_skb() returns ret, and
    ip6_protocol_deliver_rcu() resubmits when ret > 0
    (using ret as the nexthdr).

Both mcast paths now follow the same convention as their respective
unicast paths.

Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
Assisted-by: Claude:claude-opus-4-6
Reviewed-by: Willem de Bruijn <willemb@google.com>
---
 net/ipv4/udp.c | 6 ++++--
 net/ipv6/udp.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 59248a59358c..d3ddcbfc8477 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -2476,6 +2476,7 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
 	struct udp_hslot *hslot;
 	struct sk_buff *nskb;
 	bool use_hash2;
+	int ret;
 
 	hash2_any = 0;
 	hash2 = 0;
@@ -2520,8 +2521,9 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
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
index 392e18b97045..0910cc171776 100644
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
+			return ret;
 	} else {
 		kfree_skb(skb);
 		__UDP6_INC_STATS(net, UDP_MIB_IGNOREDMULTI);
-- 
2.47.3

