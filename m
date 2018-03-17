From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Sat, 17 Mar 2018 21:51:35 +0900
Subject: [PATCH v6 19/21] selftests: ftrace: Add a testcase for array type
 with kprobe_event
In-Reply-To: <152129024033.31874.15800253385376959274.stgit@devbox>
References: <152129024033.31874.15800253385376959274.stgit@devbox>
Message-ID: <152129109566.31874.6546174329596347746.stgit@devbox>

Add a testcase for array type with kprobe event.
This tests good/bad syntax combinations and also
the traced data is correct in several way.
If the kernel doesn't support array type, it skips
the test as UNSUPPORTED.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 Changes in v4:
  - Add format field tests.
---
 .../ftrace/test.d/kprobe/kprobe_args_array.tc      |   92 ++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_array.tc

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_array.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_array.tc
new file mode 100644
index 000000000000..0d0450b858fc
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_array.tc
@@ -0,0 +1,92 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Kprobe event array argument
+
+[ -f kprobe_events ] || exit_unsupported # this is configurable
+
+grep -q "<type>\[<array-size>\]" README || exit_unsupported # version issue
+
+GOODSYM="_sdata"
+if ! grep -qw ${GOODSYM} /proc/kallsyms ; then
+  GOODSYM="create_trace_kprobe"
+fi
+case `uname -m` in
+x86_64)
+  ARG2=%si
+  OFFS=8
+  BITS=64
+;;
+i[3456]86)
+  ARG2=%cx
+  OFFS=4
+  BITS=32
+;;
+aarch64)
+  ARG2=%x1
+  OFFS=8
+  BITS=64
+;;
+arm*)
+  ARG2=%r1
+  OFFS=4
+  BITS=32
+;;
+*)
+  echo "Please implement other architecture here"
+  exit_untested
+esac
+
+create_testprobe() { # args
+  echo "p:testprobe create_trace_kprobe $*" > kprobe_events
+}
+
+check_field() { # grep-pattern
+  grep -e "$*" events/kprobes/testprobe/format
+}
+
+echo 0 > events/enable
+echo > kprobe_events
+
+: "Syntax test"
+create_testprobe "+0(${ARG2}):x8[1] +0(${ARG2}):s16[1] +0(${ARG2}):u32[1]"
+check_field "field:u8 arg1\[1\];.*size:1;"
+check_field "field:s16 arg2\[1\];.*size:2;"
+check_field "field:u32 arg3\[1\];.*size:4;"
+create_testprobe "+0(${ARG2}):x64[1] +0(${ARG2}):symbol[1]"
+check_field "field:u64 arg1\[1\];.*size:8;"
+check_field "field:u${BITS} arg2\[1\];.*size:${OFFS};"
+create_testprobe "+0(${ARG2}):b2 at 3/8[1] +0(${ARG2}):string[1]"
+check_field "field:u8 arg1\[1\];.*size:1;"
+check_field "field:__data_loc char\[\]\[1\] arg2;.*size:4;"
+create_testprobe "+0(${ARG2}):x8[64] @${GOODSYM}:x8[4]"
+check_field "field:u8 arg1\[64\];.*size:64;"
+check_field "field:u8 arg2\[4\];.*size:4;"
+
+! create_testprobe "${ARG2}:x8[1]" # Can not use array type on register
+! create_testprobe "\$comm:x8[1]" # Can not use array type on \$comm
+! create_testprobe "\$comm:string[1]" # No, even if it is string array
+! create_testprobe "+0(${ARG2}):x64[0]" # array size >= 1
+! create_testprobe "+0(${ARG2}):x64[65]" # array size <= 64
+
+: "Test get argument (1)"
+create_testprobe "arg1=+0(${ARG2}):string[1]" > kprobe_events
+echo 1 > events/kprobes/testprobe/enable
+! echo test >> kprobe_events
+tail -n 1 trace | grep -qe "testprobe.* arg1={\"test\"}"
+echo 0 > events/kprobes/testprobe/enable
+
+: "Test get argument (2)"
+create_testprobe "arg1=+0(${ARG2}):string[3]" > kprobe_events
+echo 1 > events/kprobes/testprobe/enable
+! echo foo bar buzz >> kprobe_events
+tail -n 1 trace | grep -qe "testprobe.* arg1={\"foo\",\"bar\",\"buzz\"}"
+echo 0 > events/kprobes/testprobe/enable
+
+: "Test get argument (3)"
+create_testprobe "arg1=+0(+0(${ARG2})):u8[4]" > kprobe_events
+echo 1 > events/kprobes/testprobe/enable
+! echo 1234 >> kprobe_events
+tail -n 1 trace | grep -qe "testprobe.* arg1={49,50,51,52}" # ascii code
+echo 0 > events/kprobes/testprobe/enable
+
+echo > kprobe_events

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
