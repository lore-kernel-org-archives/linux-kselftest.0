From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:09:56 +0900
Subject: [PATCH 00/25] selftests/ftrace: Improve ftracetest with coverage check
Message-ID: <153269339575.3084.16279591141931053689.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727120956.WtNCsqmJpQPLpcALjIWNHN8Yofk4nmZxi57qWWA3KmU@z>

Hello,

Here is a series of patches for improving ftracetest testcase
using gcov/lcov. It is still in progress, and I have got good
improvement of line/function coverage under kernel/trace with
this series. (Note that this kernel enables ftrace startup
tests)

Without this series
Lines:		10156	17200	59.0 %
Functions:	1069	1772	60.3 %

With this series
Lines:		11130	17200	64.7 %
Functions:	1185	1772	66.9 %

Of course we don't need to make it 100%, because ftracetest
is a function/specification test, and there are functions and
lines which never be called (like critical error detection :) ).
Also, ftrace has some amount of code for perf and bpf subsystem
which should be tested by perf/bpf tests.
However, GCOV(LCOV) gives us a good insight into which
functions are covered or not covered by the test cases.

This series has some ftracetest framework improvements too,
which are for debugging ftracetest itself.

Tracing/Gcov-kernel:
 - Add CONFIG_GCOV_PROFILE_FRACE, which enables gcov profiling
   only on tracing subsystem (under kernel/trace/). This may not
   needed for everyone (like a debugging feature).
   So it can be dropped anyway.

Ftracetest framework improvements:
 - Add --stop-fail for detecting failure soon.
 - Add --console for interactively debugging a testcase by shell.
 - Add testcase-number prefix to logfile for finding log easier.
 - Improve general init function
 - Call general init function after all testcases.
 - Remove init/cleanup code from all testcase (since general init
   function will fixed it up)

Testcase fixes:
 - Fix to check $comm availability.
 - Make checkbashisms clean

Testcase improvements:
 - Use loopback address instead of localhost
 - Improve kprobe on module testcase to load/unload module
 - Improve kprobe testcase to check log data
 - Improve kretprobe testcase to check log data
 - Test kprobe-event argument with various bitsize
 - Check set_event_pid result

Adding testcases:
 - Add kprobe event with $comm argument testcase
 - Add kprobe profile testcase
 - Add kprobe-event with symbol argument test
 - Add nop tracer testcase
 - Add trace_printk sample module testcase
 - Add ringbuffer size changing testcase
 - Add function profiling statistics testcase
 - Add max stack tracer testcase
 - Add function filter on module testcase
 - Add trace_pipe testcase
 
TBD:
Following testcase improvements are remaining.
 - Checking of various supported types (like u8, u64 etc.)
   testcases
 - Filter actions for ftrace testcases

Thank you,

---

