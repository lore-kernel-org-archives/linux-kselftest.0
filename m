From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 22 Feb 2018 00:01:29 +0900
Subject: [PATCH v2 15/17] selftests: ftrace: Add a testcase for symbol type
In-Reply-To: <151922484560.6217.1143686155616343906.stgit@devbox>
References: <151922484560.6217.1143686155616343906.stgit@devbox>
Message-ID: <151922528927.6217.272823645130675841.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180221150129.hg6L3g27cPWHNJNXqnixyZyhPlDSa0Np5O1yzQsHuvU@z>

Add a testcase for symbol type with kprobe event.
This tests good/bad syntax combinations and also
the traced data.
If the kernel doesn't support symbol type, it skips
the test as UNSUPPORTED.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../ftrace/test.d/kprobe/kprobe_args_symbol.tc     |   73 ++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc
new file mode 100644
index 000000000000..a5820b175df5
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc
@@ -0,0 +1,73 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Kprobe event argument symbol type
+
+[ -f kprobe_events ] || exit_unsupported # this is configurable
+
+grep -qe "type:.* symbol" README || exit_unsupported # version issue
+
+echo 0 > events/enable
+echo > kprobe_events
+
+PROBEFUNC="vfs_read"
+GOODREG=
+BADREG=
+GOODSYM="_sdata"
+if ! grep -qw ${GOODSYM} /proc/kallsyms ; then
+  GOODSYM=$PROBEFUNC
+fi
+
+case `uname -m` in
+x86_64|i[3456]86)
+  GOODREG=%ax
+  BADREG=%ex
+;;
+aarch64)
+  GOODREG=%x0
+  BADREG=%ax
+;;
+arm*)
+  GOODREG=%r0
+  BADREG=%ax
+;;
+*)
+  echo "Please implement other architecture here"
+  exit_untested
+esac
+
+test_goodarg() # Good-args
+{
+  while [ "$1" ]; do
+    echo "p ${PROBEFUNC} $1" > kprobe_events
+    shift 1
+  done;
+}
+
+test_badarg() # Bad-args
+{
+  while [ "$1" ]; do
+    ! echo "p ${PROBEFUNC} $1" > kprobe_events
+    shift 1
+  done;
+}
+
+echo > kprobe_events
+
+: "Symbol type"
+test_goodarg "${GOODREG}:symbol" "@${GOODSYM}:symbol" "@${GOODSYM}+10:symbol" \
+	 "\$stack0:symbol" "+0(\$stack):symbol"
+test_badarg "\$comm:symbol"
+
+: "Retval with symbol type"
+echo "r ${PROBEFUNC} \$retval:symbol" > kprobe_events
+
+echo > kprobe_events
+
+: "Test get symbol"
+echo 'p:testprobe create_trace_kprobe $stack0:symbol' > kprobe_events
+echo 1 > events/kprobes/testprobe/enable
+! echo test >> kprobe_events
+tail -n 1 trace | grep -q "arg1=trace_run_command"
+
+echo 0 > events/enable
+echo > kprobe_events

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
