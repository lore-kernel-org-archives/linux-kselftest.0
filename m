From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:41:27 +0900
Subject: [PATCH v2 26/32] selftests/ftrace: Add trace_pipe testcase
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443768729.23257.2645114356784631107.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180816164127.sCoFA5FoimC1Jl_p-K-SyQolac1_IIAqi1weGFqyulc@z>

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
