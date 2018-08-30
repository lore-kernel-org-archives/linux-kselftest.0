From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Thu, 30 Aug 2018 23:14:48 +0900
Subject: [PATCH v3 05/28] selftests/ftrace: Add SPDX License Identifier to
 template
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <153563848790.29700.6872364193299346269.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180830141448.hsG4EftsRxIH3pwxi__tOKUkHVI756g3V_z_LtNGoEs@z>

Add SPDX License Identifier line to template file so
that someone who makes new testcase from the template
does not forgot it.

Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
---
 tools/testing/selftests/ftrace/test.d/template |    1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/ftrace/test.d/template b/tools/testing/selftests/ftrace/test.d/template
index 5c39ceb18a0d..799da7e0b3c9 100644
--- a/tools/testing/selftests/ftrace/test.d/template
+++ b/tools/testing/selftests/ftrace/test.d/template
@@ -1,4 +1,5 @@
 #!/bin/sh
+# SPDX-License-Identifier: GPL2.0
 # description: %HERE DESCRIBE WHAT THIS DOES%
 # you have to add ".tc" extention for your testcase file
 # Note that all tests are run with "errexit" option.
