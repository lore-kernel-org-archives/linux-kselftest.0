Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511484;
	b=ZvKqhSRTYpxK64f+eVJbWP/9BdrHOP/TlQhGlfUwUHw5m9U9FhUv8D/eaGhExTBy04lz
	 KDII7KBBA6t3vHZEaYh/UodleFFQdn3luoQPhy7YP0Hdort8MmedW67obKmTNmiHlxQiu
	 Ez3+UtlZwT6CnYfCcockuxLcCLQB9oIXlFBIZWJP5MywgLZ36wmGLEpFXONGiveUKO1n/
	 zem0GjLzOp64pv/pKW8nfV5pFh4tacEz0g40N3L+MxpujQzsreqC1xHWz16TCJKSVqEqD
	 Ds7eWPnW8Lf3is3QlbgOlp7r5pLCulC1yTVJT6uxqJ1LC3i2HjRnii959mXxbcfAaPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511484;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=pvHRZHvjaVUp6F7YlKwGAlCNnjzq3yuwyWUDevrTjlI=;
	b=jLE2wM502Dzx6Qg4UK9CGStBU0o/VM26Hq70ShTJL06pQXSqoKAYpO3HK07JrlZB3fK0
	 D9hNdyVwkv5Z+6Q+E0WoOl51VgZKpXc7bORS38dub1n742cDE49uwPf/mXg1be7S5Z4XM
	 xUmk7oU7JLHvTLvS02Q6iYzrEXfM2sL9q4s2vl88otS1quG7azCYuEg+b0JrBefwjikUG
	 mHnWHY35eIbV5XACxi00mohwaGf4S194ar/AQKskyQ+BWwYQDnM7AklXdSmjEnRmGsYTW
	 4CGkoCyb8Us7al42MXaQHUDwQNmIKidm/h8zgmX0ANFqH543Re63nZsyD2wyAizDblw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="M1L/8FY8";
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01BE606A31C;
	Thu, 12 Nov 2026 19:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=M1L/8FY8
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFakkL3764616;
	Thu, 12 Nov 2026 11:24:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=pvHRZHvja
	VUp6F7YlKwGAlCNnjzq3yuwyWUDevrTjlI=; b=M1L/8FY8bi5C/Dx8g4jWuRqgY
	snCllGudjdSWYwtyzQlJ7qRoqTJqusn+18cCPu12qYq1Miu3JQJjZSbt8pxg9FLN
	aPk2Dbh4GqCP7lUzjvQgvr/fpcSb6xRxdmIPgARReVzuHrIkfJRSh6xKSdJqrgnr
	uE2irjaPyg1QHVINmGlNZEY7Wc9YDHmU76KULaKppVkA+qWekmT6KfV5WKlAJtlh
	Akeh8K4MPdEy4YNGKTvUrbjnNUXEygg3R6dDBcm+Gpy7ClIovveuGncgyYPSyDub
	zu4eCZdFNd24GXkwZe7SXcboJ3Fhdo9eyLIQJMdnP45xVGXNk/XThG5eEu8rQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hw101y32j-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Nov 2026 11:24:38 -0800 (PST)
Received: from localhost (2620:10d:c085:208::7cb7) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 12 Nov
 2026 19:24:31 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: David Ahern <dsahern@kernel.org>,
        Stephen Hemminger
	<stephen@networkplumber.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko
	<jiri@resnulli.us>,
        Daniel Zahka <daniel.zahka@gmail.com>,
        Willem de Bruijn
	<willemdebruijn.kernel@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: [PATCH iproute2-next v2 0/3] tc: add the psp action and flower psp matches
