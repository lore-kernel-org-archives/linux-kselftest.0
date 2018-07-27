From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:11:22 +0900
Subject: [PATCH 03/25] selftests/ftrace: Add --console hidden option
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269348225.3084.9004174603577223490.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727121122.KzJrfsb96pEma9oapA5tsnPzewFEupO7Hy8r5NpwIfE@z>

Add --console hidden option for debug test cases.
This option allows to put "sh" or something else
when the test case hits a bug.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 tools/testing/selftests/ftrace/ftracetest |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
index c9c7fa8dc440..8debd37038e4 100755
--- a/tools/testing/selftests/ftrace/ftracetest
+++ b/tools/testing/selftests/ftrace/ftracetest
@@ -60,11 +60,21 @@ parse_opts() { # opts
       shift 1
     ;;
     --verbose|-v|-vv|-vvv)
+      if [ $VERBOSE -eq -1 ]; then
+	usage "--console can not use with --verbose"
+      fi
       VERBOSE=$((VERBOSE + 1))
       [ $1 = '-vv' ] && VERBOSE=$((VERBOSE + 1))
       [ $1 = '-vvv' ] && VERBOSE=$((VERBOSE + 2))
       shift 1
     ;;
+    --console)
+      if [ $VERBOSE -ne 0 ]; then
+	usage "--console can not use with --verbose"
+      fi
+      VERBOSE=-1
+      shift 1
+    ;;
     --debug|-d)
       DEBUG=1
       shift 1
@@ -283,7 +293,9 @@ run_test() { # testfile
   testcase $1
   echo "execute$INSTANCE: "$1 > $testlog
   SIG_RESULT=0
-  if [ -z "$LOG_FILE" ]; then
+  if [ $VERBOSE -eq -1 ]; then
+    __run_test $1
+  elif [ -z "$LOG_FILE" ]; then
     __run_test $1 2>&1
   elif [ $VERBOSE -ge 3 ]; then
     __run_test $1 | tee -a $testlog 2>&1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
