Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559743;
	b=IbapPnbLDYCIsc96KvG5b/o/pnAxOByAn1UrruBmmDEKv0JuolGXbxTBbrPm61znP3Ze
	 s94mLeUwp5xtHc6ot0Xe/kUQzIB8TxNg6NSeGWSoizRq2KYp9iHhxPxewq44KPL3vth0y
	 x6IRlrzpVl4Srwab+JJOsJfpLW+2d/Mb2zbe8kr1GAzvB/WVN+zB2tad3d4yx1FplXk4m
	 XXCRhgAujxkuL71DOebySscuHwjCfrhnthdf1fWz+F9GdSxz6+e0lOndB2lwmadfqzK6C
	 vpHW9gmNvV5ETFbJNlBt185mHBqWsa4IiUx9zA7k45gY37klbQwnp/V7XyQ7peE5BMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G0+MB/jUqRMYUuh/ZFNJ9BJObePXpvta6v/irZNtSoo=;
	b=eiep6SORwcS5o9KqbLV3aCoYckfvRMdwgAGJu3hsUAQtGoupwlUcGDQtSwShPl+QNJeN
	 9QO32MTN/vpH3CkqIDD7LnJzW5CyvyZInLySf/y6Y04HXmJw8ZHXisjOL3S00ihggcCoL
	 HWY9BqTj7cInsG6FBHH2pJsFtHosgSwVS1rOGyhy6I9XuophsGVhRx3VcwRXWOmx608VC
	 iMe1yCXPJwA8hXasbVtCjYB0OoY49psmyVjNrvJTnbiDy9ImBgHa5/5ftOU+dJYYYK75T
	 JZpTPugYhCAFazGWnjMcCyy5UNEVIVHNxFcxVp+eDGuOxlXSdw0Q+TjERUQzDoFswGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="A5/BXzV0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ejosh6dk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8BE606A337
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 19:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C8BE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5/BXzV0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ejosh6dk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQAAK888139
	for <linux-kselftest@vger.kernel.org>; Sun, 1 Nov 2026 19:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G0+MB/jUqRMYUuh/ZFNJ9BJObePXpvta6v/irZNtSoo=; b=A5/BXzV0mGaroje9
	CnHteb7bEaQL2yBH9r8wbmoMgoZYzdJrgh5e6XZaJ12tykRgTol3IcCjFwh71H61
	I8ZPFhRCqerNfgM4i+DASl/tOkCY4dCZO/BvpgeJtLemJLfKMmld+NC2rILvtd4x
	c/uzCB6051ObBKiMbRMwyturhO2J+CTiTpyUhgPpMiKLnOA9Is25Ay5H/aK3Im5x
	/W3MJASTsxw61+mEx68Kp9WLo0iWDjIkVFSzfBCM6w/1V6IYz2QLuvvf6yanztOA
	Fr6DWGEClL0sRQ0tC3lWyJH7mqb3H0Mi53oWthW9lIIzzUQKQzYilWTImHuEByhh
	bLGc7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ekv37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 19:02:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso380991385a.3
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 11:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793559741; x=1794164541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0+MB/jUqRMYUuh/ZFNJ9BJObePXpvta6v/irZNtSoo=;
        b=Ejosh6dkzD1KmRgRwcFx9GduiNwBXi5JkWt+dK+1gdQbFGjU2NV6Ep4se9+1jFkqqb
         W2MGd4e/X9zZKyX2QLHaVP98MiQPhTNwO2sDNUUnNht2ohfABK4pzDVVPh9+8n+BLbu2
         JAZj8Yg088R+eGJDHuzfJaQBO91X47OtMaeAYXvmglASzLxiS1U3aCz+sSl6oCjpdNUu
         rIl3lsl2JL+EUTEBoBci1DKIeTkjRXqQpEm/nkuXDXWfGP4jOzy+Q8lWRqFUT+dw33cO
         Oc6NWplhbdww1SktD3GENZqKZHFUwJWI1+PSBnSHfjLE/YB3fXFarXMGMM2NAsh/ev0w
         AaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559741; x=1794164541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0+MB/jUqRMYUuh/ZFNJ9BJObePXpvta6v/irZNtSoo=;
        b=D7zmPQPeR/XjCdLdnQtwMR4otYZ9TF2VeT3mxiLgmLKwmWyFozgi1McnOI3pqCs+V7
         X4mHoDmNGmJ6wBLvXWmLBNZ5R/I7W1DVS2ycQLIdiM0AOhDdlhMCdQQzI5YPDbnKRmVB
         E1v9QucXVpIXWmC0VwBhAdpdiQ0p54Xo/XBxkrZ+FSvOXObXRwuxDXh36sKx3YatLOMQ
         SEj5zrn1ndtVRqWR/yS0nz17mQTUZiZuuhlsU/KaBhDI9kzLFmXWRQBRzeGsBdePl52e
         3kv4IjtVzmW38WpI5TszTE0n7FA9HTysMkrwhjKKJP69Uk0Oi5kdfmOCfVj8vtqgNDY6
         GgCw==
