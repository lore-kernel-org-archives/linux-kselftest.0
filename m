Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714473;
	b=er1vvGaTZ62L9/EMNJqZR8RnP6GaWNOGa8FtOHSUCQVWczLbmCWQ9BjhlTEjltEeFEMf
	 su2GwUTdqSKFkt7bzzPB47aseZsf3EGzEpvZdD5dYI11KPgb+17QxPzPZo/BbO48JKW30
	 t4zQnVhU3hR4uL5UGh3EdD3xc24MEFHJsTUyN9JrmCu+edZfGRNfCgZ62L3F7EhR2yLOs
	 NGXacXoA6pkpiwnVRbIh9xbd5lyb4vv+uQVswXQNBtLWB7SnkYmBiAvhUZ+P15QI1tlbQ
	 zyE7YtDHLW+9u6EjRu74u4TnvPkwH1+L0cVMAd6nq7aKBT4G/Gc8WuhoNaJ60XvW9ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G7QJTXk+yyu2noyd0AhwDq/i52OWJ/qR9UIyjE9rMjs=;
	b=nkNELqhiaI3i1H7rdoXrlSv8Gf9Gg5c7oAO3DioEZsiBKVqsdV0o+yEN77rx3aYxopeU
	 1h9Qi8akFp8zifTl+o9PNPqpx0i7QH49Y2IZuezOoIXF01NP6s6LNYnZ1DDU1KZHMQN/K
	 tErmHRgheyYjiaYwLuddaaZ3cGySCFGx8961+hHL+mvvdDM003zBwYpJa+snteakHKQwK
	 RzNoP0/BrCKz060NNVUnCD0kGO1NDNwVPZHHgISfJd+N+9eGQIi/WrSX1GaTwZgZGQd4q
	 wDzcIpDbLp564w066QMJBzh9qfcduewMMRF7OBjxpAezrFH9442LinWlLdwicETjjdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuODcAX+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T8ak817K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E6E606A328
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 14:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40E6E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuODcAX+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T8ak817K
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZCQ23612399
	for <linux-kselftest@vger.kernel.org>; Tue, 3 Nov 2026 14:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G7QJTXk+yyu2noyd0AhwDq/i52OWJ/qR9UIyjE9rMjs=; b=AuODcAX+odnE96rG
	unhsBxUS8tw/cE8LXCIiTpdx5fVoTH8v/HB0Z12EykOwm6/kUjnwZWHRlxxOR5nS
	TiiIjhWzqSXaaO2LWfzLTzSvsWcpsX31guEY68T+8aog21zNLuwHIFyivU6oegb8
	a+MCJV1ZxoZZPxs4KF1S4UZeZVVJ0SjONEfg8C7yujr/nSO7VszYgcbO6c3eM9N1
	jilCdGh5YBx8qfqxgVime+DBVKLjINQvkG+firwAlgfrzgig+rkqkM/tfG5wn5BK
	f/kM7pY5gP5XCfByR1lgZPK4SC33IWqVEEpboPieJo2wsI2oTFQrTfq9MFlR1GwB
	pIVY4A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9ajr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 14:01:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eab2a9a633so3904243e0c.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 06:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714471; x=1794319271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7QJTXk+yyu2noyd0AhwDq/i52OWJ/qR9UIyjE9rMjs=;
        b=T8ak817Krnd/5fdUXW/nnHWEku0BfbVUzjXQYXMBGFAD65s2H6XQLYopfHJgX6AvbE
         nc9EleofFDNrgLWOecdQwtHq88cYCSXBFme/yYlVXmXVZq0IMyWBXbYMW0Ek4sYVV1AR
         pid8UvherAdkYQrevq5a9ebLe384xaZLB3vdU1eE+7gzztzDr5ocjAu9F4zen4F/n4A0
         OHa3JunW0sxiNnt90f5gWid8RgEh7/SIKsIGubvih7n+jMWF1bs+RWanHNn4SnEc0/mT
         Xy8yS2rGCHMZqy+GgB46X46QQXQ/V4g68TlxE7z5oGQ3Q0bFVAf4p3nD1xsYlsAS3Qbx
         lh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714471; x=1794319271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7QJTXk+yyu2noyd0AhwDq/i52OWJ/qR9UIyjE9rMjs=;
        b=00X4uLhR/G/Xihr0aoy8ApSz00CQU0C6q2bx+2ICUaIogkbFNGkoVeWp/hUC0NIez+
         nxt/MmH5i/U2Rn3ghfF6eAwGEeaLykwGt66FzshlN9e++zaqUbk/Eo49T1Sn+T1/g75c
         hZe0Cc6izJnPpS0U0QxkqHGWC9i2TJhMVLwl3gyTDQm+vDW12fMIldrwJ4dum7xfxi+S
         Y4aoLAYgTElt6ZyZH+Dg4RM+TDAD2OSh4K9iHdKAB8MEYifueX79AnKA5zAkqGMGXrxw
         NidUmIn3ij+L2366+BzIvGVc9H+r37pnvtNqMb5Q2edkNZEyyCoIsLTiTcmUxOM2bjmN
         ONzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRGQ8tQ36PMXpm7pvIBelT+IaHS8EzYjY4iap7KlMrdac6qmSRIkytDo7jd5tKlqHNEWi9X1IWfPjjZBNRLgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FbK24bXR07WwTdPP2dVjFkPYFaxdNHlcgitI0sln1SIAcPLUu
	kgVb3WZhfB37v+U7I1WEzFNwmBBFrX4rKlK4cXIJkn5Fp2rf/4JZll9ZI8pJkewEO1lmDkp/xnX
	KWCIsX9XpDaLLLyp0JemTjfJA7M89c69K2X1Koz4WMAH/qEpKA61dAfv1aDfb/e061Jjyskg=
