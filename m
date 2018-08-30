From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:14:19 +0900
Subject: [PATCH v3 04/28] selftests/ftrace: More initialize features in
 initialize_ftrace
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563845959.29700.6744691744020482131.stgit@devbox>

Clear pid filter, synthetic_events, snapshots,
ftrace filter, and trace log in initialize_ftrace(),
since those are used in test cases.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
---
  Changes in v2:
   - Add reset_ftrace_filter
---
 tools/testing/selftests/ftrace/test.d/functions |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/ftrace/test.d/functions b/tools/testing/selftests/ftrace/test.d/functions
index e4645d5e3126..b2bfa4dd43f7 100644
--- a/tools/testing/selftests/ftrace/test.d/functions
+++ b/tools/testing/selftests/ftrace/test.d/functions
@@ -89,12 +89,17 @@ initialize_ftrace() { # Reset ftrace to initial-state
     reset_tracer
     reset_trigger
     reset_events_filter
+    reset_ftrace_filter
     disable_events
     echo > set_event_pid	# event tracer is always on
+    echo > set_ftrace_pid
     [ -f set_ftrace_filter ] && echo | tee set_ftrace_*
     [ -f set_graph_function ] && echo | tee set_graph_*
     [ -f stack_trace_filter ] && echo > stack_trace_filter
     [ -f kprobe_events ] && echo > kprobe_events
     [ -f uprobe_events ] && echo > uprobe_events
+    [ -f synthetic_events ] && echo > synthetic_events
+    [ -f snapshot ] && echo 0 > snapshot
+    clear_trace
     enable_tracing
 }
