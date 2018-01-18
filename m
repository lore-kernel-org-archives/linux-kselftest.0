From: dima at arista.com (Dmitry Safonov)
Date: Thu, 18 Jan 2018 22:19:43 +0000
Subject: [Linux-kselftest-mirror] [PATCH] selftests/x86: Add <test_name>{,
	_32, _64} targets
Message-ID: <20180118221943.23558-1-dima@arista.com>

One can only use `make all` or `make <test_name>_<bitness>`
as make targets.
`make <test_name>` doesn't work as Ingo noticed:
  x86> make test_vsyscall
  gcc -O2 -g -std=gnu99 -pthread -Wall -no-pie test_vsyscall.c -o test_vsyscall
  /tmp/aBaoo3nb.o: In function `init_vdso':
  test_vsyscall.c:68: undefined reference to `dlopen'
  test_vsyscall.c:76: undefined reference to `dlsym'
  test_vsyscall.c:80: undefined reference to `dlsym'
  test_vsyscall.c:84: undefined reference to `dlsym'
  test_vsyscall.c:88: undefined reference to `dlsym'
  test_vsyscall.c:70: undefined reference to `dlopen'
  collect2: error: ld returned 1 exit status
  <builtin>: recipe for target 'test_vsyscall' failed
  make: *** [test_vsyscall] Error 1

Makefile target substitution neither works :-/

Generate .PHONY targets per-test and fix target substitution.

Cc: Andy Lutomirski <luto at kernel.org>
Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Cc: Shuah Khan <shuah at kernel.org>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: linux-kselftest at vger.kernel.org
Cc: x86 at kernel.org
Reported-by: Ingo Molnar <mingo at kernel.org>
Signed-off-by: Dmitry Safonov <dima at arista.com>
---
 tools/testing/selftests/x86/Makefile | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 5d4f10ac2af2..5958654e00c6 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -27,14 +27,28 @@ UNAME_M := $(shell uname -m)
 CAN_BUILD_I386 := $(shell ./check_cc.sh $(CC) trivial_32bit_program.c -m32)
 CAN_BUILD_X86_64 := $(shell ./check_cc.sh $(CC) trivial_64bit_program.c)
 
+define gen-target-rule-32
+$(1): $(OUTPUT)/$(1)_32
+$(1)_32: $(OUTPUT)/$(1)_32
+.PHONY: $(1) $(1)_32
+endef
+
+define gen-target-rule-64
+$(1): $(OUTPUT)/$(1)_64
+$(1)_64: $(OUTPUT)/$(1)_64
+.PHONY: $(1) $(1)_64
+endef
+
 ifeq ($(CAN_BUILD_I386),1)
 all: all_32
 TEST_PROGS += $(BINARIES_32)
+$(foreach t,$(TARGETS_C_32BIT_ALL),$(eval $(call gen-target-rule-32,$(t))))
 endif
 
 ifeq ($(CAN_BUILD_X86_64),1)
 all: all_64
 TEST_PROGS += $(BINARIES_64)
+$(foreach t,$(TARGETS_C_64BIT_ALL),$(eval $(call gen-target-rule-64,$(t))))
 endif
 
 all_32: $(BINARIES_32)
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
