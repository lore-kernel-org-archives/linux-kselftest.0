From: zongbox@gmail.com (Zong Li)
Date: Thu, 18 Jan 2018 13:31:05 +0800
Subject: [Linux-kselftest-mirror] [PATCH v2] selftest: support run subset of
	selftests when running installed selftests
Message-ID: <1516253465-30367-1-git-send-email-zongbox@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180118053105.dA1RJARsbBPcvz-DcdOX82oiX-aF7vsf451N0IRjLBQ@z>

Simply use the first argument to specify the subset of selftests.
Use comma notation to separate multiple tests.
(e.g. ./run_kselftest.sh size,timers,...)
Default behaviour is running all selftests installed.

Each selftest be defined as function that we can run one of selftests.
The function name has underline as prefix to avoid confilct with
built-in command of shell.
(e.g. The exec is built-in command of shell)

Replace the hyphen with underline for cpu-hotplug and memory-hotplug.
Not all shell can use hyphen in function name, like sh, ash and so on.

Signed-off-by: Zong Li <zong at andestech.com>
---
 tools/testing/selftests/Makefile                        | 17 +++++++++++++----
 .../selftests/{cpu-hotplug => cpu_hotplug}/Makefile     |  2 +-
 .../selftests/{cpu-hotplug => cpu_hotplug}/config       |  0
 .../{cpu-hotplug => cpu_hotplug}/cpu-on-off-test.sh     |  0
 .../{memory-hotplug => memory_hotplug}/Makefile         |  4 ++--
 .../selftests/{memory-hotplug => memory_hotplug}/config |  0
 .../mem-on-off-test.sh                                  |  0
 7 files changed, 16 insertions(+), 7 deletions(-)
 rename tools/testing/selftests/{cpu-hotplug => cpu_hotplug}/Makefile (66%)
 rename tools/testing/selftests/{cpu-hotplug => cpu_hotplug}/config (100%)
 rename tools/testing/selftests/{cpu-hotplug => cpu_hotplug}/cpu-on-off-test.sh (100%)
 rename tools/testing/selftests/{memory-hotplug => memory_hotplug}/Makefile (55%)
 rename tools/testing/selftests/{memory-hotplug => memory_hotplug}/config (100%)
 rename tools/testing/selftests/{memory-hotplug => memory_hotplug}/mem-on-off-test.sh (100%)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index eaf599d..dc9bb6c 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -4,7 +4,7 @@ TARGETS += bpf
 TARGETS += breakpoints
 TARGETS += capabilities
 TARGETS += cpufreq
-TARGETS += cpu-hotplug
+TARGETS += cpu_hotplug
 TARGETS += efivarfs
 TARGETS += exec
 TARGETS += firmware
@@ -17,7 +17,7 @@ TARGETS += kcmp
 TARGETS += lib
 TARGETS += membarrier
 TARGETS += memfd
-TARGETS += memory-hotplug
+TARGETS += memory_hotplug
 TARGETS += mount
 TARGETS += mqueue
 TARGETS += net
@@ -43,8 +43,8 @@ TARGETS += zram
 # Run "make quicktest=1 run_tests" or
 # "make quicktest=1 kselftest" from top level Makefile
 
-TARGETS_HOTPLUG = cpu-hotplug
-TARGETS_HOTPLUG += memory-hotplug
+TARGETS_HOTPLUG = cpu_hotplug
+TARGETS_HOTPLUG += memory_hotplug
 
 # Clear LDFLAGS and MAKEFLAGS if called from main
 # Makefile to avoid test build failures when test
@@ -121,13 +121,22 @@ ifdef INSTALL_PATH
 
 	for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
+		echo "_$$TARGET()" >> $(ALL_SCRIPT); \
+		echo "{" >> $(ALL_SCRIPT); \
 		echo "echo ; echo Running tests in $$TARGET" >> $(ALL_SCRIPT); \
 		echo "echo ========================================" >> $(ALL_SCRIPT); \
 		echo "cd $$TARGET" >> $(ALL_SCRIPT); \
 		make -s --no-print-directory OUTPUT=$$BUILD_TARGET -C $$TARGET emit_tests >> $(ALL_SCRIPT); \
 		echo "cd \$$ROOT" >> $(ALL_SCRIPT); \
