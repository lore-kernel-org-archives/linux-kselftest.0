From: anders.roxell@linaro.org (Anders Roxell)
Date: Wed, 18 Apr 2018 09:52:56 +0200
Subject: [PATCH 2/2] selftests/filesystems: remove Makefile warning
In-Reply-To: <20180418075256.300-1-anders.roxell@linaro.org>
References: <20180418075256.300-1-anders.roxell@linaro.org>
Message-ID: <20180418075256.300-2-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180418075256.yU0rwgBAw_-sIlLpRnSsZ_gOUL9T6Izr-1nP7aGKhD4@z>

When overriding the 'clean' target make throws up warnings:
Makefile:9: warning: overriding recipe for target 'clean'
../lib.mk:98: warning: ignoring old recipe for target 'clean'

In current code we change from TEST_PROGS to TEST_GEN_PROGS and that
does that we can remove the target 'clean' and 'all'.

Fixes: 10924bc64487 ("selftests: move dnotify_test from Documentation/filesystems")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/filesystems/Makefile | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tools/testing/selftests/filesystems/Makefile b/tools/testing/selftests/filesystems/Makefile
index 427a401aae5c..a55ac3ac09ad 100644
--- a/tools/testing/selftests/filesystems/Makefile
+++ b/tools/testing/selftests/filesystems/Makefile
@@ -1,9 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-TEST_PROGS := dnotify_test devpts_pts
+TEST_GEN_PROGS := dnotify_test devpts_pts
 CFLAGS += -I../../../../usr/include/
-all: $(TEST_PROGS)
 
 include ../lib.mk
-
-clean:
-	rm -fr $(TEST_PROGS)
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
