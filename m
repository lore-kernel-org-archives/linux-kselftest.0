Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4D933C1AD
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786111682; cv=none; b=G71wLmCDFr/zKCyGllMQYV/gwWFgVBIRsZm0mZs0iKq0gRYXABMOX3VzldU0xnGVKQNPD9mQ5H7ZJ2ZnzwIUi3JRrUt6/txp0m96fa/Ko+M0BVh0fSWyLjPDS++pP4nj9rSZ5twUaWLEb8DUgRVAeCnZ7C/9nIin4UfXTnr6AFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786111682; c=relaxed/simple;
	bh=6ck7GW7JTZkGApm0lDedydnZ+9IMBNxhLrjVRuo1dq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+phgk/fPma/bzSnGw5ecIYY1eX2ZB4Eux74yIOWwYVvZyCAYz54+vvjASlUG3Imn62IwPgREnTE7gwlHVswehKs2oncYCK0kQEgstO95ydWaeM0COmCZKHbTl5OfkiElPT0XC09OwktjzeGlNco0e3+7FKAe2rUL0ieJqkyWP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBtWHMqi; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBtWHMqi"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f502ff678so413923f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 07:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786111678; x=1786716478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oE7F4Cq3TaG660Axwa91NtG4j0CcMsIY14xd/BazRYE=;
        b=XBtWHMqiTUSwLEC0zn94yBwoAb1Gr+xZCg9+43CiaRKXAuTBvRYcp7eMSQ4qA6Xx2P
         Hc986h43/hiyhP7PLM9u+n836zIi9D3ehZK07Qxx3NLldEwcUGFXXcg6S2DIsu1Qt3n9
         au3oqWvEazQFu613CnLTlDmtYs2owoDVXJo2U1VVfeZXifXuUxuOERZo0vDeMkD/jhea
         8EaG4a1scjW2yMK5xpLi+N7qwDl/1mLZMW059FkBCtRCOGoXFz50rcZox9ch0U8fIA5h
         NS18xbK02Bh+wjRRW2ZpL0S5eCIZkU8yAT16hz1CAsCrM6iFGWGCJaDUgQD4l7ehAJET
         GpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786111678; x=1786716478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oE7F4Cq3TaG660Axwa91NtG4j0CcMsIY14xd/BazRYE=;
        b=ni7jO/vzECWJk0/D6mmilnbmVKLsryh/GCsgox4d2N8vALQ7E5nAiXDatWTB1+YVha
         WLTPy0SExWF2vRLVbFmpjNTEoNI5IB53XcQGqmxYelbY4IAUZsHDG38T3MX/IvMQcOKw
         oyPDAhCX1wg/2AqVfaPedvYymmn6M82p1l/gaV+PMiHCLqNcss5h/o2M3FpWudWvyTFf
         16iC69sZq4nVl7L1zkY0ZpX0/OSJOB2AqorJ4+fYO9B3HU6naqmOBEQSwqOVHbktMA32
         jsHWjpzJoJrxTWLfJ7LvcrJCkuscayZy30E17av1vRLRrk5i4J4uien3FIn33pE1Oq9Z
         3qLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpm6w77N3jrCMEUP6AWslS3xzlgMA6KHLBUpXehJ3XIShEzyt9fHh6+dBwsc440OOZSS0Kwg93Bz7Y08B0ZKcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkJISophuFimtNAjj7VxEAS9EA47sBgVVJVWzzgNwXRhg2jOl2
	T4cQxKmjGCOg2hzQgFVBzf4mvjgC4zDsJaXdf+KeybUbabBg3DNPww+/
