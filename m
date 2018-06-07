From: anders.roxell at linaro.org (Anders Roxell)
Date: Thu,  7 Jun 2018 12:57:12 +0200
Subject: [PATCH] selftests: bpf: fix urandom_read build issue
Message-ID: <20180607105712.553-1-anders.roxell@linaro.org>

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
---
 tools/testing/selftests/bpf/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 607ed8729c06..67285591ffd7 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -16,10 +16,8 @@ LDLIBS += -lcap -lelf -lrt -lpthread
 TEST_CUSTOM_PROGS = $(OUTPUT)/urandom_read
 all: $(TEST_CUSTOM_PROGS)
 
-$(TEST_CUSTOM_PROGS): urandom_read
-
-urandom_read: urandom_read.c
-	$(CC) -o $(TEST_CUSTOM_PROGS) -static $< -Wl,--build-id
+$(TEST_CUSTOM_PROGS): $(OUTPUT)/%: %.c
+	$(CC) -o $@ -static $< -Wl,--build-id
 
 # Order correspond to 'make run_tests' order
 TEST_GEN_PROGS = test_verifier test_tag test_maps test_lru_map test_lpm_map test_progs \
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
