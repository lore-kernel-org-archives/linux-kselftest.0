Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCF3443302
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 16:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909594; cv=none; b=bfTq9o7Lbsw0fPf5BoVK6ZdlYcBSSLBulL4fT85ybKFEx6RfyKCYojPLj1iF7xS9P1WuumEvvC5g5SKnj0sdJzhHhRFrL2Wv0OylEd03YTqaRgLESiWDSyp6AqrhDpNXZjTgXY9zFgpZUfbeydI7iLHVfwNUXwsha0b8E0Kw2eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909594; c=relaxed/simple;
	bh=dAukikgscD/sy37SrCR+NUuKcEPuwimIfzZixY9SKkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1ovI4URUxF8r3n6k/ta/KaftaadYiI1xDdYg2rnm916dR4TsslQ7oomn8y2tkuLD1oGr4RgYxLntraKLMWMme6bsXecIAQSlFs5AsjexCP0Idvy1Nj3FGlihj6RXRXfh/Z/r9x5Twry5An26cWA5AGPCTf9f84vtrEYTShLaIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZAORtwr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZAORtwr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954b3c5cbeso818245e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 09:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784909580; x=1785514380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFxEw60vauemVEtCp0jQT47c7pb4PO17HGhXnCKMNEc=;
        b=WZAORtwrJFEGaA4SoodBrdr7jysg8NqStvzsuuecPN1zcg0fH3xutiCWdax1+6ay03
         pdDd6wXW5UmUCUEbrKkSZqRHedA0DI+r2eA1yLJlh8OLcgDAj5rosuP1jgEpAPpUiKfo
         RoXXD5aZSmdCmUpyvbmomksFvA/0/imqu7t9jNrQJw6PZ9Ka0TdfR6mp820eOwQ6om7C
         Ob5YvtqexJ+Axy0Hd0QzdXitQ6XJ85YubNrRg8yvPltJt9/UnEjZFA1iLwxh0UzsgfPJ
         g9nKrfIJMusiYCu9A4XaQlk5j9Hp20zQ9YrAHaiU9A2f0TgaOGsf5JSqlhu1nBIxhfUm
         Dvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784909580; x=1785514380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OFxEw60vauemVEtCp0jQT47c7pb4PO17HGhXnCKMNEc=;
        b=MIh6/2GSVCiSCFxZoOe3Ae5LtgaTYFRhQ+neodMho0YOABdp4q79Mlo9sZSKA6B65S
         6ql60ns36JZbHVRtfJV9PL86UYQvBQV+klr2JASeNe9tfvGNC0/QGLa1UqDe8jIje/jz
         l9A5zotx2vWNg56Xu8HLTb2t5E5/3yGOG21Cr23quRv+vWVkH0eoR7f11Lsqiso41kd/
         ME1RqzqUzsc6+A09flYqGO2EE1V5HlBugvhbChh83EOt2j6xL+nMHBEbZIy0A+869v5V
         t1WSFnf6qi9LN/J3C+bTrD3Sdy2sCuYu+KL7rvZTatv/0jfbj02Nsct+CephIk9iBL7F
         6dYg==
X-Forwarded-Encrypted: i=1; AHgh+Rqd48pmGY1gRxgfU7Pn8W5bTUwZFThPKfn1+d7/juhXsEDeXrf3wPZYfYlwUf55s9KgzKs70IHDJ3fSSAR2aa4=@vger.kernel.org
X-Gm-Message-State: AOJu0YylEDcfvnU7mKOHtBY8pEm21sn6VaEilYVkNgDzSGPDmqmQSayp
	2c5OEns2vt1K5U5lA9NG56id28/ZDa+E1CcFkbuVrRuMhzDZjGno+Tmd
X-Gm-Gg: AR+sD12vLa3Bz/AP8x9ri8AWMpL1rvVcPwDlRuVhzU2vfPA9O82HQzsmZsMMcrZ3s7C
	VGbwsgtmamA3FRmo415uIv0K/CnsXdz1D6qXeCY4cO982W9NisLaA+8jy7pV/ImFudoyxP7u36P
	7HjMTVvz1Gp17O+MX6g3M/+i9DbhqMV3tjlGjibI8Y8UV2ENIALF2/XAFFexV7mWrq2TAZaTGsd
	uV87sCqzr35cbEQoDHKGWkxgvu8cE4w4gpObghWzcsy0Jy9SZTpjpy9EGtlLRx5PtVoDV5enxa/
	5iZ1H/cqhnrUMlKBL7/C+uaBenvacj6wW0dHuwhhtfk0RKUfEw2O3kbUAYq4gPVXaWOGptZXD2h
	AKwGb5jeD8dqv2Sg5TuvGxrFKjI6rnItprXtbrS4SKfqUc6enZYJamdfxuKuzWeEh4otIJF3zxq
	aHHEz6qnEO5OGfT0sFGw/wWEBAUJHI0DjYuYxsUsQ1vIx8qINX/nH8xHT+5YDBSh9rf3gVDTf0T
	RQ4f+VvMFJiO86jTysY2E/9N57k3eDWcG3kusBOeP3kNZ+6iw==
X-Received: by 2002:a05:600c:4685:b0:493:f42e:1b3f with SMTP id 5b1f17b1804b1-4957ac0c193mr37717825e9.3.1784909579525;
        Fri, 24 Jul 2026 09:12:59 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-181-161-038.77.181.pool.telefonica.de. [77.181.161.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9928fdsm40969655e9.1.2026.07.24.09.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:12:59 -0700 (PDT)
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
	Xin Xie <xiexinet@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 3/4] net: hsr: unfold GSO super-packets at the forward entry
Date: Fri, 24 Jul 2026 18:12:52 +0200
Message-ID: <20260724161253.79-4-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260724161253.79-1-xiexinet@gmail.com>
References: <20260724161253.79-1-xiexinet@gmail.com>
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
index 3fd1762d891..248cbb142e2 100644
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
index 8e4158a9b57..3fcdbac49c5 100644
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

