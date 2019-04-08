From: keescook at chromium.org (Kees Cook)
Date: Mon, 8 Apr 2019 12:02:43 -0700
Subject: [RFC][PATCH] selftests/lib.mk: Move test output to diagnostic lines
Message-ID: <20190408190243.GA33074@beast>

This changes the selftest output is several ways:
- total test count is reported at start.
- each test's result is on a single line with "# SKIP" as needed per spec.
- each test's output is report _before_ the result line as a commented
  "diagnostic" line.

This creates a bit of a kernel-specific TAP output where the diagnostics
precede the results. The TAP spec isn't entirely clear about this, though,
so I think it's the correct solution so as to not keep interactive
runs making sense. If the output _followed_ the result line in the
spec-suggested YAML form, each test would dump all of its output at once
instead of as it went, making debugging harder.

Also, while "sed -u" is used to add the "# " line prefixes, this
still doesn't work for all output. For example, the "timer" lists
print out text, then do the work, then print a result and a newline.
This isn't visible any more. And some tests still show nothing until
they finish. I haven't found a way to force the prefixing while keeping
the output entirely unbuffered. :(

Note that the shell construct needed to both get an exit code from
the first command in a pipe and still filter the pipe (to add the "# "
prefix) uses a POSIX solution rather than the bash "pipefail" option
which is not supported by dash.

Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/lib.mk | 54 +++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 8b0f16409ed7..056dac8f5701 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -5,6 +5,7 @@ CC := $(CROSS_COMPILE)gcc
 ifeq (0,$(MAKELEVEL))
 OUTPUT := $(shell pwd)
 endif
+srcdir = $(notdir $(shell pwd))
 
 # The following are built by lib.mk common compile rules.
 # TEST_CUSTOM_PROGS should be used by tests that require
@@ -32,38 +33,45 @@ endif
 
 .ONESHELL:
 define RUN_TEST_PRINT_RESULT
-	TEST_HDR_MSG="selftests: "`basename $$PWD`:" $$BASENAME_TEST";	\
-	echo $$TEST_HDR_MSG;					\
-	echo "========================================";	\
+	TEST_HDR_MSG="selftests: $(srcdir): $$BASENAME_TEST";	\
 	if [ ! -x $$TEST ]; then	\
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
+		if [ "X$(summary)" = "X" ]; then			\
+			echo "# warning: 'file $$TEST is not executable, correct this.'";\
+		fi;							\
+		echo "not ok $$test_num $$TEST_HDR_MSG";		\
+	else								\
+		cd `dirname $$TEST` > /dev/null;			\
+		if [ "X$(summary)" != "X" ]; then			\
+			(./$$BASENAME_TEST > /tmp/$$BASENAME_TEST 2>&1 &&\
+				echo "ok $$test_num $$TEST_HDR_MSG") || \
+			(if [ $$? -eq $$skip ]; then			\
+				echo "not ok $$test_num $$TEST_HDR_MSG # SKIP";	\
+			else						\
+				echo "not ok $$test_num $$TEST_HDR_MSG";\
+			fi);						\
+		else							\
+			echo "# $$TEST_HDR_MSG";			\
+			(((((./$$BASENAME_TEST 2>&1; echo $$? >&3) |	\
+				sed -ue 's/^/# /' >&4) 3>&1) |		\
+				(read xs; exit $$xs)) 4>&1 &&		\
+				echo "ok $$test_num $$TEST_HDR_MSG") || \
+			(if [ $$? -eq $$skip ]; then			\
+				echo "not ok $$test_num $$TEST_HDR_MSG # SKIP";	\
+			else						\
+				echo "not ok $$test_num $$TEST_HDR_MSG";\
+			fi);						\
+		fi;							\
+		cd - > /dev/null;					\
 	fi;
 endef
 
 define RUN_TESTS
 	@export KSFT_TAP_LEVEL=`echo 1`;		\
 	test_num=`echo 0`;				\
+	total=`echo "$(1)" | wc -w`;			\
 	skip=`echo 4`;					\
 	echo "TAP version 13";				\
+	echo "1..$$total selftests: $(srcdir)";		\
 	for TEST in $(1); do				\
 		BASENAME_TEST=`basename $$TEST`;	\
 		test_num=`echo $$test_num+1 | bc`;	\
-- 
2.17.1


-- 
Kees Cook
