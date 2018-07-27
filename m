From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:19:51 +0900
Subject: [PATCH 21/25] selftests/ftrace: Add ringbuffer size changing testcase
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269399108.3084.13255857156285716199.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727121951.BvSkui3zzAQBrmtKfiSiFQrO7Dp6d4KfsBDOZZ9sFTU@z>

Add a testcase for changing ringbuffer size. This tests
not only ringbuffer size but also tests the imbalance
per-cpu buffer size change too.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../ftrace/test.d/00basic/ringbuffer_size.tc       |   21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc

diff --git a/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc b/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc
new file mode 100644
index 000000000000..9224f33b3194
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc
@@ -0,0 +1,21 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Change the ringbuffer size
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

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
