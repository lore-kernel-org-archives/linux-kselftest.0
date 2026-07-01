Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF0C34CFD1
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 23:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782947462; cv=none; b=Gl33/viBJB4ReExspFYK5OErEpCu2zzT/HUstzY9qfbvETZjSrmSis6niQRtAJSYqIL32W0l2t3mBkNwv8HojlxowQC6EJVXouf8DRYj077cImK7qV+QLMp34xrTYm0dJJn+R/tEJBuNWZgCsOnyzrtNsSp3v5D7gmv6JaYPFvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782947462; c=relaxed/simple;
	bh=RNftdiDjwqzdh+NAMe9OxTG27PbgiCUbdaHBnBAZPrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOr+0vEJSZobtxoGfiNtYu6MLcO2ae3tV3/EjwW4+bJwyExvfOROHln+gRw3g64di6uyKpvxzOAlsuOq+StZKrQ2KbmCx5IegqxzDlGWtpjEruQY304quSk/Rhm+EV4x64czjpf9kR5xontuI/YGzQqhr9Ts2d1MGK1IDfRwBtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtbMKy5a; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtbMKy5a"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so2249876a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 16:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782947460; x=1783552260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeezDZnqwxLLrYeZKbc2Tddo56pKPGHDghVq8T+N11M=;
        b=ZtbMKy5aLkTJ496RVJvnCCeeQgA90R7v0weJYy3JzEusCAIzfPlXX0xNxBdcE1sb+p
         0zEYRJlz93b3sCug0cy15lLWE4YSf/0STdu60Jf8aUsH3Vqb0/d9OGNpFompVvU7bIFr
         L0OQT4d87VdV4bAbaf7SjFaU/+z2pe6oLF8SO8gpCtYMRglm3MyPvixn9dDrlNlTd6KS
         Sg9DX9oT7NkGaQwDzMuPw1aIleVIjgiEyOlbWfxw83pYV5Q+NXVyH3iVlYnr0zghstOJ
         E7DIEO4weri+QzhalM8ParBkHpEBFPuLJK2I0LKvT+ikeMFteJNxtR+qIOmXUEoDrqC3
         EAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782947460; x=1783552260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qeezDZnqwxLLrYeZKbc2Tddo56pKPGHDghVq8T+N11M=;
        b=je9mEeogjOw1xfFLxVYLBGsIsAOueBDloRuXWWoL0LlEnM91XcK2TgK4EeDuUe8/fN
         JcOEJS9Is+ZR108v/9IsqWJuwELw1RMg6KQwpK1PwIphMP/smrf/YHHp6aZ/P2d03jaD
         sIUI+WjRfIgFfjkJMdGMpjr9exEx0ls1yimzB2DzrbliEjjw6nQlwfHgStE1D5/pwoRc
         /pXW7zewCmOIWIZcsfUw4i5Id/mJVDnfRMezfAHdrdLj0oJbvcAYEzgGcuWoIRusGIG6
         sYi/6v/os9rqy96zikVvI6c86E4gfZjpprp3d1CYgS79bLwnoVcIZFdNN5YsAf5ksC+Q
         nimw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7nfNRq2hW8i5KlKMNacUXpK36e3L9awQdhlIaSTAPQ80tzKQkm1ZK9LfSobG4h7S6LyXomM9qa9PleALK01k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFYjBVQh4werJN+eChKUk7MtLtMYlbgaKVYI1SagC17ZRjuxZU
	NtYatXzwKVVdfLQi5wUgLAsBpQRhp+h3rEbwOHoOn3UHnGb/hrViUrYq
X-Gm-Gg: AfdE7cmjHxDRWaHMWB/YxPUDmm6JCmzVDA43jKTVGgN7PtWroEBui6IsnD6JRAVp/DX
	kiSkxOgCs8HCiTy+4DKQicOtJS0qjmVD/QvNWQxDFRqere/+bB+Zij18MXcJ3B24vWZGf7Yw0qv
	O2GkbhJDDahG71aOyiEu5Z9jW5aql+SOpTozANZgYP27Q7wCnqiejntAoVau5HgUcs0O5FVc/Fg
	olwf2zMO0ZLO1MubjRuHbLI3sCb0YeZA/7kMmyqpw5zokhCyrTPmoMMD7/jkfVUZleXHCbftZqJ
	jlkBhk7lfMkx3XiLzOskaV21biMedWnvH+4frNbLCdGRXZGsFjeLKVUkh3obyrtNv5yizpIPW0z
	iEARD6Pb5Q+WMXV1pGZj0boVJoe1EI5jwCUs1rIhAw9Qhj+8+ThH0KQTtBNsSZ5UGxmLZZ7fjFP
	Vf7DsinqjuoBccPm64ZrTUb85KZxfHPks00bBw6FrAoj15Ip66BaC0Z8Kz0Pf8PnE5TbUGlbxbl
	7ScpA==
X-Received: by 2002:a17:907:984e:b0:c12:4e0a:4587 with SMTP id a640c23a62f3a-c12aa176761mr137407066b.49.1782947459414;
        Wed, 01 Jul 2026 16:10:59 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.164.115.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629a1d4sm30663466b.39.2026.07.01.16.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 16:10:57 -0700 (PDT)
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
Subject: [PATCH net-next v4 1/2] udp: fix encapsulation packet resubmit in multicast deliver
Date: Thu,  2 Jul 2026 02:10:36 +0300
Message-ID: <47dc3d5fe519dc3e0aafa934020a343d8306af1f.1782945956.git.littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782945956.git.littlesmilingcloud@gmail.com>
References: <cover.1782945956.git.littlesmilingcloud@gmail.com>
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

