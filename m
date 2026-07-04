Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7101C283FE6
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Jul 2026 23:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783208830; cv=none; b=pxXLa1z9YdyYE07/5FzY81rvx0WGSg9QOPndsaemnWBGcH6xRjyzeqZubcXAwJQD0/bgra63fEKeIl7ZypkKBagJ97tBs5ZfmuTPxQxnO8BfH/C9lb+YerjD7jsR0ZpEyO+XC/1/hgLlwxNJ/MEohjf/FAJi6MlpEWYPBHPi684=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783208830; c=relaxed/simple;
	bh=WmdVxG1qjyumTLg0dAYkqMTScBrx63gA3nVyRq5XgG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tpLHwuDbd91n+Mfkyvw/YOPcNT7PyyVOAiMIQWwkbzBIlhuVQ4zPuIJZIJk7Et6CiECNcYtimfo5x5hCkqsYTl5E9R9qD4mwtWkLHgVudzd/RoS6LWqLngt6YFQ8bgABMBT526SKyf97b/DlqIubUPCY/yXNWy9m7xT5k/Y/tiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLPwZYb4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLPwZYb4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4706f016316so200533f8f.3
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Jul 2026 16:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783208827; x=1783813627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2AK/8mBVRm/uASU3oq6CXiRGB/9zBaQ2taBmIKBqgA=;
        b=XLPwZYb41pfPaC0ovv/karFQTLFAp2SmbTk8rr5dI8DrZp72Rg/iXc0JEPsGyi1dtr
         /VJeETSB+GHfAZ3+htxi+kX9npUCJJACKmUChGbYhocbGsqxmUpYbA1BPKs6knjw63G/
         LQ/VDJAf0sj2dT5zfiW3llo1MngL6Dg85Y0BH+YJhdtEYxrlXvb9wg0FOWQZ645fXJdC
         MVV4g0vCja8KwRecPY4O168utBPrlqC7x05p/iVzOHQ1hJ6BIARlnHWfy97v8EhIQ90r
         e3IVpz2R+1bLmQ4gLl0kTbS1I7BPjNDsgV9FNS3V+LNqRcxteTwIIykhz8MK1POwCg9d
         nfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783208827; x=1783813627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2AK/8mBVRm/uASU3oq6CXiRGB/9zBaQ2taBmIKBqgA=;
        b=I1fYGw0OW+xt/l0OenxtiOT6zXxdhDbgNysQPvAsPVGCEzhnacwFNZViB5fx4/qPGy
         vMiZR4sp8ARJ0Hz7Mtk5OyIZLBxqpcGtKFbOeWp5mjnyNCQ2hkIFpqJA8HDmepKAO9go
         /py3V4c7+omi2KB5pt5ECYNFPdz6Cp6ACIbsgK+8orQIDAJpFXpusty6tl8Gi2IawW1h
         svrWQJqTAK0+0Px/C27RjMcryxJLIrvO4K3OMkBGzxNyR/SW3T02e+V8ECrEXqGNXKVz
         EhNj7o9UmP+Udlo6a+I3jsjeEnf6vuo3Hd/yYYWXWAGq3ZFZ4wnMbP7Otlhm+nBjPuRL
         mHog==
X-Forwarded-Encrypted: i=1; AFNElJ8U8JreNRUd1PxUdfLGcGTEIl5cLNrfuPHFAZUK3gxU9JhZiKjQClEXb+nfba1fOsZQtPB7n1cTug9BhZfNKSA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy88q8djGDKm8BxiDNXbJ4U5ul52ZiGlxMDW53eSO5hv1fqlZKx
	VYv6+sna1YNoW5FJ8JgERSJzgx4oT+CcuonB4MSFDKHYYe51or+gnygX
X-Gm-Gg: AfdE7cl9Yan3MOPI7eO5FjFTlEAbdHRf9aDuaXUEd3QlGmPO/zdVQnKIBoUqFf4rbjx
	jt/N/eThxI9P6+f3XmcSky15Di9XAoCKMJcgsAEsbWhEPPtzPV8/cC2pAXo2y5gHcZWA4CI87uP
	xy2UvYIDV6xBG6fK9kSBTmUxV2BzJ2DuZEmau+sY3kasb7ZOa080+pJR5sIYncTpIM9HgThIn1F
	YBnQ46Io4NsNb8Jsb6WTdKpCaaIMRFxJ3kMg0L//3eDbpkxjTmJBQ2B6jG96mXtLtyJDZckQ0ih
	DK4b7BxTRzP4Fr31jD8HZftsi5M4wxwBclUa9/Mw0GglbzYoxW278WdA37cDAT+IYawduVE1sh1
	xBPTxyK71EJS4IjT+muQVJzWiDiOwUW59xGFcmLJb8o4oIow9rITh5N7LGEG3HtLfR6yUac94/Z
	+WWYjqejM++wk/tewUb6nv+CwII6MKHzN+MZrGBAkxiEgIKmgmatt+QnKQDM9UylShw7shCmDns
	J90R6bHmVLBfkrJnjg80K0+ER1BSRbuwnxvJTJqidRd9zgK57I=
X-Received: by 2002:a05:600c:83c6:b0:493:cc01:8067 with SMTP id 5b1f17b1804b1-493d0f48594mr30891745e9.8.1783208826853;
        Sat, 04 Jul 2026 16:47:06 -0700 (PDT)
Received: from hpubt (dynamic-2a02-3100-5cf8-ddfc-6651-06ff-fed8-72a4.310.pool.telefonica.de. [2a02:3100:5cf8:ddfc:6651:6ff:fed8:72a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm216014125e9.10.2026.07.04.16.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 16:47:06 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net-next 1/4] net: hsr: add PRP interlink (RedBox) datapath and duplicate discard
Date: Sat,  4 Jul 2026 23:47:01 +0000
Message-ID: <20260704234704.4297-2-xiexinet@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260704234704.4297-1-xiexinet@gmail.com>
References: <20260704234704.4297-1-xiexinet@gmail.com>
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

Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_forward.c  | 49 ++++++++++++++++++++++++++++++++++++------
 net/hsr/hsr_framereg.c | 10 ++++++---
 net/hsr/hsr_framereg.h |  2 ++
 3 files changed, 52 insertions(+), 9 deletions(-)

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
index e44929871..7a7c52a95 100644
--- a/net/hsr/hsr_framereg.c
+++ b/net/hsr/hsr_framereg.c
@@ -199,7 +199,7 @@ static struct hsr_node *hsr_add_node(struct hsr_priv *hsr,
 	spin_lock_init(&new_node->seq_out_lock);
 
 	if (hsr->prot_version == PRP_V1)
-		new_node->seq_port_cnt = 1;
+		new_node->seq_port_cnt = hsr->redbox ? 2 : 1;
 	else
 		new_node->seq_port_cnt = HSR_PT_PORTS - 1;
 
@@ -649,9 +649,13 @@ int prp_register_frame_out(struct hsr_port *port, struct hsr_frame_info *frame)
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

