From: daniel.diaz at linaro.org (=?UTF-8?q?Daniel=20D=C3=ADaz?=)
Date: Fri,  7 Sep 2018 09:34:55 -0500
Subject: [PATCH v3 2/2] selftests: gpio: Fix OUTPUT directory in Makefile
In-Reply-To: <1536330895-8391-1-git-send-email-daniel.diaz@linaro.org>
References: <1536330895-8391-1-git-send-email-daniel.diaz@linaro.org>
Message-ID: <1536330895-8391-2-git-send-email-daniel.diaz@linaro.org>

When simply running `make' from the selftests top dir, this
error shows up:

  cc -O2 -g -std=gnu99 -Wall -I../../../../usr/include/ -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/uuid    gpio-mockup-chardev.c ../../../gpio/gpio-utils.o  -lmount -o gpio-mockup-chardev
  cc: error: ../../../gpio/gpio-utils.o: No such file or directory
  <builtin>: recipe for target 'gpio-mockup-chardev' failed
  make[1]: *** [gpio-mockup-chardev] Error 1

because the output directory is set to "selftests/gpio" and
all binaries built from ../../../gpio/ end up there. In fact,
they appear as, exempli gratia:
* gpiogpio-event-mon
* gpiogpio-hammer
* gpioinclude/
* gpiolsgpio
which is wrong, as it's missing a directory separator
somewhere.

This patch sets straight the output directory when building
../../../gpio/ so that binaries don't cross paths.

Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
---
 tools/testing/selftests/gpio/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index a4a01ec8..4664842 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -7,7 +7,7 @@ TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh
 TEST_PROGS_EXTENDED := gpio-mockup-chardev
 
-GPIODIR := ../../../gpio
+GPIODIR := $(realpath ../../../gpio)
 GPIOOBJ := gpio-utils.o
 
 include ../lib.mk
@@ -16,11 +16,11 @@ all: $(TEST_PROGS_EXTENDED)
 
 override define CLEAN
 	$(RM) $(TEST_PROGS_EXTENDED)
-	$(MAKE) -C $(GPIODIR) clean
+	$(MAKE) -C $(GPIODIR) OUTPUT=$(GPIODIR)/ clean
 endef
 
 $(TEST_PROGS_EXTENDED):| khdr
 $(TEST_PROGS_EXTENDED): $(GPIODIR)/$(GPIOOBJ)
 
 $(GPIODIR)/$(GPIOOBJ):
-	$(MAKE) -C $(GPIODIR)
+	$(MAKE) OUTPUT=$(GPIODIR)/ -C $(GPIODIR)
-- 
2.7.4
