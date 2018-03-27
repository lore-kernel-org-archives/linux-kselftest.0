From: changbin.du at intel.com (changbin.du at intel.com)
Date: Tue, 27 Mar 2018 11:11:31 +0800
Subject: [PATCH v2 1/4] selftests/Makefile: append a slash to env variable
 OUTPUT
In-Reply-To: <1522120294-24926-1-git-send-email-changbin.du@intel.com>
References: <1522120294-24926-1-git-send-email-changbin.du@intel.com>
Message-ID: <1522120294-24926-2-git-send-email-changbin.du@intel.com>

From: Changbin Du <changbin.du at intel.com>

The tools/build/Makefile.build use 'OUTPUT' variable as below example:
objprefix    := $(subst ./,,$(OUTPUT)$(dir)/)

So it requires the 'OUTPUT' already has a slash at the end.

This patch can kill below odd paths:
make[3]: Entering directory '/home/changbin/work/linux/tools/gpio'
  CC       /home/changbin/work/linux/tools/testing/selftests/gpiolsgpio.o
  CC       /home/changbin/work/linux/tools/testing/selftests/gpiogpio-utils.o
  LD       /home/changbin/work/linux/tools/testing/selftests/gpiolsgpio-in.o

A correct path should be:
/home/changbin/work/linux/tools/testing/selftests/gpio/lsgpio.o

Signed-off-by: Changbin Du <changbin.du at intel.com>
---
 tools/testing/selftests/Makefile | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 7442dfb..7916aa2 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -71,31 +71,31 @@ all:
 	@for TARGET in $(TARGETS); do		\
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
 		mkdir $$BUILD_TARGET  -p;	\
-		make OUTPUT=$$BUILD_TARGET -C $$TARGET;\
+		make OUTPUT=$$BUILD_TARGET/ -C $$TARGET;\
 	done;
 
 run_tests: all
 	@for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
-		make OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests;\
+		make OUTPUT=$$BUILD_TARGET/ -C $$TARGET run_tests;\
 	done;
 
 hotplug:
 	@for TARGET in $(TARGETS_HOTPLUG); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
-		make OUTPUT=$$BUILD_TARGET -C $$TARGET;\
+		make OUTPUT=$$BUILD_TARGET/ -C $$TARGET;\
 	done;
 
 run_hotplug: hotplug
 	@for TARGET in $(TARGETS_HOTPLUG); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
-		make OUTPUT=$$BUILD_TARGET -C $$TARGET run_full_test;\
+		make OUTPUT=$$BUILD_TARGET/ -C $$TARGET run_full_test;\
 	done;
 
 clean_hotplug:
 	@for TARGET in $(TARGETS_HOTPLUG); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
-		make OUTPUT=$$BUILD_TARGET -C $$TARGET clean;\
+		make OUTPUT=$$BUILD_TARGET/ -C $$TARGET clean;\
 	done;
 
 run_pstore_crash:
@@ -111,7 +111,7 @@ ifdef INSTALL_PATH
 	mkdir -p $(INSTALL_PATH)
 	@for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
-		make OUTPUT=$$BUILD_TARGET -C $$TARGET INSTALL_PATH=$(INSTALL_PATH)/$$TARGET install; \
+		make OUTPUT=$$BUILD_TARGET/ -C $$TARGET INSTALL_PATH=$(INSTALL_PATH)/$$TARGET install; \
 	done;
 
 	@# Ask all targets to emit their test scripts
@@ -131,7 +131,7 @@ ifdef INSTALL_PATH
 		echo "echo ; echo Running tests in $$TARGET" >> $(ALL_SCRIPT); \
 		echo "echo ========================================" >> $(ALL_SCRIPT); \
 		echo "cd $$TARGET" >> $(ALL_SCRIPT); \
-		make -s --no-print-directory OUTPUT=$$BUILD_TARGET -C $$TARGET emit_tests >> $(ALL_SCRIPT); \
+		make -s --no-print-directory OUTPUT=$$BUILD_TARGET/ -C $$TARGET emit_tests >> $(ALL_SCRIPT); \
 		echo "cd \$$ROOT" >> $(ALL_SCRIPT); \
 	done;
 
@@ -143,7 +143,7 @@ endif
 clean:
 	@for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
-		make OUTPUT=$$BUILD_TARGET -C $$TARGET clean;\
+		make OUTPUT=$$BUILD_TARGET/ -C $$TARGET clean;\
 	done;
 
 .PHONY: all run_tests hotplug run_hotplug clean_hotplug run_pstore_crash install clean
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
