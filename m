Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714497;
	b=m7ilPo1xWVrJrc8upu3YWysdJenARhK+VcpJJM2dlQnVjjwmqhgbOFc4KsRRjoiMCV91
	 asQVqqxQYSAHAm1Qi9D3+NCW5NAQHwHe+sFuS5c00EtoBLwPfa+olFylT/zL852GZcbeM
	 HWIg0qk2binfEj0ZfA8Bf98zWEFdxk5fOTQ5X6Nv/B+lfIRkdFaQbAvhdrGLT/5EHQx3y
	 xCLb/kRoLnXJPujlhkSVBNRrg0Sp/JviAYHSikP9yq8ViBKFAeeeyP5YFEMWbMZfk5+z1
	 aLh0mb8hXD9DhrhLJipTSEWY+OLo1atCnsfVZmqi8QSNXnWPdiz3Rm9yXMeLdjstLLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+v1lyr0F+NYxmmWfY7nRdeG/btbkNPCYzNKZ7ztJWmk=;
	b=VV1M+RvkTp4aq16Yy26zNFrMK4BqGtDmF0HIfpv6FZ4i9GyfGlA31xbCtBJhby29sMTq
	 pRryjdPdQWnWKRAFtvK7GZ+qOWNYxkjwJbjXoUiMzC1XoTSFysqFYz8jmmNwl729u8Tp7
	 fF6aZ7Z6gEcMLwJk82Pr8v2krQyuds7xJafSTIyZ1cgvm5gytfnR1hnPHmVLP+g7qV2gC
	 2/mh0iau2Yi51PmSGgdN4cmUzZl11iNLYBI/5a8rmy71anAhBlH4KjNhB+PeCz9TnUSgt
	 HZgEz1gzlIye910EeqTrERxgYS7q48qaPdSFcnttDGE/f1VVJ3x2HPIlAuyJf/M+zIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JKLbGSvX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAs9G8lJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956DE6085088
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 14:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 956DE6085088
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JKLbGSvX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAs9G8lJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZAhY1376966
	for <linux-kselftest@vger.kernel.org>; Tue, 3 Nov 2026 14:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+v1lyr0F+NYxmmWfY7nRdeG/btbkNPCYzNKZ7ztJWmk=; b=JKLbGSvXuh48q1AH
	hpJqirVnyJ7WB7cuxGoyNyKvbx53Semif+UU4uwxR60xOWYsPoZNJBR+3ZGFhINE
	VxScuoc0cyUJWVJCIYz7lM4RcGJYeE61q/JQvt04EBHZKIVVZtc/GOOdD1IpIT+Q
	Ke+5TUD8w5F913YrU2kETnR9BfKVXLMODrgG74SZiQ3xySovWZw+oOMWtH6p5Nv7
	5j90OBPUeC8OKfCNOVxNdZ6QcfHlgeKI3B4zscxFJI05j4P/4uwno+FumydsffP9
	pQpfiv3Mig2pehcOhJYg7P57v49lnQ0W6uKLTYw+B6ypOP3fOlKkvY+hoD6zncHs
	R1DXtQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07em1yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 14:01:35 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806756ea40so3643723241.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 06:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714494; x=1794319294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v1lyr0F+NYxmmWfY7nRdeG/btbkNPCYzNKZ7ztJWmk=;
        b=cAs9G8lJVVh3TF4+q/MotTpcZxqMHBep4dXVi9ycKV0tC7buabF0MGezgWHOP2YLSg
         Wwm0/7L4wS/nPPGfTzVN08Fw5D55tkcLctz7tOoi2A8ky9qaYohs0+X4nYAizEVriIZv
         Q6/4o7eBH9CD/OmZUIHao4sO7vtKvTsEpIl7pIaXIf3l125jDC9FMGd9KLUooixMATKQ
         JSVJR/SMjXUhxdIeIbmqG7Aw8x9BM4RUr7bBgBwdfj1a0dOyTb4oVmKlJSJ9mnrYn21m
         kcAflj9Huj30ewMIAK2f82H7Ahl6fZS+VvF5SQxXTcnvywYHH1cWnCed0BO4Nh36COIn
         j5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714494; x=1794319294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+v1lyr0F+NYxmmWfY7nRdeG/btbkNPCYzNKZ7ztJWmk=;
        b=DFoeN9B9+QDNDWOTHa1TBBIw9N/WmrivfyOCuBIQBBXbEqueoIZDzYi/b0AQWnv1IE
         PPbeO6nyWBktyop+tmXiKV+Hbrpn9GE9BbaCO8E6LNKne86dTTr/imLZrweap42VFTEt
         t57KA/9KmtFxZQ6LSoHRHCLz+Ju4DvOih7zzkaO3GjQTLo+fwBDE8T+b+7VQKPLFBxSl
         N6WsF86ax9ErFfSfDpO9FYdh4LXm3zP+Kp7sv80DaeCTvjMdmECz+mTE0oaxIVXQxrPg
         qoi1ex9tN00Z2zlPR6+MxG9zeXbtwrQ22uuRBsaKG4J1eyVD5njK7Hl9EoqciDFISb5l
         zoYw==
