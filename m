From: jeffrin@rajagiritech.edu.in (Jeffrin Jose T)
Date: Fri, 18 Jan 2019 02:32:58 +0530
Subject: [PATCH] selftests: kmod: worked on errors which breaks the overall
 execution of the test script
Message-ID: <20190117210258.7871-1-jeffrin@rajagiritech.edu.in>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190117210258.k52kE02AlXCb7Ss904iyMXpn3riV4TWrhnSWGIsgtMA@z>

The kmod.sh script breaks because an array is passed as input
instead of a single element input.This patch takes elements
one at a time and passed as input to the condition statement
which in turn fixes the error.There was an issue which had
the need for passing a single digit to the condition statement
which is fixed using regular expression.

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
