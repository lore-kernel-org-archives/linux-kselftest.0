Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418729;
	b=LA2naWeBtBOZFo8pWM+1bZILBzPj9PoPcLxdKBlm1Ft9tCg/kD3EUJ1SFePNTLRFa781
	 Qmnwh9PptAea9Whw7RtsHwbN+SAcMvK9XW3KADmFZR7OyV0/qxKicJg6HUQslOSYFKdWE
	 47p0nlH+nvJB93hIxClKYBuhsecsiklIIp7ht+VGbgZuOlMn+pw4Rm2IaJZd3SRrlTzq+
	 JYZkQuUEEn1G2ag3Tb0o09vJ4DWfpVHPM4PKkuEHb0NE13kQr2WpLbb/Q6Qj6oNE7Yz1C
	 dmD6fAY5gRoHK5kloMByUq0bqG4tyry6QbqoCXAalHwlofNkZ+x6qXAm/zu2v2cHP6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418729;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=yAFcMMpcVdnvQQ/dKl05fIo+KJrOAcQHh6FOcMX94kw=;
	b=DVdKXlTSnF/Ow7HHn5jax+wgkxCrHBysR6wrBGSc/20JZUrPDXW0vx4M/9uU+lm8fA+S
	 kQgD7ySxstsMeJvzdTHrkjx/2dDxVG0G31c/nZ40CcI/4Fpla0iPkKpr/kVU46ghFq4HW
	 Nz6abkayF9J5BpuwqlLVhc/Mp4E8NoXeCSYX0WYkJ105aCBWCxToGhUcZ6w2x2pHRBTS2
	 gSj9vCCPc6f5K8vjeI7/KrF3ItufmPP5KRycD6UVVfYyrU8RtL6vYizR/jWHGqEPo14+h
	 xbKnOBmemq5x2BOxPfc2+vbMFokcPl9/5y/V2Z7zTj90702yTW58AUDTrYVTUrrRwkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B29D606A31C;
	Wed, 11 Nov 2026 17:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B29D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id EE30B48292;
	Wed, 11 Nov 2026 18:38:44 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Date: Wed, 11 Nov 2026 18:37:51 +0100
Subject: [PATCH RFC net 3/3] net: test stacked VLAN headers before TX
 offloads
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
Message-Id: <20261111-net_restore_the-v1-3-6aaeffa601c9@proxmox.com>
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
X-Bm-Transport-Timestamp: 1794418723693

Cover the QinQ regression without requiring an igb NIC, so incorrect L3
header offsets are caught before they reach hardware offload processing.

The IPv4 and IPv6 cases fail without the TX header fix and pass with it.
All 22 enabled net_core KUnit cases pass in QEMU. This does not validate
segmentation on physical hardware.

Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
---
 net/core/net_test.c | 145 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/net/core/net_test.c b/net/core/net_test.c
index 2b5080c22663..73a795f1443e 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -1721,7 +1721,152 @@ static void netmem_ref_test_tcp_devmem_recv(struct kunit *test)
 #endif
 #endif
 
