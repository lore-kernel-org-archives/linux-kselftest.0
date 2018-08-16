From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:31:33 +0900
Subject: [PATCH v2 05/32] selftests/ftrace: More initialize features in
 initialize_ftrace
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443709338.23257.2179609309041817332.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180816163133.ZauO4IpHLhvspLHEGppga7m6_OfEpHNhm1-pqhuCTFk@z>

Clear pid filter, synthetic_events, snapshots,
ftrace filter, and trace log in initialize_ftrace(),
since those are used in test cases.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
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
