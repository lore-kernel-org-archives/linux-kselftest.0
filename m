Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559746;
	b=HrbEez02Fef4RKsdgg7KeJZSo4i3urdjD7EKuTSdUIX7ROZeHCWfZ63RVhXhxGnWXcKt
	 pWC0nepkQXcjZEnrnWzUSClevkL+nV4s0rMWbzlPuHwJJ4VOi8GwlIMDTwrJ7nRzVxTmV
	 N3sb4A+9DqFNnILlHNLUpvzZHQ8P99bvEDYRfLACUZwowY2n9TBshVnu48M43oUgJcIFi
	 C0v1sohlwLFVsIhEo8Us4dGrGr5weUgPKr0ofin0ipoHL80sE+p3JfKGl3GWfoAT9uNfI
	 0NkAOTufVzPUM/bonrdhixowUKdoV8QTQXjZgTyc6qw+abPBYxsqqh2SSYjIfaBaJ0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3SXKAJvkWEfH8lskfIpG/LcDHtbUmYSyuBcyRooPK28=;
	b=FrWW7CY55JswRcy6frqsYzsw1uOS340v0O5ROwO2hnkPJoL+SiLr7XmSQcuZk6dLYh2k
	 FtiF3PWOmRAp2XpoJWK1eLzDvU8/npk5hKvDCROgU2Upg6WrTPuNAejKwTpjD5e3btgFl
	 KEc2jLwV1tDT0fwEYONPVgI1DSN0d7mGlDLy6GmRl0qp4KTkMqRNDlQwdC0A/Un9VC4Cx
	 hHOZlJCpAVBr7mfbw7iuUzh9kKFZPYyRXtdCGL66QaWha0B5nZMXeKmmeGtCamaHEBV20
	 Zafy5uqas+ppcHyML3MX+tt935mNqPPgs1+0VdpyqdEhNFPwPp7xKNHyL0oUL4WT2tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CXtmdTwF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRFlQLMM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C3606A325
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 19:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08C3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CXtmdTwF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRFlQLMM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HPtge2464045
	for <linux-kselftest@vger.kernel.org>; Sun, 1 Nov 2026 19:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SXKAJvkWEfH8lskfIpG/LcDHtbUmYSyuBcyRooPK28=; b=CXtmdTwFZqklS/tX
	wirZVFAPARgzifJofkDYUedIOturWsEqDZlqmJIXKpzpLk96l5JXRN2FJvCg0p7c
	twQ9OpISNkrEujeIfOA3lX1BQBzKvVo8oWUr4ddBOGPRSsL1zdhwahkgWcFSdImT
	Vtw/j32cl4FDQksEM1tn2VmU2eIY8rS7wzZzVXGcpNbr1qEtOxUtQlaCXxb2dmWg
	DQs93JiUubLNsoiAWJPuX0lTwKIY4gw+2y60nadaovaxmLye5KfAdIdPVid4ExSB
	zS0Tnz4tKSlrrkw/wawE6mQV4qM0w/fhDRS6XQlSByn4hiwIO3rMLwYqs/mWrrrZ
	GPfdYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rv4uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 19:02:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f322ef7d3so441261485a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 11:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793559744; x=1794164544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SXKAJvkWEfH8lskfIpG/LcDHtbUmYSyuBcyRooPK28=;
        b=MRFlQLMMyvIDHYsly6aA664dnSpyJyV1DjaGHWA82z+YZrNv24ocq74qu0yAnJ7Bcv
         YaDyVd6uaaqo3bNRpVGLvt5+enP19fqdoWS+/5RvsE+O63szetWlM13fbGNMz5IpVWdd
         tAeL02pginy8o2tF+XvItRy+S88/N0Csc9Ju2u7JfAcuOAIJjNEZL5K15H9y8rTu9W5+
         d6X2KkI1QunRFePsJMcOPdDru3FfskViQ1thoLX8TQupsn9CmDnn8QezYjVU0qKmPTf6
         HGTRXgOAUiqNrLZJj+g7jWnYRLmuSgK8Gd9hF1ECS7DMyn7FSvl+ucnCARTEKSZyxfTu
         QQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559744; x=1794164544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SXKAJvkWEfH8lskfIpG/LcDHtbUmYSyuBcyRooPK28=;
        b=eVUpDBHOqO35jh9QCNtmeAazVBiqtYntA4lJ8Zup+ygH5PKFVsFmnSy84m7Au3J3RP
         P/KLyvYUvXTiDNQYgkqYWL2SBJMh0tbht6DzKxoPto58WDB3LNdQ/g6U26y4rYLLHzd9
         o3ZukIeyS73VCY8c1LagiR+lzgaNEIo8l9wNXgf+mjnpqHDR2z7mTdw0vhwznHZeUWJe
         5WCDAUU+hSSfR0ecAPAWgEa7Ai35/3+Ef0y8rdK4jZRaNQi4Xq9yUS/W9Y2oqcyiMsrR
         NjnShbNvr7400iu8llH3tPsHqR5P+jY2wlmCRwPm10//RAyL+Xt/rqTsVHAtp2SwxnNI
         VS+w==
