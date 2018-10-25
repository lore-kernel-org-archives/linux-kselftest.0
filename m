From: shuah at kernel.org (Shuah Khan)
Date: Thu, 25 Oct 2018 12:36:16 -0600
Subject: [GIT PULL] kselftest update for Linux 4.20-rc1
Message-ID: <407e4b9c-36eb-d533-331c-2396460c6f67@kernel.org>

Hi Linus,

Please pull the following kselftest update for Linux 4.20-rc1

This Kselftest update for Linux 4.20-rc1 consists of:

- Improvements to ftrace test suite from Masami Hiramatsu.
- Color coded ftrace PASS / FAIL results from Steven Rostedt (VMware)
  to improve readability of reports.
- watchdog Fixes and enhancement to add gettimeout and get|set pretimeout
  options from Jerry Hoemann.
- Several fixes to warnings and spelling etc.

Please note that these patches have been in linux-next for a while and I did
a rebase to Linux 4.19 just to make sure there are no conflicts.

diff is attached.

Also, there  is a conflict in tools/testing/selftests/kvm/dirty_log_test.c

between commit:

  fff8dcd7b4a2 ("kvm: selftests: port dirty_log_test to aarch64")

from the kvm tree and commit:

  cda94d9ffa0e ("selftests: kvm: Fix -Wformat warnings")

