From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:42:24 +0900
Subject: [PATCH v2 28/32] selftests/ftrace: Add wakeup tracer testcase
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443774392.23257.2139128794837049841.stgit@devbox>

Add a testcase for wakeup tracer.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 tools/testing/selftests/ftrace/config              |    1 +
 .../selftests/ftrace/test.d/tracer/wakeup.tc       |   25 ++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/tracer/wakeup.tc

diff --git a/tools/testing/selftests/ftrace/config b/tools/testing/selftests/ftrace/config
index b7ac74fcb0fa..c2c8de4fafff 100644
--- a/tools/testing/selftests/ftrace/config
+++ b/tools/testing/selftests/ftrace/config
@@ -4,6 +4,7 @@ CONFIG_FUNCTION_PROFILER=y
 CONFIG_TRACER_SNAPSHOT=y
 CONFIG_STACK_TRACER=y
 CONFIG_HIST_TRIGGERS=y
+CONFIG_SCHED_TRACER=y
 CONFIG_PREEMPT_TRACER=y
 CONFIG_IRQSOFF_TRACER=y
 CONFIG_PREEMPTIRQ_DELAY_TEST=m
diff --git a/tools/testing/selftests/ftrace/test.d/tracer/wakeup.tc b/tools/testing/selftests/ftrace/test.d/tracer/wakeup.tc
new file mode 100644
index 000000000000..e3005fa785f0
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/tracer/wakeup.tc
@@ -0,0 +1,25 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL2.0
+# description: Test wakeup tracer
+
+if ! which chrt ; then
+  echo "chrt is not found. This test requires nice command."
+  exit_unresolved
+fi
+
+if ! grep -wq "wakeup" available_tracers ; then
+  echo "wakeup tracer is not supported"
+  exit_unsupported
+fi
+
+echo wakeup > current_tracer
+echo 1 > tracing_on
+echo 0 > tracing_max_latency
+
+: "Wakeup higher priority task"
+chrt -f 5 sleep 1
+
+echo 0 > tracing_on
+grep '+ \[[[:digit:]]*\]' trace
+grep '==> \[[[:digit:]]*\]' trace
+
