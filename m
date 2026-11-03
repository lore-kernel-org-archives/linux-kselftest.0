Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664719;
	b=QqkeEHMzCmFuBq+9do6nUUaScaR1XxPCIh7Rj0pE6oWlx19n1QC9R3BIa0eBC54juVd2
	 kD32SR3Vtm2VNTBwkp984NpXUtPjmSd4k0dTlzZI1O8k2/v+56D/a5N3IzwwytNFXnwVO
	 rmfPI4kkXox67uvQxYoU2SF+ONlFxG6BdJsS0MuxbBOCeMU083WZmquWIR3gCOEoNXHM1
	 VQPNALGsYPK2RwirimYmzGZ4ELOidgXae9s7wSjdb+hKusCOuALGELMtc93mkdHOi0xbE
	 XJsvytxuC89EF/uX45NqG1QqJcHtAIBb6QIO3r8ZjiIbHqflGRPMGrhc2YLWnC2j3gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=QL//j5rlcK0rQihLj2JoP8H/zY55tP730TFuZ5PnLto=;
	b=nMjdQN5kjCVl9AeGfuxTwbpZI+DJqfbwS2CJwBvrC3/xSEKgpe9iCa6vUMz9HKoQZFEV
	 y0ULqeO4iVFfvGIUwtxFn9mli2+kSE/fqy6AkelQnFTP3CGj5f/wWQ/X0/L+N2NvnmTFv
	 twISeZM5NVjGanMaPUiHtcVptmITmifRZCxB9mdXEvmfHfGGx7C+jF17EGnkCHs9Cb+3c
	 6k02Ro4lG+4R/tO8jh0ONZYo7IcyZJcv9Ur3pKsm7LZU8BNhdhoMln/RpOOsh5HVRK0n/
	 EltzJ5RuiQhg2inX51hBLh+dkOHRofL28RknM8gV2G6mPQupEgymxR8z6mTmanePIZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=XizV0XpU;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81C6606A326;
	Tue,  3 Nov 2026 00:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C81C6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=XizV0XpU
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K74Qs4129116;
	Mon, 2 Nov 2026 16:11:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=QL//j5rlcK0rQihLj2JoP8H/zY55tP730TFuZ
	5PnLto=; b=XizV0XpUEeTJmSKH3gFao/3xwcxwVzibzGm6zJK0++5Oe2gDLPlkb
	Go/sniK/H3kEu0U7pX1EFD1YQnbwd6Z1G8tLZ0kSTnvxXhr0UbPA4wUET4cdFObQ
	W16KM/mdFPH+ELrhA9uGHLN95IY05D/wyy8SQyquG0xoQXY2bjnMeOTt8igwIAyQ
	3BSVKiIcJbuoMIcviBl6LYoDoCzwWEw0soGYwpnrscw318Igdt8CqM5MEO6x7dB+
	6qZrjbl6zGEY9c4gtueZKDSU0hyqVp6up4qTZc+FFoZVH1cATISsVrUqxNtwLBpB
	2jhv7F+mPwjMujntJp2FKPaxA2DRikM0w==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hne57e69y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 02 Nov 2026 16:11:57 -0800 (PST)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 3 Nov
 2026 00:11:56 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: <linux-kselftest@vger.kernel.org>
Subject: [PATCH net v4 1/7] net/mlx5e: psp: drop ipv6 packets with extension headers
Date: Mon, 2 Nov 2026 16:11:37 -0800
Message-ID: <20261103001143.246081-2-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103001143.246081-1-toddfreed@meta.com>
References: <20261103001143.246081-1-toddfreed@meta.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bVzsdbRnXlLK7z-CSJ0Ix07c9ySbhGFL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfX0YFGIZvGCtcv
 zPzOILoNvjSeHAb4m96noa2+IuTfdODd7S5ocgrqPyEuOIlS98UDEoIqllyGCHCEk8jFPsYE3yK
 F2aubyqfDBhfMJ3SYvZ3lyVXO3nxnlA=
