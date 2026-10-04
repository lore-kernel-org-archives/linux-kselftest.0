Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CDB44A414
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 17:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134186; cv=none; b=WdXcm8VFarfJ9lb74Rw+5WAUC1oyx8KWVwDK9azlke/pgooAf2+VPXmq6AMp1xu010qUFnE1wM+jv971X51RoXjg81ke9Rz7eZA/MyZrJuPShb3e57pTOc5t5KB9hsojQiGWcsP4ou2o6LeGYFiwFzLM+d37+YwjqOoWQanT1wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134186; c=relaxed/simple;
	bh=0IdcxFzam7QG4020+xfTCbZlrwLZGDQ0UkEWaUMrWIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8O185Q8LJu4FgKDgjY1U9cuP9Aqr7wXfN+MQUpb/R1HARHKzhjgE/oFohiC//fmP2Xva4197Z80a67icVx2xB+sDM3jD0RJc2U+NkKS5/VHaXHg+lu7011Ca7TTjkeLadztgAos5FnFvXHdqCURCy+pYAlpInPtwebAdJXaass=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=dIAIAd5G; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="dIAIAd5G"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e36c3478aso152534766b.0
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134182; x=1791738982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgkhJg3NRCmkewoiVqHo3ms5h7gv31W6oGsVKLV/gUs=;
        b=dIAIAd5GZXc391P3qHPRdtmiy/oM3wGfRMkuHiEM8auUrkEr+dqg6BPIdQtuZRno/E
         sZQ6sF1DRhMckDGy5BxNWSRwzgnA/4vN5C56uXc4mC7+SNPdwc5F2ZaektUsbW/xScpj
         rTunjyYB60Y5n0GUX/sshUkIv9OFhSmHdW3x83YcAdPvHkmnJk3vNhCcW0exuOInTYrS
         +GQEpyo/pJvBXhjTrvNLvmPaV5zwOA/E0mJvLT/XDsI+1RssDsWVXBAhbdVzG8ynjSYQ
         cOTFexwEB6CN0sfqHdFM7QUu4+kTh9ot9M+yk6fDyDCTuEAx99pVUJ2W0pQJiTN7uxsO
         7MBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134182; x=1791738982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dgkhJg3NRCmkewoiVqHo3ms5h7gv31W6oGsVKLV/gUs=;
        b=PWrUNrmaVbhuomduCOVyhpcEUb9vB85Fsx5dBlm7o3QtgeY4xDcZy3Db/9j8daj4yD
         P+gnydk96ydj2pf1GQjLEibamZufGei0Q9+acOgKIHPYb5DrfyQoalDbWpXKnYdwNw2p
         Cwqt+2/EPlF7xOWUqOTUbEwnqq2pIDZ0zYAbCs/dDK595bz9vzdcvKnWfkI3AKQ7mgdp
         hnITjDrvHWxp8iKjzitrEBOxfBZf5rjKh8QyjgXmasGQS+vF/TonrRqLkkgWn5GHDyrR
         MmvUfeDZvbrgIwF3DWIiK5SMWkHe7V9fXpW0r7xptAzT9olU0RxsGZ4dUbrSX03oXp5j
         7tAg==
X-Forwarded-Encrypted: i=1; AKwUvBydIUQDUFMA8YNWAWbTJ20/Yar+ewy8+Asu8kHgjJU/fGDJhNUPoq2sKdIRK+A5hA6qWd8XSyzzQGk5oi9PZH4=@vger.kernel.org
X-Gm-Message-State: AFuF++lVvJwOwRrNxc2t6jmhJVj+46NJ8/pdI/dwyqjtoewHL6tyNPUw
	TI4qslp6OIoDgmvmFom9xiO8Qco/4fnN9mlln9OFfYWROAyIY0rZrnH5Bg/XTYKeOA==
X-Gm-Gg: AYBFou3MkbXtyIbPvtNSoArVdsO7JCond2erKJHUeaCif3pqTHXy9noTXqiFM4sqBor
	Pf1y+dAFW+k7QPLH3bwF8BYUEja5ozR3jDaEkaHdDNGnkQz3oMoSFAZst0uaQN7jzCIBhT4QFr/
	kCxYsagsJRcEK9qbLIGN7abPA++YBwR9DaiZDaSOhk+uKD8iXJUnNOBRsZGZclXOsSAwFusXioE
	6Q48vVK2VH3JHHeGVwo0jy9omargcyRy9OO6FQuanbZmNYWiaCylo3vdVWbheVoYdSTBu3HutzC
	IJDRmpCK1B52q/g8enjdmlerNffRwUQmQ1ge7FOrW3Oy7UsgEcbJNLf1xLUU3msRGL4/tSUoMll
	9w0ANMLysH5oBRMSgfeDD8v6+kqbJwA1CLqCRG/rWXpQxds3Yk2sieNcKJJemuSlLLJkYFPVY90
	L1ybGCdAUo6oaQvSUlb7xgSEWZYa5YAc/toxm3ic1juDwNdL55O3TQnafxmEusTt9Fma8YgCl1Y
	8MlAmOH+Zk/h4zjbYasv9EWDmtXhbUXOBbwaaI59n+rVSA6D+7G8wPNw4E8qoQkEIty5XwvvPVh
	9T2Qs/FMhWl9YPywWtSfRz5/hJTPApNLT4dQbTJypLs5p2gjQHKrLQBZvR0LEZ0bq+JOF/0deeD
	EvhQgKW3kVcVhFJ6xqKmyDa1XAPJBJPttN1gBHtKD3VRbBFCiV7IzL2vPnaZ+usv/ol2Tr4Tbm5
	uNfBOFsLChvDVSxYlYlS3FNlSEi8s0zali6A==
