From: vladbu at mellanox.com (Vlad Buslov)
Date: Mon,  9 Jul 2018 21:22:15 +0300
Subject: [PATCH net-next] tc-testing: remove duplicate spaces in connmark
 match patterns
Message-ID: <1531160535-17742-1-git-send-email-vladbu@mellanox.com>

Match patterns for some connmark tests contain duplicate whitespace that is
not present in actual tc output. This causes tests to fail because they
can't match required action, even when it was successfully created.

Fixes: 1dad0f9ffff7 ("tc-testing: add connmark action tests")
Signed-off-by: Vlad Buslov <vladbu at mellanox.com>
---
 .../tc-testing/tc-tests/actions/connmark.json      | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/connmark.json b/tools/testing/selftests/tc-testing/tc-tests/actions/connmark.json
index 70952bd98ff9..13147a1f5731 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/actions/connmark.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/connmark.json
@@ -17,7 +17,7 @@
         "cmdUnderTest": "$TC actions add action connmark",
         "expExitCode": "0",
         "verifyCmd": "$TC actions list action connmark",
-        "matchPattern": "action order [0-9]+:  connmark zone 0 pipe",
+        "matchPattern": "action order [0-9]+: connmark zone 0 pipe",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action connmark"
@@ -41,7 +41,7 @@
         "cmdUnderTest": "$TC actions add action connmark pass index 1",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action connmark index 1",
-        "matchPattern": "action order [0-9]+:  connmark zone 0 pass.*index 1 ref",
+        "matchPattern": "action order [0-9]+: connmark zone 0 pass.*index 1 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action connmark"
@@ -65,7 +65,7 @@
         "cmdUnderTest": "$TC actions add action connmark drop index 100",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action connmark index 100",
-        "matchPattern": "action order [0-9]+:  connmark zone 0 drop.*index 100 ref",
+        "matchPattern": "action order [0-9]+: connmark zone 0 drop.*index 100 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action connmark"
@@ -89,7 +89,7 @@
         "cmdUnderTest": "$TC actions add action connmark pipe index 455",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action connmark index 455",
-        "matchPattern": "action order [0-9]+:  connmark zone 0 pipe.*index 455 ref",
+        "matchPattern": "action order [0-9]+: connmark zone 0 pipe.*index 455 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action connmark"
@@ -113,7 +113,7 @@
         "cmdUnderTest": "$TC actions add action connmark reclassify index 7",
         "expExitCode": "0",
         "verifyCmd": "$TC actions list action connmark",
-        "matchPattern": "action order [0-9]+:  connmark zone 0 reclassify.*index 7 ref",
+        "matchPattern": "action order [0-9]+: connmark zone 0 reclassify.*index 7 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action connmark"
@@ -137,7 +137,7 @@
         "cmdUnderTest": "$TC actions add action connmark continue index 17",
         "expExitCode": "0",
         "verifyCmd": "$TC actions list action connmark",
-        "matchPattern": "action order [0-9]+:  connmark zone 0 continue.*index 17 ref",
+        "matchPattern": "action order [0-9]+: connmark zone 0 continue.*index 17 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action connmark"
@@ -161,7 +161,7 @@
         "cmdUnderTest": "$TC actions add action connmark jump 10 index 17",
         "expExitCode": "0",
         "verifyCmd": "$TC actions list action connmark",
-        "matchPattern": "action order [0-9]+:  connmark zone 0 jump 10.*index 17 ref",
+        "matchPattern": "action order [0-9]+: connmark zone 0 jump 10.*index 17 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action connmark"
@@ -185,7 +185,7 @@
         "cmdUnderTest": "$TC actions add action connmark zone 100 pipe index 1",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action connmark index 1",
-        "matchPattern": "action order [0-9]+:  connmark zone 100 pipe.*index 1 ref",
+        "matchPattern": "action order [0-9]+: connmark zone 100 pipe.*index 1 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action connmark"
@@ -209,7 +209,7 @@
         "cmdUnderTest": "$TC actions add action connmark zone 65536 reclassify index 21",
         "expExitCode": "255",
         "verifyCmd": "$TC actions get action connmark index 1",
-        "matchPattern": "action order [0-9]+:  connmark zone 65536 reclassify.*index 21 ref",
+        "matchPattern": "action order [0-9]+: connmark zone 65536 reclassify.*index 21 ref",
         "matchCount": "0",
         "teardown": [
             "$TC actions flush action connmark"
@@ -233,7 +233,7 @@
         "cmdUnderTest": "$TC actions add action connmark zone 655 unsupp_arg pass index 2",
         "expExitCode": "255",
         "verifyCmd": "$TC actions get action connmark index 2",
-        "matchPattern": "action order [0-9]+:  connmark zone 655 unsupp_arg pass.*index 2 ref",
+        "matchPattern": "action order [0-9]+: connmark zone 655 unsupp_arg pass.*index 2 ref",
         "matchCount": "0",
         "teardown": [
             "$TC actions flush action connmark"
@@ -258,7 +258,7 @@
         "cmdUnderTest": "$TC actions replace action connmark zone 555 reclassify index 555",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action connmark index 555",
-        "matchPattern": "action order [0-9]+:  connmark zone 555 reclassify.*index 555 ref",
+        "matchPattern": "action order [0-9]+: connmark zone 555 reclassify.*index 555 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action connmark"
@@ -282,7 +282,7 @@
         "cmdUnderTest": "$TC actions add action connmark zone 555 pipe index 5 cookie aabbccddeeff112233445566778800a1",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action connmark index 5",
-        "matchPattern": "action order [0-9]+:  connmark zone 555 pipe.*index 5 ref.*cookie aabbccddeeff112233445566778800a1",
+        "matchPattern": "action order [0-9]+: connmark zone 555 pipe.*index 5 ref.*cookie aabbccddeeff112233445566778800a1",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action connmark"
-- 
2.7.5

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
