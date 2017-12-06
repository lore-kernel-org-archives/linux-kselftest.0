From: pravin.shedge4linux at gmail.com (Pravin Shedge)
Date: Wed,  6 Dec 2017 23:17:45 +0530
Subject: [Linux-kselftest-mirror] [PATCH 32/45] tools/testing/selftests:
	remove duplicate includes
Message-ID: <1512582465-6581-1-git-send-email-pravin.shedge4linux@gmail.com>

These duplicate includes have been found with scripts/checkincludes.pl but
they have been removed manually to avoid removing false positives.

Signed-off-by: Pravin Shedge <pravin.shedge4linux at gmail.com>
---
 tools/testing/selftests/gpio/gpio-mockup-chardev.c          | 1 -
 tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c | 1 -
 tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c         | 1 -
 tools/testing/selftests/timers/skew_consistency.c           | 1 -
 tools/testing/selftests/x86/mpx-dig.c                       | 2 --
 tools/testing/selftests/x86/mpx-mini-test.c                 | 4 ----
 tools/testing/selftests/x86/unwind_vdso.c                   | 1 -
 7 files changed, 11 deletions(-)

diff --git a/tools/testing/selftests/gpio/gpio-mockup-chardev.c b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
index 667e916..0424aaa 100644
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
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
index 167135b..bf599d4 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
@@ -3,7 +3,6 @@
  * Licensed under GPLv2.
  */
 
-#include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <stdbool.h>
diff --git a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
index 137185b..be05b2c 100644
--- a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
+++ b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
@@ -14,7 +14,6 @@
 #include <string.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <pthread.h>
 #include <sys/mman.h>
 #include <unistd.h>
 #include <pthread.h>
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
diff --git a/tools/testing/selftests/x86/mpx-mini-test.c b/tools/testing/selftests/x86/mpx-mini-test.c
index ec0f6b4..f17e0a1 100644
--- a/tools/testing/selftests/x86/mpx-mini-test.c
+++ b/tools/testing/selftests/x86/mpx-mini-test.c
@@ -722,10 +722,6 @@ void mpx_cleanup(void)
 }
 
 /*-------------- the following is test case ---------------*/
-#include <stdint.h>
-#include <stdbool.h>
-#include <stdlib.h>
-#include <stdio.h>
 #include <time.h>
 
 uint64_t num_lower_brs;
diff --git a/tools/testing/selftests/x86/unwind_vdso.c b/tools/testing/selftests/x86/unwind_vdso.c
index 00a26a8..9731133 100644
--- a/tools/testing/selftests/x86/unwind_vdso.c
+++ b/tools/testing/selftests/x86/unwind_vdso.c
@@ -44,7 +44,6 @@ int main()
 #include <stdbool.h>
 #include <sys/ptrace.h>
 #include <sys/user.h>
-#include <sys/ucontext.h>
 #include <link.h>
 #include <sys/auxv.h>
 #include <dlfcn.h>
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
