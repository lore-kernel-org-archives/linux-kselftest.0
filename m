From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:16:41 +0900
Subject: [PATCH v3 09/28] selftests/ftrace: Fix checkbashisms errors
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563860167.29700.13365388020478810834.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180830141641.siakUK6Kuhx2zsJcRQicfMmVgq4_Qp4jFzRBwCmNYRE@z>

Fix a test case to make checkbashisms clean.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
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
 
