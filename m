From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:33:55 +0900
Subject: [PATCH v2 10/32] selftests/ftrace: Fix checkbashisms errors
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443723502.23257.14228272091408974348.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180816163355.s46IGVE6vIe0hudLVUu6KfLJPLykVQi5xFRJjPUHYAw@z>

Fix a test case to make checkbashisms clean.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 .../trigger/trigger-trace-marker-snapshot.tc       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/trigger/trigger-trace-marker-snapshot.tc b/tools/testing/selftests/ftrace/test.d/trigger/trigger-trace-marker-snapshot.tc
index 79ce7d51350b..df246e505af7 100644
--- a/tools/testing/selftests/ftrace/test.d/trigger/trigger-trace-marker-snapshot.tc
+++ b/tools/testing/selftests/ftrace/test.d/trigger/trigger-trace-marker-snapshot.tc
@@ -39,10 +39,10 @@ test_trace() {
 	fi
 	echo "testing $line for >$x<"
 	match=`echo $line | sed -e "s/>$x<//"`
-	if [ "$line" == "$match" ]; then
+	if [ "$line" = "$match" ]; then
 	    fail "$line does not have >$x< in it"
 	fi
-	let x=$x+2
+	x=$((x+2))
     done
 }
 
