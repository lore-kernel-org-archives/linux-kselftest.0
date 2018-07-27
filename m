From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:21:54 +0900
Subject: [PATCH 25/25] selftests/ftrace: Add trace_pipe testcase
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269411396.3084.11842883301653040754.stgit@devbox>

Add a simple testcase for trace_pipe which can consume
ringbuffer.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../selftests/ftrace/test.d/00basic/trace_pipe.tc  |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/trace_pipe.tc

diff --git a/tools/testing/selftests/ftrace/test.d/00basic/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/00basic/trace_pipe.tc
new file mode 100644
index 000000000000..a7dd6fda487a
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/00basic/trace_pipe.tc
@@ -0,0 +1,15 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: trace_pipe and trace_marker
+
+[ ! -f trace_marker ] && exit_unsupported
+
+echo "test input 1" > trace_marker
+
+: "trace interface never consume the ring buffer"
+grep -q "test input 1" trace
+grep -q "test input 1" trace
+
+: "trace interface never consume the ring buffer"
+head -n 1 trace_pipe | grep -q "test input 1"
+! grep -q "test input 1" trace

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
