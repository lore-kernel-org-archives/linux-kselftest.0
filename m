From: keescook at chromium.org (Kees Cook)
Date: Tue,  9 Apr 2019 16:55:53 -0700
Subject: [PATCH 3/6] selftests: Extract logic for multiple test runs
In-Reply-To: <20190409235556.3967-1-keescook@chromium.org>
References: <20190409235556.3967-1-keescook@chromium.org>
Message-ID: <20190409235556.3967-4-keescook@chromium.org>

This moves the logic for running multiple tests into a single "run_many"
function of runner.sh. Both "run_tests" and "emit_tests" are modified to
use it.

Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/Makefile            |  6 ++----
 tools/testing/selftests/kselftest/runner.sh | 19 ++++++++++++++++---
 tools/testing/selftests/lib.mk              | 16 ++++------------
 3 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 45327e921169..72178d28f9c6 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -148,16 +148,14 @@ ifdef INSTALL_PATH
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
index 77d5510ac4c5..51139f42a6ca 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -1,17 +1,19 @@
 #!/bin/sh
 #
 # Runs a set of tests in a given subdirectory.
+export KSFT_TAP_LEVEL=1
 export skip_rc=4
 export logfile=/dev/stdout
 
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
@@ -29,3 +31,14 @@ run_one()
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
+		test_num=$(( test_num + 1 ))
+		run_one "$DIR" "$TEST" "$test_num"
+	done
+}
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 8a4fad5d3934..8be13d117101 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -33,15 +33,8 @@ endif
 
 .ONESHELL:
 define RUN_TESTS
-	@export KSFT_TAP_LEVEL=`echo 1`;		\
-	test_num=`echo 0`;				\
 	. $(selfdir)/kselftest/runner.sh;		\
-	echo "TAP version 13";				\
-	for TEST in $(1); do				\
-		BASENAME_TEST=`basename $$TEST`;	\
-		test_num=`echo $$test_num+1 | bc`;	\
-		run_one "$$BASENAME_TEST" "$$test_num";	\
-	done;
+	run_many $(1)
 endef
 
 run_tests: all
@@ -79,12 +72,11 @@ else
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
