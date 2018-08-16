From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:36:44 +0900
Subject: [PATCH v2 16/32] selftests/ftrace: Check set_event_pid result
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443740447.23257.15132897095208881026.stgit@devbox>

Ensure the set_event_pid shows set pid list.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../selftests/ftrace/test.d/event/event-pid.tc     |    1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/ftrace/test.d/event/event-pid.tc b/tools/testing/selftests/ftrace/test.d/event/event-pid.tc
index 6d2897f6a106..4ecbd9b69ec6 100644
--- a/tools/testing/selftests/ftrace/test.d/event/event-pid.tc
+++ b/tools/testing/selftests/ftrace/test.d/event/event-pid.tc
@@ -46,6 +46,7 @@ do_reset
 read mypid rest < /proc/self/stat
 
 echo $mypid > set_event_pid
+grep -q $mypid set_event_pid
 echo 'sched:sched_switch' > set_event
 
 yield
