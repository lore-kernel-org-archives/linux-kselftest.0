From: jrdr.linux at gmail.com (Souptick Joarder)
Date: Wed, 6 Mar 2019 21:52:52 +0530
Subject: [PATCH v2] selftest/timers: Remove duplicate header
Message-ID: <20190306162252.GA3221@jordon-HP-15-Notebook-PC>

From: Sabyasachi Gupta <sabyasachi.linux at gmail.com>

Remove duplicate header which is included twice.

Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
---
v2: Corrected format.

 tools/testing/selftests/timers/skew_consistency.c | 1 -
 1 file changed, 1 deletion(-)

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
-- 
1.9.1
