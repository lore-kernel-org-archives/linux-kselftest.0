From: joel at jms.id.au (Joel Stanley)
Date: Tue, 23 Oct 2018 16:46:52 +1030
Subject: [PATCH 1/6] selftests: powerpc/ptrace: Make tests build
In-Reply-To: <20181023061657.18007-1-joel@jms.id.au>
References: <20181023061657.18007-1-joel@jms.id.au>
Message-ID: <20181023061657.18007-2-joel@jms.id.au>

According to lib.mk, TEST_PROGS is for shell scripts. It appears we need
to define the programs as TEST_GEN_PROGS to ensure they are built.

Signed-off-by: Joel Stanley <joel at jms.id.au>
---
 tools/testing/selftests/powerpc/ptrace/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/Makefile b/tools/testing/selftests/powerpc/ptrace/Makefile
index 6ac71b629276..e9a3850aae86 100644
--- a/tools/testing/selftests/powerpc/ptrace/Makefile
+++ b/tools/testing/selftests/powerpc/ptrace/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-TEST_PROGS := ptrace-gpr ptrace-tm-gpr ptrace-tm-spd-gpr \
+TEST_GEN_PROGS := ptrace-gpr ptrace-tm-gpr ptrace-tm-spd-gpr \
               ptrace-tar ptrace-tm-tar ptrace-tm-spd-tar ptrace-vsx ptrace-tm-vsx \
               ptrace-tm-spd-vsx ptrace-tm-spr ptrace-hwbreak ptrace-pkey core-pkey \
               perf-hwbreak ptrace-syscall
@@ -12,7 +12,7 @@ CFLAGS += -m64 -I../../../../../usr/include -I../tm -mhtm -fno-pie
 ptrace-pkey core-pkey: child.h
 ptrace-pkey core-pkey: LDLIBS += -pthread
 
-$(TEST_PROGS): ../harness.c ../utils.c ../lib/reg.S ptrace.h
+$(TEST_GEN_PROGS): ../harness.c ../utils.c ../lib/reg.S ptrace.h
 
 clean:
-	rm -f $(TEST_PROGS) *.o
+	rm -f $(TEST_GEN_PROGS) *.o
-- 
2.19.1
