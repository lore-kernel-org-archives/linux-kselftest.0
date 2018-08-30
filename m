From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:13:23 +0900
Subject: [PATCH v3 02/28] selftests/ftrace: Add --console hidden option
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563840309.29700.18393382534653831079.stgit@devbox>

Add --console hidden option for debug test cases.

This option allows to put "sh" or something else
when the test case hits a bug.

For example, if you find a testcase which doesn't
pass, you can insert sh for interactive debug as below

  -----
  #!/bin/sh
  # description: sample test case

  good-command
  suspicious-wrong-command
  sh # <- add this for interactive debug
  -----

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
  Changes in v3
  - Add an example of this feature in the description
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
