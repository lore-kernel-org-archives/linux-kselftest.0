From: daniel.diaz at linaro.org (=?UTF-8?q?Daniel=20D=C3=ADaz?=)
Date: Wed, 21 Feb 2018 12:07:57 -0600
Subject: [PATCH] selftests/intel_pstate: Fix build rule for x86
Message-ID: <1519236493-13851-1-git-send-email-daniel.diaz@linaro.org>

Ensure that ARCH is defined and that this only builds for
x86 architectures.

It is possible to build from the root of the Linux tree, which
will define ARCH, or to run make from the selftests/ directory
itself, which has no provision for defining ARCH, so this
change is to use the current definition (if any), or to check
uname -m if undefined.

Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
---
 tools/testing/selftests/intel_pstate/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/intel_pstate/Makefile b/tools/testing/selftests/intel_pstate/Makefile
index 5a3f7d37..7340fd6 100644
--- a/tools/testing/selftests/intel_pstate/Makefile
+++ b/tools/testing/selftests/intel_pstate/Makefile
@@ -2,7 +2,10 @@
 CFLAGS := $(CFLAGS) -Wall -D_GNU_SOURCE
 LDLIBS := $(LDLIBS) -lm
 
-ifeq (,$(filter $(ARCH),x86))
+uname_M := $(shell uname -m 2>/dev/null || echo not)
+ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
+
+ifeq (x86,$(ARCH))
 TEST_GEN_FILES := msr aperf
 endif
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
