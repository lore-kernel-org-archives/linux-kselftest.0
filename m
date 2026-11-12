Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442534;
	b=XlDCYAsiUL8spnsUIpuUz/YeES9Zt8hc/Oug6XmYdvPIKkaWbIfgm/ZSri9TANJPrU+W
	 Tg+LsYGaUQCXfE6TTBcKtBd3bWysAa0O8Lmw/nrfqQU6clsD3AdR5GfxCNvha9JpUH6pe
	 nOCDLarC/duh4p8lh9d3n6hiWYEh6zurpYTJ+u5tzJxptetOiknIY2lp2u+H0mv/+yzR+
	 GTmU0HleJ0q9EEebdLQTKz5t8MKUIpBAlKBvKsf30TQBg2AAhaT0Zk/3COm/bs+Vcfjjr
	 Ppzm22ZsSW3P49hPLuxvGbgz4P3SqPzki4dR3buvUc6DyY5EL4zGVihwai3co4tAsWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=zXwf6lvKsvbNuuBubzzoTwoVeDJZTAsxK1LGHr+DBHE=;
	b=wb6T2MJ4eUfJgfqWuz9kO/HupNyixWWUkDMcqur7GdGlm1FX7UGTkhlg6qjQHYeTHbDp
	 BRqZhwMJx3atFwtjGT4Is33o0LDy4Frt++QTtYt/ok8EBn2oQWws4fR5ftRgfycwFFYxF
	 +1isToRiOsGhNJrYml9Y7NdoosAR1jQdYwJTsJjl3jfQbcWV0OCOcF9f0WeLV2YsuCOh2
	 CvxYfkqicuQojZ7uOfp86V9QTmpz65pqksX5EzqNlUklE3rJIF+Gtf+5nH/WVtolVXEdT
	 STr+GPORd3bd2+Q8RzIOgctMH72dWxCeH0SSfWVr2rP9eKyp85efHis+BlG5wSkI5Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=JrTzZ4s0;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34729606A32D;
	Thu, 12 Nov 2026 00:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34729606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=JrTzZ4s0
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC02V4v2474668;
	Wed, 11 Nov 2026 16:15:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=zXwf6lvKs
	vbNuuBubzzoTwoVeDJZTAsxK1LGHr+DBHE=; b=JrTzZ4s0Ww5/A8VwF8ErvsK5+
	6/DTscP4az8l8iz53JZmhdOamieaUUp4rwH9grR/R5JetwRJ9hUIupVHrHzC+mz1
	ThR9+fLizRa3/uvu42HOmrp9ngfl1+txuxqlHG0D65H9aZj29WZqcCCQuKR6wtO+
	txVKNC/yFGSoFzL27jAsyvJOMyfecfLyMsC/ecMAP4N3fAgQkZtQ88x/1fLY7Omg
	R0OXCfyuayJOc5dtdOpPXL0tbPLhUcJDz2itGb8dxX8uLfJwUxNySZ01zriVYxte
	L2CAn5mTnO8R/k5KAEUAGXo7FqsJqNjUUn07WhLjuVdOtoOphW860rwNPXK4g==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hvahfj3mx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 Nov 2026 16:15:27 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 12 Nov
 2026 00:15:26 +0000
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
Subject: [PATCH iproute2-next 0/3] tc: add the psp action and flower psp matches
Date: Wed, 11 Nov 2026 16:15:09 -0800
Message-ID: <20261112001512.3598626-1-toddfreed@meta.com>
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
X-Proofpoint-ORIG-GUID: sM1JsS4ao0QnQK1QHF8Hg9ZJMdfk_w0F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwMCBTYWx0ZWRfX/xx6p+ubHwME
 a6HsRQTXMtoQ0+Iyuiu5trz+4JkOiWg47/9ZmmFoVXmdJ+9SB1fNkWnWWIKfTs34DX1ejl6bfqo
 7w8eDkuC889Vzt8QaFTx8+PVF1gbhpA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwMCBTYWx0ZWRfX+UA5+4t03882
 eI8R7pyhf9wqmOGDBAAPooHzMZ7Xi0ZR6gxTfMjtp/jFWZz+Z4qxAzQ3DhbXI3tCc3Jn3yTZnFa
 4P1r3ptFOb7623JVI57KnYXg2TdIuJXiY3ZDUVKktT4rg/Y7Rywyj7kW41qYH9gtFrbDJe54jlM
 5AyPT/oYUrBbvt5nIpVuh+e076CUW3yXdZZ83QcMtaWCs/PM0smxXwtTHQc2T1Qf4P56mV8xqDa
 uJfp7UHMv3APdszug6vygib+Fwp7djk54/uWKJyjJh+8dSq6/Rli9eCFilr0sTG8XsLZgevhIQq
 eo+7V8wiN2jqi//0vh7+7pJDl9/EAondFeUuu8oV810IZSJHOhNrysF3us9yxe/qJcD73GMjoiF
 fAIXTEZVjhW/EaUJxI6sj3hAhaQuQj2vVFYSiZEvmkmdUDLiJW1dfPt1UsWuykaOzldOLZnAavd
 jHgkwv8/1u3tI7jF09w==
X-Proofpoint-GUID: sM1JsS4ao0QnQK1QHF8Hg9ZJMdfk_w0F
X-Authority-Analysis: v=2.4 cv=HuPjiETS c=1 sm=1 tr=0 ts=6af5051f cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=4h92JMTCafKA-fb_NiOh:22 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8
 a=IdDOdImUjnNiHvX77bMA:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01

this adds tc support for socket-less psp associations, from the net-next
series:

  https://lore.kernel.org/netdev/20261111005533.6436-1-toddfreed@meta.com

 - the psp action: attach a psp tx association to a packet, for the psp
   device to encrypt on transmit (encap), or remove the psp rx state of a
   packet the device decrypted (decap).
 - flower matches on that rx state: psp_spi, psp_ver and psp_dev.

the selftests in the kernel series, drivers/net psp.py and tc-testing
psp.json, use them.

the kernel series isn't merged yet. patch 1 copies its uapi headers, so
that this builds and can be tested with it; it can be replaced by the
regular header sync once the kernel series is merged.

testing: with the kernel series on netdevsim, drivers/net psp.py (57
tests) and tc-testing psp.json (17 tests) pass with this tc.

Todd Freed (3):
  uapi: add the tc psp action and flower psp keys
  tc: add the psp action
  tc: flower: add matches psp_spi, psp_ver and psp_dev

 include/uapi/linux/pkt_cls.h       |   6 ++
 include/uapi/linux/tc_act/tc_psp.h |  28 +++++
 man/man8/tc-flower.8               |  29 +++++
 man/man8/tc-psp.8                  |  90 ++++++++++++++++
 tc/Makefile                        |   1 +
 tc/f_flower.c                      |  71 ++++++++++++
 tc/m_psp.c                         | 166 +++++++++++++++++++++++++++++
 7 files changed, 391 insertions(+)
 create mode 100644 include/uapi/linux/tc_act/tc_psp.h
 create mode 100644 man/man8/tc-psp.8
 create mode 100644 tc/m_psp.c


base-commit: 204a721033556114c81c47d00375f2d52e98e463
--
2.53.0-Meta

