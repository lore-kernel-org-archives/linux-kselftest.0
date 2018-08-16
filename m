From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:30:08 +0900
Subject: [PATCH v2 02/32] selftests/ftrace: Add --stop-fail hidden option for
 debug
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443700818.23257.8232348122806172328.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180816163008.SXX1ldf14-2AjMrLatusENiw7F-0B9goC30wXtzweVI@z>

Add --stop-fail option for debugging the ftracetest.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 tools/testing/selftests/ftrace/ftracetest |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
index f9a9d424c980..c9c7fa8dc440 100755
--- a/tools/testing/selftests/ftrace/ftracetest
+++ b/tools/testing/selftests/ftrace/ftracetest
@@ -69,6 +69,10 @@ parse_opts() { # opts
       DEBUG=1
       shift 1
     ;;
+    --stop-fail)
+      STOP_FAILURE=1
+      shift 1
+    ;;
     --fail-unsupported)
       UNSUPPORTED_RESULT=1
       shift 1
@@ -117,6 +121,7 @@ KEEP_LOG=0
 DEBUG=0
 VERBOSE=0
 UNSUPPORTED_RESULT=0
+STOP_FAILURE=0
 # Parse command-line options
 parse_opts $*
 
@@ -304,6 +309,10 @@ run_test() { # testfile
 # Main loop
 for t in $TEST_CASES; do
   run_test $t
+  if [ $STOP_FAILURE -ne 0 -a $TOTAL_RESULT -ne 0 ]; then
+    echo "A failure detected. Stop test."
+    exit 1
+  fi
 done
 
 # Test on instance loop
@@ -315,6 +324,10 @@ for t in $TEST_CASES; do
   run_test $t
   rmdir $TRACING_DIR
   TRACING_DIR=$SAVED_TRACING_DIR
+  if [ $STOP_FAILURE -ne 0 -a $TOTAL_RESULT -ne 0 ]; then
+    echo "A failure detected. Stop test."
+    exit 1
+  fi
 done
 
 prlog ""
