Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418729;
	b=VnDqDeh7Cqs2P/OSwSOiOkSWGalZhShJM8iSJ1cRbbmZtodYeH9snV+Y6YnGyH5bvZJ6
	 JFvbL2jjd0ExcQVzWxGhz7LbBTSOUkBCKJ9W/efwCGaQN8iY2drMoYTJeKaNg7LXlsKRh
	 58ddTid8HoyPlow09jp13HDRydrIyMf5rJ3G098cfcuj1PqarwsBexvUJZB1Zfl7VsPgm
	 V+I6uqNFOBbZgW3kt+Luw4DhGalc/R2dhkiv0WG03piaGhvZ84alghOwX7OEopqw+y/wP
	 SJvsDguPc6iECCea3iyvtGy+u/yf3jhNJKRmKL1dxGt3z8cnkGFQuhmvspvY6d0dXpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418729;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=E7m3c8vNY4e9niQFNFPSTIwQ27u9U/34uB1xD6ktbVE=;
	b=XuoLHEYLxbRXFvNwmCXmMTQYgjDfY8Bm/hSlVOSh9Q+V21t4m6ogJgpDrX5vgZeZDq9Q
	 Rof1Q4Kjt6+wB9r1f+uIp/xGE1ePJor7pjgfuKPkyZjc0M9Tsqjxofd4TpuqS2FR8ZV4j
	 h5fsCJagU1ue39g5SIBzrpKvAZB9udYPZF1G+tD+3IC0vRPoxz7x4TpRL8s2aMpS1kyea
	 pSk+VdE/oYZzvMN0x4YjR7V1TpAANnKJii4LcdGBdGnhgpbt3TbZ9xSGFH9MEYvzSQx6k
	 UYa8y/Uy0hYzPUnrVQdEHk2Zh1wgnVhnmJ3vTetOiIsvdebZml1QIwTEUF2cOmWPC9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3CE606A324;
	Wed, 11 Nov 2026 17:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B3CE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id D0B18482CE;
	Wed, 11 Nov 2026 18:38:44 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Date: Wed, 11 Nov 2026 18:37:49 +0100
Subject: [PATCH RFC net 1/3] net: restore the L3 header before VLAN TX
 offload checks
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-net_restore_the-v1-1-6aaeffa601c9@proxmox.com>
References: <20261111-net_restore_the-v1-0-6aaeffa601c9@proxmox.com>
In-Reply-To: <20261111-net_restore_the-v1-0-6aaeffa601c9@proxmox.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Boris Sukholitko <boris.sukholitko@broadcom.com>, 
 Aaron Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>, 
 Ilya Maximets <i.maximets@ovn.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dev@openvswitch.org, linux-kselftest@vger.kernel.org, 
 Gabriel Goller <g.goller@proxmox.com>
X-Mailer: b4 0.17-dev
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1794418723547

A second VLAN push leaves network_header pointing at an in-band VLAN
header. Drivers such as igb can interpret those bytes as an IP header
when preparing TSO and corrupt the packet.

Restore the L3 header before offload feature checks for VLAN-tagged
CHECKSUM_PARTIAL packets. Keep the generic skb_vlan_push() layout intact
because tc classification after a push depends on it.

This fix belongs in the common TX path because packets tagged by tc or
BPF do not pass through OVS actions. Keep it separate from the OVS fix:
OVS must preserve L3 before executing subsequent actions, including on
packets without checksum offload. TX validation cannot repair corruption
that has already occurred in an action, whether in OVS or tc.

validate_xmit_skb() also runs on noqueue upper devices such as bond,
team or macvlan. For CHECKSUM_PARTIAL packets tagged above such a
device, network_header then sits at L3 while skb->protocol is still a
VLAN type. The flow dissector parses the IP header as a VLAN header in
that state, which affects bond layer3+4 hashing and tc flower on the
lower device's egress. Bridged packets already get the same conversion
in br_dev_queue_push_xmit() since commit df356d5e81b0 ("bridge: Fix
network header pointer for vlan tagged packets").

The IPv4/IPv6 KUnit reproducer fails without this fix and passes with it.
All 22 enabled net_core KUnit cases and software tc_actions and tc_flower
tests pass in QEMU. Actual igb hardware TSO has not been tested.

Fixes: 938863727076 ("tc: adjust network header after 2nd vlan push")
Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
---
 net/core/dev.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/net/core/dev.c b/net/core/dev.c
index 3c58db732761..fa47fe60b444 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4219,6 +4219,20 @@ static struct sk_buff *validate_xmit_skb(struct sk_buff *skb, struct net_device
 		     !(skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST)))
 		skb->ip_summed = CHECKSUM_NONE;
 
+	/* VLAN actions may leave network_header at an in-band VLAN header.
+	 * Hardware checksum and segmentation offloads need the L3 header.
+	 */
+	if (skb->ip_summed == CHECKSUM_PARTIAL &&
+	    eth_type_vlan(skb->protocol)) {
+		int depth;
+
+		if (!vlan_get_protocol_and_depth(skb, skb->protocol, &depth))
+			goto out_unhandled_proto;
+
+		skb_set_network_header(skb, depth);
+		skb_reset_mac_len(skb);
+	}
+
 	features = netif_skb_features(skb);
 	skb = validate_xmit_vlan(skb, features);
 	if (unlikely(!skb))
@@ -4267,6 +4281,9 @@ static struct sk_buff *validate_xmit_skb(struct sk_buff *skb, struct net_device
 
 	return skb;
 
+out_unhandled_proto:
+	kfree_skb_reason(skb, SKB_DROP_REASON_UNHANDLED_PROTO);
+	goto out_null;
 out_kfree_skb:
 	kfree_skb(skb);
 out_null:

-- 
2.47.3


