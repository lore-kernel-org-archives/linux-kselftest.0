From: zongbox@gmail.com (Zong Li)
Date: Thu, 22 Feb 2018 20:53:00 +0800
Subject: [PATCH] selftest: support running subset of selftests for
 run_kselftest.sh
Message-ID: <20180222125300.15681-1-zongbox@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180222125300.9_BYzI8RzvN19byP7DY-1wFGx3viUx-B5CPF4alH6E4@z>

Simply use the first argument to specify the subset of selftests.
Use comma notation to separate multiple tests.
(e.g. ./run_kselftest.sh size,timers,...)
Default behaviour is running all selftests.

Each selftest be defined as function that we can run one of selftests.
The function name has underline as prefix to avoid confilct with
built-in command of shell.
(e.g. The exec is built-in command of shell)
The hyhpen of function name be replace to the underline because
not all shells can use hyphen in function name, like sh, ash and so on.

Signed-off-by: Zong Li <zong at andestech.com>
Cc: Greentime Hu <greentime at andestech.com>
Cc: Shuah Khan <shuah at kernel.org>
---
 tools/testing/selftests/Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 7442dfb73b7f..08e2a855f187 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -128,13 +128,22 @@ ifdef INSTALL_PATH
 
 	for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
+		echo "_$${TARGET//-/_}()" >> $(ALL_SCRIPT); \
+		echo "{" >> $(ALL_SCRIPT); \
 		echo "echo ; echo Running tests in $$TARGET" >> $(ALL_SCRIPT); \
 		echo "echo ========================================" >> $(ALL_SCRIPT); \
 		echo "cd $$TARGET" >> $(ALL_SCRIPT); \
 		make -s --no-print-directory OUTPUT=$$BUILD_TARGET -C $$TARGET emit_tests >> $(ALL_SCRIPT); \
 		echo "cd \$$ROOT" >> $(ALL_SCRIPT); \
+		echo "}" >> $(ALL_SCRIPT); \
+		echo "" >> $(ALL_SCRIPT); \
 	done;
 
+	echo "TARGETS=\$${1:-\`ls -d */ | sed 's#/##' \`}" >> $(ALL_SCRIPT);
+	echo "for TARGET in \$${TARGETS//,/ }; do" >> $(ALL_SCRIPT);
+	echo "    _\$${TARGET//-/_}" >> $(ALL_SCRIPT);
+	echo "done" >> $(ALL_SCRIPT);
+
 	chmod u+x $(ALL_SCRIPT)
 else
 	$(error Error: set INSTALL_PATH to use install)
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
