Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5504B422556
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432785; cv=none; b=pxBqtW0FMj1OSgnlxDivS0+K/Z8Po+lnaGnTM+k4VUNB77WPxK0oiRjt//aE556t2QXNJgPCbdeuMd1302MGvKBR8VpKvOfwqhp/52rU8tzB90nNlDnRD2xh1EBRJ2F7lLsoMv5/KpHB63iR3y/X9Sk/F1aq6pJlC5NMVb0yQ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432785; c=relaxed/simple;
	bh=ZhfPTxTDM0XTfrEN8iP4un243QGCjCDhkRg33/4q+TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QTFBnqCUA8zjLGavoOGgAwanNIHGHOvgzEWNWwyRDF9PWrnA2Xc7NetMms9gs5ZPDRva16WWjbRdEPXdP8Da5jG5/5aXx6IXQo0n+O5PODqFpqzijTQEor1jUfk2JuV9s/qZDRd/IpeQKbiCNdua/hx8WE7QG1fq4vztoO1sPYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDfn5Mg5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDfn5Mg5"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493bb0e2894so6534725e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 06:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783432782; x=1784037582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgLCQ0PmMK48lolw9HCY5HA9aD+FecKIRJFacwfrbFk=;
        b=DDfn5Mg5/cDJT6BjcWAg4CKuTLmkzy6mLlVEZE1tXMziUmcCed6LpPGwUxfZtfP5t8
         Bp+xULrjydO84ez0DlwCp3RZVioG/YDr2Yue1gKBLDX6baqQcBYbsfr3a1tfYns9IiCc
         x+vyKmgGifsddGtREhojMBbnMF+tNCVwiVs07pbsRL004y6eQ8Efy8z6e0ge6qPB7vet
         zy1G5WI2iS9lUZ/ZHIda717u/koE6Kqz20wlFACIxwJtsZuB2BQGgVNpqia3A100Mk8G
         +6EXRrwUcrrZPqBvHN8ReEoThxmeKUHJJhbX7ex8/UBMGjAa9lNaDCj0NbU4jy1BwR+M
         YR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432782; x=1784037582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgLCQ0PmMK48lolw9HCY5HA9aD+FecKIRJFacwfrbFk=;
        b=pk/Tgsy7Lbxr8HOh0nL1FTt9+AgF5DNcjSK+Vj5YMVWkXto4hWID2vSb5CMJsGfBQE
         rLvis7ac+itMV0zZwc6XagjWRTNuPfAP0FIdSnKfEsdRGsg0P45iZSB71k2i/3Wry4ux
         uLcpn9NeWELcGsjDlyd0Si9bRgje06xAxzJFuXqrFijdCCrk7LEAye67DMGi2wD/J8OR
         lydVVBpAc4NEq+w7bb9KcRZsyoyqmCbluNQ3aFi9neXmpqF8TXXwgizZmu9c4Hcxwf4j
         WUp8tM0FHNDZ2IHdO5D+3VYU5gHCluPu0ac/jmVqEP5TjHYlhHepTfZ2c8QjtC3/Ys96
         DIUw==
X-Forwarded-Encrypted: i=1; AHgh+RqEzdFeqT0gqrFG5NV+hh1P/XSHakO/MHkA7GvkjFB5kwILnoiRuZBk1bo9MIf+kJ+xSvGOexGEkw91XC9RcbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoiY1niuAQki3uw1gmzkjGjoIk02NeF5I1KOVjCBJhRfrYeZ3+
	gCMbKLYdo76iFbKkX7c3l2dZq1fFbr2aE2goehhibIqR+GX7Mwm/ZWFq
X-Gm-Gg: AfdE7cnZDo+5gQaGCgPtG9grRoGMQPMxS2Da6JMphm8rIELxkZCXzO6xx+Ptytv07aU
	NbGmM43InBKZT5QKUjI7W0Yo8u0Omm+oBNqvnhjw4uVKgFNpfa9gmJ+g6ug19muh6P3HtX1Zwuz
	UP28DIVo+n24Npz8LSYlcLibVPRmsg57PJL/WwI+OTPGMcaqBKCj4EbZZ/LHzHmYWvzES/HEb7p
	HH5FCK0qy9RBf36T691XXdX4ULnBgM/jwRzdCzcV/xh3fJ1G6cHLTVElZB5mJKWLy0cNy2nJZis
	1G2m58xTQJ40K85nKPQqs0GdetPyCc1huK4MyohUmYEmrE9IO6pbE27JoLy5KL68f5I7JhGlUEU
	srz4PTOcinwBpx4TPekWE9Ekh64RXhHk+F7sVwBSLgOG5dN1ZQpyKTUYvnxAoo56NtmnJ9eZCrQ
	5tvEoxgk9ouX9RDCnXOYqBZT9uoNRMGaHpquY61s6wwzN2OdT0ZEp5+dUgOHR848BikCpeLV7V7
	p41WdmPCJsDv/ifHlhHjbJ7ad6sjUeC02XbOsEdqeeL6jR6TIY=
X-Received: by 2002:a05:600c:c4aa:b0:493:c326:9038 with SMTP id 5b1f17b1804b1-493d0f39645mr96901265e9.3.1783432781326;
        Tue, 07 Jul 2026 06:59:41 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-189-165-250.77.189.pool.telefonica.de. [77.189.165.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f40d50sm67409615e9.5.2026.07.07.06.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:59:40 -0700 (PDT)
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
Subject: [PATCH net-next v3 1/4] net: hsr: add PRP interlink (RedBox) datapath and duplicate discard
Date: Tue,  7 Jul 2026 15:59:34 +0200
Message-ID: <20260707135937.18-2-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260707135937.18-1-xiexinet@gmail.com>
References: <20260707135937.18-1-xiexinet@gmail.com>
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
index 5555b71ab19..5af491ed2b7 100644
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
index 0774981a65c..efcd0acef38 100644
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
index e4492987127..8f708b6e6c3 100644
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
index c65ecb92573..127a3fb64d5 100644
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

