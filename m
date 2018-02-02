From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Fri, 2 Feb 2018 10:19:12 -0700
Subject: [Linux-kselftest-mirror] [GIT PULL] kselftest update for 4.16-rc1
Message-ID: <1702f942-5edc-89b4-0ff7-16483236c674@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180202171912.tlQUjqJhVGZxyq6gKsUka4DpU0A081aZxi0UVknV1jQ@z>

Hi Linus,

Please pull the following Kselftest update for 4.16-rc1

This update to Kselftest consists of fixes, cleanups, and SPDX license
additions.

Diff for the update is attached.

thanks,
-- Shuah

-----------------------------------------------------------------------------------

The following changes since commit ae64f9bd1d3621b5e60d7363bc20afb46aede215:

  Linux 4.15-rc2 (2017-12-03 11:01:47 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-4.16-rc1

for you to fetch changes up to 0e9e327d1622c332e5b1db272d5c97af82164f68:

  selftests: vm: update .gitignore with missing generated file (2018-01-23 07:47:06 -0700)

----------------------------------------------------------------
linux-kselftest-4.16-rc1

This update to Kselftest consists of fixes, cleanups, and SPDX license
additions.

----------------------------------------------------------------
Anders Roxell (1):
      selftests: seccomp: fix compile error seccomp_bpf

Arnd Bergmann (1):
      kselftest: fix OOM in memory compaction test

Dmitry Safonov (1):
      selftests/x86: Add <test_name>{,_32,_64} targets

Luis de Bethencourt (1):
      tools/testing: Fix trailing semicolon

Masami Hiramatsu (2):
      selftest: ftrace: Fix to pick text symbols for kprobes
      selftest: ftrace: Fix to add 256 kprobe events correctly

Michael Ellerman (1):
      selftests: Fix loss of test output in run_kselftests.sh

Shuah Khan (6):
      selftests: media_tests: Fix Makefile 'clean' target warning
      selftests: gen_kselftest_tar.h: Add SPDX license identifier
      selftests: kselftest_install.sh: Add SPDX license identifier
      selftests: kselftest.h: Add SPDX license identifier
      selftests: media_tests: Add SPDX license identifier
      selftests: vm: update .gitignore with missing generated file

 tools/testing/selftests/Makefile                    |  9 ++++++++-
 .../ftrace/test.d/kprobe/multiple_kprobes.tc        | 21 ++++++++++++++++++---
 tools/testing/selftests/gen_kselftest_tar.sh        |  4 +---
 tools/testing/selftests/kselftest.h                 |  2 +-
 tools/testing/selftests/kselftest_install.sh        |  4 +---
 tools/testing/selftests/lib.mk                      |  2 +-
tools/testing/selftests/media_tests/Makefile        |  7 ++-----
 .../selftests/media_tests/media_device_open.c       |  3 ++-
 .../selftests/media_tests/media_device_test.c       |  3 ++-
 .../selftests/media_tests/video_device_test.c       |  3 ++-
 tools/testing/selftests/nsfs/pidns.c                |  2 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c       |  4 ++--
 tools/testing/selftests/vm/.gitignore               |  1 +
 tools/testing/selftests/vm/compaction_test.c        |  2 ++
 tools/testing/selftests/x86/Makefile                | 12 ++++++++++++
 15 files changed, 56 insertions(+), 23 deletions(-)
-----------------------------------------------------------------------------------
