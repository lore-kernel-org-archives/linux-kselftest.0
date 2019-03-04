From: jrdr.linux at gmail.com (Souptick Joarder)
Date: Mon, 4 Mar 2019 23:50:48 +0530
Subject: [PATCH] selftest/net: Remove duplicate header
Message-ID: <20190304182048.GA6553@jordon-HP-15-Notebook-PC>

Remove duplicate header which is included twice.

Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
---
 tools/testing/selftests/net/udpgso.c | 1 -
 1 file changed, 1 deletion(-)

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
-- 
1.9.1
