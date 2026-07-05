Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9E2175A93
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Jul 2026 02:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783218992; cv=none; b=NH4RJJfNHlkOwBcoWRJq1MRMA3DTqf0u29GiA9wIL5bbb75rJKoPGccQr4I0TMZgLbjGAYWgNFVFSGmQhQQxdLcgcqiYYk7H0LZlSFJjC8UeE970sjuC6ZhdJydBYFdwoLXvbaUwpcZUWWrl/X8rklY1o+FjUAhsLnXO2jt40yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783218992; c=relaxed/simple;
	bh=+BArqPRi/HGb47SvX7vALOEV+D05PN6gJxn6aT+kPjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MVkKW7StHHQ8sfBP3PNyNMyTGN2a/lpQxa22jeEGO1fbzPC2K2IuMRLASp48cu8HuRRkg4B6gyziHe+nlNrlwwIZ7losyNhZ5YNEYfLdh03bYLzE+Fbb+qaiEbahTRm+kLRaKSGKnBcJwbaHqa1ZNjfkln3R8EhmmnQJY3U/X64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSDdMEq9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSDdMEq9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c125c082ee2so164365566b.0
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Jul 2026 19:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783218989; x=1783823789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AG88zQ4/Ea5c59EGNnHF8fES6bswAggUNG/bJaKr2q0=;
        b=RSDdMEq9O1Af+FRa24JBPvCQPIOZcdZkdI9j8xhWEwFcpMSH5FhXtHMIwgKSZBBPh8
         73lsH5IsMMxnmROKTSaNrwZmz852wu8QfOBwPh7jMnGroZxbtAIO7vKA5KvHpodKumIR
         ctxhfV0yzIWCFJlToXosdo4gmxr7kPyq5vadQinp2qV1UMFMTlQU7XqA/DLFH75eKa/+
         k6HLZZ07bQwOu+H8R7dfv6a9unVQNiXq0J0DjZiPCYj0PzgP2BrvC950sgGDsSZHojKF
         UE7SXzuHdvLlIQU65TVUeVJtvkFMkfb69QA9mf3UEhYFNRHgqVham8ZWniztsCrgPqbD
         tdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783218989; x=1783823789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AG88zQ4/Ea5c59EGNnHF8fES6bswAggUNG/bJaKr2q0=;
        b=ahS/HjX78b7WRyuWJANEVJCU+RkQvK+XI/X5ynT8m9nb4FWvoyZIUcy8o40SaGcrq/
         kJ0hS3zqMA2bvHhsH12dyAVely/YsZ6X/nNr/quUWCGLIAoaqfxnxsPegPXVQz7pFHtP
         qXDWe9T7MEXcr4+BgyMBrkpaElox8fExs+CPk9VjHea+acj/BCCgezyflNjduLEg2Nz2
         qB0E8DxE9gkHib3sdQ72YwrafJV1odHBtF0QyMEc0zmCq7pjIZIkFn++X1rlrn4Vydkt
         zYU/3hqf3u862N6lupERpCaJ44HfCTrYVPOO/FgL5MVBYSPqyt9qlShBsLo/GyVc/8qp
         O8qA==
X-Forwarded-Encrypted: i=1; AHgh+RqXfGricX09ZWVTdub1RNi+qtdT61GrcUWp2aoApyVTvKr2bnKZpYoLnsvG9HeOOPrpuAyV51z+q3cybQiTJjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8xDmNMta/4uGs+YSOhSMXtsIyHKZsrhwvyDq0npvsiQxn8lff
	EByv2eoeOgvwfdNOMXMEt2Xnv5dVzrYvup18pfyZQaYKYW+yMRhL1Fj/
X-Gm-Gg: AfdE7cnNtO8ueLXqwMtPZqr/YwLfVDZw9etUevcuwqcS3bluiD0x0MPGbqoo/SLTYiK
	b3NyV/wGxf38krgYfenIzAn49RmeKZO9sAif16OCwIWM64qzWpQXTDeLvbqrakOeC+/8qjppQ1G
	yIvV9be+UArYMsM8tkuwz81UbVlc7DvQyS1vepT0xbbsPcn9I9hygJTIWV3mm6bqcNdXcjTibT0
	shXUl7Fq5q5RSQ0GWjYHSbtPescoG1VqZMurB30TIFdm5c+XWVqpWsDYCUqsi3RGrPhEITQHXFO
	y07ViCWgkdIj5TyrzxlybXBsqmz3aspO5H2fh+pTpRYyHNei5dCmufgS44k++25OMH1kRPyGiBt
	HIOeYTPxlRf5xmw/6+6RsIrsNteRj9KZCPoibs/eVSKyjBANKkDmAT0HIn+bzi/mo97eIC2pZu4
	V/GQ1KW+zSnF+a6WNKKNiy1YmVhgkeJm2c9x5UdkVBIPSwF3x1Jnl4Lz+zfw==
X-Received: by 2002:a17:907:969f:b0:c12:34f0:49b4 with SMTP id a640c23a62f3a-c12e6bf61b6mr148343466b.55.1783218988698;
        Sat, 04 Jul 2026 19:36:28 -0700 (PDT)
Received: from dau-home-pc.. ([95.164.115.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12bc53e065sm463082166b.46.2026.07.04.19.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 19:36:27 -0700 (PDT)
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
Subject: [PATCH net-next v5 1/2] udp: fix encapsulation packet resubmit in multicast deliver
Date: Sun,  5 Jul 2026 05:36:03 +0300
Message-ID: <e00539aa8c6f9428e7e92be0c0271c0d7e13a33c.1783218197.git.littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783218197.git.littlesmilingcloud@gmail.com>
References: <cover.1783218197.git.littlesmilingcloud@gmail.com>
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

Suggested-by: Willem de Bruijn <willemb@google.com>
Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
Assisted-by: Claude:claude-opus-4-6
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