+		echo "}" >> $(ALL_SCRIPT); \
+		echo "" >> $(ALL_SCRIPT); \
 	done;
 
+	echo "TARGETS=\$${1:-\`ls -d */\`}" >> $(ALL_SCRIPT); \
+	echo "for TARGET in \$${TARGETS//,/ }; do" >> $(ALL_SCRIPT); \
+	echo "    _\$${TARGET%/}" >> $(ALL_SCRIPT); \
+	echo "done" >> $(ALL_SCRIPT); \
+
 	chmod u+x $(ALL_SCRIPT)
 else
 	$(error Error: set INSTALL_PATH to use install)
diff --git a/tools/testing/selftests/cpu-hotplug/Makefile b/tools/testing/selftests/cpu_hotplug/Makefile
similarity index 66%
rename from tools/testing/selftests/cpu-hotplug/Makefile
rename to tools/testing/selftests/cpu_hotplug/Makefile
index d8be047..a9c88b9 100644
--- a/tools/testing/selftests/cpu-hotplug/Makefile
+++ b/tools/testing/selftests/cpu_hotplug/Makefile
@@ -6,6 +6,6 @@ TEST_PROGS := cpu-on-off-test.sh
 include ../lib.mk
 
 run_full_test:
-	@/bin/bash ./cpu-on-off-test.sh -a || echo "cpu-hotplug selftests: [FAIL]"
+	@/bin/bash ./cpu-on-off-test.sh -a || echo "cpu_hotplug selftests: [FAIL]"
 
 clean:
diff --git a/tools/testing/selftests/cpu-hotplug/config b/tools/testing/selftests/cpu_hotplug/config
similarity index 100%
rename from tools/testing/selftests/cpu-hotplug/config
rename to tools/testing/selftests/cpu_hotplug/config
diff --git a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh b/tools/testing/selftests/cpu_hotplug/cpu-on-off-test.sh
similarity index 100%
rename from tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
rename to tools/testing/selftests/cpu_hotplug/cpu-on-off-test.sh
diff --git a/tools/testing/selftests/memory-hotplug/Makefile b/tools/testing/selftests/memory_hotplug/Makefile
similarity index 55%
rename from tools/testing/selftests/memory-hotplug/Makefile
rename to tools/testing/selftests/memory_hotplug/Makefile
index 86636d2..28fd7dc 100644
--- a/tools/testing/selftests/memory-hotplug/Makefile
+++ b/tools/testing/selftests/memory_hotplug/Makefile
@@ -4,10 +4,10 @@ all:
 include ../lib.mk
 
 TEST_PROGS := mem-on-off-test.sh
-override RUN_TESTS := ./mem-on-off-test.sh -r 2 && echo "selftests: memory-hotplug [PASS]" || echo "selftests: memory-hotplug [FAIL]"
+override RUN_TESTS := ./mem-on-off-test.sh -r 2 && echo "selftests: memory_hotplug [PASS]" || echo "selftests: memory_hotplug [FAIL]"
 override EMIT_TESTS := echo "$(RUN_TESTS)"
 
 run_full_test:
-	@/bin/bash ./mem-on-off-test.sh && echo "memory-hotplug selftests: [PASS]" || echo "memory-hotplug selftests: [FAIL]"
+	@/bin/bash ./mem-on-off-test.sh && echo "memory_hotplug selftests: [PASS]" || echo "memory_hotplug selftests: [FAIL]"
 
 clean:
diff --git a/tools/testing/selftests/memory-hotplug/config b/tools/testing/selftests/memory_hotplug/config
similarity index 100%
rename from tools/testing/selftests/memory-hotplug/config
rename to tools/testing/selftests/memory_hotplug/config
diff --git a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh b/tools/testing/selftests/memory_hotplug/mem-on-off-test.sh
similarity index 100%
rename from tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
rename to tools/testing/selftests/memory_hotplug/mem-on-off-test.sh
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
