From: juerg.haefliger at canonical.com (Juerg Haefliger)
Date: Fri, 22 Feb 2019 21:53:51 +0100
Subject: [RESEND PATCH v2 2/2] selftests/ftrace: Replace \e with \033
In-Reply-To: <20190222205351.743-1-juergh@canonical.com>
References: <20190222091021.10178-1-juergh@canonical.com>
 <20190222205351.743-1-juergh@canonical.com>
Message-ID: <20190222205351.743-3-juergh@canonical.com>

The \e sequence character is not POSIX. Fix that by using \033 instead.

Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
Acked-by: Masami Hiramatsu <mhiramat at kernel.org>
Signed-off-by: Juerg Haefliger <juergh at canonical.com>
---
 tools/testing/selftests/ftrace/ftracetest | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
index 20c9c0ad8682..136387422b00 100755
--- a/tools/testing/selftests/ftrace/ftracetest
+++ b/tools/testing/selftests/ftrace/ftracetest
@@ -161,10 +161,10 @@ color_green=
 color_blue=
 # If stdout exists and number of colors is eight or more, use them
 if [ -t 1 -a "$ncolors" -ge 8 ]; then
-  color_reset="\e[0m"
-  color_red="\e[31m"
-  color_green="\e[32m"
-  color_blue="\e[34m"
+  color_reset="\033[0m"
+  color_red="\033[31m"
+  color_green="\033[32m"
+  color_blue="\033[34m"
 fi
 
 strip_esc() {
-- 
2.19.1
