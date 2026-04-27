Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2F53B9601;
	Mon, 27 Apr 2026 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291451; cv=none; b=d65FpXQoDWQUtPrNrp9SDZh2EOynXFUmbw9NjrNAkNhVXDNokvgmgFRApc6etzGIYi3qR2YlpQm3x6Btj8AxKyoGwRCxgEB/FecSCPbOrd8DyO6XnVt4xyR/fU1JKxQDseOzCBtfcFzWacbZSyuAbDtoRLYENi+Fxji7VdfATNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291451; c=relaxed/simple;
	bh=W1D5lSXRtEDeQjde+9XAOouOpPIYvgXYBK0Xv65p3K0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jbCJePvn0i239XG3riG53birYo4WH6WhCfuMbzBRKe+e5Kxb6gNF6qVLV5wZoTRxd+65kQDXxVGwfPVMIydAkvO/ZjtVH9QfnVZXJfXygUADWrvBNd628+hYO55JUOvKBDSVxAdPO+OVhPWeLcvywgmE06YJCKG8vRzS91nWlqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FrcRXtyo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FrcRXtyo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA2391684;
	Mon, 27 Apr 2026 05:04:03 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA1BE3F62B;
	Mon, 27 Apr 2026 05:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777291449; bh=W1D5lSXRtEDeQjde+9XAOouOpPIYvgXYBK0Xv65p3K0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FrcRXtyoVN+V5QnRWUBcPP11+5QJboDFs/HJ+cJcNWlVL73mrj0coeJAWyJ6c00lz
	 Ma1oL+zHBHNZpHbpiurhIeqZM4hAmR80fUOAiPEn+krHPySnbUvDCwR0rEMf0VARDX
	 NM2JVBbf7eizQct9FKyZ/R6dTUecIOJ7Qf9bSXmg=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Mon, 27 Apr 2026 13:03:37 +0100
Subject: [PATCH v2 5/5] kselftest/arm64: Add tests for POR_EL0
 save/reset/restore
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-poe_signal-v2-5-2bd9d6f16ab4@arm.com>
References: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
In-Reply-To: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777291437; l=5057;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=W1D5lSXRtEDeQjde+9XAOouOpPIYvgXYBK0Xv65p3K0=;
 b=5XkTdq3N2XGqgMLfy65UGbovi8wThCf1OhK2p3M89xXvnTmO/hRQNDs1NU+gdq2uzLZO9C9BO
 laUnaCvsYZCATe6H8kHpDgAZSU5TxOL+f0VbJZHTFkICzz6VO6ioq6C
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=

POR_EL0 is expected to be:
- Saved in the poe_context record
- Reset to POR_EL0_INIT when invoking the signal handler
- Restored from poe_context when returning from the signal handler

