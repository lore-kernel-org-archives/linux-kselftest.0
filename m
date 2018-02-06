From: daniel.diaz@linaro.org (=?UTF-8?q?Daniel=20D=C3=ADaz?=)
Date: Tue,  6 Feb 2018 16:22:57 -0600
Subject: [Linux-kselftest-mirror] [PATCH] selftests/memfd: add
	run_fuse_test.sh to TEST_FILES
Message-ID: <1517955779-11386-1-git-send-email-daniel.diaz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180206222257.I7Ik9MiqKpJYEa8uhgXP_Bnj10XwPbUkN1MA-4B-pJ0@z>

From: Anders Roxell <anders.roxell@linaro.org>

While testing memfd tests, there is a missing script, as reported by
kselftest:

./run_tests.sh: line 7: ./run_fuse_test.sh: No such file or directory

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
---
 tools/testing/selftests/memfd/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/memfd/Makefile b/tools/testing/selftests/memfd/Makefile
index a5276a9..0862e6f 100644
--- a/tools/testing/selftests/memfd/Makefile
+++ b/tools/testing/selftests/memfd/Makefile
@@ -5,6 +5,7 @@ CFLAGS += -I../../../../include/
 CFLAGS += -I../../../../usr/include/
 
 TEST_PROGS := run_tests.sh
+TEST_FILES := run_fuse_test.sh
 TEST_GEN_FILES := memfd_test fuse_mnt fuse_test
 
 fuse_mnt.o: CFLAGS += $(shell pkg-config fuse --cflags)
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
