From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:23:18 +0900
Subject: [PATCH v3 23/28] selftests/ftrace: Add function filter on module
 testcase
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563899783.29700.7635341988251188583.stgit@devbox>

Add a testcase for function filter on module.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 Changes in v3:
 - Remove ".ko" extension from modprobe argument.
---
 .../ftrace/test.d/ftrace/func_mod_trace.tc         |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_mod_trace.tc

diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func_mod_trace.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func_mod_trace.tc
new file mode 100644
index 000000000000..9330c873f9fe
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func_mod_trace.tc
@@ -0,0 +1,24 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: ftrace - function trace on module
+
+[ ! -f set_ftrace_filter ] && exit_unsupported
+
+: "mod: allows to filter a non exist function"
+echo 'non_exist_func:mod:non_exist_module' > set_ftrace_filter
+grep -q "non_exist_func" set_ftrace_filter
+
+: "mod: on exist module"
+echo '*:mod:trace_printk' > set_ftrace_filter
+if ! modprobe trace-printk ; then
+  echo "No trace-printk sample module - please make CONFIG_SAMPLE_TRACE_PRINTK=
+m"
+  exit_unresolved;
+fi
+
+: "Wildcard should be resolved after loading module"
+grep -q "trace_printk_irq_work" set_ftrace_filter
+
+: "After removing the filter becomes empty"
+rmmod trace_printk
+test `cat set_ftrace_filter | wc -l` -eq 0
