From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Thu,  1 Mar 2018 13:19:07 -0700
Subject: [PATCH v2] selftests: futex Makefile add top level TAP header echo to
 RUN_TESTS
Message-ID: <20180301201907.17573-1-shuahkh@osg.samsung.com>

Add top level TAP header echo, testname and separator line to make
the output consistent with the common run_tests target.

This change prevents nested TAP13 headers output from individual tests.
Nested TAP13 headers could cause problems for some parsers.

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
Changes since v1:
- Add export KSFT_TAP_LEVEL to fix nested TAP header problem
  for "make -C" usecase
- Update commit log with details on nested TAP headers.

 tools/testing/selftests/futex/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/futex/Makefile b/tools/testing/selftests/futex/Makefile
index cea4adcd42b8..3006febb59fe 100644
--- a/tools/testing/selftests/futex/Makefile
+++ b/tools/testing/selftests/futex/Makefile
@@ -18,6 +18,10 @@ all:
 	done
 
 override define RUN_TESTS
+	@export KSFT_TAP_LEVEL=`echo 1`;
+	@echo "TAP version 13";
+	@echo "selftests: futex";
+	@echo "========================================";
 	@cd $(OUTPUT); ./run.sh
 endef
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
