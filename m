From: skhan at linuxfoundation.org (Shuah Khan)
Date: Fri, 10 May 2019 20:52:49 -0600
Subject: [PATCH] selftests: fix bpf build/test workflow regression when
 KBUILD_OUTPUT is set
Message-ID: <20190511025249.32678-1-skhan@linuxfoundation.org>

commit 8ce72dc32578 ("selftests: fix headers_install circular dependency")
broke bpf build/test workflow. When KBUILD_OUTPUT is set, bpf objects end
up in KBUILD_OUTPUT build directory instead of in ../selftests/bpf.

The following bpf workflow breaks when it can't find the test_verifier:

cd tools/testing/selftests/bpf; make; ./test_verifier;

Fix it to set OUTPUT only when it is undefined in lib.mk. It didn't need
to be set in the first place.

Fixes: commit 8ce72dc32578 ("selftests: fix headers_install circular dependency")

Reported-by: Alexei Starovoitov <alexei.starovoitov at gmail.com>
Signed-off-by: Shuah Khan <skhan at linuxfoundation.org>
---
 tools/testing/selftests/lib.mk | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 098dd0065fb1..077337195783 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -3,15 +3,9 @@
 CC := $(CROSS_COMPILE)gcc
 
 ifeq (0,$(MAKELEVEL))
-    ifneq ($(O),)
-	OUTPUT := $(O)
-    else
-	ifneq ($(KBUILD_OUTPUT),)
-		OUTPUT := $(KBUILD_OUTPUT)
-	else
-		OUTPUT := $(shell pwd)
-		DEFAULT_INSTALL_HDR_PATH := 1
-	endif
+    ifeq ($(OUTPUT),)
+	OUTPUT := $(shell pwd)
+	DEFAULT_INSTALL_HDR_PATH := 1
     endif
 endif
 selfdir = $(realpath $(dir $(filter %/lib.mk,$(MAKEFILE_LIST))))
-- 
2.17.1
