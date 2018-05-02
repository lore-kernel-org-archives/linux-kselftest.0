From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Wed,  2 May 2018 15:18:45 -0600
Subject: [PATCH] selftests: futex: delete RUN_TESTS and EMIT_TESTS overrides
In-Reply-To: <20180502211848.22404-1-shuah@kernel.org>
References: <20180502211848.22404-1-shuah@kernel.org>
Message-ID: <20180502211848.22404-2-shuah@kernel.org>

Delete RUN_TESTS and EMIT_TESTS overrides and use common defines in
lib.mk. Common defines work just fine and there is no need to define
custom overrides.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/futex/Makefile | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/tools/testing/selftests/futex/Makefile b/tools/testing/selftests/futex/Makefile
index 8497a376ef9d..12631f0076a1 100644
--- a/tools/testing/selftests/futex/Makefile
+++ b/tools/testing/selftests/futex/Makefile
@@ -17,14 +17,6 @@ all:
 		fi \
 	done
 
-override define RUN_TESTS
-	@export KSFT_TAP_LEVEL=`echo 1`;
-	@echo "TAP version 13";
-	@echo "selftests: futex";
-	@echo "========================================";
-	@cd $(OUTPUT); ./run.sh
-endef
-
 override define INSTALL_RULE
 	mkdir -p $(INSTALL_PATH)
 	install -t $(INSTALL_PATH) $(TEST_PROGS) $(TEST_PROGS_EXTENDED) $(TEST_FILES)
@@ -36,10 +28,6 @@ override define INSTALL_RULE
 	done;
 endef
 
-override define EMIT_TESTS
-	echo "./run.sh"
-endef
-
 override define CLEAN
 	@for DIR in $(SUBDIRS); do		\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;	\
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
