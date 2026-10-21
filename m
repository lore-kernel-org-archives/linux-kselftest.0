Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616551;
	b=WKx6YqbGHvCWN2y0G7jrKcT6niNHK5BTDjQ6yvJKQjS6bxbTijxwFbfj0fgtvzi4Er3x
	 t8IbmGx2+E3HVSgql0HvDZgX+6NDiu/UCyU4jAv7n7kLynHOw+6AI8sn43rLML/3QNbba
	 RDJavhMwUD73VLWzGSqM+eEWIy91qO79tjFgjRV4ZveC4ve785MjZrSjEblzp5xohXQ9u
	 U2SfDsRsvQO6MyC3Hd63g3a9l1lZWcU6DmLnQJ+JogCSC8xNlVEieV2xvxyhBx/RTRUBp
	 KGhBB9AQqZDHO5RLTnuUgoZFcHZTNwSNfFrumaRgO2DTR7+1uxCMiXHj/aRVnDvj9wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=RPGR1ao2ryPXVERPslfkTvMcfX9uFT9ATTomLz1wY1s=;
	b=r69R51ycuvvuRZ59YQym13fewGeL9a/yVAS+V76tc43PvopvyeoPkMssIu+uzkbyUwWr
	 y9kT2uReUahA2Kf/jjOvb8TxNEuZaRArunaL5dQAhqHgn5l5ac1Ni2UGnLlhEiUg/Rg5k
	 JE9jNxoPvldGqThIxOUSAObxNoj7ssHHF9+MfIFa1UeCwTNhSblGaQRIQ8Yo+AyefkVow
	 rxy7jCmdt5qGhYI/QqgwW+GnwirXmfs4PoHRtQRPCaeqcXe7CrsdMmGjlSppcJ/3XoUcE
	 1hK/q/o/VsFTUcuR5CVpl18qxeEhDkN0XXMoSmYd6tu874aHZtwcWoWUdNgadBOR5vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NVeHM3zN;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CCB606A325;
	Wed, 21 Oct 2026 21:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18CCB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NVeHM3zN
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKdmZX1705486;
	Wed, 21 Oct 2026 14:02:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=RPGR1ao2ryPXVERPslfkTvMcfX9uFT9ATTomL
	z1wY1s=; b=NVeHM3zNA4kcCyrL6wWbJ+EFtch8NFRfmcgbeSA2vdo19z6RixIGi
	MoZ72qtiG3epNKzLzRy+7BzO62WDZxWXOGEf6jN60o4zqX+QnOtMaqGbRFnGKq1e
	LOqeRxKhxFAyzqEa/6v8IVGNrKU6FZrlyOel8V5UuPcqurzsxGgWb1dTObAPVZkW
	dAzF+4wCFQeObAYrKPgC75gmT+jmk3OdNNhyuYLhnOuV4Ta2hBYz2iYQV89TjsGY
	XWTwkT0XQKdyg00x7Z0qB4fgGrkLh4gc2InJd7X8Oec9iaVHG83ALRYl/dU4nFRo
	6+dALP9tyvdVejW65Gp6cGRR0vRs6Ik1A==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hdw56esa0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 21 Oct 2026 14:02:22 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Wed, 21 Oct
 2026 21:02:21 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: Daniel Zahka <daniel.zahka@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Shuah Khan <shuah@kernel.org>,
        Rahul Rameshbabu
	<rrameshbabu@nvidia.com>,
        Raed Salem <raeds@nvidia.com>, Cosmin Ratiu
	<cratiu@nvidia.com>,
        <linux-kselftest@vger.kernel.org>
