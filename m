From: alakesh.haloi at gmail.com (Alakesh Haloi)
Date: Fri, 24 May 2019 01:42:11 +0000
Subject: [PATCH] selftests: add missing include linux/sockios
Message-ID: <20190524014211.GA78399@ip-172-31-44-144.us-west-2.compute.internal>

Including <linux/sockios.h> fixes the following compiler warning

timestamping.c: In function ‘printpacket’:
timestamping.c:261:19: error: ‘SIOCGSTAMP’ undeclared (first use in this function); did you mean ‘SIOCGSTAMPNS’?
   if (ioctl(sock, SIOCGSTAMP, &tv))
                   ^~~~~~~~~~
                   SIOCGSTAMPNS

Signed-off-by: Alakesh Haloi <alakesh.haloi at gmail.com>
---
 tools/testing/selftests/networking/timestamping/timestamping.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/networking/timestamping/timestamping.c b/tools/testing/selftests/networking/timestamping/timestamping.c
index 5cdfd743447b..62f03bcc9432 100644
--- a/tools/testing/selftests/networking/timestamping/timestamping.c
+++ b/tools/testing/selftests/networking/timestamping/timestamping.c
@@ -44,6 +44,7 @@
 #include <asm/types.h>
 #include <linux/net_tstamp.h>
 #include <linux/errqueue.h>
+#include <linux/sockios.h>
 
 #ifndef SO_TIMESTAMPING
 # define SO_TIMESTAMPING         37
-- 
2.17.1
