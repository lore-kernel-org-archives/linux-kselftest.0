Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7974A372B24
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345297; cv=none; b=ZrquuZaaSBmB6nXGAbETMrXkTRLNj+Nn5jy5lYmxYkC43xP0ahzP6v00GLugjRQWJzm26zcToZ5SPORwqMn6J+J3KigK8CEM6pdIMqXBvbsELjgTgWeNBxo7f01r4/+akdyEquGHqwgiVe5ZDSBKWN79lDXvyBZPQR8jMMmZBjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345297; c=relaxed/simple;
	bh=l1fGYxVEEVenHMT9zCnH3xGBFZVleRaDauAxt1rQ9gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTdVqYrEDolWTddEH5XRQuFjymlrPWIms1v+y7NAMCDbnma17zu+20i3GBg5t3HEmVC5h8g5bF8Ey8puuxqm+mHwO3jSZzEVHDxDn0PojRboSC5KKJ7V2oiMZqMHT8Q1TQlk35G4xiEathV0x3HykorC5lGu0A53gW3IBLKfG+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUUhyZzV; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUUhyZzV"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-473987fc217so338595f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 06:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783345294; x=1783950094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CoFNlqrB40yGI11hmwewBS2Yo3/a4WHwTo3efmYOw0=;
        b=cUUhyZzVPoEgw3j/wL/Q3L6TNZngi9znKNzr6l6R6iqpmUyJOVX0N5r40/gmy/zhvh
         eJf5aHiCJL527gRqUa0OwzylU0r+enw+yXx5aFXzdNNzUnYsRPd372hq4DcxpGXq3lzC
         S5J69BpMuBpnYeHQv9VtYO1lZsJ0o04nyVWsWQkY/HR+p7N8aAquX/pZ8bbPGEEsvLgv
         YMmDmlvleCsP6TGF8dLx6fpAw0fJaWniIPcbe3A7xgQby9jRg9ZLJxK6iM7vQoBbtYKx
         1NkrrNsP9kNo8lwOgKEdkAADQ1nzevh3tmQwrd13gHUMAPOX9ldl2j60WrDfQfGf/ZMI
         bAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345294; x=1783950094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0CoFNlqrB40yGI11hmwewBS2Yo3/a4WHwTo3efmYOw0=;
        b=KzqE69HUxuSofe8wsTR/6kzz0NhmU31xlSljlzk3VMMYyUympsHsxcMHy8iN2xNztj
         sEGtUS2o9zXI5vzEKylDgE94eKRYadiY60NtlIM1mNx3c4P9NIVTMdb7dbQH/mM7w7Xk
         exIh5p89nXwOQbw2JsYp32hIGoFt2hw11JSMmRGninrBTvCvU29SXE/VqUtfCSCG8G7m
         JWjkM2YMkI5itCWXPk8jQRDXqYZjWPHgpqHUMPwMcNHa9nMM5nDX8EwTBxpbizd619Z7
         twf/2Qf+NJkaaWLby+4UTOUa4bA26xBHlxlNXiKBNRhl3VSB9uWQkaizLdqRSuTA6G0V
         hbyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3xApYN4/n3C0odJMCcvaYdvwke6cC6tUMty1LiaQBf5Ex+u2of+nsMRFx2EsApvYJ1rSGzXewNFM5s30KGj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcqtBQGodK5uO5P0RgZm9Lz3vUYF5EWiuNctWhFwhH8C5wFU1/
	weUjudArHA8igtMXj4PI6a46Que7AT6J8rsgXFHBGCGeAD7QvoaLp+rM
