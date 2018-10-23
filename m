From: joel@jms.id.au (Joel Stanley)
Date: Tue, 23 Oct 2018 16:46:55 +1030
Subject: [PATCH 4/6] selftests: powerpc/signal: Make tests build
In-Reply-To: <20181023061657.18007-1-joel@jms.id.au>
References: <20181023061657.18007-1-joel@jms.id.au>
Message-ID: <20181023061657.18007-5-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181023061655.axJ1f7uvS4SFeeYsD9n8UV2x92WbfkKZwoZFHRRB1uc@z>

According to lib.mk, TEST_PROGS is for shell scripts. It appears we need
to define the programs as TEST_GEN_PROGS to ensure they are built.

The definition must also happen below the inclusion of lib.mk.

Signed-off-by: Joel Stanley <joel at jms.id.au>
---
 tools/testing/selftests/powerpc/signal/Makefile | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/powerpc/signal/Makefile b/tools/testing/selftests/powerpc/signal/Makefile
index d34a7c7710db..25d0973df5b3 100644
--- a/tools/testing/selftests/powerpc/signal/Makefile
+++ b/tools/testing/selftests/powerpc/signal/Makefile
@@ -1,7 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-TEST_PROGS := signal signal_tm
-
-$(TEST_PROGS): ../harness.c ../utils.c signal.S
+TEST_GEN_PROGS := signal signal_tm
 
 CFLAGS += -maltivec
 signal_tm: CFLAGS += -mhtm
@@ -9,5 +7,4 @@ signal_tm: CFLAGS += -mhtm
 top_srcdir = ../../../../..
 include ../../lib.mk
 
-clean:
-	rm -f $(TEST_PROGS) *.o
+$(TEST_GEN_PROGS): ../harness.c ../utils.c signal.S
-- 
2.19.1
