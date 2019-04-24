From: keescook at chromium.org (Kees Cook)
Date: Wed, 24 Apr 2019 16:12:29 -0700
Subject: [PATCH v2 0/8] selftests: Move test output to diagnostic lines
Message-ID: <20190424231237.14776-1-keescook@chromium.org>

This refactors the selftest Makefiles to extract the test running logic
to be reused between "run_tests" and "emit_tests", while also fixing
up the test output to be TAP version 13 compliant:
- added "plan" line
- fixed result line syntax
- moved all test output to be "# "-prefixed as TAP "diagnostic" lines

The prefixing code includes a fallback mode for limited execution
environments.

Additionally, the plan lines are fixed for all callers of kselftest.h.

-Kees

v2:
- fix external make variable "summary=1" through-out series (shuah)
- fix plan line output for all kselftest.h users

Kees Cook (8):
  selftests: Extract single-test shell logic from lib.mk
  selftests: Use runner.sh for emit targets
  selftests: Extract logic for multiple test runs
  selftests: Add plan line and fix result line syntax
  selftests: Distinguish between missing and non-executable
  selftests: Move test output to diagnostic lines
  selftests: Remove KSFT_TAP_LEVEL
  selftests: Add test plan API to kselftest.h and adjust callers

 tools/testing/selftests/.gitignore            |  1 -
 tools/testing/selftests/Makefile              | 24 ++----
 .../selftests/breakpoints/breakpoint_test.c   | 15 +++-
 .../breakpoints/breakpoint_test_arm64.c       |  3 +-
 .../breakpoints/step_after_suspend_test.c     |  8 ++
 .../selftests/capabilities/test_execve.c      |  6 +-
 .../futex/functional/futex_requeue_pi.c       |  1 +
 .../futex_requeue_pi_mismatched_ops.c         |  1 +
 .../futex_requeue_pi_signal_restart.c         |  1 +
 .../futex_wait_private_mapped_file.c          |  1 +
 .../futex/functional/futex_wait_timeout.c     |  1 +
 .../futex_wait_uninitialized_heap.c           |  1 +
 .../futex/functional/futex_wait_wouldblock.c  |  1 +
 tools/testing/selftests/kselftest.h           | 17 +++-
 tools/testing/selftests/kselftest/prefix.pl   | 23 +++++
 tools/testing/selftests/kselftest/runner.sh   | 86 +++++++++++++++++++
 tools/testing/selftests/lib.mk                | 64 +++-----------
 .../selftests/membarrier/membarrier_test.c    |  1 +
 tools/testing/selftests/pidfd/pidfd_test.c    |  1 +
 tools/testing/selftests/sigaltstack/sas.c     |  1 +
 tools/testing/selftests/sync/sync_test.c      |  1 +
 21 files changed, 178 insertions(+), 80 deletions(-)
 create mode 100755 tools/testing/selftests/kselftest/prefix.pl
 create mode 100644 tools/testing/selftests/kselftest/runner.sh

-- 
2.17.1
