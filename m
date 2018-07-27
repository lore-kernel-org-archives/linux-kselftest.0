From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:17:02 +0900
Subject: [PATCH 15/25] selftests/ftrace: Check set_event_pid result
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269382186.3084.7341389829390379403.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727121702.asCYedlIFBThkmwnepUMbmOxSqM2KBpoNrKcbRYHBd0@z>

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

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
