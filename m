From: peng.hao2 at zte.com.cn (Peng Hao)
Date: Fri, 13 Apr 2018 08:36:30 +0800
Subject: [PATCH] kvm: selftests: add -std=gnu99 cflags
Message-ID: <1523579790-30773-1-git-send-email-peng.hao2@zte.com.cn>

lib/kvm_util.c: In function ‘kvm_memcmp_hva_gva’:
lib/kvm_util.c:332:2: error: ‘for’ loop initial declarations are only allowed in C99 mode

So add -std=gnu99 to CFLAGS

Signed-off-by: Peng Hao <peng.hao2 at zte.com.cn>
---
 tools/testing/selftests/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index dc44de9..1da541e 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -14,7 +14,7 @@ LIBKVM += $(LIBKVM_$(UNAME_M))
 
 INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
-CFLAGS += -O2 -g -I$(LINUX_HDR_PATH) -Iinclude -I$(<D)
+CFLAGS += -O2 -g -std=gnu99 -I$(LINUX_HDR_PATH) -Iinclude -I$(<D)
 
 # After inclusion, $(OUTPUT) is defined and
 # $(TEST_GEN_PROGS) starts with $(OUTPUT)/
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
