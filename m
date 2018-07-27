From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:16:05 +0900
Subject: [PATCH 13/25] selftests/ftrace: Improve kretprobe testcase to check
 log data
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269376540.3084.6023668060336581975.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727121605.avwKfeXX_I3RQ45enyZ_2u6PWRI89DBmnLj0LjNa1EA@z>

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

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
