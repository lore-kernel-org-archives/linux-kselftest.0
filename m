Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280938;
	b=ckCNIBPQLHfw+PXEB+YTP95vd8pilQJWYy0i6rvDFoL7sZOAJqVV1BMC902p0gCmRJfr
	 B9r8sDISyA70uvNFV6qpOKifyEn4N2vwBdg3+Jh6qQCkTgJ5h1wWzi7SvmKqXNcoBLgup
	 /osx7pjxH5t8/lpWdr3FXCaOu6nqdyMxfIcl85399Se585SMPqf0uTXQfOOOa6QXFCjmD
	 FPjOMO+/UIO4I8025cwi1lWdGS9zWyVdGLSHKIToDNczEl0cVcSyYQu2cjprCbSSJxp7G
	 xuxHggtqV5ODlE1XjVjv3c1T763fG4btf6XxZVPWNQJz7AYLcWGVbRPg22Z0xKnzzJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G7QJTXk+yyu2noyd0AhwDq/i52OWJ/qR9UIyjE9rMjs=;
	b=CJktzcNq54TJPOpeo9El3BsVCxQM9b/hGf8UdkIOJQyt4jPZ7vzFY0SoaFnOnkwtmPKU
	 v06iDFfwubYFsrG6wuyS5TDmwFB4jRmgqmwHPM65/gXQxAcfbuEvLiIcxmb/L9JIl2M08
	 MHbHHpq4pbSV/d5GxXF3Bt+jhYl371egwsG2Fxbs9ja+YdlSpDfV97Ak6xttz0hOH4UZw
	 2B0xdE/VXivyDHpiOHSkDI3cPQInVjYWlAo6guyA2z9C+GtxaR40HLjLD0idXswBKqlEy
	 YYkzKtWZ/sShIC71XOG0fi7yKY0EH/KrNUvymDVB7iHY4mLQDstVFbqYtTL2CGHVlYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="H6Q/oBOp";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QyNN+Opt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C2E606A331
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C2E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H6Q/oBOp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QyNN+Opt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe5ek3399891
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G7QJTXk+yyu2noyd0AhwDq/i52OWJ/qR9UIyjE9rMjs=; b=H6Q/oBOp4C932Isz
	95Ph55eoKHZKtyWrS9f1sFFb7ZyN1znXBqF9ZURV9k7H4M7D+wAMl5jgRrZs5WJh
	ztgPaMKCGzH5V2/JL8eJR4TnuSPfJzvfmdTO2PRnCY70G5XworKevioSN6PRzPSN
	8F0MxYlJtsvI1UYsCNq62bLh5ZaRP78t2FkV5dK4Er975Ah082f5gIAoXdG0ONph
	hnWD9FDMLIp6o9nbf5zn/PB1wmC50ULhf+zQZzGhrAHKZj8vCFmAjCzqwONIYYSP
	Yrmqj3a+auuOHFg0hoMgLu6hCywgBLKlIYuIFW/OEIM+cSViBLivifVVFMrSR1CM
	B4EHlw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2c554-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:37 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990ca9607c3so1198225241.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793280937; x=1793885737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7QJTXk+yyu2noyd0AhwDq/i52OWJ/qR9UIyjE9rMjs=;
        b=QyNN+OptFdlFF0K7m/VFTglUKgXllGt0KkClDb+0MaVnmzNfWr7Xs4rOEiqeHyuSBI
         F32On/ltUjvOuHSJaSoTcz1CUm7MRF0nEKivPdbgeHlWMzqdy2eTsycxyfWbSgaqipYp
         oUvyugLGKMlK30fylRIJ40xnyQWmouXNMamPWVPgC03PcYXMcQRVMb7SITP03HKM4jxW
         bPnCLaTbmZqkomGpSCwiC1jAVibMGccjE7Scd3qNIu9zQrRZ2ujOG0AZtW3bpWnk1p1e
         KzHHLM316f+6ENSUEMY73ITAijHxorQ79psHYW9v3iFixIZ/cBtIL+pRUMbA9JY3BiTw
         MJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280937; x=1793885737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7QJTXk+yyu2noyd0AhwDq/i52OWJ/qR9UIyjE9rMjs=;
        b=j+oKaMPhwENa/6QYbKI5uZLil2Edan8Zmxiy9SKaRSDtOu+MP3Cz/v6QFsvtfL9l4k
         K7oxSQ3QOZLZ4+EIMggZLl6nHSo+Ts/+Sz57mXBOQPcbEGdxGI9hmp2VSzkwCNuS+YB5
         +kOa2cZftCo7KAZMTXrc9xEiuOiht45T7+SogrZxGXHw4fQEqctnN9ydNL2EY5UbU6bm
         89flfS9wATvQP1RWKQ/Cl1oC2J5u720t5vQylTfWYTXYZT7VcK3ph73zr1Xdt6v33TSC
         nidEBIzb/1lQB2uuWrVGDS3pG+G6Zs567uB/tESUHJ7Dm+y2PrWKlHDHDmeCOzP1xkcE
         8Vnw==
