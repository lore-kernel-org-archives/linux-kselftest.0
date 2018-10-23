From: joel@jms.id.au (Joel Stanley)
Date: Tue, 23 Oct 2018 16:46:54 +1030
Subject: [PATCH 3/6] selftests: powerpc/ptrace: Fix linking against pthread
In-Reply-To: <20181023061657.18007-1-joel@jms.id.au>
References: <20181023061657.18007-1-joel@jms.id.au>
Message-ID: <20181023061657.18007-4-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181023061654.pjC3YLRV5f_zQPhQ7HXGUM1hQRXl8S_K6aHFExMeeMU@z>

Some of the ptrace tests require -ptrace when linking:

 /usr/bin/ld: /tmp/ccH32S9w.o: in function `init_child_sync':
 core-pkey.c:(.text+0x1d64): undefined reference to `sem_init'

The targets for these tests are modfied in lib.mk to add the $(OUTPUT)
prefix. The makefile needs to specify that modifying those rules, or
else they do not match and we miss out on the extra flags.

Signed-off-by: Joel Stanley <joel at jms.id.au>
---
 tools/testing/selftests/powerpc/ptrace/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/Makefile b/tools/testing/selftests/powerpc/ptrace/Makefile
index 58de6d4a0cf4..8d3f006c98cc 100644
--- a/tools/testing/selftests/powerpc/ptrace/Makefile
+++ b/tools/testing/selftests/powerpc/ptrace/Makefile
@@ -9,7 +9,7 @@ include ../../lib.mk
 
 CFLAGS += -m64 -I../../../../../usr/include -I../tm -mhtm -fno-pie
 
-ptrace-pkey core-pkey: child.h
-ptrace-pkey core-pkey: LDLIBS += -pthread
+$(OUTPUT)/ptrace-pkey $(OUTPUT)/core-pkey: child.h
+$(OUTPUT)/ptrace-pkey $(OUTPUT)/core-pkey: LDLIBS += -pthread
 
 $(TEST_GEN_PROGS): ../harness.c ../utils.c ../lib/reg.S ptrace.h
-- 
2.19.1
