Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714472;
	b=WVsJpxrXh/TnLvxs0r5Y+8ZrGMtOsHbWiFjzOMEOOEE8P+bb0kQODjN62eDLKZ7ACFu/
	 +gvqsz2AxvZC6PhjlBHM1Zte3ftfNO1KtLBlavZztr6EiHEtfonEQPKx6BflyEuRaIgeH
	 PgOX9sMrptKsRhCPJtwA+ZJe/MVyE4WkirhGqEnHPOrPmFzQQb7CHwW/Q53p51kkeKJZa
	 Lq9LoIuWfZiaFdw7Rm/O9J4l8Kc3dRP5iPJaQJ6y0gllvH/HoiIlDvwPCGsp7ehjD122O
	 rY1CY8IU/0zt4YKYTKfhINTZwn0b/Jo9FmMHbyxM8J9PdJLbyCixWMu/3aV4tZMe9kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=85RUdm5fHz/EURSg1WKsbBmBBP/Gz+V5vxANV+AddtQ=;
	b=Nrrbz9VSp4tu1mRpq8Xs9i5Fss3JcoBHILc1K6vM1kN0wNlFS2nLu8g7ltP/CQohMLRf
	 mMYx/DtwvpHOJC/EYn4smJ6lkbAPn2nZWAOD95LNtysd39/KKet8ZBQLdCUKeaFoPVJ9A
	 RVi3vp/PbFlXyeCabldC+fd4yfFFXediFW1IKhb6e1BMzVkngMpkia0QpQikithzBZ0Ya
	 05p//x4G2oZFZrAJCG7TBPquP/9LF1sKllXmtyBiJwNtygJ28TiUdTHPzNImkwxPWLvqC
	 lcEbXVMhF0EOQdAGOl5d1mL45JWsfYa/ssgkpcX7FgySGYM3qPWXkMHh/B1iGNxEm4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TmR6kNxl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVJyWrmJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A97606A328
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 14:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A97606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TmR6kNxl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVJyWrmJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZIhx3612532
	for <linux-kselftest@vger.kernel.org>; Tue, 3 Nov 2026 14:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=85RUdm5fHz/EURSg1WKsbB
	mBBP/Gz+V5vxANV+AddtQ=; b=TmR6kNxluCMK9SILJrHgMoURPFDlpNxyeeXSX0
	QDvZx8OYo7Ht7FLEIva7VvCZueXQuVvJTAmkYd3RUChuTRwb9+3kHR8AU8eSaqGp
	Z73xNNrh5xZWPV+ZPIvtw6zPlWxpN2TK1a6VVVreia2i4CbX4DCfMJ6s5dBLNNFK
	0KCYPtQ5UK8tL3Y3B83zm7IzFXAmqvIeICkRHnMI9NcFnXFJUGlqZYWA2jNRxwlU
	1MhH/ofWaDA/Om2EJG3/io2ttgQpjbhNzPozMgLbfRQm5ZUWYfpgWUAl6ufCCOCU
	TyF83gf61QJB6kZh9I/3z6C4M9IA/Xvu7mLBMsdhO0nVwXrQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9ajr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 14:01:10 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ead18311ebso711475e0c.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 06:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714470; x=1794319270; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=85RUdm5fHz/EURSg1WKsbBmBBP/Gz+V5vxANV+AddtQ=;
        b=DVJyWrmJTnUwV6/YyCAi8NUa/nMOAVhIJdm+QAwpbYB71PwfzUJaQ00M1M9CkLFMzj
         ekHal/l75derK5haHRQpnhvFOlmcG/rdsgalRsO6Qx3nsyr110XV84M0YjdHJD0GTSu9
         Y+2SivbjN2T76bTAIWFANVz5mgXa03Qra75qhIKXvmuyh9TW03fmoo3cLlBrdEpdwsyG
         d9LVTDtrCR1mWV9MS/dpR/9pms0uU0wG90/eVeb3KjQjj+eJOpTFoNuJpMEcyBTaGlfL
         khBj/SloXjDGejf/aMyAzG4kqvRpDsgTWrRMjUflRYP0VTyjI9ugstyMwgkI3s0GPqq2
         yO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714470; x=1794319270;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=85RUdm5fHz/EURSg1WKsbBmBBP/Gz+V5vxANV+AddtQ=;
        b=diBVvQmEErSNcysCPBczvUhPbqP4lOUFodWQlYHuMeTqYpSfVztaD2/JZ97Fn6kY/E
         ZqoRAWAe7TsPJXj7gNxT/SHvnWU1q0rRZ44F+53dDFZKCxCaMjOPTV3s+acWr462H67J
         Z/GFZhKfg8tZHblhz+G3sYDC1g+ai6Ef4BuSts8UIRvGEsprjqddEe36mdA0QCdHfXne
         QP9q0X9LIuEA+30XCDOVwYjNDOgCLOulfAOMwz5AGakCMgp/QjqJz/eG848DjbkDK5Pb
         ZT4txu9dpIuG0I5nObJrVDvO2E/dE45vqyhaKuEnTbPrQG7JoE/L/X6ntJzvL+dwAP1b
         WV5w==
