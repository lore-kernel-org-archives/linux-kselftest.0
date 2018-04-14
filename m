From: peng.hao2 at zte.com.cn (Peng Hao)
Date: Sun, 15 Apr 2018 03:08:56 +0800
Subject: [PATCH] selftests:vm: add include file
Message-ID: <1523732936-42546-1-git-send-email-peng.hao2@zte.com.cn>

userfaultfd.c: In function ‘hugetlb_release_pages’:
userfaultfd.c:145:25: error: ‘FALLOC_FL_PUNCH_HOLE’ undeclared 
(first use in this function)

Signed-off-by: Peng Hao <peng.hao2 at zte.com.cn>
---
 tools/testing/selftests/vm/userfaultfd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
index de2f9ec..d8fe447 100644
--- a/tools/testing/selftests/vm/userfaultfd.c
+++ b/tools/testing/selftests/vm/userfaultfd.c
@@ -68,6 +68,7 @@
 #include <linux/userfaultfd.h>
 #include <setjmp.h>
 #include <stdbool.h>
+#include <linux/falloc.h>
 
 #ifdef __NR_userfaultfd
 
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
