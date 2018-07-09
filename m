From: vladbu at mellanox.com (Vlad Buslov)
Date: Mon,  9 Jul 2018 21:24:49 +0300
Subject: [PATCH net-next repost] tc-testing: flush gact actions on test
 teardown
Message-ID: <1531160689-17914-1-git-send-email-vladbu@mellanox.com>

Test 6fb4 creates one mirred and one pipe action, but only flushes mirred
on teardown. Leaking pipe action causes failures in other tests.

Add additional teardown command to also flush gact actions.

Signed-off-by: Vlad Buslov <vladbu at mellanox.com>
---
 tools/testing/selftests/tc-testing/tc-tests/actions/mirred.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/mirred.json b/tools/testing/selftests/tc-testing/tc-tests/actions/mirred.json
index 6e4edfae1799..db49fd0f8445 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/actions/mirred.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/mirred.json
@@ -44,7 +44,8 @@
         "matchPattern": "action order [0-9]*: mirred \\(Egress Redirect to device lo\\).*index 2 ref",
         "matchCount": "1",
         "teardown": [
-            "$TC actions flush action mirred"
+            "$TC actions flush action mirred",
+            "$TC actions flush action gact"
         ]
     },
     {
-- 
2.7.5

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