X-Forwarded-Encrypted: i=1; AKwUvByQ4iCEA1exaexCLXbVRH/Abn9hnHLIL6CDVb8aZN73YHqhhtCFk0hSuImUGeA+JqnJ855r6FeljIKUQLPVgFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RS6SMMfIhEAdJVsHLlare8CxysE+Ebn/CK461tjS4Kq/S6/w0
	7//DnyOLKe604upvjFQtF4MTJyRuGJgaIzp9z3rIH6yXKne/qweClDshPS0dmOBIp2zR8FNkXXF
	hGc+JSastbLB1ykiMYhcJE4chc4TtpRpWPs22Yu8qJYnJSVvj36KdO2xR3pHMw/Ge8AR9EO5LWm
	RFz4s=
X-Gm-Gg: AYBFou2qbQtJEGzcY7IA7hrjtnYH9I/WQNF5lGfF3hK2PDamfi5Fzm3IwQP/73pr4HD
	c6kkdQDSLzFmOrSIA8BvjCV0+EwRm++gotettCx6nx6uMyfsYjebwFt+1Zm7A/LkEk2105eenBj
	nFLb8MdVYfYbohkZNh6qvUYLrkxHV6/i2UNK8mB14irkENlV3/cMLdqkSNGuYJa75rT1aIqasG9
	hxxQks3G6dlLqVT9CJ3tQip6I/UkPAD8R2FsJRxoCJIvPHm/Kp+q1mZJWsGRCoodIrDRpme8MZy
	Jg2YwJUYTNCdfrr3rTaYCDuCrR8jZbmz5TC95PYzGyfm53Py894LnLvivqYJluqL6kOcbvzndjI
	uoyKfrTBlpMerdNntO7i5YlH9bqcm6amjeUvz4zMSDWQ5tOuTTu9KxzjY54BDYm4=
X-Received: by 2002:a05:6122:4b19:b0:5d6:7f46:b8dc with SMTP id 71dfb90a1353d-5ec68971952mr5502156e0c.21.1793714468211;
        Tue, 03 Nov 2026 06:01:08 -0800 (PST)
X-Received: by 2002:a05:6122:4b19:b0:5d6:7f46:b8dc with SMTP id 71dfb90a1353d-5ec68971952mr5502063e0c.21.1793714467380;
        Tue, 03 Nov 2026 06:01:07 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm26968839f8f.52.2026.11.03.06.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:01:05 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH nf-next v3 0/8] Add IPv4 over IPv6 and SIT flowtable SW
 acceleration
Date: Tue, 03 Nov 2026 15:00:41 +0100
Message-Id: <20261103-flowtable-sw-accel-ip6ip-sit-v3-0-60b5f063f1df@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NzQ6CMBAE4FchPbukLfLnyfcwHsq6lU2AIkXAE
 N7dhosXE71MMpnkm1V4Gpi8OEWrGGhiz64LJTlEAmvT3Qn4FrrQUmdK6hJs4+bRVA2Bn8EgUgP
 cZ9yD5xFskpRJnuuikCQC0Q9kedn5i+gsdLSM4hqGmv3ohtd+O6l9/u9hUiAhMyrH9GhLW+Vn5
 338eJoGXdvGIXZ/0h9TSfXD1MHEDHWh0VQpVl/Mbdve15XnjSwBAAA=
