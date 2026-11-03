Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664722;
	b=ZZY4BfuvY+USEBt3QMo8csvYwLR4RXoe2r94f4CsG9D2x+MbqxzDbPS6q1KPbJWvy+5M
	 jn1cQUAfTp8YWMeOfprTPNfaR9UryS2Uig93Hi4zA45Yez/6AnTpJ7cdnHFA2MH/mV6T3
	 V4Iwqzib2E7VKupAvMNw12qJwRewVJl4zJGOfojo9eHHyVTWNci40/IwAm3jt9QgZNz0c
	 4jvEW4ATO8OZ97B3UR4p5sUrW4+XIppS2zLJ4OZG54j5pGazyvs52N9p1K/eiXeNfYa52
	 tguPAc9YOeISKqq9qHsTOCZBTSip3wbf8FqpzgU6u9OeeJpnNmWQb7fozXHCvCZLzDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664722;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=ummTPafGnfpO3OkOl8ggQ4VqI1HmcK3sjRaiJLvRKxI=;
	b=SRm0uvJF6BSLRDnf2/8+m5RWxdTazPmkl2HVekiWX3JzUEd3QvH8r9gLsa+Bgi8VxCqe
	 jM8lrkiiZ9Gd3a5nfbRclwzGyeGd8JT91XBpv43drD+Q1BWrCJvzZKkg5X9HJtgQmSosk
	 wduDnIA9X6CXXY5cbeTHA/aW4EOrrayciwKZSrCy1nXrp++G4kB+VF85S0vE33aEtsEWG
	 LUcAaDPPFA30VqfJoNmk0aXR4CNPq1iaAYefgCZN/LRMTSA1RjYkadihBfpXQfpP/t5n2
	 mNEx+XWq5FmR8VTJwbbQxhH9Baat+bMyYeYQEIvbZAv/tU6pYZJddbQWfRXSufeIpUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=AD66LcKc;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E09606A327;
	Tue,  3 Nov 2026 00:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E09606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=AD66LcKc
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6FQq167747;
	Mon, 2 Nov 2026 16:12:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=ummTPafGnfpO3OkOl8ggQ4VqI1HmcK3sjRaiJ
	LvRKxI=; b=AD66LcKcvEt8Z/ESV/Gw329bxi6h8ZP2+kM8HHaXBXEe3FlT6Zsfz
	my4osu4qoNbR/lmDre6laHRurEQzXvDx98lIDNzYujXJqP/5Emuu0kvlMzXEjwqQ
	JRzoZuFOF2nHpMiypBSr4hEOqilZJNCyeEt4Z23OmHM0HpRzkPez4uIOBR0TFtYU
	lnToGSZcki03Va1OiasFOdI27QgmMk3oVWsIFBmI6Hrvc6/RDr2YHbeqhhkmf3LI
	w507CLgSKCP/O0qnXgzwAoafTaE9yRJdOe59vORSJc4CyzsT6IEHkSmvK/pmglft
	/GsC+dUI6Xreo+Xu0FPXDfYx95BdOuHOg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hp1ydtffq-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 02 Nov 2026 16:12:00 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1b::2d) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 3 Nov
 2026 00:12:00 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: <linux-kselftest@vger.kernel.org>
Subject: [PATCH net v4 2/7] net: don't fragment decrypted skbs
Date: Mon, 2 Nov 2026 16:11:38 -0800
Message-ID: <20261103001143.246081-3-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103001143.246081-1-toddfreed@meta.com>
References: <20261103001143.246081-1-toddfreed@meta.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfXwnNPvMrj32SN
 3u87W4A21EJZXnGo4VdcpNg52ihez62Xdcvz7o3qkQZVoh1o0c3jzYVN7Y1NlGrQS9DS4I5D+HU
 JEuqHpWnl24w3B3UppMKNk+3Lw1NDFv1if+o2ramG2+JDCJTl/NCj3q+opvRAzuvT2AfOiM5Pl9
 Phs1CTaPFRG6mWK+/V5lPKmeS59NP1JVwsCZMaZ2CwZuMQjYTcWMN3waLQVbUDHY3NCPxhKjfNI
 Bng2ptRt3LCJ7jMC8zJzW08GcfetpEcZxZC1a3HQB3sun5F3teZtLENEtY3hJaNUTgjUE62cMoM
 dy5nkosw+19zpp+B9xzDTDeozUTM7ToT3EDeQ1i8JufCaIC2VtUOStuc/KM1bNI/EXm5WPUBr7w
 5Fau+HzGSEcDj1p1IUk15M66S5cAVAwC7U1BcFK7Ox4jznwgaqIZHsyYFUVEvoN/69FvgGDY0Co
 OuZDTco7u97SFP4D5kA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfX2bryz3TBrNEC
 YAhckPn4gfCd82GV5CsEmAA20t7ObxCpegURfufhe3QzPi0tke4jMVoeSn/OXznKxML+hEpH26Y
 RB/ggUdyzwSJNKYZPV7uApJSoBWotXs=
X-Proofpoint-GUID: dOWW-kYPX8sPJRKLcgLK8grC-4WFjmIo
X-Proofpoint-ORIG-GUID: dOWW-kYPX8sPJRKLcgLK8grC-4WFjmIo
X-Authority-Analysis: v=2.4 cv=TeADJhQh c=1 sm=1 tr=0 ts=6ae926d0 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=GbPsI2Ihf5RTnMjR_gZv:22 a=VabnemYjAAAA:8 a=BOXTBSXESYc4cfGsAS8A:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01

on transmit, skb->decrypted means the device must encrypt the skb.
if it can't do that, then the packet should be dropped, not transmitted
unencrypted.

ip_do_fragment() on a decrypted skb produces fragments which have
skb->decrypted unset, and can be sent out unencrypted.

tx of individually encrypted fragments would not work anyway, because
encrypting needs the L4 header, which non-initial fragments do not have.

ktls could encrypt in sw before fragmenting. that would not work for psp
which doesn't have a software fallback path.

tcp sizes segments to the mtu, so psp and ktls socket packets normally
won't reach this path. it can be arranged for an ipv4 connection by
manipulating the route mtu and disabling pmtu on the socket
(IP_PMTUDISC_OMIT). the selftest later in the series does this.

an ipv6 tcp socket does not ever emit fragments. ip6_fragment() refuses
skbs bigger than the mtu unless ignore_df is set, which tcp doesn't set.

tested with tls tx offload on mlx5 (connectx-7). without this patch
some fragments after the first go out in cleartext, with it they're
dropped (IpFragFails) and the connection stalls.

Fixes: e8f69799810c ("net/tls: Add generic NIC offload infrastructure")
Fixes: 659a2899a57d ("tcp: add datapath logic for PSP with inline key exchange")
Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 net/ipv4/ip_output.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index eaa6fabda347..415bc4d524b5 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -770,6 +770,14 @@ int ip_do_fragment(struct net *net, struct sock *sk, struct sk_buff *skb,
 	struct ip_frag_state state;
 	int err = 0;
 
+	/* psp and tls offload need the packet's l4 header, which non-initial
+	 * fragments do not have
+	 */
+	if (unlikely(skb_is_decrypted(skb))) {
+		err = -EMSGSIZE;
+		goto fail;
+	}
+
 	/* for offloaded checksums cleanup checksum before fragmentation */
 	if (skb->ip_summed == CHECKSUM_PARTIAL) {
 		err = ip_check_csum_start(skb);
-- 
2.53.0-Meta

