From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 22 Feb 2019 10:27:25 +0900
Subject: [PATCH selftests 2/2] selftests/ftrace: Add checkbashisms
 meta-testcase
In-Reply-To: <155079878723.5157.12433171255092403676.stgit@devbox>
References: <155079878723.5157.12433171255092403676.stgit@devbox>
Message-ID: <155079884527.5157.14848621451304431136.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190222012725.eGESUhAMk0iyWVixphSlQt5FG2WjIDrg3_qdJYk44tk@z>

Add a meta-testcase which tests ftracetest itself with
checkbasisms. This helps us to keep our test script
bashisms clean.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 tools/testing/selftests/ftrace/ftracetest          |    1 +
 .../selftests/ftrace/test.d/selftest/bashisms.tc   |   21 ++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/selftest/bashisms.tc

diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
index 75244db70331..72b6df37cdb9 100755
--- a/tools/testing/selftests/ftrace/ftracetest
+++ b/tools/testing/selftests/ftrace/ftracetest
@@ -313,6 +313,7 @@ run_test() { # testfile
     local testlog=/proc/self/fd/1
   fi
   export TMPDIR=`mktemp -d /tmp/ftracetest-dir.XXXXXX`
+  export FTRACETEST_ROOT=$TOP_DIR
   echo "execute$INSTANCE: "$1 > $testlog
   SIG_RESULT=0
   if [ $VERBOSE -eq -1 ]; then
diff --git a/tools/testing/selftests/ftrace/test.d/selftest/bashisms.tc b/tools/testing/selftests/ftrace/test.d/selftest/bashisms.tc
new file mode 100644
index 000000000000..1b081e910e14
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/selftest/bashisms.tc
@@ -0,0 +1,21 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Meta-selftest: Checkbashisms
+
+if [ ! -f $FTRACETEST_ROOT/ftracetest ]; then
+  echo "Hmm, we can not find ftracetest"
+  exit_unresolved
+fi
+
+if ! which checkbashisms > /dev/null 2>&1 ; then
+  echo "No checkbashisms found. skipped."
+  exit_unresolved
+fi
+
+checkbashisms $FTRACETEST_ROOT/ftracetest
+checkbashisms $FTRACETEST_ROOT/test.d/functions
+for t in $(find $FTRACETEST_ROOT/test.d -name \*.tc); do
+  checkbashisms $t
+done
+
+exit 0
