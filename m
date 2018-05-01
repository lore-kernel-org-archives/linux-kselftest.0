From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Tue,  1 May 2018 16:54:34 -0600
Subject: [PATCH 2/7] selftests: lib.mk: add SKIP handling to RUN_TESTS define
In-Reply-To: <cover.1525212671.git.shuah@kernel.org>
References: <cover.1525212671.git.shuah@kernel.org>
Message-ID:
 <5e0281115a0de58998da8f5bbfc391026f4716f6.1525212671.git.shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180501225434.0guv9ahab0lRb0YTLehH2t1VT-2Jlsh-783bThTixiY@z>

RUN_TESTS which is the common function that implements run_tests target,
treats all non-zero return codes from tests as failures. When tests are
skipped with non-zero return code, because of unmet dependencies and/or
unsupported configuration, it reports them as failed. This will lead to
too many false negatives even on the tests that couldn't be run.

RUN_TESTS is changed to test for SKIP=4 return from tests to enable the
framework for individual tests to return special SKIP code.

Tests will be changed as needed to report SKIP instead FAIL/PASS when
they get skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/lib.mk | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 1d2b48f2d481..e8f5f8b3abeb 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -22,6 +22,7 @@ all: $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES)
 define RUN_TESTS
 	@export KSFT_TAP_LEVEL=`echo 1`;		\
 	test_num=`echo 0`;				\
+	skip=`echo 4`;					\
 	echo "TAP version 13";				\
 	for TEST in $(1); do				\
 		BASENAME_TEST=`basename $$TEST`;	\
@@ -34,9 +35,19 @@ define RUN_TESTS
 		else					\
 			cd `dirname $$TEST` > /dev/null; \
 			if [ "X$(summary)" != "X" ]; then	\
-				(./$$BASENAME_TEST > /tmp/$$BASENAME_TEST 2>&1 && echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") || echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]";		\
+				(./$$BASENAME_TEST > /tmp/$$BASENAME_TEST 2>&1 && \
+				echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") || \
+				(if [ $$? -eq $$skip ]; then	\
+					echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [SKIP]";				\
+				else echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]";					\
+				fi;)			\
 			else				\
-				(./$$BASENAME_TEST && echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") || echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]";					\
+				(./$$BASENAME_TEST &&	\
+				echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") ||						\
+				(if [ $$? -eq $$skip ]; then \
+					echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [SKIP]"; \
+				else echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]";				\
+				fi;)		\
 			fi;				\
 			cd - > /dev/null;		\
 		fi;					\
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
