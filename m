From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Sat, 24 Feb 2018 14:29:21 +0900
Subject: [PATCH v3 02/18] selftests: ftrace: Add probe event argument syntax
 testcase
In-Reply-To: <151945010287.27508.6226184958678620828.stgit@devbox>
References: <151945010287.27508.6226184958678620828.stgit@devbox>
Message-ID: <151945016181.27508.3999524130112838660.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180224052921.y9HgFs6aUKP9DY__j5UnRL0gv0uFkjVbLHc9AOpFlqs@z>

Add a testcase for probe event argument syntax which
ensures the kprobe_events interface correctly parses
given event arguments.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../ftrace/test.d/kprobe/kprobe_args_syntax.tc     |   97 ++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc
new file mode 100644
index 000000000000..231bcd2c4eb5
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc
@@ -0,0 +1,97 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Kprobe event argument syntax
+
+[ -f kprobe_events ] || exit_unsupported # this is configurable
+
+grep "x8/16/32/64" README > /dev/null || exit_unsupported # version issue
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
+BADSYM="deaqswdefr"
+SYMADDR=0x`grep -w ${GOODSYM} /proc/kallsyms | cut -f 1 -d " "`
+GOODTYPE="x16"
+BADTYPE="y16"
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
+: "Register access"
+test_goodarg ${GOODREG}
+test_badarg ${BADREG}
+
+: "Symbol access"
+test_goodarg "@${GOODSYM}" "@${SYMADDR}" "@${GOODSYM}+10" "@${GOODSYM}-10"
+test_badarg "@" "@${BADSYM}" "@${GOODSYM}*10" "@${GOODSYM}/10" \
+	    "@${GOODSYM}%10" "@${GOODSYM}&10" "@${GOODSYM}|10"
+
+: "Stack access"
+test_goodarg "\$stack" "\$stack0" "\$stack1"
+test_badarg "\$stackp" "\$stack0+10" "\$stack1-10"
+
+: "Retval access"
+echo "r ${PROBEFUNC} \$retval" > kprobe_events
+! echo "p ${PROBEFUNC} \$retval" > kprobe_events
+
+: "Comm access"
+test_goodarg "\$comm"
+
+: "Indirect memory access"
+test_goodarg "+0(${GOODREG})" "-0(${GOODREG})" "+10(\$stack)" \
+	"+0(\$stack1)" "+10(@${GOODSYM}-10)" "+0(+10(+20(\$stack)))"
+test_badarg "+(${GOODREG})" "(${GOODREG}+10)" "-(${GOODREG})" "(${GOODREG})" \
+	"+10(\$comm)" "+0(${GOODREG})+10"
+
+: "Name assignment"
+test_goodarg "varname=${GOODREG}"
+test_badarg "varname=varname2=${GOODREG}"
+
+: "Type syntax"
+test_goodarg "${GOODREG}:${GOODTYPE}"
+test_badarg "${GOODREG}::${GOODTYPE}" "${GOODREG}:${BADTYPE}" \
+	"${GOODTYPE}:${GOODREG}"
+
+: "Combination check"
+
+test_goodarg "\$comm:string" "+0(\$stack):string"
+test_badarg "\$comm:x64" "\$stack:string" "${GOODREG}:string"
+
+echo > kprobe_events

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
