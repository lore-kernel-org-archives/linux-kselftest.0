Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442534;
	b=BonInTIVGVFFyveerbBYvLVOESDEqREBRRVcju98IMXZTQ/03E2HMCnhRGgv/elVCDp5
	 FIXg9nszUvUswUKbK1Rx28sn5XpxEXa5djp5l9Pq9aCdqGpYszLsCp7oDCcGkw8w52LwW
	 Hcc6ieWWQ/9rzzoLXu6KLAKZBjmxKGVdtzV/895dDBs+52RXrFgfYUfJgH05jLQVx+7rt
	 rm7em1aFFVgRvd3rmS6zDqFVV9sKQ3N8M8GQTXl/C/pGC4nSgpeGnLf7EmWNk6AQ9Nagb
	 n1i366v4q5DMFFh0M8apSRO1Gwh4qxS18lohXm5rLx8EAliETk6HGVEz7rDOVHb1S/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=1BKF3khwmpUN5sqTMrZBSuOst0FYDPzt+ACzs2r3QGg=;
	b=pOhkeQ6Q8HYpekdCj5ToiPJPM4ZRtOyBcPvyqjJ1lgkJx7W1jxXp1Xn0/AXt0ctkhUrr
	 YcgHDmTpkQ2OP8HKm0c4sHD5T7sNZtPtAdD9q3C2FZP9jlckCcohAGztxJK0NHhG3TDW4
	 IECFMbOhvv5D4/9SAilWMYwzrqOUu/ktbho/kI8I2B7kpNAmxRDg1TjMEqzUXH41Qhm8+
	 oWo0elnloZ0S/NqjjNPcQYVZKsP1/iLu5dRpI69Xr5gt7dMGz+QN1jn/FV7LwFkZJoJSM
	 /9ctiGuQwwuMYAbdN6UzCddbPNmwvTi40hBNcmz7ETlC4PT+qk2w/4ls4ePogjjckHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="dO8/OGdb";
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9D9606A327;
	Thu, 12 Nov 2026 00:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E9D9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=dO8/OGdb
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AC02V2V3482744;
	Wed, 11 Nov 2026 16:15:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=1BKF3khwmpUN5sqTMrZBSuOst0FYDPzt+ACzs
	2r3QGg=; b=dO8/OGdb9PAeJPGhBL6veBzWGIEmuHhUJGwXVd2i4qtlh+FelikiQ
	242ZvDJu2vK6Ipi9vLU635uyXLzxYnGJP/3P9x2LpImBqeDZVzM5YZ3uuJSqANS8
	377TjhIHnsvVknV6eB/6El6RgUGiTsdIf14ybNR77gyx87B/6Hnc6+HpQ5Bcsf5Y
	YFCcf1UQh9RQMzMWG/sSNyNKGbrizXlm03eiA5bD1qe4jVOvjxRJfpon1W4tTgYm
	S2zg6LjWnAV8OOMDAzHxxLiq5VM6w/kRo/P2nbsIbfcGmNby9mjePttPlmY3eA5S
	xU6/K/xbduxrdhiqXW3Ul7ANo9KLi7IYQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by m0001303.ppops.net (PPS) with ESMTPS id 4hv72pujpk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 Nov 2026 16:15:28 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1c::1b) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 12 Nov
 2026 00:15:27 +0000
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
Subject: [PATCH iproute2-next 1/3] uapi: add the tc psp action and flower psp keys
Date: Wed, 11 Nov 2026 16:15:10 -0800
Message-ID: <20261112001512.3598626-2-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112001512.3598626-1-toddfreed@meta.com>
References: <20261112001512.3598626-1-toddfreed@meta.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwMCBTYWx0ZWRfX7HTFqQG4f+5K
 idRvJu7IoVnPODC4Zu9HqUWz8V6hUQCd0lvZXWNnC0BEdGQiThZNnmZVy3CLvcl2isIKWRkp1uN
 uW/FDsJTaNxvPD1e+oQxpQ5bfR09Mm02Ku6cepyK5j/iRW5PwdLEQFROEnzW0F+LYtaGd6KgzQF
 ydxcRf6/mzuyfhYRWM/tqrTlXk0jPLUHQC3JjCoYrcen0GSQmJo3xvJ6A5bLhSJlQuhqvn6ufAR
 Y0zn+fBTnKqVoPanuyUUl7z5qTP2yG9D80BhlmyeyMXYeWEt6yElrCW1ZZjcjWOH5FspSlNF+X4
 CFvKWkxmntQHOZDrTOz45+ZzIVQ0VKOpcHoWA9Z0XAg4T0GYzXOVn1ZJDm8WkGEmSsRUiMlvqWp
 Khyav1C0LlEcAp5/NyOpeudLvIiy4OBOW8M91aLg8Y0xbgwp5gibJeE5yp7eCUg4Vw0lubpudhS
 SbPtOkknMjP3hDcqVhA==