X-Forwarded-Encrypted: i=1; AKwUvBwG0KuMSltBuQWITPl6L0MWOUFZ9eTec8jjsHKOOLljd/UenEITNlwmteiWmtU9A3YcBOQZ7t13Dks8rxkiDCg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEU1+N6m5iDQ9KGD8NetuYskMEhhWC2D+rVBSThW/GC7v/49cC
	uUgHfGeXFdE4J4E93YAUrGNSaP96mIvnrhZnbDdnj4ML3Ge/XcQHuk1vmsB9BoyNir7cL69RfEh
	bExAIRNmNTD6+yircf5efK7uJFGnl6aIOieF8vs3LChtJPfxl+S1y+/KR7+EHeK1mLMBgMD58pl
	+PwRw=
X-Gm-Gg: AYBFou28rZN8ghbLa9u2lYcLYp1jOEIfXO7ujtRGxzR520p8ikj4jlMyBBB2OasiZAP
	J7pUrROo85Mx6cL0VHLnT0qGq/wCbeIj8uoOR0c+w8HW3/JN9HqolmSNMfHui6uXlE0qFK8fJH+
	PIy0NNxYrXrFOoiLc4ss/w1P2tXBcf4mTyzqnQ+cyPwwwLJH/EJxRnugF+OlJDML4X/Vi5RPWTE
	NVuZ7LsyRUIH/gDUdA/sL8Qxd3dibByPJ+FbDI0pXbAOPnvEoxNG3txmpgHRup0stBkQikRlKKf
	iQAkplXHjSC2uNWxKtdAViryl9AfHVd3NgxD8Cf7eI2ueKQBiKu6FkyuxBtVOQbxZfen+TGMCbx
	lEe9c9ARIaNbWVPcr+MVQRizg5l5z+5sL8UZpyhHQetqdMWtZILwWVba5CFOGkuAfROC4u3tH4H
	cEk4PASV1+jai8wh5zX/vz9A==
X-Received: by 2002:a05:6102:f9c:b0:7cc:26a8:e716 with SMTP id ada2fe7eead31-7d03a499792mr2652608137.18.1793280936604;
        Thu, 29 Oct 2026 06:35:36 -0700 (PDT)
X-Received: by 2002:a05:6102:f9c:b0:7cc:26a8:e716 with SMTP id ada2fe7eead31-7d03a499792mr2652592137.18.1793280936084;
        Thu, 29 Oct 2026 06:35:36 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e69ffb93asm2380618f8f.8.2026.10.29.06.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:35:35 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:35:12 +0100
Subject: [PATCH nf-next 1/8] net: netfilter: nf_flow_table: recognize
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
Message-Id: <20261029-flowtable-sw-accel-ip6ip-sit-v1-1-6a17c54f9fb7@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae34ba9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=m99eJ5p7w77CmUfuVTAA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: dYO_49i8iwpOd5haK_MlDymlBexPOQxT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfXwVieRPuz2bAv
 JEmkz6nc6wwW9wwHfz9lTktJ4LDPf1VZsJWaUj6p15ClYlsPST+wS7px6i+soP2hG0kPhdhR6PY
 A+jNWXw0yeNmdFf4iIp14vLi4Gg6wHI=
X-Proofpoint-GUID: dYO_49i8iwpOd5haK_MlDymlBexPOQxT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfXxB0hbWS0gzDr
 PbA/U6TxKAl9JNyR3r1kJ5KTqwsE/cxoIB6wOhzDMosmJ/6wubb3PePK2vN16tCU3bbURcXattN
 UD3n3I3lzivpAbfHaYL/tDw+s5lHaLVsDQwIm2i+4lUrAf+KzTafBcKMnnH9i6gIpOzuDdXbO7o
 UdC2da/eKCP7UUhmOfnIew0g/26HU0s8VNvqCePsth1r/H4gS4Th5V/YGG6VA7y5bg8BnL346Bq
 RRhwARRFTxb2stpnb3dKg9vEIvAziHWMs45xPLk4IKFbLpZztLT6YS5RBVhxhLgth1E4q/u1OTQ
 sIuYVU/LUtILvrR2UPvz0fLnO60/uy1u2mHyyFpUjQjYVtCIOrjwU/JOa4/k3mAPIbdfNadux/H
 1yF5dYdoEUjkpVfqcmd7gqBBi/WWB2NJl9lJLtqOAw0OeLF8+bkYmcq4vgIVZfJeMAYfvU9bvrX
 7wRBKm8rVIlQxtU4N4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290053

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

