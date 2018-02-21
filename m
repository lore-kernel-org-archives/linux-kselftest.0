From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Wed, 21 Feb 2018 13:48:02 +0100
Subject: [PATCH 4.14 071/167] selftests/x86: Do not rely on "int $0x80" in
 single_step_syscall.c
In-Reply-To: <20180221124524.639039577@linuxfoundation.org>
References: <20180221124524.639039577@linuxfoundation.org>
Message-ID: <20180221124528.384481776@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180221124802.4bWb8od64xkVxniI8vgW0RlE_5OHHKcNDKVLmx79a9U@z>

4.14-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Dominik Brodowski <linux@dominikbrodowski.net>

commit 4105c69703cdeba76f384b901712c9397b04e9c2 upstream.

On 64-bit builds, we should not rely on "int $0x80" working (it only does if
CONFIG_IA32_EMULATION=y is enabled). To keep the "Set TF and check int80"
test running on 64-bit installs with CONFIG_IA32_EMULATION=y enabled, build
this test only if we can also build 32-bit binaries (which should be a
good approximation for that).

Signed-off-by: Dominik Brodowski <linux at dominikbrodowski.net>
Cc: Andy Lutomirski <luto at kernel.org>
Cc: Dmitry Safonov <dsafonov at virtuozzo.com>
Cc: Linus Torvalds <torvalds at linux-foundation.org>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: linux-kselftest at vger.kernel.org
Cc: shuah at kernel.org
Link: http://lkml.kernel.org/r/20180211111013.16888-5-linux at dominikbrodowski.net
Signed-off-by: Ingo Molnar <mingo at kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

---
 tools/testing/selftests/x86/Makefile              |    2 ++
 tools/testing/selftests/x86/single_step_syscall.c |    5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -30,11 +30,13 @@ CAN_BUILD_X86_64 := $(shell ./check_cc.s
 ifeq ($(CAN_BUILD_I386),1)
 all: all_32
 TEST_PROGS += $(BINARIES_32)
+EXTRA_CFLAGS += -DCAN_BUILD_32
 endif
 
 ifeq ($(CAN_BUILD_X86_64),1)
 all: all_64
 TEST_PROGS += $(BINARIES_64)
+EXTRA_CFLAGS += -DCAN_BUILD_64
 endif
 
 all_32: $(BINARIES_32)
--- a/tools/testing/selftests/x86/single_step_syscall.c
+++ b/tools/testing/selftests/x86/single_step_syscall.c
@@ -119,7 +119,9 @@ static void check_result(void)
 
 int main()
 {
+#ifdef CAN_BUILD_32
 	int tmp;
+#endif
 
 	sethandler(SIGTRAP, sigtrap, 0);
 
@@ -139,12 +141,13 @@ int main()
 		      : : "c" (post_nop) : "r11");
 	check_result();
 #endif
-
+#ifdef CAN_BUILD_32
 	printf("[RUN]\tSet TF and check int80\n");
 	set_eflags(get_eflags() | X86_EFLAGS_TF);
 	asm volatile ("int $0x80" : "=a" (tmp) : "a" (SYS_getpid)
 			: INT80_CLOBBERS);
 	check_result();
+#endif
 
 	/*
 	 * This test is particularly interesting if fast syscalls use


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
