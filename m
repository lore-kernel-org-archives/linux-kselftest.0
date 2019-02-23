From: jrdr.linux@gmail.com (Souptick Joarder)
Date: Sat, 23 Feb 2019 12:39:02 +0530
Subject: [PATCH] tools: testing: selftests: Remove duplicate headers
Message-ID: <20190223070901.GA10274@jordon-HP-15-Notebook-PC>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190223070902.G5OCcCSO5SOUt0CF6N61QI0jL1VyTDzmSL6OlPZoXhw@z>

Remove duplicate headers which are included twice.

Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
---
 tools/testing/selftests/gpio/gpio-mockup-chardev.c          | 1 -
 tools/testing/selftests/net/udpgso.c                        | 1 -
 tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c | 1 -
 tools/testing/selftests/proc/proc-self-syscall.c            | 1 -
 tools/testing/selftests/rseq/rseq.h                         | 1 -
 tools/testing/selftests/timers/skew_consistency.c           | 1 -
 tools/testing/selftests/x86/mpx-dig.c                       | 2 --
 7 files changed, 8 deletions(-)

diff --git a/tools/testing/selftests/gpio/gpio-mockup-chardev.c b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
index aaa1e9f..d587c81 100644
--- a/tools/testing/selftests/gpio/gpio-mockup-chardev.c
+++ b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
@@ -12,7 +12,6 @@
 #include <unistd.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <stdio.h>
 #include <errno.h>
 #include <string.h>
 #include <fcntl.h>
diff --git a/tools/testing/selftests/net/udpgso.c b/tools/testing/selftests/net/udpgso.c
index e279051..b8265ee 100644
--- a/tools/testing/selftests/net/udpgso.c
+++ b/tools/testing/selftests/net/udpgso.c
@@ -17,7 +17,6 @@
 #include <stdbool.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <stdlib.h>
 #include <string.h>
 #include <sys/ioctl.h>
 #include <sys/socket.h>
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
index 167135b..af1b802 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
@@ -11,7 +11,6 @@
 #include <sys/wait.h>
 #include <unistd.h>
 #include <setjmp.h>
-#include <signal.h>
 
 #include "ebb.h"
 
diff --git a/tools/testing/selftests/proc/proc-self-syscall.c b/tools/testing/selftests/proc/proc-self-syscall.c
index 5ab5f48..3a4fec3 100644
--- a/tools/testing/selftests/proc/proc-self-syscall.c
+++ b/tools/testing/selftests/proc/proc-self-syscall.c
@@ -20,7 +20,6 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <errno.h>
-#include <unistd.h>
 #include <string.h>
 #include <stdio.h>
 
diff --git a/tools/testing/selftests/rseq/rseq.h b/tools/testing/selftests/rseq/rseq.h
index c72eb70..6c1126e7 100644
--- a/tools/testing/selftests/rseq/rseq.h
+++ b/tools/testing/selftests/rseq/rseq.h
@@ -16,7 +16,6 @@
 #include <errno.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <sched.h>
 #include <linux/rseq.h>
 
 /*
diff --git a/tools/testing/selftests/timers/skew_consistency.c b/tools/testing/selftests/timers/skew_consistency.c
index 022b711..8066be9 100644
--- a/tools/testing/selftests/timers/skew_consistency.c
+++ b/tools/testing/selftests/timers/skew_consistency.c
@@ -32,7 +32,6 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <stdlib.h>
 #include <string.h>
 #include <sys/wait.h>
 #include "../kselftest.h"
diff --git a/tools/testing/selftests/x86/mpx-dig.c b/tools/testing/selftests/x86/mpx-dig.c
index c13607e..880fbf6 100644
--- a/tools/testing/selftests/x86/mpx-dig.c
+++ b/tools/testing/selftests/x86/mpx-dig.c
@@ -8,9 +8,7 @@
 #include <unistd.h>
 #include <stdio.h>
 #include <errno.h>
-#include <sys/types.h>
 #include <sys/stat.h>
-#include <unistd.h>
 #include <sys/mman.h>
 #include <string.h>
 #include <fcntl.h>
-- 
1.9.1
