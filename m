Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793554215;
	b=sDbYQTHna8V3tg/C7nCFCNkhAlkgqdCqlJ4xhca65/IIwWDl6Zk/Di4el4G6bXFL0qvZ
	 5W3Mdrg68XT6TSn+CGAr7qdcTPexanu4+BwTxZkZ/Df3z/7SRtpQ5oAf5kseCSEoM40Cp
	 p8gFtgkFRQ9T+5AF/N+ALIiQ69VqHKJeUwr/yXBwb5s/2AK+5y6nYQMqTr0XpcJ3fA9S3
	 jIOIvmhcGJZIONusw2G2M1mpfaemgaPdt5p9qGiFKBbfZx2nx+5t/9rZKw6auKi1epYVm
	 bEr5FkJ/VVN/8Jtc/3EtF547oQroo7FWZ5sB0tRNw9xQjWMoWVYhjRZdpWXudaHvDSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793554215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=h8oZgXrsWtNdxBo95ZuMY1ZDGtn9QAcnUMh/6pblsEw=;
	b=IEr4IcPCegoKG41f1C8pqera1G5q+YyTyLRatdknRU2YlR8a8d9eG7su6T+5+l9YOAYS
	 BeJ3VYFCRIXkG5klbvk19SGXm8bJJSJI14dD/89C+qOpOfKb+vos2D38pOCccRgElBorq
	 zj6UC9c0jqqO27lI5ejyvZKZ9NcGxzsd1C9KuvzDDDQKRUX+dZCZvBzD7Z7Yk1c0VHfql
	 i2O1f72sa9OS41uVzaKUbwDpPCd6re0YfDzC00Iv13JcF6KaHT6kldygiBcS1zC4zpMJj
	 +WNVZiX6pt4FziSb0wCSjGq7qySpVoT87OG+CXnBOeTkyCf9coBNQJonvpDfFeogRLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJBzmjvf;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B88D606A327
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 17:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B88D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJBzmjvf
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so829732a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 09:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793554214; x=1794159014; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h8oZgXrsWtNdxBo95ZuMY1ZDGtn9QAcnUMh/6pblsEw=;
        b=DJBzmjvfSco3FICFg2idv+0ljye0HNTj1MdvnD7nftPDGb8VlDqyReKmVc+brgqqZx
         qQfKLXru/2BHn89Xw6q/OxGwhNTqQeji7wfTKshpPGaBA0JMCmUzCFOB4qwTbg0BS30k
         xqxmYhI/Xfamjdr2+ELsO7+0l93qDVPLJIEb09CduJeBE+KGPN++YQmdmUbezKKCmwSI
         1d7YP6zUC0P5QLCrrWLOMgnQ9OpWwMhDO9lr9MdSQ1HmmH9wAmwGvCv8IwdYWVFz/nIG
         enW4g87Kq0h96XpT3XaU67d73zYqp/AtL8/z2y5JGDh4GsspcXF4CWU7+ZQADRPjE1kA
         5oWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793554214; x=1794159014;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8oZgXrsWtNdxBo95ZuMY1ZDGtn9QAcnUMh/6pblsEw=;
        b=vqSG04ZUmq2qliIsae16ySdawVrxcuJEC/vu9L3YBc/3j88yVVbcBrhgQuYlA4P7b9
         cr924H1ehTHYRq8NehfBCUG/AkItWFWNlHawEVi8x7qCavtmMF5s7ijURCxPeM5xp6cQ
         LtkLq6L8CLJ1LCrv2JTx5Q1pzMIe3Gqitu5s+Vr1MCrXXtTd7Ryy6WOd+YYZ0aY5hxTb
         ym/1Sf8gLtA/BuxePx84KQV1sfLeTsdb/6T/jH04jAjtIPacd6mYPkXF+QvOKgPPe0s/
         /JHrkqcYEnh96OowDrkHYB+yU06lL4+bh5Dcixj9As99T2tRUZel7CbAQmUBooyNV1Fr
         UT0g==
X-Forwarded-Encrypted: i=1; AKwUvByi+oHdGRF2drZGF5ITULNMyAuSCqofgEPP/ecTFn/SccPFe9BSDVjCNpC5bo5MVTfL8MgvASet4e4OkiHUbnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TCjVM3sr3o74Brg8YudkFaef3uGWGXHgdvKHXZ0OCVlh3CvS0
	/tUFeV9iileO5Q4bRZXEuD1PjhGhuPbAQL9gMRtOrwzCl7NFYnyaPDmN
