From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:38:37 +0900
Subject: [PATCH v2 20/32] selftests/ftrace: Add kprobe-event with symbol
 argument test
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443751761.23257.743998194793037725.stgit@devbox>

Add a testcase for kprobe-event with @symbol argument.
Since @symbol needs to refer the kernel data symbol
(linux_proc_banner), it requires CONFIG_KALLSYMS_ALL.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 tools/testing/selftests/ftrace/config              |    1 +
 .../ftrace/test.d/kprobe/kprobe_args_symbol.tc     |   39 ++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc

diff --git a/tools/testing/selftests/ftrace/config b/tools/testing/selftests/ftrace/config
index 32cf61b6bb54..b7ac74fcb0fa 100644
--- a/tools/testing/selftests/ftrace/config
+++ b/tools/testing/selftests/ftrace/config
@@ -11,3 +11,4 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_SAMPLES=y
 CONFIG_SAMPLE_TRACE_PRINTK=m
+CONFIG_KALLSYMS_ALL=y
diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc
new file mode 100644
index 000000000000..2b6dd33f9076
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc
@@ -0,0 +1,39 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Kprobe event symbol argument
+
+[ -f kprobe_events ] || exit_unsupported # this is configurable
+
+SYMBOL="linux_proc_banner"
+
+if [ ! -f /proc/kallsyms ]; then
+  echo "Can not check the target symbol - please enable CONFIG_KALLSYMS"
+  exit_unresolved
+elif ! grep "$SYMBOL\$" /proc/kallsyms; then
+  echo "Linux banner is not exported - please enable CONFIG_KALLSYMS_ALL"
+  exit_unresolved
+fi
+
+: "Test get basic types symbol argument"
+echo "p:testprobe_u _do_fork arg1=@linux_proc_banner:u64 arg2=@linux_proc_banner:u32 arg3=@linux_proc_banner:u16 arg4=@linux_proc_banner:u8" > kprobe_events
+echo "p:testprobe_s _do_fork arg1=@linux_proc_banner:s64 arg2=@linux_proc_banner:s32 arg3=@linux_proc_banner:s16 arg4=@linux_proc_banner:s8" >> kprobe_events
+if grep -q "x8/16/32/64" README; then
+  echo "p:testprobe_x _do_fork arg1=@linux_proc_banner:x64 arg2=@linux_proc_banner:x32 arg3=@linux_proc_banner:x16 arg4=@linux_proc_banner:x8" >> kprobe_events
+fi
+echo "p:testprobe_bf _do_fork arg1=@linux_proc_banner:b8 at 4/32" >> kprobe_events
+echo 1 > events/kprobes/enable
+(echo "forked")
+echo 0 > events/kprobes/enable
+grep "testprobe_[usx]:.* arg1=.* arg2=.* arg3=.* arg4=.*" trace
+grep "testprobe_bf:.* arg1=.*" trace
+
+: "Test get string symbol argument"
+echo "p:testprobe_str _do_fork arg1=@linux_proc_banner:string" > kprobe_events
+echo 1 > events/kprobes/enable
+(echo "forked")
+echo 0 > events/kprobes/enable
+RESULT=`grep "testprobe_str" trace | sed -e 's/.* arg1=\(.*\)/\1/'`
+
+RESULT=`echo $RESULT | sed -e 's/.* \((.*)\) \((.*)\) .*/\1 \2/'`
+ORIG=`cat /proc/version | sed -e 's/.* \((.*)\) \((.*)\) .*/\1 \2/'`
+test "$RESULT" = "$ORIG"
