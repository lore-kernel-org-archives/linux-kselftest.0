From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Wed,  7 Feb 2018 23:45:34 +0530
Subject: [Linux-kselftest-mirror] [PATCH v2] selftests: bpf: test_kmod.sh:
	check the module path before insmod
Message-ID: <1518027334-9814-1-git-send-email-naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180207181534.zVc-iZW1JvUpH26a0o5lXgOrHtnv59eZSmjUpGm9L44@z>

test_kmod.sh reported false failure when module not present.
Check test_bpf.ko is present in the path before loading it.

Two cases to be addressed here,
In the development process of test_bpf.c unit testing will be done by
developers by using "insmod $SRC_TREE/lib/test_bpf.ko"

On the other hand testers run full tests by installing modules on device
under test (DUT) and followed by modprobe to insert the modules accordingly.

Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
---
 tools/testing/selftests/bpf/test_kmod.sh | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_kmod.sh b/tools/testing/selftests/bpf/test_kmod.sh
index ed4774d..35669cc 100755
--- a/tools/testing/selftests/bpf/test_kmod.sh
+++ b/tools/testing/selftests/bpf/test_kmod.sh
@@ -10,9 +10,21 @@ test_run()
 
 	echo "[ JIT enabled:$1 hardened:$2 ]"
 	dmesg -C
-	insmod $SRC_TREE/lib/test_bpf.ko 2> /dev/null
-	if [ $? -ne 0 ]; then
-		rc=1
+	if [ -f ${SRC_TREE}/lib/test_bpf.ko ]; then
+		insmod ${SRC_TREE}/lib/test_bpf.ko 2> /dev/null
+		if [ $? -ne 0 ]; then
+			rc=1
+		fi
+	else
+		# Use modprobe dry run to check for missing test_bpf module
+		if ! /sbin/modprobe -q -n test_bpf; then
+			echo "test_bpf: [SKIP]"
+		elif /sbin/modprobe -q test_bpf; then
+			echo "test_bpf: ok"
+		else
+			echo "test_bpf: [FAIL]"
+			rc=1
+		fi
 	fi
 	rmmod  test_bpf 2> /dev/null
 	dmesg | grep FAIL
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
