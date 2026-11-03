Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664750;
	b=LpfBz+vXFrr1M7g2PHVMCtfaXK2d7Wc97vt68GW4mfkRGdgL5gB+Ub2enM4vYxrr2OFb
	 l0JEhjLANcHJir9cnG3pxn+ikdiymf3SH23mJD5bTPnpMz6EheJB22MB1nyC14sIXNKI7
	 B4Mi+CgYcHFy+3wfxS82LqXYGXM0dNkuV5N0/3SXH6IL3yRnsiNvsodNsXFOp6cfEvhIq
	 Cg0ewZ6ICdyVUKIFmdCiMo+ReCUHsBzGWFhMHYKs7P097ZiKh/IHeJUENBmkeFmkxxVG2
	 Koo2nb9eEzjceruCmTEqggchJyr38KchnLJacYEc6o4HWQVl/NeC8pp7xkGMD8GBSSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664750;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=9G7LXhF4bLSttzKsOIDASB38nqO1dMdRvn/vVwEN0W0=;
	b=VhotZmRrQ6rzACdni0AVGCriTceGFs5Aa/JTF9n7OL6stVZoiKra7vWx6N4JsnqFge7J
	 HYWyjodAfwgdjvUynGB1+QpBkuURU8JiUv+CZdg8jDWHm/SpG9pq3xwsBxfaXRvfMOsBp
	 LsoSdFsKoHFvkNmYJnETdf3eraunGucxVx3OeqV1S084vaQsme+BXSumUls3aQpiEcKp2
	 /psCs6TWb3lN3ETVfiiEphMp1eLOnh6M6vweoUW5wEPTgkhnO77sXlg62tG+xjXCynYVA
	 tTdEbjJ4fIWjomNTGR2K5fXjz3XBBQIws/+iLllkj84+JZmDtw8M/E+IUnrOh4YyGdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=RYjrFdM9;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B922C606A332;
	Tue,  3 Nov 2026 00:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B922C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=RYjrFdM9
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6uPG4128948;
	Mon, 2 Nov 2026 16:12:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=9G7LXhF4bLSttzKsOIDASB38nqO1dMdRvn/vV
	wEN0W0=; b=RYjrFdM9x8wBZTAgiCX8+1n4vYhh8Ieb3vkNZOlclSGP5QOksKjra
	QIIDnuE9KA9CE0vXwvxxbSAb2bQSsbt6eDnLerO6YRNmy9ETnxk8yenT5kPk3FC2
	PUz102CW+NlxxAQxit7ebtTcHWOFA0FPfk3CuwacMkmbodEEYyY0r4lbpu1QmjdS
	jwMW2roBfFVbhw21QY3rgAfbs1nRoX3y57FeFzsMxCvIKahkoOCQwR5MD0LCzzKK
	Oq2U/xumd2imszRZePNmEeFtXRbJtMfgrNKCFcnujlCeN7I/x8aKXsn3mGUeob9x
	EoLFY9NlCOC+05EoFXgXPzFVTV+OM9YVw==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hne57e6c6-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 02 Nov 2026 16:12:28 -0800 (PST)
Received: from localhost (2620:10d:c085:208::7cb7) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 3 Nov
 2026 00:12:19 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: <linux-kselftest@vger.kernel.org>, Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net v4 7/7] net/mlx5e: psp: tso: replace only the length in checksum seed
Date: Mon, 2 Nov 2026 16:11:43 -0800
Message-ID: <20261103001143.246081-8-toddfreed@meta.com>
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
X-Proofpoint-GUID: M5mTBmvCyvGtmd10fAThL2on6Rx90vMn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfX65l2fWKw60Qc
 uTXnph8xBhnnoiWkGN+BEol6V7Hj33XDr3H2PQ1XLzFoTUjLVYqp7ZiiwahMdiqC5wOijWk7ksB
 rx7lC32qKy6qm/2fddNL5MOVmoenxbI=
