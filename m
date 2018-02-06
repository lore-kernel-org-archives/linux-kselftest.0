From: daniel.diaz@linaro.org (=?UTF-8?q?Daniel=20D=C3=ADaz?=)
Date: Tue,  6 Feb 2018 16:23:39 -0600
Subject: [Linux-kselftest-mirror] [PATCH v2] selftests: sync: missing CFLAGS
	while compiling
Message-ID: <1517955821-11511-1-git-send-email-daniel.diaz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180206222339.J6MRsC37hxcrcQq24XjWObOOF2kEwUXu9Q5AhsmTlxQ@z>

From: Anders Roxell <anders.roxell@linaro.org>

Based on patch: https://patchwork.kernel.org/patch/10042045/

arch64-linux-gnu-gcc -c sync.c -o sync/sync.o
sync.c:42:29: fatal error: linux/sync_file.h: No such file or directory
 #include <linux/sync_file.h>
                             ^
CFLAGS is not used during the compile step, so the system instead of
kernel headers are used.  Fix this by adding CFLAGS to the OBJS compile
rule.

Reported-by: Lei Yang <Lei.Yang at windriver.com>
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
---
 tools/testing/selftests/sync/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/sync/Makefile b/tools/testing/selftests/sync/Makefile
index b3c8ba3..d0121a8 100644
--- a/tools/testing/selftests/sync/Makefile
+++ b/tools/testing/selftests/sync/Makefile
@@ -30,7 +30,7 @@ $(TEST_CUSTOM_PROGS): $(TESTS) $(OBJS)
 	$(CC) -o $(TEST_CUSTOM_PROGS) $(OBJS) $(TESTS) $(CFLAGS) $(LDFLAGS)
 
 $(OBJS): $(OUTPUT)/%.o: %.c
-	$(CC) -c $^ -o $@
+	$(CC) -c $^ -o $@ $(CFLAGS)
 
 $(TESTS): $(OUTPUT)/%.o: %.c
 	$(CC) -c $^ -o $@
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
