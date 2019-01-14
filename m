From: geert+renesas at glider.be (Geert Uytterhoeven)
Date: Mon, 14 Jan 2019 14:51:40 +0100
Subject: [PATCH 08/12] selftests: timestamping: Remove superfluous rules
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Message-ID: <20190114135144.26096-9-geert+renesas@glider.be>

    Makefile:14: warning: overriding recipe for target 'clean'
    ../../lib.mk:137: warning: ignoring old recipe for target 'clean'

"all" and "clean" are already handled by the included lib.mk.

Signed-off-by: Geert Uytterhoeven <geert+renesas at glider.be>
---
 tools/testing/selftests/networking/timestamping/Makefile | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tools/testing/selftests/networking/timestamping/Makefile b/tools/testing/selftests/networking/timestamping/Makefile
index 9050eeea5f5f2953..49ede79660c0208d 100644
--- a/tools/testing/selftests/networking/timestamping/Makefile
+++ b/tools/testing/selftests/networking/timestamping/Makefile
@@ -4,11 +4,6 @@ CFLAGS += -I../../../../../usr/include
 TEST_GEN_FILES := hwtstamp_config rxtimestamp timestamping txtimestamp
 TEST_PROGS := txtimestamp.sh
 
-all: $(TEST_PROGS)
-
 top_srcdir = ../../../../..
 KSFT_KHDR_INSTALL := 1
 include ../../lib.mk
-
-clean:
-	rm -fr $(TEST_GEN_FILES)
-- 
2.17.1
