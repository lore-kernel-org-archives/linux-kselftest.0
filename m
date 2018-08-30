From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:25:39 +0900
Subject: [PATCH v3 28/28] selftests/ftrace: Add ftrace cpumask testcase
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563913896.29700.6147067496062109284.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180830142539.bj018PAcg4Fw7wTMdE1IPz2Ear2YM0wrAYgzgB-qDJ4@z>

Add a testcase for tracing_cpumask with function tracer.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 Changes in v3:
 - Use nproc instead of /proc/cpuinfo
 - If nproc doesn't exist, use /sys/devices/cpu/cpu*.
 - Save and restore the original cpumask
---
 .../selftests/ftrace/test.d/ftrace/func_cpumask.tc |   42 ++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc

diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc
new file mode 100644
index 000000000000..0e6810743576
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc
@@ -0,0 +1,42 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL2.0
+# description: ftrace - function trace with cpumask
+
+if ! which nproc ; then
+  nproc() {
+    ls -d /sys/devices/system/cpu/cpu[0-9]* | wc -l
+  }
+fi
+
+NP=`nproc`
+
+if [ $NP -eq 1 ] ;then
+  echo "We can not test cpumask on UP environment"
+  exit_unresolved
+fi
+
+ORIG_CPUMASK=`cat tracing_cpumask`
+
+do_reset() {
+  echo $ORIG_CPUMASK > tracing_cpumask
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
