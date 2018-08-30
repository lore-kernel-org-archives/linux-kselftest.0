From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:21:25 +0900
Subject: [PATCH v3 19/28] selftests/ftrace: Add trace_printk sample module test
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563888490.29700.17118928680122552893.stgit@devbox>

Add trace_printk sample module test. This requires to
enable trace_printk.ko module for test.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 Changes in v3:
 - Remove ".ko" extension from modprobe argument.
---
 .../selftests/ftrace/test.d/event/trace_printk.tc  |   27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/event/trace_printk.tc

diff --git a/tools/testing/selftests/ftrace/test.d/event/trace_printk.tc b/tools/testing/selftests/ftrace/test.d/event/trace_printk.tc
new file mode 100644
index 000000000000..b02550b42be9
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/event/trace_printk.tc
@@ -0,0 +1,27 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test trace_printk from module
+
+rmmod trace-printk ||:
+if ! modprobe trace-printk ; then
+  echo "No trace-printk sample module - please make CONFIG_SAMPLE_TRACE_PRINTK=m"
+  exit_unresolved;
+fi
+
+echo "Waiting for irq work"
+sleep 1
+
+grep -q ": This .* trace_bputs" trace
+grep -q ": This .* trace_puts" trace
+grep -q ": This .* trace_bprintk" trace
+grep -q ": This .* trace_printk" trace
+
+grep -q ": (irq) .* trace_bputs" trace
+grep -q ": (irq) .* trace_puts" trace
+grep -q ": (irq) .* trace_bprintk" trace
+grep -q ": (irq) .* trace_printk" trace
+
+grep -q "This is a %s that will use trace_bprintk" printk_formats
+grep -q "(irq) This is a static string that will use trace_bputs" printk_formats
+
+rmmod trace-printk ||:
