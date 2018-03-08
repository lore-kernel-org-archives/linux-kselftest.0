From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Thu,  8 Mar 2018 17:51:49 +0900
Subject: [PATCH v5 18/19] selftests: ftrace: Add a testcase for $argN with
 kprobe_event
In-Reply-To: <152049860385.7289.14079393589900496424.stgit@devbox>
References: <152049860385.7289.14079393589900496424.stgit@devbox>
Message-ID: <152049910927.7289.5675699018820188003.stgit@devbox>

Add a testcase for $argN with kprobe event.
This tests whether the traced data is correct or not.
If the kernel doesn't support $argN (depends on arch),
it skips the test as UNSUPPORTED.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 Changes in v5:
  - Fix description.
---
 .../ftrace/test.d/kprobe/kprobe_args_argN.tc       |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_argN.tc

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_argN.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_argN.tc
new file mode 100644
index 000000000000..d5c5c8c3a51e
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_argN.tc
@@ -0,0 +1,25 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Kprobe event argN argument
+
+[ -f kprobe_events ] || exit_unsupported # this is configurable
+
+grep -q "arg<N>" README || exit_unsupported # version issue
+
+echo 0 > events/enable
+echo > kprobe_events
+
+: "Test bad pattern : arg0 is not allowed"
+! echo 'p:testprobe create_trace_kprobe $arg0' > kprobe_events
+
+: "Test get argument"
+echo 'p:testprobe create_trace_kprobe $arg1' > kprobe_events
+echo 1 > events/kprobes/testprobe/enable
+! echo test >> kprobe_events
+tail -n 1 trace | grep -qe "testprobe.* arg1=0x1"
+
+! echo test test test >> kprobe_events
+tail -n 1 trace | grep -qe "testprobe.* arg1=0x3"
+
+echo 0 > events/enable
+echo > kprobe_events

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
