From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:20:19 +0900
Subject: [PATCH 22/25] selftests/ftrace: Add function profiling stat testcase
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269401935.3084.14477880989343988808.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727122019.btEI1stfSmlx8LNjniOYZRyCT2tv-a9mbEWI8igshzI@z>

Add a testcase for function profiling per-cpu statistics
interface. There is already func_profile.tc, but that is
mainly focusing on the combination of function-profiler
and function tracer. This testcase ensures trace_stat
per-cpu function statistics is correctly updated.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../ftrace/test.d/ftrace/func_profile_stat.tc      |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc

diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc
new file mode 100644
index 000000000000..1d2440d80ec3
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc
@@ -0,0 +1,23 @@
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
+

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
