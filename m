From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Wed, 12 Sep 2018 18:57:43 +0900
Subject: [PATCH v3 00/28] selftests/ftrace: Improve ftracetest with
 coverage check
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <20180912185743.b00b0b152abd632e10f04608@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180912095743.co8m4SuSZ7qwjfsdiAAGniEzV876Wfs5J0pn5Xlq2-k@z>

Hi Shuah,

Would you have any comment?

Thank you,

On Thu, 30 Aug 2018 23:12:24 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Hi,
> 
> Here is the 3rd version of the series for improving ftracetest
> testcase using gcov/lcov. In this version I just fixed some
> reported issues and dropped some tests which is not needed.
> I also dropped a testcase for blktrace from this version.
> It will be discussed separated thread.
> 
> Previous version is here;
> 
> https://lkml.org/lkml/2018/8/16/393
> 
> GCOV_PROFILE_FTRACE has already been merged through tracing
> tree.
> 
> Ftracetest framework improvements:
>  - Add --stop-fail for detecting failure soon.
>  - Add --console for interactively debugging a testcase by shell.
>  - Add testcase-number prefix to logfile for finding log easier.
>  - Improve general init function
>  - Add SPDX license identifiers
>  - Call general init function after all testcases.
>  - Remove init/cleanup code from all testcase (since general init
>    function will fixed it up)
> 
> Testcase fixes:
>  - Fix to check $comm availability.
>  - Make checkbashisms clean
> 
> Testcase improvements:
>  - Use loopback address instead of localhost
>  - Improve kprobe on module testcase to load/unload module
>  - Improve kprobe testcase to check log data
>  - Improve kretprobe testcase to check log data
>  - Test kprobe-event argument with various bitsize
>  - Check set_event_pid result
> 
> Adding testcases:
>  - Add kprobe event with $comm argument testcase
>  - Add kprobe profile testcase
>  - Add kprobe-event with symbol argument testcase
>  - Add trace_printk sample module testcase
>  - Add ringbuffer size changing testcase
>  - Add function profiling statistics testcase
>  - Add max stack tracer testcase
>  - Add function filter on module testcase
>  - Add trace_pipe testcase
>  - Add stacktrace ftrace filter command testcase
>  - Add wakeup tracer testcase
>  - Add wakeup_rt tracer testcase
>  - Add ftrace cpumask testcase
> 
> TBD:
> Following testcase improvements are remaining.
>  - Checking of various supported types (like u8, u64 etc.)
>    testcases
> 
> Tested on x86-64 qemu.
> 
> # of passed:  84
> # of failed:  0
> # of unresolved:  0
> # of untested:  0
> # of unsupported:  0
> # of xfailed:  0
> # of undefined(test bug):  0
> 
> Thank you,
> 
> ---
> 
> Masami Hiramatsu (28):
>       selftests/ftrace: Add --stop-fail hidden option for debug
>       selftests/ftrace: Add --console hidden option
>       selftests/ftrace: Add case number prefix to logfile
>       selftests/ftrace: More initialize features in initialize_ftrace
>       selftests/ftrace: Add SPDX License Identifier to template
>       selftests/ftrace: Cleanup ftrace after running test
>       selftests/ftrace: Remove unneeded per-test init/cleanup ftrace
>       selftests/ftrace: Fix to test kprobe $comm arg only if available
>       selftests/ftrace: Fix checkbashisms errors
>       selftests/ftrace: Use loopback address instead of localhost
>       selftests/ftrace: Improve kprobe on module testcase to load/unload module
>       selftests/ftrace: Improve kprobe testcase to check log data
>       selftests/ftrace: Improve kretprobe testcase to check log data
>       selftests/ftrace: Test kprobe-event argument with various bitsize
>       selftests/ftrace: Check set_event_pid result
>       selftests/ftrace: Add kprobe event with $comm argument testcase
>       selftests/ftrace: Add kprobe profile testcase
>       selftests/ftrace: Add kprobe-event with symbol argument test
>       selftests/ftrace: Add trace_printk sample module test
>       selftests/ftrace: Add ringbuffer size changing testcase
>       selftests/ftrace: Add function profiling stat testcase
>       selftests/ftrace: Add max stack tracer testcase
>       selftests/ftrace: Add function filter on module testcase
>       selftests/ftrace: Add trace_pipe testcase
>       selftests/ftrace: Add stacktrace ftrace filter command testcase
>       selftests/ftrace: Add wakeup tracer testcase
>       selftests/ftrace: Add wakeup_rt tracer testcase
>       selftests/ftrace: Add ftrace cpumask testcase
> 
> 
>  tools/testing/selftests/ftrace/config              |    6 ++
>  tools/testing/selftests/ftrace/ftracetest          |   32 +++++++++++-
>  .../ftrace/test.d/00basic/ringbuffer_size.tc       |   22 ++++++++
>  .../selftests/ftrace/test.d/00basic/trace_pipe.tc  |   16 ++++++
>  .../selftests/ftrace/test.d/event/event-enable.tc  |   10 ----
>  .../selftests/ftrace/test.d/event/event-pid.tc     |    8 +--
>  .../ftrace/test.d/event/subsystem-enable.tc        |   10 ----
>  .../ftrace/test.d/event/toplevel-enable.tc         |   10 ----
>  .../selftests/ftrace/test.d/event/trace_printk.tc  |   27 ++++++++++
>  .../ftrace/test.d/ftrace/fgraph-filter-stack.tc    |    4 --
>  .../ftrace/test.d/ftrace/fgraph-filter.tc          |    9 ---
>  .../ftrace/test.d/ftrace/func-filter-pid.tc        |   10 ----
>  .../ftrace/test.d/ftrace/func-filter-stacktrace.tc |   12 +++++
>  .../selftests/ftrace/test.d/ftrace/func_cpumask.tc |   42 ++++++++++++++++
>  .../ftrace/test.d/ftrace/func_event_triggers.tc    |    3 -
>  .../ftrace/test.d/ftrace/func_mod_trace.tc         |   24 +++++++++
>  .../ftrace/test.d/ftrace/func_profile_stat.tc      |   22 ++++++++
>  .../ftrace/test.d/ftrace/func_profiler.tc          |    4 --
>  .../ftrace/test.d/ftrace/func_set_ftrace_file.tc   |   13 -----
>  .../ftrace/test.d/ftrace/func_stack_tracer.tc      |   39 +++++++++++++++
>  .../test.d/ftrace/func_traceonoff_triggers.tc      |   11 ----
>  tools/testing/selftests/ftrace/test.d/functions    |   11 ++++
>  .../ftrace/test.d/kprobe/add_and_remove.tc         |    3 -
>  .../selftests/ftrace/test.d/kprobe/busy_check.tc   |    3 -
>  .../selftests/ftrace/test.d/kprobe/kprobe_args.tc  |    8 ++-
>  .../ftrace/test.d/kprobe/kprobe_args_comm.tc       |   17 +++++++
>  .../ftrace/test.d/kprobe/kprobe_args_string.tc     |    5 --
>  .../ftrace/test.d/kprobe/kprobe_args_symbol.tc     |   39 +++++++++++++++
>  .../ftrace/test.d/kprobe/kprobe_args_syntax.tc     |    8 +--
>  .../ftrace/test.d/kprobe/kprobe_args_type.tc       |   52 ++++++++++++--------
>  .../ftrace/test.d/kprobe/kprobe_eventname.tc       |    5 --
>  .../ftrace/test.d/kprobe/kprobe_ftrace.tc          |    9 ---
>  .../ftrace/test.d/kprobe/kprobe_module.tc          |   36 ++++++++++++--
>  .../ftrace/test.d/kprobe/kretprobe_args.tc         |    9 ++-
>  .../ftrace/test.d/kprobe/kretprobe_maxactive.tc    |    4 --
>  .../ftrace/test.d/kprobe/multiple_kprobes.tc       |    5 --
>  .../selftests/ftrace/test.d/kprobe/probepoint.tc   |    4 --
>  .../selftests/ftrace/test.d/kprobe/profile.tc      |   15 ++++++
>  tools/testing/selftests/ftrace/test.d/template     |    1 
>  .../selftests/ftrace/test.d/tracer/wakeup.tc       |   25 ++++++++++
>  .../selftests/ftrace/test.d/tracer/wakeup_rt.tc    |   25 ++++++++++
>  .../inter-event/trigger-extended-error-support.tc  |   12 -----
>  .../inter-event/trigger-field-variable-support.tc  |   15 ------
>  .../trigger-inter-event-combined-hist.tc           |   15 ------
>  .../inter-event/trigger-multi-actions-accept.tc    |   14 -----
>  .../inter-event/trigger-onmatch-action-hist.tc     |   16 +-----
>  .../trigger-onmatch-onmax-action-hist.tc           |   16 +-----
>  .../inter-event/trigger-onmax-action-hist.tc       |   16 +-----
>  .../trigger-synthetic-event-createremove.tc        |   12 -----
>  .../ftrace/test.d/trigger/trigger-eventonoff.tc    |   12 -----
>  .../ftrace/test.d/trigger/trigger-filter.tc        |   14 -----
>  .../ftrace/test.d/trigger/trigger-hist-mod.tc      |   12 -----
>  .../ftrace/test.d/trigger/trigger-hist.tc          |   12 -----
>  .../ftrace/test.d/trigger/trigger-multihist.tc     |   16 ------
>  .../ftrace/test.d/trigger/trigger-snapshot.tc      |   12 -----
>  .../ftrace/test.d/trigger/trigger-stacktrace.tc    |   12 -----
>  .../test.d/trigger/trigger-trace-marker-hist.tc    |   11 ----
>  .../trigger/trigger-trace-marker-snapshot.tc       |   16 +-----
>  .../trigger-trace-marker-synthetic-kernel.tc       |   12 -----
>  .../trigger/trigger-trace-marker-synthetic.tc      |   12 -----
>  .../ftrace/test.d/trigger/trigger-traceonoff.tc    |   12 -----
>  61 files changed, 460 insertions(+), 427 deletions(-)
>  create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/trace_pipe.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/event/trace_printk.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_mod_trace.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_stack_tracer.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_comm.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/profile.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/tracer/wakeup.tc
>  create mode 100644 tools/testing/selftests/ftrace/test.d/tracer/wakeup_rt.tc
> 
> --
> Masami Hiramatsu (Linaro)


-- 
Masami Hiramatsu <mhiramat at kernel.org>
