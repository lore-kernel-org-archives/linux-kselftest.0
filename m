From: skhan at linuxfoundation.org (Shuah Khan)
Date: Tue, 14 May 2019 16:42:22 -0600
Subject: [PATCH] selftests: avoid KBUILD_OUTPUT dir cluttering with selftest
 objects
Message-ID: <20190514224222.31310-1-skhan@linuxfoundation.org>

Running "make kselftest" or building selftests when KBUILD_OUTPUT
is set, will create selftest objects in the KBUILD_OUTPUT directory.
This could be undesirable especially when user didn't intend to
relocate selftest objects.

Use KBUILD_OUTPUT/kselftest to create selftest objects instead of
cluttering the main directory.

Signed-off-by: Shuah Khan <skhan at linuxfoundation.org>
---
 tools/testing/selftests/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index c71a63b923d4..9781ca79794a 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -71,6 +71,9 @@ override LDFLAGS =
 override MAKEFLAGS =
 endif
 
+# Append kselftest to KBUILD_OUTPUT to avoid cluttering
+# KBUILD_OUTPUT with selftest objects and headers installed
+# by selftests Makefile or lib.mk.
 ifneq ($(KBUILD_SRC),)
 override LDFLAGS =
 endif
@@ -79,7 +82,7 @@ ifneq ($(O),)
 	BUILD := $(O)
 else
 	ifneq ($(KBUILD_OUTPUT),)
-		BUILD := $(KBUILD_OUTPUT)
+		BUILD := $(KBUILD_OUTPUT)/kselftest
 	else
 		BUILD := $(shell pwd)
 		DEFAULT_INSTALL_HDR_PATH := 1
-- 
2.17.1
