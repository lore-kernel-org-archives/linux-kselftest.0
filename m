From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Tue,  1 May 2018 16:54:36 -0600
Subject: [PATCH 4/7] selftests: lib.mk: Include test suite name in the
 RUN_TESTS output
In-Reply-To: <cover.1525212671.git.shuah@kernel.org>
References: <cover.1525212671.git.shuah@kernel.org>
Message-ID: <87a45d125d28566835bfe836732c40805055b665.1525212671.git.shuah@kernel.org>

Currently just the test name is printed in the RUN_TESTS output. For
example, when raw_skew sub-test from timers tests in run, the output
shows just raw_skew. Include main test name when printing sub-test
results.

In addition, remove duplicate strings for printing common information
with a new for the test header information.

Before the change:

selftests: raw_skew
========================================
WARNING: ADJ_OFFSET in progress, this will cause inaccurate results
Estimating clock drift: -20.616(est) -20.586(act)       [OK]
Pass 0 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
1..0
ok 1..7 selftests: raw_skew [PASS]

After the change:

selftests: timers: raw_skew
========================================
WARNING: ADJ_OFFSET in progress, this will cause inaccurate results
Estimating clock drift: -19.794(est) -19.896(act)       [OK]
Pass 0 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
1..0
ok 1..7 selftests: timers: raw_skew [PASS]

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/lib.mk | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index dd516f92f7c2..eb2be6dabbda 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -20,26 +20,27 @@ all: $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES)
 
 .ONESHELL:
 define RUN_TEST_PRINT_RESULT
-	echo "selftests: $$BASENAME_TEST";	\
+	TEST_HDR_MSG="selftests: "`basename $$PWD`:" $$BASENAME_TEST";	\
+	echo $$TEST_HDR_MSG;					\
 	echo "========================================";	\
 	if [ ! -x $$TEST ]; then	\
-		echo "selftests: Warning: file $$BASENAME_TEST is not executable, correct this.";\
-		echo "not ok 1..$$test_num selftests: $$BASENAME_TEST [FAIL]"; \
+		echo "$$TEST_HDR_MSG: Warning: file $$BASENAME_TEST is not executable, correct this.";\
+		echo "not ok 1..$$test_num $$TEST_HDR_MSG [FAIL]"; \
 	else					\
 		cd `dirname $$TEST` > /dev/null; \
 		if [ "X$(summary)" != "X" ]; then	\
 			(./$$BASENAME_TEST > /tmp/$$BASENAME_TEST 2>&1 && \
-			echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") || \
+			echo "ok 1..$$test_num $$TEST_HDR_MSG [PASS]") || \
 			(if [ $$? -eq $$skip ]; then	\
-				echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [SKIP]";				\
-			else echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]";					\
+				echo "not ok 1..$$test_num $$TEST_HDR_MSG [SKIP]";				\
+			else echo "not ok 1..$$test_num $$TEST_HDR_MSG [FAIL]";					\
 			fi;)			\
 		else				\
 			(./$$BASENAME_TEST &&	\
-			echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") ||						\
+			echo "ok 1..$$test_num $$TEST_HDR_MSG [PASS]") ||						\
 			(if [ $$? -eq $$skip ]; then \
-				echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [SKIP]"; \
-			else echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]";				\
+				echo "not ok 1..$$test_num $$TEST_HDR_MSG [SKIP]"; \
+			else echo "not ok 1..$$test_num $$TEST_HDR_MSG [FAIL]";				\
 			fi;)		\
 		fi;				\
 		cd - > /dev/null;		\
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
