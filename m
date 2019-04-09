From: keescook at chromium.org (Kees Cook)
Date: Tue,  9 Apr 2019 16:55:50 -0700
Subject: [PATCH 0/6] selftests: Move test output to diagnostic lines
Message-ID: <20190409235556.3967-1-keescook@chromium.org>

This refactors the selftest Makefiles to extract the test running logic
to be reused between "run_tests" and "emit_tests", while also fixing
up the test output to be TAP version 13 compliant:
- added "plan" line
- fixed result line syntax
- moved all test output to be "# "-prefixed as TAP "diagnostic" lines

The prefixing code includes a fallback mode for limited execution
environments.

-Kees

Kees Cook (6):
  selftests: Extract single-test shell logic from lib.mk
  selftests: Use runner.sh for emit targets
  selftests: Extract logic for multiple test runs
  selftests/runner: Add plan line and fix result line syntax
  selftests/runner: Distinguish between missing and non-executable
  selftests: Move test output to diagnostic lines

 tools/testing/selftests/.gitignore          |  1 -
 tools/testing/selftests/Makefile            | 18 +++--
 tools/testing/selftests/kselftest/prefix.pl | 23 ++++++
 tools/testing/selftests/kselftest/runner.sh | 80 +++++++++++++++++++++
 tools/testing/selftests/lib.mk              | 61 +++-------------
 5 files changed, 119 insertions(+), 64 deletions(-)
 create mode 100755 tools/testing/selftests/kselftest/prefix.pl
 create mode 100644 tools/testing/selftests/kselftest/runner.sh

-- 
2.17.1
