From: anders.roxell@linaro.org (Anders Roxell)
Date: Tue,  8 Jan 2019 10:25:25 +0100
Subject: [PATCH] selftests/networking: remove timestamping clean target
Message-ID: <20190108092525.12817-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190108092525.PhUaIJmVs6yQC6LwwnxeD8CRID4SWFDmc4_lr2v_iaw@z>

Commit cda261f421ba ("selftests: add txtimestamp kselftest") introduced
a warning:

Makefile:14: warning: overriding recipe for target 'clean'
../../lib.mk:137: warning: ignoring old recipe for target 'clean'

Theres no need for timestamping to have its own 'clean' target. The
lib.mk file's 'clean' target gets included to the timestamping Makefile
and that should be enough.

Fixes: cda261f421ba ("selftests: add txtimestamp kselftest")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
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
2.20.1
