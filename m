From: zev at bewilderbeest.net (Zev Weiss)
Date: Thu, 27 Dec 2018 05:12:29 -0600
Subject: [PATCH 1/2] test_sysctl: add tests for >32-bit values written to
 32-bit integers
In-Reply-To: <20181227111231.12912-1-zev@bewilderbeest.net>
References: <20181227111231.12912-1-zev@bewilderbeest.net>
Message-ID: <20181227111231.12912-2-zev@bewilderbeest.net>

At present this exposes a bug in do_proc_dointvec_minmax_conv() (it
fails to check for values that are too wide to fit in an int).

Signed-off-by: Zev Weiss <zev at bewilderbeest.net>
---
 tools/testing/selftests/sysctl/sysctl.sh | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tools/testing/selftests/sysctl/sysctl.sh b/tools/testing/selftests/sysctl/sysctl.sh
index 584eb8ea780a..a7d0da25975c 100755
--- a/tools/testing/selftests/sysctl/sysctl.sh
+++ b/tools/testing/selftests/sysctl/sysctl.sh
@@ -290,6 +290,40 @@ run_numerictests()
 	test_rc
 }
 
+check_failure()
+{
+	echo -n "Testing that $1 fails as expected..."
+	reset_vals
+	TEST_STR="$1"
+	orig="$(cat $TARGET)"
+	echo -n "$TEST_STR" > $TARGET 2> /dev/null
+
+	# write should fail and $TARGET should retain its original value
+	if [ $? = 0 ] || [ "$(cat $TARGET)" != "$orig" ]; then
+		echo "FAIL" >&2
+		rc=1
+	else
+		echo "ok"
+	fi
+	test_rc
+}
+
+run_wideint_tests()
+{
+	# check negative and positive 64-bit values, with and without
+	# bits set in the lower 31, and with and without bit 31 (sign
+	# bit of a 32-bit int) set.  None of these are representable
+	# in 32 bits, and hence all should fail.
+	check_failure 0x0000010000000000
+	check_failure 0x0000010080000000
+	check_failure 0x000001ff7fffffff
+	check_failure 0x000001ffffffffff
+	check_failure 0xffffffff7fffffff
+	check_failure 0xffffffffffffffff
+	check_failure 0xffffff0000000000
+	check_failure 0xffffff0080000000
+}
+
 # Your test must accept digits 3 and 4 to use this
 run_limit_digit()
 {
@@ -556,6 +590,7 @@ sysctl_test_0001()
 	TEST_STR=$(( $ORIG + 1 ))
 
 	run_numerictests
+	run_wideint_tests
 	run_limit_digit
 }
 
@@ -580,6 +615,7 @@ sysctl_test_0003()
 	TEST_STR=$(( $ORIG + 1 ))
 
 	run_numerictests
+	run_wideint_tests
 	run_limit_digit
 	run_limit_digit_int
 }
@@ -592,6 +628,7 @@ sysctl_test_0004()
 	TEST_STR=$(( $ORIG + 1 ))
 
 	run_numerictests
+	run_wideint_tests
 	run_limit_digit
 	run_limit_digit_uint
 }
-- 
2.20.1