X-Forwarded-Encrypted: i=1; AKwUvByDBqu6GTJi87QYv++WcMQIKZecjE8+KjSvV3U1YvxGkjZkhCdGkYr7p7XfYmmkzE1FvLeUmwDIBXuaOhzMjXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzqjlLxIzVoyEOQzngJZ0wVbButhPr/SfpaRCSSXibYEiRpdrB
	0rGi6QkC4Sy3wYJuxlQvDtkmrgGRFGgg+sIlwAkiBEjAk+LEhQYDOKkgKSfN1sKKw/q+jtY9T33
	+nZ0gUCEhtE7KHpuT/k5976wfObXdNw5EAaErl7HMHgPm7bbkXEERGJX4bj6DDQuJjE9z3uk=
X-Gm-Gg: AYBFou1cK64rt3T4TrEgIsX6h2V1jM12kkTKvOl3FalJ8amvUGemu/s1U7EPyxlv90A
	gTkiN4+bRvYA/ciBJf/HVPGwAE84JlANre9C8QdMg3KNrEWB2LWwskicbA4hogkZHcrU4cFS8Z/
	sf8/hZgDR9WUJXbXOOsxjATUJhsO6xFG5MXgvyA6ymNjMm5wQtokYPdiSpcSCDxr8eSmCZxS9OF
	/TlOBn+8IWiOOl7Fc2w+1uK1DSoVfZpVJ0rfxIjTkiXbeG/8TmymCBf5EVuQh2UwjA7Yw+tCJnZ
	TG3O9qiQTSMuera6Des2gJocc6UxGv1a6cqj9DrfqW6KOEP6Eqxp8WZ2JmDrnN2GGD2f2H+xd+o
	aS+HAmVgzP6b+zLgjxlztgS72WPfY04hS9HGcE5+l8xMcwU+otgtrdpgH9L49W1s=
X-Received: by 2002:a05:620a:2b89:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-94421585ce2mr1281218885a.12.1793559743820;
        Sun, 01 Nov 2026 11:02:23 -0800 (PST)
X-Received: by 2002:a05:620a:2b89:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-94421585ce2mr1281211385a.12.1793559743192;
        Sun, 01 Nov 2026 11:02:23 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm327969315e9.11.2026.11.01.11.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:02:21 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 01 Nov 2026 20:01:57 +0100
Subject: [PATCH nf-next v2 3/8] net: ip6_tunnel: add IPv4 over IPv6
 flowtable tunnel offload
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
Message-Id: <20261101-flowtable-sw-accel-ip6ip-sit-v2-3-c6c282cab5cb@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: RmLPjG---5gbGhIsmPVj3AlE6F_n4Bh1
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae78cc0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j_WIp6COnZI3mYKyEBAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX0+JKuannByoy
 kzacarpecHfhJRcJtU9PN6xPKKlIiR+KMDAt92rSoKpX8FW1h7yDky5aGM+lmWx9unt3hVBE0Bj
 nQ4ep2/5B/73bN5N8M+/vf6IwcFvdNs=
