Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921DC3515C5
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 22:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795746; cv=none; b=O6saoKaCDQ34UF0sELUVYftdJEMXRkWN/QMAvAbBBpw/3BuBNS2ON9temnWC+NXkrDwTfLSN8IFp9cHDUkoch9zIuBgi12aYPozApIP8vm1Z6wVw8Q9Bfa/BzuqyW709nY2xQWZ6bV9DgMkjIDyN78iggAWVd+6eoez+h//Q6MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795746; c=relaxed/simple;
	bh=KOrzoFMc/M42D9OEiprV8gaUX5Hexkl9nZf5de3PolE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUHp3Pg5jMHU38kK/bwmnCfkTt4GJsJaO9lCQPha1yAMHCCDPGj68Xog20IpwqimAleQUJm82Q/WeouAWz40TV31v5Rjvll0nVSXionW+RBRA/kUmHSkdJ7H3AOcxbTGVd/3A3HG8IUe92WEoqjBvDPM95L16J4DU49sn1X8Ro8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGx0s4UG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGx0s4UG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4957952e0f8so2885395e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 15:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795740; x=1786400540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=taQYtKaGJ1AUPlJREC2nCfE3DkYRBYSu2aGQCYa2qxg=;
        b=mGx0s4UG2X6cR0A4l6cFeUXoZWdWeh0eQJJfnpicRiGw7zkq72mpaEnUD/DkcZFPzN
         hPM3udOD14VS4VQkfE3s3P0kKhlwAGKaUg3oIIYTJtC+kFrIo007cqTLuT7nqNY90rEn
         e1fg5xZxsUe9woTzb7OkvEXvFe5vFZWZTUGx20Y/RZOI1k9oU0NHIe4bR2coJP1buawI
         vaE6dsH6CwYxfJjJUUsFmJtTYX63IzLiJpSXfQVKmshd950fmZpJmopIfYAdjYWW+O43
         3Cpo5ZBlwHJHwwI4jCG7yuwA8ItSP/vjrSivKlFykkPKYD3pZdWoBVZTmBHCR4r4JYU2
         8gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795740; x=1786400540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=taQYtKaGJ1AUPlJREC2nCfE3DkYRBYSu2aGQCYa2qxg=;
        b=U6PPfZZcyfFBpz2j4NyVMiLVIRxSLPzfsRe0rtROh1dFMJdayQw1WVS6+OmePaK8yt
         7xRkWelPmGv6bwrJ/1xYdm6V+a747uiSyiAhz2AJhfqzKAoOKbfZEk6x8HO6fQ0c437F
         hBrXjqTgMaRT1O28BNJTxhFHbFjzYjmNguY+Amug3NsUivI7c+aI8B9eKqpQ/Mc+54w6
         /iWhbIt+pAa5cuQafdRSJxBXSeLA+3HZLXwg8cuv+kO4jzer4tNcfEILwuDVUtLvHhR5
         DWJlD2SY5G9wy6WKyS3DrfS8A87HOAqC4JgWWz1hp7+EE6g4vq4SOZGs9iYNi2bQ1WVw
         rs/A==
X-Forwarded-Encrypted: i=1; AHgh+RoEjfjuqAk12hank3kueQR/gNiC7NzHTG4jI9pdWfX2+jLL3OJR/O+3NW5Q7ZDRbO9qMNsujEuE/oN/fDW69a4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNEFdcvreLLxE5M/MkdGWx7Wt1P+om6lgJ1hdikiLEXWLGDOQU
	FlO9bUzaw3vUpIhJrHw9i4j/eHn4kvAP7ptAOyafAUElDqBQXxE5I318
X-Gm-Gg: AR+sD10dLcrQcoHHdQLBzeZcnoVZK5BoWYat45D0fNymf0Wv/KAKR9XUOu4l5MKcUqp
	EcWZuJiXNeAfUsJpVHiv6/o2eW8wlcdCZuNc3bE1WtYYccfA3Wkzn3gsglmydimGsPaXm4n+gBl
	GGG9Basf9DeiEWilGtqPutXQbTMwr+6yNTln5BrJnngxJPgQT3iCHc3ykSr0MDZXWbXaE/F8CWu
	6Iwx//M1QftEIadb4fJn2cLup+ctmky30NCN0P+LW0GWieA/LI4OlwKRSdtOPkY0/OtISWmR1KH
	9SDI7sueX3HR1yc4A3X8wCyknXuEr4U7T+y1OeqxdO0spcqFQCkRE0YxP6dhYUS0VD+hjCEdi7X
	ZOVsuLaOb65byprHLVnr6pzL1g40CmfJEAFimP8h1v72heGP4/mFCEdEHBYNWWg0n+x6GJx9SVN
	F010xgeXlObbdtVefFbGRmRJnFzePC+rgL0fKTbgQq4b8wVraM/ZANSAsCj1tgV9d83gOsBd6j5
	eMF2WwscAtSka06oFaU6557DWdzMymoXyegFvFgYCZKWoq+EMJCF2xQWTT48CKM0fUE/BbKdWJB
	RUPPOSBDzD6HUkg/Yxpauaym17M5Jg==
X-Received: by 2002:a05:600c:a01:b0:493:bea7:6b67 with SMTP id 5b1f17b1804b1-4980c6a1082mr130474085e9.3.1785795739723;
        Mon, 03 Aug 2026 15:22:19 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-012-149-099.77.12.pool.telefonica.de. [77.12.149.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm31668145e9.3.2026.08.03.15.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:22:18 -0700 (PDT)
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
Subject: [PATCH net v4 3/4] net: hsr: unfold GSO super-packets at the forward entry
Date: Tue,  4 Aug 2026 00:22:10 +0200
Message-ID: <20260803222211.877-4-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803222211.877-1-xiexinet@gmail.com>
References: <20260803222211.877-1-xiexinet@gmail.com>
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

Patch 2 (seqnr_lock shrink) is a latency/critical-section
prerequisite for this change; their automatic stable selection is
limited to 7.0 and newer. Older stable branches require an adapted
backport.

The GSO-drop accounting uses the same atomic legacy-stat helper
because the forwarding entry is concurrently callable.

Fixes: f421436a591d ("net/hsr: Add support for the High-availability Seamless Redundancy protocol (HSRv0)")
Cc: <stable@vger.kernel.org> # 7.0.x
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_device.c  |  2 +-
 net/hsr/hsr_forward.c | 50 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 2 deletions(-)

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
index 87cd72a1dc65..b1b75a25a01a 100644
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
 	DEV_STATS_INC(port->dev, tx_dropped);
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
+	DEV_STATS_INC(port->dev, tx_dropped);
+	kfree_skb(skb);
+}
-- 
2.43.0