Stephen Rothwell fixed this up.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 84df9525b0c27f3ebc2ebb1864fa62a97fdedb7d:

  Linux 4.19 (2018-10-22 07:37:37 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-4.20-rc1

for you to fetch changes up to f73581f8d9a367459f36e6a4ef0065997ab14c75:

  selftests/ftrace: Strip escape sequences for log file (2018-10-24 14:49:37 -0600)

----------------------------------------------------------------
linux-kselftest-4.20-rc1

This Kselftest update for Linux 4.20-rc1 consists of:

- Improvements to ftrace test suite from Masami Hiramatsu.
- Color coded ftrace PASS / FAIL results from Steven Rostedt (VMware)
  to improve readability of reports.
- watchdog Fixes and enhancement to add gettimeout and get|set pretimeout
  options from Jerry Hoemann.
- Several fixes to warnings and spelling etc.

----------------------------------------------------------------
Andrea Parri (1):
      selftests: kvm: Fix -Wformat warnings

Colin Ian King (1):
      kvm: selftests: fix spelling mistake "Insufficent" -> "Insufficient"

Daniel Díaz (2):
      selftests: gpio: Fix OUTPUT directory in Makefile
      selftests/ftrace: Use colored output when available

Fathi Boudra (1):
      selftests: gpio: restructure Makefile

Jerry Hoemann (2):
      selftests: watchdog: Fix error message.
      selftests: watchdog: Add gettimeout and get|set pretimeout

Masami Hiramatsu (29):
      selftests/ftrace: Add --stop-fail hidden option for debug
      selftests/ftrace: Add --console hidden option
      selftests/ftrace: Add case number prefix to logfile
      selftests/ftrace: More initialize features in initialize_ftrace
      selftests/ftrace: Add SPDX License Identifier to template
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
      selftests/ftrace: Add kprobe-event with symbol argument test
      selftests/ftrace: Add trace_printk sample module test
      selftests/ftrace: Add ringbuffer size changing testcase
      selftests/ftrace: Add function profiling stat testcase
      selftests/ftrace: Add max stack tracer testcase
      selftests/ftrace: Add function filter on module testcase
      selftests/ftrace: Add trace_pipe testcase
      selftests/ftrace: Add stacktrace ftrace filter command testcase
      selftests/ftrace: Add wakeup tracer testcase
      selftests/ftrace: Add wakeup_rt tracer testcase
      selftests/ftrace: Add ftrace cpumask testcase
      selftests/ftrace: Strip escape sequences for log file

Peng Hao (1):
      selftests: fix warning: "_GNU_SOURCE" redefined

Shuah Khan (Samsung OSG) (2):
      selftests: watchdog: fix message when /dev/watchdog open fails
      selftests: watchdog: Fix ioctl SET* error paths to take oneshot exit path

Steven Rostedt (VMware) (1):
      selftests/ftrace: Add color to the PASS / FAIL results

 tools/testing/selftests/ftrace/config              |  6 ++
 tools/testing/selftests/ftrace/ftracetest          | 72 ++++++++++++++++++----
 .../ftrace/test.d/00basic/ringbuffer_size.tc       | 22 +++++++
 .../selftests/ftrace/test.d/00basic/trace_pipe.tc  | 16 +++++
 .../selftests/ftrace/test.d/event/event-enable.tc  | 10 ---
 .../selftests/ftrace/test.d/event/event-pid.tc     |  8 +--
 .../ftrace/test.d/event/subsystem-enable.tc        | 10 ---
 .../ftrace/test.d/event/toplevel-enable.tc         | 10 ---
 .../selftests/ftrace/test.d/event/trace_printk.tc  | 27 ++++++++
 .../ftrace/test.d/ftrace/fgraph-filter-stack.tc    |  4 --
 .../ftrace/test.d/ftrace/fgraph-filter.tc          |  9 ---
 .../ftrace/test.d/ftrace/func-filter-pid.tc        | 10 ---
 .../ftrace/test.d/ftrace/func-filter-stacktrace.tc | 12 ++++
 .../selftests/ftrace/test.d/ftrace/func_cpumask.tc | 42 +++++++++++++
 .../ftrace/test.d/ftrace/func_event_triggers.tc    |  3 -
 .../ftrace/test.d/ftrace/func_mod_trace.tc         | 24 ++++++++
 .../ftrace/test.d/ftrace/func_profile_stat.tc      | 22 +++++++
 .../ftrace/test.d/ftrace/func_profiler.tc          |  4 --
 .../ftrace/test.d/ftrace/func_set_ftrace_file.tc   | 13 ----
 .../ftrace/test.d/ftrace/func_stack_tracer.tc      | 39 ++++++++++++
 .../test.d/ftrace/func_traceonoff_triggers.tc      | 11 ----
 tools/testing/selftests/ftrace/test.d/functions    | 11 ++++
 .../ftrace/test.d/kprobe/add_and_remove.tc         |  3 -
 .../selftests/ftrace/test.d/kprobe/busy_check.tc   |  3 -
 .../selftests/ftrace/test.d/kprobe/kprobe_args.tc  |  8 ++-
 .../ftrace/test.d/kprobe/kprobe_args_comm.tc       | 17 +++++
 .../ftrace/test.d/kprobe/kprobe_args_string.tc     |  5 --
 .../ftrace/test.d/kprobe/kprobe_args_symbol.tc     | 39 ++++++++++++
 .../ftrace/test.d/kprobe/kprobe_args_syntax.tc     |  8 +--
 .../ftrace/test.d/kprobe/kprobe_args_type.tc       | 52 ++++++++++------
 .../ftrace/test.d/kprobe/kprobe_eventname.tc       |  5 --
 .../ftrace/test.d/kprobe/kprobe_ftrace.tc          |  9 ---
 .../ftrace/test.d/kprobe/kprobe_module.tc          | 36 +++++++++--
 .../ftrace/test.d/kprobe/kretprobe_args.tc         |  9 ++-
 .../ftrace/test.d/kprobe/kretprobe_maxactive.tc    |  4 --
 .../ftrace/test.d/kprobe/multiple_kprobes.tc       |  5 --
 .../selftests/ftrace/test.d/kprobe/probepoint.tc   |  4 --
 .../selftests/ftrace/test.d/kprobe/profile.tc      | 15 +++++
 tools/testing/selftests/ftrace/test.d/template     |  1 +
 .../selftests/ftrace/test.d/tracer/wakeup.tc       | 25 ++++++++
 .../selftests/ftrace/test.d/tracer/wakeup_rt.tc    | 25 ++++++++
 .../inter-event/trigger-extended-error-support.tc  | 12 ----
 .../inter-event/trigger-field-variable-support.tc  | 15 +----
 .../trigger-inter-event-combined-hist.tc           | 15 +----
 .../inter-event/trigger-multi-actions-accept.tc    | 14 -----
 .../inter-event/trigger-onmatch-action-hist.tc     | 16 +----
 .../trigger-onmatch-onmax-action-hist.tc           | 16 +----
 .../inter-event/trigger-onmax-action-hist.tc       | 16 +----
 .../trigger-synthetic-event-createremove.tc        | 12 ----
 .../ftrace/test.d/trigger/trigger-eventonoff.tc    | 12 ----
 .../ftrace/test.d/trigger/trigger-filter.tc        | 14 -----
 .../ftrace/test.d/trigger/trigger-hist-mod.tc      | 12 ----
 .../ftrace/test.d/trigger/trigger-hist.tc          | 12 ----
 .../ftrace/test.d/trigger/trigger-multihist.tc     | 16 -----
 .../ftrace/test.d/trigger/trigger-snapshot.tc      | 12 ----
 .../ftrace/test.d/trigger/trigger-stacktrace.tc    | 12 ----
 .../test.d/trigger/trigger-trace-marker-hist.tc    | 11 ----
 .../trigger/trigger-trace-marker-snapshot.tc       | 16 +----
 .../trigger-trace-marker-synthetic-kernel.tc       | 12 ----
 .../trigger/trigger-trace-marker-synthetic.tc      | 12 ----
 .../ftrace/test.d/trigger/trigger-traceonoff.tc    | 12 ----
 tools/testing/selftests/gpio/Makefile              | 32 +++++-----
 tools/testing/selftests/kvm/dirty_log_test.c       |  4 +-
 tools/testing/selftests/kvm/lib/kvm_util.c         |  2 +-
 tools/testing/selftests/proc/fd-001-lookup.c       |  2 +-
 tools/testing/selftests/proc/fd-003-kthread.c      |  2 +-
 tools/testing/selftests/watchdog/watchdog-test.c   | 61 +++++++++++++++---
 67 files changed, 564 insertions(+), 466 deletions(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/ringbuffer_size.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/trace_pipe.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/event/trace_printk.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_mod_trace.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_profile_stat.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_stack_tracer.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_comm.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_symbol.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/profile.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/tracer/wakeup.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/tracer/wakeup_rt.tc

----------------------------------------------------------------

-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-4.20-rc1.diff
Type: text/x-patch
Size: 73117 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181025/57b9c877/attachment-0001.bin>
