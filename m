From: anders.roxell@linaro.org (Anders Roxell)
Date: Fri,  5 Jan 2018 17:33:23 +0100
Subject: [Linux-kselftest-mirror] [PATCH] selftests: sync: missing CFLAGS
	while compiling
Message-ID: <20180105163323.22920-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180105163323.jIusZBP4GiamUwus0NGscYZVtTO-nLM7ji9cx2YLFKk@z>

Based on patch: https://patchwork.kernel.org/patch/10042045/

arch64-linux-gnu-gcc -c sync.c -o sync/sync.o
sync.c:42:29: fatal error: linux/sync_file.h: No such file or directory
 #include <linux/sync_file.h>
                             ^
CFLAGS is not used during the compile step, so the system instead of
kernel headers are used.  Fix this by using lib.mk's compile rules and
remove CFLAGS from the linking step.

Reported-by: Lei Yang <Lei.Yang at windriver.com>
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/sync/Makefile | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tools/testing/selftests/sync/Makefile b/tools/testing/selftests/sync/Makefile
index b3c8ba3cb668..58b9336d6c84 100644
--- a/tools/testing/selftests/sync/Makefile
+++ b/tools/testing/selftests/sync/Makefile
@@ -27,12 +27,6 @@ OBJS := $(patsubst %,$(OUTPUT)/%,$(OBJS))
 TESTS := $(patsubst %,$(OUTPUT)/%,$(TESTS))
 
 $(TEST_CUSTOM_PROGS): $(TESTS) $(OBJS)
-	$(CC) -o $(TEST_CUSTOM_PROGS) $(OBJS) $(TESTS) $(CFLAGS) $(LDFLAGS)
-
-$(OBJS): $(OUTPUT)/%.o: %.c
-	$(CC) -c $^ -o $@
-
-$(TESTS): $(OUTPUT)/%.o: %.c
-	$(CC) -c $^ -o $@
+	$(CC) -o $(TEST_CUSTOM_PROGS) $(OBJS) $(TESTS) $(LDFLAGS)
 
 EXTRA_CLEAN := $(TEST_CUSTOM_PROGS) $(OBJS) $(TESTS)
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
