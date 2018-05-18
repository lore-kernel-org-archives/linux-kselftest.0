From: vladbu@mellanox.com (Vlad Buslov)
Date: Fri, 18 May 2018 19:21:22 +0300
Subject: [PATCH] tc-testing: flush gact actions on test teardown
Message-ID: <1526660482-10424-1-git-send-email-vladbu@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180518162122.3mJwlI_E7k3k1SVUJ-RypJzadvV2QC2Ho0Jtt2q9Pz8@z>

Test 6fb4 creates one mirred and one pipe action, but only flushes mirred
on teardown. Leaking pipe action causes failures in other tests.

Add additional teardown command to also flush gact actions.

Signed-off-by: Vlad Buslov <vladbu at mellanox.com>
---
 tools/testing/selftests/tc-testing/tc-tests/actions/mirred.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/mirred.json b/tools/testing/selftests/tc-testing/tc-tests/actions/mirred.json
index 443c9b3..acb24f7 100644
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
