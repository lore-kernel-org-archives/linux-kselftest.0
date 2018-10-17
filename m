From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Wed, 17 Oct 2018 12:33:23 +0900
Subject: [PATCH] selftests/ftrace: Strip escape sequences for log file
In-Reply-To: <20181017100305.0b3c03461b098f8943805455@gmail.com>
References: <20181017100305.0b3c03461b098f8943805455@gmail.com>
Message-ID: <153974720272.17748.17439079576533415951.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181017033323.MOI49hC72rEHeYulAxZyWXvdWOVjFsehUN_mVkYP_0g@z>

Strip escape sequences from the stream to the ftracetest
summary log file. Note that all test-case results are
dumped raw in each file.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 tools/testing/selftests/ftrace/ftracetest |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
index d987bbec675f..75244db70331 100755
--- a/tools/testing/selftests/ftrace/ftracetest
+++ b/tools/testing/selftests/ftrace/ftracetest
@@ -167,11 +167,18 @@ if [ -t 1 -a "$ncolors" -a "$ncolors" -ge 8 ]; then
   color_blue="\e[34m"
 fi
 
+strip_esc() {
+  # busybox sed implementation doesn't accept "\x1B", so use [:cntrl:] instead.
+  sed -E "s/[[:cntrl:]]\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"
+}
+
 prlog() { # messages
-  [ -z "$LOG_FILE" ] && echo -e "$@" || echo -e "$@" | tee -a $LOG_FILE
+  echo -e "$@"
+  [ "$LOG_FILE" ] && echo -e "$@" | strip_esc >> $LOG_FILE
 }
 catlog() { #file
-  [ -z "$LOG_FILE" ] && cat $1 || cat $1 | tee -a $LOG_FILE
+  cat $1
+  [ "$LOG_FILE" ] && cat $1 | strip_esc >> $LOG_FILE
 }
 prlog "=== Ftrace unit tests ==="
 
