Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559738;
	b=lKL1DhQNTcWjjFSeFJKyS32CZcoqEIns0Poog+r7dVJ0Mdt5fwDQFifIKrne0h5XbRey
	 dmTLWGZT7Gt8y6K2pRuC8B8tLnI6M8tpaoNehEu97xc9Ncr59pzKQigAP7vr8fuDeA5UI
	 DOxxuaFE+upG/aI/LdocRPlnwp/GVZ4VO5GaV8RbAkGrnE0c75oGpz1VcufS834lCYqN/
	 fZ2jNDTcejWGArI0olOwwWwYzGtg1bEALziPWfjDlSqR6Zc7XG1wdOkNlsI70kGWTrYRz
	 sxoftpWXCpUpXHjkTxpOJXzrgkoqrzYsuEuPuuz8p0i6cM/XpFbLQ+B45G2hStjdxMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559738;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mZslQFVUM++BBw+BwrpJpXtc4dPPTdLJDng3B+Sldh8=;
	b=OLHjXDK/zEv+pGLOLuoy8gD39fnaSztEG/ZBksPPagrEJvY9aWCB1A3CEJEC80+3BF8o
	 Hv2VoQ/PrHRRW0QJo9rfYysypZjRZN2fNWfuyy+td0S2CzZIGpXKoFFLjWiWTQSgoySLW
	 CwFmXYt3YCVwotGsOGS5KFs27uzxdFdV0QzeehUqVwn/jEKyD3u0OM3pbj6JTi2Dnbdj5
	 z0L2fl6lW4Sb4TX4WPkCwbyJnNWcRsbNuqSkoHlGcrpIZouvnONsW6uYj37mlU6NGkJZG
	 Tx/A8cl/zDkOqHIRs2V2sJiCVrhkpYyruc9e0NC+w3VR+KE+Oist1S2EvZM2RXrJCBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J66abi7e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NlThsw+t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8FB606A326
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 19:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB8FB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J66abi7e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NlThsw+t
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQK5K1443878
	for <linux-kselftest@vger.kernel.org>; Sun, 1 Nov 2026 19:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mZslQFVUM++BBw+BwrpJpX
	tc4dPPTdLJDng3B+Sldh8=; b=J66abi7eifh/tm4V4JGcRluuWF7pHayao9EUFL
	n9RYqHG8e7I2VgbDaMpHc975iPoHvcNcpWaKmY+AmS2lxnrftmQLloV6XpllNcyG
	kB54B8P5wyWBrVwWP4wC6lGR81d24Mjp8vGW6QdvruKYgIf7mq+3BC/kdMUOttkY
	rkP1DndcqGwwyBG//jsUQyO4BjW8V7c62FPH0s6uCrzCoGrtTP4jJ0jKkUSZ9AYF
	b3ixboyQ0CEEu2BntPRyjLQfwCb4dKUzUlDclxCX0LqaOEX67/JI1Pf2lYYKUYhL
	2ySPMR9BFq4gs40uf37CnnLKWwTvZUdr4hxlpkePCJd+Hxmg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8dubyyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 19:02:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so578604985a.2
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 11:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793559736; x=1794164536; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mZslQFVUM++BBw+BwrpJpXtc4dPPTdLJDng3B+Sldh8=;
        b=NlThsw+t9/hOEW2wJSzK6RKTz4elMDU4aOZ9EaqkgVJ7mEzHl+EDV7LRwu+uE4WdJO
         +zx1wWCRKITG1RyqY2g8hW8HtoZLvj6nTA3cHiSYNs5tGyC2Z3uVB1s45ShWxfgZBur/
         fpGozBvX//rN1VVez2xaw6xzbeuGzKwptH529MkcMu8vNK+GahgTty2xBw/rtdgv7M3F
         Otu0H5wTZYcRO/5u+H5UZl4sPA08hvDPQwXyK6vB1hgGAsrINEVrw9F9rJLKoL8JOhAS
         0W49W6EEEhNVtIENueDH1oTxb3ZBszXACtfAsVFzEKd9DhZ637osGU2kjwROnIHBSrkN
         L0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559736; x=1794164536;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mZslQFVUM++BBw+BwrpJpXtc4dPPTdLJDng3B+Sldh8=;
        b=1IlAyWKAtjrLuBq4i1LLiL6JQcmq632sVusl+UNZC4ZlIwI7a0N+GcKa4VZmkWERcG
         oAG14hfZPv7owUSEqw9IsGYon4XFk+ycVYh9ZRU07WeE16tbFqcE0kh+nPaFub3MX3Mi
         NjxNZgHkgJkDV/y1LxqEHoM9FUpDxwpvkv0KegL/wATTqzGVOQRXQ23M0rL2EkSy9C4s
         6WbL5Q5Ec46VeHYgIjxt0jvn8IVCLQnoRJz37Cp0I3mZScVOrIJXp4COG2NtN8CM+IIo
         KoRWt02/QJjhB9kHLie4jKncUq1T6ypGlSuC8ngdg7HoK0YBXUfx25jplnAKOZz8KIlH
         8DxA==