X-Gm-Gg: AYBFou1dWcMZuQRkQAMuLVURgGQiVkTS0dAWmcrxvrP60rAHaSozPlBuTnr8uRgJ/kW
	ERI60D3JxYXTtJi/yVTyc53Ih6R9B7gN14SNQEwNduoCs9615oZs+j31hvm8KfRDHN/s7Uioqu1
	UKc+/4QV3x8caHG+f5e6gX5H4hEFUyYnRRZr9+quykoEghTrBho2/6LOHuTi/Ex9+380RNdDoCl
	2VBGa+dhl/LSNCG3jdPhahomK9o4RzoLxxKLLJ9QiSN4S6Zs44on5eqFFsXQqkSLmdich5PTyHC
	EmzI7eKhpTw6xP43SxQ6wuZWH124i63cFp+gur436gvynEFm8jzAX3ebu90w39RJtK4TqUEnf+c
	beFGsWvXv1KO5dyb0EzL2CDq9fJ1Mb3wiDCgqs15Ja50nk/PStGuIzi8i8KsB4Fq3Pj9ZtsFWye
	GuHZN1SmtDWlh9VXdHb4GbQcDEMvCjZ078SPjvYZEIFPusu/QrbEFbmBcj3xck5z4ri4NIGqBYY
	7/1uI2qhEvnX4jO7ANQblqPDnzN/NpjAc+aAXz1WpVXmkamXDAI7ZspFCVILhC4mSN81RlOiZEF
	qWGGH4zmb2/Tfgp+k/iOrCEDCVnpO7F51cDBBnzNo9Hyj8iXRBZkC9rmei3QE4jNnYX2FxQ9+QU
	fPEkH6VzDdEVUAPwBXmPpebBHYpCgGwMHwQ==
X-Received: by 2002:a17:90b:4a11:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3ae896f7fc4mr6014943a91.14.1793554213552;
        Sun, 01 Nov 2026 09:30:13 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9b1506sm14819745a91.15.2026.11.01.09.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 09:30:12 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 17:30:12 +0000
Message-Id: <DMK1WMB2XY42.29D4PNQZ4JVBV@gmail.com>
Cc: <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <horms@kernel.org>, <dsahern@kernel.org>,
 <idosch@nvidia.com>, <richardbgobert@gmail.com>, <willemb@google.com>,
 <ecree.xilinx@gmail.com>, <daniel@iogearbox.net>,
 <john.fastabend@gmail.com>, <sdf@fomichev.me>, <martin.lau@linux.dev>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>, <shuah@kernel.org>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net 1/2] net: keep the TCP fixed-ID flags on the header
 they describe
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Julius Bairaktaris" <julius@bairaktaris.de>, <netdev@vger.kernel.org>
In-Reply-To: <f689def2f03965d7e4c48455c3926d7475044910.1792857378.git.julius@bairaktaris.de>
References: <cover.1792857378.git.julius@bairaktaris.de> <f689def2f03965d7e4c48455c3926d7475044910.1792857378.git.julius@bairaktaris.de>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 08:46 AM Julius Bairaktaris <julius@bairaktaris.de> wrote:
> GRO sets SKB_GSO_TCP_FIXEDID for the outer IPv4 header of a TCP packet
> and SKB_GSO_TCP_FIXEDID_INNER for the inner header of an encapsulated
> one, and segmentation reads them the same way. Three paths do not keep
> the flags on the header they describe:

When the same mistake is made in N places the interface is the problem.

Before commit 3271f19bf7b9 SKB_GSO_TCP_FIXEDID described the innermost
header. Encapsulation didn't have to know about it.
That commit made it describe the outermost header.
Now every site that adds or removes a header has to move the flag.

This patch changes 9 sites and it's not enough.
xfrm_output() sets skb->encapsulation and SKB_GSO_ESP.
xfrm4_tunnel_encap_add() adds the outer IPv4 header.
SKB_GSO_TCP_FIXEDID stays, so ESP tunnel mode has the same bug as IPIP.

> tunnel GSO types of the removed header. Keep encap_level below GRE and
> UDP tunnels, as ipip_gso_segment() and the IPv6 tunnel handlers do; the
> inner pass then also masks the features with hw_enc_features, which the
> tunnel handlers have done already, and resets the inner headers of each
> segment.

This undoes
commit 5197f3499c47 ("net: Reset encap_level to avoid resetting features on inner IP headers").
With remcsum __skb_udp_tunnel_segment() sets NETIF_F_HW_CSUM after its
mask. The mask in inet_gso_segment() clears it again on bnxt and mlx4.
Their hw_enc_features has NETIF_F_IP_CSUM and no NETIF_F_HW_CSUM.
Then skb_segment() checksums every segment in software.

> The three changes go together: with any one of them alone, fixed IDs
> are lost in a case that works today, such as a packet encapsulated and
> decapsulated again without segmentation, or one forwarded into an IPv6
> GRE tunnel.

