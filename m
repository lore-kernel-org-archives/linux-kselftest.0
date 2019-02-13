From: deepa.kernel@gmail.com (Deepa Dinamani)
Date: Tue, 12 Feb 2019 19:29:32 -0800
Subject: [PATCH 1/1] selftests: fix timestamping Makefile
Message-ID: <20190213032932.2805-1-deepa.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190213032932.RDXY84OVLIqoM1srpr1SobSoF2cWpiBwpWOZ4vjzZig@z>

The clean target in the makefile conflicts with the generic
kselftests lib.mk, and fails to properly remove the compiled
test programs.

Use TEST_GEN_PROGS macro to fit with lib.mk rules and
remove the conflicting and redundant clean.

Signed-off-by: Deepa Dinamani <deepa.kernel at gmail.com>
---
 tools/testing/selftests/networking/timestamping/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/networking/timestamping/Makefile b/tools/testing/selftests/networking/timestamping/Makefile
index 9050eeea5f5f..16ab85ba6409 100644
--- a/tools/testing/selftests/networking/timestamping/Makefile
+++ b/tools/testing/selftests/networking/timestamping/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS += -I../../../../../usr/include
 
-TEST_GEN_FILES := hwtstamp_config rxtimestamp timestamping txtimestamp
+TEST_GEN_PROGS := hwtstamp_config rxtimestamp timestamping txtimestamp
 TEST_PROGS := txtimestamp.sh
 
 all: $(TEST_PROGS)
@@ -9,6 +9,3 @@ all: $(TEST_PROGS)
 top_srcdir = ../../../../..
 KSFT_KHDR_INSTALL := 1
 include ../../lib.mk
-
-clean:
-	rm -fr $(TEST_GEN_FILES)
-- 
2.17.1