X-Proofpoint-GUID: RmLPjG---5gbGhIsmPVj3AlE6F_n4Bh1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX4FRDhfXiwCkX
 zlRswUNzDf3gp1PdfqF+JsaJpBEQnaE0TUAHG4MhgT56uQUVwJRLg6VVpaDmCuiI9OnmxmWocaf
 QPtbQGBO3yIe8U2IbM1TAg0iYGBJgJ8HE2pScRv66fyM2n1nfUla+mLsxk0tGKKKvXc6ShML80p
 XF8TBSGggRXt3tLx2DE9CD/3/8yyH9CUnCzRhpacWWeB0CCvBP3gcBaWF7RJdnJ7d3EytbcEIQw
 6Ab8IyRzF6Ht3FrmYDmD6aDYhHccpn70izG5tW+0d+WJEfjj8hBU2vKYpu1oUHMLBR9HmfMEMW7
 RrMI3p3d0vDyZ5t8gSycevoABmOimxxrionWP6q5Jr9oXOOow3O8Dppy6L+jynp8MCpQvqsmVyL
 g8pFXmOGTMHO8cwKFiygLTFEs4bx+GzSbtr07uL/ph8zC4Vcfp1ZlX9Gig2/SPlrBA/IJKGJ/sb
 7cvveacEVMGKSNpC0Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010075

Allow ip6_tnl_fill_forward_path() to set the inner protocol for IPv4
packets (IPPROTO_IPIP) in addition to IPv6 (IPPROTO_IPV6), so that the
flowtable can offload IPv4-in-IPv6 tunnels.

Return -EOPNOTSUPP for any other ethertype, and when the tunnel is
configured for a specific inner protocol (t->parms.proto) that does not
match the inner packet protocol, so the fast path does not bypass the
check enforced by ipxip6_tnl_xmit() and ipxip6_rcv().

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 net/ipv6/ip6_tunnel.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index 64a184bca467..920eb231945a 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -1840,13 +1840,11 @@ static int ip6_tnl_fill_forward_path(struct net_device_path_ctx *ctx,
 				     struct net_device_path *path)
 {
 	struct ip6_tnl *t = netdev_priv(ctx->dev);
+	u8 tproto = READ_ONCE(t->parms.proto);
 	struct dst_entry *dst;
 	struct flowi6 fl6;
 	int err;
 
-	if (ctx->ether_type != cpu_to_be16(ETH_P_IPV6))
-		return -EOPNOTSUPP;
-
 	if (t->parms.flags & (IP6_TNL_F_USE_ORIG_TCLASS |
 			      IP6_TNL_F_USE_ORIG_FLOWLABEL |
 			      IP6_TNL_F_USE_ORIG_FWMARK))
@@ -1858,6 +1856,20 @@ static int ip6_tnl_fill_forward_path(struct net_device_path_ctx *ctx,
 	if (!(t->parms.flags & IP6_TNL_F_IGN_ENCAP_LIMIT))
 		return -EOPNOTSUPP;
 
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
+	if (tproto && tproto != path->tun.inner_proto)
+		return -EOPNOTSUPP;
+
 	memcpy(&fl6, &t->fl.u.ip6, sizeof(fl6));
 	fl6.flowi6_mark = t->parms.fwmark;
 	fl6.flowi6_proto = 0;
@@ -1867,7 +1879,6 @@ static int ip6_tnl_fill_forward_path(struct net_device_path_ctx *ctx,
 		path->type = DEV_PATH_TUN;
 		path->tun.src_v6 = fl6.saddr;
 		path->tun.dst_v6 = fl6.daddr;
-		path->tun.inner_proto = IPPROTO_IPV6;
 		path->tun.encap_proto = AF_INET6;
 		path->tun.dst = dst;
 		path->dev = ctx->dev;

-- 
2.56.0

