Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714477;
	b=DkVI9tEWB+23feMNiDlH54ROrECZPY6F5khwObHHcvrGG9M0NYRp8bYlnJHUBIj6yCnO
	 YelirG+liVjGBBamfOi3OBS9/0OCEnHWKLeFUhSuqaIrNDTHi8Dxin9UIFSn5uCVnU8Pz
	 LDK5hGbNjdBu8idCvldIZTo1A4yoHIu3LZIl0yDvFlKmzAPRnI488+VI5Hp8Z/Az2vQKl
	 ACIyBgHBKNhEhyT6cfa0EmdQXTVahm2mmQmrYf+x/YPqzbs5B9uEDuHSeAuoLRCI1Ow5h
	 t2/ifuaKGZlQeb3/CDFQO5Ah8LTuvYSxqenVB0bVnwBRG/KKWvaR8/ew3NkS/NZKlBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G0+MB/jUqRMYUuh/ZFNJ9BJObePXpvta6v/irZNtSoo=;
	b=e5mfb86nW/3MQl6njPn3L3XvNjJatzLHCm1Ram8WBPeRqAp6OBnli2QX46LZDSPVAJeo
	 my+olOz4PQsShXRw66JWdBRMXUE5a2XDLuLBhryypbufdmQBzFpXI9m6POpOTp+1gMkx7
	 rEKfiK33xv+EmfHaRdLTNzkv4Co6/fHtc5zqax6dQcF2vuFcwP/ULG09p1l4wgbheisfk
	 YKzKU/Qtl8PTrKbiRliQ9xolemZI3pTYreN1fzmWJc6Nw3vfJBN+BGRv+YBFMAZWOgh5S
	 gPup/uS/8g2v0EjtrKse+MXRF/WOmnuTFvlVXv2Zf8xYh/me5JeXCBx3Yb7jWl9Xxwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgydXZc8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xvb7IxWl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423DC606D821
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 14:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 423DC606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgydXZc8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xvb7IxWl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZZ431926012
	for <linux-kselftest@vger.kernel.org>; Tue, 3 Nov 2026 14:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G0+MB/jUqRMYUuh/ZFNJ9BJObePXpvta6v/irZNtSoo=; b=fgydXZc89i1UE5RC
	v0/bO965dxZFBU4iR2kIjF4zsGtdTHfJkzGVeGxsqJ+jBjX0abV6VdDVkWTzX1Of
	N4FUWIXSGM2LEpVY89nhs5ZOwjCvJ0F+N5G+lHlG5clMRWmMmfJa6M2cktUY+n37
	/LlWjHr38c+fiy/Ixu8G0/4lMn8ESgu1ks2hk8SrxPwpZffjG1FvkKrVZlNZ1gKA
	t9BKFBfL2H9YtfdYTwbb6w5DiV/EkSFnwZT68WxyZPGAypEM8jbnIA9bcpWsq05j
	Y9Q1wFOwCVTWjr8pp18fEkmL8ZNY93aMKSPD8bAu6+c0nLSiSCOijGNwxY4y5m/4
	1zZGkQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5j3mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 14:01:15 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eadfb67611so852352e0c.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 06:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714474; x=1794319274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0+MB/jUqRMYUuh/ZFNJ9BJObePXpvta6v/irZNtSoo=;
        b=Xvb7IxWlmn98CAClQ8xwkfMgrP/pcDESy2XAvTMsYC2IZIYjxGhtaZJmHjx4D2cGVn
         WI7qgiFm5Z4bhORi5w1ocvi5wPdpj+lgV/TAUR+DHAVwDxLHU+7FEI+CAs6rBsnryJdY
         d40zCPLhHZtV1HJOqwwTwnnqBjegxDeuFeRfUcRp7aV6l8EE+qeinyc47b4QQOGYOCFK
         uX/MOACys9xWnBHgkhkms5UxUxUhoBnQ3zeefQ9aXGyulshTjkQVqvyVrmgG2AkEBEGf
         sG0OFnccTY/WEhaMHnjDQiUc3QDQeBwzwyEnEE8tM9EwagQLSJmdQuYNsw9yE7bn6TQV
         6Xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714474; x=1794319274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0+MB/jUqRMYUuh/ZFNJ9BJObePXpvta6v/irZNtSoo=;
        b=a8MAWeqcujSdpqYSKptKmwWS2ru8PELY5Y/8GzxSDg5TC5yW6txaNMNxhVtjxtZEbX
         Q1s5U77ECcAAyLOfcHQeCgakumlw6KnmZCVwQR9qCt5+RN9X6zBN7XWIqj0e36TdyLYA
         Y4Qt41LCJuvi55ZSADMf5B/QHfstajFex3IzA5uUs7bTELzJIsWDk1yyDsJxwCqEz2F9
         rmgVmXIJ+BX/dukHeFudbYHC9BEQiqlNF/LQU7vtNEZPdaktS3JvEmkp739fi+D7gSzL
         nTyIVMM3hbqWcR507YhguJEw4DD4ZKYPCpEMwDk1YQalmcircrH902J/yg4K45F7d1o2
         mALw==
