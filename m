From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:27 -0600
Subject: [PATCH 23/24] selftests: mqueue: return Kselftest Skip code for
 skipped tests
In-Reply-To: <20180505011328.32078-1-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
Message-ID: <20180505011328.32078-23-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180505011327.IOy-n0S30j-SE9lj8aeL2fz1y1aqxqxo6ICkw0wNjmg@z>

When mqueue test is skipped because of unmet dependencies and/or
unsupported configuration, it exits with error which is treated as
a fail by the Kselftest framework. This leads to false negative
result even when the test could not be run.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run.

Change it to use ksft_exit_skip() when the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/mqueue/mq_open_tests.c | 8 ++++----
 tools/testing/selftests/mqueue/mq_perf_tests.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mqueue/mq_open_tests.c b/tools/testing/selftests/mqueue/mq_open_tests.c
index 677140aa25fd..9403ac01ba11 100644
--- a/tools/testing/selftests/mqueue/mq_open_tests.c
+++ b/tools/testing/selftests/mqueue/mq_open_tests.c
@@ -33,6 +33,8 @@
 #include <mqueue.h>
 #include <error.h>
 
+#include "../kselftest.h"
+
 static char *usage =
 "Usage:\n"
 "  %s path\n"
@@ -262,12 +264,10 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	if (getuid() != 0) {
-		fprintf(stderr, "Not running as root, but almost all tests "
+	if (getuid() != 0)
+		ksft_exit_skip("Not running as root, but almost all tests "
 			"require root in order to modify\nsystem settings.  "
 			"Exiting.\n");
-		exit(1);
-	}
 
 	/* Find out what files there are for us to make tweaks in */
 	def_msgs = fopen(DEF_MSGS, "r+");
diff --git a/tools/testing/selftests/mqueue/mq_perf_tests.c b/tools/testing/selftests/mqueue/mq_perf_tests.c
index 8188f72de93c..b019e0b8221c 100644
--- a/tools/testing/selftests/mqueue/mq_perf_tests.c
+++ b/tools/testing/selftests/mqueue/mq_perf_tests.c
@@ -39,6 +39,8 @@
 #include <popt.h>
 #include <error.h>
 
+#include "../kselftest.h"
+
 static char *usage =
 "Usage:\n"
 "  %s [-c #[,#..] -f] path\n"
@@ -626,12 +628,10 @@ int main(int argc, char *argv[])
 		cpus_to_pin[0] = cpus_online - 1;
 	}
 
-	if (getuid() != 0) {
-		fprintf(stderr, "Not running as root, but almost all tests "
+	if (getuid() != 0)
+		ksft_exit_skip("Not running as root, but almost all tests "
 			"require root in order to modify\nsystem settings.  "
 			"Exiting.\n");
-		exit(1);
-	}
 
 	max_msgs = fopen(MAX_MSGS, "r+");
 	max_msgsize = fopen(MAX_MSGSIZE, "r+");
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
