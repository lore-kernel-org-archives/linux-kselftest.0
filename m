From: joel@joelfernandes.org (Joel Fernandes)
Date: Tue, 10 Jul 2018 23:35:38 -0700
Subject: [PATCH 0/2] Tests for preempt/irq disabled sections
Message-ID: <20180711063540.91101-1-joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180711063538.36fcC9Zktkj4Ixhb1B0nqoeeWqQ17IN4jQrmDtqgLkY@z>

From: "Joel Fernandes (Google)" <joel@joelfernandes.org>

Only resending the test module and kselftest patches with minor changes
as suggested by Steve.

Previous posting of the series is at: https://lkml.org/lkml/2018/6/7/1162

Joel Fernandes (Google) (2):
  lib: Add module for testing preemptoff/irqsoff latency tracers
  kselftests: Add tests for the preemptoff and irqsoff tracers

 kernel/trace/Kconfig                          | 15 ++++
 kernel/trace/Makefile                         |  1 +
 kernel/trace/preemptirq_delay_test.c          | 72 ++++++++++++++++++
 tools/testing/selftests/ftrace/config         |  3 +
 .../test.d/preemptirq/irqsoff_tracer.tc       | 73 +++++++++++++++++++
 5 files changed, 164 insertions(+)
 create mode 100644 kernel/trace/preemptirq_delay_test.c
 create mode 100644 tools/testing/selftests/ftrace/test.d/preemptirq/irqsoff_tracer.tc

-- 
2.18.0.203.gfac676dfb9-goog
unction incase tracepoints aren't enabled, did that.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
