From: mpe at ellerman.id.au (Michael Ellerman)
Date: Tue, 16 Jan 2018 17:10:39 +1100
Subject: [Linux-kselftest-mirror] [PATCH] selftests: Fix loss of test output
	in run_kselftests.sh
Message-ID: <20180116061039.16713-1-mpe@ellerman.id.au>

Commit fbcab13d2e25 ("selftests: silence test output by default")
changed the run_tests logic as well as the logic to generate
run_kselftests.sh to redirect test output away from the console.

As discussed on the list and at kernel summit, this is not a desirable
default as it means in order to debug a failure the console output is
not sufficient, you also need access to the test machine to get the
full test logs. Additionally it's impolite to write directly to
/tmp/$TEST_NAME on shared systems.

The change to the run_tests logic was reverted in commit
a323335e62cc ("selftests: lib.mk: print individual test results to
console by default"), and instead a summary option was added so that
quiet output could be requested.

However the change to run_kselftests.sh was left as-is.

This commit applies the same logic to the run_kselftests.sh code, ie.
the script now takes a "--summary" option which suppresses the output,
but shows all output by default.

Additionally instead of writing to /tmp/$TEST_NAME the output is
redirected to the directory where the generated test script is
located.

Fixes: fbcab13d2e25 ("selftests: silence test output by default")
Signed-off-by: Michael Ellerman <mpe at ellerman.id.au>
---
 tools/testing/selftests/Makefile | 9 ++++++++-
 tools/testing/selftests/lib.mk   | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index eaf599dc2137..7442dfb73b7f 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -116,8 +116,15 @@ ifdef INSTALL_PATH
 
 	@# Ask all targets to emit their test scripts
 	echo "#!/bin/sh" > $(ALL_SCRIPT)
-	echo "cd \$$(dirname \$$0)" >> $(ALL_SCRIPT)
+	echo "BASE_DIR=\$$(realpath \$$(dirname \$$0))" >> $(ALL_SCRIPT)
+	echo "cd \$$BASE_DIR" >> $(ALL_SCRIPT)
 	echo "ROOT=\$$PWD" >> $(ALL_SCRIPT)
+	echo "if [ \"\$$1\" = \"--summary\" ]; then" >> $(ALL_SCRIPT)
+	echo "  OUTPUT=\$$BASE_DIR/output.log" >> $(ALL_SCRIPT)
+	echo "  cat /dev/null > \$$OUTPUT" >> $(ALL_SCRIPT)
+	echo "else" >> $(ALL_SCRIPT)
+	echo "  OUTPUT=/dev/stdout" >> $(ALL_SCRIPT)
+	echo "fi" >> $(ALL_SCRIPT)
 
 	for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 5bef05d6ba39..7de482a0519d 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -77,7 +77,7 @@ endif
 define EMIT_TESTS
 	@for TEST in $(TEST_GEN_PROGS) $(TEST_CUSTOM_PROGS) $(TEST_PROGS); do \
 		BASENAME_TEST=`basename $$TEST`;	\
-		echo "(./$$BASENAME_TEST > /tmp/$$BASENAME_TEST 2>&1 && echo \"selftests: $$BASENAME_TEST [PASS]\") || echo \"selftests: $$BASENAME_TEST [FAIL]\""; \
+		echo "(./$$BASENAME_TEST >> \$$OUTPUT 2>&1 && echo \"selftests: $$BASENAME_TEST [PASS]\") || echo \"selftests: $$BASENAME_TEST [FAIL]\""; \
 	done;
 endef
 
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