Masami Hiramatsu (25):
      tracing: Allow gcov profiling on only ftrace subsystem
      selftests/ftrace: Add --stop-fail hidden option for debug
      selftests/ftrace: Add --console hidden option
      selftests/ftrace: Add case number prefix to logfile
      selftests/ftrace: More initialize features in initialize_ftrace
      selftests/ftrace: Cleanup ftrace after running test
      selftests/ftrace: Remove unneeded per-test init/cleanup ftrace
      selftests/ftrace: Fix to test kprobe $comm arg only if available
      selftests/ftrace: Fix checkbashisms errors
      selftests/ftrace: Use loopback address instead of localhost
      selftests/ftrace: Improve kprobe on module testcase to load/unload module
      selftests/ftrace: Improve kprobe testcase to check log data
      selftests/ftrace: Improve kretprobe testcase to check log data
      selftests/ftrace: Test kprobe-event argument with various bitsize
      selftests/ftrace: Check set_event_pid result
      selftests/ftrace: Add kprobe event with $comm argument testcase
      selftests/ftrace: Add kprobe profile testcase
      selftests/ftrace: Add a testcase for nop tracer
      selftests/ftrace: Add kprobe-event with symbol argument test
      selftests/ftrace: Add trace_printk sample module test
      selftests/ftrace: Add ringbuffer size changing testcase
      selftests/ftrace: Add function profiling stat testcase
      selftests/ftrace: Add max stack tracer testcase
      selftests/ftrace: Add function filter on module testcase
      selftests/ftrace: Add trace_pipe testcase


 kernel/trace/Kconfig                               |   13 +++++
 kernel/trace/Makefile                              |    5 ++
 tools/testing/selftests/ftrace/config              |    5 ++
 tools/testing/selftests/ftrace/ftracetest          |   32 +++++++++++-
 .../ftrace/test.d/00basic/ringbuffer_size.tc       |   21 ++++++++
 .../selftests/ftrace/test.d/00basic/trace_pipe.tc  |   15 ++++++
 .../selftests/ftrace/test.d/event/event-enable.tc  |    8 ---
 .../selftests/ftrace/test.d/event/event-pid.tc     |    6 +-
 .../ftrace/test.d/event/subsystem-enable.tc        |    8 ---
 .../ftrace/test.d/event/toplevel-enable.tc         |    8 ---
 .../selftests/ftrace/test.d/event/trace_printk.tc  |   27 ++++++++++
 .../ftrace/test.d/ftrace/fgraph-filter-stack.tc    |    4 --
 .../ftrace/test.d/ftrace/fgraph-filter.tc          |    9 ---
 .../ftrace/test.d/ftrace/func-filter-pid.tc        |    8 ---
 .../ftrace/test.d/ftrace/func_event_triggers.tc    |    3 -
 .../ftrace/test.d/ftrace/func_mod_trace.tc         |   24 +++++++++
 .../ftrace/test.d/ftrace/func_profile_stat.tc      |   23 +++++++++
 .../ftrace/test.d/ftrace/func_profiler.tc          |    4 --
 .../ftrace/test.d/ftrace/func_set_ftrace_file.tc   |   13 -----
 .../ftrace/test.d/ftrace/func_stack_tracer.tc      |   39 +++++++++++++++
 .../test.d/ftrace/func_traceonoff_triggers.tc      |   11 ----
 tools/testing/selftests/ftrace/test.d/functions    |    4 ++
 .../ftrace/test.d/kprobe/add_and_remove.tc         |    3 -
 .../selftests/ftrace/test.d/kprobe/busy_check.tc   |    3 -
 .../selftests/ftrace/test.d/kprobe/kprobe_args.tc  |    8 ++-
 .../ftrace/test.d/kprobe/kprobe_args_comm.tc       |   17 +++++++
 .../ftrace/test.d/kprobe/kprobe_args_string.tc     |    5 --
 .../ftrace/test.d/kprobe/kprobe_args_symbol.tc     |   39 +++++++++++++++
 .../ftrace/test.d/kprobe/kprobe_args_syntax.tc     |    8 +--
 .../ftrace/test.d/kprobe/kprobe_args_type.tc       |   52 ++++++++++++--------
 .../ftrace/test.d/kprobe/kprobe_eventname.tc       |    5 --
 .../ftrace/test.d/kprobe/kprobe_ftrace.tc          |    9 ---
 .../ftrace/test.d/kprobe/kprobe_module.tc          |   36 ++++++++++++--
 .../ftrace/test.d/kprobe/kretprobe_args.tc         |    9 ++-
 .../ftrace/test.d/kprobe/kretprobe_maxactive.tc    |    4 --
 .../ftrace/test.d/kprobe/multiple_kprobes.tc       |    5 --
 .../selftests/ftrace/test.d/kprobe/probepoint.tc   |    4 --
 .../selftests/ftrace/test.d/kprobe/profile.tc      |   15 ++++++
 .../testing/selftests/ftrace/test.d/tracer/nop.tc  |   22 ++++++++
 .../inter-event/trigger-extended-error-support.tc  |   12 -----
 .../inter-event/trigger-field-variable-support.tc  |   15 ------
 .../trigger-inter-event-combined-hist.tc           |   15 ------
 .../inter-event/trigger-multi-actions-accept.tc    |   14 -----
 .../inter-event/trigger-onmatch-action-hist.tc     |   15 ------
 .../trigger-onmatch-onmax-action-hist.tc           |   15 ------
 .../inter-event/trigger-onmax-action-hist.tc       |   15 ------
 .../trigger-synthetic-event-createremove.tc        |   12 -----
 .../ftrace/test.d/trigger/trigger-eventonoff.tc    |   12 -----
 .../ftrace/test.d/trigger/trigger-filter.tc        |   14 -----
 .../ftrace/test.d/trigger/trigger-hist-mod.tc      |   12 -----
 .../ftrace/test.d/trigger/trigger-hist.tc          |   12 -----
 .../ftrace/test.d/trigger/trigger-multihist.tc     |   16 ------
 .../ftrace/test.d/trigger/trigger-snapshot.tc      |   12 -----
 .../ftrace/test.d/trigger/trigger-stacktrace.tc    |   12 -----
 .../test.d/trigger/trigger-trace-marker-hist.tc    |   11 ----
 .../trigger/trigger-trace-marker-snapshot.tc       |   16 +-----
 .../trigger-trace-marker-synthetic-kernel.tc       |   12 -----
 .../trigger/trigger-trace-marker-synthetic.tc      |   12 -----
 .../ftrace/test.d/trigger/trigger-traceonoff.tc    |   12 -----
 59 files changed, 388 insertions(+), 412 deletions(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/trace_pipe.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/event/trace_printk.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_mod_trace.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_stack_tracer.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_comm.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/profile.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/tracer/nop.tc

--
Masami Hiramatsu (Linaro)
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