X-Received: by 2002:a17:907:a648:b0:c29:4513:f6fd with SMTP id a640c23a62f3a-c2e6ee555efmr421126366b.35.1791134182307;
        Sun, 04 Oct 2026 10:16:22 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd278cesm314885266b.37.2026.10.04.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:21 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@nbd.name
Subject: [PATCH nf-next 2/3] netfilter: flowtable: update upper device stats in the fast path
Date: Sun,  4 Oct 2026 19:16:15 +0200
Message-ID: <20261004171616.3544880-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004171616.3544880-1-julius@bairaktaris.de>
References: <20261004171616.3544880-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The software fast path receives and transmits on the lowest devices of
the input and output stacks, so the bridge, VLAN, PPPoE and tunnel
devices above them stop counting after the first packets of a
connection.

Store the ifindexes of these devices from the forward path and update
their counters from the fast path. Each device counts what it counts in
the classic path: the IP packet plus the headers of the devices above it
(PPPoE, outer IP, inner VLAN tag), plus the Ethernet header on transmit
for Ethernet devices.

A GSO packet sent through a PPPoE device is counted once. The classic
path segments it in front of the ppp device and counts every segment.

struct flow_offload grows from 296 to 328 bytes.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 include/net/netfilter/nf_flow_table.h |  8 +++-
 net/netfilter/nf_flow_table_core.c    |  3 ++
 net/netfilter/nf_flow_table_ip.c      | 53 +++++++++++++++++++++++++++
 net/netfilter/nf_flow_table_path.c    |  9 +++++
 4 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index f2e2771f188f..1f451fcf05d0 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -106,6 +106,8 @@ enum flow_offload_xmit_type {
 };
 
 #define NF_FLOW_TABLE_ENCAP_MAX		2
