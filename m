From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:21:15 +0900
Subject: [PATCH 24/25] selftests/ftrace: Add function filter on module testcase
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269407573.3084.7094692039202784902.stgit@devbox>

Add a testcase for function filter on module.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../ftrace/test.d/ftrace/func_mod_trace.tc         |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_mod_trace.tc

diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func_mod_trace.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func_mod_trace.tc
new file mode 100644
index 000000000000..359380c3834f
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
+if ! modprobe trace-printk.ko ; then
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

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
