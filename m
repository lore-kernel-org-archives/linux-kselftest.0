From: joel at jms.id.au (Joel Stanley)
Date: Tue, 23 Oct 2018 16:46:56 +1030
Subject: [PATCH 5/6] selftests: powerpc/signal: Fix signal_tm CFLAGS
In-Reply-To: <20181023061657.18007-1-joel@jms.id.au>
References: <20181023061657.18007-1-joel@jms.id.au>
Message-ID: <20181023061657.18007-6-joel@jms.id.au>

signal_tm tries to build with -mhtm but it currently does not.

The targets is modified in lib.mk to add the $(OUTPUT) prefix. The
makefile needs to specify that modifying the rules, or else it does
not match and we miss out on the extra flag.

Signed-off-by: Joel Stanley <joel at jms.id.au>
---
 tools/testing/selftests/powerpc/signal/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/signal/Makefile b/tools/testing/selftests/powerpc/signal/Makefile
index 25d0973df5b3..209a958dca12 100644
--- a/tools/testing/selftests/powerpc/signal/Makefile
+++ b/tools/testing/selftests/powerpc/signal/Makefile
@@ -2,7 +2,7 @@
 TEST_GEN_PROGS := signal signal_tm
 
 CFLAGS += -maltivec
-signal_tm: CFLAGS += -mhtm
+$(OUTPUT)/signal_tm: CFLAGS += -mhtm
 
 top_srcdir = ../../../../..
 include ../../lib.mk
-- 
2.19.1
