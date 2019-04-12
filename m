From: shuah at kernel.org (Shuah Khan)
Date: Thu, 11 Apr 2019 19:18:23 -0600
Subject: [PATCH] selftests: livepatch use TEST_PROGS for test shell scripts
Message-ID: <20190412011823.26884-1-shuah@kernel.org>

TEST_PROGS variable is for test shell scripts and common clean target
in lib.mk doesn't touch them. TEST_GEN_PROGS are removed by it.

Fix it to use TEST_PROGS for test shell scripts and TEST_PROGS_EXTENDED
for common functions.sh.

Signed-off-by: Shuah Khan <shuah at kernel.org>
---
 tools/testing/selftests/livepatch/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
index af4aee79bebb..fd405402c3ff 100644
--- a/tools/testing/selftests/livepatch/Makefile
+++ b/tools/testing/selftests/livepatch/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-TEST_GEN_PROGS := \
+TEST_PROGS_EXTENDED := functions.sh
+TEST_PROGS := \
 	test-livepatch.sh \
 	test-callbacks.sh \
 	test-shadow-vars.sh
-- 
2.17.1
