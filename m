From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:18:26 +0900
Subject: [PATCH 18/25] selftests/ftrace: Add a testcase for nop tracer
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269390651.3084.11003353154583064083.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727121826.2GCi9tEqLk2B1XBCK_D5aaAiT-juBFMuZRgnsCJ5FlY@z>

Add a testcase for nop tracer. This tracer has 2 test
options, so check it too.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../testing/selftests/ftrace/test.d/tracer/nop.tc  |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/tracer/nop.tc

diff --git a/tools/testing/selftests/ftrace/test.d/tracer/nop.tc b/tools/testing/selftests/ftrace/test.d/tracer/nop.tc
new file mode 100644
index 000000000000..ca63e316e0f5
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/tracer/nop.tc
@@ -0,0 +1,22 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test nop tracer
+
+# nop must be supported always
+grep -q "nop" available_tracers
+
+echo "nop" > current_tracer
+
+# nop provides 2 test options
+grep -q "test_nop_accept" trace_options
+grep -q "test_nop_refuse" trace_options
+
+# nop_accept always success
+echo "test_nop_accept" > trace_options
+echo "notest_nop_accept" > trace_options
+
+# nop_refuse always failed
+! echo "test_nop_refuse" > trace_options
+! echo "notest_nop_refuse" > trace_options
+
+exit 0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
