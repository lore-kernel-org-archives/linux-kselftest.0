From: joelaf at google.com (Joel Fernandes)
Date: Tue, 29 May 2018 17:04:52 -0700
Subject: [PATCH v8 0/8] Centralize and unify usage of preempt/irq tracepoints
Message-ID: <20180530000500.257225-1-joel@joelfernandes.org>

From: "Joel Fernandes (Google)" <joel at joelfernandes.org>

The preempt/irq tracepoints exist but not everything in the kernel is
using it during preempt/irq on/off events. This makes things not work
simultaneously (for ex, only either lockdep or irqsoff events can be
used at a time). This series is an attempt to solve that, and also
results in a nice clean up of the kernel in general. Several ifdefs are
simpler, and the design is more unified and better. Also as a result of
this, we also speeded up  performance all rcuidle tracepoints since
their handling is simpler.

v7->v8:
- Refactored irqsoff tracer probe defines based on Namhyung's
  suggestions. No functional change.

v6->v7:
- Added a module to simulate an atomic section, a kselftest to load and
  and trigger it which verifies the preempt-tracer and this series.

- Fixed a new warning after I rebased in early boot, this is because
early_boot_irqs_disabled was set too early, I moved it after the lockdep
initialization.

- added back the softirq fix since it appears it wasn't picked up.

- Ran Ingo's locking API selftest suite which are passing with this
  series.

- Mathieu suggested ifdef'ing the tracepoint_synchronize_unregister
  function incase tracepoints aren't enabled, did that.

Joel Fernandes (Google) (7):
  softirq: reorder trace_softirqs_on to prevent lockdep splat
  srcu: Add notrace variant of srcu_dereference
  trace/irqsoff: Split reset into separate functions
  tracepoint: Make rcuidle tracepoint callers use SRCU
  tracing: Centralize preemptirq tracepoints and unify their usage
  lib: Add module to simulate atomic sections for testing preemptoff
    tracers
  kselftests: Add tests for the preemptoff and irqsoff tracers

Paul McKenney (1):
  srcu: Add notrace variants of srcu_read_{lock,unlock}

 include/linux/ftrace.h                        |  11 +-
 include/linux/irqflags.h                      |  11 +-
 include/linux/lockdep.h                       |   8 +-
 include/linux/preempt.h                       |   2 +-
 include/linux/srcu.h                          |  22 ++
 include/linux/tracepoint.h                    |  48 +++-
 include/trace/events/preemptirq.h             |  23 +-
 init/main.c                                   |   5 +-
 kernel/locking/lockdep.c                      |  35 +--
 kernel/sched/core.c                           |   2 +-
 kernel/softirq.c                              |   6 +-
 kernel/trace/Kconfig                          |  22 +-
 kernel/trace/Makefile                         |   2 +-
 kernel/trace/trace_irqsoff.c                  | 253 ++++++------------
 kernel/trace/trace_preemptirq.c               |  71 +++++
 kernel/tracepoint.c                           |  15 +-
 lib/Kconfig.debug                             |   8 +
 lib/Makefile                                  |   1 +
 lib/test_atomic_sections.c                    |  79 ++++++
 tools/testing/selftests/ftrace/config         |   3 +
 .../test.d/preemptirq/irqsoff_tracer.tc       |  74 +++++
 21 files changed, 459 insertions(+), 242 deletions(-)
 create mode 100644 kernel/trace/trace_preemptirq.c
 create mode 100644 lib/test_atomic_sections.c
 create mode 100644 tools/testing/selftests/ftrace/test.d/preemptirq/irqsoff_tracer.tc

-- 
2.17.0.921.gf22659ad46-goog


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
