From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:35:48 +0900
Subject: [PATCH v2 14/32] selftests/ftrace: Improve kretprobe testcase to
 check log data
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443734796.23257.3739510361313571999.stgit@devbox>

Improve kretprobe testcase to check the log data correctness
and ensure the event definition is corrctly including
argument definition.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../ftrace/test.d/kprobe/kretprobe_args.tc         |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kretprobe_args.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kretprobe_args.tc
index 4c6b21e30b02..ac9ab4a12e53 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kretprobe_args.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kretprobe_args.tc
@@ -4,11 +4,16 @@
 
 [ -f kprobe_events ] || exit_unsupported # this is configurable
 
+# Add new kretprobe event
 echo 'r:testprobe2 _do_fork $retval' > kprobe_events
-grep testprobe2 kprobe_events
+grep testprobe2 kprobe_events | grep -q 'arg1=\$retval'
 test -d events/kprobes/testprobe2
+
 echo 1 > events/kprobes/testprobe2/enable
 ( echo "forked")
+
+cat trace | grep testprobe2 | grep -q '<- _do_fork'
+
 echo 0 > events/kprobes/testprobe2/enable
 echo '-:testprobe2' >> kprobe_events
 clear_trace
