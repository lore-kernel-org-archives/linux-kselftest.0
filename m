Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88743E8C55;
	Fri, 17 Jul 2026 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282126; cv=none; b=YoUTJW48W27St1d9juN6bBrX3Xy8EFqVaKijsCuX+SO3HMMOrWstgj5a+4qfFVXKUAfX/hYIXeMoACHORnw62QaXiE1HwlhOHWZyWJwNwHTI5X9++9OD2ani3iaoAd6XMYG31UVhhq3CA/W7Jr+j7/6nLSa78njMiGlLNzn38rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282126; c=relaxed/simple;
	bh=jsbsYpLrNq4V7qq+WOyrPMxgrzakuow/6sMDxaTx2ws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=e6WDaUh7bzlLNU89vrLaAZmDXiFTo5u9fxGWN4v/CmsOy6RtcKZ8G11bkEaR9K0N4fXkhloRVFput0jBawMXOaJdA2m9H6hAzyKjdKd+uBXEtpAXaFIl8p5hWurfJDtlbarHq+KrGCJgJGb85C1OohJIG1o16hx0esxeH7JJXKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 321FF1A021C;
	Fri, 17 Jul 2026 11:55:23 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E94CC1A0212;
	Fri, 17 Jul 2026 11:55:22 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id AE99018000B0;
	Fri, 17 Jul 2026 17:55:20 +0800 (+08)
From: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	horms@kernel.org,
	shuah@kernel.org,
	vladimir.oltean@nxp.com,
	vinicius.gomes@intel.com,
	fejes@inf.elte.hu,
	xiaoliang.yang_1@nxp.com
Subject: [PATCH net-next 3/6] uapi: tc_act: add tc_frer UAPI header
Date: Fri, 17 Jul 2026 17:55:46 +0800
Message-Id: <20260717095549.10565-4-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260717095549.10565-1-xiaoliang.yang_1@nxp.com>
References: <20260717095549.10565-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

Define the netlink attribute layout and enumerations for the FRER tc
action (IEEE 802.1CB Frame Replication and Elimination for Reliability).

The action is split into two functional sub-commands selected by the
TCA_FRER_FUNC attribute:

  TCA_FRER_FUNC_PUSH    - Egress: sequence number generation and R-TAG
                          insertion. The action inserts an R-TAG with
                          the current sequence number into the frame
                          before passing it on. When chained with
                          "action mirred egress mirror", the mirrored
                          copy already carries the R-TAG, so all
                          replicated frames on different egress paths
                          carry the same sequence number without any
                          additional shared state.

  TCA_FRER_FUNC_RECOVER - Ingress: duplicate detection and elimination.
                          Multiple ingress filters can share the same
                          recovery state by referencing the same action
                          index, implementing Sequence Recovery across
                          ports (IEEE 802.1CB Section 7.4.2).
                          When TCA_FRER_RCVY_INDIVIDUAL flag is set,
                          the action uses private per-action state
                          (Individual Recovery, Section 7.5).

Statistics attributes map directly to the managed objects defined in
IEEE 802.1CB Table 10-1.

Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 include/uapi/linux/tc_act/tc_frer.h | 89 +++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 include/uapi/linux/tc_act/tc_frer.h

