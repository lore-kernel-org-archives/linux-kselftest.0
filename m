From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Tue,  1 May 2018 16:54:37 -0600
Subject: [PATCH 5/7] selftests: lib.mk: add SKIP handling and test suite name
 to EMIT_TESTS
In-Reply-To: <cover.1525212671.git.shuah@kernel.org>
References: <cover.1525212671.git.shuah@kernel.org>
Message-ID: <eaa689c8fa2397e68bc1cf3bf4dce02feb21a62a.1525212671.git.shuah@kernel.org>

EMIT_TESTS which is the common function that implements run_tests target,
treats all non-zero return codes from tests as failures. When tests are
skipped with non-zero return code, because of unmet dependencies and/or
unsupported configuration, it reports them as failed. This will lead to
too many false negatives even on the tests that couldn't be run.

EMIT_TESTS is changed to test for SKIP=4 return from tests to enable
the framework for individual tests to return special SKIP code.

Tests will be changed as needed to report SKIP instead FAIL/PASS when
they get skipped.

Currently just the test name is printed in the RUN_TESTS output. For
example, when raw_skew sub-test from timers tests in run, the output
shows just raw_skew. Include main test name when printing sub-test
results.

In addition, remove duplicate strings for printing common information with
a new for the test header information.

With this change run_kelftest.sh output for breakpoints test will be:

TAP version 13
Running tests in breakpoints
========================================
selftests: breakpoints: step_after_suspend_test
not ok 1..1 selftests: breakpoints: step_after_suspend_test [SKIP]
selftests: breakpoints: breakpoint_test
ok 1..2 selftests: breakpoints: breakpoint_test [PASS]

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/Makefile | 3 ++-
 tools/testing/selftests/lib.mk   | 8 ++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 32aafa92074c..302c7ea8b820 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -134,7 +134,8 @@ ifdef INSTALL_PATH
 	echo "else" >> $(ALL_SCRIPT)
 	echo "  OUTPUT=/dev/stdout" >> $(ALL_SCRIPT)
 	echo "fi" >> $(ALL_SCRIPT)
-	echo "export KSFT_TAP_LEVEL=`echo 1`" >> $(ALL_SCRIPT)
+	echo "export KSFT_TAP_LEVEL=1" >> $(ALL_SCRIPT)
+	echo "export skip=4" >> $(ALL_SCRIPT)
 
 	for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index eb2be6dabbda..0c6012500026 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -94,9 +94,13 @@ else
 endif
 
 define EMIT_TESTS
-	@for TEST in $(TEST_GEN_PROGS) $(TEST_CUSTOM_PROGS) $(TEST_PROGS); do \
+	@test_num=`echo 0`;				\
+	for TEST in $(TEST_GEN_PROGS) $(TEST_CUSTOM_PROGS) $(TEST_PROGS); do \
 		BASENAME_TEST=`basename $$TEST`;	\
-		echo "(./$$BASENAME_TEST >> \$$OUTPUT 2>&1 && echo \"selftests: $$BASENAME_TEST [PASS]\") || echo \"selftests: $$BASENAME_TEST [FAIL]\""; \
+		test_num=`echo $$test_num+1 | bc`;	\
+		TEST_HDR_MSG="selftests: "`basename $$PWD`:" $$BASENAME_TEST";	\
+		echo "echo $$TEST_HDR_MSG";	\
+		echo "(./$$BASENAME_TEST >> \$$OUTPUT 2>&1 && echo \"ok 1..$$test_num $$TEST_HDR_MSG [PASS]\") || (if [ \$$? -eq \$$skip ]; then echo \"not ok 1..$$test_num $$TEST_HDR_MSG [SKIP]\"; else echo \"not ok 1..$$test_num $$TEST_HDR_MSG [FAIL]\"; fi;)"; \
 	done;
 endef
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
