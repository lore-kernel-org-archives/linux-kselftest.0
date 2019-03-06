From: jrdr.linux@gmail.com (Souptick Joarder)
Date: Wed, 6 Mar 2019 21:46:51 +0530
Subject: [PATCH v2] selftest/rseq: Remove duplicate header
Message-ID: <20190306161650.GA3155@jordon-HP-15-Notebook-PC>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190306161651.nreL_ogBc9wwUOmb4iBpIOwoY_farFsMQOyA5Xnsh28@z>

From: Sabyasachi Gupta <sabyasachi.linux@gmail.com>

Remove duplicate header which is included twice

Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
Acked-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
---
v2: Corrected format.

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