Subject: [PATCH net 1/2] psp: drop transport mode packets with extension headers
Date: Wed, 21 Oct 2026 14:01:59 -0700
Message-ID: <20261021210200.788191-2-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021210200.788191-1-toddfreed@meta.com>
References: <20261021210200.788191-1-toddfreed@meta.com>
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
X-Proofpoint-ORIG-GUID: ldoFD-eCdSkfQR_martPK3DUh9ktVcN7
X-Proofpoint-GUID: ldoFD-eCdSkfQR_martPK3DUh9ktVcN7
X-Authority-Analysis: v=2.4 cv=OcwNnRTY c=1 sm=1 tr=0 ts=6ad9285e cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=PAz_-FQ8hEVmOPYdF0yf:22 a=VabnemYjAAAA:8 a=UhlmTuaJ2cu9RCaPLkEA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfXwwArw8eQ/vKZ
 dS00/qVzphBTa9qpWlTFmd/F4NvXLY26WMxN5EFIGHZtOclJjfB3i8A30Ek6kUz+622GaFA2eqp
 rACQeO9HuX+vqzAXTV+RjeDTzXriI0fEy8ogDPHEmtfT6HEqiczrVicTl3FbbMNtwWJe0NUUZh9
 B1RCGcjWjU5j9CxCrcjeUhgsygamrZBidWeBt+LkDPH2BLvQQTMREneYC37LZjZdwaD13TD/vjQ
 nPSoYSS1KRg4MDsau5c7qHnyQHuJ4UGibXNLtYLFwIvh1K9MtvXP5jwpvN366yVSVRKeNi54sXS
 xGvsQaV3Qth6t5C1A/Vk3WLqXqpgmsQFfHKZ8G1Me0SDIiV4aAzw5nwXWjWmJjWmvLiw3tQsGDy
 FDhS7ZffALDBbjVOoe9g5XHbAvdx3jM3ujIvIRRwMpl1HqwM8Mcm5f6whS/fqjLsneQSbzIuNgJ
 vOxdtpnzq7jLyvra3lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfXzuXmfvaKoMeF
 GgNmFvycwfHfjGtfYnQas9HFMRiPcyR/S0EcrangZHGQQxc2SoRCJoQOAiOR1XvQ6LjG78oltVN
 96qf4tC7p+QHJwama1/duneRhDkYagI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01

psp_dev_encapsulate() inserts the udp and psp headers and rewrites the
l3 next header to udp.

if the packet is an ipv6 packet with extension headers, the transport
header comes after them, so rewriting the next header of the ipv6 fixed
header is wrong.

a psp tcp socket emits such packets if certain socket options are set on
it (e.g. IPV6_DSTOPTS). with mlx5, these packets also go out
unencrypted.

drop such packets on egress rather than them send malformed.

note that a tcp socket which has such options set stops making progress.
its packets are dropped (SKB_DROP_REASON_PSP_OUTPUT) until the
connection times out.

refusing the combination on the control path, when the options or the tx
association are set, would be helpful but is not implemented here.
extension headers can also come from a route, so the datapath check is
needed either way.

Fixes: fc724515741a ("psp: provide encapsulation helper for drivers")

Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 net/psp/psp_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
index c9c1a8826b7f..0d276e2aceff 100644
--- a/net/psp/psp_main.c
+++ b/net/psp/psp_main.c
@@ -243,7 +243,7 @@ static void psp_write_headers(struct net *net, struct sk_buff *skb, __be32 spi,
 }
 
 /* Encapsulate a TCP packet with PSP by adding the UDP+PSP headers and filling
- * them in.
+ * them in. IPv6 packets with extension headers are rejected.
  */
 bool psp_dev_encapsulate(struct net *net, struct sk_buff *skb, __be32 spi,
 			 u8 ver, __be16 sport)
@@ -256,6 +256,11 @@ bool psp_dev_encapsulate(struct net *net, struct sk_buff *skb, __be32 spi,
 	    skb->protocol != htons(ETH_P_IPV6))
 		return false;
 
+	/* extension headers not supported */
+	if (skb->protocol == htons(ETH_P_IPV6) &&
+	    network_len != sizeof(struct ipv6hdr))
+		return false;
+
 	if (skb_cow_head(skb, PSP_ENCAP_HLEN))
 		return false;
 
-- 
2.53.0-Meta

