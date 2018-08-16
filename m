From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:35:19 +0900
Subject: [PATCH v2 13/32] selftests/ftrace: Improve kprobe testcase to check
 log data
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443731966.23257.13836682245086327483.stgit@devbox>

Improve kprobe testcase to check the log data correctness
and ensure the event definition is corrctly including
argument definition.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../selftests/ftrace/test.d/kprobe/kprobe_args.tc  |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args.tc
index 9578535ccd67..bcdecf80a8f1 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args.tc
@@ -5,10 +5,14 @@
 [ -f kprobe_events ] || exit_unsupported # this is configurable
 
 echo 'p:testprobe _do_fork $stack $stack0 +0($stack)' > kprobe_events
-grep testprobe kprobe_events
+grep testprobe kprobe_events | grep -q 'arg1=\$stack arg2=\$stack0 arg3=+0(\$stack)'
 test -d events/kprobes/testprobe
+
 echo 1 > events/kprobes/testprobe/enable
 ( echo "forked")
+grep testprobe trace | grep '_do_fork' | \
+  grep -q 'arg1=0x[[:xdigit:]]* arg2=0x[[:xdigit:]]* arg3=0x[[:xdigit:]]*$'
+
 echo 0 > events/kprobes/testprobe/enable
 echo "-:testprobe" >> kprobe_events
 clear_trace
