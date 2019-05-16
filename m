From: skhan at linuxfoundation.org (Shuah Khan)
Date: Thu, 16 May 2019 15:52:38 -0600
Subject: [GIT PULL] Kselftest second update for Linux 5.2-rc1
Message-ID: <7af4f05b-abec-8d5b-3b99-a1eb12fd4a67@linuxfoundation.org>

Hi Linus,

Please pull the following Kselftest update for Linux 5.2-rc1

This kselftest second update for Linux 5.2-rc1 consists of

Kselftest framework fixes from Shuah Khan

- kselftest framework bpf build/test workflow regression fix
- Fix to kselftest install to use default install path
- Fix to kselftest KBUILD_OUTPUT builds to not clutter main
   KBUILD_OUTPUT directory with selftest objects

- .gitignore fixes from Kelsey Skunberg

- rseq selftests updates from Mathieu Desnoyers and Martin Schwidefsky:

   They change the per-architecture pre-abort signatures to ensure those
   are valid trap instructions.

   The way exit points are presented to debuggers is enhanced, ensuring
   all exit points are present, so debuggers don't have to disassemble
   rseq critical section to properly skip over them.

   Discussions with the glibc community is reaching a consensus of
   exposing a __rseq_handled symbol from glibc to coexist with rseq early
   adopters.
   Update the rseq selftest code to expose and use this symbol.

   Support for compiling asm goto with clang is added with the
   "-no-integrated-as" compiler switch, similarly to the top level kernel
   Makefile.

- kselftest Makefile test run output refactoring and making test
   output TAP13 compliant from Kees Cook:

   This re-factors the selftest Makefiles to extract the test running
   logic to be reused between "run_tests" and "emit_tests", while also
   fixing up the test output to be TAP version 13 compliant:
         - added "plan" line
         - fixed result line syntax
         - moved all test output to be "# "-prefixed as TAP "diagnostic"
           lines

   The prefixing code includes a fallback mode for limited execution
   environments.

   Additionally, the plan lines are fixed for all callers of kselftest.h.

diff is attached.

Also, there is a merge conflict with the following commit which went
through the s390 maintainer tree and is now in your master which will
require a minor fix-up.

commit e24e4712efad737ca09ff299276737331cd021d9
Author: Martin Schwidefsky <schwidefsky at de.ibm.com>
       rseq/selftests: s390: use trap4 for RSEQ_SIG


thanks,
-- Shuah

---------------------------------------------------------------
The following changes since commit d917fb876f6eaeeea8a2b620d2a266ce26372f4d:

   selftests: build and run gpio when output directory is the src dir 
(2019-04-22 17:02:26 -0600)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest 
tags/linux-kselftest-5.2-rc1-2

for you to fetch changes up to 61c2018c0743fe0c9ca68e308b5727b8a7c3d544:

   selftests: avoid KBUILD_OUTPUT dir cluttering with selftest objects 
(2019-05-14 17:37:41 -0600)

----------------------------------------------------------------
linux-kselftest-5.2-rc1-2

This kselftest second update for Linux 5.2-rc1 consists of

Kselftest framework fixes from Shuah Khan

- kselftest framework bpf build/test workflow regression fix
- Fix to kselftest install to use default install path
- Fix to kselftest KBUILD_OUTPUT builds to not clutter main
   KBUILD_OUTPUT directory with selftest objects

- .gitignore fixes from Kelsey Skunberg

- rseq selftests updates from Mathieu Desnoyers and Martin Schwidefsky:

   They change the per-architecture pre-abort signatures to ensure those
   are valid trap instructions.

   The way exit points are presented to debuggers is enhanced, ensuring
   all exit points are present, so debuggers don't have to disassemble
   rseq critical section to properly skip over them.

   Discussions with the glibc community is reaching a consensus of exposing
   a __rseq_handled symbol from glibc to coexist with rseq early adopters.
   Update the rseq selftest code to expose and use this symbol.

   Support for compiling asm goto with clang is added with the
   "-no-integrated-as" compiler switch, similarly to the top level kernel
   Makefile.

- kselftest Makefile test run output refactoring and making test
   output TAP13 compliant from Kees Cook:

   This re-factors the selftest Makefiles to extract the test running logic
   to be reused between "run_tests" and "emit_tests", while also fixing
   up the test output to be TAP version 13 compliant:
         - added "plan" line
         - fixed result line syntax
         - moved all test output to be "# "-prefixed as TAP "diagnostic"
           lines

   The prefixing code includes a fallback mode for limited execution
   environments.

   Additionally, the plan lines are fixed for all callers of kselftest.h.

