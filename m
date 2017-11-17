From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Fri, 17 Nov 2017 09:33:03 -0700
Subject: [Linux-kselftest-mirror] [GIT PULL] kselftest fix for 4.15-rc1
Message-ID: <a89b571f-b74c-08b1-148e-1784fefa15c6@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171117163303.EJA8YXkhrbXON_1a0iXSpVywOsQQM_QdHP7DQ-yJtSg@z>

Hi Linus,

Please pull the following Kselftest update for 4.15-rc1.

This update to Kselftest consists of cleanup patches, fixes, and a new
test for ion buffer sharing.

Fixes include changes to skip firmware tests on systems that aren't
configured to support them, as opposed to failing them.

Patches have been in linux-next for a while. I had to rebase to 4.14 to
resolve a minor conflict with the SPDX-License change selftest Makefile
that went into 4.14-rc8.

Diff for the update is attached.

thanks,
-- Shuah

-----------------------------------------------------------------------------------

The following changes since commit bebc6082da0a9f5d47a1ea2edc099bf671058bd4:

  Linux 4.14 (2017-11-12 10:46:13 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-4.15-rc1

for you to fetch changes up to c3e0d179bff503cd56758579a2c33216b40b9b7b:

  selftests: firmware: skip unsupported custom firmware fallback tests (2017-11-15 08:27:57 -0700)

----------------------------------------------------------------
linux-kselftest-4.15-rc1

This update to Kselftest consists of cleanup patches, fixes, and a new
test for ion buffer sharing.

Fixes include changes to skip firmware tests on systems that aren't
configured to support them, as opposed to failing them.

----------------------------------------------------------------
Amit Pundir (2):
      selftests: firmware: skip unsupported async loading tests
      selftests: firmware: skip unsupported custom firmware fallback tests

Greg Hackmann (1):
      selftests: vdso_test: support ARM64 targets

Lei Yang (2):
      selftests: ftrace: add more config fragments
      selftests: memfd_test.c: fix compilation warning.

Masami Hiramatsu (2):
      selftests/ftrace: Do not use arch dependent do_IRQ as a target function
      selftests/ftrace: Introduce exit_pass and exit_fail

Pintu Agarwal (1):
      android/ion: userspace test utility for ion buffer sharing

Shuah Khan (3):
      selftests: timers: Update .gitignore with newly added tests
      selftests: vm: Update .gitignore with newly added tests
      selftests: seccomp: update .gitignore with newly added tests

Steve Muckle (1):
      selftests/exec: include cwd in long path calculation

Sumit Semwal (1):
      selftests: breakpoints: fix compile error on breakpoint_test_arm64

lei.yang at windriver.com (2):
      selftests: add missing test result status in memory-hotplug test
      selftests: remove obsolete kconfig fragment for cpu-hotplug

 tools/testing/selftests/Makefile                   |   3 +-
 tools/testing/selftests/android/Makefile           |  46 ++++
 tools/testing/selftests/android/ion/.gitignore     |   2 +
 tools/testing/selftests/android/ion/Makefile       |  16 ++
 tools/testing/selftests/android/ion/README         | 101 ++++++++
 tools/testing/selftests/android/ion/config         |   4 +
 tools/testing/selftests/android/ion/ion.h          | 143 ++++++++++++
 tools/testing/selftests/android/ion/ion_test.sh    |  55 +++++
 .../testing/selftests/android/ion/ionapp_export.c  | 135 +++++++++++
 .../testing/selftests/android/ion/ionapp_import.c  |  88 +++++++
 tools/testing/selftests/android/ion/ionutils.c     | 259 +++++++++++++++++++++
 tools/testing/selftests/android/ion/ionutils.h     |  55 +++++
 tools/testing/selftests/android/ion/ipcsocket.c    | 227 ++++++++++++++++++
 tools/testing/selftests/android/ion/ipcsocket.h    |  35 +++
 tools/testing/selftests/android/run.sh             |   3 +
 .../selftests/breakpoints/breakpoint_test_arm64.c  |   1 +
 tools/testing/selftests/cpu-hotplug/config         |   1 -
 tools/testing/selftests/exec/execveat.c            |  27 ++-
 tools/testing/selftests/firmware/fw_fallback.sh    |  38 ++-
 tools/testing/selftests/firmware/fw_filesystem.sh  |  34 +--
 tools/testing/selftests/ftrace/config              |   4 +
 tools/testing/selftests/ftrace/ftracetest          |   7 +
 .../selftests/ftrace/test.d/00basic/basic4.tc      |   2 +-
 .../selftests/ftrace/test.d/event/event-enable.tc  |   2 +-
 .../selftests/ftrace/test.d/event/event-pid.tc     |   2 +-
 .../ftrace/test.d/event/subsystem-enable.tc        |   2 +-
 .../ftrace/test.d/event/toplevel-enable.tc         |   2 +-
 .../ftrace/test.d/ftrace/fgraph-filter-stack.tc    |   2 +-
 .../ftrace/test.d/ftrace/fgraph-filter.tc          |   2 +-
 .../ftrace/test.d/ftrace/func-filter-pid.tc        |   2 +-
 .../ftrace/test.d/ftrace/func_event_triggers.tc    |   5 +-
 .../ftrace/test.d/ftrace/func_profiler.tc          |   2 +-
 .../ftrace/test.d/ftrace/func_set_ftrace_file.tc   |   4 +-
 .../test.d/ftrace/func_traceonoff_triggers.tc      |   2 +-
 .../ftrace/test.d/instances/instance-event.tc      |   2 +-
 .../selftests/ftrace/test.d/instances/instance.tc  |   2 +-
 .../selftests/ftrace/test.d/kprobe/busy_check.tc   |   2 +-
 .../selftests/ftrace/test.d/kprobe/kprobe_args.tc  |   2 +-
 .../ftrace/test.d/kprobe/kprobe_args_type.tc       |   2 +-
 .../ftrace/test.d/kprobe/kretprobe_args.tc         |   2 +-
 tools/testing/selftests/ftrace/test.d/template     |   1 +
 .../ftrace/test.d/trigger/trigger-eventonoff.tc    |   2 +-
 .../ftrace/test.d/trigger/trigger-filter.tc        |   2 +-
 .../ftrace/test.d/trigger/trigger-hist-mod.tc      |   2 +-
 .../ftrace/test.d/trigger/trigger-hist.tc          |   2 +-
 .../ftrace/test.d/trigger/trigger-multihist.tc     |   2 +-
 .../ftrace/test.d/trigger/trigger-snapshot.tc      |   2 +-

 .../ftrace/test.d/trigger/trigger-stacktrace.tc    |   2 +-
 .../ftrace/test.d/trigger/trigger-traceonoff.tc    |   2 +-
 tools/testing/selftests/memfd/memfd_test.c         |   4 +-
 tools/testing/selftests/memory-hotplug/Makefile    |   4 +-
 tools/testing/selftests/seccomp/.gitignore         |   1 +
 tools/testing/selftests/timers/.gitignore          |   2 +
 tools/testing/selftests/vDSO/vdso_test.c           |  19 +-
 tools/testing/selftests/vm/.gitignore              |   2 +
 55 files changed, 1303 insertions(+), 71 deletions(-)
 create mode 100644 tools/testing/selftests/android/Makefile
 create mode 100644 tools/testing/selftests/android/ion/.gitignore
 create mode 100644 tools/testing/selftests/android/ion/Makefile
 create mode 100644 tools/testing/selftests/android/ion/README
 create mode 100644 tools/testing/selftests/android/ion/config
 create mode 100644 tools/testing/selftests/android/ion/ion.h
 create mode 100755 tools/testing/selftests/android/ion/ion_test.sh
 create mode 100644 tools/testing/selftests/android/ion/ionapp_export.c
 create mode 100644 tools/testing/selftests/android/ion/ionapp_import.c
 create mode 100644 tools/testing/selftests/android/ion/ionutils.c
 create mode 100644 tools/testing/selftests/android/ion/ionutils.h
 create mode 100644 tools/testing/selftests/android/ion/ipcsocket.c
 create mode 100644 tools/testing/selftests/android/ion/ipcsocket.h
 create mode 100755 tools/testing/selftests/android/run.sh

-----------------------------------------------------------------------------------
