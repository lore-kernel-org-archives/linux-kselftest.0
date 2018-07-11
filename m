From: joel at joelfernandes.org (Joel Fernandes)
Date: Tue, 10 Jul 2018 23:35:40 -0700
Subject: [PATCH 2/2] kselftests: Add tests for the preemptoff and irqsoff
 tracers
In-Reply-To: <20180711063540.91101-1-joel@joelfernandes.org>
References: <20180711063540.91101-1-joel@joelfernandes.org>
Message-ID: <20180711063540.91101-3-joel@joelfernandes.org>

From: "Joel Fernandes (Google)" <joel at joelfernandes.org>

Here we add unit tests for the preemptoff and irqsoff tracer by using a
kernel module introduced previously to trigger long preempt or irq
disabled sections in the kernel.

Reviewed-by: Masami Hiramatsu <mhiramat at kernel.org>
Acked-by: Masami Hiramatsu <mhiramat at kernel.org>
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 tools/testing/selftests/ftrace/config         |  3 +
 .../test.d/preemptirq/irqsoff_tracer.tc       | 73 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/preemptirq/irqsoff_tracer.tc

diff --git a/tools/testing/selftests/ftrace/config b/tools/testing/selftests/ftrace/config
index b01924c71c09..07db5ab09cc7 100644
--- a/tools/testing/selftests/ftrace/config
+++ b/tools/testing/selftests/ftrace/config
@@ -4,3 +4,6 @@ CONFIG_FUNCTION_PROFILER=y
 CONFIG_TRACER_SNAPSHOT=y
 CONFIG_STACK_TRACER=y
 CONFIG_HIST_TRIGGERS=y
+CONFIG_PREEMPT_TRACER=y
+CONFIG_IRQSOFF_TRACER=y
+CONFIG_PREEMPTIRQ_DELAY_TEST=m
diff --git a/tools/testing/selftests/ftrace/test.d/preemptirq/irqsoff_tracer.tc b/tools/testing/selftests/ftrace/test.d/preemptirq/irqsoff_tracer.tc
new file mode 100644
index 000000000000..cbd174334a48
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/preemptirq/irqsoff_tracer.tc
@@ -0,0 +1,73 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: test for the preemptirqsoff tracer
+
+MOD=preemptirq_delay_test
+
+fail() {
+    reset_tracer
+    rmmod $MOD || true
+    exit_fail
+}
+
+unsup() { #msg
+    reset_tracer
+    rmmod $MOD || true
+    echo $1
+    exit_unsupported
+}
+
+modprobe $MOD || unsup "$MOD module not available"
+rmmod $MOD
+
+grep -q "preemptoff" available_tracers || unsup "preemptoff tracer not enabled"
+grep -q "irqsoff" available_tracers || unsup "irqsoff tracer not enabled"
+
+reset_tracer
+
+# Simulate preemptoff section for half a second couple of times
+echo preemptoff > current_tracer
+sleep 1
+modprobe $MOD test_mode=preempt delay=500000 || fail
+rmmod $MOD || fail
+modprobe $MOD test_mode=preempt delay=500000 || fail
+rmmod $MOD || fail
+modprobe $MOD test_mode=preempt delay=500000 || fail
+rmmod $MOD || fail
+
+cat trace
+
+# Confirm which tracer
+grep -q "tracer: preemptoff" trace || fail
+
+# Check the end of the section
+egrep -q "5.....us : <stack trace>" trace || fail
+
+# Check for 500ms of latency
+egrep -q "latency: 5..... us" trace || fail
+
+reset_tracer
+
+# Simulate irqsoff section for half a second couple of times
+echo irqsoff > current_tracer
+sleep 1
+modprobe $MOD test_mode=irq delay=500000 || fail
+rmmod $MOD || fail
+modprobe $MOD test_mode=irq delay=500000 || fail
+rmmod $MOD || fail
+modprobe $MOD test_mode=irq delay=500000 || fail
+rmmod $MOD || fail
+
+cat trace
+
+# Confirm which tracer
+grep -q "tracer: irqsoff" trace || fail
+
+# Check the end of the section
+egrep -q "5.....us : <stack trace>" trace || fail
+
+# Check for 500ms of latency
+egrep -q "latency: 5..... us" trace || fail
+
+reset_tracer
+exit 0
-- 
2.18.0.203.gfac676dfb9-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
