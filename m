From: geert+renesas@glider.be (Geert Uytterhoeven)
Date: Mon, 14 Jan 2019 14:51:44 +0100
Subject: [PATCH/RFC 12/12] selftests: gpio: Fix building tools/gpio from
 kselftests
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Message-ID: <20190114135144.26096-13-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190114135144.kq5f8vZpCJgfMYBLLMc7bizUcvhUPdaY1FFayDM-KfI@z>

When running "make kselftests":

    make[3]: Entering directory 'tools/gpio'
    Makefile:24: tools/build/Makefile.include: No such file or directory
    make[3]: *** No rule to make target 'tools/build/Makefile.include'.  Stop.

When building kselftest in a separate output directory, the gpio tools
are still built in the source directory.

Fix this by passing the correct source and build paths to the make
subprocess.

Signed-off-by: Geert Uytterhoeven <geert+renesas at glider.be>
---
Marked RFC as there are still issues with this approach:

  - "make kselftest O=" needs:

	all: $(TEST_PROGS_EXTENDED)

    "make kselftest" needs that line to be replaced by:

	TEST_GEN_PROGS_EXTENDED := $(TEST_PROGS_EXTENDED)

    Having both lines doesn't help.

  - gpio-mockup-chardev is no longer built.
---
 tools/testing/selftests/gpio/Makefile | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 0bb80619db580af1..1eb4304fcfcbad67 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -13,20 +13,22 @@ TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh
 TEST_PROGS_EXTENDED := gpio-mockup-chardev
 
-GPIODIR := $(realpath ../../../gpio)
+GPIOSRCDIR := $(abspath $(CURDIR)/../../../gpio)
+GPIOOBJDIR := $(abspath $(OUTPUT)/../../../gpio)
 GPIOOBJ := gpio-utils.o
 
 all: $(TEST_PROGS_EXTENDED)
 
 override define CLEAN
 	$(RM) $(TEST_PROGS_EXTENDED)
-	$(MAKE) -C $(GPIODIR) OUTPUT=$(GPIODIR)/ clean
+	$(MAKE) -C $(GPIOSRCDIR) OUTPUT=$(GPIOOBJDIR)/ clean
 endef
 
 KSFT_KHDR_INSTALL := 1
 include ../lib.mk
 
-$(TEST_PROGS_EXTENDED): $(GPIODIR)/$(GPIOOBJ)
+$(TEST_PROGS_EXTENDED): $(GPIOOBJDIR)/$(GPIOOBJ)
 
-$(GPIODIR)/$(GPIOOBJ):
-	$(MAKE) OUTPUT=$(GPIODIR)/ -C $(GPIODIR)
+$(GPIOOBJDIR)/$(GPIOOBJ):
+	mkdir -p $(GPIOOBJDIR)
+	$(MAKE) OUTPUT=$(GPIOOBJDIR)/ -C $(GPIOSRCDIR)
-- 
2.17.1
