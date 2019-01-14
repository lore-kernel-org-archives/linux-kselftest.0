From: geert+renesas@glider.be (Geert Uytterhoeven)
Date: Mon, 14 Jan 2019 14:51:41 +0100
Subject: [PATCH 09/12] selftests: sparc64: Remove superfluous rules
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Message-ID: <20190114135144.26096-10-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190114135141.uY1RMnZx4FnxyEG8E9OVaI-jgbZga_7qEIhGc7b8dg4@z>

"all" and the generic %.c dependency are already handled by the included
lib.mk.

Signed-off-by: Geert Uytterhoeven <geert+renesas at glider.be>
---
 tools/testing/selftests/sparc64/drivers/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/testing/selftests/sparc64/drivers/Makefile b/tools/testing/selftests/sparc64/drivers/Makefile
index deb0df4155659ec1..174dbd675f1f8264 100644
--- a/tools/testing/selftests/sparc64/drivers/Makefile
+++ b/tools/testing/selftests/sparc64/drivers/Makefile
@@ -4,10 +4,6 @@ CFLAGS := $(CFLAGS) $(INCLUDEDIR) -Wall -O2 -g
 
 TEST_GEN_FILES := adi-test
 
-all: $(TEST_GEN_FILES)
-
-$(TEST_GEN_FILES): adi-test.c
-
 TEST_PROGS := drivers_test.sh
 
 include ../../lib.mk
-- 
2.17.1
