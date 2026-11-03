Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714969;
	b=aEQnnRSlIQ3X4+P+cuPdIhfQ1qrLpQ79hX2lAkuMC9pwtYK7ouNqNM7ln/NMD8c9E/+D
	 9OBUChNG5Ykc00GDoYm6oajCWPiqW4+PQA/KXvMKFaUNuFM4b3o9LImyax+3d06KNa3eg
	 EiaiqfLkpVhsHedq3rVS7k1BhYBhFNl/ONhQiu2T8cgIqwqLkyqiZRsiviGtMURCJLTqF
	 o8JunZT2+TxBzdctELOuDdrAzGlJOJ/xqCsEnYSUddSPvNFiSzOeo1Nr1eJ9zTH6e0l6x
	 umxFcMKkagCmcjqet0o6H/VMS1S/9Co5+79jFhnVPpj6fge3sXy9Ebnf3l+iAXKwfZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714969;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3SXKAJvkWEfH8lskfIpG/LcDHtbUmYSyuBcyRooPK28=;
	b=2rL/GIXuA3dxVmOskEB1jbzsopoRHpFfJYHwHXUKc0tfwh0EyES7lAUPTSzCjAvWPMak
	 gJUN67qN4RivJhyi077e/tou7Qa0AjeLUw314F/SOCM3Dyk4QyCmhY1ZnlHI6Zx2h7Q5P
	 dGsWoFwMkCRNb2b3FtQAeGVb6JeS06PcFZxUojVdvm2Ldk61+sXCoCOzweyh6sUL8MTSD
	 tu1wA4x7xY2sFw6+UKVuXbDSF18JcHISCjKh38b6aL2Hu2p0VOm84CtvC0KM1fGbBo8MY
	 V7fwTk1mh9nudgpLMv7udAAgoF2HMl/WDdJ+1nt+S5AyHodBEfSI9K1rqyVUffi95OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XsK9/Zd1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FJedlHZc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13B3606A33F
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 14:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13B3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XsK9/Zd1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FJedlHZc
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZAFd3973705
	for <linux-kselftest@vger.kernel.org>; Tue, 3 Nov 2026 14:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SXKAJvkWEfH8lskfIpG/LcDHtbUmYSyuBcyRooPK28=; b=XsK9/Zd1psoocl2V
	TxAJIBou6+7cbmOzzAILQjeFkx6RVVAcVTkoHqcFiN8DpRsAcqUBUXI9c0/Fs3Sx
	L0UM0J7LDmqrmFKUa6solAp/e7rYCp8WVOKsIJBeVGYEVNW6uwEm0AorL6mCpMI/
	YBBiz1ZqPl9tzEADFdpvPnTkq5f0CQfwpTck3LkWitsJXZUbWKcnay2nGQilj1lV
	M+Won/OuXoBHS0Ui2E8l5g7Ank64WMhkf4wc99L6poX4qMpa2tEMtmbL8XmpFh4v
	3XYPdUgdHBuiTKtGMkAZQ7AuI8ORWc/LB4G/sUP+RiqA2uYF2y3fCQWo8j4sdcT0
	H9mrXg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy379s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 14:09:26 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-84c4dce8182so5475147a34.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 06:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714966; x=1794319766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SXKAJvkWEfH8lskfIpG/LcDHtbUmYSyuBcyRooPK28=;
        b=FJedlHZcOubD7be+FAsUOVbyov/WoxBEJLdb4Y+W5TV2KKQMDtwDOPxzyv9YyDMQlU
         cn2Ya4zl604EQnCB4cV5GJxJMEbJIKlLIKznzP/YrT+h2gAco4/QeDTXTP0WQU3liSeb
         Uu+krjaQV8nll5GAvcGHJWtHcmzp/dVObDbAr4PD1GfTcwToIwv4U/nOcuRzC/zE6Ta7
         PF8eiyTNK8U2qWBFX2nj0BKAQM3MkJzsOGRNykeBHIvopw2JdgaMev1mQmDmiz+tQbAk
         AXDMc3D2LzkmlSG+mUtVuGtD3pcYHUxs5uyOUn37pB5xkAIOF0Kl8204PGemtzKvwAp+
         Nbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714966; x=1794319766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SXKAJvkWEfH8lskfIpG/LcDHtbUmYSyuBcyRooPK28=;
        b=e5kc01JodUWPpC5zJE5XqaGymwMS5wsA9avbxYDNL2lBX2KmI/CUjQGO52LNhHZJk1
         efcAxtGlAUpRSPNp5IF2x1yMZqb5t5ZVVd5TB2ESd1b0/rapG4kr4YRhr/pPXkCCW2T+
         EIWfGszMm2v8KhyF7KGwmz58uSNh9NFVzTgPPNs2BCpMHJpO/ItWWS1taY+VjKJCw5//
         5TYssvhB0o0ehqxlLQaJoeghn++hIep5+RcWjrJ6fKPsiqX3o59em9BYJ/vbeeXH8AxG
         NIWjwQTzt9Z4XIg2TB7eICK3kjcap4to8Ssu5bO638Wn8Erkh4bkZqVz7My6l8ZtzH3N
         Da9g==
