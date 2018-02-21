From: daniel.diaz@linaro.org (=?UTF-8?q?Daniel=20D=C3=ADaz?=)
Date: Wed, 21 Feb 2018 15:52:44 -0600
Subject: [PATCH 2/2] selftests/gpio: Fix OUTPUT directory in Makefile
In-Reply-To: <1519249964-1630-1-git-send-email-daniel.diaz@linaro.org>
References: <1519249964-1630-1-git-send-email-daniel.diaz@linaro.org>
Message-ID: <1519249964-1630-2-git-send-email-daniel.diaz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180221215244.Q2-dhs56o0gwbrFG6oq1W3kdmDXDmfAyLeYMnfaBiSA@z>

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
which is wrong, as it's missing directory separator somewhere.

This patch sets straight the output directory when building
../../../gpio/ so that binaries don't cross paths.

Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
---
 tools/testing/selftests/gpio/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 6890f61..46a131a 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -7,7 +7,7 @@ TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh
 TEST_PROGS_EXTENDED := gpio-mockup-chardev
 
-GPIODIR := ../../../gpio
+GPIODIR := $(realpath ../../../gpio)
 GPIOOBJ := gpio-utils.o
 GPIOINC := gpio.h
 
@@ -15,7 +15,7 @@ all: $(GPIOINC) $(TEST_PROGS_EXTENDED)
 
 override define CLEAN
 	$(RM) $(TEST_PROGS_EXTENDED)
-	$(MAKE) -C $(GPIODIR) clean
+	$(MAKE) -C $(GPIODIR) OUTPUT=$(GPIODIR)/ clean
 endef
 
 include ../lib.mk
@@ -23,7 +23,7 @@ include ../lib.mk
 $(TEST_PROGS_EXTENDED): $(GPIODIR)/$(GPIOOBJ)
 
 $(GPIODIR)/$(GPIOOBJ):
-	$(MAKE) -C $(GPIODIR)
+	$(MAKE) OUTPUT=$(GPIODIR)/ -C $(GPIODIR)
 
 $(GPIOINC):
 	$(MAKE) -C ../../../.. headers_install
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
