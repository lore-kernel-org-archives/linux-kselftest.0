From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:13:51 +0900
Subject: [PATCH v3 03/28] selftests/ftrace: Add case number prefix to logfile
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563843138.29700.4836714204453571737.stgit@devbox>

Add a case number prefix to each logfile. This makes
it easier to find which logfile is corresponding
to which failure.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
---
 tools/testing/selftests/ftrace/ftracetest |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
index 8debd37038e4..3ca596255eff 100755
--- a/tools/testing/selftests/ftrace/ftracetest
+++ b/tools/testing/selftests/ftrace/ftracetest
@@ -284,13 +284,13 @@ __run_test() { # testfile
 # Run one test case
 run_test() { # testfile
   local testname=`basename $1`
+  testcase $1
   if [ ! -z "$LOG_FILE" ] ; then
-    local testlog=`mktemp $LOG_DIR/${testname}-log.XXXXXX`
+    local testlog=`mktemp $LOG_DIR/${CASENO}-${testname}-log.XXXXXX`
   else
     local testlog=/proc/self/fd/1
   fi
   export TMPDIR=`mktemp -d /tmp/ftracetest-dir.XXXXXX`
-  testcase $1
   echo "execute$INSTANCE: "$1 > $testlog
   SIG_RESULT=0
   if [ $VERBOSE -eq -1 ]; then
