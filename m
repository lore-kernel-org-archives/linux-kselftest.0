From: mpe at ellerman.id.au (Michael Ellerman)
Date: Tue, 10 Apr 2018 16:20:53 +1000
Subject: [PATCH] selftests/filesystems: Don't run dnotify_test by default
Message-ID: <20180410062053.8816-1-mpe@ellerman.id.au>

In commit ce290a19609d ("selftests: add devpts selftests"), the
filesystems directory was added to the top-level selftests Makefile.

That had the effect of causing the existing dnotify_test in the
filesystems directory to now be run as part of the default selftests
test-run. Unfortunately dnotify_test is actually an infinite loop.

Fix it by moving dnotify_test to TEST_GEN_PROGS_EXTENDED, which says
that it's a generated file (ie. built) but should not be run as part
of the default test suite run (it's an "extendend" test).

While we're here cleanup a few other things, devpts_pts should be in
TEST_GEN_PROGS to indicate that it's built, and with the above two
changes we no longer need a custom all or clean rule.

Fixes: ce290a19609d ("selftests: add devpts selftests")
Signed-off-by: Michael Ellerman <mpe at ellerman.id.au>
---
 tools/testing/selftests/filesystems/Makefile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/filesystems/Makefile b/tools/testing/selftests/filesystems/Makefile
index 4e6d09fb166f..5c7d7001ad37 100644
--- a/tools/testing/selftests/filesystems/Makefile
+++ b/tools/testing/selftests/filesystems/Makefile
@@ -1,8 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-TEST_PROGS := dnotify_test devpts_pts
-all: $(TEST_PROGS)
 
-include ../lib.mk
+TEST_GEN_PROGS := devpts_pts
+TEST_GEN_PROGS_EXTENDED := dnotify_test
 
-clean:
-	rm -fr $(TEST_PROGS)
+include ../lib.mk
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
