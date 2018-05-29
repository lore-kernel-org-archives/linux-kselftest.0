From: ahiliation at gmail.com (Jeffrin Jose T)
Date: Tue, 29 May 2018 22:54:36 +0530
Subject: [PATCH] [RESEND] selftest: intel_pstate: debug support message from
 aperf.c and return value fix.
Message-ID: <20180529172436.4432-1-ahiliation@gmail.com>

Additional message along with an error message which is more
verbose for debug support from aperf.c and updated with the
new return value "KSFT_SKIP".

Signed-off-by: Jeffrin Jose T [Rajagiri SET] <ahiliation at gmail.com>
---
 tools/testing/selftests/intel_pstate/aperf.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/intel_pstate/aperf.c b/tools/testing/selftests/intel_pstate/aperf.c
index d21edea9c560..f6cd03a87493 100644
--- a/tools/testing/selftests/intel_pstate/aperf.c
+++ b/tools/testing/selftests/intel_pstate/aperf.c
@@ -9,6 +9,8 @@
 #include <sys/timeb.h>
 #include <sched.h>
 #include <errno.h>
+#include <string.h>
+#include "../kselftest.h"
 
 void usage(char *name) {
 	printf ("Usage: %s cpunum\n", name);
@@ -41,8 +43,8 @@ int main(int argc, char **argv) {
 	fd = open(msr_file_name, O_RDONLY);
 
 	if (fd == -1) {
-		perror("Failed to open");
-		return 1;
+		printf("/dev/cpu/%d/msr: %s\n", cpu, strerror(errno));
+		return KSFT_SKIP;
 	}
 
 	CPU_ZERO(&cpuset);
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
