From: changbin.du@intel.com (changbin.du@intel.com)
Date: Mon, 26 Mar 2018 17:23:26 +0800
Subject: [PATCH 2/4] selftests/gpio: fix paths in Makefile
In-Reply-To: <1522056208-4004-1-git-send-email-changbin.du@intel.com>
References: <1522056208-4004-1-git-send-email-changbin.du@intel.com>
Message-ID: <1522056208-4004-3-git-send-email-changbin.du@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180326092326.ZwF87grdFMcXmGQ3PhithosUGXbZyIjlre_CIC3rhcY@z>

From: Changbin Du <changbin.du@intel.com>

With previous improvement, the generated files from tools/gpio/ will
put into tools/testing/selftests/gpio/. Let's fix the paths in Makefile
and .gitignore.

Signed-off-by: Changbin Du <changbin.du at intel.com>
---
 tools/testing/selftests/.gitignore      |  4 ----
 tools/testing/selftests/gpio/.gitignore |  4 ++++
 tools/testing/selftests/gpio/Makefile   | 14 +++++++-------
 3 files changed, 11 insertions(+), 11 deletions(-)

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
index 1bbb475..73f0778 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -3,11 +3,11 @@
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
 
@@ -21,9 +21,9 @@ endef
 CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
 LDLIBS += -lmount -I/usr/include/libmount
 
-$(BINARIES): ../../../gpio/gpio-utils.o ../../../../usr/include/linux/gpio.h
+$(BINARIES): gpio-utils.o ../../../../usr/include/linux/gpio.h
 
-../../../gpio/gpio-utils.o:
+gpio-utils.o:
 	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
 
 ../../../../usr/include/linux/gpio.h:
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
