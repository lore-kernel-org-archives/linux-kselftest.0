From: shuah at kernel.org (Shuah Khan)
Date: Thu, 31 Jan 2019 12:46:49 -0700
Subject: [PATCH] selftests: ir: skip when non-root user runs the test
Message-ID: <20190131194649.19248-1-shuah@kernel.org>

Skip instead of fail when non-root user runs the test.

Signed-off-by: Shuah Khan <shuah at kernel.org>
---
 tools/testing/selftests/ir/ir_loopback.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/ir/ir_loopback.sh b/tools/testing/selftests/ir/ir_loopback.sh
index 0a0b8dfa39be..b90dc9939f45 100755
--- a/tools/testing/selftests/ir/ir_loopback.sh
+++ b/tools/testing/selftests/ir/ir_loopback.sh
@@ -4,6 +4,11 @@
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
 
+if [ $UID != 0 ]; then
+	echo "Please run ir_loopback test as root [SKIP]"
+	exit $ksft_skip
+fi
+
 if ! /sbin/modprobe -q -n rc-loopback; then
         echo "ir_loopback: module rc-loopback is not found [SKIP]"
         exit $ksft_skip
-- 
2.17.1