+/* Devices above the flowtable device in a forward path. */
+#define NF_FLOW_TABLE_UPPER_MAX		(NET_DEVICE_PATH_STACK_MAX - 1)
 
 struct flow_offload_tunnel {
 	union {
@@ -153,7 +155,8 @@ struct flow_offload_tuple {
 					encap_num:2,
 					needs_gso_segment:1,
 					tun_num:2,
-					in_vlan_ingress:2;
+					in_vlan_ingress:2,
+					num_uppers:3;
 	u16				mtu;
 	u32				dst_cookie;
 	struct dst_entry		*dst_cache;
@@ -171,6 +174,7 @@ struct flow_offload_tuple {
 			u32		iifidx;
 		} tc;
 	};
+	u32				upper_ifidx[NF_FLOW_TABLE_UPPER_MAX];
 };
 
 struct flow_offload_tuple_rhash {
@@ -228,6 +232,8 @@ struct nf_flow_route {
 			u8			num_encaps:2,
 						num_tuns:2,
 						ingress_vlans:2;
+			u32			upper_ifidx[NF_FLOW_TABLE_UPPER_MAX];
+			u8			num_uppers;
 		} in;
 		struct {
 			u32			ifindex;
diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 03241d4bfd5e..2c9a0d97c9fb 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -122,6 +122,9 @@ static int flow_offload_fill_route(struct flow_offload *flow,
 
 	flow_tuple->tun = route->tuple[dir].in.tun;
 	flow_tuple->encap_num = route->tuple[dir].in.num_encaps;
+	memcpy(flow_tuple->upper_ifidx, route->tuple[dir].in.upper_ifidx,
+	       sizeof(flow_tuple->upper_ifidx));
+	flow_tuple->num_uppers = route->tuple[dir].in.num_uppers;
 	flow_tuple->needs_gso_segment = route->tuple[dir].out.needs_gso_segment;
 	flow_tuple->tun_num = route->tuple[dir].in.num_tuns;
 
diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index c8c29a9a1684..e1a3511d5f1f 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -453,6 +453,49 @@ static void nf_flow_encap_pop(struct nf_flowtable_ctx *ctx,
 		nf_flow_ip_tunnel_pop(ctx, skb);
 }
 
+/* The fast path bypasses the devices above the flowtable device. */
+static void nf_flow_upper_stats_add(struct net *net,
+				    const struct flow_offload_tuple *tuple,
+				    bool rx, unsigned int len)
+{
+	unsigned int n, vlan_hlen = 0;
+	struct net_device *dev;
+	int i;
+
+	for (i = 0; i < tuple->num_uppers; i++) {
+		dev = dev_get_by_index_rcu(net, tuple->upper_ifidx[i]);
+		if (!dev)
+			continue;
+
+		n = len;
+		if (!rx && dev->type == ARPHRD_ETHER)
+			n += ETH_HLEN;
+
+		if (is_vlan_dev(dev)) {
+			/* Q-in-Q: the outer VLAN device counts the inner tag. */
+			n += vlan_hlen;
+			if (rx)
+				vlan_dev_sw_netstats_rx_add(dev, n);
+			else
+				vlan_dev_sw_netstats_tx_add(dev, 1, n);
+			vlan_hlen += VLAN_HLEN;
+		} else if (dev->pcpu_stat_type == NETDEV_PCPU_STAT_TSTATS) {
+			if (rx)
+				dev_sw_netstats_rx_add(dev, n);
+			else
+				dev_sw_netstats_tx_add(dev, 1, n);
+		}
+
+		/* The devices below also count this device's header. */
+		if (dev->type == ARPHRD_PPP)
+			len += PPPOE_SES_HLEN;
+		else if (dev->type == ARPHRD_TUNNEL)
+			len += sizeof(struct iphdr);
+		else if (dev->type == ARPHRD_TUNNEL6)
+			len += sizeof(struct ipv6hdr);
+	}
+}
+
 static struct flow_offload_tuple_rhash *
 nf_flow_offload_lookup(struct nf_flowtable_ctx *ctx,
 		       struct nf_flowtable *flow_table, struct sk_buff *skb)
@@ -512,6 +555,11 @@ static int nf_flow_offload_forward(struct nf_flowtable_ctx *ctx,
 	if (flow_table->flags & NF_FLOWTABLE_COUNTER)
 		nf_ct_acct_update(flow->ct, tuplehash->tuple.dir, skb->len);
 
+	nf_flow_upper_stats_add(dev_net(ctx->in), &tuplehash->tuple, true,
+				skb->len);
+	nf_flow_upper_stats_add(dev_net(ctx->in), &flow->tuplehash[!dir].tuple,
+				false, skb->len);
+
 	return 1;
 }
 
@@ -1107,6 +1155,11 @@ static int nf_flow_offload_ipv6_forward(struct nf_flowtable_ctx *ctx,
 	if (flow_table->flags & NF_FLOWTABLE_COUNTER)
 		nf_ct_acct_update(flow->ct, tuplehash->tuple.dir, skb->len);
 
+	nf_flow_upper_stats_add(dev_net(ctx->in), &tuplehash->tuple, true,
+				skb->len);
+	nf_flow_upper_stats_add(dev_net(ctx->in), &flow->tuplehash[!dir].tuple,
+				false, skb->len);
+
 	return 1;
 }
 
diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 1e55644f2edb..ba5ac3ebe614 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -83,6 +83,8 @@ static int nft_dev_fill_forward_path(const struct dst_entry *dst_cache,
 
 struct nft_forward_info {
 	const struct net_device *dev;
+	u32 upper_ifidx[NF_FLOW_TABLE_UPPER_MAX];
+	u8 num_uppers;
 	struct id {
 		__u16	id;
 		__be16	proto;
@@ -187,6 +189,10 @@ static int nft_dev_path_info(struct net_device_path_stack *stack,
 		}
 	}
 
+	for (i = 0; info->dev && stack->path[i].dev != info->dev; i++)
+		info->upper_ifidx[i] = stack->path[i].dev->ifindex;
+	info->num_uppers = i;
+
 	if (nf_flowtable_hw_offload(&ft->data) &&
 	    nft_is_valid_ether_device(info->dev))
 		info->xmit_type = FLOW_OFFLOAD_XMIT_DIRECT;
@@ -253,6 +259,9 @@ static int nft_dev_forward_path(const struct nft_pktinfo *pkt,
 
 	route->tuple[!dir].in.num_encaps = info.num_encaps;
 	route->tuple[!dir].in.ingress_vlans = info.ingress_vlans;
+	memcpy(route->tuple[!dir].in.upper_ifidx, info.upper_ifidx,
+	       sizeof(info.upper_ifidx));
+	route->tuple[!dir].in.num_uppers = info.num_uppers;
 
 	if (info.xmit_type == FLOW_OFFLOAD_XMIT_DIRECT) {
 		memcpy(route->tuple[dir].out.h_source, info.h_source, ETH_ALEN);
-- 
2.53.0

