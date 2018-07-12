From: joel at joelfernandes.org (Joel Fernandes)
Date: Thu, 12 Jul 2018 14:36:11 -0700
Subject: [PATCH 1/2] lib: Add module for testing preemptoff/irqsoff
 latency tracers
In-Reply-To: <20180712172232.00e4c01e@gandalf.local.home>
References: <20180711063540.91101-1-joel@joelfernandes.org>
 <20180711063540.91101-2-joel@joelfernandes.org>
 <20180712172232.00e4c01e@gandalf.local.home>
Message-ID: <20180712213611.GA8743@joelaf.mtv.corp.google.com>

On Thu, Jul 12, 2018 at 05:22:32PM -0400, Steven Rostedt wrote:
> On Tue, 10 Jul 2018 23:35:39 -0700
> Joel Fernandes <joel at joelfernandes.org> wrote:
> 
> > 
> > Co-developed-by: Erick Reyes <erickreyes at google.com>
> 
> A co-developer needs to add their signed off by. To specify that Erick
> is a co-author, you could do:
> 
> [ Erick is a co-developer of this commit ]
> Signed-off-by: Add Erick's SOB here.

Sure, I added this below. Hope its easy for you to apply, if not let me know
and I can send it again separately. thanks.

------------>8----------------

From: "Joel Fernandes (Google)" <joel at joelfernandes.org>
Subject: [PATCH 1/2] lib: Add module for testing preemptoff/irqsoff latency  tracers

Here we introduce a test module for introducing a long preempt or irq
disable delay in the kernel which the preemptoff or irqsoff tracers can
detect. This module is to be used only for test purposes and is default
disabled.

Following is the expected output (only briefly shown) that can be parsed
to verify that the tracers are working correctly. We will use this from
the kselftests in future patches.

For the preemptoff tracer:

echo preemptoff > /d/tracing/current_tracer
sleep 1
insmod ./preemptirq_delay_test.ko test_mode=preempt delay=500000
sleep 1
bash-4.3# cat /d/tracing/trace
preempt -1066    2...2    0us@: preemptirq_delay_run <-preemptirq_delay_run
preempt -1066    2...2 500002us : preemptirq_delay_run <-preemptirq_delay_run
preempt -1066    2...2 500004us : tracer_preempt_on <-preemptirq_delay_run
preempt -1066    2...2 500012us : <stack trace>
 => kthread
 => ret_from_fork

For the irqsoff tracer:

echo irqsoff > /d/tracing/current_tracer
sleep 1
insmod ./preemptirq_delay_test.ko test_mode=irq delay=500000
sleep 1
bash-4.3# cat /d/tracing/trace
irq dis -1069    1d..1    0us@: preemptirq_delay_run
irq dis -1069    1d..1 500001us : preemptirq_delay_run
irq dis -1069    1d..1 500002us : tracer_hardirqs_on <-preemptirq_delay_run
irq dis -1069    1d..1 500005us : <stack trace>
 => ret_from_fork

Cc: Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko at linux.intel.com>
[ Erick is a co-developer of this commit ]
Signed-off-by: Erick Reyes <erickreyes at google.com>
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 kernel/trace/Kconfig                 | 15 ++++++
 kernel/trace/Makefile                |  1 +
 kernel/trace/preemptirq_delay_test.c | 72 ++++++++++++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 kernel/trace/preemptirq_delay_test.c

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 8d51351e3149..eb5ab6b511e2 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -699,6 +699,21 @@ config RING_BUFFER_STARTUP_TEST
 
 	 If unsure, say N
 
+config PREEMPTIRQ_DELAY_TEST
+	tristate "Preempt / IRQ disable delay thread to test latency tracers"
+	depends on m
+	help
+	  Select this option to build a test module that can help test latency
+	  tracers by executing a preempt or irq disable section with a user
+	  configurable delay. The module busy waits for the duration of the
+	  critical section.
+
+	  For example, the following invocation forces a one-time irq-disabled
+	  critical section for 500us:
+	  modprobe preemptirq_delay_test test_mode=irq delay=500000
+
+	  If unsure, say N
+
 config TRACE_EVAL_MAP_FILE
        bool "Show eval mappings for trace events"
        depends on TRACING
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 84a0cb222f20..677540bb1b62 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_TRACING_MAP) += tracing_map.o
 obj-$(CONFIG_CONTEXT_SWITCH_TRACER) += trace_sched_switch.o
 obj-$(CONFIG_FUNCTION_TRACER) += trace_functions.o
 obj-$(CONFIG_PREEMPTIRQ_TRACEPOINTS) += trace_preemptirq.o
+obj-$(CONFIG_PREEMPTIRQ_DELAY_TEST) += preemptirq_delay_test.o
 obj-$(CONFIG_IRQSOFF_TRACER) += trace_irqsoff.o
 obj-$(CONFIG_PREEMPT_TRACER) += trace_irqsoff.o
 obj-$(CONFIG_SCHED_TRACER) += trace_sched_wakeup.o
diff --git a/kernel/trace/preemptirq_delay_test.c b/kernel/trace/preemptirq_delay_test.c
new file mode 100644
index 000000000000..c97a026c0720
--- /dev/null
+++ b/kernel/trace/preemptirq_delay_test.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Preempt / IRQ disable delay thread to test latency tracers
+ *
+ * Copyright (C) 2018 Joel Fernandes (Google) <joel at joelfernandes.org>
+ */
+
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+#include <linux/printk.h>
+#include <linux/string.h>
+
+static ulong delay = 100;
+static char test_mode[10] = "irq";
+
+module_param_named(delay, delay, ulong, S_IRUGO);
+module_param_string(test_mode, test_mode, 10, S_IRUGO);
+MODULE_PARM_DESC(delay, "Period in microseconds (100 uS default)");
+MODULE_PARM_DESC(test_mode, "Mode of the test such as preempt or irq (default irq)");
+
+static void busy_wait(ulong time)
+{
+	ktime_t start, end;
+	start = ktime_get();
+	do {
+		end = ktime_get();
+		if (kthread_should_stop())
+			break;
+	} while (ktime_to_ns(ktime_sub(end, start)) < (time * 1000));
+}
+
+int preemptirq_delay_run(void *data)
+{
+	unsigned long flags;
+
+	if (!strcmp(test_mode, "irq")) {
+		local_irq_save(flags);
+		busy_wait(delay);
+		local_irq_restore(flags);
+	} else if (!strcmp(test_mode, "preempt")) {
+		preempt_disable();
+		busy_wait(delay);
+		preempt_enable();
+	}
+
+	return 0;
+}
+
+static int __init preemptirq_delay_init(void)
+{
+	char task_name[50];
+	struct task_struct *test_task;
+
+	snprintf(task_name, sizeof(task_name), "%s_test", test_mode);
+
+	test_task = kthread_run(preemptirq_delay_run, NULL, task_name);
+	return PTR_ERR_OR_ZERO(test_task);
+}
+
+static void __exit preemptirq_delay_exit(void)
+{
+	return;
+}
+
+module_init(preemptirq_delay_init)
+module_exit(preemptirq_delay_exit)
+MODULE_LICENSE("GPL v2");
-- 
2.18.0.203.gfac676dfb9-goog


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