Date: Thu, 12 Nov 2026 11:24:23 -0800
Message-ID: <20261112192426.397604-1-toddfreed@meta.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3NyBTYWx0ZWRfX4SSsKpc6tZfZ
 7bLRYWlwu3sQRPfoPIjN0O+qWbgCbSdYCpfL+Z78heejzXukVcZcfmtsHewauQMr/ezJ2f2/tpN
 r6g/rDlbjsOlf9029bglMfA0/YYJstI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3NyBTYWx0ZWRfX285T4b7Dhrd8
 Q9oXEOZWiKZWIcTrciLnVkPM00g0PrlzP2oKfwnrvS9mYNdE3F6mUW5pP5i93/GLDx507RRhoN5
 cVGGuOdMvsr3ZouOYjGZsaIl6vGK5s8PNs6Tkjk7N/gAs3Yht5dn6j9blE+8vbMMQ3pZZxIXjd3
 IYY/x0qQbUTL/0/QYjNUxlTQ53ENWVoWtPNYYvwVAM1Okt9oW75G6yl3XyRxyJQyv1GOXC9K97K
 SOtacFW81q+oU3SFuayJG9JrIw5nCCkasP4AyIEoyFk7OB6vR8e2Nx7Hnr9taLBsGNofi/p/JfN
 p0HfN9kjK0UW0Fo3E+1f6CU8/iwpEele65woq2lg7r4Jkhq/6FJ/yjEDLIe3QmAql1eFwAkms7w
 9d/KONV0Hak4YDUKIaX2cT5qDU4t5dKQiYLW+e6KeApKlV3Kjg61ZwhlCTXtypn6Dqa3qfphUet
 sD0Po/inY9PyXg3uJ9A==
X-Proofpoint-ORIG-GUID: v4v54L09I7_5gebuxny0ZytCndme-LPg
X-Authority-Analysis: v=2.4 cv=HaaB3SE8 c=1 sm=1 tr=0 ts=6af61276 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=tpM8CJlwf7uhpglF1g9U:22 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8
 a=W2bVCvVHqoEvoHSrCRIA:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: v4v54L09I7_5gebuxny0ZytCndme-LPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01

This adds tc support for socket-less PSP associations, from the net-next
series:

  https://lore.kernel.org/netdev/20261111005533.6436-1-toddfreed@meta.com

 - The psp action: attach a PSP Tx association to a packet, for the PSP
   device to encrypt on transmit (encap), or remove the PSP Rx state of a
   packet the device decrypted (decap).
 - Flower matches on that Rx state: psp_spi, psp_ver and psp_dev.

The selftests in the kernel series, drivers/net psp.py and tc-testing
psp.json, use them.

The kernel series isn't merged yet. Patch 1 copies its uapi headers, so
that this builds and can be tested with it; it can be replaced by the
regular header sync once the kernel series is merged. Please apply this
series only after the kernel series is merged into net-next. The tc uapi
is unchanged in the kernel series' v2.

Testing: with the kernel series on netdevsim, drivers/net psp.py (57
tests) and tc-testing psp.json (17 tests) pass with this tc.

Changes in v2 (Stephen):
 - psp action: match keywords with strcmp() instead of matches().
 - psp action: reject "decap assoc", and a repeated "assoc".
 - psp action: print psp_action as a string in JSON for any value, and
   only when the kernel reports it.
 - psp action: list "jump" in CONTROL, in the usage and the man page.
 - psp action: check "encap" and "assoc" also with "index", and list the
   bare "index INDEX" form, which references an existing action.
 - flower: parse psp_ver and psp_dev as decimal.

v1: https://lore.kernel.org/netdev/20261112001512.3598626-1-toddfreed@meta.com

Todd Freed (3):
  uapi: add the tc psp action and flower psp keys
  tc: add the psp action
  tc: flower: add matches psp_spi, psp_ver and psp_dev

 include/uapi/linux/pkt_cls.h       |   6 +
 include/uapi/linux/tc_act/tc_psp.h |  28 +++++
 man/man8/tc-flower.8               |  29 +++++
 man/man8/tc-psp.8                  |  98 ++++++++++++++++
 tc/Makefile                        |   1 +
 tc/f_flower.c                      |  71 ++++++++++++
 tc/m_psp.c                         | 173 +++++++++++++++++++++++++++++
 7 files changed, 406 insertions(+)
 create mode 100644 include/uapi/linux/tc_act/tc_psp.h
 create mode 100644 man/man8/tc-psp.8
 create mode 100644 tc/m_psp.c


base-commit: 204a721033556114c81c47d00375f2d52e98e463
--
2.53.0-Meta
