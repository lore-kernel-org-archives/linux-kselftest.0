Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280942;
	b=ICtxobR8FOdXXr6GJf24VZ8bIoWqFnXy7k0lRlF8MlIHU2b4XCNWNq3gXr2HbbIMaDWq
	 C4k7TYRcrddME1MAQ9Ti87Pz3AypsbJmvP5IonaeSkJ9k+a2u3cSo+f1nsK8hRHAAQ4Hs
	 zp9P1W/iNBt1vM7B024IOL3586jewazQioF1bv7axxSsfkfTPE0zXWmnITHCuXkznyBNh
	 EwUq+XXfr5d8naOuD5HrGMrB7hq1n+XCtJHRyPSJt52/NYVqHH+07TWgiS8HnTeu78CnQ
	 wReLz1ANMjwV6m2z19vCBaazb8shZuO91jUW1oJIW8Q+GT2ZPCRq2MFkDUvFFN1wsLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280942;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G0+MB/jUqRMYUuh/ZFNJ9BJObePXpvta6v/irZNtSoo=;
	b=KIkBGr87Uwnu30qvcQKBJUmwNOCdiVS3NySqQPoAcm1ty6tt0o+t6yzz8aA93mBV0v9U
	 ZLuI+VADNwDx6/6RyfM/LalIUthOQiWHJ8At+gKUHLZ329aW+ZR96/8X9DmmWvNrgM5Lx
	 gbPii+9jqcrM/4IX/iIzNRr986yFpYF4g1BGuJWSQ6Tq5otMQ87LshT5B3rLcDPy+n8sD
	 pMk5zA+ARwTvpQZdS2mKwCYfsXRjC4/Xm7kh+rr/V5RSNczLMJp301PH/8rKybrkjfs9S
	 EFnN9a6HKouxLX6AVyDTu+dtYMmPiqilIF+0UgXy27i5GHX9NEDCGbh0JfXtpWnsyzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N8CxV/LC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ku1umrGj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59C2606A327
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A59C2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N8CxV/LC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ku1umrGj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCeRv63215196
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G0+MB/jUqRMYUuh/ZFNJ9BJObePXpvta6v/irZNtSoo=; b=N8CxV/LC7UmMRXYk
	OUejEdvshGFScV/qh/FLsW+MQFM6y10ZuDNUjSDopbIVRCNbAfFWM0i+gEmWUejX
	2g8zcVIojxVsDt0Hwmx3Bvg1T3dgWzq+30/R3kz6Xgv1Rr3+oUuiHYmmXzz0tXt3
	6pKvBcIKSeKyFgq7gKKLGjOl4IxWo128zC75n7D4phYBv66OTRO3rIuhwbDwceyH
	TsKd4H0BS794VSuH0VPzx/ajgpLQkRpD/vZH/JseY9SBv34Q5dvz6w6BbGUHprmZ
	DvnYQlkyFgF+Io3DJIM4bwSRMFpFcfeMKUiSczmlmKtcXVkha4qBf0tr6zARz547
	DHR1PQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s9we0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so379573285a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793280940; x=1793885740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0+MB/jUqRMYUuh/ZFNJ9BJObePXpvta6v/irZNtSoo=;
        b=ku1umrGj9fT11qf4/4KMYlMxOuG5MmddyEt0ZpE6WAXc6PSRvCDoOE7wDNg8oE3YGh
         Ts8sgaCQESAESVCPF2d0L2apJGhBzGqJyt0IGjgh/nozMNHwzgjGeS3t3iFVM354uTfN
         tzDCzodJFOaZBaZMijyCmC3qNkil76od8dC5FMCoDaXNxF93q4e6CpbncSWLaAlGCNma
         jjUBb8FLxHiMeZuvopcMxsZ/eSXLAKeVk8QS/fxHYAUAgxYcK6aoobyXnELXl9Gpgkn7
         NfQ2Ix1pqlsNNSAhMay0znaJ0ExJ3SUrYyDZ+ut1c7QF5GjjPSeVpNmvTQ/uXL9Zs4Xo
         woow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280940; x=1793885740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0+MB/jUqRMYUuh/ZFNJ9BJObePXpvta6v/irZNtSoo=;
        b=VBaXW0V8to4CFw7st352c/GEFlDar5ghOEWY0hFkcOeZ7NDx755P24c1wxoINj9Mk0
         CPvSjYdFJgPqH67RXyPc8fOmBdLnu1vOTykvDIR49YxUUypuylyncX9OjN9g/Z3Xqirr
         0RTtJ9Hi9YZo5Q9yv7Fyowv4gtk65I976iiNnfh098uzj0hO2MvoN/7nYFp0HMiFs7yT
         TciatxP0kxZH408r3j1vMYxSjfbsMxnvRsI9MOj52co/gJHCpJLj5ewiSOGE/FtaiE3z
         zm4pbeRhdGQ2vIyaSC/9yGYZoZ+f1skhAz+Qd9KlxeORAJtWfQ8WrXFooE46BM2FAazK
         19Tw==