Lets keep SKB_GSO_TCP_FIXEDID on the innermost header.
The second flag describes the outer header of an encapsulated packet.
Willem's intuition in the review of 3271f19bf7b9 was right:
https://lore.kernel.org/netdev/willemdebruijn.kernel.a8507becb441@gmail.com/

                               this patch          flag on the innermost
                                                   header
  encapsulation                move the flag       nothing to do
  ESP tunnel mode              missed              nothing to do
  decapsulation                move the flag       clear the outer flag
  SRH decapsulation            move the flag       nothing, outer is IPv6
  FOU pulls offloads twice     needs a check of    clears it twice
                               skb->encapsulation
  GRE, UDP tunnel GSO          keep encap_level    as-is
  sfc, mlx5                    as-is               less code

Then no need for skb_gso_fixedid_encap(), skb_gso_fixedid_decap(),
the bool in iptunnel_handle_offloads(), etc.

Something like this (compile tested only, the mlx5 hunk was not built):

diff --git a/Documentation/networking/segmentation-offloads.rst b/Documentation/networking/segmentation-offloads.rst
index 25a8b7e..0f20bb6 100644
--- a/Documentation/networking/segmentation-offloads.rst
+++ b/Documentation/networking/segmentation-offloads.rst
@@ -49,8 +49,8 @@ The default behavior is to increment the IP ID with every segment.  If the
 GSO type SKB_GSO_TCP_FIXEDID is specified then we will not increment the IP
 ID and all segments will use the same IP ID.

