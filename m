Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714529;
	b=YMZHaAspGEkPMZawY4TLmYWFLQc4tuX655EuVp9l82vjaTiR+o21qp3bGwg8R3QDHfga
	 UKMRC40uhAWdsm6xBbJValotUwlmeHilN1f6M+q2iHQmvg27r/v9qIyccLz4qvnBiZx46
	 +ti81fVUMkDkTkvK0aQSx3JNQAqt1rb+BQ2tPkt04KRaBUl6qXunbJopIvSuypT5kzPLQ
	 wt8G9IR0M2doY3sXeu4FD7O2jz1NEq3avGAFwEtayRZXepHoUyKT5Jet/K8lDHO7FrJic
	 PAHZGY2yezJ3LQBsbOpfoQIldAOsg5AwdVzKn2Kmc1Nsa+kUmLV4TtsAqoIob4Hmcag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ET+B6ryXZSjsDmJogt9NhGamDLd5Mr29EJGHgALtRKA=;
	b=uh4DikRNQCfK4tRa8JuTv7FeCnmYQ5JEKoAtDENNs/JSF/F2xgzdsXTRxBWH3duJFxrM
	 T4opf/2f1Ryvz9CN9JhkcUWju/RH3qeY0x+HEfwJ6Vzx7jAEJtScjb/5J03iqOCbJQNRH
	 RVmY93HbB+hHGr30gQOGsmSmgEWRlqVcqNe8vbW2P0J7rJnMRp1qUQR1u2GWqJWCRv4fZ
	 O6yJPOgtOHJA94vipQDZhwzeaxnhB3Ra6PkRhdUrF2JoaHndFuD36CAo0MQDCUTuNHTlM
	 ZRXfxCNnWAGxYKBNIROh/BdS7lEFZn1pV1EHIjN6RqoAV/ZcFCOzMZguzT3Vq3W9RCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSaVoowX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GjvDQYdU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88797606D809
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 14:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88797606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSaVoowX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GjvDQYdU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZHAC3581555
	for <linux-kselftest@vger.kernel.org>; Tue, 3 Nov 2026 14:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ET+B6ryXZSjsDmJogt9NhGamDLd5Mr29EJGHgALtRKA=; b=jSaVoowXxs9DoOm4
	+Nk7j53T/b/1qZSTZnDZiHyopZfm33nSdPEIfR2uiXoT0ajmtzZRsWyXFM8p7MMx
	JBq96hMQjZY3304YncA1fH4Ax2DKmmzkDHZBPOsXfFjIx8A1SFpx+u+v5Yg63JFv
	3VDLXQGsPYMMYQ1qqcoC72hCsM1L019JYU405zv1t2j+qbRmqQVpmCQh1Hxo2YUV
	ynD2af9y4Ds9LWLMLEWdPQc4lBL/MgJmO/gqKGWyqcJLsxobCrtlyuZ00Vkt8uOG
	d/M5+Y9ds4bHFflBVTcII24euNGwfTk4o2X4EIt+bdq+rZWy9e4nhVwnQbsM+5Np
	ylwc0w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94ct1j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 14:02:07 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ec17386b57so3473743e0c.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 06:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714526; x=1794319326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ET+B6ryXZSjsDmJogt9NhGamDLd5Mr29EJGHgALtRKA=;
        b=GjvDQYdUSktmQLvp4QoLBAMK7Jg1DjX3dF7gwKEJv77izDEufZSmKOOfum0CypWa+U
         h2Q3aINZxpBBJfwQn+B3cQERPc1Q2tT+I7pAdAdtt+Md99fk2pT3IVK/HEpaBmltatEL
         +OQkWQS6YV6rIV6PbBtPWzdQE+VAj8oirMjaQlrTHtHPet9IItRhwNeOyY2NaI0ZJuf3
         rqlYa6GaYEhlySZVqW2nPhsnvPHQnLZoUgFuRcPeMs2mJXGsd/ZDgS+19zZrnhQ+242C
         AnlPPiDnY0aqLwB4jtoMHRuvp6m67eYFBtO4FzSaQ1yXldxB++HqmBlEPu1WhCUcVAdr
         0hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714526; x=1794319326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ET+B6ryXZSjsDmJogt9NhGamDLd5Mr29EJGHgALtRKA=;
        b=2TT9CXfYTsvhIisb6jBMKe2sdCQCyJh8kVrKpsa7AI93+19PHBNxB2gWhROhOP1VCz
         WILHi97oX3vX0IjiI+3UQkBlrhQAn09NPXRn4CvsPwICbpcoKa/3PIDSJaRRYwe+IcK3
         kWzXmV0PTKFIHrw91MFIQ/t9yOU15MbmNk6dS71mnyxz9izXheRHsxwc1AdSat01EHE/
         wfXHx5muUR5nUyoWN+coLxq+aF4OgfaqjA/lIq98XgyYA1oZDfo7bDS/Xj1g29uJssNZ
         oP6hMjrPOwynjC38QSxvq+kgsW5vIBw1+vhu3hqWoWaWOjAL47pUhHPsiAa0vlQ3o+V+
         zwxQ==