+/* VLAN TX offloads need the L3 header, not the inner VLAN header. */
+
+#include <linux/if_vlan.h>
+#include <linux/etherdevice.h>
+#include <linux/ip.h>
+#include <linux/ipv6.h>
+#include <linux/tcp.h>
+#include <net/flow_dissector.h>
+
+static void vlan_test_free_skb(void *ptr)
+{
+	kfree_skb(ptr);
+}
+
+static void vlan_test_free_netdev(void *ptr)
+{
+	free_netdev(ptr);
+}
+
+static netdev_features_t vlan_test_features_check(struct sk_buff *skb,
+						  struct net_device *dev,
+						  netdev_features_t features)
+{
+	struct kunit *test = *(struct kunit **)netdev_priv(dev);
+	unsigned int ip_len = vlan_get_protocol(skb) == htons(ETH_P_IP) ?
+			      sizeof(struct iphdr) : sizeof(struct ipv6hdr);
+
+	KUNIT_EXPECT_EQ(test, skb_network_offset(skb),
+			skb_transport_offset(skb) - ip_len);
+
+	/* Like igb, allow hardware TSO with multiple VLAN tags. */
+	return features;
+}
+
+static const struct net_device_ops vlan_test_netdev_ops = {
+	.ndo_features_check = vlan_test_features_check,
+};
+
+static void vlan_xmit_test(struct kunit *test)
+{
+	const __be16 *proto = test->param_value;
+	unsigned int ip_len = *proto == htons(ETH_P_IP) ?
+			      sizeof(struct iphdr) : sizeof(struct ipv6hdr);
+	unsigned int len = ETH_HLEN + ip_len + sizeof(struct tcphdr) + 2880;
+	struct net_device *dev;
+	struct flow_keys keys;
+	struct sk_buff *skb, *xmit;
+	unsigned int nhoff;
+	bool again = false;
+	int i;
+
+	dev = alloc_netdev(sizeof(test), "vlan_test%d", NET_NAME_UNKNOWN,
+			   ether_setup);
+	KUNIT_ASSERT_NOT_NULL(test, dev);
+	KUNIT_ASSERT_EQ(test,
+			kunit_add_action_or_reset(test, vlan_test_free_netdev, dev),
+			0);
+	dev->netdev_ops = &vlan_test_netdev_ops;
+	*(struct kunit **)netdev_priv(dev) = test;
+	dev->features = NETIF_F_HW_CSUM | NETIF_F_SG | NETIF_F_TSO |
+			NETIF_F_TSO6 | NETIF_F_HW_VLAN_CTAG_TX;
+	dev->vlan_features = dev->features;
+
+	skb = alloc_skb(len, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, skb);
+	KUNIT_ASSERT_EQ(test,
+			kunit_add_action_or_reset(test, vlan_test_free_skb, skb),
+			0);
+	skb_put_zero(skb, len);
+	skb_reset_mac_header(skb);
+	skb_set_network_header(skb, ETH_HLEN);
+	skb_set_transport_header(skb, ETH_HLEN + ip_len);
+	skb_reset_mac_len(skb);
+	skb->protocol = *proto;
+	skb->dev = dev;
+	eth_hdr(skb)->h_proto = *proto;
+	if (*proto == htons(ETH_P_IP)) {
+		ip_hdr(skb)->version = 4;
+		ip_hdr(skb)->ihl = 5;
+		ip_hdr(skb)->protocol = IPPROTO_TCP;
+		ip_hdr(skb)->tot_len = htons(len - ETH_HLEN);
+	} else {
+		ipv6_hdr(skb)->version = 6;
+		ipv6_hdr(skb)->nexthdr = IPPROTO_TCP;
+		ipv6_hdr(skb)->payload_len = htons(len - ETH_HLEN - ip_len);
+	}
+	tcp_hdr(skb)->source = htons(1234);
+	tcp_hdr(skb)->dest = htons(4321);
+	tcp_hdr(skb)->doff = sizeof(struct tcphdr) / 4;
+	skb->ip_summed = CHECKSUM_PARTIAL;
+	skb->csum_start = skb->transport_header;
+	skb->csum_offset = offsetof(struct tcphdr, check);
+	skb_shinfo(skb)->gso_size = 1440;
+	skb_shinfo(skb)->gso_segs = 2;
+	skb_shinfo(skb)->gso_type = *proto == htons(ETH_P_IP) ?
+				  SKB_GSO_TCPV4 : SKB_GSO_TCPV6;
+
+	for (i = 0; i < 3; i++) {
+		KUNIT_ASSERT_EQ(test,
+				skb_vlan_push(skb, htons(ETH_P_8021Q), 200 + i),
+				0);
+		skb_reset_mac_len(skb);
+		/* Classification after a push must still see all VLAN tags. */
+		memset(&keys, 0, sizeof(keys));
+		KUNIT_EXPECT_TRUE(test,
+				  __skb_flow_dissect(&init_net, skb,
+						     &flow_keys_dissector, &keys,
+						     NULL, 0, 0, 0, 0));
+		KUNIT_EXPECT_EQ(test, keys.basic.n_proto, *proto);
+		KUNIT_EXPECT_EQ(test, keys.basic.ip_proto, IPPROTO_TCP);
+		KUNIT_EXPECT_EQ(test, keys.ports.src, htons(1234));
+		KUNIT_EXPECT_EQ(test, keys.ports.dst, htons(4321));
+		KUNIT_EXPECT_EQ(test, (u16)keys.vlan.vlan_id, 200 + i);
+
+		xmit = skb_clone(skb, GFP_KERNEL);
+		KUNIT_ASSERT_NOT_NULL(test, xmit);
+		xmit = validate_xmit_skb_list(xmit, dev, &again);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xmit);
+		nhoff = ETH_HLEN + i * VLAN_HLEN;
+		KUNIT_EXPECT_EQ(test, skb_network_offset(xmit), nhoff);
+		KUNIT_EXPECT_EQ(test, skb_transport_offset(xmit), nhoff + ip_len);
+		KUNIT_EXPECT_EQ(test, skb_checksum_start_offset(xmit),
+				nhoff + ip_len);
+		KUNIT_EXPECT_EQ(test, (u8)ip_hdr(xmit)->version,
+				*proto == htons(ETH_P_IP) ? 4 : 6);
+		KUNIT_EXPECT_TRUE(test, skb_is_gso(xmit));
+		KUNIT_EXPECT_PTR_EQ(test, xmit->next, NULL);
+		kfree_skb_list(xmit);
+	}
+}
+
+static const __be16 vlan_test_protos[] = {
+	htons(ETH_P_IP),
+	htons(ETH_P_IPV6),
+};
+
+static void vlan_test_desc(const __be16 *proto, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s",
+		 *proto == htons(ETH_P_IP) ? "IPv4" : "IPv6");
+}
+
+KUNIT_ARRAY_PARAM(vlan, vlan_test_protos, vlan_test_desc);
+
 static struct kunit_case net_test_cases[] = {
+	KUNIT_CASE_PARAM(vlan_xmit_test, vlan_gen_params),
 	KUNIT_CASE_PARAM(gso_test_func, gso_test_gen_params),
 	KUNIT_CASE_PARAM(ip_tunnel_flags_test_run,
 			 ip_tunnel_flags_test_gen_params),

-- 
2.47.3


