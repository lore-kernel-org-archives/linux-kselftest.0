From: linux at dominikbrodowski.net (Dominik Brodowski)
Date: Sun, 11 Feb 2018 12:10:12 +0100
Subject: [Linux-kselftest-mirror] [PATCH 4/5] selftests/x86: do not rely on
	int $0x80 in single_step_syscall.c
In-Reply-To: <20180211111013.16888-1-linux@dominikbrodowski.net>
References: <20180211111013.16888-1-linux@dominikbrodowski.net>
Message-ID: <20180211111013.16888-5-linux@dominikbrodowski.net>

On 64bit builds, we should not rely on int $0x80 working (it only does if
CONFIG_IA32_EMULATION is enabled). To keep the "Set TF and check int80"
test running on 64bit installs with CONFIG_IA32_EMULATION enabled, build
this test only if we can also build 32bit binaries (which should be a
good approximation for that).

CC: Dmitry Safonov <dsafonov at virtuozzo.com>
CC: Andy Lutomirski <luto at kernel.org>
Signed-off-by: Dominik Brodowski <linux at dominikbrodowski.net>
---
 tools/testing/selftests/x86/Makefile              | 2 ++
 tools/testing/selftests/x86/single_step_syscall.c | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index ce2615a2d105..371ae715c506 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -40,12 +40,14 @@ endef
 ifeq ($(CAN_BUILD_I386),1)
 all: all_32
 TEST_PROGS += $(BINARIES_32)
+EXTRA_CFLAGS += -DCAN_BUILD_32
 $(foreach t,$(TARGETS_C_32BIT_ALL),$(eval $(call gen-target-rule-32,$(t))))
 endif
 
 ifeq ($(CAN_BUILD_X86_64),1)
 all: all_64
 TEST_PROGS += $(BINARIES_64)
+EXTRA_CFLAGS += -DCAN_BUILD_64
 $(foreach t,$(TARGETS_C_64BIT_ALL),$(eval $(call gen-target-rule-64,$(t))))
 endif
 
diff --git a/tools/testing/selftests/x86/single_step_syscall.c b/tools/testing/selftests/x86/single_step_syscall.c
index a48da95c18fd..ddfdd635de16 100644
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
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
