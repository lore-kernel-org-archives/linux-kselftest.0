From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:21:53 +0900
Subject: [PATCH v3 20/28] selftests/ftrace: Add ringbuffer size changing
 testcase
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563891312.29700.7554628761200928605.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180830142153.UNKFVUu0a6Cs2OyXsZ4PRCbhoQsXtUhzKQ6aGvn7LQ4@z>

Add a testcase for changing ringbuffer size. This tests
not only ringbuffer size but also tests the imbalance
per-cpu buffer size change too.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
---
 Changes in v3:
 - Run test on an instance too.
---
 .../ftrace/test.d/00basic/ringbuffer_size.tc       |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc

diff --git a/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc b/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc
new file mode 100644
index 000000000000..ab70f0077c35
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc
@@ -0,0 +1,22 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Change the ringbuffer size
+# flags: instance
+
+rb_size_test() {
+ORIG=`cat buffer_size_kb`
+
+expr $ORIG / 2 > buffer_size_kb
+
+expr $ORIG \* 2 > buffer_size_kb
+
+echo $ORIG > buffer_size_kb
+}
+
+rb_size_test
+
+: "If per-cpu buffer is supported, imbalance it"
+if [ -d per_cpu/cpu0 ]; then
+  cd per_cpu/cpu0
+  rb_size_test
+fi
