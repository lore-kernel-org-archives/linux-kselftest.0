From: keescook@chromium.org (Kees Cook)
Date: Wed, 24 Apr 2019 16:12:31 -0700
Subject: [PATCH v2 2/8] selftests: Use runner.sh for emit targets
In-Reply-To: <20190424231237.14776-1-keescook@chromium.org>
References: <20190424231237.14776-1-keescook@chromium.org>
Message-ID: <20190424231237.14776-3-keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424231231.WkvZPx8bG7TQVp-CMF2jjoOYgukdXh21ZqgiIk8_r18@z>

This reuses the new runner.sh for the emit targets instead of manually
running each test via run_kselftest.sh.

Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/Makefile | 11 +++++------
 tools/testing/selftests/lib.mk   | 15 ++-------------
 2 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index f2ebf8cf4686..c5f9f736cdbd 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -176,7 +176,8 @@ ALL_SCRIPT := $(INSTALL_PATH)/run_kselftest.sh
 install:
 ifdef INSTALL_PATH
 	@# Ask all targets to install their files
-	mkdir -p $(INSTALL_PATH)
+	mkdir -p $(INSTALL_PATH)/kselftest
+	install -m 744 kselftest/runner.sh $(INSTALL_PATH)/kselftest/
 	@for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
 		make OUTPUT=$$BUILD_TARGET -C $$TARGET INSTALL_PATH=$(INSTALL_PATH)/$$TARGET install; \
@@ -186,15 +187,13 @@ ifdef INSTALL_PATH
 	echo "#!/bin/sh" > $(ALL_SCRIPT)
 	echo "BASE_DIR=\$$(realpath \$$(dirname \$$0))" >> $(ALL_SCRIPT)
 	echo "cd \$$BASE_DIR" >> $(ALL_SCRIPT)
+	echo ". ./kselftest/runner.sh" >> $(ALL_SCRIPT)
 	echo "ROOT=\$$PWD" >> $(ALL_SCRIPT)
 	echo "if [ \"\$$1\" = \"--summary\" ]; then" >> $(ALL_SCRIPT)
-	echo "  OUTPUT=\$$BASE_DIR/output.log" >> $(ALL_SCRIPT)
-	echo "  cat /dev/null > \$$OUTPUT" >> $(ALL_SCRIPT)
-	echo "else" >> $(ALL_SCRIPT)
-	echo "  OUTPUT=/dev/stdout" >> $(ALL_SCRIPT)
+	echo "  logfile=\$$BASE_DIR/output.log" >> $(ALL_SCRIPT)
+	echo "  cat /dev/null > \$$logfile" >> $(ALL_SCRIPT)
 	echo "fi" >> $(ALL_SCRIPT)
 	echo "export KSFT_TAP_LEVEL=1" >> $(ALL_SCRIPT)
-	echo "export skip=4" >> $(ALL_SCRIPT)
 
 	for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 9d2b3c303bfa..6b2d026a94ea 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -116,24 +116,13 @@ else
 	$(error Error: set INSTALL_PATH to use install)
 endif
 
-define EMIT_TESTS
+emit_tests:
 	@test_num=`echo 0`;				\
 	for TEST in $(TEST_GEN_PROGS) $(TEST_CUSTOM_PROGS) $(TEST_PROGS); do \
 		BASENAME_TEST=`basename $$TEST`;	\
 		test_num=`echo $$test_num+1 | bc`;	\
-		TEST_HDR_MSG="selftests: "`basename $$PWD`:" $$BASENAME_TEST";	\
-		echo "echo $$TEST_HDR_MSG";	\
-		if [ ! -x $$TEST ]; then	\
-			echo "echo \"$$TEST_HDR_MSG: Warning: file $$BASENAME_TEST is not executable, correct this.\"";		\
-			echo "echo \"not ok 1..$$test_num $$TEST_HDR_MSG [FAIL]\""; \
-		else
-			echo "(./$$BASENAME_TEST >> \$$OUTPUT 2>&1 && echo \"ok 1..$$test_num $$TEST_HDR_MSG [PASS]\") || (if [ \$$? -eq \$$skip ]; then echo \"not ok 1..$$test_num $$TEST_HDR_MSG [SKIP]\"; else echo \"not ok 1..$$test_num $$TEST_HDR_MSG [FAIL]\"; fi;)"; \
-		fi;		\
+		echo "run_one \"$$BASENAME_TEST\" \"$$test_num\"";	\
 	done;
-endef
-
-emit_tests:
-	$(EMIT_TESTS)
 
 # define if isn't already. It is undefined in make O= case.
 ifeq ($(RM),)
-- 
2.17.1
