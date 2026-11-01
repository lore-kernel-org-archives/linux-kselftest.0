Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559752;
	b=MnQvk7AhpqJ3kb6myaKVIA4xUy773e4S+HcSuyNi3AEBRSugydzm+pMAbUTmxN4eDC6T
	 A49zXaHgOlGvqYAhkv30mRM34tX3bYMa4Z+NvToClM5zXFkkOMHjNMQmUhD6r+t9f9ZAO
	 8i77L7Ve9NU5JVxMsUxKU93ypsPo5FSWG86BFPpI/YHOMsDRn+yzYVSTrdgXngdZouggT
	 tIVyQ7MINDwY9LGFauFg9ncSxVbyt1XMbod00qkyoMM7mQdGXiYP30chjsHbe3uPHzPCy
	 gnrJ3mBf1Yfd6VOsDr2kaSWyyN7YvqwX6QNjS29pgxhqrr4gjk1z9qvu27ahs3o/GXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ET+B6ryXZSjsDmJogt9NhGamDLd5Mr29EJGHgALtRKA=;
	b=ANpXsLQbtZo0OgVoV41fcfI+f4d5HrtrsozR4RPAgSQ/hdbax/l//y8BROS8dza50efj
	 K7pJ7p71k2dfbP9c+VqzlY+YHlZy2MVqCR+MSaZu5bNnWM9lMLfnGRtl3g5xUAzSGM8EL
	 2285pMzSEXr7l2+8FIwajKlRr1hP8qmRiWHvAr+G3Z+eKCzKtrTKOKZNTZK8zAbjky7OY
	 GhydzawYlQo+wn5n3daEJkw01c+QFDTDzIanoaKwAbUzBMC46V26X1T0RuyU2Xl++ouLP
	 g3x7KvXE1KHWN8BjJkpUF9sBOkamyThudr3S9/kjdBbtpg3DdZBZDAyBmyWN55ZZaJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJey2lHc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I0CN53Ty;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72076606A329
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 19:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72076606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJey2lHc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I0CN53Ty
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQ62o4029430
	for <linux-kselftest@vger.kernel.org>; Sun, 1 Nov 2026 19:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ET+B6ryXZSjsDmJogt9NhGamDLd5Mr29EJGHgALtRKA=; b=pJey2lHcVRcI9iVk
	NYQFM1rFMEeEClin46LZD/r6dH63WKCzOf5WpbJuwFtCjyAOYDhiXm7uBB4/MjLZ
	O49SF4RLMZZzMoTwDPIMZBsGfPxhnIaeyoZmUbNdr6waTEV1nGHRqt7FElJaKwmp
	/tvRDIBGilbEo6Vp1aLKDKRyJAP9zy10W0v9h/1+cPrygV0mS0Mz93bZiI/aPITZ
	8sQzWWlpY4HyeOa9QBgA6PMWK8V539KL2A+sdrUsGfEDgcFnQMFozEszkIPGYRwi
	O/CegiOfR6BpB6fZ/IufDhXztynY+YRb6Py9vOzdna1M5nv5wJcOVhqBSc+41J9a
	sZ1fOg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk3syq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 19:02:26 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0bad5ec1cso595197137.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 11:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793559746; x=1794164546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ET+B6ryXZSjsDmJogt9NhGamDLd5Mr29EJGHgALtRKA=;
        b=I0CN53TyqnCnn1VqlH8ReodKV089VXO4i2eV8WlBEejQK446O2YDuxJNT4kaLskvxe
         zpT2azgIfm4dBfizqKWfHk/us6gTpbB3lPE+UMJFJAElNzMwF9BE7e/7M54SgIRMnv9x
         XIEw9Hd2fSweogPbriRlzb2ZykWuGTjiDnFEpWmA7mQRH8gvTEnSXYHFdtJcqaAoneG7
         BuY//BRkBv1Y3Iblx0WAaf7rZ1gRWRmfAcH49LTUDxFHLCKQkqIwrAzQ0lVROLtBWcu/
         szGSnKHPWI0U2LwPDCxHTUhdjT3lOEAkb5YzHhBZNoXzRuz8mas0egKR0B1HwfQcWuHU
         d7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559746; x=1794164546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ET+B6ryXZSjsDmJogt9NhGamDLd5Mr29EJGHgALtRKA=;
        b=RWNPBBNEW9pFxwLttp0fUkwujYttMCHsSgb0m337wKs14zLGwmHtw/ua3ZbKZFpQaP
         moCx0yNvFxmWkBDfyCRkLXsfn7SKnDeE+SDpLY6DoNqv57R3k30Bzb5Osy7bzOMxAmxp
         QpDMuKOFLOCdOKlRum72rcRJLbTPIoWn1T0EijliFd3Z6yY+5+gGgo6ydxJ7OI3IbfgM
         BusOkdqLBSDZul9sqBkAkTGqX4Cg8Py9UB6X4x6RQ6vEEFxTodaix4+rTyh2U+JTYTlG
         rG5D0d7tQ6O+9CF/cy9Bd8sVP9ovoKVSxCZ+Cs2pxpOgT4+uX5Bz9HMTbjv6GjTbjRJr
         N97w==
