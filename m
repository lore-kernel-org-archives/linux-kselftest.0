From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Thu,  8 Mar 2018 17:51:20 +0900
Subject: [PATCH v5 17/19] selftests: ftrace: Add a testcase for symbol type
In-Reply-To: <152049860385.7289.14079393589900496424.stgit@devbox>
References: <152049860385.7289.14079393589900496424.stgit@devbox>
Message-ID: <152049908037.7289.10781368517931604646.stgit@devbox>

Add a testcase for symbol type with kprobe event.
This tests good/bad syntax combinations and also
the traced data.
If the kernel doesn't support symbol type, it skips
the test as UNSUPPORTED.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 Changes in v3:
  - Use IP/PC register to test the symbol type
---
 .../ftrace/test.d/kprobe/kprobe_args_symbol.tc     |   77 ++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc
new file mode 100644
index 000000000000..20a8664a838b
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc
@@ -0,0 +1,77 @@
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
+REG=
+GOODSYM="_sdata"
+if ! grep -qw ${GOODSYM} /proc/kallsyms ; then
+  GOODSYM=$PROBEFUNC
+fi
+
+case `uname -m` in
+x86_64|i[3456]86)
+  GOODREG=%ax
+  BADREG=%ex
+  REG=%ip
+;;
+aarch64)
+  GOODREG=%x0
+  BADREG=%ax
+  REG=%pc
+;;
+arm*)
+  GOODREG=%r0
+  BADREG=%ax
+  REG=%pc
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
+echo "p:testprobe create_trace_kprobe ${REG}:symbol" > kprobe_events
+echo 1 > events/kprobes/testprobe/enable
+! echo test >> kprobe_events
+tail -n 1 trace | grep -q "arg1=create_trace_kprobe"
+
+echo 0 > events/enable
+echo > kprobe_events

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
