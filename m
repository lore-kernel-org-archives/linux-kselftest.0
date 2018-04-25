From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Wed, 25 Apr 2018 21:16:06 +0900
Subject: [PATCH v7 00/16] tracing: probeevent: Improve fetcharg features
Message-ID: <152465856498.26224.16969986455942749517.stgit@devbox>

Hi,

This is the 7th version of the fetch-arg improvement series.
This includes variable changes on fetcharg framework like,

- Add fetcharg testcases (syntax, argN, symbol, string and array)
  and probepoint testcase.
- Rewrite fetcharg framework with fetch_insn, switch-case based
  instead of function pointer.
- Add "symbol" type support, which shows symbol+offset instead of
  address value.
- Add "$argN" fetcharg, which fetches function parameters.
  (currently only for x86-64)
- Add array type support (including string arrary :) ) ,
  which enables to get fixed length array from probe-events.
- Add array type support for perf-probe, so that user can
  dump partial array entries.

V6 is here:
 https://lkml.org/lkml/2018/3/17/75

Changes from the v6 are here:
 [6/16]  - Fix to return an error if failed to fetch string and
        fill zero-length data_loc in error case.
 [11/16] - Update document for restructured text.
 [15/16] - Fix README test.
 [16/16] - Add type-casting description (and note) to documentation.

And rebased on the latest Steve's ftrace/core branch.

Thank you,

---

Masami Hiramatsu (16):
      tracing: probeevent: Cleanup print argument functions
      tracing: probeevent: Cleanup argument field definition
      tracing: probeevent: Remove NOKPROBE_SYMBOL from print functions
      tracing: probeevent: Introduce new argument fetching code
      tracing: probeevent: Unify fetch type tables
      tracing: probeevent: Return consumed bytes of dynamic area
      tracing: probeevent: Append traceprobe_ for exported function
      tracing: probeevent: Unify fetch_insn processing common part
      tracing: probeevent: Add symbol type
      x86: ptrace: Add function argument access API
      tracing: probeevent: Add $argN for accessing function args
      tracing: probeevent: Add array type support
      selftests: ftrace: Add a testcase for symbol type
      selftests: ftrace: Add a testcase for $argN with kprobe_event
      selftests: ftrace: Add a testcase for array type with kprobe_event
      perf-probe: Add array argument support


 Documentation/trace/kprobetrace.rst                |   23 +
 arch/Kconfig                                       |    7 
 arch/x86/Kconfig                                   |    1 
 arch/x86/include/asm/ptrace.h                      |   38 +
 kernel/trace/trace.c                               |    9 
 kernel/trace/trace_kprobe.c                        |  358 ++++--------
 kernel/trace/trace_probe.c                         |  620 +++++++++-----------
 kernel/trace/trace_probe.h                         |  282 +++------
 kernel/trace/trace_probe_tmpl.h                    |  216 +++++++
 kernel/trace/trace_uprobe.c                        |  176 ++----
 tools/perf/Documentation/perf-probe.txt            |   12 
 tools/perf/util/probe-event.c                      |   20 +
 tools/perf/util/probe-event.h                      |    2 
 tools/perf/util/probe-file.c                       |    5 
 tools/perf/util/probe-file.h                       |    1 
 tools/perf/util/probe-finder.c                     |   95 ++-
 .../ftrace/test.d/kprobe/kprobe_args_argN.tc       |   25 +
 .../ftrace/test.d/kprobe/kprobe_args_array.tc      |   92 +++
 .../ftrace/test.d/kprobe/kprobe_args_symbol.tc     |   77 ++
 19 files changed, 1127 insertions(+), 932 deletions(-)
 create mode 100644 kernel/trace/trace_probe_tmpl.h
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_argN.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_array.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc

--
Masami Hiramatsu (Linaro) <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
