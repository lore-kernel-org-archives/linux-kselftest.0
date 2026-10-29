Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280948;
	b=MkwlZEK/qgbQTuWcT5RKHlaFj9ZWVF3wGT2voqYABc5wYgBMOHYLpVWY2Z0WOPWQOuWk
	 bdt8yjFAlZdFzkBM4JD/4UsNAsbFwYIOCyfAotXombcDqZRLE6vMOjFVXE0nSNIBrwq1k
	 GN63rndCCRya4YRnENRV/HeqKC/r0SZmWcxWoyDGefRIbycFdRti7jGx0x33rJiWKaYvW
	 LbFWi0z2f8ewwDvl75LqE/0j89C08gsFSujYO2vhgzd6/4hjQqzm85ImBmAyWMiK1htx1
	 8tlMgmy30V4B3Seod1BMUEKkZnPyBlq1p8ZySqY5+rTAOyh7eSmtdAVS2jxr7uV4aiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280948;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uJYlsQbb2pW/L7PXjRP1QZZZc3eeLY6/o8bsnwuZ/I8=;
	b=xiVM/HWNFqCN2DZOtm069rIfVuFdU+qBBWam1lNJBsfxy/4T/b9Pe333iHM8LE91sJUp
	 hEPwNfQrSkZ8AalORtg5sBwyuzo9kxXhc77sSPLQODpGP6/6jZ02AgSS6p5MJoiXNI4Bx
	 ftCNXlJQOinULuIH2+GSyfBKo5X+rXYVQ33/IjmdXd7MqyBcizKPguUj0/qKUgh0Kld9Y
	 uDsd0hBwghu+tIkKJEoV/Ioxq4MjgmOfMh+R7e5BoELu3fA7T+oRg60jalwjD9vXXA9d+
	 QUst6IqqDk0eli+eqzbDKa7ehxwi7O/Z8wedzpu1w7Oew2Swqzbd6OAVMjnzeHVBwRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVst6O98;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BGRxP+ZJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E1160A261F
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86E1160A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVst6O98;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BGRxP+ZJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCeHHH2761919
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJYlsQbb2pW/L7PXjRP1QZZZc3eeLY6/o8bsnwuZ/I8=; b=MVst6O98CPCoZfzl
	aTMCEd9Zo7hQKuYl6dx38nMQDLeOr7WNMQ3rV7VgO7kPihPRxVjfNYTEFB2rGoR5
	l3hcuW4RjNRM7aPd6udNq1U1dmxVr07Rjpn/8LdNirkCWGljCVBYaktl8lu855qV
	kDZ/rbDc0WA1ki+jcFuzWYfFOshsoimikI1Tu+JI2L3dJBX0oO0cB7UxL8ho+7aM
	9dvrdMJUsvd/rppy8QBSx6F/JQJOAPjKKcH3YEFW8lIhZtf7INdwJOypHqOohOnS
	Pto5vvc2uQm8yDlpNn625V0b4fvydEItnuLO9MhC9fCUEnPU0gon9SYXY60kvR3+
	eKGZJw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b10s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-990634bef80so493317241.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793280945; x=1793885745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJYlsQbb2pW/L7PXjRP1QZZZc3eeLY6/o8bsnwuZ/I8=;
        b=BGRxP+ZJi7WdBF0+Xo7ZcGPEuQo7R2gagr7qHYhVYWdV5ivXXNIlUWvoSmEjgI0LJg
         t76Qn/+MTbTYobbDrwXVvxOoTb0wpeTlPyz3Hu1fVbVloIqeLxUenwftUvsXSwhTZZWJ
         5GN/ApLkoz/ilI7l7hh2bJDRq2fPIf2K6WJ2n5Mxx+rg1MrYZa6kdz+2FLwZDbRpTLac
         2I7DGgIY5nrGb+iOoIdrZ3+0mO3vAvtA4/vwGq2aA0/YY8XO01DgIQS0t0FgIp56DQQV
         AavMjyIkgjkHPBb9m5I4dcF54RP43C7KHt4w1gu1OEJunjIR2SflnVQB0oXZVPwbbJMO
         0iEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280945; x=1793885745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJYlsQbb2pW/L7PXjRP1QZZZc3eeLY6/o8bsnwuZ/I8=;
        b=BXjERtKk8w7KbYTPryFf5YmJd3pqIaQiAsxBot5gvupXmYPQKspHUnScO2t+w8Tntj
         BTTDpHHTmyfCXll2Y52TS6H44b/7n/luoxpE7d0zEXJTs+0uy8fLZuWNgqJL0GtE/cOK
         0WHMswc1h8XSo5EYvbw24Qt2L7nNJl+MIOpN4KZrqek8DbgVveh09xv74BA/W2GUfY6y
         SrD+XZxY3L5PMNPXsdM0xEFIQwkweiIQvkMyP0YW/m+VXqNHSHQ1BN9gA8nP9LoRlhPg
         a49LE3sqCJ2eUcDS0xUDPbXPo/xaA32Wh1fb07+jS1y6ROdqiKdJlxmPyzsmvJO3UpHk
         E2BA==
