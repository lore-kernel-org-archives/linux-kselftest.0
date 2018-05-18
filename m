From: vladbu@mellanox.com (Vlad Buslov)
Date: Fri, 18 May 2018 19:31:06 +0300
Subject: [PATCH] tc-testing: fix ip address in u32 test
Message-ID: <1526661066-11138-1-git-send-email-vladbu@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180518163106.wnxW6PpuCZEVGf6IohsPyTjn6ZZCU4oyNEV7WT5MzVs@z>

Fix expected ip address to actually match configured ip address.
Fix test to expect single matched filter.

Signed-off-by: Vlad Buslov <vladbu at mellanox.com>
---
 tools/testing/selftests/tc-testing/tc-tests/filters/tests.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/filters/tests.json b/tools/testing/selftests/tc-testing/tc-tests/filters/tests.json
index 5fa02d8..99a5ffc 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/filters/tests.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/filters/tests.json
@@ -12,8 +12,8 @@
         "cmdUnderTest": "$TC filter add dev $DEV1 parent ffff: protocol ip prio 1 u32 match ip src 127.0.0.1/32 flowid 1:1 action ok",
         "expExitCode": "0",
         "verifyCmd": "$TC filter show dev $DEV1 parent ffff:",
-        "matchPattern": "match 7f000002/ffffffff at 12",
-        "matchCount": "0",
+        "matchPattern": "match 7f000001/ffffffff at 12",
+        "matchCount": "1",
         "teardown": [
             "$TC qdisc del dev $DEV1 ingress"
         ]
-- 
2.7.5

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
