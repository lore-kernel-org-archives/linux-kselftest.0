From: geert+renesas at glider.be (Geert Uytterhoeven)
Date: Mon, 14 Jan 2019 14:51:36 +0100
Subject: [PATCH 04/12] selftests: android: ion: Fix ionmap_test dependencies
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Message-ID: <20190114135144.26096-5-geert+renesas@glider.be>

When building kselftest in a separate output directory:

    /tmp/cc44s4yX.o: In function `socket_send_fd':
    tools/testing/selftests/android/ion/ionutils.c:221: undefined reference to `sendtosocket'
    /tmp/cc44s4yX.o: In function `socket_receive_fd':
    tools/testing/selftests/android/ion/ionutils.c:243: undefined reference to `receivefromsocket'

The dependencies for the various test programs are expressed twice:
  1. Once using $(TEST_GEN_FILES), which supports building in the source
     directory only,
  2. A second time using $(OUTPUT), which supports building in either
     the source or build directory, but lacks a dependency of
     ionmap_test on ipcsocket, causing the link error above.

Fix this by:
  - Adding the missing dependency to 2,
  - Dropping superfluous rule 1.

Remove the "all" target while at it, as that is already handled by the
included lib.mk.

Fixes: ac93f7046a5371ff ("selftests: ion: Add simple test with the vgem driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas at glider.be>
---
 tools/testing/selftests/android/ion/Makefile | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tools/testing/selftests/android/ion/Makefile b/tools/testing/selftests/android/ion/Makefile
index 88cfe88e466fb0e6..ce05c5f3594bcf87 100644
--- a/tools/testing/selftests/android/ion/Makefile
+++ b/tools/testing/selftests/android/ion/Makefile
@@ -4,10 +4,6 @@ CFLAGS := $(CFLAGS) $(INCLUDEDIR) -Wall -O2 -g
 
 TEST_GEN_FILES := ionapp_export ionapp_import ionmap_test
 
-all: $(TEST_GEN_FILES)
-
-$(TEST_GEN_FILES): ipcsocket.c ionutils.c
-
 TEST_PROGS := ion_test.sh
 
 KSFT_KHDR_INSTALL := 1
@@ -16,4 +12,4 @@ include ../../lib.mk
 
 $(OUTPUT)/ionapp_export: ionapp_export.c ipcsocket.c ionutils.c
 $(OUTPUT)/ionapp_import: ionapp_import.c ipcsocket.c ionutils.c
-$(OUTPUT)/ionmap_test: ionmap_test.c ionutils.c
+$(OUTPUT)/ionmap_test: ionmap_test.c ipcsocket.c ionutils.c
-- 
2.17.1
