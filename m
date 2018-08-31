From: igor.stoppa at gmail.com (Igor Stoppa)
Date: Sat,  1 Sep 2018 00:24:08 +0300
Subject: [PATCH] selftest: vm: add unlikely() to BUG_ON()
Message-ID: <20180831212408.20071-1-igor.stoppa@huawei.com>

BUG_ON() is unlikely() to BUG()

For unlikely(), borrow the definition from tools/include/linux/compiler.h

Signed-off-by: Igor Stoppa <igor.stoppa at huawei.com>
Cc: Dmitry Safonov <dima at arista.com>
Cc: Shuah Khan <shuah at kernel.org>
Cc: linux-kselftest at vger.kernel.org
Cc: linux-kernel at vger.kernel.org
---
 tools/testing/selftests/vm/map_populate.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vm/map_populate.c b/tools/testing/selftests/vm/map_populate.c
index 6b8aeaa0bf7a..1bf8ff068dcd 100644
--- a/tools/testing/selftests/vm/map_populate.c
+++ b/tools/testing/selftests/vm/map_populate.c
@@ -21,9 +21,13 @@
 #define MMAP_SZ		4096
 #endif
 
+#ifndef unlikely
+# define unlikely(x)		__builtin_expect(!!(x), 0)
+#endif
+
 #define BUG_ON(condition, description)					\
 	do {								\
-		if (condition) {					\
+		if (unlikely(condition)) {				\
 			fprintf(stderr, "[FAIL]\t%s:%d\t%s:%s\n", __func__, \
 				__LINE__, (description), strerror(errno)); \
 			exit(1);					\
-- 
2.17.1
