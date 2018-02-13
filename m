From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Tue, 13 Feb 2018 14:44:07 -0700
Subject: [PATCH] selftests: memory-hotplug: silence test command echo
Message-ID: <20180213214407.21717-1-shuahkh@osg.samsung.com>

Silence the following command being printed while running test.

./mem-on-off-test.sh -r 2 && echo "selftests: memory-hotplug [PASS]" ||
echo "selftests: memory-hotplug [FAIL]"

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
 tools/testing/selftests/memory-hotplug/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/memory-hotplug/Makefile b/tools/testing/selftests/memory-hotplug/Makefile
index 86636d207adf..183b46883875 100644
--- a/tools/testing/selftests/memory-hotplug/Makefile
+++ b/tools/testing/selftests/memory-hotplug/Makefile
@@ -4,7 +4,7 @@ all:
 include ../lib.mk
 
 TEST_PROGS := mem-on-off-test.sh
-override RUN_TESTS := ./mem-on-off-test.sh -r 2 && echo "selftests: memory-hotplug [PASS]" || echo "selftests: memory-hotplug [FAIL]"
+override RUN_TESTS := @./mem-on-off-test.sh -r 2 && echo "selftests: memory-hotplug [PASS]" || echo "selftests: memory-hotplug [FAIL]"
 override EMIT_TESTS := echo "$(RUN_TESTS)"
 
 run_full_test:
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
