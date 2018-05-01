From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Tue,  1 May 2018 16:54:32 -0600
Subject: [PATCH 0/7] Kselftest framework SKIP handling
Message-ID: <cover.1525212671.git.shuah@kernel.org>

Kselftest framework currently treats all non-zero return codes from tests
as failures. When tests are skipped with non-zero return code, because of
unmet dependencies and/or unsupported configuration, it reports them as
failed. This will lead to too many false negatives even on the tests that
couldn't be run.

This patch series fixes the problem by adding SKIP handling:

The common RUN_TESTS and EMIT_TESTS functions are changed to test for
SKIP=4 return from tests. This change enables the framework and tests
that return SKIP=4 will report SKIP, other continue to report FAIL/PASS.

KSFT_SKIP has been changed to report Skip code of 4 instead of KSFT_PASS
to clearly differentiate the skipped tests.

I am working on Test changes to report SKIP instead FAIL/PASS when they get
skipped. I will be sending them out later this week.

In addition, I made changes to improve the reporting and cleaned up both
RUN_TESTS and EMIT_TESTS define to remove duplicate test output strings.

Shuah Khan (Samsung OSG) (7):
  selftests: lib.mk: cleanup RUN_TESTS define and make it readable
  selftests: lib.mk: add SKIP handling to RUN_TESTS define
  selftests: lib.mk: move running and printing result to a new function
  selftests: lib.mk: Include test suite name in the RUN_TESTS output
  selftests: lib.mk: add SKIP handling and test suite name to EMIT_TESTS
  selftests: lib.mk: add test execute bit check to EMIT_TESTS
  selftests: kselftest: change KSFT_SKIP=4 instead of KSFT_PASS

 tools/testing/selftests/Makefile    |  3 +-
 tools/testing/selftests/kselftest.h |  2 +-
 tools/testing/selftests/lib.mk      | 55 +++++++++++++++++++++++++++----------
 3 files changed, 44 insertions(+), 16 deletions(-)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
