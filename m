Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280944;
	b=WYePBxXK4r0Lw28BtR7lhIJM3tFMc2MkAEP7pr7FuwJU83EEx2pfCvjQ8K9cpdGZPl0V
	 bhislf00gUwdnVTz+PLvHuiQCo2OAgGCR/eK+F5T+gcfw9CQn+TLojIRc/E3ipLKr0bEh
	 Pat285gtkxZ56Jrkaa6eNfiVneSxxD5R/9lUpljoRCAeAntaoPTJvXeFpzqWdAzy5STDc
	 LrEEap708yxvGzybqR/90cxOXepru6dSDCbZbKuKwtOdLCt/pdLw4ShquABKSRLNNsARA
	 VKHFIz/wC6w5HHm+2H9qtnPBW9m+n39J8lfjRf9lEDecxJbCMKwwbS8EhCHjDutQVew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/28GQRdfBjNpaKqoNfgQNMIhyHphRu4eJhHEmguSmaM=;
	b=tRrUZZTyf49qo2uP9kkWx1eNNAD1Tn0ETe2LGbWdoYSFFBVDbu9Vj5XM4rxgGNbjkaTW
	 r0tmrzSyUqtX8D1snQ3ACdl6TULUFtqnNahAZrBqH3MogJYNspCh+li3w7hFVMSemLRPv
	 +gTnntGQQkAvEW64PCqHZfUQhgNiH1LQu9SxD3nQq2mGzWSe2HctV45ftG9zJikw+XhFm
	 a0P1XNylaFT66Tmh+SEcoUoHyQMAjKCw22qF5cBeL6newDu6OaXyL7LGtGimB7KW+sxca
	 upyfaSaYXVSUP8CiAMFlQGcKtCWK7YzRWNVKUGvyqlW4TWDImSvoBxVFbu4GbdKFORA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+hV56lE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N99pk5SG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212F760A260B
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 212F760A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+hV56lE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N99pk5SG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe2lv3768196
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/28GQRdfBjNpaKqoNfgQNMIhyHphRu4eJhHEmguSmaM=; b=U+hV56lEhV87Txso
	hODZ4Tr9YC/5TkCyrk+ByAID7mE+2r5YtkPcx/NR7XWq0jTAZPROCUB161LureqN
	ZjVQl/lomhnWcDgQ61Ty3ppo6gwRExs1vVsCP8SpeZLKNrZE6Zm5hRDA33PfQOtj
	brIBEIrEOyBZqOzgNv5Lo2YCm00TPvsGR9Kdp8scg0d6mlF+vBI7KfYivROFlgZt
	qJOiDux0zijRCy03pjD2kYyW/lW3xo/v3lbTsIJPSxR+BV9TVod+nZhDFQpt9UGN
	UyoJcYJUoZBnyc2eMiRtF+NHmXG8Diwp2WnAXezICCgD2TJiU0TopJGfkQfRnGfL
	GEdiLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3nb6pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso264756885a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793280942; x=1793885742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/28GQRdfBjNpaKqoNfgQNMIhyHphRu4eJhHEmguSmaM=;
        b=N99pk5SGLMZ3awEIZWchYcuiyaRBimT3d0SVYd8Qisr2QB82xM/d2cUGE8VJEZ8HLv
         P1AZ06ex8JCZlw2BTOL7Ycb8xZQwbV7mBY46+grMgxo4S4mRg22Kh39Fi4yIxGDjeuOx
         VtiJBWdplX43R/6fh3lP1kSraoKKi8KdGBJTtLd7BRN7fYIbiUTPaNfCdsxu18fFf1If
         yj48TOYGaVeFc+ParUGThVTwgG322xrKRu9a8TvgIrGGVF5uZPFJfsrPLmBGsrxXUBDw
         ZcEIvlQx+WAIRRtQvNYCjRgJafDVk/HGrQED6P3vVevidez2j+BepkcXlt3N57dyi6A/
         0SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280942; x=1793885742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/28GQRdfBjNpaKqoNfgQNMIhyHphRu4eJhHEmguSmaM=;
        b=TtFqqTyWLNIQj6qoLHUZ5+JgYsiOYX9YSLzWDXs2sGBoQm1uxcCzbGeFzdswVugEZ/
         FS21I0zAyOqlGS7ucG91RO1w3DnTvIJQCpa8XS4/xOFoajxEmRTfpDS0WNEfGcQNqRmw
         q0mrImGJK9Nm43AfiSpRyUT08a1cBmjPEycTrXGN/jWb6nyRWFTeb4XPZ1pV2oPuW9j7
         m4JI7ZVdz90p1MrL6H5JArcOkisZt52K1uJLoahNAqhkRw2zgNX05dRAz46zYMA1ARbj
         MRzAZQ5BHfo2AU8tlTzHihrQPl7DAc0iHYrviZUz0WCxM8jVkinh7hKxfTfH4Mfa49Os
         4Xsw==
X-Forwarded-Encrypted: i=1; AKwUvByWNyjdpBQSYYCzwAEoGq9QSh3ClRgcj94ZUniEPtLXzgFpWjTbWgLk7+7KLR+En/pcD4bKHettj1qb74S0Wwo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLihL2G3nh5tYVHhnFMtmCT5ucNcYlI9eIaEcXS7KI+UH0z8dJx
	OT2tnWtEPm2UjKJLiTxV2ptOwCYTQeZSZxHYPj3lKU9zyCQhxpzMD0CbwrHzZCESw6J0ILQl0LE
	Z6HMBgjSf52qrdacDhiR2C4sG7HN+GG+I+yVlXq4ZJzu8brZtt6xEDCzcPGkRisvjalaPfVE=