X-Forwarded-Encrypted: i=1; AKwUvBy9bA7DRTyCdbqnAvdtat6XXHBnZLeGFvtPrAv3E5nOSerYDdFmUU9NG/MBCd2XD3KYomrZoPao+30I+MwC0ks=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0cM8kpUCQLKw+zAXI5Q9+f05HpOJX11syucZNEE0AfVkIZqXf
	QN+AvhDFXfIYdQimIgapFIKLQ0LqHzgI0uuI1Bi28CBnlykRkzDz0oo4yZBM4Te4X1PB3gdBN1M
	WJ7bjpSjMmUDP8FUxiEt9PoY7qj4bR93ee/1/hbVwSzQJn6OXpjMktP5DAPtwD2Qq3TqEu3g=
X-Gm-Gg: AYBFou0/U5eXI3PzEtUaHn8ksm/vGqGKWrTsCsZaawGnx0dkWgqJ0XCBmlfruQBsdQK
	oChIsOcTpPP8V4Vw+9qfzqQLhj7WxS6odVxmeCq90qp+eyCeveBznpyQt9na3wSBfC/DS6fZxwk
	DLyi2VzKBHmdhY9S5Ssbbw8lbltFK26H5r3UBDOGsOL1CB5TGgxmYgb+9+sjbd6JYBQ+Dq3O1Ek
	T0SE3/9hTCgWRfHKz+VZZisHD/HOyh+USgD4PEE9XUza10P5ImyEn/1JbZuXtkYGtiiukql04jF
	XMz1K6G0kVMl1+YDmuu7Df75iuoATIA2czO1mDq49SLUMKxk/gxR9EELI9bjJKOiv8GQr50cWss
	ZSIqNsF5XU3U1+YvFgxAtJzn5CeRXz2/qbsmS+mV3mOdhhJH6fic9T9Xq6QttqLTK8QSO5ggeLR
	8U5opF8aAhCplEpWTKrd6tMw==
X-Received: by 2002:a67:e112:0:b0:7ce:78f9:adf2 with SMTP id ada2fe7eead31-7d03a4be14amr2142909137.9.1793280945333;
        Thu, 29 Oct 2026 06:35:45 -0700 (PDT)
X-Received: by 2002:a67:e112:0:b0:7ce:78f9:adf2 with SMTP id ada2fe7eead31-7d03a4be14amr2142902137.9.1793280944749;
        Thu, 29 Oct 2026 06:35:44 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e64ccc693sm5209582f8f.5.2026.10.29.06.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:35:43 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:35:16 +0100
Subject: [PATCH nf-next 5/8] net: netfilter: add IPv4 over IPv6 tunnel
 flowtable acceleration
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
Message-Id: <20261029-flowtable-sw-accel-ip6ip-sit-v1-5-6a17c54f9fb7@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX8X/9EKJ/9L9+
 OZrN6nabRf3SHBTBSQs1/VnmTU2H2nrg+OMX8W5vFpJqOMU/LeIDXl0DAB3WyiYrno7HRh8w+2z
 r5brO0w42vofGePaPjmI0RryQgbaPAc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX6Pkox++2lTqL
 eoIogfWHGCYnPyE/hxM3bUcrXiWwirGoCckaYUQoqcsluq0WSCP1PVlqmnsWE5RtruhWJLczoNV
 jYC6T+zR9Gim6Z3WYfB/Mi35byEHabwCTQeYl+LC7onehFDneInA2Hs9k5p43xX5jjVmOo03GLF
 HRgOYD7ZGOH2iIazmTDv4lnLaooqaGN1sWNMjVrSs/COV4uH0lVWKH7TUWOswgNzD7ceu/9Y8Hg
 rG7Pu81qa21kzfwP08x8dEUWCsUV4ZpYRbzmk/ilPOPUQWajM7i+ErFlXaSrsgmgxlYkQBA6Loa
 fQMSVdWQ5nkHKECKs95lOyx85afyGcfmtZ6iwvWAAxsQ5WG6F9fQDW1BCORoSjUXfoI/abUO2Kq
 0bvBCMRvClJT/nwLBGrXqTvkqJEPxROwsOylMwOHZnIwIcCFKS8i4JjoxZ1PRvAC7cWxaMZU8zr
 0meo4EVFMXVPVvl31nQ==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae34bb2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Q9s6MkQQiHVZyQ02r30A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: IXLKB_x-y--wafQJ_5B-I8WV7gjbGyS-
