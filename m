From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:24:14 +0900
Subject: [PATCH v3 25/28] selftests/ftrace: Add stacktrace ftrace filter
 command testcase
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563905428.29700.15538326679607667577.stgit@devbox>

Add a test case for stacktrace filter command for ftrace.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 Changes in v3:
 - Remove the last extra line.
 - Run this on an instance too.
---
 .../ftrace/test.d/ftrace/func-filter-stacktrace.tc |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc

diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc
new file mode 100644
index 000000000000..bf72e783d014
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc
@@ -0,0 +1,12 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL2.0
+# description: ftrace - stacktrace filter command
+# flags: instance
+
+echo _do_fork:stacktrace >> set_ftrace_filter
+
+grep -q "_do_fork:stacktrace:unlimited" set_ftrace_filter
+
+(echo "forked"; sleep 1)
+
+grep -q "<stack trace>" trace
