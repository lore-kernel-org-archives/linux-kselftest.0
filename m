Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079E838B143
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 22:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777935213; cv=none; b=lRCHyjxkGaAaox0+sd9DHU5+pP6DPWacp7fOKOB8Bi42Yrl5t4Cg9I248Y1eP5V2jGHaXKKRQa1gl69kXbEP2WsSPitojf42OAvrPakEwklfIHnr12fy1TZxNNcQzylafDfYzqfd/708w0eSNhliPzfjpqFCRfzSYia7oc9n9So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777935213; c=relaxed/simple;
	bh=SAsZJAe9WydKRLRZ02ebzE8gLRF83SfTmUajjfObGZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WagKJm1ysMbY2I031m+tfdwsoLHtGFd09hut/lhPMt7yxXQUan2qg3iDAZFtQ4x6o7byEK0jvWMUK2URZh4U6Elsc+D2yp+e709ydlEb2Pr2NLxPtccrQtuqA3L1lF+SEBMxx4rEsRkU+9vf5isHfci0By1vfui+vQesc0g3QNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Acy/vJ70; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Acy/vJ70"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38e7d983f50so52647811fa.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 15:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777935210; x=1778540010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOS6hbrW/VaDmmlN5BjcPm+kEsDqlTIoRXQ23SyQ2gE=;
        b=Acy/vJ70OPLLYMZK39axxmNd4rbur9FARbvzuNAffDvkSK4CW327reZs8yu5f2zoU1
         zbuwZ+o+heQFtWa2dS9Bx9M5ksJUaSTvoEj6oBaQadCASOFSRw2bSL0Hyf3kPNMkRWnD
         achfI80lLLS9xyHJS8O6p19kla2DIIhnvjWxFQfXY3iN6JkihSkFq9Ckb2s5NCL46A8J
         yY5jQVqTG7WblRvLe9//Nf3HcB0R57bf80MuX5nvMDITxbKIh++BHoPhFhqWeFfv3VJ/
         M9JNDrqG9KOoKHcqNIcZNE8BpiQ/RUKWlB5wovx5g+tsVcvI8zCk3GuwCbz31NwAgzD4
         f6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777935210; x=1778540010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xOS6hbrW/VaDmmlN5BjcPm+kEsDqlTIoRXQ23SyQ2gE=;
        b=ZVoIh/E85L7blQaFlZjav36CR2erSBq+qvXwsGYkSHv5bCfWjk6GXN8DCupdxrS6UO
         YvsHoq2ZjD1PfooQcCOlZZ1+Xe3dd+KSU71lJgjCBbXQbeX/72iviaNvPkoVEA2BjARd
         1ciHMRs5i+IpZ6+pNr4pgP4vePu14ZxS7qJ6v1J7aBEKPfJIAi1ThyEdKuO5Ey2jnSXf
         2opzGZgvvSavFjQ546T7l0Xm+1tl13VmqRFI8Ig2d7Cw8PLHiAW1kroEA4E21YZP0WsR
         a+P+xGoSbZmTYgPO/lJnv566bFOhhg4/PaSMF7YtlFpUEHOLuGhzy8kxKyPtZuussVeL
         7bHg==
X-Forwarded-Encrypted: i=1; AFNElJ8rF5EeruFjW1zQ44/6XA2niAcUTRBc8vORHAZxjPm17thrc++wXEyaw1Rd6AWY2tfZrGL9gqv84cOU4YKP6uU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS3sstfnFcbWrihyvhYaJO1DFCNA2OmFIE3anZOy65XtUbyl8G
	uLInFxtICPzhjjrPEx2MFfoMHJChaU2eCi1CmuwEHDWjAJvhwkNGEgz1
X-Gm-Gg: AeBDiev31QfrVptWyf99rTh0Fobt7eEYvVNLPeaSoH4jw5VFI1Iujaew93CcHmm/BNL
	WcR/rHvA5oxBxltsdlMSBdkPFW2MUqfnGmMAOXLnx0caUo8HYgmwkZValjWKhC/gyFqzlG8yxoG
	DMylnguqeQTHmxK85eItV4XWugGGZOLIImZNImjsJbtGH2MlvSHT/PipFUABPZPEyOfck1qz2aP
	5Xd6weJul0LyRxG/zOiD235T2foD9fz9CkUxB/hIhCDHu+Yy6g4tRcFPpEi6UhfvIPs2e95qOnf
	p989JvkW2fOpd0nB5Pj1FOUIAVBlLj6tPlxzDLHvtuzzPot6GmOfdtMqQLSzOi4FPgFljlaVlQF
	jS8eh1cegBQqupm9Gu5TlS81XNpm+fsvdIKSi/ZAZtJCMKrMneXWzUSR4cIJty5itOKfX2KG8+W
	cpjICP24QtGYi8g4yhjVlnIMRM2CheplwalQ37wgAiMWv97hkjZ5qTeW8bAQ38I/dSlTXUtVqrD
	lwKbUaRgOvTDV1vsirTsfimFLyTFwihEXY=
X-Received: by 2002:a2e:9646:0:b0:38f:e351:1e7b with SMTP id 38308e7fff4ca-393784b08aamr31226961fa.17.1777935210122;
        Mon, 04 May 2026 15:53:30 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([46.246.34.10])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3939b43a795sm15774901fa.35.2026.05.04.15.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 15:53:29 -0700 (PDT)
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
Subject: [RFC PATCH net-next v3 1/2] udp: fix encapsulation packet resubmit in multicast deliver
Date: Tue,  5 May 2026 01:53:09 +0300
Message-ID: <a66ed4176b14227ba4793d3fa495a611cd69db23.1777934869.git.littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777934869.git.littlesmilingcloud@gmail.com>
References: <ad_dal164gVmImWl@dau-home-pc> <cover.1777934869.git.littlesmilingcloud@gmail.com>
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
index e9e2ce9522ef..84a98631b556 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -2467,6 +2467,7 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
 	struct udp_hslot *hslot;
 	struct sk_buff *nskb;
 	bool use_hash2;
+	int ret;
 
 	hash2_any = 0;
 	hash2 = 0;
@@ -2511,8 +2512,9 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
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

