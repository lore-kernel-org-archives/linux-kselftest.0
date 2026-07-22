Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DEA3F99FE
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784739383; cv=none; b=ham8ok63hemGtI2IhVnHmI468I5RgwgM+mTYaYUbecAYK53gJyWj5R6a6vfmBGux8EjEwJ6trrbLhf2yOzoxEMWi4m6bPP6lzn1nnC2MXFWkxU0k9oOz1nCTHBE1S31KRwF34+gD16hIVUJSWHQu/3qr7PxddXSdgUztnQypdyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784739383; c=relaxed/simple;
	bh=o/Bu15sDhEOsKHR4CQblrys7TkwgkSC18uEGHD2BjAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1Li9/3j40lyYHLhPfSeSa0d+MxV9KrnGG/0VDfuB3lo0XQ7tAxhCoElJsY+SpEgofIE9DwBy60J7hEv79Xd5/9F1FP2Bu/TJu23kX1efZCpuLWjlMPINSfdIEE+wAPqJ99gSHF/UmF0IYVZOLj/BFXhDx6aqlad7Zol9kvElBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHrmmaRM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHrmmaRM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49544f26c43so86955e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784739380; x=1785344180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bgp1uL2zdCSwtHxWPjmVsr5a9ctDEumlGTtccTCWom4=;
        b=nHrmmaRMbpx4oYhCymPzaKG9Ja5GZ1kYm/0+Lngb4dPD+nIGlHKlp0Q8IytcARd6XS
         beL5UJbMw7uYET0wSsFw9quDYiIgLayz/FK/2pBL8eB8Ne+JtiUYUz5xR/5+Y0AwbpHW
         J7z69h6ag1xZX8OZggrlcjcYEsJaoeEPBI1fUkt12zMbR42m1rxRDtEm9+1ZMWXG+SYH
         SYDCo1H7wM0l5ljWUw3BnakGkzKog4Zmgk5mPy6SJhZJvdNeNocoOTkhBEk0XRGyr38L
         JAcylGX+WKvebAJiTD/qOvo0p8rchKGhQHGhKCJqt8zhubgYOKQGcUoD6Al55WG5m/6j
         W0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784739380; x=1785344180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bgp1uL2zdCSwtHxWPjmVsr5a9ctDEumlGTtccTCWom4=;
        b=AyKGN6TLPt+vCmUwKq/H+kyG7ZCh2qAAjBLkAUHuf8US6HUviSXxhRwC9ZRJCn720U
         /ii4sb5a6oNiHWHptF76g6ml6Woyb1Jl4MsPcosSCNeym6luUrCZsxvJq6oH1aWafoLX
         NvPIUmIPu22Bo0SitWkiuJP0V2hj4FAzjTwYOj0OpBVa+KkdNWgRPXPY69QMWugKEfXh
         kEpcGRX8NReDEfn0dMROKd44rpGqe6UDSIER4ywL+2DsxpLuYkkszHW+BzBGPSy+eYoE
         P3TQf8E68aSZ+vFvJ6HiRp+HTgNt8ac9ll2y8O/J928QfBjZFMqvTZtpqpf2dvS2Ehsw
         d4lg==
X-Forwarded-Encrypted: i=1; AHgh+RqSIsB60Yp6UTeqKkfy7TgAL+jf+5mg2OO0hvKd0UaX2uDEsidpgd7BQ3UyvnoBe7NuI2wsTV4oH8FJXrPiL5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkmyBB/55Hyqx1Ngk+jxB/MBK5IjMBrddfMLW4pvnpkWORR+69
	SD8mm8dncRWmkRx8V6D5CHqmbEG1DXlZqKo3fDPCGeVRcv/nqnH4I2ah
X-Gm-Gg: AR+sD13gsYjSGqhlBO9hqlaUkrpTFjHi3XJgHMxI7lcZbhBGeeINHBjfc1OAbZ08twp
	ZekP+ZxBU+HP2ef1rly+WH0zU+sywJmaWpQdWKaRHNwEAGCmBTQbcg7S0wEOBtshSl9C6Ltqu/3
	S1mS5KrK+a30jYW6uV4flyRjYQKzCADfMvD4Zq4qxTbGfTMqz5H4a2nguXcpzz13BHmhKToSThA
	lFAKalNgsoUBO6JRP+kDvgy0YPgqDH5S1dmrH0QPlFxAIKruOQTLbaBUn88NkHs275QFMo2/zJS
	VFM3o3ys6p9roUahhao3GZ1/JvEY1UsYvvXezxkakTU/UUY59bdv4IyaPL8lP63AWBa3bFkE1V/
	EIcAZLp1g2r0v8MEDZe2oDkqB6f0G8NIDKCyEBAL3wYEH5U8fj60qIHKQNOpgCZEkGw0iew2Jcw
	Lsro+3OfexsfRqp9H/YyOl7Q4ndxy5APhXhpWeX0U928nDGZJ3cpjS3P/jC/rB7y8qyBBDQ3798
	h1pKNm0qzlxq6JAHFmFHW5DNXbnXa2YEQGvkQ==