X-Authority-Analysis: v=2.4 cv=SJ/Xx+vH c=1 sm=1 tr=0 ts=6ae926cd cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=VabnemYjAAAA:8 a=cAl5mJhCS4EPViv6kLYA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: bVzsdbRnXlLK7z-CSJ0Ix07c9ySbhGFL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfXwD7sECByTHZY
 +v1hHsrc8oK/QeViTNLtkkPTsrGml/TVWRc7mONSIkuxBLXZsNEg5BEfyLTSq+88HosI++jKvQO
 282nlz774Eg0o6RU7TWj6mf4y6IW16oEvi+tTmtxb3xY5SX/y4oayaBxlhBohaNFqyQLbAkogre
 GcLHgoSFxqsisWieRdlIM+Wrjz6nzISoNKIgHPnXRkRRHOMkoliQKVirKa7FK3beoEn+SXVFFP2
 +9DGxoKb4S7yRmJz6Mf7NyWRMEuJUPMivkm1zE6DXajWqT39yabUI5/N5bOuXeHDSvuOvyL4V8M
 c+E6M9LHnR4ZYDZlk5a0JuLovhRpPAL+5az81DSFXzio5ddULnmEqD3WF8xfUCCf7C736W+o7hl
 ZayIqD7CqqLEPXxNhaBvdtFh5v/VBq93mFZ1MkZXmAsn6usMiOhVv+wZNwgbQTIsg/IYoYop6Da
 88qAig2EugGyMJox5Bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01

mlx5e_psp_handle_tx_skb() uses psp_dev_encapsulate() to insert the
udp+psp headers and rewrite the nexthdr of the fixed l3 header to udp.

if the packet is an ipv6 packet with extension headers, udp+psp is
placed after them, but the nexthdr indicating the l4 proto is on the
last extension header in the chain, not in the fixed header. therefore
this produces a malformed packet.

in addition to being malformed, with mlx5 this kind of packet goes out
unencrypted. since the tx association encodes intent to send encrypted
packets, drop such packets instead.

a psp tcp socket emits such packets if certain socket options are set on
it (e.g. IPV6_DSTOPTS). refusing the combination of such socket options
with psp association would be helpful but is not implemented here. since
extension headers can also come from a route the datapath check is
needed anyway.

Fixes: e5a1861a298e ("net/mlx5e: Implement PSP Tx data path")
Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 .../mellanox/mlx5/core/en_accel/psp_rxtx.c     | 18 ++++++++++++++++--
 net/psp/psp_main.c                             |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c
index 348fd7a96261..c9829a124c53 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c
@@ -160,6 +160,19 @@ void mlx5e_psp_handle_tx_wqe(struct mlx5e_tx_wqe *wqe,
 	inlseg->byte_count = cpu_to_be32(psp_st->tailen | MLX5_INLINE_SEG);
 }
 
+/* psp_dev_encapsulate() inserts udp+psp at the transport header, rewrites the
+ * protocol of the fixed l3 header to udp, and writes tcp as the psp next
+ * header. thus tcp must directly follow the fixed header.
+ */
+static bool mlx5e_psp_l4_is_tcp(const struct sk_buff *skb)
+{
+	if (skb->protocol == htons(ETH_P_IP))
+		return ip_hdr(skb)->protocol == IPPROTO_TCP;
+	if (skb->protocol == htons(ETH_P_IPV6))
+		return ipv6_hdr(skb)->nexthdr == IPPROTO_TCP;
+	return false;
+}
+
 bool mlx5e_psp_handle_tx_skb(struct net_device *netdev,
 			     struct sk_buff *skb,
 			     struct mlx5e_accel_tx_psp_state *psp_st)
@@ -170,8 +183,9 @@ bool mlx5e_psp_handle_tx_skb(struct net_device *netdev,
 	if (!mlx5e_psp_set_state(priv, skb, psp_st))
 		return true;
 
-	/* psp_encap of the packet */
-	if (!psp_dev_encapsulate(net, skb, psp_st->spi, psp_st->ver, 0)) {
+	/* psp_encap of the packet. only tcp right after the ip header */
+	if (unlikely(!mlx5e_psp_l4_is_tcp(skb)) ||
+	    !psp_dev_encapsulate(net, skb, psp_st->spi, psp_st->ver, 0)) {
 		kfree_skb_reason(skb, SKB_DROP_REASON_PSP_OUTPUT);
 		atomic_inc(&priv->psp->tx_drop);
 		return false;
diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
index c9c1a8826b7f..5049ed400be0 100644
--- a/net/psp/psp_main.c
+++ b/net/psp/psp_main.c
@@ -272,6 +272,7 @@ bool psp_dev_encapsulate(struct net *net, struct sk_buff *skb, __be32 spi,
 		ip_hdr(skb)->check =
 			ip_fast_csum((u8 *)ip_hdr(skb), ip_hdr(skb)->ihl);
 	} else {
+		/* assumes there are no ipv6 extension headers */
 		ipv6_hdr(skb)->nexthdr = IPPROTO_UDP;
 		be16_add_cpu(&ipv6_hdr(skb)->payload_len, PSP_ENCAP_HLEN);
 	}
-- 
2.53.0-Meta

