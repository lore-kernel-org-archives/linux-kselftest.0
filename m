From: christophe.leroy at c-s.fr (Christophe Leroy)
Date: Fri,  8 Feb 2019 15:02:55 +0000 (UTC)
Subject: [PATCH] tools/selftest/vm: allow choosing mem size and page size in
 map_hugetlb
Message-ID: <59dbb1bc305068dd0fe8e2d5a75c4213e0134549.1549638049.git.christophe.leroy@c-s.fr>

map_hugetlb maps 256Mbytes of memory with default hugepage size.

This patch allows the user to pass the size and page shift as an
argument in order to use different size and page size.

Signed-off-by: Christophe Leroy <christophe.leroy at c-s.fr>
---
 tools/testing/selftests/vm/map_hugetlb.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vm/map_hugetlb.c b/tools/testing/selftests/vm/map_hugetlb.c
index 9b777fa95f09..5a2d7b8efc40 100644
--- a/tools/testing/selftests/vm/map_hugetlb.c
+++ b/tools/testing/selftests/vm/map_hugetlb.c
@@ -23,6 +23,14 @@
 #define MAP_HUGETLB 0x40000 /* arch specific */
 #endif
 
+#ifndef MAP_HUGE_SHIFT
+#define MAP_HUGE_SHIFT 26
+#endif
+
+#ifndef MAP_HUGE_MASK
+#define MAP_HUGE_MASK 0x3f
+#endif
+
 /* Only ia64 requires this */
 #ifdef __ia64__
 #define ADDR (void *)(0x8000000000000000UL)
@@ -58,12 +66,29 @@ static int read_bytes(char *addr)
 	return 0;
 }
 
-int main(void)
+int main(int argc, char **argv)
 {
 	void *addr;
 	int ret;
+	size_t length = LENGTH;
+	int flags = FLAGS;
+	int shift = 0;
+
+	if (argc > 1)
+		length = atol(argv[1]) << 20;
+	if (argc > 2) {
+		shift = atoi(argv[2]);
+		if (shift)
+			flags |= (shift & MAP_HUGE_MASK) << MAP_HUGE_SHIFT;
+	}
+
+	if (shift)
+		printf("%u kB hugepages\n", 1 << shift);
+	else
+		printf("Default size hugepages\n");
+	printf("Mapping %lu Mbytes\n", (unsigned long)length >> 20);
 
-	addr = mmap(ADDR, LENGTH, PROTECTION, FLAGS, -1, 0);
+	addr = mmap(ADDR, length, PROTECTION, flags, -1, 0);
 	if (addr == MAP_FAILED) {
 		perror("mmap");
 		exit(1);
-- 
2.13.3
