From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:18:35 +0900
Subject: [PATCH v3 13/28] selftests/ftrace: Improve kretprobe testcase to
 check log data
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563871485.29700.18049411263017131188.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180830141835.Y6FwORUlLr66vTUwWOz7D01ulSULxuMofDG17xS-Pjw@z>

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
