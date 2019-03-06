From: jrdr.linux at gmail.com (Souptick Joarder)
Date: Wed, 6 Mar 2019 21:59:04 +0530
Subject: [PATCH v2] selftest/x86/mpx-dig.c: Remove duplicate header
Message-ID: <20190306162904.GA3277@jordon-HP-15-Notebook-PC>

From: Sabyasachi Gupta <sabyasachi.linux at gmail.com>

Remove duplicate header which is included twice.

Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
---
v2: Corrected format

 tools/testing/selftests/x86/mpx-dig.c | 2 --
 1 file changed, 2 deletions(-)

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
