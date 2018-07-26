From: rostedt@goodmis.org (Steven Rostedt)
Date: Thu, 26 Jul 2018 19:06:10 -0400
Subject: [PATCH 3/7] selftests/ftrace: Add snapshot and tracing_on test case
Message-ID: <20180726230651.763688807@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180726230610.toWtVtlDqdKf60XIuUAtZFx472Ul993CAxrINtlBJ7s@z>

From: Masami Hiramatsu <mhiramat@kernel.org>

Add a testcase for checking snapshot and tracing_on
relationship. This ensures that the snapshotting doesn't
affect current tracing on/off settings.

Link: http://lkml.kernel.org/r/153149932412.11274.15289227592627901488.stgit at devbox

Cc: Tom Zanussi <tom.zanussi at linux.intel.com>
Cc: Hiraku Toyooka <hiraku.toyooka at cybertrust.co.jp>
Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
Cc: Ingo Molnar <mingo at redhat.com>
Cc: Shuah Khan <shuah at kernel.org>
Cc: linux-kselftest at vger.kernel.org
Signed-off-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
---
 .../ftrace/test.d/00basic/snapshot.tc         | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/snapshot.tc

diff --git a/tools/testing/selftests/ftrace/test.d/00basic/snapshot.tc b/tools/testing/selftests/ftrace/test.d/00basic/snapshot.tc
new file mode 100644
index 000000000000..3b1f45e13a2e
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/00basic/snapshot.tc
@@ -0,0 +1,28 @@
+#!/bin/sh
+# description: Snapshot and tracing setting
+# flags: instance
+
+[ ! -f snapshot ] && exit_unsupported
+
+echo "Set tracing off"
+echo 0 > tracing_on
+
+echo "Allocate and take a snapshot"
+echo 1 > snapshot
+
+# Since trace buffer is empty, snapshot is also empty, but allocated
+grep -q "Snapshot is allocated" snapshot
+
+echo "Ensure keep tracing off"
+test `cat tracing_on` -eq 0
+
+echo "Set tracing on"
+echo 1 > tracing_on
+
+echo "Take a snapshot again"
+echo 1 > snapshot
+
+echo "Ensure keep tracing on"
+test `cat tracing_on` -eq 1
+
+exit 0
-- 
2.17.1


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