X-Forwarded-Encrypted: i=1; AKwUvBzwU6NutrwB0JSA1kCzj9HhIkFJ3FiSbndT/h+9EhTyOd4CssWOwLzjSpRWZ1NbfSjO/uZUmoFXHJl7N6RC/Ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sh95PxWwfjvFD/lYiDdtn7ZFFUdqbGq48EtVBelSLrxpLGfH1
	sKW0LkZunCNbAwD62/SnyqLwxRRAdeykflz6oKjUfWQXsLW9grfHM30sEkEnCeKh2+mUvn2PMq/
	Da8DK8t0maXcziWIj4VyMIvYs7/rsYlWQ3plhJO8dS/Iwg5ccduGD9YxnSqcORlWDp9HTu8Q=
X-Gm-Gg: AYBFou2I6T+kONaEyuDk6ECroUHCLpt4lT7XbVPEcPEybJc5Qk4akGEqsmz6qm8ucBD
	Pn0OrSfrX8YzYcZDTcYqqx1xtks9wBm0nhW1C+9MQ8kII34+AP7723ZC20EqfZ/uAaD7e1qgKo4
	YJ8QpZorgjZ8/1wA2bl8S8HBK72i3dBKlHbqAwPhrY0hGGdf2/CQpZfO9UwyxMKE28EfqV0zqwu
	wNPxZ6iGyJa0WtqHZLmolalADqxhUf2o1minGui/uq1psiNQHY0snWDJhpS8QUd6tD3aAyTDhCI
	UHZAEjEe9voYaWq1gQvUXeDR8+b9vnhwo9NWZZBTLAyJN5kK3tzxg70yIKjNXmzBWne4h/c1Ziw
	Ghy+SJ0s+I/5RUkDXhKAwAz3YGqaGOZnM8QtiMfmvigsNteSz2W4M5xc+4h+3Byc=
X-Received: by 2002:a05:6122:469b:b0:5ea:b972:1403 with SMTP id 71dfb90a1353d-5ec68539420mr5363896e0c.3.1793714492802;
        Tue, 03 Nov 2026 06:01:32 -0800 (PST)
X-Received: by 2002:a05:6122:469b:b0:5ea:b972:1403 with SMTP id 71dfb90a1353d-5ec68539420mr5363558e0c.3.1793714491115;
        Tue, 03 Nov 2026 06:01:31 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7700c3bsm305140525e9.0.2026.11.03.06.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:01:29 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:00:48 +0100
Subject: [PATCH nf-next v3 7/8] net: netfilter: add SIT tunnel flowtable
 acceleration
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
Message-Id: <20261103-flowtable-sw-accel-ip6ip-sit-v3-7-60b5f063f1df@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfXyOZXIwn/Y33G
 W/nIyqBruSRec1BRRckHPMPSrSh6Kncc+LppQlTS9Ll8JPsuIGZzJW2mjfES8i0T8GFOqTYkQXJ
 pyHsuXic2sirvvherJ919XfEy0qtjI1X9Ijf+aWJWG1sWLar/vyfP69VNM9Xg2QlE1NZvoXRN6B
 eKNC6HRJvsVUAdx2vV/y3BIkVTwiYwX6jaOX0WDYo3ygQ6ksz2Puy2Pd6pO6wz6+506LtCsimPO
 ryFGc7XDhdA1SsQH2GSBQGNcVLJpGQXhnru4msI6q3wSFbTVribmwl8K6k+3swG4nQyXA/88/SK
 CHenALOMhtU5vOwXsHNrv6Ae5/Cs6wR7y3eVq8stgplC1k7879N0NrcG8p0UQLXqMRobXI2S1ya
 qRmSzr3IkDF+NvfFWoAI5BNi/D9FBam31OwWO1gUKUbIlM5zvKAJbBHb+JvMv3l6yUeFsXc8O1X
 nwk5RP5srleBqmtimzw==
