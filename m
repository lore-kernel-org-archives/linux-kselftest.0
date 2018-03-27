From: changbin.du@intel.com (changbin.du@intel.com)
Date: Tue, 27 Mar 2018 11:11:33 +0800
Subject: [PATCH v2 3/4] kselftest: install sanitized kernel headers before
 compiling
In-Reply-To: <1522120294-24926-1-git-send-email-changbin.du@intel.com>
References: <1522120294-24926-1-git-send-email-changbin.du@intel.com>
Message-ID: <1522120294-24926-4-git-send-email-changbin.du@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180327031133.NXnzvPZFcrf_bFi4f2phVM4SCS8zxJGkzHasaZDKLew@z>

From: Changbin Du <changbin.du@intel.com>

There are test cases that require kernel headers. Some of this
cases has put the dependency check into individual Makefiles,
but some not. Let's sync the kernel headers at top level
Makefile to avoid compiling errors like below.

make[1]: Entering directory '/home/changbin/work/linux/tools/testing/selftests/membarrier'
gcc -g -I../../../../usr/include/    membarrier_test.c  -o /home/changbin/work/linux/tools/testing/selftests/membarrier//membarrier_test
membarrier_test.c: In function ‘test_membarrier_global_success’:
membarrier_test.c:64:12: error: ‘MEMBARRIER_CMD_GLOBAL’ undeclared (first use in this function)
  int cmd = MEMBARRIER_CMD_GLOBAL, flags = 0;
            ^
membarrier_test.c:64:12: note: each undeclared identifier is reported only once for each function it appears in
membarrier_test.c: In function ‘test_membarrier_private_expedited_fail’:
membarrier_test.c:80:12: error: ‘MEMBARRIER_CMD_PRIVATE_EXPEDITED’ undeclared (first use in this function)
  int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED, flags = 0;
            ^
membarrier_test.c: In function ‘test_membarrier_register_private_expedited_success’:
membarrier_test.c:103:12: error: ‘MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED’ undeclared (first use in this function)
  int cmd = MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED, flags = 0;
            ^
membarrier_test.c: In function ‘test_membarrier_private_expedited_success’:
membarrier_test.c:120:12: error: ‘MEMBARRIER_CMD_PRIVATE_EXPEDITED’ undeclared (first use in this function)
  int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED, flags = 0;
            ^
membarrier_test.c: In function ‘test_membarrier_private_expedited_sync_core_fail’:
membarrier_test.c:137:12: error: ‘MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE’ undeclared (first use in this function)
  int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE, flags = 0;
            ^
membarrier_test.c: In function ‘test_membarrier_register_private_expedited_sync_core_success’:
membarrier_test.c:160:12: error: ‘MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE’ undeclared (first use in this function)
  int cmd = MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE, flags = 0;
            ^
membarrier_test.c: In function ‘test_membarrier_private_expedited_sync_core_success’:
membarrier_test.c:177:12: error: ‘MEMBARRIER_CMD_PRIVATE_EXPEDITED’ undeclared (first use in this function)
  int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED, flags = 0;
            ^
membarrier_test.c: In function ‘test_membarrier_register_global_expedited_success’:
membarrier_test.c:194:12: error: ‘MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED’ undeclared (first use in this function)
  int cmd = MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED, flags = 0;
            ^
membarrier_test.c: In function ‘test_membarrier_global_expedited_success’:
membarrier_test.c:211:12: error: ‘MEMBARRIER_CMD_GLOBAL_EXPEDITED’ undeclared (first use in this function)
  int cmd = MEMBARRIER_CMD_GLOBAL_EXPEDITED, flags = 0;
            ^
membarrier_test.c: In function ‘test_membarrier’:
membarrier_test.c:253:15: error: ‘MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE’ undeclared (first use in this function)
  if (status & MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE) {
               ^
membarrier_test.c: In function ‘test_membarrier_query’:
membarrier_test.c:296:14: error: ‘MEMBARRIER_CMD_GLOBAL’ undeclared (first use in this function)
  if (!(ret & MEMBARRIER_CMD_GLOBAL)) {
              ^
../lib.mk:109: recipe for target '/home/changbin/work/linux/tools/testing/selftests/membarrier//membarrier_test' failed
make[1]: *** [/home/changbin/work/linux/tools/testing/selftests/membarrier//membarrier_test] Error 1
make[1]: Leaving directory '/home/changbin/work/linux/tools/testing/selftests/membarrier'

Signed-off-by: Changbin Du <changbin.du at intel.com>
---
 tools/testing/selftests/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 7916aa2..656b674 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -67,13 +67,16 @@ ifndef BUILD
 endif
 
 export BUILD
-all:
+all: headers_install
 	@for TARGET in $(TARGETS); do		\
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
 		mkdir $$BUILD_TARGET  -p;	\
 		make OUTPUT=$$BUILD_TARGET/ -C $$TARGET;\
 	done;
 
+headers_install:
+	make -C ../../../ headers_install
+
 run_tests: all
 	@for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
