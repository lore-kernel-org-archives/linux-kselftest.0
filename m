From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Tue,  1 May 2018 16:54:38 -0600
Subject: [PATCH 6/7] selftests: lib.mk: add test execute bit check to
 EMIT_TESTS
In-Reply-To: <cover.1525212671.git.shuah@kernel.org>
References: <cover.1525212671.git.shuah@kernel.org>
Message-ID: <ff755cbe7a3d62e729e62f57880df94f25bad5dd.1525212671.git.shuah@kernel.org>

Similar to what RUN_TESTS does, change EMIT_TESTS to check for execute
bit and emit code to print warnings if test isn't executable to the
the run_kselftest.sh.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/lib.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 0c6012500026..6466294366dc 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -100,7 +100,12 @@ define EMIT_TESTS
 		test_num=`echo $$test_num+1 | bc`;	\
 		TEST_HDR_MSG="selftests: "`basename $$PWD`:" $$BASENAME_TEST";	\
 		echo "echo $$TEST_HDR_MSG";	\
-		echo "(./$$BASENAME_TEST >> \$$OUTPUT 2>&1 && echo \"ok 1..$$test_num $$TEST_HDR_MSG [PASS]\") || (if [ \$$? -eq \$$skip ]; then echo \"not ok 1..$$test_num $$TEST_HDR_MSG [SKIP]\"; else echo \"not ok 1..$$test_num $$TEST_HDR_MSG [FAIL]\"; fi;)"; \
+		if [ ! -x $$TEST ]; then	\
+			echo "echo \"$$TEST_HDR_MSG: Warning: file $$BASENAME_TEST is not executable, correct this.\"";		\
+			echo "echo \"not ok 1..$$test_num $$TEST_HDR_MSG [FAIL]\""; \
+		else
+			echo "(./$$BASENAME_TEST >> \$$OUTPUT 2>&1 && echo \"ok 1..$$test_num $$TEST_HDR_MSG [PASS]\") || (if [ \$$? -eq \$$skip ]; then echo \"not ok 1..$$test_num $$TEST_HDR_MSG [SKIP]\"; else echo \"not ok 1..$$test_num $$TEST_HDR_MSG [FAIL]\"; fi;)"; \
+		fi;		\
 	done;
 endef
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
