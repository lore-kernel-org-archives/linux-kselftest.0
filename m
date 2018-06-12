From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Tue, 12 Jun 2018 17:24:03 -0600
Subject: [PATCH] selftests: sparc64: delete RUN_TESTS and EMIT_TESTS overrides
Message-ID: <20180612232403.28031-1-shuah@kernel.org>

Delete RUN_TESTS and EMIT_TESTS overrides and use common defines in
lib.mk. Common defines work just fine and there is no need to define
custom overrides.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/sparc64/Makefile | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tools/testing/selftests/sparc64/Makefile b/tools/testing/selftests/sparc64/Makefile
index 442f0ca45441..76b2206932c3 100644
--- a/tools/testing/selftests/sparc64/Makefile
+++ b/tools/testing/selftests/sparc64/Makefile
@@ -28,10 +28,6 @@ all:
 		fi \
 	done
 
-override define RUN_TESTS
-	@cd $(OUTPUT); ./run.sh
-endef
-
 override define INSTALL_RULE
 	mkdir -p $(INSTALL_PATH)
 	install -t $(INSTALL_PATH) $(TEST_PROGS) $(TEST_PROGS_EXTENDED) $(TEST_FILES)
@@ -43,10 +39,6 @@ override define INSTALL_RULE
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
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
