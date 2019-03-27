From: jagdsh.linux@gmail.com (jagdsh.linux@gmail.com)
Date: Thu, 28 Mar 2019 03:19:16 +0530
Subject: [PATCH] selftests:powerpc/tm/tm-vmx-unavail.c : Remove duplicate
 header
Message-ID: <1553723356-40069-1-git-send-email-jagdsh.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190327214916.2WXH79vk7qAVBMkChu8ZSM1QolkKMy_N_d3lyAOfoGQ@z>

From: Jagadeesh Pagadala <jagdsh.linux@gmail.com>

Remove duplicate header which is included twice.

Signed-off-by: Jagadeesh Pagadala <jagdsh.linux at gmail.com>
---
 tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
index 137185b..1cb963a 100644
--- a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
+++ b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
@@ -17,7 +17,6 @@
 #include <pthread.h>
 #include <sys/mman.h>
 #include <unistd.h>
-#include <pthread.h>
 
 #include "tm.h"
 #include "utils.h"
-- 
1.8.3.1