X-Forwarded-Encrypted: i=1; AKwUvBwZ+3cEPdPspro50AgRv+kuhGmsmlPxTGhEEstgRhX/BpYB2J9xnZ+aUNW48Um1Qn9SaUgmZ/cOwCqDpiMrZ4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk1o2yH+EQWFYMUHvnLZthUPja2n0U/1TmRNBGSITADERMmjC3
	OzSK9FvMsKyLh0GhxQfBXzir0zx+A2wPXG+qE6dC4NleKh29BQxZDmjYSDc8s4XiSHQv4zG8wLM
	nHvXtvxk+XfQY/odrEzRsASZ7/GOsdB6NnLMbPpRwobVXjiRjQtUOFLTtrFqRQyNBTbbyeII=
X-Gm-Gg: AYBFou3Y3ASYuW91Du1p8k/z6uEptHqVzErlYlw0qBIRhPCIZbJetzXK9G5P+6fIyMO
	VlZLcO54NIOHc6TCZMItibdryWlBOvR7v2PSO+6HEf2o5vO18xjyPuRrxkT9FfQM2FOAqA6nKo1
	5cv0Jhqbdr8qXeeJOFww+I3FDpFVDR/ALw/OX82h5ck6G7iBvtdO33mGLkWPchHfzimURB12cUT
	47c732O69+lrO/Ha/gT1zv3FO71NfzRkohk8UDjKE2l+z1K5mdOs4QMwTV4griuIV2tgl9EhhuV
	vAgPJv9IxPSHuACMM1b8RO0pnOXpp6qFgs0sFIUIVaW1itHmsG1Y6ggoSAD3auFT/IjPUEYVZP4
	B+FL92HC2AsFalBGGmogwx0QoNrOwV3BLjepU2ZShPSXwV9sXk2ePGXwpsfqIQuc=
X-Received: by 2002:a05:620a:45a2:b0:93c:c96c:a5a8 with SMTP id af79cd13be357-944217b0af2mr1362240585a.53.1793559735840;
        Sun, 01 Nov 2026 11:02:15 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:93c:c96c:a5a8 with SMTP id af79cd13be357-944217b0af2mr1362232285a.53.1793559735153;
        Sun, 01 Nov 2026 11:02:15 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm327961625e9.11.2026.11.01.11.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:02:14 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH nf-next v2 0/8] Add IPv4 over IPv6 and SIT flowtable SW
 acceleration
Date: Sun, 01 Nov 2026 20:01:54 +0100
Message-Id: <20261101-flowtable-sw-accel-ip6ip-sit-v2-0-c6c282cab5cb@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7ZC2KAVX3sOwKHUqk1SKFAFDu
 LsNJ3Dzk5eXvL9BpJEpwjXbYKSZI4c+gTplYDvTPwn5kRiUUKUUqkbnwzKZ1hPGBY215JGHkge
 MPKErirrQWlWVIEiJYSTH65G/Q++wp3WCJomO4xTG73E7y0P/9zBLFFgaqe3l7GrX6luIMX9/j
 Lfh9crTQLPv+w8nEdmf2AAAAA==
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
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae78cb8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q9g148jr9wMc7ZL12-MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tZ4MGuQfoVCH1KcP_MJ_XoqBbWxyf9QD
X-Proofpoint-GUID: tZ4MGuQfoVCH1KcP_MJ_XoqBbWxyf9QD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX5MhYFBzOpc5R
 xje2UKwokMA4MpmKaxFU1NlSSQVVX94RtPh0y9Y8BbvxFz3+/QS9A2vIVY879YDXCybomSYFCDJ
 CDbXg09nqi5S1XjHNSAoQtPx9bH5GGotQSM+Wq17dO5dvDRJ9+bjDwV4n8QmlQw7ruA6p7voN2a
 p1v0BHr7clh4JjcR9ZvBKUf66I1zDceyRY7/1CnpfBWKBh03MHxO+HGdSEsz/2vnjwqnOZq6AHR
 DccUBzQ/MojXt6NtL4wGZuMSjM4lm3c7LailL3wssIDClqtwPYlghTkQqXjdO3MmWgSSOweXC53
 LhjmnqqdQ6PIb3nO0PRmcxPYbKHEzp3bui3un9lecOpsDzvSmTmLkouyvdr59zBLYzOBg4LwFSZ
 el4YzQl3iV971yRdTYXW/NlOCOTGGiGEqo4sGmd1kDmEh6Jcexh7ZimvhHkDBapE6nS38aCIoFB
 fUMJ6N7eqbx7q7Cp8Rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX0Rgq77BFIrPG
 QUYacix5Kzq8R3srW61hdFewvqtKrL1gxOY0opcWZ5XTvhwW4uAk67rRGY2u52yl7a/UYNk+0DJ
 RVYc/7xP1ZRYSJO3tJluowS54OTqbhk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010075

Similar to IPIP and IP6I6 tunnels, introduce sw acceleration for IPv4 over
IPv6 and SIT tunnels in the netfilter flowtable infrastructure.

---
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
 net/ipv6/sit.c                                     |  72 +++++++++++
 net/netfilter/nf_flow_table_core.c                 |  18 ++-
 net/netfilter/nf_flow_table_ip.c                   | 137 ++++++++++++++++-----
 tools/testing/selftests/net/netfilter/config       |   1 +
 .../selftests/net/netfilter/nft_flowtable.sh       |  86 ++++++++++++-
 6 files changed, 290 insertions(+), 43 deletions(-)
---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
change-id: 20261029-flowtable-sw-accel-ip6ip-sit-f3393772880e

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