diff --git a/include/uapi/linux/tc_act/tc_frer.h b/include/uapi/linux/tc_act/tc_frer.h
new file mode 100644
index 000000000000..241e90827e26
--- /dev/null
+++ b/include/uapi/linux/tc_act/tc_frer.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/* Copyright 2026 NXP */
+
+#ifndef __LINUX_TC_FRER_H
+#define __LINUX_TC_FRER_H
+
+#include <linux/pkt_cls.h>
+
+/* Base parameters passed in TCA_FRER_PARMS */
+struct tc_frer {
+	tc_gen;
+};
+
+/**
+ * enum TCA_FRER_* - netlink attributes for the FRER tc action
+ *
+ * @TCA_FRER_FUNC:             Functional sub-command (tc_frer_func).
+ *                             Mandatory.
+ * @TCA_FRER_TAG_TYPE:         Redundancy tag type (tc_frer_tag_type).
+ *                             Mandatory.
+ *
+ * Push-specific attributes (TCA_FRER_FUNC_PUSH):
+ * Recover-specific attributes (TCA_FRER_FUNC_RECOVER):
+ * @TCA_FRER_RCVY_INDIVIDUAL:  Flag. Force Individual Recovery.
+ * @TCA_FRER_RCVY_ALG:         u8. Recovery algorithm (tc_frer_rcvy_alg).
+ * @TCA_FRER_RCVY_HISTORY_LEN: u8. SequenceHistory window size (1-32).
+ *                             Maps to frerSeqRcvyHistoryLength.
+ * @TCA_FRER_RCVY_RESET_MSEC:  u32. Reset timer in milliseconds.
+ *                             0 disables the timer.
+ *                             Maps to frerSeqRcvyResetMSec.
+ * @TCA_FRER_RCVY_TAKE_NO_SEQ: Flag. Accept frames without a redundancy
+ *                             tag and pass them unconditionally.
+ *                             Maps to frerSeqRcvyTakeNoSeq.
+ * @TCA_FRER_RCVY_TAG_POP:     Flag. Remove the redundancy tag from
+ *                             frames that pass the recovery function.
+ *
+ * Read-only statistics (filled on dump, IEEE 802.1CB Table 10-1):
+ * @TCA_FRER_STATS_TAGLESS_PKTS:       frerCpsSeqRcvyTaglessPackets
+ * @TCA_FRER_STATS_OUT_OF_ORDER_PKTS:  frerCpsSeqRcvyOutOfOrderPackets
+ * @TCA_FRER_STATS_ROGUE_PKTS:         frerCpsSeqRcvyRoguePackets
+ * @TCA_FRER_STATS_LOST_PKTS:          frerCpsSeqRcvyLostPackets
+ * @TCA_FRER_STATS_RESETS:             frerCpsSeqRcvyResets
+ * @TCA_FRER_STATS_PASSED_PKTS:        frerCpsSeqRcvyPassedPackets
+ * @TCA_FRER_STATS_DISCARDED_PKTS:     frerCpsSeqRcvyDiscardedPackets
+ * @TCA_FRER_STATS_SEQGEN_PKTS:        frerCpsSeqGenPackets
+ */
+enum {
+	TCA_FRER_UNSPEC,
+	TCA_FRER_TM,                       /* struct tcf_t */
+	TCA_FRER_PARMS,                    /* struct tc_frer */
+	TCA_FRER_PAD,
+	TCA_FRER_FUNC,                     /* u8: tc_frer_func */
+	TCA_FRER_TAG_TYPE,                 /* u8: tc_frer_tag_type */
+	TCA_FRER_RCVY_INDIVIDUAL,          /* NLA_FLAG */
+	TCA_FRER_RCVY_ALG,                 /* u8: tc_frer_rcvy_alg */
+	TCA_FRER_RCVY_HISTORY_LEN,         /* u8: 1-32 */
+	TCA_FRER_RCVY_RESET_MSEC,          /* u32 */
+	TCA_FRER_RCVY_TAKE_NO_SEQ,         /* NLA_FLAG */
+	TCA_FRER_RCVY_TAG_POP,             /* NLA_FLAG */
+	TCA_FRER_STATS_TAGLESS_PKTS,       /* u64 */
+	TCA_FRER_STATS_OUT_OF_ORDER_PKTS,  /* u64 */
+	TCA_FRER_STATS_ROGUE_PKTS,         /* u64 */
+	TCA_FRER_STATS_LOST_PKTS,          /* u64 */
+	TCA_FRER_STATS_RESETS,             /* u64 */
+	TCA_FRER_STATS_PASSED_PKTS,        /* u64 */
+	TCA_FRER_STATS_DISCARDED_PKTS,     /* u64 */
+	TCA_FRER_STATS_SEQGEN_PKTS,        /* u64 */
+	__TCA_FRER_MAX,
+};
+
+#define TCA_FRER_MAX (__TCA_FRER_MAX - 1)
+
+enum tc_frer_func {
+	TCA_FRER_FUNC_PUSH    = 1,
+	TCA_FRER_FUNC_RECOVER = 2,
+};
+
+enum tc_frer_tag_type {
+	TCA_FRER_TAG_RTAG = 1,
+	TCA_FRER_TAG_HSR,
+	TCA_FRER_TAG_PRP,
+};
+
+enum tc_frer_rcvy_alg {
+	TCA_FRER_RCVY_VECTOR_ALG = 0,  /* IEEE 802.1CB 7.4.3.4 */
+	TCA_FRER_RCVY_MATCH_ALG  = 1,  /* IEEE 802.1CB 7.4.3.5 */
+};
+
+#endif /* __LINUX_TC_FRER_H */
-- 
2.17.1

