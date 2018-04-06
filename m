From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Fri, 6 Apr 2018 15:06:23 -0600
Subject: [GIT PULL] kselftest update for 4.17-rc1
Message-ID: <b5ad417c-e608-a6e3-6978-5691369c41c3@osg.samsung.com>

Hi Linus,

Please pull the following Kselftest update for 4.17-rc1

This Kselftest update for 4.17-rc1 consists of:

- Test build error fixes.
- Fixes to prevent intel_pstate from building on non-x86 systems.
- New test for ion with vgem driver.
- Change to print the test name to /dev/kmsg to add context to kernel
  failures if any uncovered from running the test.
- Kselftest framework enhancements to add KSFT_TAP_LEVEL environment
  variable to prevent nested TAP headers being printed in the Kselftest
  output. Nested TAP13 headers could cause problems for some parsers.
  This change suppresses the nested headers from test programs and test
  shell scripts with changes to framework and Makefiles without changing
  the tests.

Diff for the update is attached.

thanks,
-- Shuah

-----------------------------------------------------------------------------------
The following changes since commit 661e50bc853209e41a5c14a290ca4decc43cbfd1:

  Linux 4.16-rc4 (2018-03-04 14:54:11 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-4.17-rc1

for you to fetch changes up to 6aa69043d9f3f4adc5b3817ccfcac1fddfe10ded:

  selftests/intel_pstate: Fix build rule for x86 (2018-04-02 11:55:47 -0600)

----------------------------------------------------------------
linux-kselftest-4.17-rc1

This Kselftest update for 4.17-rc1 consists of:

- Test build error fixes.
- Fixes to prevent intel_pstate from building on non-x86 systems.
- New test for ion with vgem driver.
- Change to print the test name to /dev/kmsg to add context to kernel
  failures if any uncovered from running the test.
- Kselftest framework enhancements to add KSFT_TAP_LEVEL environment
  variable to prevent nested TAP headers being printed in the Kselftest
  output. Nested TAP13 headers could cause problems for some parsers.
  This change suppresses the nested headers from test programs and test
  shell scripts with changes to framework and Makefiles without changing
  the tests.

----------------------------------------------------------------
Anders Roxell (1):
      selftests/android/ion: Makefile: fix build error

Daniel Díaz (1):
      selftests/intel_pstate: Fix build rule for x86

Kees Cook (1):
      selftests/seccomp: Allow get_metadata to XFAIL

Laura Abbott (2):
      selftests: ion: Remove some prints
      selftests: ion: Add simple test with the vgem driver

Michael Ellerman (1):
      selftests: Print the test we're running to /dev/kmsg

Shuah Khan (4):
      selftests: kselftest framework: add handling for TAP header level
      selftests: lib.mk set KSFT_TAP_LEVEL to prevent nested TAP headers
      selftests: Makefile set KSFT_TAP_LEVEL to prevent nested TAP headers
      selftests: futex Makefile add top level TAP header echo to RUN_TESTS

 tools/testing/selftests/Makefile                  |  11 +-
tools/testing/selftests/android/ion/.gitignore    |   1 +
 tools/testing/selftests/android/ion/Makefile      |   5 +-
 tools/testing/selftests/android/ion/config        |   1 +
 tools/testing/selftests/android/ion/ionmap_test.c | 136 ++++++++++++++++++++++
 tools/testing/selftests/android/ion/ionutils.c    |   6 -
 tools/testing/selftests/futex/Makefile            |   4 +
 tools/testing/selftests/intel_pstate/Makefile     |   5 +-
 tools/testing/selftests/kselftest.h               |   3 +-
 tools/testing/selftests/kselftest_harness.h       |  26 ++++-
 tools/testing/selftests/lib.mk                    |   1 +
 tools/testing/selftests/seccomp/seccomp_bpf.c     |  15 ++-
 12 files changed, 200 insertions(+), 14 deletions(-)
 create mode 100644 tools/testing/selftests/android/ion/ionmap_test.c
-----------------------------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-4.17-rc1.diff
Type: text/x-patch
Size: 12041 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20180406/4c8e7984/attachment-0001.bin>
