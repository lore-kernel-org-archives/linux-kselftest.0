Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B4438D3F2
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 20:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784319308; cv=none; b=KxpxDp3CIzYfMX49mlbFMX5NxDqDbqd5GhmskFwTCVsIHxgS7w03lWRwj5gD+0XjVTJK8ZEmg00E8R2wcL9xxlJ5ZqTaUPJt0tI3NsRHiTkVV1mNCjPaN1WFKun1amXmewf7qZPlAi1lD6J6EaEk7BUP8QIaJRzmS/6LhnBVBUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784319308; c=relaxed/simple;
	bh=oR/ROjLKlRFIjhcEbnpOOPpnmoD1Kqh0yynfxGlnces=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8/ELHPnvuFY5cLyxc/gIDE6fChB4LkHPRf+5K4oXjNrKeYIQwuf8t6D1I+QlowUVT7tjWXa0SdUXjBHYDb33Lbk+VvwQ8auOz6rQdh1PDRCMaCGb+lkd0rQLej5ivNgI2WAmnUL7a5F9Ii5E4p1mwv2XZ4VWTdlM+EgpagkUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrWeYEZY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrWeYEZY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c2c7770bso7236605e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 13:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784319303; x=1784924103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bp5Pw0SQqVz4tkHO7oYKinMfNGqk277KjrMzF7qehWA=;
        b=CrWeYEZY0wwjbpMInyRRlJDwvr5ZduiAJ98djn8tBpwheH5LStqvBYEq/4tAor/oCp
         sJbI/gXJ5Ah6DQHD3Wc4W5vG6i7PfNre1RpRgWlDN1KKZtIsFWNaXolqfY/S8quhNYW4
         tRsFp0BN3Nv46yA183JYJt1ZdsezqoPDHPHEEeRB+HpPi14RWkaIOMQvmbNgfWTfgDWo
         Uw6Xn2dc7tsJkCfnZmXk5SEslQ3lU2IsXBMYEct6ful19x2tb8oTJEL/GCQ2VxVsMnuA
         VAsaSs8hI/HlQyFYipo5wu+vSBKuna/dDLqSWRTH9snPFb2hSE2aIK3yc8JQ2DhSjXfZ
         EF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784319303; x=1784924103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bp5Pw0SQqVz4tkHO7oYKinMfNGqk277KjrMzF7qehWA=;
        b=WiFdGldurk5I89ZAUtQVYO9JfkyyprLpZs5jhW0qX4jNQFcTITO5iEJjzYtRzyiOHq
         +MQXUT1TAYBGhk8W1vO7M/l/ocsycBdnpCXY1wVNn9ZJ0wkiHH6mQnG5Moz/B3mszNe/
         4p5+6+0V3v15OBcRCk67G5GJfvDZGvTPZRkhc56UTv4m7EnWh56lINxipqq6DEoo9gIK
         DRGizCj/gOH2sbDtoNFUmjPQG69eXYazgeVj/whOoP8bTIbcWiSEHZDlv3HHZUtaDtpf
         23aqCmKE+vDQv+v0VLjEtSf9PaF1YJniUka/wT1eaxe4CxLxS8ucBkEzoo5y10267g9h
         a4KA==
X-Forwarded-Encrypted: i=1; AHgh+RoEl9Xgki0u8ttrrZbXxxdtM4HqLagPzVJvJRLpGPTdtSDT+9Mevx0UsfDb+VFm246iGqDWnZFas6lhBSTP6CM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvawD7iIAR/mK5KFNhiYOGo8kfClopNKzKH8ZxcQAt/tAkhhvQ
	NlkC4PHpUmyudik/CnL2ecoYDVCB3VttggE/pptFhrRSVHXQxVEvYtlC
