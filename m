Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280937;
	b=gEx/oXN6wB46pZYpWH9itW5aZHo1M5FN8wPplf3kdPTJHS32bC2sMljLK461qFtIGxod
	 kvOiEirREFoqTww2kIWyi2SddhRgnv5+OIr7bBxZMOO7PvgCwqnaeWjgDgu4PPR0QQkuM
	 LW5C2I0r6mS9AvwVJOaMiQc9I8ZK4TZF5Jcp1HZ3Gc3IG5rzoV8VJMJ4VlbVmEq+w9V4W
	 J759i66w6Rv3uNn4ilX2xRinnARxDljupR2GR9XuBrFxBm9POAFscx/OIGxvNw6e22koY
	 bp88zGyaqLDuT0ruMpiv9GAq5H2f2PtcG9F8IOwDBuW4sqWZ6lwB8+MQDZKJr7xOQgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7+/RPMRcApb38IJk84iUeQLEGtR8QdU2HEBTyYQ+mr0=;
	b=P+vBG0WzxUp+HykutNL3pQWhITRl5rg6gC90NyhH8IXvvOyFinntk36BXWL83YVEygXK
	 xfgTDdh6RiY+grX1/WeJmcPQ2HVkgHUxAiaf4hVWddkf9i9QcZiYZo4n5W/o+1mg7wLPk
	 4nwTNltFZYsN+5Q9BdTX3uMyyP0MpXhAcKZXX2YPgYjBl9ShG39zOlBg+kuun/MDtP11m
	 hFqxJyTryJVbGL6CeRbwXmaSNZBhHb65a5yje8nAE4rSC9PgCa7LQlJLk7J0tY+H109EM
	 TsPUkl39EYzu/dqZoYFlWYVJ1i+RgPMK6yjY4DFYN73E/tCrVzJCTiW9ccCOz28D8rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSQI+uZS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HVsCxP3j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5893606A31F
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5893606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSQI+uZS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HVsCxP3j
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe1Qd3399612
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7+/RPMRcApb38IJk84iUeQ
	LEGtR8QdU2HEBTyYQ+mr0=; b=nSQI+uZSXb+B5WRvbBvSprvLSefhchq5n0x3iq
	CYtCxEWN7OeLdJlBO+8OlvV5wwJmb8Z65c18V7wgfkw86lJ9VpiZttZZKX0ks7IY
	3Ey06xL2rxIU4FHvqPsvJVj1scze+8T2N9FKCJuNfZoUGMwRm3xoBMbXkQS4Yeda
	ogL25YwdLZBaubZuXA38XkI+UXyeJfQA6CLhu/UHZK38/NlpEOGmEJRoUAnZEQAU
	On3ZnXIDFNVn0fpPhQTSSGJvwXXAUb2N6+XUXTvraCozY0Hvi1z/Bq41PS7UsPAi
	YmSGMr7wwFNoKA99GIsyORqWREk8ShFz15BSF8P7h0gKZCHw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2c54y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:35:35 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98c70917433so2390366241.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793280935; x=1793885735; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7+/RPMRcApb38IJk84iUeQLEGtR8QdU2HEBTyYQ+mr0=;
        b=HVsCxP3j54es+6UhB2RAe9fZsDMdQEjfTEpoSY7T1n0m2thl9Lpyrkp/yRl5CS81QL
         dQNQ8bwTlfiuUeHhrGdqbG8/SxBs34g5L+0cpFtaC4kp6Wc6eKPewMWl/trqRzLSrbII
         HAO1LPVylenA2jh0q+2r1GmlXkoGsCrDenwoQd8ygwfqbCJb6bCOMCX1BG5xImLRIZTw
         p/gM7IYWmHRMoHB4tG+yU5skTOzJvHcNrAPpfq/R8wakr6izNauaVc3ZsjFLoRMI0+vU
         WUsapzqNS+YNxRwmWxWZha7T39xj1yyH/Iv0Kz+mmweXjeFM/5c4I2SsM/kikmIlUpHF
         +/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280935; x=1793885735;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7+/RPMRcApb38IJk84iUeQLEGtR8QdU2HEBTyYQ+mr0=;
        b=o3oJiWmvQpqAK1RV6ZbFkvbVOv0Tfv1bg0jyrmEouVO77Z9FRhNaROPhFGMJ3razn7
         JwnfiElNtyN1cJJP/bvyCc/s88PHDqOuTdb3nitkOiAzY1SRAQymnM/qCXM38kyiN2XU
         8TlOw7dKHMc/cxXlK5Q+jZmbzmh94GntJ9TK8iU3YAkEdPMAqilZU5DtxPsdjnOZfJJ4
         ZIiix7qxAeuQmxsfEh4+ExLzYG8zqyGDphBMCeK4wdBDFI8R2elf0E8v8WKIPy+B5srb
         EF9TIIa4bWkVovOkMKO38ko8iEVpr4gOrbT9HNycG5BrMI0l8+WrhZgVAjoypwiw8M12
         uRFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVl3ljoJKLcwVZjtGH4YGLqxBo9jx63xR+0MCM8mLxuMiKGGnPPNXVbZHm187QnM+1uU/IzkHLXOLzP2RJTHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4krCxVmbAMtJYdk2SFtITBap3k5Ycq6jiT3PIHSIRChGFMguG
	vEjFD1xdK5pfARUnzMgwkjU5rhSaCquRzDSiLpRZ0tEtJ1GaDHJeNiRQHL8G6ukSNQs+Oe6LdYh
	+0Rjuewyg8WzzAi0ix+ctHRh7H8oL/x7kiQGizBG6yh7LfcMmQxMfy/fz/M9S2T9HkpqXWVQ=