X-Proofpoint-ORIG-GUID: IXLKB_x-y--wafQJ_5B-I8WV7gjbGyS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290053

Introduce sw flowtable acceleration for the TX/RX paths of
IPv4 over IPv6 tunnels, relying on the netfilter flowtable
infrastructure.
The feature can be tested with a forwarding scenario between two
NICs (eth0 and eth1), where an IPv4 over IPv6 tunnel is used to
reach a remote site via eth1 as the underlay device:

    ETH0 -- TUN0 <==> ETH1 -- [IP network] -- TUN1 (2001:db8:2::2)

[IP configuration]

6: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 00:00:22:33:11:55 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.2/24 scope global eth0
       valid_lft forever preferred_lft forever
7: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 00:11:22:33:11:55 brd ff:ff:ff:ff:ff:ff
    inet6 2001:db8:2::1/64 scope global nodad
       valid_lft forever preferred_lft forever
8: tun0@NONE: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1480 qdisc noqueue state UNKNOWN group default qlen 1000
    link/tunnel6 2001:db8:2::1 peer 2001:db8:2::2 permaddr ce9c:2940:7dcc::
    inet 192.168.100.1/24 scope global tun0
       valid_lft forever preferred_lft forever

$ ip route show
default via 192.168.100.2 dev tun0
192.168.0.0/24 dev eth0 proto kernel scope link src 192.168.0.2
192.168.100.0/24 dev tun0 proto kernel scope link src 192.168.100.1

$ ip -6 route show
2001:db8:2::/64 dev eth1 proto kernel metric 256 pref medium

$ nft list ruleset
table inet filter {
    flowtable ft {
        hook ingress priority filter
        devices = { eth0, eth1 }
    }

    chain forward {
        type filter hook forward priority filter; policy accept;
        meta l4proto { tcp, udp } flow add @ft
    }
}

When reproducing this scenario using veth interfaces, the following
results were observed:

- TCP stream received from IPv4 over IPv6 tunnel:
  - net-next (baseline):                ~126 Gbps
  - net-next + IP6IP flowtable support: ~138 Gbps

- TCP stream transmitted to IPv4 over IPv6 tunnel:
  - net-next (baseline):                ~127 Gbps
  - net-next + IP6IP flowtable support: ~140 Gbps

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 net/netfilter/nf_flow_table_ip.c | 66 ++++++++++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 12 deletions(-)

diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index 902b9b595677..0ffa6470c46d 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -856,7 +856,8 @@ static unsigned int nf_flow_queue_xmit(struct net *net, struct sk_buff *skb,
 	return NF_STOLEN;
 }
 