X-Forwarded-Encrypted: i=1; AKwUvBzxJMAr/B3CPL5ksOf2WMw1vXGe8hjpSxv3zoC8AHgFlvIr9RSD9INXWe5bsoNzm38ZwIhLQUovwTeCNHH7hcE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mfyAJ0jdLJd51uaJFgnWaSAIo/K4NUMoQ7Ubo9BTktd0ycEcg
	NSqJZrINovcr23KiDrLyx0yLIJiikSsf9wn4MqI9eyssKl0IotF8rA1G838njAfNAvLCioBfRsW
	4sH6eFqVtc5Q24UVgPkyeIv5lc/eEMInVD87QdzBvHdiXcexApztcCgr/v02mffX6l2fpBdk=
X-Gm-Gg: AYBFou2X0P6NfNJBnp8EjcteXoCMAIftcEvybwuJSQtN1GIQO3xO+sHwx+ytn4rWnN4
	uGrBbqVCysm8GEcvJWFHhj3CWSSLNjCnIZWI+9wmEZYTgxm9YzemuXW+f1qKkJRX1/TXol0XiQf
	5WJnunhqn9LSAqQXF2ow9AnoC1SbdodNfGLvwPC0wmB/wfwLYWiZLkfpnBu+3DP0hhwDXdm0gWo
	v8b77QGHEz4hZIRRhQLDa4oZHrosoynCRW96sPHuIGlO+B7fu2Tsfu1V0iQn0M3DMjaxS3oEPgN
	yTvxDzIwqmRIwYFBmYXXNMPkBMNtJ+aJZY4lD5tIPfI4+f06IX6EHtldS/Pi1Q4sM8dY19xob2V
	vf2vrGtdBipX3Te5V4bgmv/3Z7iZBJsgMUw8bgZ/kRD2w58No7RKdbQ+knPk3mkM=
X-Received: by 2002:a05:6102:3eca:b0:7cc:2cd0:e73c with SMTP id ada2fe7eead31-7d072cb04f3mr2805907137.25.1793559745548;
        Sun, 01 Nov 2026 11:02:25 -0800 (PST)
X-Received: by 2002:a05:6102:3eca:b0:7cc:2cd0:e73c with SMTP id ada2fe7eead31-7d072cb04f3mr2805902137.25.1793559744950;
        Sun, 01 Nov 2026 11:02:24 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e7a1d9d71sm9894212f8f.48.2026.11.01.11.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:02:23 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 01 Nov 2026 20:01:58 +0100
