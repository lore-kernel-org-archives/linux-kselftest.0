From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Wed, 28 Feb 2018 12:20:56 +0900
Subject: [PATCH v4 03/19] selftests: ftrace: Add a testcase for string type
 with kprobe_event
In-Reply-To: <151978796240.2577.6531711990653677529.stgit@devbox>
References: <151978796240.2577.6531711990653677529.stgit@devbox>
Message-ID: <151978805672.2577.11785959630908181780.stgit@devbox>

Add a testcase for string type with kprobe event.
This tests good/bad syntax combinations and also
the traced data is correct in several way.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../ftrace/test.d/kprobe/kprobe_args_string.tc     |   46 ++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
new file mode 100644
index 000000000000..5ba73035e1d9
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
@@ -0,0 +1,46 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Kprobe event string type argument
+
+[ -f kprobe_events ] || exit_unsupported # this is configurable
+
+echo 0 > events/enable
+echo > kprobe_events
+
+case `uname -m` in
+x86_64)
+  ARG2=%si
+  OFFS=8
+;;
+i[3456]86)
+  ARG2=%cx
+  OFFS=4
+;;
+aarch64)
+  ARG2=%x1
+  OFFS=8
+;;
+arm*)
+  ARG2=%r1
+  OFFS=4
+;;
+*)
+  echo "Please implement other architecture here"
+  exit_untested
+esac
+
+: "Test get argument (1)"
+echo "p:testprobe create_trace_kprobe arg1=+0(+0(${ARG2})):string" > kprobe_events
+echo 1 > events/kprobes/testprobe/enable
+! echo test >> kprobe_events
+tail -n 1 trace | grep -qe "testprobe.* arg1=\"test\""
+
+echo 0 > events/kprobes/testprobe/enable
+: "Test get argument (2)"
+echo "p:testprobe create_trace_kprobe arg1=+0(+0(${ARG2})):string arg2=+0(+${OFFS}(${ARG2})):string" > kprobe_events
+echo 1 > events/kprobes/testprobe/enable
+! echo test1 test2 >> kprobe_events
+tail -n 1 trace | grep -qe "testprobe.* arg1=\"test1\" arg2=\"test2\""
+
+echo 0 > events/enable
+echo > kprobe_events

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