X-Authority-Analysis: v=2.4 cv=SJ/Xx+vH c=1 sm=1 tr=0 ts=6ae926ec cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=pGLkceISAAAA:8 a=VabnemYjAAAA:8
 a=MqttutdN95V_glj26pEA:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: M5mTBmvCyvGtmd10fAThL2on6Rx90vMn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfXxC95WAJ5KlaZ
 tXsBZ24moJl0jxsF1VMDArtnoPZj7Q8o36+5BiR1LHJxFqQfo2bFd61a+PMNWgoYHDhZ+hP24QG
 vWzuC2sY7o6HmhkqLcY+WMs0ky6K26qOlvFrGO/MsZ+Cx7Nj1vPjWzUOHTnGih9WgSodxe8HI7G
 LZeKL1rdyRZIu8AmeThfs/EbQ6hYmMWaCOe5EjZ+I8goTWLERo8FOcmkTHwO5tejsYtlnV0v/UR
 3Za9gZP7T4k90m08JqEUTPnElw/5gv0+IhYD46TjlSsOGL80ZoP2OPTTDiVMy0vj2mrVHqqgfJx
 06Seynw1me2iFaMD9oWGqOIHj+NfbXAcahtljIXLlObJmQEnxyhvlTBAzW9MI4wnD8JK61929vG
 2DzVK7I3rOM2/5fYLXCaoOvlpR8ou6CqaudGaPlPsWskQcDm2EJp9GPIluy4UmL0mVkABd1hGXX
 vnDGXo+AzDZ2+YJJfMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01

for psp tcp with tso,

 - __tcp_transmit_skb() -> tcp_v6_send_check() or tcp_v4_send_check()
   computes the checksum seed using the addresses on the socket and the
   total length, then

 - mlx5e_psp_handle_tx_skb() recomputes the checksum seed using
   addresses from the packet's l3 header, and the length of one segment

the length difference is expected by the device. however, the difference
in addresses is incorrect in cases where the l3 header daddr is an
intermediate hop, for example,

 - ipv4 source route option (IP_OPTIONS with lsrr or ssrr)
 - ipv6 IPV6_RTHDR header (conceptually ; ipv6 extension headers are not
   properly supported on this path yet)

in these cases every segment of the tso packet to go out with a bad tcp
checksum

the fix is to replace only the length in the seed which tcp had already
computed. this is also what tcp_gso_segment() does.

tested on connectx-7, with a psp tcp socket whose ipv4 loose source
route's first hop isn't the final destination, and the peer checking
tcp checksums in software.

Fixes: e5a1861a298e ("net/mlx5e: Implement PSP Tx data path")
Acked-by: Daniel Zahka <daniel.zahka@gmail.com>
Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 .../mellanox/mlx5/core/en_accel/psp_rxtx.c    | 21 ++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c
index c9829a124c53..e4bb47fd5451 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c
@@ -191,18 +191,15 @@ bool mlx5e_psp_handle_tx_skb(struct net_device *netdev,
 		return false;
 	}
 	if (skb_is_gso(skb)) {
-		int len = skb_shinfo(skb)->gso_size + inner_tcp_hdrlen(skb);
-		struct tcphdr *th = inner_tcp_hdr(skb);
-
-		if (skb->protocol == htons(ETH_P_IP)) {
-			const struct iphdr *ip = ip_hdr(skb);
-
-			th->check = ~tcp_v4_check(len, ip->saddr, ip->daddr, 0);
-		} else {
-			const struct ipv6hdr *ip6 = ipv6_hdr(skb);
-
-			th->check = ~tcp_v6_check(len, &ip6->saddr, &ip6->daddr, 0);
-		}
+		u32 seg_len = skb_shinfo(skb)->gso_size + inner_tcp_hdrlen(skb);
+		u32 len = skb->len - skb_inner_transport_offset(skb);
+
+		/* update just the length component of the checksum seed
+		 * tcp computed the seed with the total length, but mlx5
+		 * devices are expecting the segment length
+		 */
+		inet_proto_csum_replace4(&inner_tcp_hdr(skb)->check, skb,
+					 htonl(len), htonl(seg_len), true);
 	}
 
 	return true;
-- 
2.53.0-Meta