Subject: [PATCH nf-next v2 4/8] net: netfilter: nf_flow_table: use tunnel
 encap proto for route lookup
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
Message-Id: <20261101-flowtable-sw-accel-ip6ip-sit-v2-4-c6c282cab5cb@oss.qualcomm.com>
References: <20261101-flowtable-sw-accel-ip6ip-sit-v2-0-c6c282cab5cb@oss.qualcomm.com>
In-Reply-To: <20261101-flowtable-sw-accel-ip6ip-sit-v2-0-c6c282cab5cb@oss.qualcomm.com>
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
X-Proofpoint-GUID: Ubr8HskbGMNTU1UUTyi8JdNCOxW32RYg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX4aI4EFffIMP0
 iNEJW9arI9KFtZ3NQqQA6EiMz/vUmbXfej7jGednmps0UcU2NO8e18DQNqQCHgj7HdLn3Gexsqd
 szfW28Jdy4szD8WaEobtr7yiLsgaeCkydSoOU1IaJHSvrT9pNxEiJdzxZ6IZOvlEOaMMIvWE2aL
 BU9AS1Mwjb9KeTOqw2SDtTfF8cyWkLH689jy5pCJgNuQioJtc+ezgj6Zyh5YlH0ABTagQXzB1y4
 0EhrGDku4VSm7F8OoqC+AoC9ejCLdTNH/VJoCjFFrmzoX8c/0ttaCtJRcGMq3nmkE76YGyrhGHB
 AJ44TVvcUshYMcIz+rXL3FsHUj3PtsbPRV+8tQ6JFBH3qw9UWU5M+cF0XEXmOKs7sSVcZ6qpqa3
 n6TB/0daZGeOYGN4oVPy5MPN9pTIpxQ7JrEQ5GJ7RSICzruC3y14J1k3s8oGLe2F5eiotT3YirN
 BM2yTUP9aKxD1s1zgRw==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae78cc2 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BwFUO5JFP4DfzLIXruUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX1n9PAXhKRKeE
 OW9OiXWwo//gx2kELk5Yu48u8y2tuO5SN9pr6Psad5vlU1oQqsEVdRJWd0Qy8CCuXt7cx9cGNg1
 PYdXMD17xXb/dldwQj3uZ3ym8JIEHWs=
X-Proofpoint-ORIG-GUID: Ubr8HskbGMNTU1UUTyi8JdNCOxW32RYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010075

For IP tunnels, resolve the MTU and the dst cookie against the tunnel's
inner IP protocol (tun.encap_proto) instead of the flow's l3proto, so
the correct header size and route cookie are used when the flow is
carried over a tunnel.
This is a preliminary patch to support IPv4 over IPv6 and SIT tunnel
flowtable offload.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 net/netfilter/nf_flow_table_core.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 0d72dc8ae47a..aa8e3f42b23f 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -76,9 +76,10 @@ struct flow_offload *flow_offload_alloc(struct nf_conn *ct)
 }
 EXPORT_SYMBOL_GPL(flow_offload_alloc);
 
-static u32 flow_offload_dst_cookie(struct flow_offload_tuple *flow_tuple)
+static u32 flow_offload_dst_cookie(struct flow_offload_tuple *flow_tuple,
+				   u8 l3_proto)
 {
-	if (flow_tuple->l3proto == NFPROTO_IPV6)
+	if (l3_proto == NFPROTO_IPV6)
 		return rt6_get_cookie(dst_rt6_info(flow_tuple->dst_cache));
 
 	return 0;
@@ -100,9 +101,15 @@ static int flow_offload_fill_route(struct flow_offload *flow,
 {
 	struct flow_offload_tuple *flow_tuple = &flow->tuplehash[dir].tuple;
 	struct dst_entry *dst = nft_route_dst_fetch(route, dir);
+	u8 l3_proto = flow_tuple->l3proto;
 	int i, j = 0;
 
-	switch (flow_tuple->l3proto) {
+	if (route->tuple[!dir].in.tun.encap_proto) {
+		/* For IP tunnels we need to consider tunnel IP protocol. */
+		l3_proto = route->tuple[!dir].in.tun.encap_proto;
+	}
+
+	switch (l3_proto) {
 	case NFPROTO_IPV4:
 		flow_tuple->mtu = ip_dst_mtu_maybe_forward(dst, true);
 		break;
@@ -130,7 +137,7 @@ static int flow_offload_fill_route(struct flow_offload *flow,
 		if (route->tuple[!dir].in.num_tuns) {
 			flow_tuple->dst_cache = dst;
 			flow_tuple->dst_cookie =
-				flow_offload_dst_cookie(flow_tuple);
+				flow_offload_dst_cookie(flow_tuple, l3_proto);
 		} else {
 			dst_release(dst);
 		}
@@ -144,7 +151,8 @@ static int flow_offload_fill_route(struct flow_offload *flow,
 	case FLOW_OFFLOAD_XMIT_NEIGH:
 		flow_tuple->ifidx = route->tuple[dir].out.ifindex;
 		flow_tuple->dst_cache = dst;
-		flow_tuple->dst_cookie = flow_offload_dst_cookie(flow_tuple);
+		flow_tuple->dst_cookie = flow_offload_dst_cookie(flow_tuple,
+								 l3_proto);
 		break;
 	default:
 		WARN_ON_ONCE(1);

-- 
2.56.0

