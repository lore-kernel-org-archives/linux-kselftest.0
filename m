From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 17 Aug 2018 01:32:01 +0900
Subject: [PATCH v2 06/32] selftests/ftrace: Add SPDX License Identifier to
 template
In-Reply-To: <153443695002.23257.13628220023468200991.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
Message-ID: <153443712171.23257.2864376324991904025.stgit@devbox>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180816163201.oOmMVD4tJazeeaaTiIqYCzdetBYwqOcjH7uU1INd8qA@z>

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
