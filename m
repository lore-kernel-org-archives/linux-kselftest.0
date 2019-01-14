From: geert+renesas at glider.be (Geert Uytterhoeven)
Date: Mon, 14 Jan 2019 14:51:39 +0100
Subject: [PATCH 07/12] selftests: memfd: Fix build with O=
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Message-ID: <20190114135144.26096-8-geert+renesas@glider.be>

When building kselftest in a separate output directory:

    make[3]: *** No rule to make target 'common.o', needed by '/tmp/kselftest/memfd/memfd_test'.  Stop.

Fix this by explicitly listing common.o (in the output tree) in the
build targets (allowing the EXTRA_CLEAN rule to be dropped), and
updating the dependencies of the final executables.

Signed-off-by: Geert Uytterhoeven <geert+renesas at glider.be>
---
 tools/testing/selftests/memfd/Makefile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/memfd/Makefile b/tools/testing/selftests/memfd/Makefile
index 53a848109f7bbbd0..f3e988e54ec81083 100644
--- a/tools/testing/selftests/memfd/Makefile
+++ b/tools/testing/selftests/memfd/Makefile
@@ -6,7 +6,7 @@ CFLAGS += -I../../../../usr/include/
 
 TEST_GEN_PROGS := memfd_test
 TEST_PROGS := run_fuse_test.sh run_hugetlbfs_test.sh
-TEST_GEN_FILES := fuse_mnt fuse_test
+TEST_GEN_FILES := fuse_mnt fuse_test common.o
 
 fuse_mnt.o: CFLAGS += $(shell pkg-config fuse --cflags)
 
@@ -14,7 +14,5 @@ include ../lib.mk
 
 $(OUTPUT)/fuse_mnt: LDLIBS += $(shell pkg-config fuse --libs)
 
-$(OUTPUT)/memfd_test: memfd_test.c common.o
-$(OUTPUT)/fuse_test: fuse_test.c common.o
-
-EXTRA_CLEAN = common.o
+$(OUTPUT)/memfd_test: memfd_test.c $(OUTPUT)/common.o
+$(OUTPUT)/fuse_test: fuse_test.c $(OUTPUT)/common.o
-- 
2.17.1
