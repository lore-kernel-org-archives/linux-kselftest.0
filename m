From: zev at bewilderbeest.net (Zev Weiss)
Date: Thu,  7 Feb 2019 06:34:24 -0600
Subject: [PATCH v2 1/3] test_sysctl: add tests for >32-bit values written to
 32-bit integers
In-Reply-To: <20190207123426.9202-1-zev@bewilderbeest.net>
References: <20190206195807.GG11489@garbanzo.do-not-panic.com>
 <20190207123426.9202-1-zev@bewilderbeest.net>
Message-ID: <20190207123426.9202-2-zev@bewilderbeest.net>

At present this exposes a bug in do_proc_dointvec_minmax_conv() (it
fails to check for values that are too wide to fit in an int).

Signed-off-by: Zev Weiss <zev at bewilderbeest.net>
---
 tools/testing/selftests/sysctl/sysctl.sh | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tools/testing/selftests/sysctl/sysctl.sh b/tools/testing/selftests/sysctl/sysctl.sh
index 584eb8ea780a..780ce7123374 100755
--- a/tools/testing/selftests/sysctl/sysctl.sh
+++ b/tools/testing/selftests/sysctl/sysctl.sh
@@ -290,6 +290,58 @@ run_numerictests()
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
+	# sysctl conversion functions receive a boolean sign and ulong
+	# magnitude; here we list the magnitudes we want to test (each of
+	# which will be tested in both positive and negative forms).  Since
+	# none of these values fit in 32 bits, writing them to an int- or
+	# uint-typed sysctl should fail.
+	local magnitudes=(
+		# common boundary-condition values (zero, +1, -1, INT_MIN,
+		# and INT_MAX respectively) if truncated to lower 32 bits
+		# (potential for being falsely deemed in range)
+		0x0000000100000000
+		0x0000000100000001
+		0x00000001ffffffff
+		0x0000000180000000
+		0x000000017fffffff
+
+		# these look like negatives, but without a leading '-' are
+		# actually large positives (should be rejected as above
+		# despite being zero/+1/-1/INT_MIN/INT_MAX in the lower 32)
+		0xffffffff00000000
+		0xffffffff00000001
+		0xffffffffffffffff
+		0xffffffff80000000
+		0xffffffff7fffffff
+	)
+
+	for sign in '' '-'; do
+		for mag in "${magnitudes[@]}"; do
+			check_failure "${sign}${mag}"
+		done
+	done
+}
+
 # Your test must accept digits 3 and 4 to use this
 run_limit_digit()
 {
@@ -556,6 +608,7 @@ sysctl_test_0001()
 	TEST_STR=$(( $ORIG + 1 ))
 
 	run_numerictests
+	run_wideint_tests
 	run_limit_digit
 }
 
@@ -580,6 +633,7 @@ sysctl_test_0003()
 	TEST_STR=$(( $ORIG + 1 ))
 
 	run_numerictests
+	run_wideint_tests
 	run_limit_digit
 	run_limit_digit_int
 }
@@ -592,6 +646,7 @@ sysctl_test_0004()
 	TEST_STR=$(( $ORIG + 1 ))
 
 	run_numerictests
+	run_wideint_tests
 	run_limit_digit
 	run_limit_digit_uint
 }
-- 
2.20.1