Add a new test, poe_restore, to check that the save/reset/restore
mechanism is working as intended. See commit 2e8a1acea859 ("arm64:
signal: Improve POR_EL0 handling to avoid uaccess failures") for
more details.

This commit did not handle the case where poe_context is missing
correctly. This was recently fixed; add a new test,
poe_missing_poe_context, to check this case.

Note: td->pass is only set to true at the very end, as an unexpected
signal may occur in case of failure (especially in
poe_missing_poe_context if POR_EL0 is restored to an invalid value).
Failures are tracked with a global, failed_check.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 .../signal/testcases/poe_missing_poe_context.c     | 73 ++++++++++++++++++++++
 .../selftests/arm64/signal/testcases/poe_restore.c | 64 +++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/testcases/poe_missing_poe_context.c b/tools/testing/selftests/arm64/signal/testcases/poe_missing_poe_context.c
new file mode 100644
index 000000000000..3f22d8cf6106
--- /dev/null
+++ b/tools/testing/selftests/arm64/signal/testcases/poe_missing_poe_context.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Arm Ltd
+ *
+ * Verify that the POR_EL0 register is left untouched on sigreturn if the
+ * POE frame record is missing.
+ */
+
+#include <asm/sigcontext.h>
+
+#include "test_signals_utils.h"
+#include "testcases.h"
+
+#define POR_EL0_INIT	0x07ul
+#define POR_EL0_CUSTOM	0x77ul
+
+static bool failed_check;
+
+static bool modify_por_el0(struct tdescr *td)
+{
+	set_por_el0(POR_EL0_CUSTOM);
+
+	return true;
+}
+
+static int signal_remove_poe_context(struct tdescr *td, siginfo_t *si,
+				      ucontext_t *uc)
+{
+	struct _aarch64_ctx *ctx = GET_UC_RESV_HEAD(uc);
+	size_t resv_size = GET_UCP_RESV_SIZE(uc);
+	struct _aarch64_ctx *poe_ctx_head;
+
+	poe_ctx_head = get_header(ctx, POE_MAGIC, resv_size, NULL);
+	if (!poe_ctx_head) {
+		fprintf(stderr, "Missing poe_context record\n");
+		failed_check = true;
+		return 0;
+	}
+
+	/*
+	 * Actually removing the record would require moving down the next
+	 * records. An easier option is to turn it into an ESR record, which is
+	 * ignored by sigreturn().
+	 */
+	poe_ctx_head->magic = ESR_MAGIC;
+
+	return 0;
+}
+
+static void check_por_el0_preserved(struct tdescr *td)
+{
+	uint64_t por_el0 = get_por_el0();
+
+	if (por_el0 == POR_EL0_INIT) {
+		fprintf(stderr, "POR_EL0 preserved\n");
+	} else {
+		fprintf(stderr, "POR_EL0 unexpectedly set to %lx\n", por_el0);
+		failed_check = true;
+	}
+
+	td->pass = !failed_check;
+}
+
+struct tdescr tde = {
+	.name = "POR_EL0 missing poe_context",
+	.descr = "Remove poe_context record and check POR_EL0 is preserved",
+	.feats_required = FEAT_POE,
+	.timeout = 3,
+	.sig_trig = SIGUSR1,
+	.init = modify_por_el0,
+	.run = signal_remove_poe_context,
+	.check_result = check_por_el0_preserved,
+};
diff --git a/tools/testing/selftests/arm64/signal/testcases/poe_restore.c b/tools/testing/selftests/arm64/signal/testcases/poe_restore.c
new file mode 100644
index 000000000000..9f9a61a4214d
--- /dev/null
+++ b/tools/testing/selftests/arm64/signal/testcases/poe_restore.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Arm Ltd
+ *
+ * Verify that the POR_EL0 register is saved and restored as expected on signal
+ * entry/return.
+ */
+
+#include <asm/sigcontext.h>
+
+#include "test_signals_utils.h"
+#include "testcases.h"
+
+#define POR_EL0_INIT	0x07ul
+#define POR_EL0_CUSTOM	0x77ul
+
+static bool failed_check;
+
+static bool modify_por_el0(struct tdescr *td)
+{
+	set_por_el0(POR_EL0_CUSTOM);
+
+	return true;
+}
+
+static int signal_check_por_el0_reset(struct tdescr *td, siginfo_t *si,
+				      ucontext_t *uc)
+{
+	uint64_t signal_por_el0 = get_por_el0();
+
+	if (signal_por_el0 != POR_EL0_INIT) {
+		fprintf(stderr, "POR_EL0 is %lx in signal handler (expected %lx)\n",
+			signal_por_el0, POR_EL0_INIT);
+		failed_check = true;
+	}
+
+	return 0;
+}
+
+static void check_por_el0_restored(struct tdescr *td)
+{
+	uint64_t por_el0 = get_por_el0();
+
+	if (por_el0 == POR_EL0_CUSTOM) {
+		fprintf(stderr, "POR_EL0 restored\n");
+	} else {
+		fprintf(stderr, "POR_EL0 was %lx but is now %lx\n",
+			POR_EL0_CUSTOM, por_el0);
+		failed_check = true;
+	}
+
+	td->pass = !failed_check;
+}
+
+struct tdescr tde = {
+	.name = "POR_EL0 restore",
+	.descr = "Validate that POR_EL0 is saved/restored on signal entry/return",
+	.feats_required = FEAT_POE,
+	.timeout = 3,
+	.sig_trig = SIGUSR1,
+	.init = modify_por_el0,
+	.run = signal_check_por_el0_reset,
+	.check_result = check_por_el0_restored,
+};

-- 
2.51.2

