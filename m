From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:11:50 +0900
Subject: [PATCH 04/25] selftests/ftrace: Add case number prefix to logfile
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269351056.3084.7864864998320830799.stgit@devbox>

Add a case number prefix to each logfile. This makes
it easier to find which logfile is corresponding
to which failure.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
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

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
