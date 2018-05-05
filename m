From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:20 -0600
Subject: [PATCH 16/24] selftests: lib: return Kselftest Skip code for skipped
 tests
In-Reply-To: <20180505011328.32078-1-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
Message-ID: <20180505011328.32078-16-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180505011320.91VwuUCXCYyFypcLglog8JJv9-YQlfWqUZs7X35lvnU@z>

When lib test(s) is skipped because of unmet dependencies and/or
unsupported configuration, it returns non-zero value hich is treated
as a fail by the Kselftest framework. This leads to false negative result
even when the test could not be run.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run.

Kselftest framework SKIP code is 4 and the framework prints appropriate
messages to indicate that the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/lib/bitmap.sh        | 8 ++++++--
 tools/testing/selftests/lib/prime_numbers.sh | 7 +++++--
 tools/testing/selftests/lib/printf.sh        | 8 ++++++--
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/lib/bitmap.sh b/tools/testing/selftests/lib/bitmap.sh
index 4dee4d2a8bbe..5a90006d1aea 100755
--- a/tools/testing/selftests/lib/bitmap.sh
+++ b/tools/testing/selftests/lib/bitmap.sh
@@ -1,9 +1,13 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
+
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
 # Runs bitmap infrastructure tests using test_bitmap kernel module
 if ! /sbin/modprobe -q -n test_bitmap; then
-	echo "bitmap: [SKIP]"
-	exit 77
+	echo "bitmap: module test_bitmap is not found [SKIP]"
+	exit $ksft_skip
 fi
 
 if /sbin/modprobe -q test_bitmap; then
diff --git a/tools/testing/selftests/lib/prime_numbers.sh b/tools/testing/selftests/lib/prime_numbers.sh
index b363994e5e11..76602d4b050f 100755
--- a/tools/testing/selftests/lib/prime_numbers.sh
+++ b/tools/testing/selftests/lib/prime_numbers.sh
@@ -2,9 +2,12 @@
 # SPDX-License-Identifier: GPL-2.0
 # Checks fast/slow prime_number generation for inconsistencies
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
 if ! /sbin/modprobe -q -r prime_numbers; then
-	echo "prime_numbers: [SKIP]"
-	exit 77
+	echo "prime_numbers: module prime_numbers is not found [SKIP]"
+	exit $ksft_skip
 fi
 
 if /sbin/modprobe -q prime_numbers selftest=65536; then
diff --git a/tools/testing/selftests/lib/printf.sh b/tools/testing/selftests/lib/printf.sh
index 0c37377fd7d4..45a23e2d64ad 100755
--- a/tools/testing/selftests/lib/printf.sh
+++ b/tools/testing/selftests/lib/printf.sh
@@ -1,9 +1,13 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 # Runs printf infrastructure using test_printf kernel module
+
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
 if ! /sbin/modprobe -q -n test_printf; then
-	echo "printf: [SKIP]"
-	exit 77
+	echo "printf: module test_printf is not found [SKIP]"
+	exit $ksft_skip
 fi
 
 if /sbin/modprobe -q test_printf; then
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
