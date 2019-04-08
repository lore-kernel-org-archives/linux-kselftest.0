From: keescook at chromium.org (Kees Cook)
Date: Mon, 8 Apr 2019 13:30:12 -0700
Subject: [PATCH] selftests/lib.mk: Move test output to diagnostic lines
Message-ID: <20190408203012.GA566@beast>

This changes the selftest output is several ways:
- total test count is reported at start.
- each test's result is on a single line with "# SKIP" as needed per spec.
- each test's output is prefixed with "# " as a "diagnostic line".

This creates a bit of a kernel-specific TAP dialect where the diagnostics
precede the results. The TAP spec isn't entirely clear about this, though,
so I think it's the correct solution so as to keep interactive runs making
sense. If the output _followed_ the result line in the spec-suggested
YAML form, each test would dump all of its output at once instead of as
it went, making debugging harder.

This does, however, solve the recursive TAP output problem, as sub-tests
will simply be prefixed by "# ". Parsing sub-tests becomes a simple
problem of just removing the first two characters of a given top-level
test's diagnostic output, and parsing the results.

Note that the shell construct needed to both get an exit code from
the first command in a pipe and still filter the pipe (to add the "# "
prefix) uses a POSIX solution rather than the bash "pipefail" option
which is not supported by dash.

Example:

	$ tools/testing/selftests
	$ make --silent -C x86 run_tests
	TAP version 13
	1..15 selftests: x86
	# selftests: x86: single_step_syscall_64
	# [RUN] Set TF and check nop
	# [OK]  Survived with TF set and 9 traps
	# [RUN] Set TF and check syscall-less opportunistic sysret
	# [OK]  Survived with TF set and 12 traps
	# [RUN] Set TF and check a fast syscall
	# [OK]  Survived with TF set and 22 traps
	# [RUN] Fast syscall with TF cleared
	# [OK]  Nothing unexpected happened
	ok 1 selftests: x86: single_step_syscall_64
	# selftests: x86: sysret_ss_attrs_64
	# [RUN] Syscalls followed by SS validation
	# [OK]  We survived
	ok 2 selftests: x86: sysret_ss_attrs_64
	# selftests: x86: syscall_nt_64
	# [RUN] Set NT and issue a syscall
	# [OK]  The syscall worked and flags are still set
	# [RUN] Set NT|TF and issue a syscall
	# [OK]  The syscall worked and flags are still set
	ok 3 selftests: x86: syscall_nt_64
	...[skipping example output]...
	ok 15 selftests: x86: sysret_rip_64

	$ make --silent -C x86 run_tests | tappy
	............F..
	======================================================================
	FAIL: <file=stream>
	selftests: x86: mov_ss_trap_64
	----------------------------------------------------------------------

	----------------------------------------------------------------------
	Ran 15 tests in 0.000s

	FAILED (failures=1)

Signed-off-by: Kees Cook <keescook at chromium.org>
---
No longer RFC! :)
---
 tools/testing/selftests/lib.mk    | 59 ++++++++++++++++++-------------
 tools/testing/selftests/prefix.pl | 23 ++++++++++++
 2 files changed, 57 insertions(+), 25 deletions(-)
 create mode 100755 tools/testing/selftests/prefix.pl

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 8b0f16409ed7..d3267c08a7b1 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -5,6 +5,8 @@ CC := $(CROSS_COMPILE)gcc
 ifeq (0,$(MAKELEVEL))
 OUTPUT := $(shell pwd)
 endif
+testname = $(notdir $(shell pwd))
+selfdir = $(realpath $(dir $(filter %/lib.mk,$(MAKEFILE_LIST))))
 
 # The following are built by lib.mk common compile rules.
 # TEST_CUSTOM_PROGS should be used by tests that require
@@ -32,38 +34,45 @@ endif
 
 .ONESHELL:
 define RUN_TEST_PRINT_RESULT
-	TEST_HDR_MSG="selftests: "`basename $$PWD`:" $$BASENAME_TEST";	\
-	echo $$TEST_HDR_MSG;					\
-	echo "========================================";	\
+	TEST_HDR_MSG="selftests: $(testname): $$BASENAME_TEST";	\
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
+			(((((stdbuf -i0 -o0 -e0 ./$$BASENAME_TEST 2>&1; echo $$? >&3) |	\
+				$(selfdir)/prefix.pl >&4) 3>&1) |		\
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
-	test_num=`echo 0`;				\
-	skip=`echo 4`;					\
+	test_num=0;					\
+	total=`echo "$(1)" | wc -w`;			\
+	skip=4;						\
 	echo "TAP version 13";				\
+	echo "1..$$total selftests: $(testname)";	\
 	for TEST in $(1); do				\
 		BASENAME_TEST=`basename $$TEST`;	\
 		test_num=`echo $$test_num+1 | bc`;	\
diff --git a/tools/testing/selftests/prefix.pl b/tools/testing/selftests/prefix.pl
new file mode 100755
index 000000000000..ec7e48118183
--- /dev/null
+++ b/tools/testing/selftests/prefix.pl
@@ -0,0 +1,23 @@
+#!/usr/bin/perl
+# SPDX-License-Identifier: GPL-2.0
+# Prefix all lines with "# ", unbuffered. Command being piped in may need
+# to have unbuffering forced with "stdbuf -i0 -o0 -e0 $cmd".
+use strict;
+
+binmode STDIN;
+binmode STDOUT;
+
+STDOUT->autoflush(1);
+
+my $needed = 1;
+while (1) {
+	my $char;
+	my $bytes = sysread(STDIN, $char, 1);
+	exit 0 if ($bytes == 0);
+	if ($needed) {
+		print "# ";
+		$needed = 0;
+	}
+	print $char;
+	$needed = 1 if ($char eq "\n");
+}
-- 
2.17.1


-- 
Kees Cook
