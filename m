From: keescook@chromium.org (Kees Cook)
Date: Wed, 24 Apr 2019 16:12:35 -0700
Subject: [PATCH v2 6/8] selftests: Move test output to diagnostic lines
In-Reply-To: <20190424231237.14776-1-keescook@chromium.org>
References: <20190424231237.14776-1-keescook@chromium.org>
Message-ID: <20190424231237.14776-7-keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424231235.urPlJG6uaTRuUV98ioaUTeE0YyVYF6p3Rv9UZsvg-Eo@z>

This changes the selftest output so that each test's output is prefixed
with "# " as a TAP "diagnostic line".

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

Since some test environments may have a very minimal set of utilities
available, the new prefixing code will fall back to doing line-at-a-time
prefixing if perl and/or stdbuf are not available.

Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/Makefile            |  1 +
 tools/testing/selftests/kselftest.h         |  2 +-
 tools/testing/selftests/kselftest/prefix.pl | 23 +++++++++++++
 tools/testing/selftests/kselftest/runner.sh | 37 ++++++++++++++++++---
 tools/testing/selftests/lib.mk              |  3 +-
 5 files changed, 60 insertions(+), 6 deletions(-)
 create mode 100755 tools/testing/selftests/kselftest/prefix.pl

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 4ac1d1c7ce5b..64699f59b95f 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -178,6 +178,7 @@ ifdef INSTALL_PATH
 	@# Ask all targets to install their files
 	mkdir -p $(INSTALL_PATH)/kselftest
 	install -m 744 kselftest/runner.sh $(INSTALL_PATH)/kselftest/
+	install -m 744 kselftest/prefix.pl $(INSTALL_PATH)/kselftest/
 	@for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
 		make OUTPUT=$$BUILD_TARGET -C $$TARGET INSTALL_PATH=$(INSTALL_PATH)/$$TARGET install; \
diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 9f4147a6fdbc..7f078e79a9fa 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -63,7 +63,7 @@ static inline void ksft_print_header(void)
 
 static inline void ksft_print_cnts(void)
 {
-	printf("Pass %d Fail %d Xfail %d Xpass %d Skip %d Error %d\n",
+	printf("# Pass %d Fail %d Xfail %d Xpass %d Skip %d Error %d\n",
 		ksft_cnt.ksft_pass, ksft_cnt.ksft_fail,
 		ksft_cnt.ksft_xfail, ksft_cnt.ksft_xpass,
 		ksft_cnt.ksft_xskip, ksft_cnt.ksft_error);
diff --git a/tools/testing/selftests/kselftest/prefix.pl b/tools/testing/selftests/kselftest/prefix.pl
new file mode 100755
index 000000000000..ec7e48118183
--- /dev/null
+++ b/tools/testing/selftests/kselftest/prefix.pl
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
diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index a66fb64e61e9..b9f74e5a2ee5 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -7,6 +7,34 @@ export skip_rc=4
 export logfile=/dev/stdout
 export per_test_logging=
 
+# There isn't a shell-agnostic way to find the path of a sourced file,
+# so we must rely on BASE_DIR being set to find other tools.
+if [ -z "$BASE_DIR" ]; then
+	echo "Error: BASE_DIR must be set before sourcing." >&2
+	exit 1
+fi
+
+# If Perl is unavailable, we must fall back to line-at-a-time prefixing
+# with sed instead of unbuffered output.
+tap_prefix()
+{
+	if [ ! -x /usr/bin/perl ]; then
+		sed -e 's/^/# /'
+	else
+		"$BASE_DIR"/kselftest/prefix.pl
+	fi
+}
+
+# If stdbuf is unavailable, we must fall back to line-at-a-time piping.
+tap_unbuffer()
+{
+	if ! which stdbuf >/dev/null ; then
+		"$@"
+	else
+		stdbuf -i0 -o0 -e0 "$@"
+	fi
+}
+
 run_one()
 {
 	DIR="$1"
@@ -16,10 +44,9 @@ run_one()
 	BASENAME_TEST=$(basename $TEST)
 
 	TEST_HDR_MSG="selftests: $DIR: $BASENAME_TEST"
-	echo "$TEST_HDR_MSG"
-	echo "========================================"
+	echo "# $TEST_HDR_MSG"
 	if [ ! -x "$TEST" ]; then
-		echo -n "$TEST_HDR_MSG: Warning: file $TEST is "
+		echo -n "# Warning: file $TEST is "
 		if [ ! -e "$TEST" ]; then
 			echo "missing!"
 		else
@@ -28,7 +55,9 @@ run_one()
 		echo "not ok $test_num $TEST_HDR_MSG"
 	else
 		cd `dirname $TEST` > /dev/null
-		(./$BASENAME_TEST >> "$logfile" 2>&1 &&
+		(((((tap_unbuffer ./$BASENAME_TEST 2>&1; echo $? >&3) |
+			tap_prefix >&4) 3>&1) |
+			(read xs; exit $xs)) 4>>"$logfile" &&
 		echo "ok $test_num $TEST_HDR_MSG") ||
 		(if [ $? -eq $skip_rc ]; then	\
 			echo "not ok $test_num $TEST_HDR_MSG # SKIP"
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 28b8ffedfdf1..098dd0065fb1 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -67,7 +67,8 @@ endif
 
 .ONESHELL:
 define RUN_TESTS
-	@. $(selfdir)/kselftest/runner.sh;	\
+	@BASE_DIR="$(selfdir)";			\
+	. $(selfdir)/kselftest/runner.sh;	\
 	if [ "X$(summary)" != "X" ]; then       \
 		per_test_logging=1;		\
 	fi;                                     \
-- 
2.17.1
