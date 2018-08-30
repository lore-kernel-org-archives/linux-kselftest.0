From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:25:11 +0900
Subject: [PATCH v3 27/28] selftests/ftrace: Add wakeup_rt tracer testcase
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563911084.29700.11577853607938050611.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180830142511.QsRdehb4bAJVjMKPxMuhAoQf_zBOou8yYhhDa8uzAhQ@z>

Add a testcase for wakeup_rt tracer. This requires chrt
command to test.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 Changes in v3:
 - Check "chrt" command exist correctly.
 - Use "wakeup_rt" tracer correctly.
---
 .../selftests/ftrace/test.d/tracer/wakeup_rt.tc    |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/tracer/wakeup_rt.tc

diff --git a/tools/testing/selftests/ftrace/test.d/tracer/wakeup_rt.tc b/tools/testing/selftests/ftrace/test.d/tracer/wakeup_rt.tc
new file mode 100644
index 000000000000..f99b5178e00a
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/tracer/wakeup_rt.tc
@@ -0,0 +1,25 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL2.0
+# description: Test wakeup RT tracer
+
+if ! which chrt ; then
+  echo "chrt is not found. This test requires chrt command."
+  exit_unresolved
+fi
+
+if ! grep -wq "wakeup_rt" available_tracers ; then
+  echo "wakeup_rt tracer is not supported"
+  exit_unsupported
+fi
+
+echo wakeup_rt > current_tracer
+echo 1 > tracing_on
+echo 0 > tracing_max_latency
+
+: "Wakeup a realtime task"
+chrt -f 5 sleep 1
+
+echo 0 > tracing_on
+grep "+ \[[[:digit:]]*\]" trace
+grep "==> \[[[:digit:]]*\]" trace
+
