From: skhan at linuxfoundation.org (Shuah Khan)
Date: Mon, 6 May 2019 10:56:56 -0600
Subject: [GIT PULL] Kselftest update for Linux 5.2-rc1
Message-ID: <9b434125-44b6-0e83-4f70-d1fd28752407@linuxfoundation.org>

Hi Linus,

Please pull the following Kselftest update for Linux 5.2-rc1

This Kselftest update for Linux 5.2-rc1 consists of

- fixes to seccomp test, and kselftest framework
- cleanups to remove duplicate header defines
- fixes to efivarfs "make clean" target
- cgroup cleanup path
- Moving the IMA kexec_load selftest to selftests/kexec work from
   Mimi Johar and Petr Vorel
- A framework to kselftest for writing kernel test modules addition
   from Tobin C. Harding

diff is attached.

thanks,
-- Shuah


----------------------------------------------------------------
The following changes since commit 15ade5d2e7775667cf191cf2f94327a4889f8b9d:

   Linux 5.1-rc4 (2019-04-07 14:09:59 -1000)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest 
tags/linux-kselftest-5.2-rc1

for you to fetch changes up to d917fb876f6eaeeea8a2b620d2a266ce26372f4d:

   selftests: build and run gpio when output directory is the src dir 
(2019-04-22 17:02:26 -0600)

----------------------------------------------------------------
linux-kselftest-5.2-rc1

This Kselftest update for Linux 5.2-rc1 consists of

- fixes to seccomp test, and kselftest framework
- cleanups to remove duplicate header defines
- fixes to efivarfs "make clean" target
- cgroup cleanup path
- Moving the IMA kexec_load selftest to selftests/kexec work from
   Mimi Johar and Petr Vorel
- A framework to kselftest for writing kernel test modules addition
   from Tobin C. Harding

----------------------------------------------------------------
Kees Cook (3):
       selftests/seccomp: Handle namespace failures gracefully
       selftests/harness: Add 30 second timeout per test
       selftests/ipc: Fix msgque compiler warnings

Mathieu Desnoyers (1):
       rseq/selftests: Adapt number of threads to the number of detected 
cpus

Mimi Zohar (9):
       selftests/kexec: move the IMA kexec_load selftest to selftests/kexec
       selftests/kexec: cleanup the kexec selftest
       selftests/kexec: define a set of common functions
       selftests/kexec: define common logging functions
       selftests/kexec: define "require_root_privileges"
       selftests/kexec: kexec_file_load syscall test
       selftests/kexec: check kexec_load and kexec_file_load are enabled
       selftests/kexec: make kexec_load test independent of IMA being 
enabled
       selftests/kexec: update get_secureboot_mode

Petr Vorel (1):
       selftests/kexec: Add missing '=y' to config options

Po-Hsu Lin (1):
       selftests/efivarfs: clean up test files from test_create*()

Roman Gushchin (1):
       selftests: cgroup: fix cleanup path in test_memcg_subtree_control()

Sabyasachi Gupta (4):
       selftest/x86/mpx-dig.c: Remove duplicate header
       selftest/timers: Remove duplicate header
       selftest/rseq: Remove duplicate header
       selftest/gpio: Remove duplicate header

Shuah Khan (2):
       selftests: fix headers_install circular dependency
       selftests: build and run gpio when output directory is the src dir

Tobin C. Harding (6):
       lib/test_printf: Add empty module_exit function
       kselftest: Add test runner creation script
       kselftest: Add test module framework header
       lib: Use new kselftest header
       lib/string: Add strscpy_pad() function
       lib: Add test module for strscpy_pad

ZhangXiaoxu (1):
       selftests: efivarfs: remove the test_create_read file if it was exist

  Documentation/dev-tools/kselftest.rst              |  94 ++++++++-
  include/linux/string.h                             |   4 +
  lib/Kconfig.debug                                  |   3 +
  lib/Makefile                                       |   1 +
  lib/string.c                                       |  47 ++++-
  lib/test_bitmap.c                                  |  20 +-
  lib/test_printf.c                                  |  17 +-
  lib/test_strscpy.c                                 | 150 ++++++++++++++
  tools/testing/selftests/Makefile                   |  63 +++++-
  tools/testing/selftests/cgroup/test_memcontrol.c   |  38 ++--
  tools/testing/selftests/efivarfs/efivarfs.sh       |  28 ++-
  tools/testing/selftests/gpio/gpio-mockup-chardev.c |   1 -
  tools/testing/selftests/ima/config                 |   4 -
  tools/testing/selftests/ima/test_kexec_load.sh     |  54 -----
  tools/testing/selftests/ipc/msgque.c               |  11 +-
  tools/testing/selftests/{ima => kexec}/Makefile    |   5 +-
  tools/testing/selftests/kexec/config               |   3 +
  tools/testing/selftests/kexec/kexec_common_lib.sh  | 220 
+++++++++++++++++++++
  .../selftests/kexec/test_kexec_file_load.sh        | 208 
+++++++++++++++++++
  tools/testing/selftests/kexec/test_kexec_load.sh   |  47 +++++
  tools/testing/selftests/kselftest_harness.h        |   2 +
  tools/testing/selftests/kselftest_module.h         |  48 +++++
  tools/testing/selftests/kselftest_module.sh        |  84 ++++++++
  tools/testing/selftests/lib.mk                     |  38 +++-
  tools/testing/selftests/lib/Makefile               |   2 +-
  tools/testing/selftests/lib/bitmap.sh              |  18 +-
  tools/testing/selftests/lib/config                 |   1 +
  tools/testing/selftests/lib/prime_numbers.sh       |  17 +-
  tools/testing/selftests/lib/printf.sh              |  19 +-
  tools/testing/selftests/lib/strscpy.sh             |   3 +
  tools/testing/selftests/rseq/rseq.h                |   1 -
  tools/testing/selftests/rseq/run_param_test.sh     |   7 +-
  tools/testing/selftests/seccomp/seccomp_bpf.c      |  43 ++--
  tools/testing/selftests/timers/skew_consistency.c  |   1 -
  tools/testing/selftests/x86/mpx-dig.c              |   2 -
  35 files changed, 1081 insertions(+), 223 deletions(-)
  create mode 100644 lib/test_strscpy.c
  delete mode 100644 tools/testing/selftests/ima/config
  delete mode 100755 tools/testing/selftests/ima/test_kexec_load.sh
rename tools/testing/selftests/{ima => kexec}/Makefile (59%)
  create mode 100644 tools/testing/selftests/kexec/config
  create mode 100755 tools/testing/selftests/kexec/kexec_common_lib.sh
  create mode 100755 tools/testing/selftests/kexec/test_kexec_file_load.sh
  create mode 100755 tools/testing/selftests/kexec/test_kexec_load.sh
  create mode 100644 tools/testing/selftests/kselftest_module.h
  create mode 100755 tools/testing/selftests/kselftest_module.sh
  create mode 100755 tools/testing/selftests/lib/strscpy.sh
----------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-5.2-rc1.diff
Type: text/x-patch
Size: 56545 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190506/c6c12a35/attachment-0001.bin>
