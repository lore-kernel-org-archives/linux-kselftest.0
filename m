From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Wed, 28 Feb 2018 14:10:23 -0700
Subject: [GIT PULL] kselftest fixes update for 4.16-rc4
Message-ID: <9f1d717e-f968-feb6-5fe7-9bfb7c304743@osg.samsung.com>

Hi Linus,

Please pull the following Kselftest update for 4.16-rc4.

This kselftest fixes update for 4.16-rc4 consists of of fixes for
various problems in test output, compile errors, and missing configs.

Diff for the update is attached.

thanks,
-- Shuah

-----------------------------------------------------------------------------------
The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-4.16-rc4

for you to fetch changes up to f6869826de700bce59e2cef14974f99836e34e4f:

  selftests: vm: update .gitignore with new test (2018-02-26 16:09:50 -0700)

----------------------------------------------------------------
linux-kselftest-4.16-rc4

This kselftest fixes update for 4.16-rc4 consists of of fixes for
various problems in test output, compile errors, and missing configs.

----------------------------------------------------------------
Anders Roxell (2):
      selftests: sync: missing CFLAGS while compiling
      selftests: memfd: add config fragment for fuse

Daniel Díaz (2):
      selftests/android: Fix line continuation in Makefile
      selftests/futex: Fix line continuation in Makefile

Dominik Brodowski (1):
      selftest/vDSO: fix O=

Naresh Kamboju (1):
      selftests: pstore: Adding config fragment CONFIG_PSTORE_RAM=m

Shuah Khan (2):
      selftests: memory-hotplug: silence test command echo
      selftests: vm: update .gitignore with new test

 tools/testing/selftests/android/Makefile        |  8 ++++----
 tools/testing/selftests/futex/Makefile          |  6 +++---
 tools/testing/selftests/memfd/config            |  1 +
 tools/testing/selftests/memory-hotplug/Makefile |  2 +-
 tools/testing/selftests/pstore/config           |  1 +
 tools/testing/selftests/sync/Makefile           |  2 +-
 tools/testing/selftests/vDSO/Makefile           | 14 +++++++-------
 tools/testing/selftests/vm/.gitignore           |  1 +
 8 files changed, 19 insertions(+), 16 deletions(-)
 create mode 100644 tools/testing/selftests/memfd/config
-----------------------------------------------------------------------------------
