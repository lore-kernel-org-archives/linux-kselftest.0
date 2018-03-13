From: anders.roxell at linaro.org (Anders Roxell)
Date: Tue, 13 Mar 2018 12:42:04 +0100
Subject: [PATCH 1/2] selftests/memfd/memfd_test.c: fix implicit declaration
Message-ID: <20180313114205.27714-1-anders.roxell@linaro.org>

gcc warns about implicit declaration.

gcc -D_FILE_OFFSET_BITS=64 -I../../../../include/uapi/
    -I../../../../include/ -I../../../../usr/include/
    memfd_test.c common.o  -o memfd_test
memfd_test.c: In function ‘mfd_assert_get_seals’:
memfd_test.c:74:6: warning: implicit declaration of function ‘fcntl’
    [-Wimplicit-function-declaration]
  r = fcntl(fd, F_GET_SEALS);
      ^~~~~
memfd_test.c: In function ‘mfd_assert_open’:
memfd_test.c:197:6: warning: implicit declaration of function ‘open’
    [-Wimplicit-function-declaration]
  r = open(buf, flags, mode);
      ^~~~
memfd_test.c: In function ‘mfd_assert_write’:
memfd_test.c:328:6: warning: implicit declaration of function ‘fallocate’
    [-Wimplicit-function-declaration]
  r = fallocate(fd,
      ^~~~~~~~~

In the current code, we include the headers that the functions want
according to the man pages, and we add some defines that will be used if
they isn't found in glibc.  The defines was added into the kernel source
in kernel >= 3.16 and glibc requires kernel header files >= 3.2.

Fixes: 4f5ce5e8d7e2 ("selftests: add memfd_create() + sealing tests")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/memfd/memfd_test.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
index 10baa1652fc2..0dbeb29c094c 100644
--- a/tools/testing/selftests/memfd/memfd_test.c
+++ b/tools/testing/selftests/memfd/memfd_test.c
@@ -6,7 +6,6 @@
 #include <inttypes.h>
 #include <limits.h>
 #include <linux/falloc.h>
-#include <linux/fcntl.h>
 #include <linux/memfd.h>
 #include <sched.h>
 #include <stdio.h>
@@ -14,13 +13,37 @@
 #include <signal.h>
 #include <string.h>
 #include <sys/mman.h>
+#include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/syscall.h>
 #include <sys/wait.h>
+#include <fcntl.h>
 #include <unistd.h>
 
 #include "common.h"
 
+#ifndef F_LINUX_SPECIFIC_BASE
+#    define F_LINUX_SPECIFIC_BASE      1024
+#endif
+#ifndef F_ADD_SEALS
+#    define F_ADD_SEALS        (F_LINUX_SPECIFIC_BASE + 9)
+#endif
+#ifndef F_GET_SEALS
+#    define F_GET_SEALS        (F_LINUX_SPECIFIC_BASE + 10)
+#endif
+#ifndef F_SEAL_SEAL
+#    define F_SEAL_SEAL        0x0001 /* prevent further seals from being set */
+#endif
+#ifndef F_SEAL_SHRINK
+#    define F_SEAL_SHRINK      0x0002 /* prevent file from shrinking */
+#endif
+#ifndef F_SEAL_GROW
+#    define F_SEAL_GROW        0x0004 /* prevent file from growing */
+#endif
+#ifndef F_SEAL_WRITE
+#    define F_SEAL_WRITE       0x0008 /* prevent writes */
+#endif
+
 #define MEMFD_STR	"memfd:"
 #define MEMFD_HUGE_STR	"memfd-hugetlb:"
 #define SHARED_FT_STR	"(shared file-table)"
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
