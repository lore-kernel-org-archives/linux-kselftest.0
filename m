From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:43:20 +0900
Subject: [PATCH v2 30/32] selftests/ftrace: Add ftrace cpumask testcase
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443780039.23257.5243924038958174104.stgit@devbox>

Add a testcase for tracing_cpumask with function tracer.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../selftests/ftrace/test.d/ftrace/func_cpumask.tc |   34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc

diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc
new file mode 100644
index 000000000000..37420e355445
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc
@@ -0,0 +1,34 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL2.0
+# description: ftrace - function trace with cpumask
+
+NP=`grep "^processor" /proc/cpuinfo | wc -l`
+
+if [ $NP -eq 1 ] ;then
+  echo "We can not test cpumask on UP environment"
+  exit_unresolved
+fi
+
+do_reset() {
+  echo ffff > tracing_cpumask
+}
+
+echo 0 > tracing_on
+echo > trace
+: "Bitmask only record on CPU1"
+echo 2 > tracing_cpumask
+MASK=0x`cat tracing_cpumask`
+test `printf "%d" $MASK` -eq 2 || do_reset
+
+echo function > current_tracer
+echo 1 > tracing_on
+(echo "forked")
+echo 0 > tracing_on
+
+: "Check CPU1 events are recorded"
+grep -q -e "\[001\]" trace || do_reset
+
+: "There should be No other cpu events"
+! grep -qv -e "\[001\]" -e "^#" trace || do_reset
+
+do_reset
