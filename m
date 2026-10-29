Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280951;
	b=oNvDWq/MOZQsOj3sS0d8PBWl+GyrRktHeULpDTixSj055jiedZb8VMOtUr89dSu0PRrk
	 xe4eNqV8gV8WRqLYpwQXt2E04oyrx0kfC0jNOe/fmm5Pt00to/TzFOXLX27SCLkqGDCnp
	 cGbzQUoHUuIbJ7GuwuZXseSaiL7bHlneufJLuG/i/BE0eEEHmwSzAvXWqZK/gUpaJf3aO
	 ZWZc2yvFM7PfTU8Fic8zsFg+PUU8cHj97BWi/CNxBVXoOdtvmzJpkHKD6v0KhVvBD9QNR
	 1TuD4Zbrm3gf0fAixSqHxBfBVuHWrq2ZUNy1Q+4cznfCaH4n3DW38gNqMuasPspiK3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ET+B6ryXZSjsDmJogt9NhGamDLd5Mr29EJGHgALtRKA=;
	b=h/vdJMs1ESvOifVfvADATjX024/jBgn4diRuy4JVM8p02fgSiPyc5mEVKuiRHInFwSF9
	 3IOdvtwBuS1C3x2kFInzdSkxi5bZAO2Y1CqKs3Kxx/TgDBjt/6TbFCIjIuz+EKNT3SUL+
	 B7loMgqTx3RmOSpV9LSBh57UWqO3aviDZ+3ZEzAzZf8CINhAfOpoNPf286ZR3ACCAYFO8
	 qbnqXWZ8JndbW/U65RBLqqhBxEn+1SYWPq5KPADBl9VOZUpN5HLfrwHnBvz3zPCmFZ/Qa
	 DPOqqrr/yLkFV3BBMZuz6GgUtIGUSRt5KDj8X3MsGAn9jPDqJ4DYHVw1u004yjFNzTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLNZWpNu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MuUEM/7z";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9913560A2616
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9913560A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLNZWpNu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MuUEM/7z
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCePX7669620
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ET+B6ryXZSjsDmJogt9NhGamDLd5Mr29EJGHgALtRKA=; b=FLNZWpNuL69Y9q+J
	hA87m+KpiHVjpjWNpAoFy/iUnLvdRh4XlAdZZHOMjD70IKfe31wC8IgwrZ1KO4iX
	ZfJD7guBApgv5G9nz8XoTHikXNh44aDal0v/iJ93dZrMbpX6AM/bQKuXnGv02oDQ
	as7z6YLGwhwcn4wW7gS/ctCA8qGoynes7S1zEmeyWMFjYiRqPAt+hmbiNAnS+5Gs
	FstETjx/WZthnmAGr50Prt+Wrk/QSBFv2RIsE4cMIn7cjVZIRXBAArT2DzIgYRBb
	VTrn7Tty8SepSllJpKCeSZWVBfOyVvNLgDMGVCR/oZLNJS+pIN4qnxi3P1vbe1An
	gY+qgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc3rd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9441113670dso235631085a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793280944; x=1793885744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ET+B6ryXZSjsDmJogt9NhGamDLd5Mr29EJGHgALtRKA=;
        b=MuUEM/7zT+dPVXiS/DLA9tzqHBiQtr7MVZw9M9n1knQcPF48QBSMkMXw2gfa/mI6ku
         o+si8iurpWiU9o8ROy5YhhyRrht6Jdh2qve6gIvjzvlhvonqBP54l5q8usYGFmtmTkyL
         p9RQ3TYykzCFCIz0+0MmU7fBa57t2TIXCcIo1djmS6fvGRSHgJL95jZ8PWtBUCM9UWQb
         kYqTkZaU3dwZcMFMFDb+qGiPftS1voaDOO+FWzLvHv6ZnmSNC0dyDKaSy5CrsK301aV+
         c4tLr8QvBG90KWnRadlKrK2E7lzurnz9Yd7lRiFJW0xnRaqj+5VlT220MBhWbQy1HjgA
         /VRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280944; x=1793885744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ET+B6ryXZSjsDmJogt9NhGamDLd5Mr29EJGHgALtRKA=;
        b=TtORbhdJNA2K/LeGd+cGOYrIgKl81RItiMj5x2JuS8KweU6xAFnrwQTaGEiGY8vpP+
         ZysRdz8k5W+bCld7WP3dxq7unvztZCrmnoEvyTlbTraywgQ3WgUdPA+2eb2DiQ5rzwpv
         +aJSNTW5KWxuTaagwc+S5s01EMv731JjM/K51thHjiisP68i2D3Jt6RfmpvREu70fsbW
         WEtD/4jCuJXtSLffQHT/JVJ0CXa2gV9etoVMOopi4xpTdUzMNMnV0t0DGz4vqZVPcFby
         2jw1s2th2Q40eSmdkayP55gPO404jPh6zRKKOmTPAid9ywsjrd89fRK26GnXc8oEpn5A
         fJNg==
