From: joel@jms.id.au (Joel Stanley)
Date: Tue, 23 Oct 2018 16:46:53 +1030
Subject: [PATCH 2/6] selftests: powerpc/ptrace: Remove clean rule
In-Reply-To: <20181023061657.18007-1-joel@jms.id.au>
References: <20181023061657.18007-1-joel@jms.id.au>
Message-ID: <20181023061657.18007-3-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181023061653.P_f8PUJqbFqiIAIy4tDZ1Tw64REzaJHzBySC93dM3AE@z>

When running 'make ptrace':

 make[1]: Entering directory 'tools/testing/selftests/powerpc/ptrace'
 Makefile:18: warning: overriding recipe for target 'clean'
 ../../lib.mk:137: warning: ignoring old recipe for target 'clean'

The rule is unnecessary as TEST_GEN_FILES are cleaned up by the rule in
lib.mk.

Signed-off-by: Joel Stanley <joel at jms.id.au>
---
 tools/testing/selftests/powerpc/ptrace/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/Makefile b/tools/testing/selftests/powerpc/ptrace/Makefile
index e9a3850aae86..58de6d4a0cf4 100644
--- a/tools/testing/selftests/powerpc/ptrace/Makefile
+++ b/tools/testing/selftests/powerpc/ptrace/Makefile
@@ -13,6 +13,3 @@ ptrace-pkey core-pkey: child.h
 ptrace-pkey core-pkey: LDLIBS += -pthread
 
 $(TEST_GEN_PROGS): ../harness.c ../utils.c ../lib/reg.S ptrace.h
-
-clean:
-	rm -f $(TEST_GEN_PROGS) *.o
-- 
2.19.1