X-Proofpoint-GUID: 6-OM5y7sgzI8Z7iApR-2EzVxkzqdpa5_
X-Authority-Analysis: v=2.4 cv=TtlzFzXh c=1 sm=1 tr=0 ts=6af50520 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=VabnemYjAAAA:8 a=77E0MKRPQ49qbxylU5wA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: 6-OM5y7sgzI8Z7iApR-2EzVxkzqdpa5_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwMCBTYWx0ZWRfXzCCqvgM8JRWP
 mSDhtth/8976ZtdBDWoinm7DoDBxw9M0UZ3vnradkZ2UGg3VlLHUtbsMA+srQI46LzsDu+Fl77u
 CQbUiNocZUQx16WCNaURehbIGWTcF/k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01

The tc psp action (TCA_ID_PSP, tc_act/tc_psp.h) and the flower psp
matches (TCA_FLOWER_KEY_PSP_SPI, _SPI_MASK, _VERSION, _DEV), as added by
the net-next socket-less psp series.

To be replaced by the regular header sync once that is merged.

Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 include/uapi/linux/pkt_cls.h       |  6 ++++++
 include/uapi/linux/tc_act/tc_psp.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 include/uapi/linux/tc_act/tc_psp.h

diff --git a/include/uapi/linux/pkt_cls.h b/include/uapi/linux/pkt_cls.h
index 3c24e8e2880b..b98d9aaebc31 100644
--- a/include/uapi/linux/pkt_cls.h
+++ b/include/uapi/linux/pkt_cls.h
@@ -139,6 +139,7 @@ enum tca_id {
 	TCA_ID_MPLS,
 	TCA_ID_CT,
 	TCA_ID_GATE,
+	TCA_ID_PSP,
 	/* other actions go here */
 	__TCA_ID_MAX = 255
 };
@@ -560,6 +561,11 @@ enum {
 	TCA_FLOWER_KEY_ENC_FLAGS,	/* be32 */
 	TCA_FLOWER_KEY_ENC_FLAGS_MASK,	/* be32 */
 
+	TCA_FLOWER_KEY_PSP_SPI,		/* be32 */
+	TCA_FLOWER_KEY_PSP_SPI_MASK,	/* be32 */
+	TCA_FLOWER_KEY_PSP_VERSION,	/* u8, enum psp_version */
+	TCA_FLOWER_KEY_PSP_DEV,		/* u32, PSP device ID */
+
 	__TCA_FLOWER_MAX,
 };
 
diff --git a/include/uapi/linux/tc_act/tc_psp.h b/include/uapi/linux/tc_act/tc_psp.h
new file mode 100644
index 000000000000..e58ebcae77be
--- /dev/null
+++ b/include/uapi/linux/tc_act/tc_psp.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef __LINUX_TC_PSP_H
+#define __LINUX_TC_PSP_H
+
+#include <linux/pkt_cls.h>
+
+#define TCA_PSP_ACT_ENCAP	1	/* attach a PSP association */
+#define TCA_PSP_ACT_DECAP	2	/* drop PSP Rx state */
+
+struct tc_psp {
+	tc_gen;
+};
+
+enum {
+	TCA_PSP_UNSPEC,
+	TCA_PSP_TM,
+	TCA_PSP_PARMS,
+	TCA_PSP_PAD,
+	TCA_PSP_ACTION,		/* u32, TCA_PSP_ACT_* */
+	TCA_PSP_ASSOC_ID,	/* u32, encap only: Tx association ID from
+				 * the PSP netlink family (assoc-add)
+				 */
+	__TCA_PSP_MAX,
+};
+
+#define TCA_PSP_MAX (__TCA_PSP_MAX - 1)
+
+#endif
-- 
2.53.0-Meta

