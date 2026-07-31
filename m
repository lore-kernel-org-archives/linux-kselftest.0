Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51E333DEE6
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488555; cv=none; b=arhH4EWgeax3amiIJ15lg4W72sJeXPks9DhtSio/waW7MzXHLXUqqv5KrfpWlwndRppvDQ/M9tS8JWpJOgmOzUZOEdSV7ob8fLIbajbyDCGLfEKPuLh006BO96JY+566UlDKsvfH/moW3E9dXz0XX3/K0/PeVy7WnYqI96UT2PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488555; c=relaxed/simple;
	bh=Gvo7dvsXJnKYRwaxoElTc0qa0PZfiQSj25oZnrC2+wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRky1d1LxnwPb33HKhAnyQBi536yKuzjEY/Wg1lQIPSQJlGKHIn8BSZ0rF8vDM7OjonyK7c9tq7owyvNHbe2FTMvr8qq29fclzgg8R9VfnMTOLtTx+QjFyJRQKtPiAWHvDzyWx9Up72FDbRqTDlenZRWvzOL7n84OsBt8yicvNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzqJhvjN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzqJhvjN"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47df6a5655aso83711f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785488550; x=1786093350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xuWU9LZrmF4Dt9/ovolj0itekaMNh8PVn0wC7NLE19M=;
        b=HzqJhvjNJk3ll97EBG8FOXtKAYUKNB7KEqD5Dq4ckYwAmFZzp7nqSBzHbtiW5v+Qpu
         zfvh7Da65+9JYQ3GGvfkabiHpVaQJvEc20PBi4Z7+z8tzQ8RxQ/7oD6odBL0tKyjnh23
         5Wwn1OVI33Y4rPk75xQFlFJcbCCIbcr1DtzWcjiMqFxJw6gHEyW+6uhZKlkLHmjHP7ft
         /xBwNd3eEx09mv4ZfMqIFO1a+66FqCfdmoc3zHmA0pJT5yrhqz0HyRBvouNTRYPgqrz6
         xsiGxInEam8ggpdTxNaZml4ukd4zh2Gubk/HIKnnzIBG5JvGUMDqX9BplWfrKjGWUyYt
         pTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785488550; x=1786093350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xuWU9LZrmF4Dt9/ovolj0itekaMNh8PVn0wC7NLE19M=;
        b=IVi20ji41L2LWteNDyr5XOlxzqt1HuyTsgVTLfIlUeq6zPbBvmu2W9l3OqbJP3nlEx
         sxOE60xMVZQPeoFOYoUm36HbwGdFGlwN5TERMYaWy/hLsCziLT+H5vRPaaV6UXoTIdOD
         MVgk1KnswCUeFko/55I8B0yX7A9CcmNxm8G4Nh5s/qdu2EZF2WY92d4pcY12m5WLFEph
         OVzrM7fuRrmCTxJe0r04k1AHW4+6q9kS7Sefk8qnzKpvL04+mNEeLdRFwRTa1lM0lTal
         EcrfV4M6OfOk5eDwThLnSDZvVE1bc0K78Jq4jBAcznXH7+5BoeXVXD7uzeoQ4eHSmp6I
         I/Qg==
X-Forwarded-Encrypted: i=1; AHgh+Rrz+x5xMIIEUr3ipbuIp/8GbdEKkx+haIjEqxQAfIOMjDL4M4imDdaxgQ2Q8J8WAbXeNFMK7CuLwfOMWHe9GoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxU4Q+EOEjuS2+Hd/cyQLm6DkxgJqApdktEvAu99rPe99b5Hgs
	Vv6UZecyuGN+JqvL72RZgkamolOC+A1WRW1Ef+RVCA5QcrwPDgQr0QrP
X-Gm-Gg: AR+sD13oeTvE6/jbe2uNvDO92ETVRUlJjL4NFg47XGRT17BrcsWyQwMG9/yLFJsFtZv
	aDoHryKgtMFx+yS6ugd651bcl9HAgGd9csflNypePtz8PmahyqhWJimbH/sC3ObJHQKP1tS6hOa
	vcaOziCni7QdnmzQc4mNG56IaTbc1bRbsm6m0WknNwj9ieqB4FtT+FUcWwMT+fbU8gpzohlozui
	+o81ytnStoXA5Vas/L1FV3ScYhEAkissswD1l5ivMFUjOav7zghb2TnB105csbwxuOB4+P/DXO2
	p3K3b+GjWhPVcegPv2pj7sOSbmJmM5NyEpUFj06UH8myiGG7lPagI1aI5PQM5iHoqm+YwQa+gVI
	Q0GxsKj+S37TPqiNYxvib3kkeJ0BrlbvmCw2Yv6W/UoNO44na9c16PFoqFUxNQ7LF1D/+lxx7AM
	2i7lERh4lxv0SwmgpbBdfWPHBqdFj78oI9kXUiR18IvY8SKehaTVqSjAjlYGEfRJh8aht13IGMf
	tsmol+8L3Jb529egyzLqdlvl1Kaurh8yowcpfSxncJ1jGqG+Xk9+zhGdUQI7s/Xy3tjLXuh4JEQ
	18x04XzmoNjAYgFEfA3dT6HGFldBqAHr
X-Received: by 2002:a05:6000:430b:b0:47f:9256:52c0 with SMTP id ffacd0b85a97d-47fd2b5498amr3276372f8f.3.1785488550061;
        Fri, 31 Jul 2026 02:02:30 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-184-219-058.77.184.pool.telefonica.de. [77.184.219.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm2965051f8f.7.2026.07.31.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 02:02:29 -0700 (PDT)
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
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net v3 3/4] net: hsr: unfold GSO super-packets at the forward entry
Date: Fri, 31 Jul 2026 11:02:22 +0200
Message-ID: <20260731090224.18-4-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731090224.18-1-xiexinet@gmail.com>
References: <20260731090224.18-1-xiexinet@gmail.com>
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
index 8e4158a9b57c..3fcdbac49c59 100644
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

