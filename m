From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:15:37 +0900
Subject: [PATCH 12/25] selftests/ftrace: Improve kprobe testcase to check log
 data
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269373686.3084.7147052615547188965.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727121537.IvMT8ALffVitvEj_FjyQmiKJYaedHix8IKaCTvdchLA@z>

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

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