X-Received: by 2002:a05:600c:1553:b0:493:f42e:1b3f with SMTP id 5b1f17b1804b1-49565988e61mr55330505e9.3.1784739379541;
        Wed, 22 Jul 2026 09:56:19 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-078-051-150-230.78.51.pool.telefonica.de. [78.51.150.230])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm7288629f8f.22.2026.07.22.09.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:56:19 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	qingfang.deng@linux.dev,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net 3/4] net: hsr: unfold GSO super-packets at the forward entry
Date: Wed, 22 Jul 2026 18:56:13 +0200
Message-ID: <20260722165614.124-4-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722165614.124-1-xiexinet@gmail.com>
References: <20260722165614.124-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HSR/PRP forward frames one by one: each wire frame gets its own tag
and sequence number, and duplicate discard is per frame. A GSO
super-packet reaching hsr_forward_skb() breaks that per-frame
semantics: it would be tagged and forwarded as a single frame.

Unfold such super-packets at the forward entry with the top-level GSO
dispatch: __skb_gso_segment() initializes SKB_GSO_CB() and performs
the L2->L3->L4 protocol dispatch (calling the low-level skb_segment()
helper directly is not allowed here -- it reads SKB_GSO_CB(skb) state
that only __skb_gso_segment() sets up). features = 0 requests full
software segmentation; tx_path is selected by ingress port (master =
locally generated TX, interlink = RX) to get the right checksum
semantics. Each segment then runs through the existing per-frame
path, which is split out as hsr_forward_skb_one() so that no GSO skb
can reach it.

Segmentation is only offered for the ingress roles whose frames are
known to be plain Ethernet: the master (locally generated) and the
interlink (SAN side, untagged). A super-packet received from a LAN
slave may carry per-frame HSR tags or PRP RCT trailers that software
segmentation cannot recover, and an already-tagged HSR/PRP
super-packet violates per-frame wire semantics; both are rejected by
ingress-port policy. (ETH_P_PRP identifies supervision traffic only;
a PRP data frame keeps its payload EtherType, so RCT carriage cannot
be tested by protocol.)

Also drop NETIF_F_GSO_MASK from the HSR master's hw_features so
locally generated traffic is segmented before reaching the forward
path whenever possible.

Fixes: f421436a591d ("net/hsr: Add support for the High-availability Seamless Redundancy protocol (HSRv0)")
Cc: stable@vger.kernel.org
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_device.c  |  2 +-
 net/hsr/hsr_forward.c | 50 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index 3fd1762d8..248cbb142 100644
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
index 8e4158a9b..3fcdbac49 100644
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
 
@@ -761,3 +762,50 @@ void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port)
 	port->dev->stats.tx_dropped++;
 	kfree_skb(skb);
 }
+
+/* GSO fan-out funnel: unfold super-packets before per-frame processing so
+ * each wire frame gets its own HSR/PRP tag and sequence number.
+ */
+void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port)
+{
+	struct sk_buff *segs, *next;
+
+	if (likely(!skb_is_gso(skb))) {
+		hsr_forward_skb_one(skb, port);
+		return;
+	}
+
+	/* Unfold only plain-Ethernet GSO super-packets: locally generated
+	 * on the master, or arriving untagged from the SAN side on the
+	 * interlink. A super-packet from a LAN slave may carry per-frame
+	 * HSR tags / PRP RCT trailers that software segmentation cannot
+	 * recover; an already-tagged HSR/PRP super-packet violates
+	 * per-frame wire semantics. Drop both.
+	 */
+	if (port->type != HSR_PT_MASTER && port->type != HSR_PT_INTERLINK)
+		goto drop_gso;
+	if (skb->protocol == htons(ETH_P_HSR) ||
+	    skb->protocol == htons(ETH_P_PRP))
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
+	port->dev->stats.tx_dropped++;
+	kfree_skb(skb);
+}
-- 
2.43.0