X-Forwarded-Encrypted: i=1; AKwUvBx9aJIrO5HLg1b0D2wboHVeJNU4vFVIlHIDx1k2sDgsE7QeJGPhR0PjFDUiNS7mkoGglaqGLczQ5TGZOqde51w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjacKcfMSeP+qzL0GIJfiJuzIVUib8cLRQohm+gkoICr560Y/0
	D7J+49e1TRAsDB7TNgIh3W/susB9lV/TECodpLYENbzBxcUUi6HWKWIRNVl8ErO1+XBTrP7gNlL
	eXEwv24y7vEZ/mFxs0x9RXht8j19i84MKY28OcPNMotPMVx9GG+YFEgiopSSQABtEQRwtT+k=
X-Gm-Gg: AYBFou3GpxA/ZAYFI7EOtJvR3reswu915a3pYy0BCWgDH+9LCMnOZ9shi3Nom28otr6
	Nhg9xkQDMSY5KAUwxFd0f87vGl1XRQ3HtjqxP/MX/zz8cYs0VEXV7IyPtkxZ6fcN2RZMbrwAEDG
	iwy/AfQ1S78fOT0JnyFFkXnXBbrtxBtHLFULTKUfw+7YUir6qvSTPCvih1FqhiuApzqkM0BYWpT
	iA0AC+NNS1jm9OTpACZQmmoAzF3nyqS7s/mdHKTjwt+eg2cXCzyxHSW5QPBSDGdpQDVcQH7K4gr
	7esZ4P8thoB3Lh1wvt/qnk4ZmBWwuSxC/rUhJoFAGHH+XZGNe2hXFYK+dViD7feLRp2pHv89fnM
	J348oq5sYxiZrq8ApkGKKAbNmMLbL3bcQC1u0uqyG77A1BbF0gR4IeEe4ipnnhRR3AdrwP3oqy2
	0UVsxP5qLcSBny93kHpPgy1A==
X-Received: by 2002:a05:620a:1729:b0:93c:2726:77ec with SMTP id af79cd13be357-94408930698mr808310685a.5.1793280939705;
        Thu, 29 Oct 2026 06:35:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:93c:2726:77ec with SMTP id af79cd13be357-94408930698mr808304385a.5.1793280939062;
        Thu, 29 Oct 2026 06:35:39 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a969e61f9bsm84350285e9.2.2026.10.29.06.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:35:36 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:35:13 +0100
Subject: [PATCH nf-next 2/8] net: netfilter: nf_flow_table: refactor MTU
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
Message-Id: <20261029-flowtable-sw-accel-ip6ip-sit-v1-2-6a17c54f9fb7@oss.qualcomm.com>
References: <20261029-flowtable-sw-accel-ip6ip-sit-v1-0-6a17c54f9fb7@oss.qualcomm.com>
In-Reply-To: <20261029-flowtable-sw-accel-ip6ip-sit-v1-0-6a17c54f9fb7@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX3JrOZ0oxqCA8
 r8LroRi7QGsPlnrWaSZrdS3NSej1BN9KtuM3xKTq27biWih6ZrlKzQbwbFUGr4Jj5Zu9k8n4Im+
 zbLYT5TQ+9diZYPK5XenoB6lqj0O0IojktSXIawxAwFzprGk8TCETIZiTxqXKKBf8xnQOfX5l/p
 1RD2UqIvCn2vBF8Rr8vdIXlZet+fbGdXmlbrSnPR8miaSHwgnJOzWf1i9gsUIdQeu43OGH5atX/
 8H1/L/rUVGh2TvF7pYYr8FBEUplmUBxu+ScyZoHAOQXx7WjWWDsPFsPxkpxI4bKXl0pCZbcMi+t
 dantvb3z3EEwFd7uLCJ0PD6ULKpvTaunnYiEggICeQM5NEHKexTHBu25RDfoh4YbyKc5qplUWmY
 I8EbkmDv6ZU43mFEtu/dJlrCQnjDtd7GpEjpEOBwCpSUANtcOPDIXTbkRVVgFeIk3+eZ0WQTyzM
 PgX+J7Hy3bdQEYzTR8Q==
X-Proofpoint-ORIG-GUID: bEPX7n7noHrm39ldd9gB2dvkw9EW0YdJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX9b5gFx5b1ovL
 ybHib3orweeU7vRxRr50D59ZHW1Lhxhbvs5gs64wtmWrLYjpvynRys6TGrvjTDcFYlNyI+EJNjB
 0xVDrQkvOZPN/toZLHskcb7/4PnvrOY=
X-Proofpoint-GUID: bEPX7n7noHrm39ldd9gB2dvkw9EW0YdJ
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae34bac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9AI-LCzJV_BIknmlFlkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290053

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

