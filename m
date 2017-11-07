From: naresh.kamboju@linaro.org (naresh.kamboju@linaro.org)
Date: Tue,  7 Nov 2017 22:05:52 +0530
Subject: [Linux-kselftest-mirror] [PATCH v3 1/2] selftests: bpf:
	test_kmod.sh: check the module path before insmod
Message-ID: <1510072553-7753-1-git-send-email-naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171107163552.ibAMdmzq1wlEQwMfcjRNJZ5azNRwpTJUP8KoEyf8YtA@z>

From: Naresh Kamboju <naresh.kamboju@linaro.org>

test_kmod.sh reported false failure when module not present.
Instead check test_bpf.ko is present in the path before loading it.

Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
---
 tools/testing/selftests/bpf/test_kmod.sh | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_kmod.sh b/tools/testing/selftests/bpf/test_kmod.sh
index 6d58cca8e235..2e5a1049e2f2 100755
--- a/tools/testing/selftests/bpf/test_kmod.sh
+++ b/tools/testing/selftests/bpf/test_kmod.sh
@@ -9,9 +9,11 @@ test_run()
 
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
 	fi
 	rmmod  test_bpf 2> /dev/null
 	dmesg | grep FAIL
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
