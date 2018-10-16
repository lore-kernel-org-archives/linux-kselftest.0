From: andrea.parri@amarulasolutions.com (Andrea Parri)
Date: Tue, 16 Oct 2018 16:13:46 +0200
Subject: [PATCH] selftests: kvm: Fix -Wformat warnings
Message-ID: <20181016141346.19922-1-andrea.parri@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181016141346.Isg9Gq5_lNCIA8B4_gEhTfj_sJEiVlIYPbT0kCgVE5E@z>

Fixes the following warnings:

dirty_log_test.c: In function ‘help’:
dirty_log_test.c:216:9: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 2 has type ‘int’ [-Wformat=]
  printf(" -i: specify iteration counts (default: %"PRIu64")\n",
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/test_util.h:18:0,
                 from dirty_log_test.c:16:
/usr/include/inttypes.h:105:34: note: format string is defined here
 # define PRIu64  __PRI64_PREFIX "u"
dirty_log_test.c:218:9: warning: format ‘%lu’ expects argument of type ‘long unsigned int’, but argument 2 has type ‘int’ [-Wformat=]
  printf(" -I: specify interval in ms (default: %"PRIu64" ms)\n",
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/test_util.h:18:0,
                 from dirty_log_test.c:16:
/usr/include/inttypes.h:105:34: note: format string is defined here
 # define PRIu64  __PRI64_PREFIX "u"

Signed-off-by: Andrea Parri <andrea.parri at amarulasolutions.com>
---
 tools/testing/selftests/kvm/dirty_log_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
index 0c2cdc105f968..a9c4b5e21d7e7 100644
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@ -31,9 +31,9 @@
 /* How many pages to dirty for each guest loop */
 #define  TEST_PAGES_PER_LOOP            1024
 /* How many host loops to run (one KVM_GET_DIRTY_LOG for each loop) */
-#define  TEST_HOST_LOOP_N               32
+#define  TEST_HOST_LOOP_N               32UL
 /* Interval for each host loop (ms) */
-#define  TEST_HOST_LOOP_INTERVAL        10
+#define  TEST_HOST_LOOP_INTERVAL        10UL
 
 /*
  * Guest variables.  We use these variables to share data between host
-- 
2.17.1
