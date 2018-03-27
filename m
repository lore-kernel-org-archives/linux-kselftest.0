From: changbin.du at intel.com (changbin.du at intel.com)
Date: Tue, 27 Mar 2018 11:11:32 +0800
Subject: [PATCH v2 2/4] selftests/gpio: fix paths in Makefile
In-Reply-To: <1522120294-24926-1-git-send-email-changbin.du@intel.com>
References: <1522120294-24926-1-git-send-email-changbin.du@intel.com>
Message-ID: <1522120294-24926-3-git-send-email-changbin.du@intel.com>

From: Changbin Du <changbin.du at intel.com>

With previous improvement, the generated files from tools/gpio/ will
put into tools/testing/selftests/gpio/. Let's fix the paths in Makefile
and .gitignore.

Signed-off-by: Changbin Du <changbin.du at intel.com>

---
v2: fix compiling error when runing make in sub-folder.
---
 tools/testing/selftests/.gitignore      |  4 ----
 tools/testing/selftests/gpio/.gitignore |  4 ++++
 tools/testing/selftests/gpio/Makefile   | 17 +++++++++--------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/.gitignore b/tools/testing/selftests/.gitignore
index 9175035..f0600d2 100644
--- a/tools/testing/selftests/.gitignore
+++ b/tools/testing/selftests/.gitignore
@@ -1,5 +1 @@
 kselftest
-gpiogpio-event-mon
-gpiogpio-hammer
-gpioinclude/
-gpiolsgpio
diff --git a/tools/testing/selftests/gpio/.gitignore b/tools/testing/selftests/gpio/.gitignore
index 7d14f74..21e83e1 100644
--- a/tools/testing/selftests/gpio/.gitignore
+++ b/tools/testing/selftests/gpio/.gitignore
@@ -1 +1,5 @@
 gpio-mockup-chardev
+gpio-event-mon
+gpio-hammer
+include/
+lsgpio
diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 1bbb475..cb8c134 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -1,13 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 
+OUTPUT ?= $(shell pwd)
 TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh $(BINARIES)
 BINARIES := gpio-mockup-chardev
-EXTRA_PROGS := ../gpiogpio-event-mon ../gpiogpio-hammer ../gpiolsgpio
-EXTRA_DIRS := ../gpioinclude/
-EXTRA_OBJS := ../gpiogpio-event-mon-in.o ../gpiogpio-event-mon.o
-EXTRA_OBJS += ../gpiogpio-hammer-in.o ../gpiogpio-utils.o ../gpiolsgpio-in.o
-EXTRA_OBJS += ../gpiolsgpio.o
+EXTRA_PROGS := gpio-event-mon gpio-hammer lsgpio
+EXTRA_DIRS := ./include/
+EXTRA_OBJS := gpio-event-mon-in.o gpio-event-mon.o
+EXTRA_OBJS += gpio-hammer-in.o gpio-utils.o lsgpio-in.o
+EXTRA_OBJS += lsgpio.o
 
 include ../lib.mk
 
@@ -21,10 +22,10 @@ endef
 CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
 LDLIBS += -lmount -I/usr/include/libmount
 
-$(BINARIES): ../../../gpio/gpio-utils.o ../../../../usr/include/linux/gpio.h
+$(BINARIES): gpio-utils.o ../../../../usr/include/linux/gpio.h
 
-../../../gpio/gpio-utils.o:
-	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
+gpio-utils.o:
+	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) OUTPUT=$(OUTPUT)/ -C ../../../gpio
 
 ../../../../usr/include/linux/gpio.h:
 	make -C ../../../.. headers_install INSTALL_HDR_PATH=$(shell pwd)/../../../../usr/
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