X-Gm-Gg: AYBFou0dDpGX0pkwGwLhqgh1jFJM5DvQ1VE+JEOWHkpjcqP/WY8L7jC/wwx3uQBeYkX
	YqrGoQz++M79HeJutSfpymH6Y/7YAy9MM+k+6SeAmBTuJEJeYdjNYXlnomFmUc48Czd0FZdVkRd
	0UQc54FOrQ46+R2BNjFg45h+O3U6D/2Bm6A/xZZuquuGz7Ks8ew3avXmQfqHOKgBDP6NTRzrilf
	PeYZ4mcweuGRfSGOvX8PEAI9S9j2nFQRl0l3W6bEDUl55YRxDOfOD8tDq7hC4rUb3jt4M7cYMFp
	x4qsVf27RgFKHR23aGmPPlEZrLnE2wc9Vh3ssFLKVDUyYLlSLFSXIAZ7bkyoQCYLF8E7ExfYB/8
	5SsfEbBzJ9uFPIu97QgQiBOxXI5aEc2gEc5esAEKTfsHJJufBKZUTRjbQ1iDRapMiZopKcZwXEX
	KjQsWyZbXaXbpZoMgpcHR/7g==
X-Received: by 2002:a05:620a:4489:b0:93f:633b:ee13 with SMTP id af79cd13be357-94408a268efmr789319085a.28.1793280941851;
        Thu, 29 Oct 2026 06:35:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4489:b0:93f:633b:ee13 with SMTP id af79cd13be357-94408a268efmr789313485a.28.1793280941196;
        Thu, 29 Oct 2026 06:35:41 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2950sm65071465e9.8.2026.10.29.06.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:35:39 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:35:14 +0100
Subject: [PATCH nf-next 3/8] net: ip6_tunnel: add IPv4 over IPv6 flowtable
 tunnel offload
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
Message-Id: <20261029-flowtable-sw-accel-ip6ip-sit-v1-3-6a17c54f9fb7@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: QV_IN7bOQWQYR9H3tiZ5MzWznQj1B_Ft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX9wooSOMr/pVb
 xPp6SXFSxaIpwuWnFf7vTfXpDScrOcyAPxqi65tmN8671AefMYTE2FZqmc2WEBd4Sfkn4LMjnGe
 QnekG4bnf9e0wzbR74wpp9ZWb3J0S8g69IXr8R6wRpLzP6zZ3t+y38N388ddQ0uzD4Reypq4v65
 65LTAvK6+fTybnXOwA653xKhMDoWTid423UuE6eiubpubIdDpxaTy/v5wQl/fTK/Z80gB/gYmqd
 KlPUs2/8xNgIzH4Tsy+CIj0u3JuxCRTyYCbOJZPfQXwDn/X4HUYfrb3168l1sBc+15KTgozbSmR
 GWl3Z5vJ1bP0eOkpWJBjGUTg/y5r8tXyjsQSfHwV2hnbOpOKO+3zMZcvrjjrpLGjy8oRjE7odMh
 8Sg1ArAvF1E6OBXM9MwsSlQZrZ9Lok0vZ/qXu0rN5L9QAIsa6jwp6dSdYv9lkOnL4wN6FaSX5mq
 pDHQ8xSgelZ0qbHr4Gg==
X-Proofpoint-GUID: QV_IN7bOQWQYR9H3tiZ5MzWznQj1B_Ft
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae34baf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=01qIw42SU59cxVdbmxoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX9FcjjHzCbwy7
 WATfDNBlUdkT5HMJJTco0kk2ngxpoS8KRF+dmZUcerT2IdhRJ6CK67/3gRLQX6R62VLHjFtW/Bv
 2MFnrwDBwjUNSw+ygrHqysN1AoGxY6A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290053

Allow ip6_tnl_fill_forward_path() to set the inner protocol for IPv4
packets (IPPROTO_IPIP) in addition to IPv6 (IPPROTO_IPV6), so that the
flowtable can offload IPv4-in-IPv6 tunnels.

Return -EOPNOTSUPP for any other ethertype.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 net/ipv6/ip6_tunnel.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index 64a184bca467..9ae14977c900 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -1844,8 +1844,16 @@ static int ip6_tnl_fill_forward_path(struct net_device_path_ctx *ctx,
 	struct flowi6 fl6;
 	int err;
 
-	if (ctx->ether_type != cpu_to_be16(ETH_P_IPV6))
+	switch (ctx->ether_type) {
+	case cpu_to_be16(ETH_P_IP):
+		path->tun.inner_proto = IPPROTO_IPIP;
+		break;
+	case cpu_to_be16(ETH_P_IPV6):
+		path->tun.inner_proto = IPPROTO_IPV6;
+		break;
+	default:
 		return -EOPNOTSUPP;
+	}
 
 	if (t->parms.flags & (IP6_TNL_F_USE_ORIG_TCLASS |
 			      IP6_TNL_F_USE_ORIG_FLOWLABEL |
@@ -1867,7 +1875,6 @@ static int ip6_tnl_fill_forward_path(struct net_device_path_ctx *ctx,
 		path->type = DEV_PATH_TUN;
 		path->tun.src_v6 = fl6.saddr;
 		path->tun.dst_v6 = fl6.daddr;
-		path->tun.inner_proto = IPPROTO_IPV6;
 		path->tun.encap_proto = AF_INET6;
 		path->tun.dst = dst;
 		path->dev = ctx->dev;

-- 
2.56.0

