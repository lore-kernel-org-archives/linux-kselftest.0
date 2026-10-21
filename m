Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616548;
	b=vZZUSs1kVyA6QtqpzpJBOxY7B12vmt0ytNCDLZs1VUgVXvGSGT/6tYE6yMRGOwtdeGTy
	 dLY9FpkSBtnDoBWt7Qj8sF28LjMqwCYh703UzY723nWNa5ifTmWQeUd3ohyQl5cpa5c3d
	 7rxHMGi3yh4zJdi6hp7bfINVEbOdVp7wvCDBsNW1fpElrKQXVseii4RcwZ+yhvR4DjSA7
	 DItLncI6ehWk2orxV4jRN/xWKbKOv5sZq03IxIc+qM1PhcfpFfIPwsCCXl/2L71D+mQeo
	 5MZpew3A6mL7toPkNdszwOvFp7TQ0rzRE7M0wR+V87xxbq69mB7o+Ma45eqptBISPRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=6JbcNpjPHdgeoWVpdkfe+xRqxcB8Uct5BYXM7qbHkFM=;
	b=5EzE6nUHgz7Jom9nNYhThL40VUWL6ite+rQkp81M1FSBGl/2PfDkB5PH/9Aa4rusxiKI
	 NZYwNhx5eow4Mvp9RZ76AWWGyVQ+EYAKApA9NMuIMryrT70JGPbuGeqh4IHBlVmwVnLeF
	 7EIQMYyT6nFUnXq1JXHPgquhnrBdJ6nOYsNrR3zqP/ddH66PLuSQ/DD25w7H35ZqPbgXA
	 xCH9NYBasaCGX6UVAZ003z/g15rL06POaE5C2r+ei/LFp11Yk/Zs0JQWl4zJscggVYQ5u
	 /gDWUJuw/Aseg3XWKd+bOb9L8k9wHawiRJHscc5cU7gTu8AerxASUW8EX7jOfSKNXXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=I8cOwnoX;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D411606A32D;
	Wed, 21 Oct 2026 21:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D411606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=I8cOwnoX
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKdfYU3517987;
	Wed, 21 Oct 2026 14:02:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=6JbcNpjPH
	dgeoWVpdkfe+xRqxcB8Uct5BYXM7qbHkFM=; b=I8cOwnoX9q9mIIUoTl0XNFbOd
	WYWOo6dYA7TnZ+P60bqnOlGt4vuQpB8BEWpsnB4E0LzC3wAya6Py/irTRUevzAA6
	JUVgX245v8KRz0mF4914weO7wVSCyNAnobhUHWPnlbg60PJAMT/Ay3tls9/XI7A3
	OfvRXGOVXC0+2SAcHQ/2vvxd0KlH/6WDKNvvo+3h4mMPsa2O3SAfDuCSATvKS6vB
	BKGdXmbkWsLkXf2z/uIPuTTmP3xNw//gvdVPXRW+AV8DW7764+wy3I3y9DmTPupo
	wEj7Xizweo4WDQnYxUoM791/Z70kJeZxgeRb3KYQc+OcQCfsWVhbnM+JP247g==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hdw52xqsf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 21 Oct 2026 14:02:17 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Wed, 21 Oct
 2026 21:02:16 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: Daniel Zahka <daniel.zahka@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Shuah Khan <shuah@kernel.org>,
        Rahul Rameshbabu
	<rrameshbabu@nvidia.com>,
        Raed Salem <raeds@nvidia.com>, Cosmin Ratiu
	<cratiu@nvidia.com>,
        <linux-kselftest@vger.kernel.org>
Subject: [PATCH net 0/2] psp: drop packets with extension headers in transport mode
Date: Wed, 21 Oct 2026 14:01:58 -0700
Message-ID: <20261021210200.788191-1-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX88LzQTuR00eH
 dHlmsCKVXSgX95LkSNHHcIXplPrT5zkGuXAaA0+bTZt7LHWic0G5GbCzFKMwK/gCw42woRNY/Ba
 kRz08RCdkg2qzhXYyoGTvdRm6Gu9eDClK1rHbkgyyYzkBPNN3VfCVoZI+NOaEZGVO4w8XakX7cz
 9V7k6ihYwEdZkzUlzibOQiNBxCsh4OaCu0Am5/6Pxdn5CnF+SS2EATtR17xgaHE8tvAWGzzRWWe
 UCvdJfneh7/TNQwkgt+JMa8ZD/XF4iOSZ3XN2TMLq1i3K5ipz0V3ykCMyN93ebP6tDLzqKvHme9
 JvDoy/qIADz4VJU2FLw1aGESH/wEObWUmoWyzqs88qm1SRZEy6NX4rXRqEQnIn3u+Ydze6/GSQR
 Inwg4nEWWR0yO9Xa3sqsU7pw0fjRk1LF38Ba1iZSwMmH50FO1Ji/5qU8YjdRQMsq0L43vcP1aRD
 trL1Y1X2E4SPg48ypOA==
X-Proofpoint-ORIG-GUID: C5JAK9VtywW-dIZqimHX8qnCTfG2PiYw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX8wTw14iPHmpH
 BdtoTpRoWpD430PNIsaM2Y5JHb/H2Q1axklsRabil7BZBTJ2+A5A2Jg4M4sY4qHv1u517RWp3vH
 Q0muuFi1ew0qknEd5hW6CeMH1/m/Iq4=
X-Proofpoint-GUID: C5JAK9VtywW-dIZqimHX8qnCTfG2PiYw
X-Authority-Analysis: v=2.4 cv=BqEIUoX5 c=1 sm=1 tr=0 ts=6ad92859 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=vqkdi4PVka8owyC1bpEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01

While working on adding support for socket-less psp associations, I
noticed that this case was not being handled correctly. It will be more
relevant with that series, because it adds udp support, for which the
psp nexthdr will be taken from the inner packet.

Since the tx association encodes intent to send encrypted packets, but
because of other configuration (socket options, routes) the packets are
sent unencrypted, sending this change as a fix.

The first patch drops the packets, the second patch adds selftests for
that case.

Todd Freed (2):
  psp: drop transport mode packets with extension headers
  selftests: drv-net: psp: test ipv6 tcp socket with extension headers

 net/psp/psp_main.c                         |   7 +-
 tools/testing/selftests/drivers/net/config |   1 +
 tools/testing/selftests/drivers/net/psp.py | 120 ++++++++++++++++++++-
 3 files changed, 125 insertions(+), 3 deletions(-)

-- 
2.53.0-Meta
