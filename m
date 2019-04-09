From: keescook at chromium.org (Kees Cook)
Date: Tue,  9 Apr 2019 16:55:51 -0700
Subject: [PATCH 1/6] selftests: Extract single-test shell logic from lib.mk
In-Reply-To: <20190409235556.3967-1-keescook@chromium.org>
References: <20190409235556.3967-1-keescook@chromium.org>
Message-ID: <20190409235556.3967-2-keescook@chromium.org>

In order to improve the reusability of the kselftest test running logic,
this extracts the single-test logic from lib.mk into kselftest/runner.sh
which lib.mk can call directly. No changes in output.

As part of the change, this removes the unused "summary" Makefile variable
(and tests). However, future merging with the "emit_tests" target needs
to be able to redirect output, so a new "logfile" variable is introduced.

Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/.gitignore          |  1 -
 tools/testing/selftests/kselftest/runner.sh | 31 +++++++++++++++++++
 tools/testing/selftests/lib.mk              | 33 ++-------------------
 3 files changed, 34 insertions(+), 31 deletions(-)
 create mode 100644 tools/testing/selftests/kselftest/runner.sh

diff --git a/tools/testing/selftests/.gitignore b/tools/testing/selftests/.gitignore
index 91750352459d..8059ce834247 100644
--- a/tools/testing/selftests/.gitignore
+++ b/tools/testing/selftests/.gitignore
@@ -1,4 +1,3 @@
-kselftest
 gpiogpio-event-mon
 gpiogpio-hammer
 gpioinclude/
diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
new file mode 100644
index 000000000000..77d5510ac4c5
--- /dev/null
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -0,0 +1,31 @@
+#!/bin/sh
+#
+# Runs a set of tests in a given subdirectory.
+export skip_rc=4
+export logfile=/dev/stdout
+
+run_one()
+{
+	TEST="$1"
+	NUM="$2"
+
+	BASENAME_TEST=$(basename $TEST)
+
+	TEST_HDR_MSG="selftests: "`basename $PWD`:" $BASENAME_TEST"
+	echo "$TEST_HDR_MSG"
+	echo "========================================"
+	if [ ! -x "$TEST" ]; then
+		echo "$TEST_HDR_MSG: Warning: file $TEST is not executable, correct this."
+		echo "not ok 1..$test_num $TEST_HDR_MSG [FAIL]"
+	else
+		cd `dirname $TEST` > /dev/null
+		(./$BASENAME_TEST >> "$logfile" 2>&1 &&
+		echo "ok 1..$test_num $TEST_HDR_MSG [PASS]") ||
+		(if [ $? -eq $skip_rc ]; then	\
+			echo "not ok 1..$test_num $TEST_HDR_MSG [SKIP]"
+		else
+			echo "not ok 1..$test_num $TEST_HDR_MSG [FAIL]"
+		fi)
+		cd - >/dev/null
+	fi
+}
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 8b0f16409ed7..7da79fe0bb78 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -5,6 +5,7 @@ CC := $(CROSS_COMPILE)gcc
 ifeq (0,$(MAKELEVEL))
 OUTPUT := $(shell pwd)
 endif
+selfdir = $(realpath $(dir $(filter %/lib.mk,$(MAKEFILE_LIST))))
 
 # The following are built by lib.mk common compile rules.
 # TEST_CUSTOM_PROGS should be used by tests that require
@@ -31,43 +32,15 @@ all: $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES)
 endif
 
 .ONESHELL:
-define RUN_TEST_PRINT_RESULT
-	TEST_HDR_MSG="selftests: "`basename $$PWD`:" $$BASENAME_TEST";	\
-	echo $$TEST_HDR_MSG;					\
-	echo "========================================";	\
-	if [ ! -x $$TEST ]; then	\
-		echo "$$TEST_HDR_MSG: Warning: file $$BASENAME_TEST is not executable, correct this.";\
-		echo "not ok 1..$$test_num $$TEST_HDR_MSG [FAIL]"; \
-	else					\
-		cd `dirname $$TEST` > /dev/null; \
-		if [ "X$(summary)" != "X" ]; then	\
-			(./$$BASENAME_TEST > /tmp/$$BASENAME_TEST 2>&1 && \
-			echo "ok 1..$$test_num $$TEST_HDR_MSG [PASS]") || \
-			(if [ $$? -eq $$skip ]; then	\
-				echo "not ok 1..$$test_num $$TEST_HDR_MSG [SKIP]";				\
-			else echo "not ok 1..$$test_num $$TEST_HDR_MSG [FAIL]";					\
-			fi;)			\
-		else				\
-			(./$$BASENAME_TEST &&	\
-			echo "ok 1..$$test_num $$TEST_HDR_MSG [PASS]") ||						\
-			(if [ $$? -eq $$skip ]; then \
-				echo "not ok 1..$$test_num $$TEST_HDR_MSG [SKIP]"; \
-			else echo "not ok 1..$$test_num $$TEST_HDR_MSG [FAIL]";				\
-			fi;)		\
-		fi;				\
-		cd - > /dev/null;		\
-	fi;
-endef
-
 define RUN_TESTS
 	@export KSFT_TAP_LEVEL=`echo 1`;		\
 	test_num=`echo 0`;				\
-	skip=`echo 4`;					\
+	. $(selfdir)/kselftest/runner.sh;		\
 	echo "TAP version 13";				\
 	for TEST in $(1); do				\
 		BASENAME_TEST=`basename $$TEST`;	\
 		test_num=`echo $$test_num+1 | bc`;	\
-		$(call RUN_TEST_PRINT_RESULT,$(TEST),$(BASENAME_TEST),$(test_num),$(skip))						\
+		run_one "$$BASENAME_TEST" "$$test_num";	\
 	done;
 endef
 
-- 
2.17.1