X-Gm-Gg: AfdE7ckviPup5lSvSeHvRaE0CQhUNlGPYui6rgv+59LSI/8Cltgwh+TV3WLmW/Vdjd+
	ElhcYz6jFqnMpcD97eLjFjdFFibyaJhCYlM7MHraDykdSW3Om3AM3KxRodGmUwOJOPIFEKgTU8d
	HCW3UWip5FuW8AjdCoRMwziuUD2tVz9GpdDLH0tsrhiE6YDMlmFJ2SkKImID9cKF84dLPMTw1De
	FXGGXxMSpVb0HEJorcr07OSNLE+B6zQJGx36r2xR9DgJEntuCVDRfqkiGga3fysMQJsLUQsDV6z
	8OA1/2X6qhdnq1xWTtUZGtwmQ4oXvqHMNEmZn2EnOPJD0b+r+hu9TYPD7VuRFHZIAIe07MndzXd
	R8rVrGfm6Wni5LI0GUmS1fI3LF+MxaUKoN0aQByemI5VMWrk3SV2WyxSMbmuMG4vRswRXDT1XHa
	1rtcZ4a2Vqa/Ymp30QvnnYti4f71KBFaIPelLDIcjXGlyFv69waOIO4E4fcnFBxousbmmHXh5bx
	yCyhp7O3gymiJjD+Rz8DY6Pnn3In44eXtKFlHlFr28hwXZriPM=
X-Received: by 2002:a05:600c:19c9:b0:492:7082:92e9 with SMTP id 5b1f17b1804b1-493d0de2a58mr72247015e9.0.1783345293723;
        Mon, 06 Jul 2026 06:41:33 -0700 (PDT)
