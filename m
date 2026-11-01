Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559741;
	b=bJfoSgYxePJOaWweDRCJEdzW3ZaFQoUeRqi9zLQNYenbGsDl2GZhlcbqreil7mO8ATAC
	 o0RPnKgw7LFQf67ZJS4IG4wGbIu3cO57qW9opFzV1HuB2+82VMLDxAA13DBA/1h3CoZY1
	 4dLdLbsW8w2NIcyqZpQcIQAyWRoLKKkvlSoP0nSUSpsXZ1iT0F39Pxs6JMW9b1hsMRF5G
	 FkJglq7bEmMkAt0Kq9z+ewa8DO8ekMw6Sq4Aeeu7kEo66kLtAr57Fi+2sWjkGTI8uri2C
	 LutRDgRW/nKOVie6BQZw1kECDGziWtDIW63KAgOStcxWdaE2a2XhT9glgpr7bKrhLGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559741;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G7QJTXk+yyu2noyd0AhwDq/i52OWJ/qR9UIyjE9rMjs=;
	b=j74YPa/BZzdJQ9tSYoBWHf61MlaaEh7rj3Va7kUH6Wl0p6MBIznNYLy1nYMPD5lIVWJY
	 nUpDJAVfC5OBbEkeJPLzO04eLZGCDijr9+v0kJTIcc51VNlcmE2n//bjTatufW8HY/cgV
	 SwIzOS6bE7h4w8spzvpNlE40WCqXa4BL08aqX6E23RTQ1ykUD1RtsXXpMObGzVA8BP300
	 buixcZ5jg4oYocufaDI3yz7jGZ/GlKWJx1vlOoNwYga15VK6SlGjvgPQ8FuMdNWIJdnp+
	 pA7/+DCrOSvNMV11SyGhDDaMzXaEkTrxZmk9r5Y54qThtECm/ZQrW703HKAHKzpvZEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biN1YAb9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JPMMT/PD";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0EA606A325
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 19:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A0EA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biN1YAb9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPMMT/PD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQNnW479353
	for <linux-kselftest@vger.kernel.org>; Sun, 1 Nov 2026 19:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G7QJTXk+yyu2noyd0AhwDq/i52OWJ/qR9UIyjE9rMjs=; b=biN1YAb9EyBE1Cv0
	iPyf7+JX0Ql5uxcicbd6kqsSgjK+yn2lDQvdEgpTVsRkDRU56bZm2UYqal5+aNoG
	AwWe42Dsd1zFxTqawpAkIurQ91jSPxyqQx0dl0QyMpfnOMWj/NI+phXIty35pBQU
	nUJGfQ2GlVsO8A7Wqca0k79W1JbyTbB126Vxb4psPI+tP4Qxy6P3PIOuCaBz5rKw
	qPwAEYsXsYLH8DXNWpTA33fB9eM71QQqN8nVFa1s762tNMRZ7egrF0X/d37ZRRMZ
	Dt8kYwEYQBu+qw9GIRRNpG04mbpFQdeb3eLJyOBWQqi/3+6jGm4wwrLgUAvWJ01F
	cA2EsQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m9btr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 19:02:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so1880329137.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 11:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793559739; x=1794164539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7QJTXk+yyu2noyd0AhwDq/i52OWJ/qR9UIyjE9rMjs=;
        b=JPMMT/PDG/Qb0ePQ9PRt2YliE3wIZdmbzZUDkeA4/2LgnkkKn7m/dDsZfTcjElVNNP
         nLt1QV9k3lEh4Ild8KGgRjjJS4/wmrF2D6iA9upf2zqs+Ir6YrcklCEl3usfnYiWnI1P
         52uS4WZqazOsPdOYnnNGVoUi0UrNEYmHPjqQtL2N14it05czj8Ux9VCoPCJb43SAj1zJ
         d8mZukNXPyYjFT5NJdZewJQRoLvM1BYHEM/0JAtVgPcJPf8BCxud7rDZSiX3cWqI9je7
         bKSi/1ldpeCGtIh3BGrgnegqgYH1vn9jDxhHiXPYg47uSS55EBdat8Gy08jIIbbqiITC
         497A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559739; x=1794164539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7QJTXk+yyu2noyd0AhwDq/i52OWJ/qR9UIyjE9rMjs=;
        b=GAqi/lIVZkv5M0zKqzMo4c9zEGUxxJh+p+0mz4xFsBLPmHbdOMY7D/wEZRQshh6Lit
         kjSfGjqgZXn88zx/lv9nmFWUCi+KiVmdLUTIOiLijtvRaP/thYsDmOxPkBX9KtjhG8MP
         k6lIaUJmL7RuSWMEpUDvA0xTQ7pWRq3BO6AIJk4tG7XlhxoOu0Bc6oIrS52W8spEWSfI
         ZYXMAzVmGKBZYG22B0BnVwPXMr3g9Bptu8fnY5DCRciR0CHl1QFAAHNAaofMz7gfBFQH
         wwcw2/axXik1mWjioAl0kS+iAGTqAXu5V2unZoy+Ix6OvFzGcGeyyK0Dj17jbMQc/dzq
         Ah3w==
