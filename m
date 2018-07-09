From: vladbu@mellanox.com (Vlad Buslov)
Date: Mon,  9 Jul 2018 21:23:45 +0300
Subject: [PATCH net-next] tc-testing: remove duplicate spaces in skbedit match
 patterns
Message-ID: <1531160625-17839-1-git-send-email-vladbu@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180709182345._NO0b1g-jJVp5il1iCUV2LFJvPMzIE7gv8NWSKWInWw@z>

Match patterns for some skbedit tests contain duplicate whitespace that is
not present in actual tc output. This causes tests to fail because they
can't match required action, even when it was successfully created.

Signed-off-by: Vlad Buslov <vladbu at mellanox.com>
---
 .../tc-testing/tc-tests/actions/skbedit.json       | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/skbedit.json b/tools/testing/selftests/tc-testing/tc-tests/actions/skbedit.json
index 37ecc2716fee..5aaf593b914a 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/actions/skbedit.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/skbedit.json
@@ -17,7 +17,7 @@
         "cmdUnderTest": "$TC actions add action skbedit mark 1",
         "expExitCode": "0",
         "verifyCmd": "$TC actions list action skbedit",
-        "matchPattern": "action order [0-9]*:  skbedit mark 1",
+        "matchPattern": "action order [0-9]*: skbedit  mark 1",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action skbedit"
@@ -65,7 +65,7 @@
         "cmdUnderTest": "$TC actions add action skbedit prio 99",
         "expExitCode": "0",
         "verifyCmd": "$TC actions list action skbedit",
-        "matchPattern": "action order [0-9]*:  skbedit priority :99",
+        "matchPattern": "action order [0-9]*: skbedit  priority :99",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action skbedit"
@@ -113,7 +113,7 @@
         "cmdUnderTest": "$TC actions add action skbedit queue_mapping 909",
         "expExitCode": "0",
         "verifyCmd": "$TC actions list action skbedit",
-        "matchPattern": "action order [0-9]*:  skbedit queue_mapping 909",
+        "matchPattern": "action order [0-9]*: skbedit queue_mapping 909",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action skbedit"
@@ -161,7 +161,7 @@
         "cmdUnderTest": "$TC actions add action skbedit ptype host",
         "expExitCode": "0",
         "verifyCmd": "$TC actions list action skbedit",
-        "matchPattern": "action order [0-9]*:  skbedit ptype host",
+        "matchPattern": "action order [0-9]*: skbedit  ptype host",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action skbedit"
@@ -185,7 +185,7 @@
         "cmdUnderTest": "$TC actions add action skbedit ptype otherhost",
         "expExitCode": "0",
         "verifyCmd": "$TC actions list action skbedit",
-        "matchPattern": "action order [0-9]*:  skbedit ptype otherhost",
+        "matchPattern": "action order [0-9]*: skbedit  ptype otherhost",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action skbedit"
@@ -233,7 +233,7 @@
         "cmdUnderTest": "$TC actions add action skbedit ptype host pipe index 11",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action skbedit index 11",
-        "matchPattern": "action order [0-9]*:  skbedit ptype host pipe.*index 11 ref",
+        "matchPattern": "action order [0-9]*: skbedit  ptype host pipe.*index 11 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action skbedit"
@@ -257,7 +257,7 @@
         "cmdUnderTest": "$TC actions add action skbedit mark 56789 reclassify index 90",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action skbedit index 90",
-        "matchPattern": "action order [0-9]*:  skbedit mark 56789 reclassify.*index 90 ref",
+        "matchPattern": "action order [0-9]*: skbedit  mark 56789 reclassify.*index 90 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action skbedit"
@@ -281,7 +281,7 @@
         "cmdUnderTest": "$TC actions add action skbedit queue_mapping 3 pass index 271",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action skbedit index 271",
-        "matchPattern": "action order [0-9]*:  skbedit queue_mapping 3 pass.*index 271 ref",
+        "matchPattern": "action order [0-9]*: skbedit queue_mapping 3 pass.*index 271 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action skbedit"
@@ -305,7 +305,7 @@
         "cmdUnderTest": "$TC actions add action skbedit queue_mapping 3 drop index 271",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action skbedit index 271",
-        "matchPattern": "action order [0-9]*:  skbedit queue_mapping 3 drop.*index 271 ref",
+        "matchPattern": "action order [0-9]*: skbedit queue_mapping 3 drop.*index 271 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action skbedit"
@@ -329,7 +329,7 @@
         "cmdUnderTest": "$TC actions add action skbedit priority 8 jump 9 index 2",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action skbedit index 2",
-        "matchPattern": "action order [0-9]*:  skbedit priority :8 jump 9.*index 2 ref",
+        "matchPattern": "action order [0-9]*: skbedit  priority :8 jump 9.*index 2 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action skbedit"
@@ -353,7 +353,7 @@
         "cmdUnderTest": "$TC actions add action skbedit priority 16 continue index 32",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action skbedit index 32",
-        "matchPattern": "action order [0-9]*:  skbedit priority :16 continue.*index 32 ref",
+        "matchPattern": "action order [0-9]*: skbedit  priority :16 continue.*index 32 ref",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action skbedit"
@@ -377,7 +377,7 @@
         "cmdUnderTest": "$TC actions add action skbedit priority 16 continue index 32 cookie deadbeef",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action skbedit index 32",
-        "matchPattern": "action order [0-9]*:  skbedit priority :16 continue.*index 32 ref.*cookie deadbeef",
+        "matchPattern": "action order [0-9]*: skbedit  priority :16 continue.*index 32 ref.*cookie deadbeef",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action skbedit"
@@ -405,7 +405,7 @@
         "cmdUnderTest": "$TC actions list action skbedit",
         "expExitCode": "0",
         "verifyCmd": "$TC actions list action skbedit",
-        "matchPattern": "action order [0-9]*:  skbedit",
+        "matchPattern": "action order [0-9]*: skbedit",
         "matchCount": "4",
         "teardown": [
             "$TC actions flush action skbedit"
-- 
2.7.5

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
