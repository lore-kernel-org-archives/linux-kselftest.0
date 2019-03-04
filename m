From: jrdr.linux at gmail.com (Souptick Joarder)
Date: Tue, 5 Mar 2019 00:08:27 +0530
Subject: [PATCH] selftest/rseq: Remove duplicate header
Message-ID: <20190304183827.GA6809@jordon-HP-15-Notebook-PC>

Remove duplicate header which is included twice

Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
---
 tools/testing/selftests/rseq/rseq.h | 1 -
 1 file changed, 1 deletion(-)

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
-- 
1.9.1
