From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:22:49 +0900
Subject: [PATCH v3 22/28] selftests/ftrace: Add max stack tracer testcase
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563896959.29700.11240549305697395476.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180830142249.RmrnnhFSMwUbGhGJe0DzUesJt6matGan2uBV8Y32wII@z>

Add a testcase for max stack tracer, which checks basic
max stack usage tracing and its filter feature.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../ftrace/test.d/ftrace/func_stack_tracer.tc      |   39 ++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_stack_tracer.tc

diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func_stack_tracer.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func_stack_tracer.tc
new file mode 100644
index 000000000000..b414f0e3c646
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func_stack_tracer.tc
@@ -0,0 +1,39 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: ftrace - Max stack tracer
+# Test the basic function of max-stack usage tracing
+
+if [ ! -f stack_trace ]; then
+  echo "Max stack tracer is not supported - please make CONFIG_STACK_TRACER=y"
+  exit_unsupported
+fi
+
+echo > stack_trace_filter
+echo 0 > stack_max_size
+echo 1 > /proc/sys/kernel/stack_tracer_enabled
+
+: "Fork and wait for the first entry become !lock"
+timeout=10
+while [ $timeout -ne 0 ]; do
+  ( echo "forked" )
+  FL=`grep " 0)" stack_trace`
+  echo $FL | grep -q "lock" || break;
+  timeout=$((timeout - 1))
+done
+echo 0 > /proc/sys/kernel/stack_tracer_enabled
+
+echo '*lock*' > stack_trace_filter
+test `cat stack_trace_filter | wc -l` -eq `grep lock stack_trace_filter | wc -l`
+
+echo 0 > stack_max_size
+echo 1 > /proc/sys/kernel/stack_tracer_enabled
+
+: "Fork and always the first entry including lock"
+timeout=10
+while [ $timeout -ne 0 ]; do
+  ( echo "forked" )
+  FL=`grep " 0)" stack_trace`
+  echo $FL | grep -q "lock"
+  timeout=$((timeout - 1))
+done
+echo 0 > /proc/sys/kernel/stack_tracer_enabled