X-Gm-Gg: AR+sD13BW9n0FrQrxkAt+LH9j/QdZwtbFoa76K5nuOgjH6xTWc0Baw7WBKsUjC6ekqm
	0+dbNyfv7wLXBUVibV+Z8M113weHZefdNoIZOvm95HEZJMycIBBhf34Jw4RVPvXls4bfX46GWvA
	w97lu7NeTUMrdwf4R2Sjtv9qzEbUfKz2loHI8pTXIEDvh3W04r2bpgrXi6boeYc1AiLbE1n9/Ih
	vVQr+ZH8NtVrdQ7d4xCaL7uUu4HsynSyvLMOKarMa/0CJV5ll3WGYgA/jKnmaHhXRxzYWHtQHqA
	jiKdZHVDWCQxSB38UPa37lmP23Xb0R8SPyPmmKDNIjN7tE4rS/+7i49xSOwsaRDkAkYN/Vd0zzK
	xBUtbgDfZakaaWJi81yH1WG3mkIz2WyTbKToeV4SJBmYBm5Xujb0gT8ZbHUdhAjnyYBR/hWSmPb
	lexuxIDNyHwjiWmZxm+teMgXlXRaHdQX6ERwABJDlyRF6e96KzJLPwu/4KqQ4xk1vBavoZop0me
	6SZQwtvQmzTmRKkosTSQzTsvLtQ9RtDnjnSk6ZFPkpozPLkhGCucPI67+wDTFtGVfC6Vx8AGkZU
	QAaLD6KjXBOzNfGI6bNwgrg=
X-Received: by 2002:a05:6000:401f:b0:47f:7e91:3d55 with SMTP id ffacd0b85a97d-47fec520b24mr18027535f8f.2.1786111677830;
        Fri, 07 Aug 2026 07:07:57 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-179-201-133.77.179.pool.telefonica.de. [77.179.201.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506c0sm5980064f8f.11.2026.08.07.07.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:07:57 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	shuah@kernel.org,
	kees@kernel.org,
	petr.wozniak@gmail.com,
	qingfang.deng@linux.dev,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	xiaoliang.yang_1@nxp.com,
	skhawaja@google.com,
	stable@vger.kernel.org,
	sdf.kernel@gmail.com,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net v5 3/4] net: hsr: unfold GSO super-packets at the forward entry
Date: Fri,  7 Aug 2026 16:07:49 +0200
Message-ID: <20260807140751.1351-4-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807140751.1351-1-xiexinet@gmail.com>
References: <20260807140751.1351-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HSR/PRP require per-wire-frame tags and sequence numbers. Treating a GSO
skb as one frame breaks those semantics.

Classify GSO skbs at the forward entry by effective protocol rather than
ingress port. Segment plain aggregates and process every segment normally,
preserving local delivery and forwarding. Drop ETH_P_HSR, ETH_P_PRP and
unreadable aggregates because their per-frame metadata cannot be rebuilt.
HSR supports one 802.1Q C-tag, so unsupported stacked or S-tag GSO
input is rejected before segmentation.

In-tree software GRO does not merge PRP RCT frames because its IPv4 and
IPv6 length checks reject trailing bytes. This guarantee does not cover
device-specific fixed-on GRO_HW output.

Also remove GSO features from the HSR master's hw_features when possible.
This patch depends on patch 2 and the sparse-bitmap duplicate discard in
7.0 and newer; older trees require an adapted backport.

Fixes: f421436a591d ("net/hsr: Add support for the High-availability Seamless Redundancy protocol (HSRv0)")
Cc: <stable@vger.kernel.org> # 7.0.x
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_device.c  |   2 +-
 net/hsr/hsr_forward.c | 102 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index 3fd1762d8916..248cbb142e21 100644
--- a/net/hsr/hsr_device.c
+++ b/net/hsr/hsr_device.c
@@ -652,7 +652,7 @@ void hsr_dev_setup(struct net_device *dev)
 	dev->needs_free_netdev = true;
 
 	dev->hw_features = NETIF_F_SG | NETIF_F_FRAGLIST | NETIF_F_HIGHDMA |
-			   NETIF_F_GSO_MASK | NETIF_F_HW_CSUM |
+			   NETIF_F_HW_CSUM |
 			   NETIF_F_HW_VLAN_CTAG_TX |
 			   NETIF_F_HW_VLAN_CTAG_FILTER;
 
diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index 87cd72a1dc65..f42694cf4309 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -12,6 +12,7 @@
 #include <linux/skbuff.h>
 #include <linux/etherdevice.h>
 #include <linux/if_vlan.h>
+#include <net/gso.h>
 #include "hsr_main.h"
 #include "hsr_framereg.h"
 
@@ -732,7 +733,7 @@ static int fill_frame_info(struct hsr_frame_info *frame,
 }
 
 /* Must be called holding rcu read lock (because of the port parameter) */
