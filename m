From: jeffrin@rajagiritech.edu.in (Jeffrin Jose T)
Date: Fri,  1 Feb 2019 00:01:09 +0530
Subject: [PATCH v2] selftests: kmod: worked on errors which breaks the overall
 execution of the test script. i have manually edited for v2 of the patch by
 changing the date and also commit log.
Message-ID: <20190131183109.10919-1-jeffrin@rajagiritech.edu.in>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190131183109.gzMrNWFUPXg-C0wSKAt1ntflVe11jqgZQoyC9SufQs0@z>

The kmod.sh script breaks because an array is passed as input
instead of a single element input.This patch takes elements
one at a time and passed as input to the condition statement
which in turn fixes the error.There was an issue which had
the need for passing a single digit to the condition statement
which is fixed using regular expression.
Distribution: Debian GNU/Linux buster/sid
Bash Version: 5.0.0(1)-release

Signed-off-by: Jeffrin Jose T <jeffrin at rajagiritech.edu.in>
---
 tools/testing/selftests/kmod/kmod.sh | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kmod/kmod.sh b/tools/testing/selftests/kmod/kmod.sh
index 0a76314b4414..49b273c3646e 100755
--- a/tools/testing/selftests/kmod/kmod.sh
+++ b/tools/testing/selftests/kmod/kmod.sh
@@ -526,9 +526,12 @@ function run_all_tests()
 		TEST_ID=${i%:*:*}
 		ENABLED=$(get_test_enabled $TEST_ID)
 		TEST_COUNT=$(get_test_count $TEST_ID)
-		if [[ $ENABLED -eq "1" ]]; then
-			test_case $TEST_ID $TEST_COUNT
-		fi
+		for j in $ENABLED ; do
+		         CHECK=${j#*:*:}
+			 if [[ $CHECK -eq "1" ]]; then
+			     test_case $TEST_ID $TEST_COUNT
+			 fi
+		done
 	done
 }
 
-- 
2.20.1
