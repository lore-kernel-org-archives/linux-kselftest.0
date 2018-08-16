From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:32:30 +0900
Subject: [PATCH v2 07/32] selftests/ftrace: Cleanup ftrace after running test
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443715007.23257.7438540516039987709.stgit@devbox>

Cleanup ftrace by initialize_ftrace() after running
all test cases. This means we also don't need cleanup
ftrace on each test case, except for some special
options.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 tools/testing/selftests/ftrace/ftracetest |    1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
index 3ca596255eff..5c71d58febb2 100755
--- a/tools/testing/selftests/ftrace/ftracetest
+++ b/tools/testing/selftests/ftrace/ftracetest
@@ -341,6 +341,7 @@ for t in $TEST_CASES; do
     exit 1
   fi
 done
+(cd $TRACING_DIR; initialize_ftrace) # for cleanup
 
 prlog ""
 prlog "# of passed: " `echo $PASSED_CASES | wc -w`
