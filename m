From: geert+renesas@glider.be (Geert Uytterhoeven)
Date: Mon, 14 Jan 2019 14:51:37 +0100
Subject: [PATCH 05/12] selftests: seccomp: Fix test dependencies and rules
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Message-ID: <20190114135144.26096-6-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190114135137.aCqn61Lx6A-9vEzG6ZoJ70YxkF-QP2G1sA8xBJDLXPk@z>

When building kselftest in a separate output directory, the seccomp_bpf
binary ends up in the source directory instead of in the output
directory, and the build of seccomp_benchmark fails:

    make[5]: *** No rule to make target 'seccomp_benchmark', needed by 'all'.  Stop.

Fix this by declaring both test binaries using TEST_GEN_PROGS, and using
the build support from lib.mk properly.

Fixes: 967d7ba841513910 ("selftests/seccomp: Add simple seccomp overhead benchmark")
Signed-off-by: Geert Uytterhoeven <geert+renesas at glider.be>
---
 tools/testing/selftests/seccomp/Makefile | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/seccomp/Makefile b/tools/testing/selftests/seccomp/Makefile
index fce7f4ce069251a6..c728bd7a366f78b9 100644
--- a/tools/testing/selftests/seccomp/Makefile
+++ b/tools/testing/selftests/seccomp/Makefile
@@ -1,17 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
-all:
 
-include ../lib.mk
-
-.PHONY: all clean
-
-BINARIES := seccomp_bpf seccomp_benchmark
 CFLAGS += -Wl,-no-as-needed -Wall
+LDFLAGS += -lpthread
 
-seccomp_bpf: seccomp_bpf.c ../kselftest_harness.h
-	$(CC) $(CFLAGS) $(LDFLAGS) -lpthread $< -o $@
+TEST_GEN_PROGS = seccomp_bpf seccomp_benchmark
 
-TEST_PROGS += $(BINARIES)
-EXTRA_CLEAN := $(BINARIES)
-
-all: $(BINARIES)
+include ../lib.mk
-- 
2.17.1
