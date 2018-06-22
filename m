From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Fri, 22 Jun 2018 11:50:48 -0600
Subject: [PATCH] selftests: vDSO - fix to exclude x86 test on non-x86 platforms
Message-ID: <20180622175048.24237-1-shuah@kernel.org>

Fix to exclude vdso_standalone_test_x86 test from building on non-x86
platforms. In addition, fix it to use TEST_GEN_PROGS which is the right
variable to use for generated programs. TEST_PROGS is for shell scripts.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/vDSO/Makefile | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vDSO/Makefile b/tools/testing/selftests/vDSO/Makefile
index f5d7a7851e21..9e03d61f52fd 100644
--- a/tools/testing/selftests/vDSO/Makefile
+++ b/tools/testing/selftests/vDSO/Makefile
@@ -1,6 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 include ../lib.mk
 
+uname_M := $(shell uname -m 2>/dev/null || echo not)
+ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
+
+TEST_GEN_PROGS := $(OUTPUT)/vdso_test
+ifeq ($(ARCH),x86)
+TEST_GEN_PROGS += $(OUTPUT)/vdso_standalone_test_x86
+endif
+
 ifndef CROSS_COMPILE
 CFLAGS := -std=gnu99
 CFLAGS_vdso_standalone_test_x86 := -nostdlib -fno-asynchronous-unwind-tables -fno-stack-protector
@@ -8,14 +16,11 @@ ifeq ($(CONFIG_X86_32),y)
 LDLIBS += -lgcc_s
 endif
 
-TEST_PROGS := $(OUTPUT)/vdso_test $(OUTPUT)/vdso_standalone_test_x86
-
-all: $(TEST_PROGS)
+all: $(TEST_GEN_PROGS)
 $(OUTPUT)/vdso_test: parse_vdso.c vdso_test.c
 $(OUTPUT)/vdso_standalone_test_x86: vdso_standalone_test_x86.c parse_vdso.c
 	$(CC) $(CFLAGS) $(CFLAGS_vdso_standalone_test_x86) \
 		vdso_standalone_test_x86.c parse_vdso.c \
 		-o $@
 
-EXTRA_CLEAN := $(TEST_PROGS)
 endif
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
