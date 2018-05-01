From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Tue,  1 May 2018 16:54:35 -0600
Subject: [PATCH 3/7] selftests: lib.mk: move running and printing result to a
 new function
In-Reply-To: <cover.1525212671.git.shuah@kernel.org>
References: <cover.1525212671.git.shuah@kernel.org>
Message-ID: <a090e8b1b1123552a4a2b2163055e2ad812b0bab.1525212671.git.shuah@kernel.org>

RUN_TESTS function has grown and becoming harder to maintain. Move
the code that runs and tests for returns codes to a new function
and call it from RUN_TESTS.

A new RUN_TEST_PRINT_RESULT is created to simplify RUN_TESTS and make it
easier to add handling for other return codes as needed.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/lib.mk | 52 +++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index e8f5f8b3abeb..dd516f92f7c2 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -19,6 +19,33 @@ TEST_GEN_FILES := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_FILES))
 all: $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES)
 
 .ONESHELL:
+define RUN_TEST_PRINT_RESULT
+	echo "selftests: $$BASENAME_TEST";	\
+	echo "========================================";	\
+	if [ ! -x $$TEST ]; then	\
+		echo "selftests: Warning: file $$BASENAME_TEST is not executable, correct this.";\
+		echo "not ok 1..$$test_num selftests: $$BASENAME_TEST [FAIL]"; \
+	else					\
+		cd `dirname $$TEST` > /dev/null; \
+		if [ "X$(summary)" != "X" ]; then	\
+			(./$$BASENAME_TEST > /tmp/$$BASENAME_TEST 2>&1 && \
+			echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") || \
+			(if [ $$? -eq $$skip ]; then	\
+				echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [SKIP]";				\
+			else echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]";					\
+			fi;)			\
+		else				\
+			(./$$BASENAME_TEST &&	\
+			echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") ||						\
+			(if [ $$? -eq $$skip ]; then \
+				echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [SKIP]"; \
+			else echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]";				\
+			fi;)		\
+		fi;				\
+		cd - > /dev/null;		\
+	fi;
+endef
+
 define RUN_TESTS
 	@export KSFT_TAP_LEVEL=`echo 1`;		\
 	test_num=`echo 0`;				\
@@ -27,30 +54,7 @@ define RUN_TESTS
 	for TEST in $(1); do				\
 		BASENAME_TEST=`basename $$TEST`;	\
 		test_num=`echo $$test_num+1 | bc`;	\
-		echo "selftests: $$BASENAME_TEST";	\
-		echo "========================================";	\
-		if [ ! -x $$TEST ]; then	\
-			echo "selftests: Warning: file $$BASENAME_TEST is not executable, correct this.";\
-			echo "not ok 1..$$test_num selftests: $$BASENAME_TEST [FAIL]"; \
-		else					\
-			cd `dirname $$TEST` > /dev/null; \
-			if [ "X$(summary)" != "X" ]; then	\
-				(./$$BASENAME_TEST > /tmp/$$BASENAME_TEST 2>&1 && \
-				echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") || \
-				(if [ $$? -eq $$skip ]; then	\
-					echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [SKIP]";				\
-				else echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]";					\
-				fi;)			\
-			else				\
-				(./$$BASENAME_TEST &&	\
-				echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") ||						\
-				(if [ $$? -eq $$skip ]; then \
-					echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [SKIP]"; \
-				else echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]";				\
-				fi;)		\
-			fi;				\
-			cd - > /dev/null;		\
-		fi;					\
+		$(call RUN_TEST_PRINT_RESULT,$(TEST),$(BASENAME_TEST),$(test_num),$(skip))						\
 	done;
 endef
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
