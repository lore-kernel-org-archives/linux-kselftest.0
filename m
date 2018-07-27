From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:17:30 +0900
Subject: [PATCH 16/25] selftests/ftrace: Add kprobe event with $comm argument
 testcase
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269385013.3084.40420930286341307.stgit@devbox>

Add kprobe-event with $comm argument testcase to
ftracetest. This not only checks syntax but
also checks log file.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../ftrace/test.d/kprobe/kprobe_args_comm.tc       |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_comm.tc

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_comm.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_comm.tc
new file mode 100644
index 000000000000..15c1f70fcaf9
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_comm.tc
@@ -0,0 +1,17 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Kprobe event with comm arguments
+
+[ -f kprobe_events ] || exit_unsupported # this is configurable
+
+grep -A1 "fetcharg:" README | grep -q "\$comm" || exit_unsupported # this is too old
+
+echo 'p:testprobe _do_fork comm=$comm ' > kprobe_events
+grep testprobe kprobe_events | grep -q 'comm=$comm'
+test -d events/kprobes/testprobe
+
+echo 1 > events/kprobes/testprobe/enable
+( echo "forked")
+grep testprobe trace | grep -q 'comm=".*"'
+
+exit 0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
