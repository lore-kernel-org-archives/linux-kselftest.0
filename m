From: mpe@ellerman.id.au (Michael Ellerman)
Date: Fri, 23 Mar 2018 20:44:27 +1100
Subject: [PATCH] selftests: Print the test we're running to /dev/kmsg
Message-ID: <20180323094427.21938-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180323094427.P9Z0JppxgxRM9rtdBHWk6qk4enP-mTVsA-xdPeRFUJw@z>

Some tests cause the kernel to print things to the kernel log
buffer (ie. printk), in particular oops and warnings etc. However when
running all the tests in succession it's not always obvious which
test(s) caused the kernel to print something.

We can narrow it down by printing which test directory we're running
in to /dev/kmsg, if it's writable.

Example output:

  [  170.149149] kselftest: Running tests in powerpc
  [  305.300132] kworker/dying (71) used greatest stack depth: 7776 bytes left
  [  808.915456] kselftest: Running tests in pstore

Signed-off-by: Michael Ellerman <mpe at ellerman.id.au>
---
 tools/testing/selftests/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 7442dfb73b7f..0fbe778efd5f 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -130,6 +130,7 @@ ifdef INSTALL_PATH
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
 		echo "echo ; echo Running tests in $$TARGET" >> $(ALL_SCRIPT); \
 		echo "echo ========================================" >> $(ALL_SCRIPT); \
+		echo "[ -w /dev/kmsg ] && echo \"kselftest: Running tests in $$TARGET\" >> /dev/kmsg" >> $(ALL_SCRIPT); \
 		echo "cd $$TARGET" >> $(ALL_SCRIPT); \
 		make -s --no-print-directory OUTPUT=$$BUILD_TARGET -C $$TARGET emit_tests >> $(ALL_SCRIPT); \
 		echo "cd \$$ROOT" >> $(ALL_SCRIPT); \
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