X-Forwarded-Encrypted: i=1; AKwUvBwQluiksJQQVvaFOGf2nOwnD7BMm3HxWQXWim9AT2mLUKo89MCrhw/ACrhf7SEU6cAxkmrvYMEgCpmqj8crARw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9tohYCm8NnE+4MQdB5T0hlvAxX2qOCpfcYz7K92DoulWYyCUY
	854xHO/l6pVdbfIFuBnGkDMpX/Tj0wfyVDemf8OAipOvEEzQdQe6srf1eSH49a23no8Cjk4/OVG
	9fKwz8Nchf7/AD8eBMJ10ezt+FwNqde32Ax/86AhNlTg5ZwS3eSJziuVoz6sC2quzWXbI+pvi1y
	YVFrY=
X-Gm-Gg: AYBFou0eQ7Bbq0EAwDYdLYz3tEqBzXc9RTK95pApRMPTOwaIEWQVvyWj6xa6LUJip7q
	gPrTF1uZ3J/5hVjRk/J6B3FPoODWJfjt8OA7R/NAZYmBN1sh4FY5jzRNnVVQh/S4hhwDRdbmZd+
	S/oHsdfY2Gr/tOcVYmIww+gD3FM+IqTXivSekuOf3MwnWYP+9ZLvPyEDTmKzZp10aef4odHgZmH
	5ELTRXt+WseIsOmlw0N1nVmDNtgO3K4wn/3Qxct0WhJ5BgXKjEBAazrvKPC4SC7KbL5ii0zSPsi
	tMEduduBA5yigyiFWNui9yB/5JoKprGqvTT65IkGoiakyH/26z2MCzBz6zQUmu7PaTH9vYAlGS2
	T2k0aRp31M3ObJyFF2NKBlGvFd/ZAgT+2D9s69G5+Igg/c8oi3qJelQO7BV9ZmAA=
X-Received: by 2002:a05:6830:3e03:b0:80c:d30f:974 with SMTP id 46e09a7af769-85d365ac10cmr9523818a34.21.1793714966079;
        Tue, 03 Nov 2026 06:09:26 -0800 (PST)
X-Received: by 2002:a05:6122:1d53:b0:5e9:7a1a:5ad5 with SMTP id 71dfb90a1353d-5ec689672a0mr5271199e0c.20.1793714475995;
        Tue, 03 Nov 2026 06:01:15 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm24929252f8f.25.2026.11.03.06.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:01:14 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:00:44 +0100
Subject: [PATCH nf-next v3 3/8] net: ip6_tunnel: add IPv4 over IPv6
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
Message-Id: <20261103-flowtable-sw-accel-ip6ip-sit-v3-3-60b5f063f1df@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: S6J-IQChXX7cxvWvOSscfFUnHJmBhiOW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX0Fx0k+jFyHVG
 vPf5Hy5/4PwxQOK49hVwYVK31YIuBF3FLpyVUgD/o1+TleXy3JZcTYhmZGF2RHd3m9lz89u2PnY
 /oikRqtHITrWtac14tH90UyjVJcQOPi+zLrNmKqumgtvuypivPr/h9W2so02euHMyF3UfyAsRhc
 KOuiH05EP8cLTfqN9lHcuUCaN/lgsU3YfZW471dEk4fJUqCss+RS63pm1OVwpdvSNa+ooiy8jjT
 flADQoJ25XkYNCsNt5JTz8W6qgRCwkM31lho+IYR1hy9G/wzTc3xv1JymJ6kmBtGEIUmPo1o4Gf
 YVR4BFamGcLoKfZ5otRSE32PNMR9tFFIhTvvyABnGrNpHR2MswtQAtrMiH7ipz107xgVJ6PD3ay
 gK5FpLlwk9ppm4H436swCGf/N6qVrY2hnbbFTkSGpt+xYG8t5nVsvvSg0LCjz2AlUdsxDWl7k0i
 XxtM4wY7Pp9Y4LPjA/Q==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9eb17 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j_WIp6COnZI3mYKyEBAA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: S6J-IQChXX7cxvWvOSscfFUnHJmBhiOW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX7/sS59ZYsAxa
 nQ+HYArADM9oUl5MTme68EPG/ZfXPZ2PntGrROCVimefGv2+k1/PXBRkASabgls3uRY+WbLR8Vc
 f/BORUnyb1llzCEyueGTavHBltPl+d4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030056

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

