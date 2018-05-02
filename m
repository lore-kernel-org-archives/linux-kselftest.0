From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Wed,  2 May 2018 15:18:46 -0600
Subject: [PATCH] selftests: memory-hotplug: delete RUN_TESTS and EMIT_TESTS
 overrides
In-Reply-To: <20180502211848.22404-1-shuah@kernel.org>
References: <20180502211848.22404-1-shuah@kernel.org>
Message-ID: <20180502211848.22404-3-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180502211846.-7X9sSAvFWYyp71OLesXBuMQ8dAdw3ClUnr0KuLYCkk@z>

Delete RUN_TESTS and EMIT_TESTS overrides and use common defines in
lib.mk. Common defines work after making the change the test to run
with ratio=2 as the default mode to be able to invoke the test without
the "-r 2" argument from the common RUN_TESTS and EMIT_TESTS.

The run_full_tests target now calls the test with "-r 10".

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/memory-hotplug/Makefile           | 5 +----
 tools/testing/selftests/memory-hotplug/mem-on-off-test.sh | 3 ++-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/memory-hotplug/Makefile b/tools/testing/selftests/memory-hotplug/Makefile
index 686da510f989..e0a625e34f40 100644
--- a/tools/testing/selftests/memory-hotplug/Makefile
+++ b/tools/testing/selftests/memory-hotplug/Makefile
@@ -4,11 +4,8 @@ all:
 include ../lib.mk
 
 TEST_PROGS := mem-on-off-test.sh
-override RUN_TESTS := @./mem-on-off-test.sh -r 2 && echo "selftests: memory-hotplug [PASS]" || echo "selftests: memory-hotplug [FAIL]"
-
-override EMIT_TESTS := echo "$(subst @,,$(RUN_TESTS))"
 
 run_full_test:
-	@/bin/bash ./mem-on-off-test.sh && echo "memory-hotplug selftests: [PASS]" || echo "memory-hotplug selftests: [FAIL]"
+	@/bin/bash ./mem-on-off-test.sh -r 10 && echo "memory-hotplug selftests: [PASS]" || echo "memory-hotplug selftests: [FAIL]"
 
 clean:
diff --git a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
index ae2c790d0880..ff4991704d07 100755
--- a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
+++ b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
@@ -133,7 +133,8 @@ offline_memory_expect_fail()
 
 error=-12
 priority=0
-ratio=10
+# Run with default of ratio=2 for Kselftest run
+ratio=2
 retval=0
 
 while getopts e:hp:r: opt; do
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
