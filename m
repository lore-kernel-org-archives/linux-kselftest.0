From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Thu, 11 Jan 2018 10:39:42 -0700
Subject: [Linux-kselftest-mirror] [PATCH] selftests: media_tests: Fix
	Makefile 'clean' target warning
Message-ID: <20180111173942.20658-1-shuahkh@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180111173942.nyEZp7p0D9sstZXSq19HmmT-VJj2FP_1SYjk1o_I08I@z>

Remove 'clean' target and change TEST_PROGS to TEST_GEN_PROGS so the
common lib.mk 'clean' target clean these generated files. TEST_PROGS
is for shell scripts and not for generated test executables.

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
 tools/testing/selftests/media_tests/Makefile | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/media_tests/Makefile b/tools/testing/selftests/media_tests/Makefile
index be5bd4ffb895..c82cec2497de 100644
--- a/tools/testing/selftests/media_tests/Makefile
+++ b/tools/testing/selftests/media_tests/Makefile
@@ -1,8 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-TEST_PROGS := media_device_test media_device_open video_device_test
-all: $(TEST_PROGS)
+TEST_GEN_PROGS := media_device_test media_device_open video_device_test
+all: $(TEST_GEN_PROGS)
 
 include ../lib.mk
-
-clean:
-	rm -fr media_device_test media_device_open video_device_test
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