X-Forwarded-Encrypted: i=1; AKwUvBxice+by+WjbhdqLPgbWIwy7x2LI7HCNiqUPNxp7noYmFI2XCk0v2nfq4PVKsTiibmd47ZldWeI6amr4jLfw/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hCvlnz2vkhtR2zn/bbQhcpbH7mQ0qtZ+1wxU7NcQ8IJYqITaZ
	qbl9Lk5ZekfKZ4Rz73jCHarVbW9t53rUTtw725MVLCi5mT+umnYYJJGT4ZrkR5pqjSFTKxoaR7E
	lN4Ev04H/zsNJn6YLOb8civfItqgCkctPrwcwRmeCNPeKqfuL3XUyt2Nsnk6n4pOhW7tN6Cg=
X-Gm-Gg: AYBFou2x/HsO5j8WL2EtBDM9Bk2Zbv9HrgeR80ff1UOmuUM/Jif1r5FvztVDP0gy6Kk
	UuP4bGuJs+meilqxolhBe6NCvs6e5Phwuo8AIpIagIPKAUE1+MnxowOOz5n7mhTvAEEPGn7lM/5
	+N0mJ5xPrIgCFWU8BbaifKup8tpqnkv0xBUOjStaoXmvlkK4kiSK4dI1NvuvC6jdeLJEbZJ7HKy
	q7RiMKoCHfIBUZRaF/EyKwgjHQKBG0S3NXkqVnCN4ngei/gBS/8OY5x1ygoNvfCSHoBkRZpbC0P
	s9Vj6jcETNQ6SGKuWoSKioXcT1Bc8vshoWnG1vkf1PcVQk40Lk4isUwforzWhPc2XcDs1vPU37e
	92Msrg8/35ZbprxCEpwflqXrAXj67vSIur9hj7JPJkwvFE5MRVT4hQcLfCSpC2YY=
X-Received: by 2002:a05:6122:e22b:b0:5ea:dbae:3cb1 with SMTP id 71dfb90a1353d-5ec68971944mr5004815e0c.19.1793714473916;
        Tue, 03 Nov 2026 06:01:13 -0800 (PST)
X-Received: by 2002:a05:6122:e22b:b0:5ea:dbae:3cb1 with SMTP id 71dfb90a1353d-5ec68971944mr5004701e0c.19.1793714473121;
        Tue, 03 Nov 2026 06:01:13 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm26793697f8f.34.2026.11.03.06.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:01:11 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:00:43 +0100
Subject: [PATCH nf-next v3 2/8] net: netfilter: nf_flow_table: refactor MTU
 check for tunnel offload
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
Message-Id: <20261103-flowtable-sw-accel-ip6ip-sit-v3-2-60b5f063f1df@oss.qualcomm.com>
References: <20261103-flowtable-sw-accel-ip6ip-sit-v3-0-60b5f063f1df@oss.qualcomm.com>
In-Reply-To: <20261103-flowtable-sw-accel-ip6ip-sit-v3-0-60b5f063f1df@oss.qualcomm.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>,
        Phil Sutter <phil@nwl.cc>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
        Shuah Khan <shuah@kernel.org>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
        netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: _2qEJ_kpIDMf6TFHRfuoeuiMKYlOTMPS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX94R1No3il6KD
 weY726eKMwJGYB0Zbd0zUXfG3zNwCBI2WRxWj7IY1oR3EoZ7yAfo8tFS4XK59okHwdecQWGBD4L
 llQ48wML7o8WfhfEFjfK1kaEAELSQFw=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9e92b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9AI-LCzJV_BIknmlFlkA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: _2qEJ_kpIDMf6TFHRfuoeuiMKYlOTMPS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX+ZwJ5M8Jeeaq
 9w6pDYRm6VbcGUH4QvWAok35sRAxhyi8+ujY8/hYY6yy9CH3KQ5AeA5sI4lvyAG+y06+GSZBF+m
 oQciNDx6xLUHwWJH1ixt47yjvxpBlubcJaHpxAmIUzGdv8uOOkib56lD/w+RmYGgTPjX8GuB7fA
 KgtbHK6NJxRjQLcBtwlytRn69EjMF1rvHhEM4nKwx10JzKZVON+L6BTQJylhJq4G/YWOmPNM5a/
 Dvb/AiRlVELGGB02YgJYiD9fARmn7Zze+a5aH+6D3Sp8hXiwCHFs+EORiQHHueBpb4Gs2iZ88BH
 yVSIEMSaL1hyJYkiROrttMFUZKD+08Dl9joUQ10TKFl2/PI3UFHWIiIggr5OPuJyAQ0jBic5Vbl
 kj2RR+byNO6pYBReY230IbOiV5g0ohJmpfUqxszvug28MIt+gzIdM5h9A/i1oHq82fYF50NX7Bi
 5fnX7sQlhv/A0w0mYpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030055