X-Gm-Gg: AYBFou3kFyTXd9NRePT9msnSVzmVaiwog3Iv8b0OwxxSh5FcYQTKkvxMU5PYOV0XjHN
	yc/qjYarWsVkinROJ08IAPtday5Ng40LC0iMQ9MZ5uod3gXKP5fEyQOVhoQAC3c9rPjarekoTnY
	Y4Hz/yTjirp0KorXR6qiWcc/aNPmQBLS5A9I2hMl4hJkrVFfTtH24h62LLsjLxzmzLYRA5869R2
	egIDqmYPa1rv6Zg4+RhlOVVFEYfN4//XdSe+ziDbWPthiPdRqF5E7caOnUTDJFX2MsFBKgNwYaV
	JpVUbBDtpkG8ettZVCieXkWwFtaIfMEDoQF0Otd5OFABugEXCh4jm9KoO9/LtWzWFxXWEfvU3Of
	185UX/KCGu5TYEB1hfBix2p3fSQg7wNFTos4SfHwDbhz7AtNJVauLmPA4g9mnQYk=
X-Received: by 2002:a05:6122:4d86:b0:5ea:aedd:6087 with SMTP id 71dfb90a1353d-5ec6871d3d2mr5829644e0c.4.1793714471145;
        Tue, 03 Nov 2026 06:01:11 -0800 (PST)
X-Received: by 2002:a05:6122:4d86:b0:5ea:aedd:6087 with SMTP id 71dfb90a1353d-5ec6871d3d2mr5829582e0c.4.1793714470476;
        Tue, 03 Nov 2026 06:01:10 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm65369595e9.4.2026.11.03.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:01:08 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:00:42 +0100
Subject: [PATCH nf-next v3 1/8] net: netfilter: nf_flow_table: recognize
 IPv4/IPv6 in tunnel proto matching
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
Message-Id: <20261103-flowtable-sw-accel-ip6ip-sit-v3-1-60b5f063f1df@oss.qualcomm.com>
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
X-Proofpoint-GUID: 0TxynIz3yUnNGmX9APEVMQnLwyqbMEVN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX7EegkIf9MfqX
 4Fzs3yhpd1cRTOMSKGVj5kdx4YSlp/Bs6cJuoUpMIZwdwTrWqtIEm7ZIqS7GROEg2+iw28erDGV
 uxoH+VZbG3LsuuKJO67VYv2QIRm7CDY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfXywugErr0QCLn
 WX/k84nVG6rl+QvvXihEkDQfPO2AF7dxlCZxq9tR+6pxBaEuh913NnW8+D3ndbDT9O79ZPPfBSz
 tZnPL9me1kwwDn1mEcVzaR2tgnCrU2XHIpWG9YA7hCCgczuQv+AdIGbRN0N3iMlGCYh0nK4b1lq
 inCL70TuChBfQhdiXTaGieaNLzuK4pur5+d//1XpMO5Aw+AARN1Jg96tX83EioGrcsPUSiAMjkV
 7q9oRpxOGqsVy3/c7H/blXmDW7CEA/G3IQIXHwVFjGl0aQUo7+YisSGzaTURR5WJpVSqQeeu+vc
 hUqzD4orgzS0nIVGN/z+x6tLzMbi4sAD5oiWTusVCRGd4igrB9AjaMhYwnw4GiHBWRTjU1AHhUx
 +HSASk9FJatdXKNvS4y9u+xvYM/L+GYxvCsMbqRXWkaSjfW/b6cl83jPUxoicOEvfYeJjxksUxq
 rl/9wEo0I3dsie4NoBQ==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9e927 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=m99eJ5p7w77CmUfuVTAA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: 0TxynIz3yUnNGmX9APEVMQnLwyqbMEVN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030055

Allow the flowtable to parse IPv4-in-IPv6 and IPv6-in-IPv4 tunnels by
accepting both IPPROTO_IPIP and IPPROTO_IPV6 as the inner protocol when
walking the outer header in nf_flow_ip4_tunnel_proto() and
nf_flow_ip6_tunnel_proto(). This is a preliminary patch to support IPv4
over IPv6 and SIT tunnel flowtable offload.
Please note IPv4 over IPv6 and SIT tunnel flowtable offloading is not
enabled yet.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 net/netfilter/nf_flow_table_ip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index 19cafae748ab..e07fa9327eb7 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -328,7 +328,7 @@ static bool nf_flow_ip4_tunnel_proto(struct nf_flowtable_ctx *ctx,
 	if (iph->ttl <= 1)
 		return false;
 
-	if (iph->protocol == IPPROTO_IPIP) {
+	if (iph->protocol == IPPROTO_IPIP || iph->protocol == IPPROTO_IPV6) {
 		ctx->tun.inner_proto = iph->protocol;
 		ctx->tun.hdr_size = size;
 		ctx->offset += ctx->tun.hdr_size;
@@ -353,7 +353,7 @@ static bool nf_flow_ip6_tunnel_proto(struct nf_flowtable_ctx *ctx,
 	if (ipv6_ext_hdr(ip6h->nexthdr))
 		return false;
 
-	if (ip6h->nexthdr == IPPROTO_IPV6) {
+	if (ip6h->nexthdr == IPPROTO_IPIP || ip6h->nexthdr == IPPROTO_IPV6) {
 		ctx->tun.inner_proto = ip6h->nexthdr;
 		ctx->tun.hdr_size = sizeof(*ip6h);
 		ctx->offset += ctx->tun.hdr_size;

-- 
2.56.0

