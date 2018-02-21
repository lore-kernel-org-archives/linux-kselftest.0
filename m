From: gregkh at linuxfoundation.org (Greg Kroah-Hartman)
Date: Wed, 21 Feb 2018 13:48:20 +0100
Subject: [PATCH 4.15 071/163] selftests/x86: Fix build bug caused by the 5lvl
 test which has been moved to the VM directory
In-Reply-To: <20180221124529.931834518@linuxfoundation.org>
References: <20180221124529.931834518@linuxfoundation.org>
Message-ID: <20180221124534.416192368@linuxfoundation.org>

4.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Dominik Brodowski <linux at dominikbrodowski.net>

commit 7f95122067ab26fb8344b2a9de64ffbd0fea0010 upstream.

Signed-off-by: Dominik Brodowski <linux at dominikbrodowski.net>
Cc: Linus Torvalds <torvalds at linux-foundation.org>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: linux-kselftest at vger.kernel.org
Cc: shuah at kernel.org
Fixes: 235266b8e11c "selftests/vm: move 128TB mmap boundary test to generic directory"
Link: http://lkml.kernel.org/r/20180211111013.16888-2-linux at dominikbrodowski.net
Signed-off-by: Ingo Molnar <mingo at kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

---
 tools/testing/selftests/x86/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -11,7 +11,7 @@ TARGETS_C_BOTHBITS := single_step_syscal
 TARGETS_C_32BIT_ONLY := entry_from_vm86 syscall_arg_fault test_syscall_vdso unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
 			vdso_restorer
-TARGETS_C_64BIT_ONLY := fsgsbase sysret_rip 5lvl
+TARGETS_C_64BIT_ONLY := fsgsbase sysret_rip
 
 TARGETS_C_32BIT_ALL := $(TARGETS_C_BOTHBITS) $(TARGETS_C_32BIT_ONLY)
 TARGETS_C_64BIT_ALL := $(TARGETS_C_BOTHBITS) $(TARGETS_C_64BIT_ONLY)


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