X-Proofpoint-ORIG-GUID: fb6Sf_zh4kj8zo5fciQG9vhv3t_2F2iT
X-Proofpoint-GUID: fb6Sf_zh4kj8zo5fciQG9vhv3t_2F2iT
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9e93f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zZ2q_vh7tRSsUQjCfn8A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX7LgyD1ntuo9M
 gHwCsT5uj8IBbPcF9k2p9GxZDFywlFjx5hyE6W0cKVjJ0BBby2WFYXjbuo5VTCYULgL8f4jiigT
 FxElNQoF6ePWNSUrcr/Hf4K91JmtY7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030055

Introduce sw flowtable acceleration for the TX/RX paths of
SIT tunnels, relying on the netfilter flowtable infrastructure.

Only plain SIT tunnels are offloaded: NBMA tunnels (ISATAP, 6to4, 6rd),
FOU/GUE encapsulation, inherited TOS, and packets whose inner protocol
does not match the configured SIT mode are rejected.  Tunnel parameters
are read from the RCU-protected snapshot and the outer route is resolved
in the tunnel netns using its fwmark, mirroring the slow path.

The feature can be tested with a forwarding scenario between two
NICs (eth0 and eth1), where a SIT tunnel is used to reach a remote
site via eth1 as the underlay device:

    ETH0 -- TUN0 <==> ETH1 -- [IP network] -- TUN1 (192.168.2.2)

[IP configuration]

6: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 00:00:22:33:11:55 brd ff:ff:ff:ff:ff:ff
    inet6 2001:db8:1::2/64 scope global nodad
       valid_lft forever preferred_lft forever
7: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 00:11:22:33:11:55 brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.1/24 scope global eth1
       valid_lft forever preferred_lft forever
8: tun0@NONE: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1480 qdisc noqueue state UNKNOWN group default qlen 1000
    link/sit 192.168.2.1 peer 192.168.2.2
    inet6 2001:db8:200::1/64 scope global nodad
       valid_lft forever preferred_lft forever

$ ip route show
192.168.2.0/24 dev eth1 proto kernel scope link src 192.168.2.1

$ ip -6 route show
2001:db8:1::/64 dev eth0 proto kernel metric 256 pref medium
2001:db8:200::/64 dev tun0 proto kernel metric 256 pref medium
default via 2001:db8:200::2 dev tun0 metric 1024 pref medium

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

- TCP stream received from SIT tunnel:
  - net-next (baseline):                ~118 Gbps
  - net-next + SIT flowtable support: ~148 Gbps

- TCP stream transmitted to SIT tunnel:
  - net-next (baseline):                ~131 Gbps
  - net-next + SIT flowtable support: ~147 Gbps

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 net/ipv6/sit.c                   | 72 ++++++++++++++++++++++++++++++++++++++++
 net/netfilter/nf_flow_table_ip.c | 22 ++++++++++--
 2 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/sit.c b/net/ipv6/sit.c
index a7ec800216ad..9e6ef3b72cfc 100644
--- a/net/ipv6/sit.c
+++ b/net/ipv6/sit.c
@@ -1483,6 +1483,77 @@ ipip6_tunnel_ctl(struct net_device *dev, struct ip_tunnel_parm_kern *p,
 	}
 }
 
