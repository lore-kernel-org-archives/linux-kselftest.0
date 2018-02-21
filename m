From: tmricht@linux.vnet.ibm.com (Thomas Richter)
Date: Wed, 21 Feb 2018 12:21:53 +0100
Subject: [PATCH] selftests/gpio: Makefile deletes unnecessary files
Message-ID: <20180221112153.15011-1-tmricht@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180221112153.scWlNvLMBSkV3f-XoQEhHG_Qs34JzvhrMQJKPOGG_xY@z>

The Makefile in selftests/gpio deletes several files
(../gpio*) which do not exist at all in directory selftests.
Instead they are located in directory
linux/tools/gpio/ and are built when the gpio test case is
built (in case they do not already exist).
Since they are located outside the selftests tree, do not
delete them.

Signed-off-by: Thomas Richter <tmricht at linux.vnet.ibm.com>
---
 tools/testing/selftests/gpio/Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 1bbb47565c55..91a834f6af7b 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -3,11 +3,6 @@
 TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh $(BINARIES)
 BINARIES := gpio-mockup-chardev
-EXTRA_PROGS := ../gpiogpio-event-mon ../gpiogpio-hammer ../gpiolsgpio
-EXTRA_DIRS := ../gpioinclude/
-EXTRA_OBJS := ../gpiogpio-event-mon-in.o ../gpiogpio-event-mon.o
-EXTRA_OBJS += ../gpiogpio-hammer-in.o ../gpiogpio-utils.o ../gpiolsgpio-in.o
-EXTRA_OBJS += ../gpiolsgpio.o
 
 include ../lib.mk
 
@@ -15,7 +10,6 @@ all: $(BINARIES)
 
 override define CLEAN
 	$(RM) $(BINARIES) $(EXTRA_PROGS) $(EXTRA_OBJS)
-	$(RM) -r $(EXTRA_DIRS)
 endef
 
 CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
