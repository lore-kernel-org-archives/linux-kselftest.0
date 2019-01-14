From: geert+renesas@glider.be (Geert Uytterhoeven)
Date: Mon, 14 Jan 2019 14:51:38 +0100
Subject: [PATCH 06/12] selftests: lib.mk: Add rule to build object file from C
 source file
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Message-ID: <20190114135144.26096-7-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190114135138.Q9Ls61Ogsn-kEFVuEZ10yr33ZqRBhEBlTT9utleUH5g@z>

Currently there are rules to compile and link one or more C or
assembler source files into a full executable, and to assemble a single
assembler source into an object file.

Add a generic rule to compile a single C source file into an object
file, for reuse of object files in multiple executables.

Signed-off-by: Geert Uytterhoeven <geert+renesas at glider.be>
---
 tools/testing/selftests/lib.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 8b0f16409ed7eb53..77a71264d8c5a743 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -141,6 +141,7 @@ clean:
 #
 ifneq ($(KBUILD_SRC),)
 LINK.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
+COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
 COMPILE.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
 LINK.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
 endif
@@ -151,6 +152,9 @@ ifeq ($(OVERRIDE_TARGETS),)
 $(OUTPUT)/%:%.c
 	$(LINK.c) $^ $(LDLIBS) -o $@
 
+$(OUTPUT)/%.o:%.c
+	$(COMPILE.c) $^ -o $@
+
 $(OUTPUT)/%.o:%.S
 	$(COMPILE.S) $^ -o $@
 
-- 
2.17.1