X-Forwarded-Encrypted: i=1; AKwUvBzmODkPBkuRel9/LtdsJocO4S/XKIqQQA9KTykfoC/7qpHpQJ37R59ljdkUlQaRO4OGr9wzMl1mfRZmZTHVjjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/Dj61WXDqeOwvgy2mvpjc5EiiNH388ozxglXk3/72KMG8CL6q
	zMVJbHkXS1KXGqTlhp6kRBnS5bvfIEZIqhHK8ekv29ToiJJ/EQPZ0+5q7bCPy0d5e/8JU2kFQOJ
	0jWvjErmSkDaElYsbQ7axGGlYVlyjkqmvKydEh3UzSSOJxNqoydP6SbYi3kQ2GCL1kLbuyK4=
X-Gm-Gg: AYBFou043yMHCwNZIHISesG86jRH15oHAatwglrNnPucVM9BXKKd8cffN4sxZP5jpW/
	PQpFQ1ah4hRaKA4L58T4V7nl0z0ZwIp66r0AQh9Sf2AfPHzTAz3oU/omuDbdPE0LcqYjQsq5zhq
	kXUVMmKvELZze+WTLgZYxfed8/cu4oCN931eGpe9pheoXlTBBJLXUve+pl6ModC1LO3TUIi+4jK
	99Y+zsLpHDFonM4zWiXSKgqGiHiGLmHGEShrwtJdqh/U6P28Sw7Fxb4dAW65Y89fBUCgi8Yl3w8
	zriU2wux2TXwtdC3fZ4NUgMvo4lCA6iJcvGkZFesu7YDFkakyGlB4P7/2dmaGMQ+vwsiG2V5yVg
	92NEwxctyHEqWb65N1TBuhIgy/+epNf6Oi6jm+YZcRdXuVgEW0NhdisqKcpvw+VfM0oi3D7G6CL
	pZrkSRlo/FSXWwxpLIEnysOg==
X-Received: by 2002:a05:620a:450a:b0:93f:25a0:6aeb with SMTP id af79cd13be357-94408cf411fmr898995485a.23.1793280943545;
        Thu, 29 Oct 2026 06:35:43 -0700 (PDT)
X-Received: by 2002:a05:620a:450a:b0:93f:25a0:6aeb with SMTP id af79cd13be357-94408cf411fmr898989185a.23.1793280942985;
        Thu, 29 Oct 2026 06:35:42 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm64955305e9.11.2026.10.29.06.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:35:42 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:35:15 +0100
Subject: [PATCH nf-next 4/8] net: netfilter: nf_flow_table: use tunnel
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
Message-Id: <20261029-flowtable-sw-accel-ip6ip-sit-v1-4-6a17c54f9fb7@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae34bb0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BwFUO5JFP4DfzLIXruUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DSnu5gq9fMILKp5mmiaq15bAoFcRMsq1
X-Proofpoint-ORIG-GUID: DSnu5gq9fMILKp5mmiaq15bAoFcRMsq1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX1CKooIfIC001
 A4Wro3Wq/Gh53mJA5MtkdKvNymwoBbZdUVEsRZ/zkAHABOSpaMRllIvVpfEt0ztNtBa03eD/mFq
 UC0nCI8JWJJW1u8oZ8NL7087n8nHX1EaVH3j4QNtVEyepT3Dfmp5utRG61ibPMp/4rPWEdfXwWN
 P+EgnyY1S6xh7IHr11z0dLOUkVIAU/JUUqieJ52N7WGs5Fd1rIZLAFcEK2N6SuxOdzhFXLR8BxK
 rQUP9oMcG00DKg0tt+JVCIfQVUh51MrUP5N1u4evg61EGp4TU/VzFCXRuTLdfNH+TkLTJsStUAr
 cTJ/CWMK4CzRNJ/cZq9XL1py9k3rZSke5LzCW6PuEpUYwRXdQPxYy89bgf3KmBw1EtLKcvitBAp
 jYazRuRx52+mDVrPgU/X6r+nOIENrH1qGHjpSnQDJ7cy4pKCWi2xo8I4SJvtDmOBgbEnuHP3bwF
 p2cWxRNwkqQ7YmmYp7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfXz376ILoWv5W1
 A+a+61NrZX5CeuAMkJ6WCJfkpv3TiwyOgKW3jb8KchiIsWECejIDuzFYuLqgpD4gdQNsz7Ugz9t
 WxRX9OkQkaPnkjyzR3BuMAdHgyhYsdo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290053

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