X-Gm-Gg: AfdE7cmHqNLRt8NOZ1aOyPOzAWvXfY0TpaFNdHLj/l8g/opcS+isCKSmp1mDb8Y5a79
	Cdnpd30rK1YLc832kyQrVPJjmyB9iQCBE6LmZxl1VejgTg4eB7h66Q2hu8w+emSKMQkF1y3rZ9e
	BSmoxTk7eMLRj8yiicmHAaZAw72zO8qga5eeZ9QULfcboepK1GBwtcj4OMU9K1ABTqtNoI9Sdu4
	+PBKL35Mf/370cvJbaeo7tO9np4R3/TBT/8hkUy590xlOJHEFkMJaPuPOlaYbHqQofF8NclWITz
	SxaavA/Lp2AdjFv8q8U71cQnB6FaNpDII/bKkRwOZIwZW8BjlQpcB5Zu8vkcX+Dsa8ROPBYt6sX
	o9/uWulM6LMx20Ko/8dJVMDa7aZgmZsjIlYBeUK05EO85PDSv5qKSJkLxh+tdozbfjNieddXVUK
	0jfvEYQloB4EMeZYsXSwTqoXH29oGiPiHhGJeTNo8sDqDgDVhZObwvfzVDWMMoOzlrYBpeXXl1J
	MpY/v14okJM9xOLZ7G8cPcLCs51IQn9WJFfej5VGOnqu91k9w==
X-Received: by 2002:a05:600c:b8d:b0:493:b6a2:858d with SMTP id 5b1f17b1804b1-4954a51321cmr27185195e9.6.1784319302354;
        Fri, 17 Jul 2026 13:15:02 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-179-077-126.77.179.pool.telefonica.de. [77.179.77.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499a5847sm53179335e9.2.2026.07.17.13.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:15:01 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	wsa+renesas@sang-engineering.com,
	jie.luo@oss.qualcomm.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fmancera@suse.de,
	bigeasy@linutronix.de,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net-next v4 1/4] net: hsr: add PRP interlink (RedBox) datapath and duplicate discard
Date: Fri, 17 Jul 2026 22:14:54 +0200
Message-ID: <20260717201457.54-2-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717201457.54-1-xiexinet@gmail.com>
References: <20260717201457.54-1-xiexinet@gmail.com>
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
 net/hsr/hsr_forward.c  | 46 ++++++++++++++++++++++++++++++++++++------
 net/hsr/hsr_framereg.c | 14 +++++++++----
 net/hsr/hsr_framereg.h |  2 ++
 4 files changed, 61 insertions(+), 12 deletions(-)

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
index 0774981a65c..7734a521a96 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -440,12 +440,34 @@ static int hsr_xmit(struct sk_buff *skb, struct hsr_port *port,
 	return dev_queue_xmit(skb);
 }
 
+static bool prp_is_lan_dup(enum hsr_port_type rx, struct hsr_port *port)
+{
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
+	if (prp_is_lan_dup(rx, port))
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
@@ -453,7 +475,7 @@ bool hsr_drop_frame(struct hsr_frame_info *frame, struct hsr_port *port)
 	struct sk_buff *skb;
 
 	if (port->dev->features & NETIF_F_HW_HSR_FWD)
-		return prp_drop_frame(frame, port);
+		return prp_is_lan_dup(frame->port_rcv->type, port);
 
 	/* RedBox specific frames dropping policies
 	 *
@@ -466,7 +488,7 @@ bool hsr_drop_frame(struct hsr_frame_info *frame, struct hsr_port *port)
 	 * are addressed to interlink port (and are in the ProxyNodeTable).
 	 */
 	skb = frame->skb_hsr;
-	if (skb && prp_drop_frame(frame, port) &&
+	if (skb && prp_is_lan_dup(frame->port_rcv->type, port) &&
 	    is_unicast_ether_addr(eth_hdr(skb)->h_dest) &&
 	    hsr_is_node_in_db(&port->hsr->proxy_node_db,
 			      eth_hdr(skb)->h_dest)) {
@@ -706,6 +728,18 @@ static int fill_frame_info(struct hsr_frame_info *frame,
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

