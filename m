From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Tue,  1 May 2018 16:54:33 -0600
Subject: [PATCH 1/7] selftests: lib.mk: cleanup RUN_TESTS define and make it
 readable
In-Reply-To: <cover.1525212671.git.shuah@kernel.org>
References: <cover.1525212671.git.shuah@kernel.org>
Message-ID:
 <00bbd3e056ada1aeebc3cd108dcb5c780ae2f76e.1525212671.git.shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180501225433.OyF1Zota-lQIXmgcTKJy47ww_tytpjAgI9jk_22_0Lk@z>

Refine RUN_TESTS define's output block for summary and non-summary code
to remove duplicate code and make it readable.

cd `dirname $$TEST` > /dev/null; and cd - > /dev/null; are moved
to common code block and indentation fixed.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/lib.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index c1b1a4dc6a96..1d2b48f2d481 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -32,11 +32,13 @@ define RUN_TESTS
 			echo "selftests: Warning: file $$BASENAME_TEST is not executable, correct this.";\
 			echo "not ok 1..$$test_num selftests: $$BASENAME_TEST [FAIL]"; \
 		else					\
-		if [ "X$(summary)" != "X" ]; then		\
-				cd `dirname $$TEST` > /dev/null; (./$$BASENAME_TEST > /tmp/$$BASENAME_TEST 2>&1 && echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") || echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]"; cd - > /dev/null;\
+			cd `dirname $$TEST` > /dev/null; \
+			if [ "X$(summary)" != "X" ]; then	\
+				(./$$BASENAME_TEST > /tmp/$$BASENAME_TEST 2>&1 && echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") || echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]";		\
 			else				\
-				cd `dirname $$TEST` > /dev/null; (./$$BASENAME_TEST && echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") || echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]"; cd - > /dev/null;\
+				(./$$BASENAME_TEST && echo "ok 1..$$test_num selftests: $$BASENAME_TEST [PASS]") || echo "not ok 1..$$test_num selftests:  $$BASENAME_TEST [FAIL]";					\
 			fi;				\
+			cd - > /dev/null;		\
 		fi;					\
 	done;
 endef
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
