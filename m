From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:15:16 +0900
Subject: [PATCH v3 06/28] selftests/ftrace: Cleanup ftrace after running test
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563851616.29700.904736360142587564.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180830141516.CUNpoDOUvfY8qVXJqpUfvFSdqXGi31xYZhl2sdJtWLE@z>

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
