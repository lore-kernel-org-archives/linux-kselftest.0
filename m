From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Mon,  3 Sep 2018 18:55:57 +0200
Subject: [PATCH 4.9 033/107] selftests/ftrace: Add snapshot and tracing_on
 test case
In-Reply-To: <20180903165637.293735109@linuxfoundation.org>
References: <20180903165637.293735109@linuxfoundation.org>
Message-ID: <20180903165638.885613025@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180903165557.xK2SwJ7w4zd9XbB2SSccKn4owskvG5TLsBVbbL1l25U@z>

4.9-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Masami Hiramatsu <mhiramat@kernel.org>

[ Upstream commit 82f4f3e69c5c29bce940dd87a2c0f16c51d48d17 ]

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
Signed-off-by: Sasha Levin <alexander.levin at microsoft.com>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
---
 tools/testing/selftests/ftrace/test.d/00basic/snapshot.tc |   28 ++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/snapshot.tc

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