X-Forwarded-Encrypted: i=1; AKwUvBxg6qKIW/WLKv1l655YWHqNJijjGrGXsc8xl6ZLQmBsz92PWamJE68k9j9AqmwbTjBgTJSyOE6hQBagMH0C9wo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cl3VXbFYGRI73OeOPft+JkZYW3MRbE7fKRsdyw86CYF+RzuMs
	xKaOp9eGyFWcrlOKDynuTAyPSNTGlI5KnlFj53D6kt8AHZ0QmzGJQx+ckaXg0H4Xdv/b3w86qku
	T1Labxj73Hk4gsQcz1y5R1I/cnCUtgZiJrQGhL1D3y/r8KVzyXUu5zWX7YaCi0IB/QD/ixy0=
X-Gm-Gg: AYBFou1N/ZKlR1X76sEQ0w6bHvMpyrTOnyYSZklcAZ/4lzwhnSEg45p0QAy3zqXRFWD
	X2K89Ga+d5ewvA6Z50VGrJ8E9CaW58iL5fQP/OsDqKoI9OXmv5BUvZ7LUQxJ8UA/AgRkiNNyrbH
	R2vUyWPhSvsrar59Hr/ruGLjEz5/V40/sy06TdL26kgngbftejdUIpMAHUJNlqumo3/ou0pRnWw
	CPRheIPxv9Bb3mPtJKNcfnqXssIOmqYeToqJhOTwcKYekn3I4kMtCXaqmVakzCrddc9MVKoIeNb
	Oq6jbmEQy8xEsSXbsE2e8YcuQn1PB3M14J3A9dPb1q7DAxHvQu5Kli1BLEqdqCdJRD7Gsdn3Jx5
	w/h8lsJfZVFOpPwr3S7bZXwxPflKffjQaIQ1XaLM4ZBvZneJBqWaBeyw6Ih9J4HA=
X-Received: by 2002:a05:6102:1499:b0:7c1:9f20:36ad with SMTP id ada2fe7eead31-7d0728aff1fmr3992469137.2.1793559739243;
        Sun, 01 Nov 2026 11:02:19 -0800 (PST)
X-Received: by 2002:a05:6102:1499:b0:7c1:9f20:36ad with SMTP id ada2fe7eead31-7d0728aff1fmr3992464137.2.1793559738768;
        Sun, 01 Nov 2026 11:02:18 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a84esm17150159f8f.39.2026.11.01.11.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:02:16 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 01 Nov 2026 20:01:55 +0100
Subject: [PATCH nf-next v2 1/8] net: netfilter: nf_flow_table: recognize
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
Message-Id: <20261101-flowtable-sw-accel-ip6ip-sit-v2-1-c6c282cab5cb@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: tyHsYCQaC162i5cgRJeEeYHyZHUte801
X-Proofpoint-GUID: tyHsYCQaC162i5cgRJeEeYHyZHUte801
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX0BDTSGjguGD7
 Pn/furI7r9ElRDB6or1rfsA5twMxhlqSvt9NbRxVJUzor2zccBFNHdPPyGm+dZq1czMTei6QIIM
 MUehlrrIvER43cZxrOpzdhCVZbBos0ZMd63e7oMx1oGGV+3Y10Wwkbr8f5O2Koh/TEPNo7jzYs+
 JB+JxE29WA4nz4Fluj0WN6WFc6DijQWESNk0RSTEzOGfx28J2d2bG8A8gh4qZT0c+gOhh7kIqlM
 XjRGovQsLZ3FOjAf+meQMbskeCqFm8VxPUK0c8rUqzK+t6mEl4K4ukHsJeIyj2WHLpSN6wTyeP1
 KhpzW1m1ikJuZ52bewCOU0Ld7tnfy/vQ+G2qeEshIqUSjP+WJgMIzPvORNaCV03joUWn4TOLds9
 YnlqUx2Ji3839Gj6EGJXs9kBu1+ychm8LLIhuFpsjwvGGXMIBNiJqGjN/rhMpQaeDzhOiOK+/Dc
 kMq4u50uujo8hGZQp0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX2XodhI3Xdczp
 LgeZJqOi8y/nKjTl7i5oGMFTPdXo4tuE4zPiL/DZuVpS6HA9n5Tpl66royZ2+FyNOnXSfd03QmR
 sYsG8ZoJbDQ9KGj9PmASS3GpSafm49E=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae78cbc cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=m99eJ5p7w77CmUfuVTAA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010075

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