X-Forwarded-Encrypted: i=1; AKwUvBwoPWHku+kQ4cATA1IR8e2ZATPuHjzxPgrUX2I3eBMcsowrOkqlNMRI1mJrkWqoaPZEZdxfR4rIvmT9oANEkDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLE5FYAjoZTyEu4U5d8DtDjXUDrn3cByGRps7A2qeF9CL6nGm3I
	YIoufNLYj6mPC7KKVup6uQQpaO3Om3T6QTr/GOAa8Nb9D15laXzCfUvb0GPC+hXkYzadyvLiEmA
	vRYLcAIY+FtFum1gSNZKz+qq08+j0FEuSG+wQKfb8BIa+2EkjxhPKC1PQ9m4Hvc/BxTSpG3Q=
X-Gm-Gg: AYBFou2BuGnPRtW8cyjCS/UGdYTCObNWgxB++mAEBNisXgQn6UvIkmcNZKFD2IaWk+x
	p7I7iDrECtKeYAoFpOJrohtIHNAHsTxKb2bhuDiXN53vv9yNxP+qAiCtufmWuiR1D1XzYRlqA32
	8ljbmcEAR8Bj/L+v+vAwxY47E/x5GMHQYjFXgHl9vTE37wtBRPgd6Y7OCOrGn5qtkumlstpu2qw
	TDSo1GMcVgjG/Dq2pHyHq3cagH5KyFd8VOB/aiOQmKYBzS22T2vpMRQx8d5UcaV9TdJeVlKz2N+
	LFrGVN51+Del07L/lUlg/wi6ei2krSVpj92B4jRZmj1OgAkUN8LwuhDSJCWs8S/EAFjjoef0PiJ
	ndgfNK9EacPYNQRWCgEuQOaxfFBboD5nfIsnHaTOkHGZaeJbscOjfztpdc0NOE3I=
X-Received: by 2002:a05:620a:468e:b0:942:e4f7:6104 with SMTP id af79cd13be357-944217a23cdmr1327689885a.55.1793559741273;
        Sun, 01 Nov 2026 11:02:21 -0800 (PST)
X-Received: by 2002:a05:620a:468e:b0:942:e4f7:6104 with SMTP id af79cd13be357-944217a23cdmr1327683585a.55.1793559740689;
        Sun, 01 Nov 2026 11:02:20 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm259126635e9.12.2026.11.01.11.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:02:19 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 01 Nov 2026 20:01:56 +0100
Subject: [PATCH nf-next v2 2/8] net: netfilter: nf_flow_table: refactor MTU
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
Message-Id: <20261101-flowtable-sw-accel-ip6ip-sit-v2-2-c6c282cab5cb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX4oBCzA3cF4Mx
 UEIAYgxf2KVaOX7e9jVNioRyFmsb5OIcFapWu2+jvFA+RBzOSIoSJ9wkRr7QBSZOSubf9DxOph3
 SGaDLi2aBS+6tREvrzELzSYdsDj5hAWXphLYUr9iw9dp9lbFw9enrjBcQ1iuQqch5SdlUGAtBGz
 ev8cAOMOSn54pFWokjroovcZlHUAjDlaULAE6p4+RmNlGKAkyNARe4zL3CsNUDcMznLKEXbbCKu
 MMJhgsP6ZTq/NnzimkzcUqBHIt65TobvHSIMFqMTZh7JvrExd8jZKiq2iIz3w/y90IrOlKA7K8q
 hiBY74N4sZ5uYCneTgm0mN8MXkzK/tfLz5T8W2/Wh3vU1x/kXV56ZsdrO5ffhO9/SGxNBPrrvkX
 gqA3a24MqdYC57m+LuAfJC8SQAT07JldmoIMw0/cCbg+31qjElJ93By4OLc6PEwXsZ7F/7OGSJO
 G2EC4LsE+f3mmk+ezrA==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae78cbe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9AI-LCzJV_BIknmlFlkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: DdL6mYCxv3SiSBL5d8iNFGwwNUXv8o3O
X-Proofpoint-GUID: DdL6mYCxv3SiSBL5d8iNFGwwNUXv8o3O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX/E38/zHdO+Nn
 b48I5D8e4MvHxiNSktQ0oplAFFmjPOeGAhIJbSedFahluqAKtd4ZRHi4uQeXA3On9JZ3p1LhtY5
 dhXhyo6Z0l/2XP4BrI/lmQSK7qBCd2A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010075

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

