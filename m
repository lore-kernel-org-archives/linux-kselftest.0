From: jrdr.linux@gmail.com (Souptick Joarder)
Date: Mon, 4 Mar 2019 23:57:19 +0530
Subject: [PATCH] selftest/proc: Remove duplicate header
Message-ID: <20190304182719.GA6606@jordon-HP-15-Notebook-PC>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190304182719.DN0ybwy9Pwo27Ai0amxGZKt-fMS0YfiHb4AaUnCX6_g@z>

Remove duplicate header which is included twice.

Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
---
 tools/testing/selftests/proc/proc-self-syscall.c | 1 -
 1 file changed, 1 deletion(-)

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
 
-- 
1.9.1
