From: deepa.kernel at gmail.com (Deepa Dinamani)
Date: Wed, 13 Feb 2019 09:09:13 -0800
Subject: [PATCH net] selftests: fix timestamping Makefile
Message-ID: <20190213170914.11991-1-deepa.kernel@gmail.com>

The clean target in the makefile conflicts with the generic
kselftests lib.mk, and fails to properly remove the compiled
test programs.

Remove the redundant rule, the TEST_GEN_FILES will be already
removed by the CLEAN macro in lib.mk.

Signed-off-by: Deepa Dinamani <deepa.kernel at gmail.com>
---

* Changes since v1: as per review comments

 tools/testing/selftests/networking/timestamping/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/networking/timestamping/Makefile b/tools/testing/selftests/networking/timestamping/Makefile
index 9050eeea5f5f..1de8bd8ccf5d 100644
--- a/tools/testing/selftests/networking/timestamping/Makefile
+++ b/tools/testing/selftests/networking/timestamping/Makefile
@@ -9,6 +9,3 @@ all: $(TEST_PROGS)
 top_srcdir = ../../../../..
 KSFT_KHDR_INSTALL := 1
 include ../../lib.mk
-
-clean:
-	rm -fr $(TEST_GEN_FILES)
-- 
2.17.1
