From: keescook@chromium.org (Kees Cook)
Date: Wed, 24 Apr 2019 16:12:32 -0700
Subject: [PATCH v2 3/8] selftests: Extract logic for multiple test runs
In-Reply-To: <20190424231237.14776-1-keescook@chromium.org>
References: <20190424231237.14776-1-keescook@chromium.org>
Message-ID: <20190424231237.14776-4-keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424231232.VEVcVRmp0oSPd-E4UQy-dUmq2MJOu1wKwNVPNPRVYrM@z>

This moves the logic for running multiple tests into a single "run_many"
function of runner.sh. Both "run_tests" and "emit_tests" are modified to
use it. Summary handling is now controlled by the "per_test_logging"
shell flag.

Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/Makefile            |  6 ++---
 tools/testing/selftests/kselftest/runner.sh | 25 ++++++++++++++++++---
 tools/testing/selftests/lib.mk              | 25 +++++++--------------
 3 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index c5f9f736cdbd..4ac1d1c7ce5b 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -193,16 +193,14 @@ ifdef INSTALL_PATH
 	echo "  logfile=\$$BASE_DIR/output.log" >> $(ALL_SCRIPT)
 	echo "  cat /dev/null > \$$logfile" >> $(ALL_SCRIPT)
 	echo "fi" >> $(ALL_SCRIPT)
-	echo "export KSFT_TAP_LEVEL=1" >> $(ALL_SCRIPT)
 
 	for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
-		echo "echo ; echo TAP version 13" >> $(ALL_SCRIPT);	\
-		echo "echo Running tests in $$TARGET" >> $(ALL_SCRIPT); \
-		echo "echo ========================================" >> $(ALL_SCRIPT); \
 		echo "[ -w /dev/kmsg ] && echo \"kselftest: Running tests in $$TARGET\" >> /dev/kmsg" >> $(ALL_SCRIPT); \
 		echo "cd $$TARGET" >> $(ALL_SCRIPT); \
+		echo -n "run_many" >> $(ALL_SCRIPT); \
 		make -s --no-print-directory OUTPUT=$$BUILD_TARGET -C $$TARGET emit_tests >> $(ALL_SCRIPT); \
+		echo "" >> $(ALL_SCRIPT);	    \
 		echo "cd \$$ROOT" >> $(ALL_SCRIPT); \
 	done;
 
diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index e1117d703887..f12b0a631273 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -2,17 +2,20 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Runs a set of tests in a given subdirectory.
+export KSFT_TAP_LEVEL=1
 export skip_rc=4
 export logfile=/dev/stdout
+export per_test_logging=
 
 run_one()
 {
-	TEST="$1"
-	NUM="$2"
+	DIR="$1"
+	TEST="$2"
+	NUM="$3"
 
 	BASENAME_TEST=$(basename $TEST)
 
-	TEST_HDR_MSG="selftests: "`basename $PWD`:" $BASENAME_TEST"
+	TEST_HDR_MSG="selftests: $DIR: $BASENAME_TEST"
 	echo "$TEST_HDR_MSG"
 	echo "========================================"
 	if [ ! -x "$TEST" ]; then
@@ -30,3 +33,19 @@ run_one()
 		cd - >/dev/null
 	fi
 }
+
+run_many()
+{
+	echo "TAP version 13"
+	DIR=$(basename "$PWD")
+	test_num=0
+	for TEST in "$@"; do
+		BASENAME_TEST=$(basename $TEST)
+		test_num=$(( test_num + 1 ))
+		if [ -n "$per_test_logging" ]; then
+			logfile="/tmp/$BASENAME_TEST"
+			cat /dev/null > "$logfile"
+		fi
+		run_one "$DIR" "$TEST" "$test_num"
+	done
+}
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 6b2d026a94ea..28b8ffedfdf1 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -67,19 +67,11 @@ endif
 
 .ONESHELL:
 define RUN_TESTS
-	@export KSFT_TAP_LEVEL=`echo 1`;		\
-	test_num=`echo 0`;				\
-	. $(selfdir)/kselftest/runner.sh;		\
-	echo "TAP version 13";				\
-	for TEST in $(1); do				\
-		BASENAME_TEST=`basename $$TEST`;	\
-		test_num=`echo $$test_num+1 | bc`;	\
-		if [ "X$(summary)" != "X" ]; then	\
-		        logfile="/tmp/$$BASENAME_TEST";	\
-			cat /dev/null > "$$logfile";	\
-		fi;					\
-		run_one "$$BASENAME_TEST" "$$test_num";	\
-	done;
+	@. $(selfdir)/kselftest/runner.sh;	\
+	if [ "X$(summary)" != "X" ]; then       \
+		per_test_logging=1;		\
+	fi;                                     \
+	run_many $(1)
 endef
 
 run_tests: all
@@ -117,12 +109,11 @@ else
 endif
 
 emit_tests:
-	@test_num=`echo 0`;				\
 	for TEST in $(TEST_GEN_PROGS) $(TEST_CUSTOM_PROGS) $(TEST_PROGS); do \
 		BASENAME_TEST=`basename $$TEST`;	\
-		test_num=`echo $$test_num+1 | bc`;	\
-		echo "run_one \"$$BASENAME_TEST\" \"$$test_num\"";	\
-	done;
+		echo "	\\";				\
+		echo -n "	\"$$BASENAME_TEST\"";	\
+	done;						\
 
 # define if isn't already. It is undefined in make O= case.
 ifeq ($(RM),)
-- 
2.17.1