X-Change-ID: 20261029-flowtable-sw-accel-ip6ip-sit-f3393772880e
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
X-Proofpoint-GUID: iUDMnknQltjYtSB66OG578vQJiCFm6Bz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX+v3lKTDuPZXy
 g6nLj7rfmAu+K/uadQfk/FZb0Ee6Oe/SLfs/j3bgJp1k2QQUn3b078sCOnFGUuRGnA1oEfVF8k8
 jFerZ/8IGn6IWobPsKmvrqpaUQBbgYo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfXw1hYUpN94mxi
 h3TIZik/JfWmP9P6D5JJCS582h9iNf8Gj4BvIpIZXsSltUpeOXrcqJNkYaOIoN7qUfkyZGMTtS3
 yIciqe8UUavKPok+5pBoU4ZhJ3gyCM2usTS9BYlJghGmpEsp9bcZXNXwA2StyfzMfqX9STXMhBZ
 iPvhy3MYNTkEf2m+6GwdENr21c6M6r16GDywMnAMcsTEqDE2xnT+N6vVj9oV5+zPBKbAQjdvZM4
 TadHgFvcgqubIFy+X+ABg1HVrFpSJF7n1WSwLKFmZobcTTNmLDfY8Es5zS8eS/IS4Urx8Y8c9g+
 ni9hmXS1VZb+d3em0J3/BHQ3mRRSGhvKJ/eb6U2AJIcAz3DsUFrHsK8bz3+xJXy66bL86ceDQt5
 mhbRZTkFN0F6opc66LILx0toIXirzWchTtcAm2Gh7dR8PXS9lI+b+h1nKdv+DVZRoglxi1C8Dy7
 Vymnl6UbAfPXfuASfSw==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9e926 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bI6sO-iELKRFtQfF1kgA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: iUDMnknQltjYtSB66OG578vQJiCFm6Bz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030055

Similar to IPIP and IP6I6 tunnels, introduce sw acceleration for IPv4 over
IPv6 and SIT tunnels in the netfilter flowtable infrastructure.

---
Changes in v3:
- Fix FLOW_OFFLOAD_XMIT_XFRM for IPv6 in IPv6 and SIT tunnels.
- Link to v2: https://lore.kernel.org/r/20261101-flowtable-sw-accel-ip6ip-sit-v2-0-c6c282cab5cb@oss.qualcomm.com

Changes in v2:
- Fix skb dst configuration in nf_flow_queue_xmit{4,6}().
- Rely on tunnel->sit_parm pointer in ipip6_tunnel_fill_forward_path().
- Link to v1: https://lore.kernel.org/r/20261029-flowtable-sw-accel-ip6ip-sit-v1-0-6a17c54f9fb7@oss.qualcomm.com

---
Lorenzo Bianconi (8):
      net: netfilter: nf_flow_table: recognize IPv4/IPv6 in tunnel proto matching
      net: netfilter: nf_flow_table: refactor MTU check for tunnel offload
      net: ip6_tunnel: add IPv4 over IPv6 flowtable tunnel offload
      net: netfilter: nf_flow_table: use tunnel encap proto for route lookup
      net: netfilter: add IPv4 over IPv6 tunnel flowtable acceleration
      selftests: netfilter: nft_flowtable.sh: add IPv4 over IPv6 flowtable selftest
      net: netfilter: add SIT tunnel flowtable acceleration
      selftests: netfilter: nft_flowtable.sh: add SIT flowtable selftest

 net/ipv6/ip6_tunnel.c                              |  19 ++-
 net/ipv6/sit.c                                     |  72 ++++++++++
 net/netfilter/nf_flow_table_core.c                 |  18 ++-
 net/netfilter/nf_flow_table_ip.c                   | 157 +++++++++++++++++----
 tools/testing/selftests/net/netfilter/config       |   1 +
 .../selftests/net/netfilter/nft_flowtable.sh       |  86 ++++++++++-
 6 files changed, 310 insertions(+), 43 deletions(-)
---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
change-id: 20261029-flowtable-sw-accel-ip6ip-sit-f3393772880e

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

