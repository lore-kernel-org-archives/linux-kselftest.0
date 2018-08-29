From: Lei.Yang@windriver.com (Lei Yang)
Date: Wed, 29 Aug 2018 15:04:08 +0800
Subject: [PATCH]] kvm: selftests: use -pthread instead of -lpthread
Message-ID: <1535526248-3759-1-git-send-email-Lei.Yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180829070408.6SqGmTXmgWZyN8dC1iLZuxERKnGXtruufrysxDr_Yg0@z>

I run into the following error

testing/selftests/kvm/dirty_log_test.c:285: undefined reference to `pthread_create'
testing/selftests/kvm/dirty_log_test.c:297: undefined reference to `pthread_join'
collect2: error: ld returned 1 exit status

my gcc version is gcc version 4.8.4
"-pthread" would work everywhere

Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
---
 tools/testing/selftests/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 03b0f55..48c970c 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -20,7 +20,7 @@ INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
 LINUX_TOOL_INCLUDE = $(top_srcdir)tools/include
 CFLAGS += -O2 -g -std=gnu99 -I$(LINUX_TOOL_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude -I$(<D) -I..
-LDFLAGS += -lpthread
+LDFLAGS += -pthread
 
 # After inclusion, $(OUTPUT) is defined and
 # $(TEST_GEN_PROGS) starts with $(OUTPUT)/
-- 
1.9.1