-static int nf_flow_queue_xmit4(struct sk_buff *skb,
+static int nf_flow_queue_xmit4(struct nf_flowtable_ctx *ctx,
+			       struct sk_buff *skb,
 			       struct flow_offload_tuple_rhash *tuplehash,
 			       const struct nf_hook_state *state)
 {
@@ -886,14 +887,29 @@ static int nf_flow_queue_xmit4(struct sk_buff *skb,
 		return NF_DROP;
 
 	switch (tuplehash->tuple.xmit_type) {
-	case FLOW_OFFLOAD_XMIT_NEIGH:
-		rt = dst_rtable(tuplehash->tuple.dst_cache);
+	case FLOW_OFFLOAD_XMIT_NEIGH: {
+		struct dst_entry *dst;
+
 		xmit.outdev = dev_get_by_index_rcu(state->net, tuplehash->tuple.ifidx);
 		if (!xmit.outdev) {
 			flow_offload_teardown(flow);
 			return NF_DROP;
 		}
-		neigh = ip_neigh_gw4(rt->dst.dev, rt_nexthop(rt, ip_addr->ip));
+		if (other_tuple->tun.encap_proto ?
+		    other_tuple->tun.encap_proto == AF_INET6 :
+		    ctx->tun.inner_proto == IPPROTO_IPV6) {
+			struct rt6_info *rt6;
+
+			rt6 = dst_rt6_info(tuplehash->tuple.dst_cache);
+			neigh = ip_neigh_gw6(rt6->dst.dev,
+					     rt6_nexthop(rt6, &ip_addr->in6));
+			dst = &rt6->dst;
+		} else {
+			rt = dst_rtable(tuplehash->tuple.dst_cache);
+			neigh = ip_neigh_gw4(rt->dst.dev,
+					     rt_nexthop(rt, ip_addr->ip));
+			dst = &rt->dst;
+		}
 		if (IS_ERR(neigh)) {
 			flow_offload_teardown(flow);
 			return NF_DROP;
@@ -902,6 +918,7 @@ static int nf_flow_queue_xmit4(struct sk_buff *skb,
 		skb_dst_drop(skb);
 		skb_dst_set_noref(skb, &rt->dst);
 		break;
+	}
 	case FLOW_OFFLOAD_XMIT_DIRECT:
 		xmit.outdev = dev_get_by_index_rcu(state->net, tuplehash->tuple.out.ifidx);
 		if (!xmit.outdev) {
@@ -948,7 +965,7 @@ nf_flow_offload_ip_hook(void *priv, struct sk_buff *skb,
 	else if (ret == 0)
 		return NF_ACCEPT;
 
-	return nf_flow_queue_xmit4(skb, tuplehash, state);
+	return nf_flow_queue_xmit4(&ctx, skb, tuplehash, state);
 }
 EXPORT_SYMBOL_GPL(nf_flow_offload_ip_hook);
 
@@ -1175,13 +1192,18 @@ nf_flow_offload_ipv6_lookup(struct nf_flowtable_ctx *ctx,
 {
 	struct flow_offload_tuple tuple = {};
 
-	if (nf_flow_tuple_ipv6(ctx, skb, &tuple) < 0)
+	if (ctx->tun.inner_proto == IPPROTO_IPIP) {
+		if (nf_flow_tuple_ip(ctx, skb, &tuple) < 0)
+			return NULL;
+	} else if (nf_flow_tuple_ipv6(ctx, skb, &tuple) < 0) {
 		return NULL;
+	}
 
 	return flow_offload_lookup(flow_table, &tuple);
 }
 
-static int nf_flow_queue_xmit6(struct sk_buff *skb,
+static int nf_flow_queue_xmit6(struct nf_flowtable_ctx *ctx,
+			       struct sk_buff *skb,
 			       struct flow_offload_tuple_rhash *tuplehash,
 			       const struct nf_hook_state *state)
 {
@@ -1211,14 +1233,29 @@ static int nf_flow_queue_xmit6(struct sk_buff *skb,
 		return NF_DROP;
 
 	switch (tuplehash->tuple.xmit_type) {
-	case FLOW_OFFLOAD_XMIT_NEIGH:
-		rt = dst_rt6_info(tuplehash->tuple.dst_cache);
+	case FLOW_OFFLOAD_XMIT_NEIGH: {
+		struct dst_entry *dst;
+
 		xmit.outdev = dev_get_by_index_rcu(state->net, tuplehash->tuple.ifidx);
 		if (!xmit.outdev) {
 			flow_offload_teardown(flow);
 			return NF_DROP;
 		}
-		neigh = ip_neigh_gw6(rt->dst.dev, rt6_nexthop(rt, &ip_addr->in6));
+		if (other_tuple->tun.encap_proto ?
+		    other_tuple->tun.encap_proto == AF_INET :
+		    ctx->tun.inner_proto == IPPROTO_IPIP) {
+			struct rtable *rt4;
+
+			rt4 = dst_rtable(tuplehash->tuple.dst_cache);
+			neigh = ip_neigh_gw4(rt4->dst.dev,
+					     rt_nexthop(rt4, ip_addr->ip));
+			dst = &rt4->dst;
+		} else {
+			rt = dst_rt6_info(tuplehash->tuple.dst_cache);
+			neigh = ip_neigh_gw6(rt->dst.dev,
+					     rt6_nexthop(rt, &ip_addr->in6));
+			dst = &rt->dst;
+		}
 		if (IS_ERR(neigh)) {
 			flow_offload_teardown(flow);
 			return NF_DROP;
@@ -1227,6 +1264,7 @@ static int nf_flow_queue_xmit6(struct sk_buff *skb,
 		skb_dst_drop(skb);
 		skb_dst_set_noref(skb, &rt->dst);
 		break;
+	}
 	case FLOW_OFFLOAD_XMIT_DIRECT:
 		xmit.outdev = dev_get_by_index_rcu(state->net, tuplehash->tuple.out.ifidx);
 		if (!xmit.outdev) {
@@ -1267,12 +1305,16 @@ nf_flow_offload_ipv6_hook(void *priv, struct sk_buff *skb,
 	if (!tuplehash)
 		return NF_ACCEPT;
 
-	ret = nf_flow_offload_ipv6_forward(&ctx, flow_table, tuplehash, skb);
+	if (ctx.tun.inner_proto == IPPROTO_IPIP)
+		ret = nf_flow_offload_forward(&ctx, flow_table, tuplehash, skb);
+	else
+		ret = nf_flow_offload_ipv6_forward(&ctx, flow_table, tuplehash,
+						   skb);
 	if (ret < 0)
 		return NF_DROP;
 	else if (ret == 0)
 		return NF_ACCEPT;
 
-	return nf_flow_queue_xmit6(skb, tuplehash, state);
+	return nf_flow_queue_xmit6(&ctx, skb, tuplehash, state);
 }
 EXPORT_SYMBOL_GPL(nf_flow_offload_ipv6_hook);

-- 
2.56.0

