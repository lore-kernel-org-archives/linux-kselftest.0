From: ben.hutchings at codethink.co.uk (Ben Hutchings)
Date: Wed, 4 Apr 2018 22:37:13 +0200
Subject: [PATCH driver-core 1/2] test_firmware: Install all scripts
Message-ID: <20180404203712.zecit6po44qsde4c@xylophone.i.decadent.org.uk>

List all the scripts invoked by fw_run_tests.sh, so that
"make TARGETS=firmware install" keeps working.

Fixes: 29a1c00ce1df8 ("test_firmware: add simple firmware firmware test ...")
Fixes: b3cf21fae1fe0 ("test_firmware: test three firmware kernel configs ...")
Signed-off-by: Ben Hutchings <ben.hutchings at codethink.co.uk>
---
 tools/testing/selftests/firmware/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/firmware/Makefile b/tools/testing/selftests/firmware/Makefile
index 826f38d5dd19..261c81f08606 100644
--- a/tools/testing/selftests/firmware/Makefile
+++ b/tools/testing/selftests/firmware/Makefile
@@ -4,6 +4,7 @@
 all:
 
 TEST_PROGS := fw_run_tests.sh
+TEST_FILES := fw_fallback.sh fw_filesystem.sh fw_lib.sh
 
 include ../lib.mk
 
-- 
2.16.2


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
