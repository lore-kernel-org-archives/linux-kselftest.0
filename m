From: joel at joelfernandes.org (Joel Fernandes)
Date: Tue, 10 Jul 2018 10:44:49 -0700
Subject: [PATCH] trace: Add SPDX-License-Identifier to trace_preemptirq.c
Message-ID: <20180710174449.110865-1-joel@joelfernandes.org>

From: "Joel Fernandes (Google)" <joel at joelfernandes.org>

This patch adds a SPDX-License-Identifier to trace_preemptirq.c.

Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
This patch is based on top of the v9 posting of "Centralize and unify
usage of preempt/irq tracepoints": https://lkml.org/lkml/2018/6/28/643

 kernel/trace/trace_preemptirq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/trace_preemptirq.c b/kernel/trace/trace_preemptirq.c
index dc01c7f4d326..13e2c6e99465 100644
--- a/kernel/trace/trace_preemptirq.c
+++ b/kernel/trace/trace_preemptirq.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * preemptoff and irqoff tracepoints
  *
-- 
2.18.0.203.gfac676dfb9-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
