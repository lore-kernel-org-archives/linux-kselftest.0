From: rafael.tinoco at linaro.org (Rafael David Tinoco)
Date: Fri,  9 Nov 2018 09:30:36 -0200
Subject: [PATCH] proc: fix and merge proc-self-map-file tests
In-Reply-To: <20181108111105.GC13195@uranus.lan>
References: <20181108111105.GC13195@uranus.lan>
Message-ID: <20181109113036.21512-1-rafael.tinoco@linaro.org>

Merge proc-self-map-files tests into one since this test should focus in
testing readlink in /proc/self/map_files/* only, and not trying to test
mapping virtual address 0.

Lowest virtual address for user space mapping in other architectures,
like arm, is *at least* *(PAGE_SIZE * 2) and NULL hint does not
guarantee that when MAP_FIXED flag, important to this test, is given.
This patch also fixes this issue in remaining test.

Link: https://bugs.linaro.org/show_bug.cgi?id=3782
Signed-off-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
---
 tools/testing/selftests/proc/.gitignore       |  1 -
 tools/testing/selftests/proc/Makefile         |  1 -
 .../selftests/proc/proc-self-map-files-001.c  |  5 +-
 .../selftests/proc/proc-self-map-files-002.c  | 85 -------------------
 4 files changed, 3 insertions(+), 89 deletions(-)
 delete mode 100644 tools/testing/selftests/proc/proc-self-map-files-002.c

diff --git a/tools/testing/selftests/proc/.gitignore b/tools/testing/selftests/proc/.gitignore
index 82121a81681f..d44ec8755879 100644
--- a/tools/testing/selftests/proc/.gitignore
+++ b/tools/testing/selftests/proc/.gitignore
@@ -3,7 +3,6 @@
 /fd-003-kthread
 /proc-loadavg-001
 /proc-self-map-files-001
-/proc-self-map-files-002
 /proc-self-syscall
 /proc-self-wchan
 /proc-uptime-001
diff --git a/tools/testing/selftests/proc/Makefile b/tools/testing/selftests/proc/Makefile
index 1c12c34cf85d..6c17557c2f9a 100644
--- a/tools/testing/selftests/proc/Makefile
+++ b/tools/testing/selftests/proc/Makefile
@@ -7,7 +7,6 @@ TEST_GEN_PROGS += fd-002-posix-eq
 TEST_GEN_PROGS += fd-003-kthread
 TEST_GEN_PROGS += proc-loadavg-001
 TEST_GEN_PROGS += proc-self-map-files-001
-TEST_GEN_PROGS += proc-self-map-files-002
 TEST_GEN_PROGS += proc-self-syscall
 TEST_GEN_PROGS += proc-self-wchan
 TEST_GEN_PROGS += proc-uptime-001
diff --git a/tools/testing/selftests/proc/proc-self-map-files-001.c b/tools/testing/selftests/proc/proc-self-map-files-001.c
index 4209c64283d6..646d8d3fba3a 100644
--- a/tools/testing/selftests/proc/proc-self-map-files-001.c
+++ b/tools/testing/selftests/proc/proc-self-map-files-001.c
@@ -46,16 +46,17 @@ static void fail(const char *fmt, unsigned long a, unsigned long b)
 
 int main(void)
 {
-	const unsigned int PAGE_SIZE = sysconf(_SC_PAGESIZE);
 	void *p;
 	int fd;
 	unsigned long a, b;
+	const long PAGE_SIZE = sysconf(_SC_PAGESIZE);
 
 	fd = open("/dev/zero", O_RDONLY);
 	if (fd == -1)
 		return 1;
 
-	p = mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_PRIVATE|MAP_FILE, fd, 0);
+	p = mmap((void *) (2 * PAGE_SIZE), PAGE_SIZE, PROT_NONE,
+			MAP_PRIVATE|MAP_FILE, fd, 0);
 	if (p == MAP_FAILED)
 		return 1;
 
diff --git a/tools/testing/selftests/proc/proc-self-map-files-002.c b/tools/testing/selftests/proc/proc-self-map-files-002.c
deleted file mode 100644
index 6f1f4a6e1ecb..000000000000
--- a/tools/testing/selftests/proc/proc-self-map-files-002.c
+++ /dev/null
@@ -1,85 +0,0 @@
-/*
- * Copyright © 2018 Alexey Dobriyan <adobriyan at gmail.com>
- *
- * Permission to use, copy, modify, and distribute this software for any
- * purpose with or without fee is hereby granted, provided that the above
- * copyright notice and this permission notice appear in all copies.
- *
- * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
- * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
- * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
- * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
- * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
- * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
- */
-/* Test readlink /proc/self/map_files/... with address 0. */
-#include <errno.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <stdio.h>
-#include <unistd.h>
-#include <sys/mman.h>
-#include <stdlib.h>
-
-static void pass(const char *fmt, unsigned long a, unsigned long b)
-{
-	char name[64];
-	char buf[64];
-
-	snprintf(name, sizeof(name), fmt, a, b);
-	if (readlink(name, buf, sizeof(buf)) == -1)
-		exit(1);
-}
-
-static void fail(const char *fmt, unsigned long a, unsigned long b)
-{
-	char name[64];
-	char buf[64];
-
-	snprintf(name, sizeof(name), fmt, a, b);
-	if (readlink(name, buf, sizeof(buf)) == -1 && errno == ENOENT)
-		return;
-	exit(1);
-}
-
-int main(void)
-{
-	const unsigned int PAGE_SIZE = sysconf(_SC_PAGESIZE);
-	void *p;
-	int fd;
-	unsigned long a, b;
-
-	fd = open("/dev/zero", O_RDONLY);
-	if (fd == -1)
-		return 1;
-
-	p = mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_PRIVATE|MAP_FILE|MAP_FIXED, fd, 0);
-	if (p == MAP_FAILED) {
-		if (errno == EPERM)
-			return 2;
-		return 1;
-	}
-
-	a = (unsigned long)p;
-	b = (unsigned long)p + PAGE_SIZE;
-
-	pass("/proc/self/map_files/%lx-%lx", a, b);
-	fail("/proc/self/map_files/ %lx-%lx", a, b);
-	fail("/proc/self/map_files/%lx -%lx", a, b);
-	fail("/proc/self/map_files/%lx- %lx", a, b);
-	fail("/proc/self/map_files/%lx-%lx ", a, b);
-	fail("/proc/self/map_files/0%lx-%lx", a, b);
-	fail("/proc/self/map_files/%lx-0%lx", a, b);
-	if (sizeof(long) == 4) {
-		fail("/proc/self/map_files/100000000%lx-%lx", a, b);
-		fail("/proc/self/map_files/%lx-100000000%lx", a, b);
-	} else if (sizeof(long) == 8) {
-		fail("/proc/self/map_files/10000000000000000%lx-%lx", a, b);
-		fail("/proc/self/map_files/%lx-10000000000000000%lx", a, b);
-	} else
-		return 1;
-
-	return 0;
-}
-- 
2.19.1