+static int ipip6_tunnel_fill_forward_path(struct net_device_path_ctx *ctx,
+					  struct net_device_path *path)
+{
+	struct ip_tunnel *tunnel = netdev_priv(ctx->dev);
+	const struct ip_tunnel_parm_kern *parms;
+	const struct iphdr *tiph;
+	struct flowi4 fl4;
+	struct rtable *rt;
+
+	/* NBMA tunnels (ISATAP, 6to4, 6rd) resolve the outer destination
+	 * per-packet from the inner IPv6 address; not offloadable.
+	 */
+	if (ctx->dev->priv_flags & IFF_ISATAP)
+		return -EOPNOTSUPP;
+
+	parms = rcu_dereference(tunnel->sit_parms);
+	tiph = &parms->iph;
+	if (!tiph->daddr)
+		return -EOPNOTSUPP;
+
+	if (tiph->tos & 0x1)
+		return -EOPNOTSUPP;
+
+	/* FOU/GUE encapsulation is handled in the slow path by
+	 * ip_tunnel_encap(); the fast path only pushes a plain
+	 * IPv4 header and would skip the UDP encapsulation.
+	 */
+	if (READ_ONCE(tunnel->encap.type) != TUNNEL_ENCAP_NONE)
+		return -EOPNOTSUPP;
+
+	switch (ctx->ether_type) {
+	case cpu_to_be16(ETH_P_IP):
+		path->tun.inner_proto = IPPROTO_IPIP;
+		break;
+	case cpu_to_be16(ETH_P_IPV6):
+		path->tun.inner_proto = IPPROTO_IPV6;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	if (parms->iph.protocol &&
+	    parms->iph.protocol != path->tun.inner_proto)
+		return -EOPNOTSUPP;
+
+	flowi4_init_output(&fl4, parms->link, READ_ONCE(tunnel->fwmark),
+			   tiph->tos & INET_DSCP_MASK, RT_SCOPE_UNIVERSE,
+			   path->tun.inner_proto, 0, tiph->daddr,
+			   tiph->saddr, 0, 0,
+			   sock_net_uid(tunnel->net, NULL));
+	rt = ip_route_output_key(tunnel->net, &fl4);
+	if (IS_ERR(rt))
+		return PTR_ERR(rt);
+
+	if (dst_xfrm(&rt->dst)) {
+		ip_rt_put(rt);
+		return -EOPNOTSUPP;
+	}
+
+	path->type = DEV_PATH_TUN;
+	path->tun.src_v4.s_addr = fl4.saddr;
+	path->tun.dst_v4.s_addr = tiph->daddr;
+	path->tun.encap_proto = AF_INET;
+	path->dev = ctx->dev;
+	path->tun.dst = &rt->dst;
+
+	ctx->dev = rt->dst.dev;
+
+	return 0;
+}
+
 static int
 ipip6_tunnel_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
 			    void __user *data, int cmd)
@@ -1533,6 +1604,7 @@ static const struct net_device_ops ipip6_netdev_ops = {
 	.ndo_siocdevprivate = ipip6_tunnel_siocdevprivate,
 	.ndo_get_iflink = ipip6_get_iflink,
 	.ndo_tunnel_ctl = ipip6_tunnel_ctl,
+	.ndo_fill_forward_path = ipip6_tunnel_fill_forward_path,
 };
 
 static void ipip6_dev_free(struct net_device *dev)
diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index ea2cd9df33f8..3a7c5318ed15 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -158,6 +158,16 @@ struct nf_flowtable_ctx {
 	} tun;
 };
 
+static int nf_flow_tuple_ipv6(struct nf_flowtable_ctx *ctx,
+			      struct sk_buff *skb,
+			      struct flow_offload_tuple *tuple);
+
+static int
+nf_flow_offload_ipv6_forward(struct nf_flowtable_ctx *ctx,
+			     struct nf_flowtable *flow_table,
+			     struct flow_offload_tuple_rhash *tuplehash,
+			     struct sk_buff *skb);
+
 static void nf_flow_tuple_encap(struct nf_flowtable_ctx *ctx,
 				struct sk_buff *skb,
 				struct flow_offload_tuple *tuple)
@@ -466,8 +476,12 @@ nf_flow_offload_lookup(struct nf_flowtable_ctx *ctx,
 {
 	struct flow_offload_tuple tuple = {};
 
-	if (nf_flow_tuple_ip(ctx, skb, &tuple) < 0)
+	if (ctx->tun.inner_proto == IPPROTO_IPV6) {
+		if (nf_flow_tuple_ipv6(ctx, skb, &tuple) < 0)
+			return NULL;
+	} else if (nf_flow_tuple_ip(ctx, skb, &tuple) < 0) {
 		return NULL;
+	}
 
 	return flow_offload_lookup(flow_table, &tuple);
 }
@@ -969,7 +983,11 @@ nf_flow_offload_ip_hook(void *priv, struct sk_buff *skb,
 	if (!tuplehash)
 		return NF_ACCEPT;
 
-	ret = nf_flow_offload_forward(&ctx, flow_table, tuplehash, skb);
+	if (ctx.tun.inner_proto == IPPROTO_IPV6)
+		ret = nf_flow_offload_ipv6_forward(&ctx, flow_table, tuplehash,
+						   skb);
+	else
+		ret = nf_flow_offload_forward(&ctx, flow_table, tuplehash, skb);
 	if (ret < 0)
 		return NF_DROP;
 	else if (ret == 0)

-- 
2.56.0

