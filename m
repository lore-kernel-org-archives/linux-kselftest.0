From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Wed,  7 Feb 2018 02:37:23 +0530
Subject: [Linux-kselftest-mirror] [PATCH] selftests: bpf: test_kmod.sh:
	check the module path before insmod
Message-ID: <1517951243-10003-1-git-send-email-naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180206210723.pSk2PfccrJMBUdAI7NnEzc_S2PtP6LCfP_6I4MVLSyo@z>

test_kmod.sh reported false failure when module not present.
Check test_bpf.ko is present in the path before loading it.

Stop using "insmod $SRC_TREE/lib/test_bpf.ko" instead use
"modprobe test_bpf"

Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
---
 tools/testing/selftests/bpf/test_kmod.sh | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_kmod.sh b/tools/testing/selftests/bpf/test_kmod.sh
index ed4774d..54177b1 100755
--- a/tools/testing/selftests/bpf/test_kmod.sh
+++ b/tools/testing/selftests/bpf/test_kmod.sh
@@ -1,8 +1,6 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 
-SRC_TREE=../../../../
-
 test_run()
 {
 	sysctl -w net.core.bpf_jit_enable=$1 2>&1 > /dev/null
@@ -10,8 +8,13 @@ test_run()
 
 	echo "[ JIT enabled:$1 hardened:$2 ]"
 	dmesg -C
-	insmod $SRC_TREE/lib/test_bpf.ko 2> /dev/null
-	if [ $? -ne 0 ]; then
+	# Use modprobe dry run to check for missing test_bpf module
+	if ! /sbin/modprobe -q -n test_bpf; then
+		echo "test_bpf: [SKIP]"
+	elif /sbin/modprobe -q test_bpf; then
+		echo "test_bpf: ok"
+	else
+		echo "test_bpf: [FAIL]"
 		rc=1
 	fi
 	rmmod  test_bpf 2> /dev/null
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
