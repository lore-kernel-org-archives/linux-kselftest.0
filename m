From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:42:52 +0900
Subject: [PATCH v2 29/32] selftests/ftrace: Add wakeup_rt tracer testcase
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443777214.23257.14428652484801816908.stgit@devbox>

Add a testcase for wakeup_rt tracer. This requires chrt
command to test.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../selftests/ftrace/test.d/tracer/wakeup_rt.tc    |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/tracer/wakeup_rt.tc

diff --git a/tools/testing/selftests/ftrace/test.d/tracer/wakeup_rt.tc b/tools/testing/selftests/ftrace/test.d/tracer/wakeup_rt.tc
new file mode 100644
index 000000000000..3f279072ec2d
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/tracer/wakeup_rt.tc
@@ -0,0 +1,25 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL2.0
+# description: Test wakeup RT tracer
+
+if ! which nice ; then
+  echo "chrt is not found. This test requires chrt command."
+  exit_unresolved
+fi
+
+if ! grep -wq "wakeup_rt" available_tracers ; then
+  echo "wakeup_rt tracer is not supported"
+  exit_unsupported
+fi
+
+echo wakeup > current_tracer
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
