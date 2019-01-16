From: daniel.diaz at linaro.org (=?UTF-8?q?Daniel=20D=C3=ADaz?=)
Date: Wed, 16 Jan 2019 11:43:17 -0600
Subject: [PATCH 1/4] selftests: lib: allow to override CC in the top-level
 Makefile
Message-ID: <20190116174320.14938-1-daniel.diaz@linaro.org>

From: Fathi Boudra <fathi.boudra at linaro.org>

Relax CC assignment to allow to override CC in the top-level Makefile.

Signed-off-by: Denys Dmytriyenko <denys at ti.com>
---
 tools/testing/selftests/lib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 8b0f16409ed7..0f9c47eaaa6f 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -1,6 +1,6 @@
 # This mimics the top-level Makefile. We do it explicitly here so that this
 # Makefile can operate with or without the kbuild infrastructure.
-CC := $(CROSS_COMPILE)gcc
+CC ?= $(CROSS_COMPILE)gcc
 
 ifeq (0,$(MAKELEVEL))
 OUTPUT := $(shell pwd)
-- 
2.17.1
