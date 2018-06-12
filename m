From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Tue, 12 Jun 2018 17:23:48 -0600
Subject: [PATCH] selftests: sparc64: Fix to do nothing on non-sparc64
Message-ID: <20180612232348.27979-1-shuah@kernel.org>

sparc64 test fails with the following errors on non-sparc64 systems. Fix
the Makefile to do nothing on non-sparc64 systems to suppress the errors:

make run_tests
adi-test.c: Assembler messages:
adi-test.c:302: Error: no such instruction: `rd %tick,%r13'
adi-test.c:304: Error: no such instruction: `rd %tick,%rbp'
adi-test.c:190: Error: no such instruction: `rd %tick,%rbp'
adi-test.c:192: Error: no such instruction: `rd %tick,%rdx'
adi-test.c:273: Error: no such instruction: `rd %tick,%rbx'
adi-test.c:276: Error: no such instruction: `rd %tick,%rdx'
adi-test.c:217: Error: no such instruction: `rd %tick,%rbp'
adi-test.c:220: Error: no such instruction: `rd %tick,%rdx'
adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
adi-test.c:246: Error: no such instruction: `rd %tick,%rbp'
adi-test.c:248: Error: no such instruction: `rd %tick,%rdx'
adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
adi-test.c:79: Error: no such instruction: `rd %tick,%rax'
<builtin>: recipe for target 'adi-test' failed
make[1]: *** [adi-test] Error 1
adi: [FAIL]
./drivers_test.sh: 24: ./drivers_test.sh: ./adi-test: not found
../lib.mk:73: recipe for target 'run_tests' failed
make: *** [run_tests] Error 1

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/sparc64/Makefile | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/sparc64/Makefile b/tools/testing/selftests/sparc64/Makefile
index 2082eeffd779..442f0ca45441 100644
--- a/tools/testing/selftests/sparc64/Makefile
+++ b/tools/testing/selftests/sparc64/Makefile
@@ -1,7 +1,17 @@
+uname_M := $(shell uname -m 2>/dev/null || echo not)
+ARCH ?= $(shell echo $(uname_M) | sed -e s/x86_64/x86/)
+
+ifneq ($(ARCH),sparc64)
+nothing:
+.PHONY: all clean run_tests install
+.SILENT:
+else
+
 SUBDIRS := drivers
 
 TEST_PROGS := run.sh
 
+
 .PHONY: all clean
 
 include ../lib.mk
@@ -44,3 +54,4 @@ override define CLEAN
 		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;\
 	done
 endef
+endif
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
