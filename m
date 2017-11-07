From: naresh.kamboju@linaro.org (naresh.kamboju@linaro.org)
Date: Tue,  7 Nov 2017 22:05:53 +0530
Subject: [Linux-kselftest-mirror] [PATCH v3 2/2] selftests: bpf:
	test_kmod.sh: use modprobe on target device
In-Reply-To: <1510072553-7753-1-git-send-email-naresh.kamboju@linaro.org>
References: <1510072553-7753-1-git-send-email-naresh.kamboju@linaro.org>
Message-ID: <1510072553-7753-2-git-send-email-naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171107163553.8kv3F-0CudZJwYxHukSwnlwvjchhxiDju5Eh_HnBdtk@z>

From: Naresh Kamboju <naresh.kamboju@linaro.org>

On ARM and ARM64 devices kernel source tree is not available so
insmod "$SRC_TREE/lib/test_bpf.ko" is not working.

On these target devices the test_bpf.ko is installed under
/lib/modules/`uname -r`/kernel/lib/
so use modprobe dry run to check for missing test_bpf.ko module and
insert for testing.

Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
---
 tools/testing/selftests/bpf/test_kmod.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/bpf/test_kmod.sh b/tools/testing/selftests/bpf/test_kmod.sh
index 2e5a1049e2f2..4757ca7d163c 100755
--- a/tools/testing/selftests/bpf/test_kmod.sh
+++ b/tools/testing/selftests/bpf/test_kmod.sh
@@ -14,6 +14,16 @@ test_run()
 		if [ $? -ne 0 ]; then
 			rc=1
 		fi
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
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