-void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port)
+static void hsr_forward_skb_one(struct sk_buff *skb, struct hsr_port *port)
 {
 	struct hsr_frame_info frame;
 
@@ -761,3 +762,102 @@ void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port)
 	DEV_STATS_INC(port->dev, tx_dropped);
 	kfree_skb(skb);
 }
+
+/* GSO fan-out funnel: unfold super-packets before per-frame processing so
+ * each wire frame gets its own HSR/PRP tag and sequence number.
+ */
+/* Effective frame protocol of a (possibly VLAN-tagged) skb, or 0 when
+ * it cannot be determined or the tagging exceeds what HSR supports.
+ * HSR supports one 802.1Q C-tag only, matching fill_frame_info(): an
+ * accelerated tag must be a C-tag with a non-VLAN inner protocol; an
+ * in-band tag is unwrapped exactly once and a residual VLAN EtherType
+ * is rejected. Read-only; no state is kept beyond the immediate
+ * protocol value.
+ */
+static __be16 hsr_gso_effective_proto(const struct sk_buff *skb)
+{
+	struct ethhdr eh;
+	struct vlan_hdr vh;
+	const struct ethhdr *eth;
+	const struct vlan_hdr *vhdr;
+	__be16 proto;
+
+	if (skb_vlan_tag_present(skb)) {
+		/* HSR supports one 802.1Q C-tag only. */
+		if (skb->vlan_proto != htons(ETH_P_8021Q))
+			return 0;
+		if (eth_type_vlan(skb->protocol))
+			return 0;
+		return skb->protocol;
+	}
+
+	eth = skb_header_pointer(skb, 0, sizeof(eh), &eh);
+	if (!eth)
+		return 0;
+
+	proto = eth->h_proto;
+	if (!eth_type_vlan(proto))
+		return proto;
+	if (proto != htons(ETH_P_8021Q))
+		return 0;
+
+	vhdr = skb_header_pointer(skb, ETH_HLEN, sizeof(vh), &vh);
+	if (!vhdr)
+		return 0;
+
+	proto = vhdr->h_vlan_encapsulated_proto;
+	if (eth_type_vlan(proto))
+		return 0;
+
+	return proto;
+}
+
+void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port)
+{
+	struct sk_buff *segs, *next;
+	__be16 proto;
+
+	if (likely(!skb_is_gso(skb))) {
+		hsr_forward_skb_one(skb, port);
+		return;
+	}
+
+	/* Conforming plain-protocol GSO super-packets carry trailer-free
+	 * sender payload and are segmented here: each segment is delivered
+	 * or forwarded as its own wire frame, on any ingress role.
+	 *
+	 * The gate is content-based, not port-based. An aggregate whose
+	 * effective protocol is ETH_P_HSR or ETH_P_PRP cannot be safely
+	 * segmented and is dropped, as is any skb whose header cannot be
+	 * read or whose tagging exceeds the single 802.1Q C-tag HSR
+	 * supports. With NETIF_F_HW_HSR_TAG_RM the lower has already
+	 * stripped the tag, so such aggregates arrive plain and are
+	 * segmented.
+	 */
+	proto = hsr_gso_effective_proto(skb);
+	if (!proto)
+		goto drop_gso; /* classification failure, fail-safe */
+	if (proto == htons(ETH_P_HSR) || proto == htons(ETH_P_PRP))
+		goto drop_gso;
+
+	/* features = 0: request full software segmentation. tx_path is true
+	 * only for locally generated traffic on the master; ingress from
+	 * the interlink follows RX checksum semantics.
+	 */
+	segs = __skb_gso_segment(skb, 0, port->type == HSR_PT_MASTER);
+	if (IS_ERR(segs) || unlikely(!segs))
+		goto drop_gso;
+
+	consume_skb(skb);
+	while (segs) {
+		next = segs->next;
+		segs->next = NULL;
+		hsr_forward_skb_one(segs, port);
+		segs = next;
+	}
+	return;
+
+drop_gso:
+	DEV_STATS_INC(port->dev, tx_dropped);
+	kfree_skb(skb);
+}
-- 
2.43.0