X-Forwarded-Encrypted: i=1; AKwUvBx88E1sdw1cK7OTeTljixcLSMjQQKsYtGrr5j7r7LHUudsZx0z4nGsPAFvFciYmq+uxxo6B7x2E/R3zDr48Isw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rgt78oz00P9fkRKj4UfcK8SzY4FlwqPq9eX7RTFWu/fq6Rj+4
	5aCIywkhvBAIwx7G727B8n+V1hjpFVlZRZv5BtP1vXoPrHUQb6FpFTWHTj8nHoE7Rgy8ukyXXth
	O4cyNyw/JDTvtWnoUeKbPgzPJ2FLipNR6su5BZJQmOlcSzaLctXWAocdW0eIkOp2mASqFgbQ=
X-Gm-Gg: AYBFou2SrX1M64I6x8QlLOvmQTpOIMOiqsDhnZGUxT/VFOhug7x2ZHKfXXYTiTcBKwe
	0S6hM5pUc9F84M8eSJI8fU1WEZwAGTuBqckVCNt+LvXI/ykkoPVQWex5Et6xSvEfdVAGe0gaQIQ
	g0HE4//wA33oJrIBHOrE0CJYmcLOR3h0UVkETb9fW2YA1EfA6Et3UVW4rfhzo3M0VvGtdZYCyZV
	LlHon4euQ4X9gG2+v5RMhaT+UpThDJ9+yZcYpOflzqTn5/LymvKN/0/BMbI+NGix5IkrW3YF8O4
	1hp6KOiLSsD6chksQMDssH3+kZ+M6U4VpSAPLGZw1anloo3XgHBN++VIFq3Nsz97A5fEOqhB30k
	X/Erpaj5NTRc3rCwT5H+CpDRHl6JqCFryT9S+IyJVi48Cxmld2LLhc+E6d8/DcYE=
X-Received: by 2002:a05:6122:4892:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5ec6851cd6cmr5730013e0c.2.1793714525428;
        Tue, 03 Nov 2026 06:02:05 -0800 (PST)
X-Received: by 2002:a05:6122:4892:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5ec6851cd6cmr5724949e0c.2.1793714478743;
        Tue, 03 Nov 2026 06:01:18 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm25057443f8f.36.2026.11.03.06.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:01:17 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:00:45 +0100
Subject: [PATCH nf-next v3 4/8] net: netfilter: nf_flow_table: use tunnel
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
Message-Id: <20261103-flowtable-sw-accel-ip6ip-sit-v3-4-60b5f063f1df@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9e95f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BwFUO5JFP4DfzLIXruUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 1f_bB3H6wYhfEg5GnNJIbNovfGskoAX3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfXwhwSE6/hWjmt
 kRSAsYgDflYLgNYt9Sbd/2j893CXwqJUJZSX03cspdm+H7PZ+Ob/7GiuLJzVondoU7qH5j41Mcz
 +nFlxlI6kOjtX0fwWV9733ekDEM7S7KSq7Sr+zv29TZPFQAOOyJWNV33//zbdQ6Z8BRvyPGFB5Z
 5taoSYrw5VwHZKIwFfXWxq4EpgNwis2nguLJbv6I15cdMq0mUAY0UQThQQ+M0WyuMA18kDefH6M
 IknzN+eWN+KNT8aM1mIP2/MA69Er0scfERt/0zKcc+946BThYea8D2I+le2qIGz6F2us2hirqVj
 5ILhsj197+aeaaxJ0KC+1DFSDK39vRte1Za3f1J2A0dwWubBpof6ZEs+vE314Bz9h3KVBOO7Vq1
 NgCnNl9bGm6EqRCQlW9Hx+nHGOd3q9v9jLf3mZ86LZbRcOC4cVvvRt0LVBbteA4joQlki0uBWAl
 t+RWFLCUdOSXq51Yyvw==
X-Proofpoint-GUID: 1f_bB3H6wYhfEg5GnNJIbNovfGskoAX3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX/TY4eMp9Tbo8
 AY8QGkKvgSiO/YN8ZKpPbIzlgXdSgHnx2bN/AXLUf9hzA1XOUbzFfFfBGi2BTezaQ4QeAM7I/lG
 nsl5AztUj72AgOFIaD79o7885X/qPmI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030055

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