-For encapsulated packets, SKB_GSO_TCP_FIXEDID refers only to the outer header.
-SKB_GSO_TCP_FIXEDID_INNER can be used to specify the same for the inner header.
+For encapsulated packets, SKB_GSO_TCP_FIXEDID refers only to the inner header.
+SKB_GSO_TCP_FIXEDID_OUTER can be used to specify the same for the outer header.
 Any combination of these two GSO types is allowed.

 If a device has NETIF_F_TSO_MANGLEID set then the IP ID can be ignored when
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
index 22fea47..b804a75 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
@@ -1175,12 +1175,8 @@ static void mlx5e_shampo_update_ipv4_tcp_hdr(struct mlx5e_rq *rq, struct iphdr *
 	tcp->check = ~tcp_v4_check(skb->len - tcp_off, ipv4->saddr,
 				   ipv4->daddr, 0);
 	skb_shinfo(skb)->gso_type |= SKB_GSO_TCPV4;
-	if (ntohs(ipv4->id) == rq->hw_gro_data->second_ip_id) {
-		bool encap = rq->hw_gro_data->fk.control.flags & FLOW_DIS_ENCAPSULATION;
-
-		skb_shinfo(skb)->gso_type |= encap ? SKB_GSO_TCP_FIXEDID_INNER :
-						     SKB_GSO_TCP_FIXEDID;
-	}
+	if (ntohs(ipv4->id) == rq->hw_gro_data->second_ip_id)
+		skb_shinfo(skb)->gso_type |= SKB_GSO_TCP_FIXEDID;

 	skb->csum_start = (unsigned char *)tcp - skb->head;
 	skb->csum_offset = offsetof(struct tcphdr, check);
diff --git a/drivers/net/ethernet/sfc/ef100_tx.c b/drivers/net/ethernet/sfc/ef100_tx.c
index 0300575..162cfa5 100644
--- a/drivers/net/ethernet/sfc/ef100_tx.c
+++ b/drivers/net/ethernet/sfc/ef100_tx.c
@@ -201,16 +201,10 @@ static void ef100_make_tso_desc(struct efx_nic *efx,
 	bool outer_csum;
 	u32 paylen;

-	if (encap) {
-		if (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID_INNER)
-			mangleid = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
-		if (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID)
-			mangleid_outer = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
-	} else {
-		if (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID)
-			mangleid = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
+	if (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID)
+		mangleid = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
+	if (!encap || (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID_OUTER))
 		mangleid_outer = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
-	}

 	if (efx->net_dev->features & NETIF_F_HW_VLAN_CTAG_TX)
 		vlan_enable = skb_vlan_tag_present(skb);
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 6f7fec2..ac3f664 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -5535,7 +5535,7 @@ static inline bool net_gso_ok(netdev_features_t features, int gso_type)
 {
 	netdev_features_t feature;

-	if (gso_type & (SKB_GSO_TCP_FIXEDID | SKB_GSO_TCP_FIXEDID_INNER))
+	if (gso_type & (SKB_GSO_TCP_FIXEDID | SKB_GSO_TCP_FIXEDID_OUTER))
 		gso_type |= __SKB_GSO_TCP_FIXEDID;

 	feature = ((netdev_features_t)gso_type << NETIF_F_GSO_SHIFT) & NETIF_F_GSO_MASK;
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 6787fcf..6eb913e 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -716,9 +716,11 @@ enum {

 	/* These indirectly map onto the same netdev feature.
 	 * If NETIF_F_TSO_MANGLEID is set it may mangle both inner and outer IDs.
+	 * SKB_GSO_TCP_FIXEDID stays with the innermost IPv4 header, so there is
+	 * nothing to do on encapsulation. Decapsulation clears the outer flag.
 	 */
 	SKB_GSO_TCP_FIXEDID = 1 << 30,
-	SKB_GSO_TCP_FIXEDID_INNER = 1 << 31,
+	SKB_GSO_TCP_FIXEDID_OUTER = 1 << 31,
 };

 #if BITS_PER_LONG > 32
diff --git a/include/net/ip_tunnels.h b/include/net/ip_tunnels.h
index 5cccf4c..a8e1cd7 100644
--- a/include/net/ip_tunnels.h
+++ b/include/net/ip_tunnels.h
@@ -667,6 +667,7 @@ static inline int iptunnel_pull_offloads(struct sk_buff *skb)
 			return err;
 		skb_shinfo(skb)->gso_type &= ~(NETIF_F_GSO_ENCAP_ALL >>
 					       NETIF_F_GSO_SHIFT);
+		skb_shinfo(skb)->gso_type &= ~SKB_GSO_TCP_FIXEDID_OUTER;
 	}

 	skb->encapsulation = 0;
diff --git a/net/core/filter.c b/net/core/filter.c
index 09c60a5..0b8d363 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -3803,6 +3803,7 @@ static int bpf_skb_net_shrink(struct sk_buff *skb, u32 off, u32 len_diff,
 		/* Clear encapsulation flag only when no tunnel GSO flags remain */
 		if (flags & (BPF_F_ADJ_ROOM_DECAP_L4_MASK |
 			     BPF_F_ADJ_ROOM_DECAP_IPXIP_MASK)) {
+			shinfo->gso_type &= ~SKB_GSO_TCP_FIXEDID_OUTER;
 			if (!(shinfo->gso_type & (SKB_GSO_UDP_TUNNEL |
 						  SKB_GSO_UDP_TUNNEL_CSUM |
 						  SKB_GSO_GRE |
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index 7677b03..d5769a5 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1402,10 +1402,12 @@ struct sk_buff *inet_gso_segment(struct sk_buff *skb,

 	segs = ERR_PTR(-EPROTONOSUPPORT);

-	fixedid = !!(skb_shinfo(skb)->gso_type & (SKB_GSO_TCP_FIXEDID << encap));
-
-	if (!skb->encapsulation || encap)
+	if (!skb->encapsulation || encap) {
 		udpfrag = !!(skb_shinfo(skb)->gso_type & SKB_GSO_UDP);
+		fixedid = !!(skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID);
+	} else {
+		fixedid = !!(skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID_OUTER);
+	}

 	ops = rcu_dereference(inet_offloads[proto]);
 	if (likely(ops && ops->callbacks.gso_segment)) {
diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index b84fcd0..7919004 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -459,6 +459,7 @@ INDIRECT_CALLABLE_SCOPE int tcp4_gro_complete(struct sk_buff *skb, int thoff)
 {
 	const u16 offset = NAPI_GRO_CB(skb)->network_offsets[skb->encapsulation];
 	const struct iphdr *iph = (struct iphdr *)(skb->data + offset);
+	const u8 fixedid = NAPI_GRO_CB(skb)->ip_fixedid;
 	struct tcphdr *th = tcp_hdr(skb);

 	if (unlikely(NAPI_GRO_CB(skb)->is_flist)) {
@@ -473,9 +474,10 @@ INDIRECT_CALLABLE_SCOPE int tcp4_gro_complete(struct sk_buff *skb, int thoff)
 	th->check = ~tcp_v4_check(skb->len - thoff, iph->saddr,
 				  iph->daddr, 0);

-	BUILD_BUG_ON(SKB_GSO_TCP_FIXEDID << 1 != SKB_GSO_TCP_FIXEDID_INNER);
+	/* Bit 0 of ip_fixedid is the outermost header, bit 1 is the inner one. */
 	skb_shinfo(skb)->gso_type |= SKB_GSO_TCPV4 |
-			(NAPI_GRO_CB(skb)->ip_fixedid * SKB_GSO_TCP_FIXEDID);
+		(((fixedid >> skb->encapsulation) & 1) * SKB_GSO_TCP_FIXEDID) |
+		((fixedid & skb->encapsulation) * SKB_GSO_TCP_FIXEDID_OUTER);

 	tcp_gro_complete(skb);
 	return 0;

