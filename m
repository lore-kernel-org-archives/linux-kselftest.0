From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 27 Jul 2018 21:12:47 +0900
Subject: [PATCH 06/25] selftests/ftrace: Cleanup ftrace after running test
In-Reply-To: <153269339575.3084.16279591141931053689.stgit@devbox>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
Message-ID: <153269356720.3084.3464379546646600817.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180727121247.OqEquLL2Zvmgonp1Y-bjq6AySrceoEYKj3YdjOg9mNY@z>

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

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