----------------------------------------------------------------
Kees Cook (8):
       selftests: Extract single-test shell logic from lib.mk
       selftests: Use runner.sh for emit targets
       selftests: Extract logic for multiple test runs
       selftests: Add plan line and fix result line syntax
       selftests: Distinguish between missing and non-executable
       selftests: Move test output to diagnostic lines
       selftests: Remove KSFT_TAP_LEVEL
       selftests: Add test plan API to kselftest.h and adjust callers

Kelsey Skunberg (2):
       selftests: pidfd: Create .gitignore to include pidfd_test
       selftests: drivers: Create .gitignore to include /dma-buf/udmabuf

Martin Schwidefsky (1):
       rseq/selftests: s390: use trap4 for RSEQ_SIG

Mathieu Desnoyers (11):
       rseq/selftests: x86: Work-around bogus gcc-8 optimisation
       rseq/selftests: Add __rseq_exit_point_array section for debuggers
       rseq/selftests: Introduce __rseq_cs_ptr_array, rename 
__rseq_table to __rseq_cs
       rseq/selftests: Use __rseq_handled symbol to coexist with glibc
       rseq/selftests: s390: use jg instruction for jumps outside of the asm
       rseq/selftests: x86: use ud1 instruction as RSEQ_SIG opcode
       rseq/selftests: arm: use udf instruction for RSEQ_SIG
       rseq/selftests: aarch64 code signature: handle big-endian environment
       rseq/selftests: powerpc code signature: generate valid instructions
       rseq/selftests: mips: use break instruction for RSEQ_SIG
       rseq/selftests: add -no-integrated-as for clang

Shuah Khan (3):
       selftests: fix install target to use default install path
       selftests: fix bpf build/test workflow regression when 
KBUILD_OUTPUT is set
       selftests: avoid KBUILD_OUTPUT dir cluttering with selftest objects

  tools/testing/selftests/.gitignore                 |   1 -
  tools/testing/selftests/Makefile                   |  39 +--
  .../selftests/breakpoints/breakpoint_test.c        |  15 +-
  .../selftests/breakpoints/breakpoint_test_arm64.c  |   3 +-
  .../breakpoints/step_after_suspend_test.c          |   8 +
  tools/testing/selftests/capabilities/test_execve.c |   6 +-
  tools/testing/selftests/drivers/.gitignore         |   1 +
  .../selftests/futex/functional/futex_requeue_pi.c  |   1 +
  .../functional/futex_requeue_pi_mismatched_ops.c   |   1 +
  .../functional/futex_requeue_pi_signal_restart.c   |   1 +
  .../functional/futex_wait_private_mapped_file.c    |   1 +
  .../futex/functional/futex_wait_timeout.c          |   1 +
  .../functional/futex_wait_uninitialized_heap.c     |   1 +
  .../futex/functional/futex_wait_wouldblock.c       |   1 +
  tools/testing/selftests/kselftest.h                |  17 +-
  tools/testing/selftests/kselftest/prefix.pl        |  23 ++
  tools/testing/selftests/kselftest/runner.sh        |  86 +++++++
  tools/testing/selftests/lib.mk                     |  76 ++----
  .../testing/selftests/membarrier/membarrier_test.c |   1 +

  tools/testing/selftests/pidfd/.gitignore           |   1 +
  tools/testing/selftests/pidfd/pidfd_test.c         |   1 +
  tools/testing/selftests/rseq/Makefile              |   8 +-
  tools/testing/selftests/rseq/rseq-arm.h            | 132 +++++++++--
  tools/testing/selftests/rseq/rseq-arm64.h          |  74 +++++-
  tools/testing/selftests/rseq/rseq-mips.h           | 115 ++++++++-
  tools/testing/selftests/rseq/rseq-ppc.h            |  90 ++++++-
  tools/testing/selftests/rseq/rseq-s390.h           |  78 +++++-
  tools/testing/selftests/rseq/rseq-x86.h            | 264 
++++++++++++++-------
  tools/testing/selftests/rseq/rseq.c                |  55 ++++-
  tools/testing/selftests/rseq/rseq.h                |   1 +
  tools/testing/selftests/sigaltstack/sas.c          |   1 +
  tools/testing/selftests/sync/sync_test.c           |   1 +
  32 files changed, 883 insertions(+), 221 deletions(-)
  create mode 100644 tools/testing/selftests/drivers/.gitignore
  create mode 100755 tools/testing/selftests/kselftest/prefix.pl
  create mode 100644 tools/testing/selftests/kselftest/runner.sh
  create mode 100644 tools/testing/selftests/pidfd/.gitignore

---------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-5.2-rc1-2.diff
Type: text/x-patch
Size: 89753 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190516/1bbb5624/attachment-0001.bin>
