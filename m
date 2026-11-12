Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511487;
	b=LkT89LfHwNla0I7ZdAMR4aByw+kGDhlVE+lsdLPJLqJluIX9IE8Iwz7WTueT7SUbuovM
	 GRrLHkL6N8TVkPOfFqk6yb+38O8J0ZpQZgG6GG5K1gr+vyV1VqZSB8qALkE0vR7I0RJFs
	 jOtcdb6VJNv39+VtuKF/TMJQcEHkWNZmdYX9z2B6enh5iFmxbB/l9sls/VTwHDz+tp5ek
	 HpMvZy70tos9iZAhq/q8bV9Sf7bhHDI6b9+OFZYUQNAznYsK/LBXmjgpOBztLSo+1XDlO
	 zGjYPOQs5KQZwLPwYItOv60/ZXujHQ1ugWgW8+9LkPXu7MkyWhJCI/TgWZD5WL3UTaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=1BKF3khwmpUN5sqTMrZBSuOst0FYDPzt+ACzs2r3QGg=;
	b=3kPyY8XF+qOTvyS9rY0uRgKxE6ju/QMussp/U8Wnu/VftG7LHYuG4COfiKmKIjbyqOcG
	 /dsb0ygCEC/8XCJR2r22B+FPhpeLUSVhv30r/vDgM/WXgd28aema2UUDEC5mhRWT31JeY
	 1kewuiqWS9CAvSG8D9mV1NYPD37mKg1RuZ2nO/7vuF63Js+krKuxcnrhLEfZmERfWp6Nt
	 e5J6ldthl2wW73+GniFf6cgLt0uv29HLLjtG+8cZvjLUkWIbpXffIK953alq/e6JeidGZ
	 CqkQkqlm6WWFjmVDza5NwN+q9g2AqpWz9MnTi7VJLYrDJee6EzB0jvHgv5e7/C+mFPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Olhbar81;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A02D606A31C;
	Thu, 12 Nov 2026 19:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A02D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Olhbar81
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFaiA13764456;
	Thu, 12 Nov 2026 11:24:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=1BKF3khwmpUN5sqTMrZBSuOst0FYDPzt+ACzs
	2r3QGg=; b=Olhbar81SCxujXN+HyT/jcNmRL50ziqo9ifec94+9ckZKgTwpAZGe
	lHRLOLZDgT1mXkMgenXj1jPmv8Jr+2eq60oSEnYzJI/u2tZZYIXhKBS4q4Dxven9
	QZVb42fexDd9VK/CRwzEvFUIzqiMs2KC/DQZXSfUj9LPA4xcjM2KEW+Ji27fWUms
	0KPc7NGjnjEc7vIiiXri+5h5FXwoyuDMyPbWfSPrzSnvpQ9oo27Dnjy/lJvun1AP
	2n53odjzEsEyZlPresb2xkJnGyiwJhiDIT0XK5h/KM22XhyXVaIV7idaRZZwqbaT
	njV+HUZ5dvz6PNdSGZ/mKpc6pUX2ip2NQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hw101y32s-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Nov 2026 11:24:41 -0800 (PST)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 12 Nov
 2026 19:24:32 +0000
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
Subject: [PATCH iproute2-next v2 1/3] uapi: add the tc psp action and flower psp keys
Date: Thu, 12 Nov 2026 11:24:24 -0800
Message-ID: <20261112192426.397604-2-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112192426.397604-1-toddfreed@meta.com>
References: <20261112192426.397604-1-toddfreed@meta.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3NyBTYWx0ZWRfX0Oc7CvCXZxsh
 NoZPOySGsQtGyyZ9QVv1smdJpX5C6zs9+8KcmljSN54Nzw0A0duvExasWm+RHm0AHwTgUsFO0G0
 XyfXSGns0RWtmdCxHfqZZnk2LvZlZfk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3NyBTYWx0ZWRfX1CM0mYZo2la4
 qVVmpynopEU5gFoENqafCUJ1zv/i+bxy2ZT1SVUGbZgFFA49/0cJQAqh59cB9PGCjBhfHeF0FEA
 bAxnlL+O0epf5VrYrCJJHaR0L/bfVkdIex+XdL06aJQ5JLroUNfQI+FxD7/RgGDMYMgfIHCwW4T
 y3g3LKS5vLdbxXGYSuFt1kC/kSek5L8c2+ZnLFxjlIPij4D7ZdkDysowHcgACbLhRE9Tf7CMJkd
 PgTKFMnOHO6frU4RBUfYiZzo7yZzm+8M2J6Wc0MbhY9hAB4sPzLA5ijsbTsaWFoJSaE7K0jG81Q
 ERB3fN1Kws+tabBUTu9i8Znu2Ilp636qv1OwlyfMQvhc07lsPNHd+eHpB/dq0j9XNO4d57/7uMb
 oyDd3iGOVFgN5nLQxg7OaAmTTN5i9rNqXpGEQx/dPOZhV9y0JmjOd/r9ANOszxTfBerW50fo2kX
 AkbfxaalAWRtc4gfuKw==
X-Proofpoint-ORIG-GUID: 5sgmq6Y-tfja7RYrR2tyOoII11jiKZu9
X-Authority-Analysis: v=2.4 cv=HaaB3SE8 c=1 sm=1 tr=0 ts=6af61279 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=tpM8CJlwf7uhpglF1g9U:22 a=VabnemYjAAAA:8 a=77E0MKRPQ49qbxylU5wA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: 5sgmq6Y-tfja7RYrR2tyOoII11jiKZu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01

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