Received: from hpubt (dynamic-2a02-3100-5b6d-48fc-6651-06ff-fed8-72a4.310.pool.telefonica.de. [2a02:3100:5b6d:48fc:6651:6ff:fed8:72a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm23960881f8f.23.2026.07.06.06.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:41:33 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Felix Maurer <fmaurer@redhat.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net-next v2 1/4] net: hsr: add PRP interlink (RedBox) datapath and duplicate discard
Date: Mon,  6 Jul 2026 13:41:28 +0000
Message-ID: <20260706134131.61659-2-xiexinet@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706134131.61659-1-xiexinet@gmail.com>
References: <20260704234704.4297-1-xiexinet@gmail.com>
 <20260706134131.61659-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PRP RedBox proxies SANs that sit behind an interlink port: their frames
must reach the PRP network with the SAN source MAC preserved, and PRP
unicast must be steered between the LAN and the SAN segment correctly.

Add the PRP interlink forwarding rules to prp_drop_frame() and give RedBox
nodes a second duplicate-discard slot so the two LAN copies of a frame
destined to a SAN collapse to a single delivery out the interlink.

The destination classification (is the unicast DA a PRP-network node or a
proxied SAN) is resolved once per frame in fill_frame_info(), gated to PRP
RedBox devices, and cached in struct hsr_frame_info, so prp_drop_frame()
stays O(1) and does not walk the node tables for every candidate egress
port in the softIRQ path. HSR RedBox frame classification is untouched.

Factor the LAN A/B duplicate test into prp_is_lan_dup() so the new PRP
interlink rules do not change hsr_drop_frame() behaviour, including the
NETIF_F_HW_HSR_FWD path which keeps using the LAN-duplicate test only.

Publish the RedBox state before the first hsr_add_port(): the slave and
interlink rx handlers are live from hsr_add_port() on and rtnl does not
stop softirq processing, so a frame could otherwise be handled while
hsr->redbox is still false. hsr_add_node() sizes each node's per-port
sequence state from hsr->redbox; a node learned in that window would get
a single-port sequence block, breaking the interlink duplicate discard
(WARN_ON_ONCE plus duplicate delivery to the SAN) and letting the
supervision sequence-block merge read beyond the source node's allocated
sequence bitmap. Publishing the flag before any port exists makes the
per-node sizing uniform by construction. This is safe: the proxy
announce timer is only armed from hsr_check_announce() once the master
is running, the packet-path readers of hsr->redbox tolerate an empty
proxy node database and an absent interlink port, and the
prune_proxy_timer is still armed only after the interlink port has been
attached successfully.

Additionally bound the supervision sequence-block merge by the smaller
of the two nodes' seq_port_cnt as defense in depth against mismatched
node sizes.

Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_device.c   | 11 ++++++++--
 net/hsr/hsr_forward.c  | 49 ++++++++++++++++++++++++++++++++++++------
 net/hsr/hsr_framereg.c | 14 ++++++++----
 net/hsr/hsr_framereg.h |  2 ++
 4 files changed, 64 insertions(+), 12 deletions(-)

diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index 5555b71ab..5af491ed2 100644
--- a/net/hsr/hsr_device.c
+++ b/net/hsr/hsr_device.c
@@ -768,6 +768,15 @@ int hsr_dev_finalize(struct net_device *hsr_dev, struct net_device *slave[2],
 	/* Make sure the 1st call to netif_carrier_on() gets through */
 	netif_carrier_off(hsr_dev);
 
+	/* Publish the RedBox state before any port is attached: the rx
+	 * handlers are live from hsr_add_port() on, and hsr_add_node()
+	 * sizes each node's per-port sequence state from hsr->redbox.
+	 */
+	if (interlink) {
+		hsr->redbox = true;
+		ether_addr_copy(hsr->macaddress_redbox, interlink->dev_addr);
+	}
+
 	res = hsr_add_port(hsr, hsr_dev, HSR_PT_MASTER, extack);
 	if (res)
 		goto err_add_master;
@@ -805,8 +814,6 @@ int hsr_dev_finalize(struct net_device *hsr_dev, struct net_device *slave[2],
 		if (res)
 			goto err_unregister;
 
-		hsr->redbox = true;
-		ether_addr_copy(hsr->macaddress_redbox, interlink->dev_addr);
 		mod_timer(&hsr->prune_proxy_timer,
 			  jiffies + msecs_to_jiffies(PRUNE_PROXY_PERIOD));
 	}
diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index 0774981a6..efcd0acef 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -440,12 +440,37 @@ static int hsr_xmit(struct sk_buff *skb, struct hsr_port *port,
 	return dev_queue_xmit(skb);
 }
 
+static bool prp_is_lan_dup(struct hsr_frame_info *frame,
+			   struct hsr_port *port)
+{
+	enum hsr_port_type rx = frame->port_rcv->type;
+
+	return (rx == HSR_PT_SLAVE_A && port->type == HSR_PT_SLAVE_B) ||
+	       (rx == HSR_PT_SLAVE_B && port->type == HSR_PT_SLAVE_A);
+}
+
 bool prp_drop_frame(struct hsr_frame_info *frame, struct hsr_port *port)
 {
-	return ((frame->port_rcv->type == HSR_PT_SLAVE_A &&
-		 port->type == HSR_PT_SLAVE_B) ||
-		(frame->port_rcv->type == HSR_PT_SLAVE_B &&
-		 port->type == HSR_PT_SLAVE_A));
+	enum hsr_port_type rx = frame->port_rcv->type;
+
+	/* Supervision frames are not delivered to a SAN on the interlink. */
+	if (frame->is_supervision && port->type == HSR_PT_INTERLINK)
+		return true;
+
+	if (prp_is_lan_dup(frame, port))
+		return true;
+
+	/* LAN to interlink: keep PRP-network unicast off the SAN segment. */
+	if ((rx == HSR_PT_SLAVE_A || rx == HSR_PT_SLAVE_B) &&
+	    port->type == HSR_PT_INTERLINK)
+		return frame->dst_in_node_db;
+
+	/* Interlink to LAN: keep SAN-to-SAN unicast local. */
+	if ((port->type == HSR_PT_SLAVE_A || port->type == HSR_PT_SLAVE_B) &&
+	    rx == HSR_PT_INTERLINK)
+		return frame->dst_in_proxy_node_db;
+
+	return false;
 }
 
 bool hsr_drop_frame(struct hsr_frame_info *frame, struct hsr_port *port)
@@ -453,7 +478,7 @@ bool hsr_drop_frame(struct hsr_frame_info *frame, struct hsr_port *port)
 	struct sk_buff *skb;
 
 	if (port->dev->features & NETIF_F_HW_HSR_FWD)
-		return prp_drop_frame(frame, port);
+		return prp_is_lan_dup(frame, port);
 
 	/* RedBox specific frames dropping policies
 	 *
@@ -466,7 +491,7 @@ bool hsr_drop_frame(struct hsr_frame_info *frame, struct hsr_port *port)
 	 * are addressed to interlink port (and are in the ProxyNodeTable).
 	 */
 	skb = frame->skb_hsr;
-	if (skb && prp_drop_frame(frame, port) &&
+	if (skb && prp_is_lan_dup(frame, port) &&
 	    is_unicast_ether_addr(eth_hdr(skb)->h_dest) &&
 	    hsr_is_node_in_db(&port->hsr->proxy_node_db,
 			      eth_hdr(skb)->h_dest)) {
@@ -706,6 +731,18 @@ static int fill_frame_info(struct hsr_frame_info *frame,
 	frame->is_vlan = false;
 	proto = ethhdr->h_proto;
 
+	/* PRP RedBox only: classify the unicast destination once so the
+	 * per-egress-port decision in prp_drop_frame() stays O(1). HSR RedBox
+	 * does its own classification and must not pay these node-table walks.
+	 */
+	if (hsr->prot_version == PRP_V1 && hsr->redbox &&
+	    is_unicast_ether_addr(ethhdr->h_dest)) {
+		frame->dst_in_node_db =
+			hsr_is_node_in_db(&hsr->node_db, ethhdr->h_dest);
+		frame->dst_in_proxy_node_db =
+			hsr_is_node_in_db(&hsr->proxy_node_db, ethhdr->h_dest);
+	}
+
 	if (proto == htons(ETH_P_8021Q))
 		frame->is_vlan = true;
 
diff --git a/net/hsr/hsr_framereg.c b/net/hsr/hsr_framereg.c
index e44929871..8f708b6e6 100644
--- a/net/hsr/hsr_framereg.c
+++ b/net/hsr/hsr_framereg.c
@@ -199,7 +199,7 @@ static struct hsr_node *hsr_add_node(struct hsr_priv *hsr,
 	spin_lock_init(&new_node->seq_out_lock);
 
 	if (hsr->prot_version == PRP_V1)
-		new_node->seq_port_cnt = 1;
+		new_node->seq_port_cnt = hsr->redbox ? 2 : 1;
 	else
 		new_node->seq_port_cnt = HSR_PT_PORTS - 1;
 
@@ -381,6 +381,7 @@ void hsr_handle_sup_frame(struct hsr_frame_info *frame)
 	struct ethhdr *ethhdr;
 	unsigned int total_pull_size = 0;
 	unsigned int pull_size = 0;
+	unsigned int seq_port_cnt;
 	unsigned long idx;
 	int i;
 
@@ -474,6 +475,7 @@ void hsr_handle_sup_frame(struct hsr_frame_info *frame)
 		}
 	}
 
+	seq_port_cnt = min(node_real->seq_port_cnt, node_curr->seq_port_cnt);
 	xa_for_each(&node_curr->seq_blocks, idx, src_blk) {
 		if (hsr_seq_block_is_old(src_blk))
 			continue;
@@ -482,7 +484,7 @@ void hsr_handle_sup_frame(struct hsr_frame_info *frame)
 		if (!merge_blk)
 			continue;
 		merge_blk->time = min(merge_blk->time, src_blk->time);
-		for (i = 0; i < node_real->seq_port_cnt; i++) {
+		for (i = 0; i < seq_port_cnt; i++) {
 			bitmap_or(merge_blk->seq_nrs[i], merge_blk->seq_nrs[i],
 				  src_blk->seq_nrs[i], HSR_SEQ_BLOCK_SIZE);
 		}
@@ -649,9 +651,13 @@ int prp_register_frame_out(struct hsr_port *port, struct hsr_frame_info *frame)
 	if (frame->port_rcv->type == HSR_PT_MASTER)
 		return 0;
 
-	/* for PRP we should only forward frames from the slave ports
-	 * to the master port
+	/* RedBox: forward LAN frames out the interlink to a SAN, deduping the
+	 * two LAN copies on a dedicated slot.
 	 */
+	if (port->type == HSR_PT_INTERLINK)
+		return hsr_check_duplicate(frame, 1);
+
+	/* For PRP only slave-to-master frames are forwarded. */
 	if (port->type != HSR_PT_MASTER)
 		return 1;
 
diff --git a/net/hsr/hsr_framereg.h b/net/hsr/hsr_framereg.h
index c65ecb925..127a3fb64 100644
--- a/net/hsr/hsr_framereg.h
+++ b/net/hsr/hsr_framereg.h
@@ -27,6 +27,8 @@ struct hsr_frame_info {
 	bool is_local_dest;
 	bool is_local_exclusive;
 	bool is_from_san;
+	bool dst_in_node_db;
+	bool dst_in_proxy_node_db;
 };
 
 void hsr_del_self_node(struct hsr_priv *hsr);
-- 
2.53.0

