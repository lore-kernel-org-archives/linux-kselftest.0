From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:22:21 +0900
Subject: [PATCH v3 21/28] selftests/ftrace: Add function profiling stat
 testcase
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563894147.29700.6575031484306159534.stgit@devbox>

Add a testcase for function profiling per-cpu statistics
interface. There is already func_profile.tc, but that is
mainly focusing on the combination of function-profiler
and function tracer. This testcase ensures trace_stat
per-cpu function statistics is correctly updated.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
---
 Changes in v3:
 - Remove the last empty line.
---
 .../ftrace/test.d/ftrace/func_profile_stat.tc      |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc

diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc
new file mode 100644
index 000000000000..0d501058aa75
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc
@@ -0,0 +1,22 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: ftrace - function profiling
+
+[ ! -f function_profile_enabled ] && exit_unsupported
+
+: "Enable function profile"
+echo 1 > function_profile_enabled
+
+: "Profile must be updated"
+cp trace_stat/function0 $TMPDIR/
+( echo "forked"; sleep 1 )
+: "diff returns 0 if there is no difference"
+! diff trace_stat/function0 $TMPDIR/function0
+
+echo 0 > function_profile_enabled
+
+: "Profile must NOT be updated"
+cp trace_stat/function0 $TMPDIR/
+( echo "forked"; sleep 1 )
+: "diff returns 0 if there is no difference"
+diff trace_stat/function0 $TMPDIR/function0