Introduce nf_flow_offload_check_mtu() helper and use the encapsulated
protocol (tun.encap_proto) to compute the tunnel overhead instead of
relying on tun_num, so the correct inner header size (IPv4 vs IPv6) is
accounted for. Use it in both the IPv4 and IPv6 forward paths.
This is a preliminary patch to support IPv4 over IPv6 and SIT flowtable
tunnel offload.
Please note IPv4 over IPv6 and SIT tunnel flowtable offloading is not
enabled yet.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 net/netfilter/nf_flow_table_ip.c | 41 ++++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index e07fa9327eb7..902b9b595677 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -472,6 +472,31 @@ nf_flow_offload_lookup(struct nf_flowtable_ctx *ctx,
 	return flow_offload_lookup(flow_table, &tuple);
 }
 
+static int nf_flow_offload_check_mtu(struct nf_flowtable_ctx *ctx,
+				     struct flow_offload *flow,
+				     enum flow_offload_tuple_dir dir,
+				     struct sk_buff *skb)
+{
+	unsigned int mtu;
+
+	mtu = flow->tuplehash[dir].tuple.mtu + ctx->offset;
+	switch (flow->tuplehash[!dir].tuple.tun.encap_proto) {
+	case AF_INET:
+		mtu -= sizeof(struct iphdr);
+		break;
+	case AF_INET6:
+		mtu -= sizeof(struct ipv6hdr);
+		break;
+	default:
+		break;
+	}
+
+	if (unlikely(nf_flow_exceeds_mtu(skb, mtu)))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int nf_flow_offload_forward(struct nf_flowtable_ctx *ctx,
 				   struct nf_flowtable *flow_table,
 				   struct flow_offload_tuple_rhash *tuplehash,
@@ -479,17 +504,13 @@ static int nf_flow_offload_forward(struct nf_flowtable_ctx *ctx,
 {
 	enum flow_offload_tuple_dir dir;
 	struct flow_offload *flow;
-	unsigned int thoff, mtu;
+	unsigned int thoff;
 	struct iphdr *iph;
 
 	dir = tuplehash->tuple.dir;
 	flow = container_of(tuplehash, struct flow_offload, tuplehash[dir]);
 
-	mtu = flow->tuplehash[dir].tuple.mtu + ctx->offset;
-	if (flow->tuplehash[!dir].tuple.tun_num)
-		mtu -= sizeof(*iph);
-
-	if (unlikely(nf_flow_exceeds_mtu(skb, mtu)))
+	if (nf_flow_offload_check_mtu(ctx, flow, dir, skb))
 		return 0;
 
 	iph = (struct iphdr *)(skb_network_header(skb) + ctx->offset);
@@ -1108,17 +1129,13 @@ static int nf_flow_offload_ipv6_forward(struct nf_flowtable_ctx *ctx,
 {
 	enum flow_offload_tuple_dir dir;
 	struct flow_offload *flow;
-	unsigned int thoff, mtu;
 	struct ipv6hdr *ip6h;
+	unsigned int thoff;
 
 	dir = tuplehash->tuple.dir;
 	flow = container_of(tuplehash, struct flow_offload, tuplehash[dir]);
 
-	mtu = flow->tuplehash[dir].tuple.mtu + ctx->offset;
-	if (flow->tuplehash[!dir].tuple.tun_num)
-		mtu -= sizeof(*ip6h);
-
-	if (unlikely(nf_flow_exceeds_mtu(skb, mtu)))
+	if (nf_flow_offload_check_mtu(ctx, flow, dir, skb))
 		return 0;
 
 	ip6h = (struct ipv6hdr *)(skb_network_header(skb) + ctx->offset);

-- 
2.56.0