X-Gm-Gg: AYBFou01Mvj9AtOpF09o8QLvnzgvvV2m/DcWaQ/MmR2HMDBmoBRvLEL195dn9cH7u3V
	AtNBOmbh19V5TxSetc57cTbcnudDqpc9ROghQbfJL6kp9HZX2DQkTVK5rNqMKBvgfPWYJBYgHn4
	k/EUR+fyveI61oy4R1cZYFet2ex+HxTRmYNHv4DzBrtwdg0FAzb75I5mltF3L44ZK6xJCqaIExb
	WFprTKgLuGPDVnqv81b1uvmdCygxtsrrN7ntNSy27mQFrCcK9ZUBYzJSubTH/WI7L0ojNaYNc1O
	u6OdMNvkKG3zk7Go8wR4CYL+K1yTel/hgIg29935d27T651+jw2E3po6bu1pohYYaX3aFBqMQQL
	XIhb+UE7Tn+1OoFzHuz9qE/iKHle1klJSQPs1y6cpvZt80kI7V4s/NkahDf8JOD/z0lySyJTvTi
	52epxh+hYLWAWAoQKQBEWjYw==
X-Received: by 2002:a05:6102:54ac:b0:7c3:39a3:f65c with SMTP id ada2fe7eead31-7d03a294bd7mr2751741137.1.1793280934759;
        Thu, 29 Oct 2026 06:35:34 -0700 (PDT)
X-Received: by 2002:a05:6102:54ac:b0:7c3:39a3:f65c with SMTP id ada2fe7eead31-7d03a294bd7mr2751724137.1.1793280934202;
        Thu, 29 Oct 2026 06:35:34 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece14a1sm35815214f8f.57.2026.10.29.06.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:35:32 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH nf-next 0/8] Add IPv4 over IPv6 and SIT flowtable SW
 acceleration
Date: Thu, 29 Oct 2026 14:35:11 +0100
Message-Id: <20261029-flowtable-sw-accel-ip6ip-sit-v1-0-6a17c54f9fb7@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MzQqEIBAA4FeJOe+AKfT3KrEHc8caEBNHKojeP
 dnjd/luEMpMAlNzQ6aDhfdY0X4acJuNKyH/qkEr3bVKj+jDfha7BEI50TpHATl1nFC4oDdmNH2
 vh0ER1CJl8nz9+xmix0hXge/zvCrhjVl3AAAA
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
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae34ba7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=q9g148jr9wMc7ZL12-MA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: q2s8G8iboBAnrgjpJ6yVmbEgtlsPXh-O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX4khkHmshmmNt
 YNhD73nWBRmf69f7/xwn/4q0EQQBKIbcwAaaWMshr9shiYtkmNSyuzY7MTulOCJf4aRo7uSw3dZ
 zSNH8J3DfPe2W0Eru+w8qct02hj+pa0=
X-Proofpoint-GUID: q2s8G8iboBAnrgjpJ6yVmbEgtlsPXh-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX+9/UHFBUSHaA
 HPDA1S0ZMXzW5CeYO2oxuQqu+XqJblGZ3b6JAzv7v8B0K1vdVfriDfRQyUL+hTL6QychrtbRqDw
 lLi4OJ3HMPAJf8XyXzuNYWaG07MLsx+Rvvr3qbqVjL1Fu5iIZ//ou0cdorrcm5WMSRYiZizTzXo
 PIHoCdE1tBwU7DfSH9Ba2Xi/F2fJ0Og2Yg7RqB5P/mnhmrqHuatq57yt9Wxlj9PBjuoeiGDUJQt
 TSNilg2rW192abWm8ncBeumCmonkTxDtL9wCRhUR4MIhlNG7m6MRU/g6YU8zBZfLLJf+YaN/Lh5
 gGW0WTD1t+fjSGEo7+mQSEngTHLQtStluQafBCpiqun0h19vTyE5IiEv9YeoEhek5gVLi686R1i
 etUb4q+VPbwKPjQcWgqXGwtcqt6DcLEqmrD5bkO4aEgK0ndVkpLrbP6t9u2csRegx3/1Mwp5Tmg
 jDrwPAFPvAcakdqGXAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290053

Similar to IPIP and IP6I6 tunnels, introduce sw acceleration for IPv4 over
IPv6 and SIT tunnels in the netfilter flowtable infrastructure.

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

 net/ipv6/ip6_tunnel.c                              |  11 +-
 net/ipv6/sit.c                                     |  59 +++++++++
 net/netfilter/nf_flow_table_core.c                 |  18 ++-
 net/netfilter/nf_flow_table_ip.c                   | 133 ++++++++++++++++-----
 tools/testing/selftests/net/netfilter/config       |   1 +
 .../selftests/net/netfilter/nft_flowtable.sh       |  86 ++++++++++++-
 6 files changed, 269 insertions(+), 39 deletions(-)
---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
change-id: 20261029-flowtable-sw-accel-ip6ip-sit-f3393772880e

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

