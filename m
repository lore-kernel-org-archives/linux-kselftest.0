From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Fri, 23 Feb 2018 15:11:37 -0700
Subject: [PATCH 2/5] selftests: lib.mk set KSFT_TAP_LEVEL to prevent nested
 TAP headers
In-Reply-To: <cover.1519423340.git.shuahkh@osg.samsung.com>
References: <cover.1519423340.git.shuahkh@osg.samsung.com>
Message-ID:
 <92e48a739971361073bcb49db549cdd5d13370fa.1519423340.git.shuahkh@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180223221137.vleKNo0RZ-GiQpxUGLgHo5JYBrSyDXi0V1_W9-DOEQs@z>

Set KSFT_TAP_LEVEL before running tests to prevent nested TAP header
printing from tests.

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
 tools/testing/selftests/lib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 7de482a0519d..195e9d4739a9 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -20,6 +20,7 @@ all: $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES)
 
 .ONESHELL:
 define RUN_TESTS
+	@export KSFT_TAP_LEVEL=`echo 1`;
 	@test_num=`echo 0`;
 	@echo "TAP version 13";
 	@for TEST in $(1); do				\
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
