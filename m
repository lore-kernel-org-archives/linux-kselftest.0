From: anders.roxell@linaro.org (Anders Roxell)
Date: Fri,  8 Jun 2018 08:51:27 +0200
Subject: [PATCH v2] selftests: bpf: fix urandom_read build issue
In-Reply-To: <CADYN=9JEi2=YcC0KD555atZFiJNbP8Y9O0UME+63iTpSSd=ttg@mail.gmail.com>
References: <CADYN=9JEi2=YcC0KD555atZFiJNbP8Y9O0UME+63iTpSSd=ttg@mail.gmail.com>
Message-ID: <20180608065127.28115-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180608065127.oLdzH99Ftd6mcPrIrpvB_g6-Zz3r0OvC7MfOL9p2ssA@z>

gcc complains that urandom_read gets built twice.

gcc -o tools/testing/selftests/bpf/urandom_read
-static urandom_read.c -Wl,--build-id
gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf
-I../../../../include/generated  -I../../../include    urandom_read.c
urandom_read -lcap -lelf -lrt -lpthread -o
tools/testing/selftests/bpf/urandom_read
gcc: fatal error: input file
‘tools/testing/selftests/bpf/urandom_read’ is the
same as output file
compilation terminated.
../lib.mk:110: recipe for target
'tools/testing/selftests/bpf/urandom_read' failed
To fix this issue remove the urandom_read target and so target
TEST_CUSTOM_PROGS gets used.

Fixes: 81f77fd0deeb ("bpf: add selftest for stackmap with BPF_F_STACK_BUILD_ID")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
Acked-by: Yonghong Song <yhs at fb.com>
---
 tools/testing/selftests/bpf/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 607ed8729c06..7a6214e9ae58 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -16,9 +16,7 @@ LDLIBS += -lcap -lelf -lrt -lpthread
 TEST_CUSTOM_PROGS = $(OUTPUT)/urandom_read
 all: $(TEST_CUSTOM_PROGS)
 
-$(TEST_CUSTOM_PROGS): urandom_read
-
-urandom_read: urandom_read.c
+$(TEST_CUSTOM_PROGS): $(OUTPUT)/%: %.c
 	$(CC) -o $(TEST_CUSTOM_PROGS) -static $< -Wl,--build-id
 
 # Order correspond to 'make run_tests' order
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
